@implementation _NSPredicateUtilities

+ (uint64_t)_predicateEnforceRestrictionsOnKeyPath:(uint64_t)a3 withOperand:(uint64_t)a4 forComponentName:
{
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSString *v17;
  const char *v18;
  int v19;
  char v20;
  int v21;
  uint64_t v22;
  void *context;
  int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_self();
  v8 = (void *)MEMORY[0x186DA8F78](v7);
  if (a3)
    v9 = objc_opt_isKindOfClass() ^ 1;
  else
    v9 = 1;
  v10 = (void *)objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("."));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v11)
  {
    v12 = v11;
    context = v8;
    v13 = 0;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      v15 = 0;
      v16 = -v13;
      v25 = v13 + v12;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v10);
        v17 = *(NSString **)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v18 = NSSelectorFromString(v17);
        if (v18)
        {
          v19 = +[_NSPredicateUtilities _predicateEnforceRestrictionsOnSelector:withOperand:isKVC:forComponentName:]((uint64_t)_NSPredicateUtilities, v18, a3, 0, a4);
          v20 = v19;
          if (v16 == (_DWORD)v15)
            v21 = 1;
          else
            v21 = v19;
          if (((v21 | v9) & 1) != 0 || !-[NSString isEqualToString:](v17, "isEqualToString:", CFSTR("class")))
          {
            if ((v20 & 1) != 0)
            {
LABEL_21:
              v22 = 1;
              goto LABEL_22;
            }
          }
          else
          {
            objc_opt_self();
            if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
              goto LABEL_21;
          }
        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      v13 = v25;
      if (v12)
        continue;
      break;
    }
    v22 = 0;
LABEL_22:
    v8 = context;
  }
  else
  {
    v22 = 0;
  }
  objc_autoreleasePoolPop(v8);
  return v22;
}

+ (uint64_t)_predicateEnforceRestrictionsOnSelector:(uint64_t)a3 withOperand:(BOOL *)a4 isKVC:(uint64_t)a5 forComponentName:
{
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v9 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", sel_getName(a2));
  objc_opt_self();
  v10 = objc_msgSend(*(id *)(_CFPredicatePolicyData() + 32), "objectForKey:", v9);
  if (v10
    || (objc_opt_self(), !objc_msgSend((id)_CFPredicatePolicyRestrictedSelectors(), "objectForKey:", v9))
    && ((objc_opt_self(), (_CFPredicatePolicyData_getFlags() & 8) == 0)
     || (objc_opt_class(), (objc_opt_respondsToSelector() & 1) == 0)
     || (objc_opt_self(), objc_msgSend(*(id *)(_CFPredicatePolicyData() + 24), "objectForKey:", v9)))
    || (objc_opt_self(), objc_msgSend(*(id *)(_CFPredicatePolicyData() + 40), "objectForKey:", v9))
    && (objc_opt_self(), (_CFPredicatePolicyData_getFlags() & 8) == 0)
    || (v13 = -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("class")), a3)
    && v13
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_opt_self();
    v14 = _NSOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v15 = 138412546;
      v16 = a5;
      v17 = 2114;
      v18 = v9;
      _os_log_fault_impl(&dword_1817D9000, v14, OS_LOG_TYPE_FAULT, "NSPredicate: %@ with selector '%{public}@' is forbidden.", (uint8_t *)&v15, 0x16u);
    }
    v11 = 1;
  }

  if (a4)
    *a4 = v10 != 0;
  return v11;
}

