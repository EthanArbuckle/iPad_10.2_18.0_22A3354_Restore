@implementation NSCustomPredicateOperator

- (unint64_t)operatorType
{
  return 11;
}

- (NSCustomPredicateOperator)initWithCustomSelector:(SEL)a3 modifier:(unint64_t)a4
{
  NSCustomPredicateOperator *v5;
  NSCustomPredicateOperator *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSCustomPredicateOperator;
  v5 = -[NSPredicateOperator initWithOperatorType:modifier:](&v8, sel_initWithOperatorType_modifier_, 11, a4);
  v6 = v5;
  if (v5)
    v5->_selector = a3;
  -[NSCustomPredicateOperator _validateOperator]((uint64_t)v5);
  return v6;
}

- (uint64_t)_validateOperator
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = 0;
    result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, *(const char **)(result + 24), 0, &v2, (uint64_t)CFSTR("NSCustomPredicateOperator"));
    if ((result & 1) == 0)
      *(_DWORD *)(v1 + 32) |= 2u;
    if (v2)
      *(_DWORD *)(v1 + 32) |= 1u;
  }
  return result;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  uint64_t v7;
  _BOOL4 isClass;
  const char *Name;
  NSObject *v10;
  const char *v11;
  const char *v12;
  NSSelfExpression *v13;
  objc_class *Class;
  objc_method *ClassMethod;
  objc_method *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  unsigned int v20;
  NSObject *v21;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  BOOL v27;
  char dst[4];
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't invoke the selector %@ on (nil)"), NSStringFromSelector(-[NSCustomPredicateOperator selector](self, "selector", 0, a4))), 0);
    objc_exception_throw(v26);
  }
  v7 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 704);
  isClass = object_isClass(a3);
  if (isClass)
  {
    Name = class_getName((Class)a3);
    if (strncmp("_NSPredicateUtilities", Name, 0x15uLL))
    {
      objc_opt_self();
      v10 = _NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v31 = a3;
        _os_log_fault_impl(&dword_1817D9000, v10, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSCustomPredicateOperator on a Class '%{public}@' is deprecated and will be removed in a future release.  NSCustomPredicateOperator should operate on instances.", buf, 0xCu);
      }
      if (v7 != 4211063755)
      {
        objc_opt_self();
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
          +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
  }
  if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]((uint64_t)_NSPredicateUtilities, (objc_class *)a3, (uint64_t)CFSTR("NSCustomPredicateOperator")))+[_NSPredicateUtilities _predicateSecurityAction]();
  v11 = -[NSCustomPredicateOperator selector](self, "selector");
  v12 = v11;
  v27 = *(_BYTE *)&self->_operatorFlags & 1;
  if (v7 == 4211063755)
  {
    v13 = +[NSSelfExpression defaultInstance](NSSelfExpression, "defaultInstance");
    if (!v12)
      goto LABEL_19;
  }
  else
  {
    v13 = 0;
    if (!v11)
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_operatorFlags & 2) == 0)
  {
    if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v12, (uint64_t)v13, &v27, (uint64_t)CFSTR("NSCustomPredicateOperator")))
    {
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
        +[_NSPredicateUtilities _predicateSecurityAction]();
    }
  }
