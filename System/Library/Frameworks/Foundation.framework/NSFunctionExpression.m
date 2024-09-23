@implementation NSFunctionExpression

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  void *v7;
  id v8;
  const char *v9;
  _expressionFlags expressionFlags;
  void *v11;
  id v12;
  _BOOL4 isClass;
  const char *Name;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  id result;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  objc_class *Class;
  void *v29;
  const char *v30;
  objc_class *v31;
  objc_method *ClassMethod;
  objc_method *v33;
  unint64_t v34;
  __int128 v35;
  NSObject *v36;
  uint64_t v37;
  unsigned int v38;
  BOOL v39;
  int v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSString *v45;
  NSString *v46;
  unint64_t v47;
  int v48;
  unsigned int v49;
  NSObject *v50;
  char Flags;
  const char *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  __int128 v60;
  NSObject *v61;
  uint64_t v62;
  const char *v63;
  id *v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  NSString *v68;
  NSString *v69;
  Class v70;
  NSObject *v71;
  id v72;
  NSString *v73;
  NSString *v74;
  CFStringRef v75;
  void *v76;
  void *v77;
  NSString *v78;
  NSString *v79;
  _QWORD v80[2];
  __int128 v81;
  void *v82;
  void *v83;
  const char *v84;
  __int128 v85;
  _QWORD *v86;
  unint64_t v87;
  uint64_t v88;
  _BYTE v89[9];
  id v90;
  int v91;
  NSString *v92;
  __int16 v93;
  id *v94;
  _BYTE v95[128];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!-[NSFunctionExpression _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  *(_QWORD *)&v89[1] = 0;
  v7 = (void *)MEMORY[0x186DA8F78]();
  v8 = -[NSFunctionExpression arguments](self, "arguments");
  v87 = objc_msgSend(v8, "count");
  v9 = -[NSFunctionExpression selector](self, "selector");
  expressionFlags = self->super._expressionFlags;
  *(_QWORD *)v89 = (*(_BYTE *)&expressionFlags & 2) != 0;
  v84 = v9;
  if (v9
    && (*(_BYTE *)&expressionFlags & 4) == 0
    && +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v84, (uint64_t)-[NSFunctionExpression operand](self, "operand"), v89, (uint64_t)CFSTR("NSFunctionExpression")))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  v11 = (void *)objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "expressionValueWithObject:context:", a3, a4);
  *(_QWORD *)&v85 = v11;
  if (!v11)
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
  v12 = v11;
  isClass = object_isClass((id)v85);
  if (isClass)
  {
    Name = class_getName((Class)v85);
    if (strncmp("_NSPredicateUtilities", Name, 0x15uLL))
    {
      objc_opt_self();
      v15 = _NSOSLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v91 = 138543362;
        v92 = (NSString *)v85;
        _os_log_fault_impl(&dword_1817D9000, v15, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression on a Class '%{public}@' is deprecated and will be removed in a future release.  NSFunctionExpression should operate on instances.", (uint8_t *)&v91, 0xCu);
      }
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        -[NSFunctionExpression operand](self, "operand");
        if ((objc_opt_isKindOfClass() & 1) == 0)
          +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
  }
  if (+[_NSPredicateUtilities _predicateEnforceRestrictionsOnTarget:forComponentName:]((uint64_t)_NSPredicateUtilities, (objc_class *)v85, (uint64_t)CFSTR("NSFunctionExpression")))+[_NSPredicateUtilities _predicateSecurityAction]();
  if (v87 >> 60)
  {
    v75 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v87);
    v76 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v75, 0);
    CFRelease(v75);
    objc_exception_throw(v76);
  }
  v80[1] = v80;
  if (v87 <= 1)
    v16 = 1;
  else
    v16 = v87;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v80 - v17;
  v88 = 0;
  if (v19 >= 0x101)
  {
    v18 = (char *)_CFCreateArrayStorage();
    v83 = v18;
  }
  else
  {
    v83 = 0;
  }
  LODWORD(v81) = isClass;
  v86 = v18;
  v82 = v7;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v95, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v97;
    v23 = v86;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v97 != v22)
          objc_enumerationMutation(v8);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "expressionValueWithObject:context:", a3, a4);
        v26 = v25;
        *v23++ = v25;
      }
      v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v95, 16);
    }
    while (v21);
  }
  if (v89[0]
    && v87
    && (*(_BYTE *)&self->super._expressionFlags & 8) == 0
    && +[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]((uint64_t)_NSPredicateUtilities, (void *)*v86, (uint64_t)-[NSFunctionExpression operand](self, "operand"), (uint64_t)CFSTR("NSFunctionExpression")))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
  }
  v27 = (void *)v85;
  Class = object_getClass((id)v85);
  v29 = v82;
  v30 = v84;
  v31 = Class;
  if ((_DWORD)v81)
    ClassMethod = class_getClassMethod(Class, v84);
  else
    ClassMethod = class_getInstanceMethod(Class, v84);
  v33 = ClassMethod;
  v34 = v87;
  if (ClassMethod)
  {
    if (v34 + 2 != method_getNumberOfArguments(ClassMethod))
    {
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        objc_opt_self();
        v36 = _NSOSLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v91) = 0;
          _os_log_fault_impl(&dword_1817D9000, v36, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression incorrect number of arguments passed to method", (uint8_t *)&v91, 2u);
        }
        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
    if (v34)
    {
      v37 = 0;
      *(_QWORD *)&v35 = 138412546;
      v81 = v35;
      v38 = 1;
      while (1)
      {
        BYTE4(v90) = 0;
        LODWORD(v90) = 0;
        method_getArgumentType(v33, v38 + 1, (char *)&v90, 4uLL);
        v39 = ((char)v90 - 78) > 0x24 || ((1 << (v90 - 78)) & 0x1300000113) == 0;
        v40 = v39 ? v90 : BYTE1(v90);
        if (v40 == 35)
          break;
        if (v40 != 64)
        {
          objc_opt_self();
          v41 = _NSOSLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            v45 = (NSString *)CFSTR("<unknown>");
            if (v84)
              v45 = NSStringFromSelector(v84);
            v91 = v81;
            v92 = v45;
            v93 = 2080;
            v94 = &v90;
            _os_log_fault_impl(&dword_1817D9000, v41, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' and parameter encoding '%s' is forbidden", (uint8_t *)&v91, 0x16u);
          }
LABEL_59:
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
LABEL_60:
        v37 = v38;
        if (v87 <= v38++)
          goto LABEL_69;
      }
      v42 = (void *)v86[v37];
      if ((objc_msgSend(v42, "isNSData") & 1) == 0 && !objc_msgSend(v42, "isNSString"))
        goto LABEL_60;
      objc_opt_self();
      v43 = _NSOSLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        v46 = (NSString *)CFSTR("<unknown>");
        if (v84)
          v46 = NSStringFromSelector(v84);
        v91 = v81;
        v92 = v46;
        v93 = 2080;
        v94 = &v90;
        _os_log_fault_impl(&dword_1817D9000, v43, OS_LOG_TYPE_FAULT, "NSPredicate: Invalid argument passed to NSFunctionExpression with selector '%@' and parameter encoding '%s' expecting pointer", (uint8_t *)&v91, 0x16u);
      }
      goto LABEL_59;
    }
LABEL_69:
    BYTE4(v90) = 0;
    LODWORD(v90) = 0;
    method_getReturnType(v33, (char *)&v90, 4uLL);
    v30 = v84;
    v27 = (void *)v85;
    v47 = v87;
    v48 = v90;
    v49 = (char)v90 - 78;
    if (v49 <= 0x24 && ((1 << v49) & 0x1300000113) != 0)
      v48 = BYTE1(v90);
    if (v48 == 35 || v48 == 64)
      goto LABEL_83;
    objc_opt_self();
    v50 = _NSOSLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      if (v30)
        v73 = NSStringFromSelector(v30);
      else
        v73 = (NSString *)CFSTR("<unknown>");
      v91 = 138412546;
      v92 = v73;
      v93 = 2080;
      v94 = &v90;
      _os_log_fault_impl(&dword_1817D9000, v50, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' and return type '%s' is forbidden", (uint8_t *)&v91, 0x16u);
    }
    goto LABEL_82;
  }
  objc_opt_self();
  Flags = _CFPredicatePolicyData_getFlags();
  v47 = v87;
  if ((Flags & 8) != 0)
  {
    if (v31)
    {
      v52 = class_getName(v31);
      if (strcmp(v52, "OCPartialMockObject"))
      {
        if (strcmp(v52, "OCMockObject"))
        {
          objc_opt_self();
          v53 = _NSOSLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v91) = 0;
            _os_log_fault_impl(&dword_1817D9000, v53, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression unable to find method", (uint8_t *)&v91, 2u);
          }
LABEL_82:
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
    }
  }
LABEL_83:
  switch(v47)
  {
    case 0uLL:
      v54 = objc_msgSend(v27, v30);
      goto LABEL_125;
    case 1uLL:
      v54 = objc_msgSend(v27, v30, *v86);
      goto LABEL_125;
    case 2uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1]);
      goto LABEL_125;
    case 3uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2]);
      goto LABEL_125;
    case 4uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3]);
      goto LABEL_125;
    case 5uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4]);
      goto LABEL_125;
    case 6uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5]);
      goto LABEL_125;
    case 7uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5], v86[6]);
      goto LABEL_125;
    case 8uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5], v86[6], v86[7]);
      goto LABEL_125;
    case 9uLL:
      v54 = objc_msgSend(v27, v30, *v86, v86[1], v86[2], v86[3], v86[4], v86[5], v86[6], v86[7], v86[8]);