+ (uint64_t)_predicateEnforceRestrictionsOnTarget:(uint64_t)a3 forComponentName:
{
  NSString *v5;
  objc_class *v6;
  uint64_t v7;
  Class Class;
  NSString *Superclass;
  unint64_t Flags;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return 0;
  if (object_isClass(a2))
  {
    v5 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", class_getName(a2));
    v6 = a2;
    goto LABEL_7;
  }
  Class = object_getClass(a2);
  if (object_isClass(Class))
  {
    v5 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", object_getClassName(a2));
    v6 = object_getClass(a2);
LABEL_7:
    Superclass = (NSString *)class_getSuperclass(v6);
    if (Superclass)
      Superclass = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", class_getName((Class)Superclass));
    objc_opt_self();
    if (objc_msgSend((id)_CFPredicatePolicyRestrictedClasses(), "objectForKey:", v5))
    {
      objc_opt_self();
      if (!objc_msgSend(*(id *)(_CFPredicatePolicyData() + 8), "objectForKey:", v5))
      {
LABEL_17:
        objc_opt_self();
        v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          v14 = 138412546;
          v15 = a3;
          v16 = 2114;
          v17 = v5;
          _os_log_fault_impl(&dword_1817D9000, v12, OS_LOG_TYPE_FAULT, "NSPredicate: Use of %@ with instance of '%{public}@' is forbidden.", (uint8_t *)&v14, 0x16u);
        }
        v7 = 1;
        goto LABEL_25;
      }
      objc_opt_self();
      Flags = _CFPredicatePolicyData_getFlags();
      v11 = (Flags >> 3) & 1;
      if (((Flags >> 3) & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      LODWORD(v11) = 0;
    }
    if (Superclass)
    {
      objc_opt_self();
      if (!objc_msgSend(*(id *)(_CFPredicatePolicyData() + 16), "objectForKey:", v5))
      {
        objc_opt_self();
        if (objc_msgSend((id)_CFPredicatePolicyRestrictedClasses(), "objectForKey:", Superclass))
        {
          objc_opt_self();
          if (!objc_msgSend(*(id *)(_CFPredicatePolicyData() + 8), "objectForKey:", Superclass))
            goto LABEL_17;
          objc_opt_self();
          if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
            goto LABEL_17;
        }
        goto LABEL_24;
      }
    }
LABEL_16:
    if ((_DWORD)v11)
      goto LABEL_17;
LABEL_24:
    v7 = 0;
LABEL_25:

    return v7;
  }
  return 1;
}

+ (id)objectFrom:(id)a3 withIndex:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  uint64_t v19;

  if ((_NSIsNSArray() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    if (_NSIsNSSet())
    {
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return (id)objc_msgSend(a3, "member:", a4);
      v9 = objc_msgSend(a4, "constantValue");
      if (!objc_msgSend(CFSTR("FIRST"), "caseInsensitiveCompare:", v9)
        || !objc_msgSend(CFSTR("LAST"), "caseInsensitiveCompare:", v9))
      {
        return (id)objc_msgSend(a3, "anyObject");
      }
      goto LABEL_14;
    }
    if (_NSIsNSDictionary())
    {
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(a4, "constantValue");
        v13 = (void *)objc_msgSend(a3, "allKeys");
        if (objc_msgSend(CFSTR("FIRST"), "caseInsensitiveCompare:", v12))
        {
          if (objc_msgSend(CFSTR("LAST"), "caseInsensitiveCompare:", v12))
          {
            v10 = v12;
            goto LABEL_15;
          }
          v16 = objc_msgSend(v13, "lastObject");
        }
        else
        {
          if (!objc_msgSend(v13, "count"))
            return 0;
          v16 = objc_msgSend(v13, "objectAtIndex:", 0);
        }
        v15 = (id)v16;
        v14 = a3;
      }
      else
      {
        v14 = a3;
        v15 = a4;
      }
      return (id)objc_msgSend(v14, "objectForKey:", v15);
    }
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The object %@ is NOT a collection.  Cannot retrieve item at index: %@"), a3, a4);
LABEL_27:
    if (v11)
    {
      v17 = v11;
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v18, "setObject:forKey:", a3, CFSTR("list"));
      objc_msgSend(v18, "setObject:forKey:", a4, CFSTR("index"));
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v17, v18));
    }
    return 0;
  }
  if (_NSIsNSNumber())
  {
    v6 = objc_msgSend(a4, "integerValue");
    v7 = a3;
    return (id)objc_msgSend(v7, "objectAtIndex:", v6);
  }
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The symbolic index %@ is unknown."), a4, v19);
    goto LABEL_27;
  }
  v9 = objc_msgSend(a4, "constantValue");
  if (!objc_msgSend(CFSTR("FIRST"), "caseInsensitiveCompare:", v9))
  {
    if (objc_msgSend(a3, "count"))
    {
      v7 = a3;
      v6 = 0;
      return (id)objc_msgSend(v7, "objectAtIndex:", v6);
    }
    return 0;
  }
  if (!objc_msgSend(CFSTR("LAST"), "caseInsensitiveCompare:", v9))
    return (id)objc_msgSend(a3, "lastObject");
LABEL_14:
  v10 = v9;
LABEL_15:
  if (objc_msgSend(CFSTR("SIZE"), "caseInsensitiveCompare:", v10))
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The index %@ is NOT appropriate for a collection of type: %@"), a4, objc_opt_class());
    goto LABEL_27;
  }
  return +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(a3, "count"));
}

+ (id)bitwiseAnd:(id)a3 with:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't do bit operators on non-numbers"), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a4, "integerValue") & objc_msgSend(a3, "integerValue"));
}

+ (NSString)_parserableDateDescription:(uint64_t)a1
{
  uint64_t v3;

  objc_opt_self();
  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CAST(%f, \"NSDate\")"), v3);
}

+ (id)_compoundPredicateClassesForSecureCoding
{
  if (qword_1ECD0A300 != -1)
    dispatch_once(&qword_1ECD0A300, &__block_literal_global_138_0);
  return (id)qword_1ECD0A2F8;
}

+ (id)_constantValueClassesForSecureCoding
{
  if (qword_1ECD0A340 != -1)
    dispatch_once(&qword_1ECD0A340, &__block_literal_global_166);
  return (id)qword_1ECD0A338;
}

+ (id)_extendedExpressionClassesForSecureCoding
{
  if (qword_1ECD0A320 != -1)
    dispatch_once(&qword_1ECD0A320, &__block_literal_global_153);
  return (id)qword_1ECD0A318;
}

+ (id)_expressionClassesForSecureCoding
{
  if (qword_1ECD0A310 != -1)
    dispatch_once(&qword_1ECD0A310, &__block_literal_global_139_0);
  return (id)qword_1ECD0A308;
}

+ (id)_operatorClassesForSecureCoding
{
  if (qword_1ECD0A330 != -1)
    dispatch_once(&qword_1ECD0A330, &__block_literal_global_154);
  return (id)qword_1ECD0A328;
}

+ (BOOL)_isReservedWordInParser:(id)a3
{
  if ((_qfqp2_InitializedGlobals & 1) == 0)
    _qfqp2_InitializedGlobalData();
  return objc_msgSend((id)_qfqp2_ReservedWords, "containsObject:", objc_msgSend(a3, "uppercaseString"));
}

