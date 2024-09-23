@implementation NSSetExpression

- (NSSetExpression)initWithType:(unint64_t)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  NSSetExpression *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSSetExpression;
  v7 = -[NSExpression initWithExpressionType:](&v9, sel_initWithExpressionType_, a3);
  if (v7)
  {
    v7->_left = (NSExpression *)a4;
    v7->_right = (NSExpression *)a5;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_left = 0;
  self->_right = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSetExpression;
  -[NSSetExpression dealloc](&v3, sel_dealloc);
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
  -[NSExpression allowEvaluation](self->_left, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_right, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)NSSetExpression;
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
  v5.super_class = (Class)NSSetExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSetExpression leftExpression](self, "leftExpression"), CFSTR("NSLeftExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSetExpression rightExpression](self, "rightExpression"), CFSTR("NSRightExpression"));
}

- (NSSetExpression)initWithCoder:(id)a3
{
  NSSetExpression *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const __CFString *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v12.receiver = self;
  v12.super_class = (Class)NSSetExpression;
  v5 = -[NSExpression initWithCoder:](&v12, sel_initWithCoder_, a3);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "allowedClasses");
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding"));
    }
    else
    {
      v8 = +[_NSPredicateUtilities _expressionClassesForSecureCoding](_NSPredicateUtilities, "_expressionClassesForSecureCoding");
    }
    v5->_left = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSLeftExpression"));
    v5->_right = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSRightExpression"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = 0;
        if (!v7)
        {
LABEL_14:
          if (v9)
          {

            objc_exception_throw(v9);
          }
          return v5;
        }
LABEL_13:

        goto LABEL_14;
      }
      v10 = CFSTR("Malformed set expression (bad right hand side)");
    }
    else
    {
      v10 = CFSTR("Malformed set expression (bad left hand side)");
    }
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v10, 0);
    if (!v7)
      goto LABEL_14;
    goto LABEL_13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  NSSetExpression *v6;

  v4 = (void *)objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression", a3), "copy");
  v5 = (void *)objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "copy");
  v6 = -[NSSetExpression initWithType:leftExpression:rightExpression:]([NSSetExpression alloc], "initWithType:leftExpression:rightExpression:", -[NSExpression expressionType](self, "expressionType"), v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSExpressionType v5;

  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSExpression expressionType](self, "expressionType"), v5 == objc_msgSend(a3, "expressionType"))
    && objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "isEqual:", objc_msgSend(a3, "leftExpression")))
  {
    return objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "isEqual:", objc_msgSend(a3, "rightExpression"));
  }
  else
  {
    return 0;
  }
}

- (id)predicateFormat
{
  NSExpressionType v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[NSExpression expressionType](self, "expressionType");
  v4 = CFSTR("MINUS");
  if (v3 == NSIntersectSetExpressionType)
    v4 = CFSTR("INTERSECT");
  if (v3 == NSUnionSetExpressionType)
    v5 = CFSTR("UNION");
  else
    v5 = v4;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@"), objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "predicateFormat"), v5, objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "predicateFormat"));
}

- (id)leftExpression
{
  return self->_left;
}

- (id)rightExpression
{
  return self->_right;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      objc_msgSend(a3, "visitPredicateExpression:", self);
      objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "acceptVisitor:flags:", a3, a4);
    }
    else
    {
      objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "acceptVisitor:flags:", a3, a4);
      objc_msgSend(a3, "visitPredicateExpression:", self);
    }
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  return -[NSSetExpression initWithType:leftExpression:rightExpression:]([NSSetExpression alloc], "initWithType:leftExpression:rightExpression:", -[NSExpression expressionType](self, "expressionType"), objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "_expressionWithSubstitutionVariables:", a3));
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSExpressionType v16;
  void *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *v25;

  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = (NSString *)CFSTR("This expression has evaluation disabled");
    goto LABEL_33;
  }
  v7 = (id)objc_msgSend((id)objc_msgSend(-[NSSetExpression leftExpression](self, "leftExpression"), "expressionValueWithObject:context:", a3, a4), "mutableCopy");
  v8 = (void *)objc_msgSend(-[NSSetExpression rightExpression](self, "rightExpression"), "expressionValueWithObject:context:", a3, a4);
  if ((_NSIsNSSet() & 1) == 0)
  {
    if (_NSIsNSArray())
    {
      v9 = (void *)MEMORY[0x1E0C99E20];
      v10 = (uint64_t)v7;
    }
    else
    {
      if (!_NSIsNSOrderedSet())
      {
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = *MEMORY[0x1E0C99778];
        v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't evaluate set expression; left subexpression not a set (lhs = %@ rhs = %@)"),
                v7,
                v8);
        goto LABEL_32;
      }
      v11 = (void *)MEMORY[0x1E0C99E20];
      v10 = objc_msgSend(v7, "array");
      v9 = v11;
    }
    v7 = (id)objc_msgSend(v9, "setWithArray:", v10);
  }
  if (v8 && (_NSIsNSSet() & 1) == 0)
  {
    if (_NSIsNSArray())
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = v8;
LABEL_17:
      v8 = (void *)objc_msgSend(v12, "setWithArray:", v13);
      goto LABEL_18;
    }
    if (_NSIsNSOrderedSet())
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_msgSend(v8, "array");
LABEL_16:
      v13 = (void *)v15;
      v12 = v14;
      goto LABEL_17;
    }
    if (_NSIsNSDictionary())
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_msgSend(v8, "allValues");
      goto LABEL_16;
    }
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't evaluate set expression; right subexpression not a set (lhs = %@ rhs = %@)"),
            v7,
            v8);
LABEL_32:
    v20 = v25;
    v18 = v23;
    v19 = v24;
    goto LABEL_33;
  }
LABEL_18:
  v16 = -[NSExpression expressionType](self, "expressionType");
  switch(v16)
  {
    case NSMinusSetExpressionType:
      if (v8)
        objc_msgSend(v7, "minusSet:", v8);
      break;
    case NSIntersectSetExpressionType:
      if (v8)
        objc_msgSend(v7, "intersectSet:", v8);
      break;
    case NSUnionSetExpressionType:
      if (v8)
        objc_msgSend(v7, "unionSet:", v8);
      return v7;
    default:
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't evaluate set expression; unknown expression type (%lu)"),
              v16);
      v18 = v21;
      v19 = v22;
LABEL_33:
      objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
  }
  return v7;
}

@end
