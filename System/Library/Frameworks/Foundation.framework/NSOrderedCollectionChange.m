@implementation NSOrderedCollectionChange

- (id)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSCollectionChangeType)changeType
{
  return self->_changeType;
}

- (NSUInteger)index
{
  return self->_index;
}

- (NSUInteger)associatedIndex
{
  return self->_associatedIndex;
}

+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index
{
  return (NSOrderedCollectionChange *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:type:index:", anObject, type, index);
}

+ (NSOrderedCollectionChange)changeWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex
{
  return (NSOrderedCollectionChange *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:type:index:associatedIndex:", anObject, type, index, associatedIndex);
}

- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index associatedIndex:(NSUInteger)associatedIndex
{
  NSOrderedCollectionChange *v10;
  NSOrderedCollectionChange *v11;
  void *v13;
  uint64_t v14;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSOrderedCollectionChange;
  v10 = -[NSOrderedCollectionChange init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    if ((unint64_t)type >= 2)
    {

      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      v16 = CFSTR("type");
      v17[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", type);
      objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, CFSTR("Invalid type for change"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)));
    }
    v10->_object = anObject;
    v11->_changeType = type;
    v11->_index = index;
    v11->_associatedIndex = associatedIndex;
  }
  return v11;
}

- (NSOrderedCollectionChange)initWithObject:(id)anObject type:(NSCollectionChangeType)type index:(NSUInteger)index
{
  return -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:](self, "initWithObject:type:index:associatedIndex:", anObject, type, index, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSOrderedCollectionChange;
  -[NSOrderedCollectionChange dealloc](&v3, sel_dealloc);
}

- (id)init
{
  id v3;
  uint64_t v4;
  const char *Name;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  Name = sel_getName(a2);
  v6 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unavailable method %s called on class %@"), Name, objc_opt_class()), 0);
  objc_exception_throw(v6);
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  int64_t changeType;
  objc_class *v6;
  NSString *v7;
  unint64_t index;
  NSString *v9;
  const __CFString *v10;

  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  changeType = self->_changeType;
  if (self->_object)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("of object <%@: %p> "), NSStringFromClass(v6), self->_object);
  }
  else
  {
    v7 = (NSString *)&stru_1E0F56070;
  }
  index = self->_index;
  if (self->_associatedIndex == 0x7FFFFFFFFFFFFFFFLL)
    v9 = (NSString *)&stru_1E0F56070;
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" associated with index %lu"), self->_associatedIndex);
  v10 = CFSTR("insertion");
  if (changeType == 1)
    v10 = CFSTR("removal");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>(%@ %@at index %lu%@)"), v4, self, v10, v7, index, v9);
}

- (unint64_t)hash
{
  return self->_index ^ (self->_associatedIndex << 8) ^ (self->_changeType << 31);
}

- (BOOL)isEqual:(id)a3
{
  id object;
  int v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  object = self->_object;
  if (object == *((id *)a3 + 1) || (v6 = objc_msgSend(object, "isEqual:")) != 0)
  {
    if (self->_changeType == *((_QWORD *)a3 + 2) && self->_index == *((_QWORD *)a3 + 3))
    {
      LOBYTE(v6) = self->_associatedIndex == *((_QWORD *)a3 + 4);
      return v6;
    }
LABEL_8:
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end