+ (NSString)_parserableCollectionDescription:(uint64_t)a1
{
  NSMutableString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return (NSString *)CFSTR("nil");
  if (_NSIsNSString())
    return +[_NSPredicateUtilities _parserableStringDescription:]((uint64_t)_NSPredicateUtilities, (uint64_t)a2);
  if (_NSIsNSDictionary())
  {
    v5 = a2;
    v6 = objc_msgSend(a2, "allKeys");
    a2 = (void *)v6;
LABEL_11:
    v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 50);
    -[NSMutableString appendString:](v4, "appendString:", CFSTR("{"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(a2);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          if ((v9 & 1) != 0)
            -[NSMutableString appendString:](v4, "appendString:", CFSTR(", "));
          -[NSMutableString appendString:](v4, "appendString:", +[_NSPredicateUtilities _parserableCollectionDescription:](_NSPredicateUtilities, v12));
          if (v6)
          {
            -[NSMutableString appendString:](v4, "appendString:", CFSTR(" = "));
            -[NSMutableString appendString:](v4, "appendString:", +[_NSPredicateUtilities _parserableCollectionDescription:](_NSPredicateUtilities, objc_msgSend(v5, "objectForKey:", v12)));
          }
          ++v11;
          v9 = 1;
        }
        while (v8 != v11);
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v8);
    }
    -[NSMutableString appendString:](v4, "appendString:", CFSTR("}"));
    return (NSString *)v4;
  }
  if ((_NSIsNSArray() & 1) != 0)
  {
    v6 = 0;
    v5 = a2;
    goto LABEL_11;
  }
  if (_NSIsNSSet())
  {
    v5 = a2;
    a2 = (void *)objc_msgSend(a2, "allObjects");
    v6 = 0;
    goto LABEL_11;
  }
  return (NSString *)objc_msgSend(a2, "description");
}

+ (NSString)_parserableStringDescription:(uint64_t)a1
{
  NSMutableString *v3;

  objc_opt_self();
  v3 = +[NSString stringWithString:](NSMutableString, "stringWithString:", a2);
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 2, 0, -[NSString length](v3, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 2, 0, -[NSString length](v3, "length"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\"), v3);
}

+ (void)initialize
{
  if (_NSPredicateUtilities == a1 && _NSCoderGetTrustRestrictions() != 2)
  {
    _CFPredicatePolicyData_getFlags();
    _CFPredicatePolicyData_setFlags();
  }
}

- (double)distanceFromLocation:(id)a3
{
  return 0.0;
}

+ (uint64_t)_predicateSecurityAction
{
  uint64_t result;

  objc_opt_self();
  objc_opt_self();
  result = _CFPredicatePolicyData_getFlags();
  if ((result & 8) != 0 || (result = dyld_program_sdk_at_least(), (_DWORD)result))
    __break(1u);
  return result;
}

+ (uint64_t)_getITypeFor:(uint64_t)a1
{
  uint64_t v3;
  uint64_t result;

  objc_opt_self();
  if (!a2)
LABEL_13:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unknown number type or nil passed to arithmetic function expression."), 0));
  v3 = (char)*a2;
  if (v3 > 99)
  {
    result = 0;
    switch(*a2)
    {
      case 'd':
      case 'f':
        return result;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
        goto LABEL_13;
      case 'i':
      case 'l':
        return 2;
      default:
        if (v3 == 113 || v3 == 115)
          return 2;
        goto LABEL_13;
    }
  }
  if (v3 <= 80)
  {
    if (v3 != 73 && v3 != 76)
      goto LABEL_13;
    return 2;
  }
  if (v3 != 81)
  {
    if (v3 != 83)
      goto LABEL_13;
    return 2;
  }
  return 1;
}

+ (uint64_t)_getCommonTypeFor:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
  {
    v13 = 0;
    goto LABEL_23;
  }
  if (!objc_msgSend(a2, "count")
    || (_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    v24 = CFSTR("collection");
    v25[0] = a2;
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
LABEL_23:
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("Invoked mathematical function with bad collection parameter.");
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v14, v13));
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    v6 = 3;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((_NSIsNSNumber() & 1) == 0)
        {
          v11 = (void *)MEMORY[0x1E0C99DA0];
          v12 = *MEMORY[0x1E0C99778];
          v17 = CFSTR("collection");
          v18 = a2;
          v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
          v14 = CFSTR("Invoked mathematical function with non-numeric object(s) in collection.");
          v15 = v11;
          v16 = v12;
          goto LABEL_20;
        }
        v9 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(v8, "objCType"));
        if (v9 < v6)
          v6 = v9;
      }
      v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      if (!v4)
        return v6;
    }
  }
  return 3;
}

+ (id)sum:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t k;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
    && !objc_msgSend(a3, "count"))
  {
    return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0);
  }
  v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (v4 == 1)
  {
    v30 = 0uLL;
    v31 = 0uLL;
    v28 = 0uLL;
    v29 = 0uLL;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(a3);
          v14 += objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedLongLongValue");
        }
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14);
  }
  else if (v4)
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(a3);
          v19 += objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "longLongValue");
        }
        v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v19);
  }
  else
  {
    v35 = 0uLL;
    v36 = 0uLL;
    v33 = 0uLL;
    v34 = 0uLL;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      v8 = 0.0;
      do
      {
        for (k = 0; k != v6; ++k)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(a3);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "doubleValue");
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8);
  }
}