LABEL_125:
      *(_QWORD *)&v89[1] = v54;
      if (v54)
        goto LABEL_126;
      goto LABEL_135;
    default:
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        objc_opt_self();
        v55 = _NSOSLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v91) = 0;
          _os_log_fault_impl(&dword_1817D9000, v55, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression no longer allows arbitrarily long parameter lists", (uint8_t *)&v91, 2u);
        }
        +[_NSPredicateUtilities _predicateSecurityAction]();
      }
      v56 = (void *)objc_msgSend(v27, "methodSignatureForSelector:", v30);
      if (!v56)
      {
        v77 = (void *)MEMORY[0x1E0C99DA0];
        if (v30)
          v78 = NSStringFromSelector(v84);
        else
          v78 = (NSString *)CFSTR("<unknown>");
        v79 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSPredicateFunctionMissingSignature: can't find selector (%@) on %@"), v78, (_QWORD)v85);
        objc_exception_throw((id)objc_msgSend(v77, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v79, 0));
      }
      v57 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v56);
      v58 = v57;
      if (!v57)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSPredicateFunctionBadInvocation: can't make invocation"), 0));
      objc_msgSend(v57, "setSelector:", v30);
      objc_msgSend(v58, "setTarget:", v27);
      v59 = objc_msgSend(v56, "numberOfArguments");
      if (v59 != v87)
      {
        objc_opt_self();
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
        {
          objc_opt_self();
          v61 = _NSOSLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            if (v30)
              v74 = NSStringFromSelector(v30);
            else
              v74 = (NSString *)CFSTR("<unknown>");
            v91 = 138412290;
            v92 = v74;
            _os_log_fault_impl(&dword_1817D9000, v61, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' passed the incorrect number of arguments", (uint8_t *)&v91, 0xCu);
          }
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
      v62 = 0;
      *(_QWORD *)&v60 = 138412546;
      v85 = v60;
      do
      {
        v90 = 0;
        v90 = (id)v86[v62];
        v63 = (const char *)objc_msgSend(v56, "getArgumentTypeAtIndex:", v62 + 2);
        v64 = (id *)v63;
        if (v63)
        {
          if (strlen(v63) >= 2)
          {
            v65 = *(unsigned __int8 *)v64;
            if (v65 == 94 || v65 == 64 && *((_BYTE *)v64 + 1) == 63)
            {
              objc_opt_self();
              if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
              {
                objc_opt_self();
                v66 = _NSOSLog();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
                {
                  v69 = (NSString *)CFSTR("<unknown>");
                  if (v84)
                    v69 = NSStringFromSelector(v84);
                  v91 = v85;
                  v92 = v69;
                  v93 = 2080;
                  v94 = v64;
                  _os_log_fault_impl(&dword_1817D9000, v66, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSFunctionExpression with selector '%@' and parameter encoding '%s' is forbidden", (uint8_t *)&v91, 0x16u);
                }
                +[_NSPredicateUtilities _predicateSecurityAction]();
              }
              if ((objc_msgSend(v90, "isNSData") & 1) != 0 || objc_msgSend(v90, "isNSString"))
              {
                objc_opt_self();
                v67 = _NSOSLog();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
                {
                  v68 = (NSString *)CFSTR("<unknown>");
                  if (v84)
                    v68 = NSStringFromSelector(v84);
                  v91 = v85;
                  v92 = v68;
                  v93 = 2080;
                  v94 = v64;
                  _os_log_fault_impl(&dword_1817D9000, v67, OS_LOG_TYPE_FAULT, "NSPredicate: Invalid argument passed to NSFunctionExpression with selector '%@' and parameter encoding '%s' expecting pointer", (uint8_t *)&v91, 0x16u);
                }
                +[_NSPredicateUtilities _predicateSecurityAction]();
              }
            }
          }
        }
        objc_msgSend(v58, "setArgument:atIndex:", &v90, v62 + 2);
        ++v62;
      }
      while (v87 != v62);
      objc_msgSend(v58, "invoke");
      if (objc_msgSend(v56, "methodReturnLength"))
        objc_msgSend(v58, "getReturnValue:", &v89[1]);
      if (!*(_QWORD *)&v89[1])
        goto LABEL_135;
LABEL_126:
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0 && !object_isClass(*(id *)&v89[1]))
      {
        v70 = object_getClass(*(id *)&v89[1]);
        if (!object_isClass(v70))
        {
          objc_opt_self();
          v71 = _NSOSLog();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v91) = 0;
            _os_log_fault_impl(&dword_1817D9000, v71, OS_LOG_TYPE_FAULT, "NSPredicate: NSFunctionExpression must return an object", (uint8_t *)&v91, 2u);
          }
          +[_NSPredicateUtilities _predicateSecurityAction]();
        }
      }
