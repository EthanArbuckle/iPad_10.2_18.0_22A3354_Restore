@implementation NSTernaryExpression

- (NSTernaryExpression)initWithPredicate:(id)a3 trueExpression:(id)a4 falseExpression:(id)a5
{
  NSTernaryExpression *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSTernaryExpression;
  v8 = -[NSExpression initWithExpressionType:](&v10, sel_initWithExpressionType_, 20);
  if (v8)
  {
    v8->_predicate = (NSPredicate *)a3;
    v8->_trueExpression = (NSExpression *)a4;
    v8->_falseExpression = (NSExpression *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_predicate = 0;
  self->_trueExpression = 0;

  self->_falseExpression = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSTernaryExpression;
  -[NSTernaryExpression dealloc](&v3, sel_dealloc);
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      objc_msgSend(a3, "visitPredicateExpression:", self);
      objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "acceptVisitor:flags:", a3, a4);
    }
    else
    {
      objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(a3, "visitPredicateExpression:", self);
    }
  }
}

- (id)trueExpression
{
  return self->_trueExpression;
}

- (id)predicate
{
  return self->_predicate;
}

- (id)falseExpression
{
  return self->_falseExpression;
}

- (unint64_t)expressionType
{
  return 20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)allowEvaluation
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSPredicate allowEvaluation](self->_predicate, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_trueExpression, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_falseExpression, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)NSTernaryExpression;
  -[NSExpression allowEvaluation](&v3, sel_allowEvaluation);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSTernaryExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTernaryExpression predicate](self, "predicate"), CFSTR("NSPredicate"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTernaryExpression trueExpression](self, "trueExpression"), CFSTR("NSTrueExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSTernaryExpression falseExpression](self, "falseExpression"), CFSTR("NSFalseExpression"));
}

- (NSTernaryExpression)initWithCoder:(id)a3
{
  NSTernaryExpression *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v13.receiver = self;
  v13.super_class = (Class)NSTernaryExpression;
  v5 = -[NSExpression initWithCoder:](&v13, sel_initWithCoder_, a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "allowedClasses");
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding"));
      v9 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v9, "unionSet:", +[_NSPredicateUtilities _predicateClassesForSecureCoding](_NSPredicateUtilities, "_predicateClassesForSecureCoding"));
    }
    else
    {
      v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding");
      v9 = +[_NSPredicateUtilities _predicateClassesForSecureCoding](_NSPredicateUtilities, "_predicateClassesForSecureCoding");
    }
    v5->_predicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v9, CFSTR("NSPredicate"));
    v5->_trueExpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSTrueExpression"));
    v5->_falseExpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSFalseExpression"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = 0;
          if (!v7)
          {
LABEL_16:
            if (v10)
            {

              objc_exception_throw(v10);
            }
            return v5;
          }
LABEL_15:

          goto LABEL_16;
        }
        v11 = CFSTR("Malformed ternary expression (bad subpredicate)");
      }
      else
      {
        v11 = CFSTR("Malformed ternary expression (bad false expression)");
      }
    }
    else
    {
      v11 = CFSTR("Malformed ternary expression (bad true expression)");
    }
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v11, 0);
    if (!v7)
      goto LABEL_16;
    goto LABEL_15;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(-[NSTernaryExpression predicate](self, "predicate", a3), "copy");
  v5 = (void *)objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "copy");
  v6 = (void *)objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "copy");
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredicate:trueExpression:falseExpression:", v4, v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;

  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSTernaryExpression expressionType](self, "expressionType"), v5 == objc_msgSend(a3, "expressionType"))
    && objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "isEqual:", objc_msgSend(a3, "predicate"))&& objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "isEqual:", objc_msgSend(a3, "trueExpression")))
  {
    return objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "isEqual:", objc_msgSend(a3, "falseExpression"));
  }
  else
  {
    return 0;
  }
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TERNARY(%@, %@, %@)"), objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "predicateFormat"), objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "predicateFormat"), objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "predicateFormat"));
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  return -[NSTernaryExpression initWithPredicate:trueExpression:falseExpression:]([NSTernaryExpression alloc], "initWithPredicate:trueExpression:falseExpression:", objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "predicateWithSubstitutionVariables:", a3), objc_msgSend(-[NSTernaryExpression trueExpression](self, "trueExpression"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSTernaryExpression falseExpression](self, "falseExpression"), "_expressionWithSubstitutionVariables:", a3));
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  id v7;

  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This expression has evaluation disabled"), 0));
  if (objc_msgSend(-[NSTernaryExpression predicate](self, "predicate"), "evaluateWithObject:substitutionVariables:", a3, a4))v7 = -[NSTernaryExpression trueExpression](self, "trueExpression");
  else
    v7 = -[NSTernaryExpression falseExpression](self, "falseExpression");
  return (id)objc_msgSend(v7, "expressionValueWithObject:context:", a3, a4);
}

@end