+ (id)count:(id)a3
{
  if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invoked count with non-collection parameter."), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "count"));
}

+ (id)min:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t k;
  void *v12;
  double v13;
  double v14;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invoked min with empty collection."), 0));
  v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (_NSIsNSArray())
    v5 = (void *)objc_msgSend(a3, "lastObject");
  else
    v5 = (void *)objc_msgSend(a3, "anyObject");
  if (v4 == 1)
  {
    v16 = objc_msgSend(v5, "unsignedLongLongValue");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(a3);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v21, "unsignedLongLongValue") < v16)
            v16 = objc_msgSend(v21, "unsignedLongLongValue");
        }
        v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v18);
    }
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v16);
  }
  else if (v4)
  {
    v22 = objc_msgSend(v5, "longLongValue");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(a3);
          v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v27, "longLongValue") < v22)
            v22 = objc_msgSend(v27, "longLongValue");
        }
        v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      }
      while (v24);
    }
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v22);
  }
  else
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v9; ++k)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          objc_msgSend(v12, "doubleValue");
          if (v13 < v7)
          {
            objc_msgSend(v12, "doubleValue");
            v7 = v14;
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      }
      while (v9);
    }
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7);
  }
}

+ (id)max:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t k;
  void *v12;
  double v13;
  double v14;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invoked max with empty collection."), 0));
  v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (_NSIsNSArray())
    v5 = (void *)objc_msgSend(a3, "lastObject");
  else
    v5 = (void *)objc_msgSend(a3, "anyObject");
  if (v4 == 1)
  {
    v16 = objc_msgSend(v5, "unsignedLongLongValue");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(a3);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v21, "unsignedLongLongValue") > v16)
            v16 = objc_msgSend(v21, "unsignedLongLongValue");
        }
        v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v18);
    }
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v16);
  }
  else if (v4)
  {
    v22 = objc_msgSend(v5, "longLongValue");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(a3);
          v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v27, "longLongValue") > v22)
            v22 = objc_msgSend(v27, "longLongValue");
        }
        v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      }
      while (v24);
    }
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v22);
  }
  else
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v9; ++k)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          objc_msgSend(v12, "doubleValue");
          if (v13 > v7)
          {
            objc_msgSend(v12, "doubleValue");
            v7 = v14;
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      }
      while (v9);
    }
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7);
  }
}

+ (id)average:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend(a1, "sum:");
  v5 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  if (v5 == 1)
  {
    v7 = (double)(unint64_t)objc_msgSend(v4, "unsignedLongLongValue");
  }
  else if (v5)
  {
    v7 = (double)objc_msgSend(v4, "longLongValue");
  }
  else
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
  }
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 / (double)(unint64_t)objc_msgSend(a3, "count"));
}

+ (id)median:(id)a3
{
  void *v3;
  char v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = objc_msgSend(v3, "count");
  v5 = (unint64_t)objc_msgSend(v3, "count") >> 1;
  if ((v4 & 1) != 0)
    return (id)objc_msgSend(v3, "objectAtIndex:", v5);
  v6 = (void *)objc_msgSend(v3, "objectAtIndex:", v5 - 1);
  v7 = (void *)objc_msgSend(v3, "objectAtIndex:", (unint64_t)objc_msgSend(v3, "count") >> 1);
  v8 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(v6, "objCType"));
  v9 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(v7, "objCType"));
  if (v9 <= v8)
    v10 = v8;
  else
    v10 = v9;
  if (v10 == 1)
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(objc_msgSend(v7, "unsignedLongLongValue") + objc_msgSend(v6, "unsignedLongLongValue")) >> 1);
  if (v10)
  {
    v15 = objc_msgSend(v6, "longLongValue");
    v16 = objc_msgSend(v7, "longLongValue");
    v17 = v16 + v15;
    if (v16 + v15 < 0 != __OFADD__(v16, v15))
      ++v17;
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v17 >> 1);
  }
  else
  {
    objc_msgSend(v6, "doubleValue");
    v12 = v11;
    objc_msgSend(v7, "doubleValue");
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v12 + v13) * 0.5);
  }
}

+ (id)mode:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = +[_NSPredicateUtilities _getCommonTypeFor:]((uint64_t)_NSPredicateUtilities, a3);
  v5 = (void *)objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        v14 = v9;
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!objc_msgSend(v6, "count"))
        {
          ++v10;
          objc_msgSend(v6, "addObject:", v9);
          continue;
        }
        if (v4 == 1)
        {
          v18 = objc_msgSend(v14, "unsignedLongLongValue");
          v19 = objc_msgSend(v9, "unsignedLongLongValue");
        }
        else
        {
          if (!v4)
          {
            objc_msgSend(v14, "doubleValue");
            v16 = v15;
            objc_msgSend(v9, "doubleValue");
            if (v16 != v17)
              goto LABEL_16;
            goto LABEL_10;
          }
          v18 = objc_msgSend(v14, "longLongValue");
          v19 = objc_msgSend(v9, "longLongValue");
        }
        if (v18 != v19)
        {
LABEL_16:
          v10 = 1;
          continue;
        }
LABEL_10:
        if (++v10 <= v11)
        {
          if (v10 == v11)
          {
            objc_msgSend(v6, "addObject:", v9);
            v10 = v11;
          }
        }
        else
        {
          v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
          v11 = v10;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v8);
  }
  return v6;
}