LABEL_135:
      v72 = *(id *)&v89[1];
      free(v83);
      objc_autoreleasePoolPop(v29);
      result = *(id *)&v89[1];
      break;
  }
  return result;
}

- (id)operand
{
  return self->_operand;
}

- (SEL)selector
{
  return self->_selector;
}

- (id)arguments
{
  return self->_arguments;
}

- (BOOL)_allowsEvaluation
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSFunctionExpression;
  return -[NSExpression _allowsEvaluation](&v3, sel__allowsEvaluation);
}

- (NSFunctionExpression)initWithExpressionType:(unint64_t)a3 operand:(id)a4 selector:(SEL)a5 argumentArray:(id)a6
{
  NSFunctionExpression *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSFunctionExpression;
  v9 = -[NSExpression initWithExpressionType:](&v11, sel_initWithExpressionType_, a3);
  v9->_operand = (NSExpression *)a4;
  v9->_selector = a5;
  v9->_arguments = (NSArray *)a6;
  -[NSFunctionExpression _validateExpression]((uint64_t)v9);
  return v9;
}

- (uint64_t)_validateExpression
{
  uint64_t v1;
  void *v2;
  void *v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v7 = 0;
    result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, *(const char **)(v1 + 32), *(_QWORD *)(v1 + 24), &v7, (uint64_t)CFSTR("NSFunctionExpression"));
    if ((result & 1) == 0)
      *(_DWORD *)(v1 + 8) |= 4u;
    if (v7)
    {
      *(_DWORD *)(v1 + 8) |= 2u;
      result = objc_msgSend(*(id *)(v1 + 40), "firstObject");
      if (result)
      {
        v2 = (void *)result;
        if (objc_msgSend((id)result, "expressionType"))
        {
          result = objc_msgSend(v2, "expressionType");
          if (result != 3)
            return result;
          result = objc_msgSend(v2, "keyPath");
          v3 = (void *)result;
        }
        else
        {
          v3 = (void *)objc_msgSend(v2, "constantValue");
          result = objc_msgSend(v3, "isNSString");
          if ((result & 1) == 0)
            return result;
        }
        if (v3)
        {
          result = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnKeyPath:withOperand:forComponentName:]((uint64_t)_NSPredicateUtilities, v3, *(_QWORD *)(v1 + 24), (uint64_t)CFSTR("NSFunctionExpression"));
          v4 = *(_DWORD *)(v1 + 8);
          v5 = v4 | 8;
          v6 = v4 & 0xFFFFFFF3;
          if (!(_DWORD)result)
            v6 = v5;
          *(_DWORD *)(v1 + 8) = v6;
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFunctionExpression;
  -[NSFunctionExpression dealloc](&v3, sel_dealloc);
}

- (void)allowEvaluation
{
  NSArray *arguments;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSExpression allowEvaluation](self->_operand, "allowEvaluation");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  arguments = self->_arguments;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(arguments);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "allowEvaluation");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSFunctionExpression;
  -[NSExpression allowEvaluation](&v8, sel_allowEvaluation);
}

