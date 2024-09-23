@implementation NSSortDescriptor

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending
{
  return (NSSortDescriptor *)objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:", key, ascending, sel_compare_);
}

- (void)allowEvaluation
{
  self->_sortDescriptorFlags &= ~4uLL;
}

- (NSComparator)comparator
{
  if ((self->_sortDescriptorFlags & 2) != 0)
    return self->_selectorOrBlock;
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSortDescriptor;
  -[NSSortDescriptor dealloc](&v3, sel_dealloc);
}

- (NSSortDescriptor)initWithCoder:(NSCoder *)coder
{
  id v5;
  _BOOL8 v6;
  _BOOL4 v7;
  id v8;
  _BOOL4 v9;
  NSSortDescriptor *v10;
  NSSortDescriptor *v11;
  const __CFString *v12;
  BOOL v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v5 = -[NSCoder decodeObject](coder, "decodeObject");
    -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "c", &v14);
    v8 = -[NSCoder decodeObject](coder, "decodeObject");
    v7 = 0;
    v9 = 0;
    v6 = v14;
    goto LABEL_8;
  }
  v5 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSKey"));
  if (v5)
  {
    if ((_NSIsNSString() & 1) != 0)
      goto LABEL_4;
LABEL_15:

    v12 = CFSTR("Sort descriptor key is not a string");
LABEL_18:
    -[NSCoder failWithError:](coder, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v12));
    return 0;
  }
  if (-[NSCoder error](coder, "error"))
    goto LABEL_15;
LABEL_4:
  v6 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("NSAscending"));
  v14 = v6;
  v7 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("NSReverseNullOrder"));
  v8 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSSelector"));
  if (!v8)
  {
    if (!-[NSCoder error](coder, "error"))
      goto LABEL_6;
    goto LABEL_17;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
LABEL_17:

    v12 = CFSTR("Sort descriptor selector name is not a string");
    goto LABEL_18;
  }
LABEL_6:
  v9 = -[NSCoder requiresSecureCoding](coder, "requiresSecureCoding");