+ (id)stddev:(id)a3
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a1, "average:"), "doubleValue");
  v5 = v4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "doubleValue");
        v9 = v9 + (v5 - v11) * (v5 - v11);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(v9 / (double)(unint64_t)objc_msgSend(a3, "count")));
}

+ (id)add:(id)a3 to:(id)a4
{
  int v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = _NSIsNSDate();
  v7 = _NSIsNSNumber();
  v8 = _NSIsNSDate();
  v9 = _NSIsNSNumber();
  if (v7 && v9)
  {
    v10 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a3, "objCType"));
    v11 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a4, "objCType"));
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v12 == 1)
    {
      return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a4, "unsignedLongLongValue") + objc_msgSend(a3, "unsignedLongLongValue"));
    }
    else if (v12)
    {
      return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(a4, "longLongValue") + objc_msgSend(a3, "longLongValue"));
    }
    else
    {
      objc_msgSend(a3, "doubleValue");
      v14 = v13;
      objc_msgSend(a4, "doubleValue");
      return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14 + v15);
    }
  }
  else
  {
    if ((v6 & v9) == 1)
    {
      v17 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a3, "timeIntervalSinceReferenceDate");
      v19 = v18;
      objc_msgSend(a4, "doubleValue");
    }
    else
    {
      if ((v7 & v8) != 1)
      {
        v22 = (void *)MEMORY[0x1E0C99DA0];
        v23 = *MEMORY[0x1E0C99778];
        v24[1] = a3;
        v25 = CFSTR("Parameters");
        v24[0] = a4;
        v26[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, CFSTR("incompatible parameters passed to mathematical function"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1)));
      }
      v17 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a3, "doubleValue");
      v19 = v21;
      objc_msgSend(a4, "timeIntervalSinceReferenceDate");
    }
    return (id)objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:", v19 + v20);
  }
}

+ (id)from:(id)a3 subtract:(id)a4
{
  int v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = _NSIsNSDate();
  v7 = _NSIsNSNumber();
  v8 = _NSIsNSDate();
  v9 = _NSIsNSNumber();
  if (v7 && v9)
  {
    v10 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a3, "objCType"));
    v11 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a4, "objCType"));
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v12 == 1)
    {
      return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "unsignedLongLongValue") - objc_msgSend(a4, "unsignedLongLongValue"));
    }
    else
    {
      if (!v12)
      {
        objc_msgSend(a3, "doubleValue");
        v14 = v13;
        objc_msgSend(a4, "doubleValue");
        return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14 - v15);
      }
      return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(a3, "longLongValue") - objc_msgSend(a4, "longLongValue"));
    }
  }
  else
  {
    if ((v6 & v8) == 1)
    {
      objc_msgSend(a3, "timeIntervalSinceReferenceDate");
      v14 = v16;
      objc_msgSend(a4, "timeIntervalSinceReferenceDate");
      return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14 - v15);
    }
    if ((v6 & v9) != 1)
    {
      v22 = (void *)MEMORY[0x1E0C99DA0];
      v23 = *MEMORY[0x1E0C99778];
      v24[1] = a3;
      v25 = CFSTR("Parameters");
      v24[0] = a4;
      v26[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, CFSTR("incompatible parameters passed to mathematical function"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1)));
    }
    v18 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v20 = v19;
    objc_msgSend(a4, "doubleValue");
    return (id)objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:", v20 - v21);
  }
}

+ (id)multiply:(id)a3 by:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15[1] = a4;
    v16 = CFSTR("Parameters");
    v15[0] = a3;
    v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)));
  }
  v6 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a3, "objCType"));
  v7 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a4, "objCType"));
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8 == 1)
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a4, "unsignedLongLongValue") * objc_msgSend(a3, "unsignedLongLongValue"));
  if (v8)
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(a4, "longLongValue") * objc_msgSend(a3, "longLongValue"));
  objc_msgSend(a3, "doubleValue");
  v10 = v9;
  objc_msgSend(a4, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 * v11);
}

+ (id)divide:(id)a3 by:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21[1] = a4;
    v22 = CFSTR("Parameters");
    v21[0] = a3;
    v23[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1)));
  }
  v6 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a3, "objCType"));
  v7 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a4, "objCType"));
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8 == 1)
  {
    v13 = objc_msgSend(a3, "unsignedLongLongValue");
    v14 = objc_msgSend(a4, "unsignedLongLongValue");
    if (v14)
      v15 = v13 / v14;
    else
      v15 = 0;
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v15);
  }
  else if (v8)
  {
    v16 = objc_msgSend(a3, "longLongValue");
    v17 = objc_msgSend(a4, "longLongValue");
    if (v17)
      v18 = v16 / v17;
    else
      v18 = 0;
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v18);
  }
  else
  {
    objc_msgSend(a3, "doubleValue");
    v10 = v9;
    objc_msgSend(a4, "doubleValue");
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 / v11);
  }
}