- (NSFunctionExpression)initWithCoder:(id)a3
{
  NSFunctionExpression *v5;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  const __CFString *v10;
  void *v11;
  NSArray *arguments;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char *selector;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  objc_super v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers");
    goto LABEL_36;
  }
  v23.receiver = self;
  v23.super_class = (Class)NSFunctionExpression;
  v5 = -[NSExpression initWithCoder:](&v23, sel_initWithCoder_, a3);
  if (!v5)
    return v5;
  v6 = (void *)objc_msgSend(a3, "allowedClasses");
  v22 = objc_msgSend(v6, "count");
  if (v22)
  {
    v7 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "unionSet:", +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding"));
    v8 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding"));
  }
  else
  {
    v7 = +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding");
    v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding");
  }
  v9 = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSSelectorName"));
  v5->_selector = NSSelectorFromString(v9);
  v5->_operand = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v7, CFSTR("NSOperand"));
  v5->_arguments = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSArguments"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = CFSTR("Malformed function expression (bad operator)");
    goto LABEL_14;
  }
  if (v5->_arguments && (_NSIsNSSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    v10 = CFSTR("Malformed function expression (bad arguments)");
LABEL_14:
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v10, 0);
    if (v11)
      goto LABEL_26;
    goto LABEL_15;
  }
  if (!v5->_selector)
  {
    v10 = CFSTR("Malformed function expression (bad selector)");
    goto LABEL_14;
  }
