@implementation NSInPredicateOperator

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  BOOL result;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v7 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v7 == 10)
  {
    v8 = a4;
    a4 = a3;
  }
  else
  {
    v8 = a3;
    if (v7 != 99)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In operator with invalid type %lu"), v7);
      v12 = v9;
      v13 = v10;
      goto LABEL_20;
    }
  }
  result = 0;
  if (v8 && a4)
  {
    if (v8 == (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    {
      return 0;
    }
    else
    {
      if (_NSIsNSString())
      {
        if ((_NSIsNSString() & 1) != 0)
          return objc_msgSend(-[NSInPredicateOperator stringVersion](self, "stringVersion"), "performPrimitiveOperationUsingObject:andObject:", v8, a4);
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't look for value (%@) in string (%@); value is not a string "),
                a4,
                v8);
        v12 = v15;
        v13 = v16;
LABEL_20:
        objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, 0));
      }
      if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
      {
        return objc_msgSend(v8, "containsObject:", a4);
      }
      else
      {
        if (!_NSIsNSDictionary())
        {
          v17 = (void *)MEMORY[0x1E0C99DA0];
          v18 = *MEMORY[0x1E0C99778];
          v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't use in/contains operator with collection %@ (not a collection)"), v8);
          v12 = v17;
          v13 = v18;
          goto LABEL_20;
        }
        return objc_msgSend((id)objc_msgSend(v8, "allKeysForObject:", a4), "count") != 0;
      }
    }
  }
  return result;
}

- (id)stringVersion
{
  NSSubstringPredicateOperator **p_stringVersion;
  NSSubstringPredicateOperator *v3;

  p_stringVersion = &self->_stringVersion;
  if (!self->_stringVersion)
  {
    v3 = -[NSSubstringPredicateOperator initWithOperatorType:modifier:variant:position:]([NSSubstringPredicateOperator alloc], "initWithOperatorType:modifier:variant:position:", -[NSPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), self->_flags, 2);
    while (!__ldaxr((unint64_t *)p_stringVersion))
    {
      if (!__stlxr((unint64_t)v3, (unint64_t *)p_stringVersion))
        return *p_stringVersion;
    }
    __clrex();

  }
  return *p_stringVersion;
}

- (id)symbol
{
  unint64_t v3;
  __CFString *v4;
  id v5;
  void *v6;
  unint64_t flags;

  v3 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v3 == 10)
  {
    v4 = CFSTR("IN");
  }
  else
  {
    if (v3 != 99)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("In operator with invalid type %lu"), v3), 0));
    v4 = CFSTR("CONTAINS");
  }
  v5 = (id)-[__CFString mutableCopy](v4, "mutableCopy");
  v6 = v5;
  if (!self->_flags)
    return v6;
  objc_msgSend(v5, "appendString:", CFSTR("["));
  flags = self->_flags;
  if ((flags & 1) != 0)
  {
    objc_msgSend(v6, "appendString:", CFSTR("c"));
    flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_8:
      if ((flags & 8) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v6, "appendString:", CFSTR("d"));
  flags = self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_9:
    if ((flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v6, "appendString:", CFSTR("l"));
  flags = self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_10:
    if ((flags & 0x10) == 0)
      goto LABEL_11;
LABEL_18:
    objc_msgSend(v6, "appendString:", CFSTR("w"));
    if (!self->_flags)
      return v6;
    goto LABEL_12;
  }
LABEL_17:
  objc_msgSend(v6, "appendString:", CFSTR("n"));
  flags = self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_18;
LABEL_11:
  if (flags)
LABEL_12:
    objc_msgSend(v6, "appendString:", CFSTR("]"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSInPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_flags, CFSTR("NSFlags"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_newOperatorWithType:modifier:options:", -[NSPredicateOperator operatorType](self, "operatorType"), -[NSPredicateOperator modifier](self, "modifier"), self->_flags);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_stringVersion = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSInPredicateOperator;
  -[NSInPredicateOperator dealloc](&v3, sel_dealloc);
}

- (NSInPredicateOperator)initWithCoder:(id)a3
{
  NSInPredicateOperator *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSInPredicateOperator;
  v4 = -[NSPredicateOperator initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_flags = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSFlags"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSInPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 options:(unint64_t)a5
{
  NSInPredicateOperator *v6;
  NSInPredicateOperator *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSInPredicateOperator;
  v6 = -[NSPredicateOperator initWithOperatorType:modifier:](&v9, sel_initWithOperatorType_modifier_, a3, a4);
  v7 = v6;
  if (v6)
    -[NSInPredicateOperator _setOptions:](v6, "_setOptions:", a5);
  return v7;
}

- (void)_setOptions:(unint64_t)a3
{
  self->_flags = a3 & 0x1F;
}

- (unint64_t)options
{
  return self->_flags;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v5 != objc_msgSend(a3, "operatorType"))
    return 0;
  v6 = -[NSPredicateOperator modifier](self, "modifier");
  if (v6 != objc_msgSend(a3, "modifier"))
    return 0;
  v7 = -[NSInPredicateOperator flags](self, "flags");
  return v7 == objc_msgSend(a3, "flags");
}

@end
