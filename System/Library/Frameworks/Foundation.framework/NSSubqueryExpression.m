@implementation NSSubqueryExpression

- (void)allowEvaluation
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSExpression allowEvaluation](self->_collection, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_variableExpression, "allowEvaluation");
  -[NSPredicate allowEvaluation](self->_subpredicate, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)NSSubqueryExpression;
  -[NSExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (unint64_t)expressionType
{
  return 13;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSubqueryExpression;
  -[NSSubqueryExpression dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)-[NSExpression copy](self->_collection, "copy", a3);
  v5 = (void *)-[NSExpression copy](self->_variableExpression, "copy");
  v6 = (void *)-[NSPredicate copy](self->_subpredicate, "copy");
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpression:usingIteratorExpression:predicate:", v4, v5, v6);

  return v7;
}

- (NSSubqueryExpression)initWithExpression:(id)a3 usingIteratorVariable:(id)a4 predicate:(id)a5
{
  NSVariableExpression *v8;
  NSSubqueryExpression *v9;

  if (!a4 || !a5)
  {
    -[NSSubqueryExpression dealloc](self, "dealloc", a3);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSSubqueryExpression must be initialized with non-nil variable name and expression."), 0));
  }
  v8 = -[NSVariableExpression initWithObject:]([NSVariableExpression alloc], "initWithObject:", a4);
  v9 = -[NSSubqueryExpression initWithExpression:usingIteratorExpression:predicate:](self, "initWithExpression:usingIteratorExpression:predicate:", a3, v8, a5);

  return v9;
}

- (NSSubqueryExpression)initWithExpression:(id)a3 usingIteratorExpression:(id)a4 predicate:(id)a5
{
  NSSubqueryExpression *v8;
  NSSubqueryExpression *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSSubqueryExpression;
  v8 = -[NSExpression initWithExpressionType:](&v11, sel_initWithExpressionType_, 13);
  v9 = v8;
  if (!a4 || !a5)
  {
    -[NSSubqueryExpression dealloc](v8, "dealloc");
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSSubqueryExpression must be initialized with non-nil variable name and expression."), 0));
  }
  v8->_collection = (NSExpression *)a3;
  v9->_variableExpression = (NSExpression *)a4;
  v9->_subpredicate = (NSPredicate *)a5;
  return v9;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("This expression has evaluation disabled");
    goto LABEL_24;
  }
  v7 = objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "expressionValueWithObject:context:", a3, a4);
  if (!v7)
    return 0;
  v8 = (void *)v7;
  if ((_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && !_NSIsNSOrderedSet())
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("Can't perform collection evaluate with non-collection object.");
LABEL_24:
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0));
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = v8;
  v23 = (void *)objc_msgSend(a4, "objectForKey:", -[NSSubqueryExpression variable](self, "variable"));
  v11 = v23;
  v12 = a4;
  if (!a4)
    v12 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v8);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "setObject:forKey:", v17, -[NSSubqueryExpression variable](self, "variable"));
        if (objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "evaluateWithObject:substitutionVariables:", a3, v12))objc_msgSend(v9, "addObject:", v17);
      }
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v14);
  }
  v18 = -[NSSubqueryExpression variable](self, "variable");
  if (v23)
    objc_msgSend(a4, "setObject:forKey:", v23, v18);
  else
    objc_msgSend(a4, "removeObjectForKey:", v18);

  return v9;
}

- (id)predicate
{
  return self->_subpredicate;
}

- (id)variable
{
  return (id)objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "variable");
}

- (id)variableExpression
{
  return self->_variableExpression;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      objc_msgSend(a3, "visitPredicateExpression:", self);
      objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
    }
    else
    {
      objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(a3, "visitPredicateExpression:", self);
    }
  }
}

- (id)collection
{
  return self->_collection;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSSubqueryExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSubqueryExpression collection](self, "collection"), CFSTR("NSExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSubqueryExpression variable](self, "variable"), CFSTR("NSVariable"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSubqueryExpression predicate](self, "predicate"), CFSTR("NSSubpredicate"));
}

- (NSSubqueryExpression)initWithCoder:(id)a3
{
  NSSubqueryExpression *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSVariableExpression *v11;
  void *v12;
  const __CFString *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v15.receiver = self;
  v15.super_class = (Class)NSSubqueryExpression;
  v5 = -[NSExpression initWithCoder:](&v15, sel_initWithCoder_, a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "allowedClasses");
    v7 = v6;
    if (v6)
    {
      v8 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding"));
      v9 = (id)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v9, "unionSet:", +[_NSPredicateUtilities _predicateClassesForSecureCoding](_NSPredicateUtilities, "_predicateClassesForSecureCoding"));
    }
    else
    {
      v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding");
      v9 = +[_NSPredicateUtilities _predicateClassesForSecureCoding](_NSPredicateUtilities, "_predicateClassesForSecureCoding");
    }
    v5->_collection = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSExpression"));
    v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSVariable"));
    v11 = -[NSVariableExpression initWithObject:]([NSVariableExpression alloc], "initWithObject:", v10);
    v5->_variableExpression = &v11->super;
    *(_DWORD *)&v11->super._expressionFlags |= 1u;
    v5->_subpredicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v9, CFSTR("NSSubpredicate"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v10)
        {
          v12 = 0;
          if (!v7)
          {
LABEL_16:
            if (v12)
            {

              objc_exception_throw(v12);
            }
            return v5;
          }
LABEL_15:

          goto LABEL_16;
        }
        v13 = CFSTR("Malformed subquery expression (bad variable)");
      }
      else
      {
        v13 = CFSTR("Malformed subquery expression (bad subpredicate)");
      }
    }
    else
    {
      v13 = CFSTR("Malformed subquery expression (bad collection)");
    }
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v13, 0);
    if (!v7)
      goto LABEL_16;
    goto LABEL_15;
  }
  return v5;
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SUBQUERY(%@, %@, %@)"), objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "description"), objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "description"), objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "description"));
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(-[NSSubqueryExpression variable](self, "variable"), "isEqual:", objc_msgSend(a3, "variable")))
  {
    return objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "isEqual:", objc_msgSend(a3, "predicate"));
  }
  else
  {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(-[NSSubqueryExpression variable](self, "variable"), "hash");
  return objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "hash") ^ v3;
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpression:usingIteratorExpression:predicate:", objc_msgSend(-[NSSubqueryExpression collection](self, "collection"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSSubqueryExpression variableExpression](self, "variableExpression"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSSubqueryExpression predicate](self, "predicate"), "predicateWithSubstitutionVariables:", a3));
}

- (BOOL)_shouldUseParensWithDescription
{
  return 0;
}

@end