LABEL_15:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  arguments = v5->_arguments;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(arguments);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), CFSTR("Malformed function expression (bad argument)"), 0);
          goto LABEL_26;
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](arguments, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      v11 = 0;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_26:
  -[NSFunctionExpression _validateExpression]((uint64_t)v5);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    selector = (char *)v5->_selector;
    if (selector != sel_valueForKeyPath_ && selector != sel_valueForKey_)
    {
      objc_opt_self();
      if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
      {
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99778];
        v21 = CFSTR("NSKeyPathExpression is malformed");
LABEL_36:
        objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0));
      }
    }
  }
  if (v22)
  {

  }
  if (v11)
  {

    objc_exception_throw(v11);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
      objc_msgSend(a3, "visitPredicateExpression:", self);
    objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "acceptVisitor:flags:", a3, a4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = -[NSFunctionExpression arguments](self, "arguments");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "acceptVisitor:flags:", a3, a4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v9);
    }
    if ((a4 & 4) == 0)
      objc_msgSend(a3, "visitPredicateExpression:", self);
  }
}

- (id)predicateFormat
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  unsigned int v14;
  const char *v16;
  id v17;
  void *v18;
  NSString *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableString *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  NSString *v31;
  const __CFString *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = -[NSFunctionExpression binaryOperatorForSelector](self, "binaryOperatorForSelector");
  v4 = -[NSFunctionExpression selector](self, "selector");
  if (v3)
  {
    v5 = (void *)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
    v6 = (void *)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 1);
    v7 = objc_msgSend(v5, "_shouldUseParensWithDescription");
    v8 = objc_msgSend(v6, "_shouldUseParensWithDescription");
    v9 = v7 == 0;
    if (v7)
      v10 = CFSTR("(");
    else
      v10 = &stru_1E0F56070;
    if (v9)
      v11 = &stru_1E0F56070;
    else
      v11 = CFSTR(")");
    if (v8)
      v12 = CFSTR("(");
    else
      v12 = &stru_1E0F56070;
    if (v8)
      v13 = CFSTR(")");
    else
      v13 = &stru_1E0F56070;
    v14 = objc_msgSend(v3, "characterAtIndex:", 0) << 24;
    if (v14 == 1526726656)
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@[%@]"), v10, v5, v11, v6, v49, v50, v51);
    }
    else if (v14 == 1694498816)
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@ ** %@%@%@"), v10, v5, v11, v12, v6, v13, v51);
    }
    else
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@ %@ %@%@%@"), v10, v5, v11, v3, v12, v6, v13);
    }
  }
  else
  {
    v16 = v4;
    if (v4 == sel_onesComplement_)
    {
      v27 = (void *)objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "objectAtIndex:", 0);
      v28 = objc_msgSend(v27, "_shouldUseParensWithDescription");
      v29 = &stru_1E0F56070;
      v30 = CFSTR("(");
      if (v28)
        v29 = CFSTR(")");
      else
        v30 = &stru_1E0F56070;
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@~%@%@"), v30, v27, v29, v48, v49, v50, v51);
    }
    else
    {
      v17 = -[NSFunctionExpression operand](self, "operand");
      if (!v17
        || (v18 = v17, (objc_opt_isKindOfClass() & 1) != 0)
        && _NSPredicateUtilities == (__objc2_class *)objc_msgSend(v18, "constantValue"))
      {
        if (v16 == sel_castObject_toType_)
        {
          v26 = +[NSString stringWithString:](NSMutableString, "stringWithString:", CFSTR("CAST("));
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v40 = -[NSFunctionExpression arguments](self, "arguments");
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
          if (v41)
          {
            v42 = v41;
            v43 = 0;
            v44 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v59 != v44)
                  objc_enumerationMutation(v40);
                v46 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                if (-v43 != i)
                  -[NSMutableString appendString:](v26, "appendString:", CFSTR(", "));
                -[NSMutableString appendString:](v26, "appendString:", objc_msgSend(v46, "predicateFormat"));
              }
              v43 += v42;
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
            }
            while (v42);
          }
        }
        else
        {
          v31 = NSStringFromSelector(v16);
          if (+[_NSPredicateUtilities _isReservedWordInParser:](_NSPredicateUtilities, "_isReservedWordInParser:", v31))
          {
            v32 = CFSTR("#");
          }
          else
          {
            v32 = &stru_1E0F56070;
          }
          v26 = +[NSString stringWithString:](NSMutableString, "stringWithString:", v32);
          -[NSMutableString appendString:](v26, "appendString:", v31);
          -[NSMutableString appendString:](v26, "appendString:", CFSTR("("));
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v33 = -[NSFunctionExpression arguments](self, "arguments");
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
          if (v34)
          {
            v35 = v34;
            v36 = 0;
            v37 = *(_QWORD *)v64;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v64 != v37)
                  objc_enumerationMutation(v33);
                v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
                if (-v36 != j)
                  -[NSMutableString appendString:](v26, "appendString:", CFSTR(", "));
                -[NSMutableString appendString:](v26, "appendString:", objc_msgSend(v39, "predicateFormat"));
              }
              v36 += v35;
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
            }
            while (v35);
          }
        }
        -[NSMutableString appendString:](v26, "appendString:", CFSTR(")"));
      }
      else
      {
        if (!objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "count"))
          return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FUNCTION(%@, \"%@\")"), v18, NSStringFromSelector(v16), v47, v48, v49, v50, v51);
        v19 = +[NSString string](NSMutableString, "string");
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v20 = -[NSFunctionExpression arguments](self, "arguments");
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v54;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v54 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
              -[NSString appendString:](v19, "appendString:", CFSTR(", "));
              -[NSString appendString:](v19, "appendString:", objc_msgSend(v25, "predicateFormat"));
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
          }
          while (v22);
        }
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FUNCTION(%@, \"%@\" %@)"), v18, NSStringFromSelector(v16), v19);
      }
      return v26;
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSFunctionExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", NSStringFromSelector(-[NSFunctionExpression selector](self, "selector")), CFSTR("NSSelectorName"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFunctionExpression operand](self, "operand"), CFSTR("NSOperand"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFunctionExpression arguments](self, "arguments"), CFSTR("NSArguments"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSExpression copy](self->_operand, "copy", a3);
  v5 = -[NSFunctionExpression arguments](self, "arguments");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_arguments, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copy");
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpressionType:operand:selector:argumentArray:", -[NSFunctionExpression expressionType](self, "expressionType"), v4, -[NSFunctionExpression selector](self, "selector"), v6);

  return v12;
}

