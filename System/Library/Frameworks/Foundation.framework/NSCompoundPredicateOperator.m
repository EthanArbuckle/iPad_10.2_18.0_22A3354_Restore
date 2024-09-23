@implementation NSCompoundPredicateOperator

- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4 substitutionVariables:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v8 == 2)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (!v9)
      return v9;
    v10 = v9;
    v11 = *(_QWORD *)v25;
LABEL_7:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(a3);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "evaluateWithObject:substitutionVariables:", a4, a5) & 1) != 0)
        goto LABEL_23;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        LOBYTE(v9) = 0;
        if (v10)
          goto LABEL_7;
        return v9;
      }
    }
  }
  if (v8 != 1)
  {
    if (v8)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Bad compound predicate predicateOperator type"), 0));
    LOBYTE(v9) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "evaluateWithObject:substitutionVariables:", a4, a5) ^ 1;
    return v9;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (!v13)
  {
LABEL_23:
    LOBYTE(v9) = 1;
    return v9;
  }
  v14 = v13;
  v15 = *(_QWORD *)v20;
LABEL_16:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v15)
      objc_enumerationMutation(a3);
    LODWORD(v9) = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "evaluateWithObject:substitutionVariables:", a4, a5);
    if (!(_DWORD)v9)
      return v9;
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      LOBYTE(v9) = 1;
      if (v14)
        goto LABEL_16;
      return v9;
    }
  }
}

+ (id)andPredicateOperator
{
  return (id)_MergedGlobals_94;
}

+ (id)orPredicateOperator
{
  return (id)qword_1ECD09B98;
}

- (id)symbol
{
  unint64_t v2;

  v2 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v2 >= 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("expressionValueWithObject: must be called on a subclass of NSExpression"), 0));
  return off_1E0F4D020[v2];
}

+ (id)notPredicateOperator
{
  return (id)qword_1ECD09BA0;
}

+ (void)initialize
{
  if (NSCompoundPredicateOperator == a1)
  {
    _MergedGlobals_94 = -[NSPredicateOperator initWithOperatorType:]([NSCompoundPredicateOperator alloc], "initWithOperatorType:", 1);
    qword_1ECD09B98 = -[NSPredicateOperator initWithOperatorType:]([NSCompoundPredicateOperator alloc], "initWithOperatorType:", 2);
    qword_1ECD09BA0 = -[NSPredicateOperator initWithOperatorType:]([NSCompoundPredicateOperator alloc], "initWithOperatorType:", 0);
  }
}

- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4
{
  return -[NSCompoundPredicateOperator evaluatePredicates:withObject:substitutionVariables:](self, "evaluatePredicates:withObject:substitutionVariables:", a3, a4, 0);
}

@end
