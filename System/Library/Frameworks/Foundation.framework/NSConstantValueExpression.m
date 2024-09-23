@implementation NSConstantValueExpression

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3, a4))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  return self->constantValue;
}

- (id)predicateFormat
{
  id constantValue;

  constantValue = self->constantValue;
  if (!constantValue)
    return CFSTR("nil");
  if (_NSIsNSValue())
    return (id)objc_msgSend(constantValue, "description");
  if (_NSIsNSString())
    return +[_NSPredicateUtilities _parserableStringDescription:]((uint64_t)_NSPredicateUtilities, (uint64_t)constantValue);
  if (_NSIsNSDate())
    return +[_NSPredicateUtilities _parserableDateDescription:]((uint64_t)_NSPredicateUtilities, constantValue);
  if ((_NSIsNSArray() & 1) == 0
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && !_NSIsNSDictionary())
  {
    return (id)objc_msgSend(constantValue, "description");
  }
  return +[_NSPredicateUtilities _parserableCollectionDescription:]((uint64_t)_NSPredicateUtilities, constantValue);
}

- (NSConstantValueExpression)initWithObject:(id)a3
{
  NSConstantValueExpression *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSConstantValueExpression;
  v4 = -[NSExpression initWithExpressionType:](&v6, sel_initWithExpressionType_, 0);
  v4->constantValue = a3;
  return v4;
}

- (NSConstantValueExpression)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  Class v9;
  NSString *v10;
  const char *Name;
  NSObject *v12;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v15.receiver = self;
  v15.super_class = (Class)NSConstantValueExpression;
  v5 = -[NSExpression initWithCoder:](&v15, sel_initWithCoder_, a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "allowedClasses");
    v7 = +[_NSPredicateUtilities _constantValueClassesForSecureCoding](_NSPredicateUtilities, "_constantValueClassesForSecureCoding");
    if (v6 && objc_msgSend(v6, "count"))
    {
      v7 = (id)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v7, "unionSet:", v6);
      objc_msgSend(v7, "removeObject:", objc_opt_class());
      objc_msgSend(v7, "removeObject:", objc_opt_class());
    }
    else
    {
      v8 = v7;
    }
    *((_QWORD *)v5 + 3) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v7, CFSTR("NSConstantValue"));

    v9 = (Class)*((_QWORD *)v5 + 3);
    if (!v9)
    {
      v10 = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSConstantValueClassName"));
      if (v10)
      {
        v9 = NSClassFromString(v10);
        *((_QWORD *)v5 + 3) = v9;
        if (!v9)
          return (NSConstantValueExpression *)v5;
      }
      else
      {
        v9 = (Class)*((_QWORD *)v5 + 3);
        if (!v9)
          return (NSConstantValueExpression *)v5;
      }
    }
    if (!object_isClass(v9)
      || (Name = class_getName(*((Class *)v5 + 3)), !strncmp("_NSPredicateUtilities", Name, 0x15uLL)))
    {
      if (!+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]((uint64_t)_NSPredicateUtilities, *((objc_class **)v5 + 3), (uint64_t)CFSTR("NSConstantValueExpression")))return (NSConstantValueExpression *)v5;
    }
    else
    {
      objc_opt_self();
      v12 = _NSOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v14 = *((_QWORD *)v5 + 3);
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_fault_impl(&dword_1817D9000, v12, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSConstantValueExpression on a Class '%{public}@' is deprecated and will be removed in a future release.  NSConstantValueExpression should operate on instances.", buf, 0xCu);
      }
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) == 0)
        return (NSConstantValueExpression *)v5;
    }
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  return (NSConstantValueExpression *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *constantValue;
  const __CFString *v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v9.receiver = self;
  v9.super_class = (Class)NSConstantValueExpression;
  -[NSExpression encodeWithCoder:](&v9, sel_encodeWithCoder_, a3);
  v5 = objc_opt_self();
  v6 = objc_opt_class();
  constantValue = self->constantValue;
  if (v5 == v6)
  {
    constantValue = NSStringFromClass((Class)self->constantValue);
    v8 = CFSTR("NSConstantValueClassName");
  }
  else
  {
    v8 = CFSTR("NSConstantValue");
  }
  objc_msgSend(a3, "encodeObject:forKey:", constantValue, v8);
}

- (unint64_t)expressionType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", self->constantValue);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  uint64_t v6;

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSConstantValueExpression constantValue](self, "constantValue");
    v6 = objc_msgSend(a3, "constantValue");
    if (!(v5 | v6) || v6 && (LODWORD(v6) = objc_msgSend((id)v6, "isEqual:", v5), (_DWORD)v6))
      LOBYTE(v6) = 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)constantValue
{
  return self->constantValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConstantValueExpression;
  -[NSConstantValueExpression dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSConstantValueExpression constantValue](self, "constantValue"), "hash");
}

- (id)expressionValueWithObject:(id)a3
{
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation", a3))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  return self->constantValue;
}

@end