- (unint64_t)expressionType
{
  return 4;
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;

  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSFunctionExpression selector](self, "selector"), v5 == (const char *)objc_msgSend(a3, "selector"))
    && objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "isEqual:", objc_msgSend(a3, "operand")))
  {
    return objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "isEqual:", objc_msgSend(a3, "arguments"));
  }
  else
  {
    return 0;
  }
}

- (NSFunctionExpression)initWithSelector:(SEL)a3 argumentArray:(id)a4
{
  NSConstantValueExpression *v7;
  NSFunctionExpression *v8;

  v7 = -[NSConstantValueExpression initWithObject:]([NSConstantValueExpression alloc], "initWithObject:", _NSPredicateUtilities);
  v8 = -[NSFunctionExpression initWithExpressionType:operand:selector:argumentArray:](self, "initWithExpressionType:operand:selector:argumentArray:", 4, v7, a3, a4);

  return v8;
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  v5 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "_expressionWithSubstitutionVariables:", a3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = -[NSFunctionExpression arguments](self, "arguments");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "_expressionWithSubstitutionVariables:", a3));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
  v12 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpressionType:operand:selector:argumentArray:", -[NSFunctionExpression expressionType](self, "expressionType"), v5, -[NSFunctionExpression selector](self, "selector"), v6);

  return v12;
}