LABEL_19:
  if (v27)
  {
    if (a4)
    {
      if ((*(_DWORD *)&self->_operatorFlags & 4) == 0)
      {
        if (objc_msgSend(a4, "isNSString"))
        {
          if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]((uint64_t)_NSPredicateUtilities, a4, (uint64_t)v13, (uint64_t)CFSTR("NSCustomPredicateOperator")))
          {
            objc_opt_self();
            if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
              +[_NSPredicateUtilities _predicateSecurityAction]();
          }
        }
      }
    }
  }
  Class = object_getClass(a3);
  if (isClass)
    ClassMethod = class_getClassMethod(Class, v12);
  else
    ClassMethod = class_getInstanceMethod(Class, v12);
  v16 = ClassMethod;
  if (ClassMethod)
  {
    v29 = 0;
    *(_DWORD *)dst = 0;
    method_getArgumentType(ClassMethod, 2u, dst, 4uLL);
    v17 = strnlen(dst, 5uLL);
    if (v17 == 2)
    {
      if (dst[0] != 94 && (dst[0] != 64 || dst[1] != 63))
      {
LABEL_44:
        method_getReturnType(v16, dst, 4uLL);
        if (strnlen(dst, 5uLL) != 1
          || (v20 = dst[0] - 66, v20 > 0x31)
          || ((1 << v20) & 0x2008200020083) == 0)
        {
          objc_opt_self();
          if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
          {
            objc_opt_self();
            v21 = _NSOSLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              if (v12)
                v25 = NSStringFromSelector(v12);
              else
                v25 = (NSString *)CFSTR("<unknown>");
              *(_DWORD *)buf = 138412546;
              v31 = v25;
              v32 = 2080;
              v33 = dst;
              _os_log_fault_impl(&dword_1817D9000, v21, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSCustomPredicateOperator with selector '%@' and return type '%s' is forbidden", buf, 0x16u);
            }
            +[_NSPredicateUtilities _predicateSecurityAction]();
          }
        }
        return objc_msgSend(a3, v12, a4);
      }
    }
    else if (v17 != 1 || dst[0] != 42)
    {
      goto LABEL_44;
    }
    objc_opt_self();
    if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
    {
      objc_opt_self();
      v18 = _NSOSLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        if (v12)
          v24 = NSStringFromSelector(v12);
        else
          v24 = (NSString *)CFSTR("<unknown>");
        *(_DWORD *)buf = 138412546;
        v31 = v24;
        v32 = 2080;
        v33 = dst;
        _os_log_fault_impl(&dword_1817D9000, v18, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSCustomPredicateOperator with selector '%@' and parameter encoding '%s' is forbidden", buf, 0x16u);
      }
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
    if ((objc_msgSend(a4, "isNSData") & 1) != 0 || objc_msgSend(a4, "isNSString"))
    {
      objc_opt_self();
      v19 = _NSOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        if (v12)
          v23 = NSStringFromSelector(v12);
        else
          v23 = (NSString *)CFSTR("<unknown>");
        *(_DWORD *)buf = 138412546;
        v31 = v23;
        v32 = 2080;
        v33 = dst;
        _os_log_fault_impl(&dword_1817D9000, v19, OS_LOG_TYPE_FAULT, "NSPredicate: Invalid argument passed to NSCustomPredicateOperator with selector '%@' and parameter encoding '%s' expecting pointer", buf, 0x16u);
      }
      +[_NSPredicateUtilities _predicateSecurityAction]();
    }
    goto LABEL_44;
  }
  return objc_msgSend(a3, v12, a4);
}

- (SEL)selector
{
  return self->_selector;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v5;
  objc_super v6;
  uint8_t buf[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v6.receiver = self;
  v6.super_class = (Class)NSCustomPredicateOperator;
  -[NSPredicateOperator encodeWithCoder:](&v6, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", NSStringFromSelector(self->_selector), CFSTR("NSSelectorName"));
  objc_opt_self();
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
  {
    objc_opt_self();
    v5 = _NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v5, OS_LOG_TYPE_FAULT, "NSPredicate: Archiving an NSCustomPredicateOperator is deprecated and secure coding support will be removed in a future release.", buf, 2u);
    }
  }
}

- (NSCustomPredicateOperator)initWithCoder:(id)a3
{
  NSCustomPredicateOperator *v5;
  NSString *v6;
  SEL v7;
  NSObject *v8;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  objc_super v13;
  uint8_t buf[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers");
    goto LABEL_11;
  }
  v13.receiver = self;
  v13.super_class = (Class)NSCustomPredicateOperator;
  v5 = -[NSPredicateOperator initWithCoder:](&v13, sel_initWithCoder_, a3);
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSSelectorName"));
    v7 = NSSelectorFromString(v6);
    v5->_selector = v7;
    if (v7)
    {
      -[NSCustomPredicateOperator _validateOperator]((uint64_t)v5);
      goto LABEL_5;
    }

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("Attempted to decode custom predicate operator with nil selector");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0));
  }
LABEL_5:
  objc_opt_self();
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
  {
    objc_opt_self();
    v8 = _NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1817D9000, v8, OS_LOG_TYPE_FAULT, "NSPredicate: Unarchiving an NSCustomPredicateOperator is deprecated and secure coding support will be removed in a future release.", buf, 2u);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCustomSelector:modifier:", self->_selector, -[NSPredicateOperator modifier](self, "modifier"));
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  const char *v7;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSCustomPredicateOperator operatorType](self, "operatorType");
  if (v5 != objc_msgSend(a3, "operatorType"))
    return 0;
  v6 = -[NSPredicateOperator modifier](self, "modifier");
  if (v6 != objc_msgSend(a3, "modifier"))
    return 0;
  v7 = -[NSCustomPredicateOperator selector](self, "selector");
  return v7 == (const char *)objc_msgSend(a3, "selector");
}

- (id)symbol
{
  return NSStringFromSelector(-[NSCustomPredicateOperator selector](self, "selector"));
}

@end