+ (id)modulus:(id)a3 by:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  long double v10;
  long double v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21[1] = a4;
    v22 = CFSTR("Parameters");
    v21[0] = a3;
    v23[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1)));
  }
  v6 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a3, "objCType"));
  v7 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a4, "objCType"));
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8 == 1)
  {
    v13 = objc_msgSend(a3, "unsignedLongLongValue");
    v14 = objc_msgSend(a4, "unsignedLongLongValue");
    if (v14)
      v15 = v13 % v14;
    else
      v15 = 0;
    return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v15);
  }
  else if (v8)
  {
    v16 = objc_msgSend(a3, "longLongValue");
    v17 = objc_msgSend(a4, "longLongValue");
    if (v17)
      v18 = v16 % v17;
    else
      v18 = 0;
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v18);
  }
  else
  {
    objc_msgSend(a3, "doubleValue");
    v10 = v9;
    objc_msgSend(a4, "doubleValue");
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)fmod(v10, v11));
  }
}

+ (id)sqrt:(id)a3
{
  double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(v4));
}

+ (id)log:(id)a3
{
  long double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)log10(v4));
}

+ (id)ln:(id)a3
{
  long double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)log(v4));
}

+ (id)raise:(id)a3 toPower:(id)a4
{
  double v6;
  long double v7;
  long double v8;
  void *v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = a3;
    v13 = CFSTR("Parameters");
    v14[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  objc_msgSend(a4, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)pow(v7, v8));
}

+ (id)exp:(id)a3
{
  long double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)exp(v4));
}

+ (id)floor:(id)a3
{
  double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(v4));
}

+ (id)ceiling:(id)a3
{
  double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", ceil(v4));
}

+ (id)abs:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = a3;
    v11 = CFSTR("Parameters");
    v12[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)));
  }
  v4 = +[_NSPredicateUtilities _getITypeFor:]((uint64_t)_NSPredicateUtilities, (_BYTE *)objc_msgSend(a3, "objCType"));
  if (v4 == 1)
    return a3;
  if (v4 == 2)
  {
    v5 = objc_msgSend(a3, "longLongValue");
    if ((v5 & 0x8000000000000000) == 0)
      return a3;
    return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -v5);
  }
  else
  {
    objc_msgSend(a3, "doubleValue");
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fabs(v7));
  }
}

+ (id)trunc:(id)a3
{
  double v4;
  void *v6;
  uint64_t v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = a3;
    v9 = CFSTR("Parameters");
    v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, CFSTR("mathematical functions require NSNumber parameters"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  objc_msgSend(a3, "doubleValue");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", trunc(v4));
}

+ (void)_doTokenization:(const __CFLocale *)a3 locale:
{
  _BOOL4 v5;
  __CFStringTokenizer *v6;
  CFStringTokenizerTokenType Token;
  void *v8;
  NSCharacterSet *v9;
  NSCharacterSet *v10;
  CFRange CurrentTokenRange;
  void *v12;
  unsigned __int16 v14;
  uint64_t v15;
  CFRange v16;

  v5 = a3 == 0;
  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v16.length = -[__CFString length](a2, "length");
  v16.location = 0;
  v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, v16, 4 * v5, a3);
  Token = CFStringTokenizerAdvanceToNextToken(v6);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet");
  if (Token)
  {
    v10 = v9;
    do
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      if (CurrentTokenRange.location != -1)
      {
        v12 = (void *)-[__CFString substringWithRange:](a2, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
        v14 = 0;
        objc_msgSend(v12, "getCharacters:range:", &v14, 0, 1);
        if (!-[NSCharacterSet characterIsMember:](v10, "characterIsMember:", v14))
          objc_msgSend(v8, "addObject:", v12);
      }
    }
    while (CFStringTokenizerAdvanceToNextToken(v6));
  }
  CFRelease(v6);
  return v8;
}

+ (void)_processAndTokenize:(uint64_t)a3 flags:(const __CFLocale *)a4 locale:
{
  __CFString *v7;
  void *v8;

  objc_opt_self();
  if (!a3)
    return +[_NSPredicateUtilities _doTokenization:locale:]((uint64_t)_NSPredicateUtilities, a2, a4);
  v7 = +[_NSPredicateOperatorUtilities newStringFrom:usingUnicodeTransforms:](_NSPredicateOperatorUtilities, "newStringFrom:usingUnicodeTransforms:", a2, a3);
  v8 = +[_NSPredicateUtilities _doTokenization:locale:]((uint64_t)_NSPredicateUtilities, v7, a4);

  return v8;
}

+ (void)_collapseAndTokenize:(uint64_t)a3 flags:(void *)a4 locale:
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  __CFString *v12;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(a2);
      v12 = *(__CFString **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if (!_NSIsNSString())
      {

        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to tokenize : %@"), v12), 0));
      }
      v13 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, v12, a3, (const __CFLocale *)a4);
      if (v9)
        objc_msgSend(v9, "unionSet:", v13);
      else
        v9 = v13;
    }
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  }
  while (v8);
  return v9;
}

+ (id)tokenize:(id)a3 using:(id)a4
{
  __CFLocale *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a4, "rangeOfString:", CFSTR("n")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(a4, "rangeOfString:", CFSTR("N")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_9;
  }
  if (objc_msgSend(a4, "rangeOfString:", CFSTR("c")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(a4, "rangeOfString:", CFSTR("C")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a4, "rangeOfString:", CFSTR("d")) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a4, "rangeOfString:", CFSTR("D")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(a4, "rangeOfString:", CFSTR("l")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(a4, "rangeOfString:", CFSTR("L")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = +[_NSPredicateOperatorUtilities retainedLocale](_NSPredicateOperatorUtilities, "retainedLocale");
        goto LABEL_10;
      }
LABEL_9:
      v6 = 0;
LABEL_10:
      v7 = 0;
      goto LABEL_11;
    }
    v6 = 0;
    v7 = 2;
  }
  else
  {
    v6 = 0;
    v7 = 1;
  }
LABEL_11:
  if (_NSIsNSString())
  {
    v8 = +[_NSPredicateUtilities _processAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, (__CFString *)a3, v7, v6);
  }
  else
  {
    if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet())
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to tokenize : %@"), a3), 0));
    }
    v8 = +[_NSPredicateUtilities _collapseAndTokenize:flags:locale:]((uint64_t)_NSPredicateUtilities, a3, v7, v6);
  }
  v9 = v8;

  return v9;
}