LABEL_8:
  v10 = -[NSSortDescriptor initWithKey:ascending:](self, "initWithKey:ascending:", v5, v6);
  v11 = v10;
  if (v8)
    -[NSSortDescriptor _setSelectorName:](v10, "_setSelectorName:", v8);
  if (v9)
    -[NSSortDescriptor _disallowEvaluation](v11, "_disallowEvaluation");
  if (v7)
    -[NSSortDescriptor setReverseNullOrder:](v11, "setReverseNullOrder:", 1);
  return v11;
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector
{
  return (NSSortDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKey:ascending:selector:", key, ascending, selector);
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending selector:(SEL)selector
{
  return -[NSSortDescriptor initWithKey:ascending:reverseNullOrder:selector:](self, "initWithKey:ascending:reverseNullOrder:selector:", key, ascending, 0, selector);
}

- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5 selector:(SEL)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  NSSortDescriptor *v10;
  uint64_t v11;
  uint64_t v12;
  SEL v13;
  objc_super v15;
  uint64_t v16;

  v7 = a5;
  v8 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSSortDescriptor;
  v10 = -[NSSortDescriptor init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(a3, "length");
    if (v11)
      v11 = objc_msgSend(a3, "copy");
    v12 = 8;
    if (!v7)
      v12 = 0;
    v10->_sortDescriptorFlags |= v12 | v8;
    v10->_key = (NSString *)v11;
    v13 = sel_compare_;
    if (a6)
      v13 = a6;
    v10->_selector = v13;
    v10->_selectorOrBlock = 0;
  }
  return v10;
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending
{
  return -[NSSortDescriptor initWithKey:ascending:selector:](self, "initWithKey:ascending:selector:", key, ascending, sel_compare_);
}

- (void)_setSelectorName:(id)a3
{
  id selectorOrBlock;
  void *v6;

  if ((self->_sortDescriptorFlags & 2) == 0)
  {
    selectorOrBlock = self->_selectorOrBlock;
    if (selectorOrBlock != a3)
    {

      v6 = (void *)objc_msgSend(a3, "copy");
      self->_selector = 0;
      self->_selectorOrBlock = v6;
    }
  }
}

- (void)_disallowEvaluation
{
  self->_sortDescriptorFlags |= 4uLL;
}

- (NSString)key
{
  return self->_key;
}

- (NSComparisonResult)compareObject:(id)object1 toObject:(id)object2
{
  const char *v7;
  id v8;
  objc_class *v9;
  id selectorOrBlock;

  if ((self->_sortDescriptorFlags & 4) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Sort descriptor was decoded from a secure archive and local evaluation is not enabled."), 0));
  v7 = -[NSSortDescriptor selector](self, "selector");
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (self->_key)
  {
    object1 = (id)objc_msgSend(object1, "valueForKeyPath:");
    if (self->_key)
      object2 = (id)objc_msgSend(object2, "valueForKeyPath:");
  }
  if (object1 == v8)
    object1 = 0;
  if (object1)
  {
    if ((self->_sortDescriptorFlags & 2) != 0)
    {
      v7 = 0;
      selectorOrBlock = self->_selectorOrBlock;
    }
    else
    {
      v9 = (objc_class *)objc_opt_class();
      selectorOrBlock = class_getMethodImplementation(v9, v7);
    }
  }
  else
  {
    v7 = sel_compare_;
    selectorOrBlock = _NSNullCompare;
  }
  if (object2 == v8)
    object2 = 0;
  return _NSCompareObject((uint64_t)object1, (uint64_t)object2, (uint64_t)selectorOrBlock, (uint64_t)v7, -[NSSortDescriptor ascending](self, "ascending"), -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder"));
}

- (BOOL)ascending
{
  return self->_sortDescriptorFlags & 1;
}

- (BOOL)reverseNullOrder
{
  return (LOBYTE(self->_sortDescriptorFlags) >> 3) & 1;
}

- (SEL)selector
{
  SEL result;

  if ((self->_sortDescriptorFlags & 2) != 0)
    return 0;
  result = self->_selector;
  if (!result)
  {
    result = (SEL)self->_selectorOrBlock;
    if (result)
    {
      result = NSSelectorFromString((NSString *)result);
      self->_selector = result;
    }
  }
  return result;
}

+ (NSSortDescriptor)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr
{
  return (NSSortDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKey:ascending:comparator:", key, ascending, cmptr);
}

- (NSSortDescriptor)initWithKey:(NSString *)key ascending:(BOOL)ascending comparator:(NSComparator)cmptr
{
  _BOOL4 v6;
  NSSortDescriptor *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;

  v6 = ascending;
  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSSortDescriptor;
  v8 = -[NSSortDescriptor init](&v11, sel_init);
  if (v8)
  {
    v9 = -[NSString length](key, "length");
    if (v9)
      v9 = -[NSString copy](key, "copy");
    v8->_sortDescriptorFlags |= v6 | 2;
    v8->_key = (NSString *)v9;
    v8->_selector = 0;
    v8->_selectorOrBlock = (id)objc_msgSend(cmptr, "copy");
  }
  return v8;
}

- (id)description
{
  unint64_t sortDescriptorFlags;
  NSString *key;
  const __CFString *v5;
  _BOOL4 v6;
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;

  sortDescriptorFlags = self->_sortDescriptorFlags;
  if (self->_key)
    key = self->_key;
  else
    key = (NSString *)&stru_1E0F56070;
  if (-[NSSortDescriptor ascending](self, "ascending"))
    v5 = CFSTR("ascending");
  else
    v5 = CFSTR("descending");
  v6 = -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder");
  if ((sortDescriptorFlags & 2) != 0)
  {
    if (v6)
    {
      v8 = -[NSSortDescriptor ascending](self, "ascending");
      v9 = CFSTR("NULLS FIRST");
      if (v8)
        v9 = CFSTR("NULLS LAST");
    }
    else
    {
      v9 = CFSTR("NO");
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@, %@, %@, BLOCK(%p))"), key, v5, v9, self->_selectorOrBlock);
  }
  else
  {
    if (v6)
    {
      if (-[NSSortDescriptor ascending](self, "ascending"))
        v7 = CFSTR("NULLS LAST");
      else
        v7 = CFSTR("NULLS FIRST");
    }
    else
    {
      v7 = CFSTR("NO");
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@, %@, %@, %@)"), key, v5, v7, -[NSSortDescriptor _selectorName](self, "_selectorName"));
  }
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  int v8;
  NSString *key;
  NSObject *v10;
  BOOL v11;
  uint8_t buf[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((self->_sortDescriptorFlags & 2) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSSortDescriptor using Blocks cannot be encoded."), 0));
  v5 = -[NSSortDescriptor ascending](self, "ascending");
  v11 = v5;
  v6 = -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder");
  v7 = -[NSSortDescriptor _selectorName](self, "_selectorName");
  v8 = objc_msgSend(a3, "allowsKeyedCoding");
  key = self->_key;
  if (v8)
  {
    if (key)
      objc_msgSend(a3, "encodeObject:forKey:", key, CFSTR("NSKey"));
    objc_msgSend(a3, "encodeBool:forKey:", v5, CFSTR("NSAscending"));
    if (v7)
      objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NSSelector"));
    objc_msgSend(a3, "encodeBool:forKey:", v6, CFSTR("NSReverseNullOrder"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", key);
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "c", &v11);
    if (v6)
    {
      v10 = _NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "NSCoding is deprecated, and does not support NSSortDescriptor's reverseNullOrder property.  Please use keyed archiving instead.", buf, 2u);
      }
    }
    objc_msgSend(a3, "encodeObject:", v7);
  }
}

- (id)_selectorName
{
  if ((self->_sortDescriptorFlags & 2) != 0)
    return 0;
  if (self->_selector)
    return NSStringFromSelector(self->_selector);
  return self->_selectorOrBlock;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if (NSSortDescriptor == a1)
    _NSInternalCompareObject = (uint64_t)class_getMethodImplementation((Class)a1, sel_compareObject_toObject_);
}

- (id)reversedSortDescriptor
{
  unint64_t sortDescriptorFlags;
  void *v4;
  NSString *v5;
  uint64_t v6;

  sortDescriptorFlags = self->_sortDescriptorFlags;
  v4 = (void *)objc_opt_class();
  v5 = -[NSSortDescriptor key](self, "key");
  v6 = -[NSSortDescriptor ascending](self, "ascending") ^ 1;
  if ((sortDescriptorFlags & 2) != 0)
    return (id)objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", v5, v6, -[NSSortDescriptor comparator](self, "comparator"));
  else
    return (id)objc_msgSend(v4, "sortDescriptorWithKey:ascending:selector:", v5, v6, -[NSSortDescriptor selector](self, "selector"));
}

+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3
{
  return (NSSortDescriptor *)objc_msgSend(a1, "sortDescriptorWithKey:ascending:", a3, 1);
}

+ (NSSortDescriptor)sortDescriptorWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5
{
  return (NSSortDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKey:ascending:reverseNullOrder:", a3, a4, a5);
}

+ (id)_defaultSelectorName
{
  return CFSTR("compare:");
}

- (NSSortDescriptor)initWithKey:(id)a3
{
  return -[NSSortDescriptor initWithKey:ascending:](self, "initWithKey:ascending:", a3, 1);
}

- (NSSortDescriptor)initWithKey:(id)a3 ascending:(BOOL)a4 reverseNullOrder:(BOOL)a5
{
  return -[NSSortDescriptor initWithKey:ascending:reverseNullOrder:selector:](self, "initWithKey:ascending:reverseNullOrder:selector:", a3, a4, a5, 0);
}

- (void)_setKey:(id)a3
{
  NSString *key;

  key = self->_key;
  if (key != a3)
  {

    self->_key = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)_setAscending:(BOOL)a3
{
  self->_sortDescriptorFlags |= a3;
}

- (void)setReverseNullOrder:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_sortDescriptorFlags |= v3;
}

- (BOOL)_isEqualToSortDescriptor:(id)a3
{
  int v5;
  int v6;
  BOOL v7;
  char v8;
  NSString *v10;

  v5 = -[NSSortDescriptor ascending](self, "ascending");
  if (v5 == objc_msgSend(a3, "ascending")
    && (v6 = -[NSSortDescriptor reverseNullOrder](self, "reverseNullOrder"),
        v6 == objc_msgSend(a3, "reverseNullOrder")))
  {
    v10 = -[NSSortDescriptor key](self, "key");
    v7 = v10 == (NSString *)objc_msgSend(a3, "key")
      || -[NSString isEqualToString:](-[NSSortDescriptor key](self, "key"), "isEqualToString:", objc_msgSend(a3, "key"));
  }
  else
  {
    v7 = 0;
  }
  if ((self->_sortDescriptorFlags & 2) != 0)
    v8 = self->_selectorOrBlock == (id)*((_QWORD *)a3 + 4);
  else
    v8 = objc_msgSend(-[NSSortDescriptor _selectorName](self, "_selectorName"), "isEqualToString:", objc_msgSend(a3, "_selectorName"));
  return v7 & v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
    return -[NSSortDescriptor _isEqualToSortDescriptor:](self, "_isEqualToSortDescriptor:", a3);
  return 0;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isByref"))
  {
    v6.receiver = self;
    v6.super_class = (Class)NSSortDescriptor;
    return -[NSSortDescriptor replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return self;
}

@end