- (id)function
{
  return NSStringFromSelector(-[NSFunctionExpression selector](self, "selector"));
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](NSStringFromSelector(-[NSFunctionExpression selector](self, "selector")), "hash");
  v4 = objc_msgSend(-[NSFunctionExpression operand](self, "operand"), "hash");
  return v4 ^ objc_msgSend(-[NSFunctionExpression arguments](self, "arguments"), "hash") ^ v3;
}

- (NSFunctionExpression)initWithTarget:(id)a3 selectorName:(id)a4 arguments:(id)a5
{
  SEL v9;
  const char *v10;
  NSFunctionExpression *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = NSSelectorFromString((NSString *)a4);
  if (!v9)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid selector name (%@)"), a4), 0));
  v10 = v9;
  v13.receiver = self;
  v13.super_class = (Class)NSFunctionExpression;
  v11 = -[NSExpression initWithExpressionType:](&v13, sel_initWithExpressionType_, 4);
  v11->_operand = (NSExpression *)a3;
  v11->_selector = v10;
  v11->_arguments = (NSArray *)a5;
  -[NSFunctionExpression _validateExpression]((uint64_t)v11);
  return v11;
}

- (BOOL)_shouldUseParensWithDescription
{
  unsigned int v2;
  BOOL v3;

  v2 = objc_msgSend(-[NSFunctionExpression binaryOperatorForSelector](self, "binaryOperatorForSelector"), "characterAtIndex:", 0) << 24;
  if (v2)
    v3 = v2 == 1526726656;
  else
    v3 = 1;
  return !v3;
}

- (id)binaryOperatorForSelector
{
  const char *v2;

  v2 = -[NSFunctionExpression selector](self, "selector");
  if (v2 == sel_add_to_)
    return CFSTR("+");
  if (v2 == sel_from_subtract_)
    return CFSTR("-");
  if (v2 == sel_multiply_by_)
    return CFSTR("*");
  if (v2 == sel_divide_by_)
    return CFSTR("/");
  if (v2 == sel_raise_toPower_)
    return CFSTR("e");
  if (v2 == sel_objectFrom_withIndex_)
    return CFSTR("[");
  if (v2 == sel_bitwiseAnd_with_)
    return CFSTR("&");
  if (v2 == sel_bitwiseOr_with_)
    return CFSTR("|");
  if (v2 == sel_bitwiseXor_with_)
    return CFSTR("^");
  if (v2 == sel_leftshift_by_)
    return CFSTR("<<");
  if (v2 == sel_rightshift_by_)
    return CFSTR(">>");
  return 0;
}

@end