+ (id)uppercase:(id)a3
{
  if ((_NSIsNSString() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't uppercase non-string"), 0));
  return (id)objc_msgSend(a3, "uppercaseString");
}

+ (id)lowercase:(id)a3
{
  if ((_NSIsNSString() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't lowercase non-string"), 0));
  return (id)objc_msgSend(a3, "lowercaseString");
}

+ (id)length:(id)a3
{
  if ((_NSIsNSString() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't apply length: to a non-string"), 0));
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
}

+ (NSNumber)_convertStringToNumber:(uint64_t)a1
{
  char *v3;
  double v4;
  NSNumber *result;
  uint64_t v6;
  NSDecimalNumber *v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (char *)objc_msgSend(a2, "UTF8String");
  v8 = 0;
  if (strchr(v3, 46))
  {
    v4 = strtod_l(v3, &v8, 0);
    if (!v8
      || v8 == v3
      || *v8
      || (result = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4)) == 0)
    {
LABEL_10:
      v7 = +[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", a2, v4, v8, v9);
      if (-[NSDecimalNumber isEqual:](v7, "isEqual:", +[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber")))
      {
        return 0;
      }
      else
      {
        return (NSNumber *)v7;
      }
    }
  }
  else
  {
    v6 = strtoll_l(v3, &v8, 0, 0);
    if (!v8)
      goto LABEL_10;
    if (v8 == v3)
      goto LABEL_10;
    if (*v8)
      goto LABEL_10;
    result = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v6);
    if (!result)
      goto LABEL_10;
  }
  return result;
}

+ (id)castObject:(id)a3 toType:(id)a4
{
  NSObject *v6;
  NSDecimalNumber *v7;
  objc_class *Superclass;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  NSObject *v12;
  Class v13;
  Class v14;
  void *v16;
  NSSymbolicExpression *v18;
  NSObject *v19;
  NSSymbolicExpression *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return a3;
  if (!objc_msgSend(CFSTR("Class"), "isEqualToString:", a4))
  {
    if ((objc_msgSend(a4, "isNSString") & 1) != 0)
    {
      v11 = (NSString *)objc_msgSend(a4, "description");
      objc_opt_self();
      if (!objc_msgSend(*(id *)(_CFPredicatePolicyData() + 16), "objectForKey:", v11))
      {
        objc_opt_self();
        v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          v31 = a4;
          v32 = 2114;
          v33 = a3;
          v34 = 2114;
          v35 = a4;
          _os_log_fault_impl(&dword_1817D9000, v12, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSExpression CAST(x,'%{public}@') is deprecated and will be removed in a future release.  '%{public}@' should not be cast into the unknown type '%{public}@'", buf, 0x20u);
        }
        objc_opt_self();
        if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
          +[_NSPredicateUtilities _predicateSecurityAction]();
      }
      v13 = NSClassFromString(v11);
      if (v13)
      {
        v14 = v13;
        if (-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", __NSStringClass))
          return (id)objc_msgSend(a3, "description");
        if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
        {
          if (_NSIsNSNumber())
          {
            v16 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(a3, "doubleValue");
            return (id)objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
          }
          if (_NSIsNSString())
            return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithNaturalLanguageString:", a3);
          if ((_NSIsNSDate() & 1) != 0)
            return a3;
        }
        else
        {
          if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
          {
            v7 = +[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", objc_msgSend(a3, "description"));
            if (!-[NSDecimalNumber isEqual:](v7, "isEqual:", +[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber")))return v7;
            goto LABEL_51;
          }
          if (!-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
          {
            if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_self()))
            {
              v18 = -[NSSymbolicExpression initWithString:]([NSSymbolicExpression alloc], "initWithString:", objc_msgSend(a3, "description"));
            }
            else
            {
              if (!class_respondsToSelector(v14, sel_initWithString_))
                goto LABEL_51;
              objc_opt_self();
              v19 = _NSOSLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543874;
                v31 = a4;
                v32 = 2114;
                v33 = a3;
                v34 = 2114;
                v35 = a4;
                _os_log_fault_impl(&dword_1817D9000, v19, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSExpression CAST(x,'%{public}@') is deprecated and will be removed in a future release.  '%{public}@' should not be cast into type '%{public}@' through initWithString", buf, 0x20u);
              }
              objc_opt_self();
              if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
                +[_NSPredicateUtilities _predicateSecurityAction]();
              v20 = (NSSymbolicExpression *)NSAllocateObject(v14, 0, 0);
              -[NSSymbolicExpression initWithString:](v20, "initWithString:", objc_msgSend(a3, "description"));
              v18 = v20;
            }
            return v18;
          }
          if (_NSIsNSDate())
          {
            objc_msgSend(a3, "timeIntervalSinceReferenceDate");
            return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          }
          if (_NSIsNSString())
          {
            v7 = (NSDecimalNumber *)+[_NSPredicateUtilities _convertStringToNumber:]((uint64_t)_NSPredicateUtilities, a3);
            if (v7)
              return v7;
          }
          else if ((_NSIsNSNumber() & 1) != 0)
          {
            return a3;
          }
        }
LABEL_51:
        v21 = (void *)MEMORY[0x1E0C99DA0];
        v22 = *MEMORY[0x1E0C99768];
        v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Don't know how to cast (%@) into type \"%@\"), a3, a4);
        v24 = v21;
        v25 = v22;
        goto LABEL_58;
      }
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v27 = *MEMORY[0x1E0C99768];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot cast to class \"%@\" which does not exist"), a4);
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v27 = *MEMORY[0x1E0C99768];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot cast to unknown class \"%@\"), a4);
    }
    v23 = v29;
    v24 = v28;
    goto LABEL_57;
  }
  objc_opt_self();
  v6 = _NSOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = a3;
    _os_log_fault_impl(&dword_1817D9000, v6, OS_LOG_TYPE_FAULT, "NSPredicate: Using NSExpression CAST(x,'Class') is deprecated and will be removed in a future release.  '%{public}@' should not be cast into a Class object", buf, 0xCu);
  }
  objc_opt_self();
  if ((_CFPredicatePolicyData_getFlags() & 8) != 0)
    +[_NSPredicateUtilities _predicateSecurityAction]();
  if (!objc_msgSend(a3, "isNSString"))
    goto LABEL_53;
  objc_opt_self();
  if (objc_msgSend((id)_CFPredicatePolicyRestrictedClasses(), "objectForKey:", a3))
  {
    +[_NSPredicateUtilities _predicateSecurityAction]();
LABEL_53:
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99768];
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot cast non string value \"%@\"), a3);
    v24 = v26;
LABEL_57:
    v25 = v27;
LABEL_58:
    objc_exception_throw((id)objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v23, 0));
  }
  v7 = (NSDecimalNumber *)NSClassFromString((NSString *)a3);
  if (v7)
  {
    objc_opt_self();
    if (!objc_msgSend(*(id *)(_CFPredicatePolicyData() + 16), "objectForKey:", a3))
    {
      Superclass = class_getSuperclass((Class)v7);
      if (Superclass)
      {
        v9 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", class_getName(Superclass));
        objc_opt_self();
        v10 = objc_msgSend((id)_CFPredicatePolicyRestrictedClasses(), "objectForKey:", v9);

        if (v10)
          +[_NSPredicateUtilities _predicateSecurityAction]();
      }
    }
  }
  return v7;
}

+ (id)random
{
  if ((_nspredicaterandomnumberseeded & 1) == 0)
  {
    srandomdev();
    _nspredicaterandomnumberseeded = 1;
  }
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)random() * 4.65661287e-10);
}

+ (id)randomn:(id)a3
{
  if ((_nspredicaterandomnumberseeded & 1) == 0)
  {
    srandomdev();
    _nspredicaterandomnumberseeded = 1;
  }
  return +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", random() % objc_msgSend(a3, "longValue"));
}

+ (id)now
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

+ (id)distanceToLocation:(id)a3 fromLocation:(id)a4
{
  void *v7;
  uint64_t v8;
  const __CFString *v9;

  if (!objc_lookUpClass("CLLocation"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    v9 = CFSTR("Can't calculate distance unless CLLocation is linked.");
LABEL_7:
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0));
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("Can't calculate distance between non-locations");
    goto LABEL_7;
  }
  objc_msgSend(a3, "distanceFromLocation:", a4);
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

+ (id)canonical:(id)a3
{
  if ((_NSIsNSString() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't canonicalize non-strings"), 0));
  return +[_NSPredicateOperatorUtilities newStringFrom:usingUnicodeTransforms:](_NSPredicateOperatorUtilities, "newStringFrom:usingUnicodeTransforms:", a3, 387);
}

+ (id)bitwiseOr:(id)a3 with:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't do bit operators on non-numbers"), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a4, "integerValue") | objc_msgSend(a3, "integerValue"));
}

+ (id)bitwiseXor:(id)a3 with:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't do bit operators on non-numbers"), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a4, "integerValue") ^ objc_msgSend(a3, "integerValue"));
}

+ (id)leftshift:(id)a3 by:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't do bit operators on non-numbers"), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "integerValue") << objc_msgSend(a4, "integerValue"));
}

+ (id)rightshift:(id)a3 by:(id)a4
{
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't do bit operators on non-numbers"), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "integerValue") >> objc_msgSend(a4, "integerValue"));
}

+ (id)onesComplement:(id)a3
{
  if ((_NSIsNSNumber() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't do bit operators on non-numbers"), 0));
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", ~objc_msgSend(a3, "integerValue"));
}

+ (id)noindex:(id)a3
{
  return a3;
}

+ (id)indexed:(id)a3 by:(id)a4
{
  return a3;
}

+ (id)distinct:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Distinct is only supported for CoreData/SQLite external stores"), 0));
}

+ (id)inverseOrderKey:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("inverseOrderKey: is an internal-only function"), 0));
}

+ (id)_predicateClassesForSecureCoding
{
  if (qword_1ECD0A2F0 != -1)
    dispatch_once(&qword_1ECD0A2F0, &__block_literal_global_59);
  return (id)_MergedGlobals_133;
}

@end
