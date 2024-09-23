@implementation NSComparisonPredicate

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  void *v7;
  id *v8;
  objc_class *v9;
  NSExpression *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t StatusReg;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[NSPredicate _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This predicate has evaluation disabled"), 0));
  v7 = (void *)MEMORY[0x186DA8F78]();
  if (!a4 || (v8 = (id *)a4, object_getClass(a4) != (Class)_NSNestedDictionary))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (objc_class *)objc_opt_class();
    v8 = (id *)&v19;
    object_setClass(&v19, v9);
    *(_QWORD *)&v20 = a4;
  }
  v10 = -[NSComparisonPredicate leftExpression](self, "leftExpression", v19, v20, v21, v22, v23, v24);
  v11 = -[NSComparisonPredicate predicateOperator](self, "predicateOperator");
  v12 = objc_msgSend(v11, "operatorType");
  if (v12 == 11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = 4211063755;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = -[NSExpression expressionValueWithObject:context:](v10, "expressionValueWithObject:context:", a3, v8);
  v15 = -[NSExpression expressionValueWithObject:context:](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "expressionValueWithObject:context:", a3, v8);
  if (v12 == 11)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(_QWORD *)(StatusReg + 704) = v13;
    v17 = objc_msgSend(v11, "performOperationUsingObject:andObject:", v14, v15);
    *(_QWORD *)(StatusReg + 704) = 0;
  }
  else
  {
    v17 = objc_msgSend(v11, "performOperationUsingObject:andObject:", v14, v15);
  }
  if (v8 != a4)

  objc_autoreleasePoolPop(v7);
  return v17;
}

- (id)predicateOperator
{
  return self->_predicateOperator;
}

- (NSExpression)leftExpression
{
  return self->_lhs;
}

- (NSExpression)rightExpression
{
  return self->_rhs;
}

- (NSPredicateOperatorType)predicateOperatorType
{
  return objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "operatorType");
}

- (NSComparisonPredicateOptions)options
{
  return objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "options");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator", a3), "copy");
  v5 = (void *)-[NSExpression copy](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "copy");
  v6 = (void *)-[NSExpression copy](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "copy");
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredicateOperator:leftExpression:rightExpression:", v4, v5, v6);

  return v7;
}

- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options
{
  id v10;
  NSComparisonPredicate *v11;

  v10 = +[NSPredicateOperator _newOperatorWithType:modifier:options:](NSPredicateOperator, "_newOperatorWithType:modifier:options:", type, modifier, options);
  v11 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:](self, "initWithPredicateOperator:leftExpression:rightExpression:", v10, lhs, rhs);

  return v11;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  NSComparisonPredicate *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot create a comparison predicate with nil operator or expression."), 0));
  }
  v10.receiver = self;
  v10.super_class = (Class)NSComparisonPredicate;
  v8 = -[NSComparisonPredicate init](&v10, sel_init);
  if (v8)
  {
    v8->_predicateOperator = (NSPredicateOperator *)a3;
    v8->_lhs = (NSExpression *)a4;
    v8->_rhs = (NSExpression *)a5;
  }
  return v8;
}

- (void)allowEvaluation
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSExpression allowEvaluation](self->_lhs, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_rhs, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)NSComparisonPredicate;
  -[NSPredicate allowEvaluation](&v3, sel_allowEvaluation);
}

- (NSComparisonPredicate)initWithCoder:(NSCoder *)coder
{
  NSComparisonPredicate *v5;
  NSSet *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v13.receiver = self;
  v13.super_class = (Class)NSComparisonPredicate;
  v5 = -[NSPredicate initWithCoder:](&v13, sel_initWithCoder_, coder);
  if (v5)
  {
    v6 = -[NSCoder allowedClasses](coder, "allowedClasses");
    v7 = -[NSSet count](v6, "count");
    if (v7)
    {
      v8 = (id)-[NSSet mutableCopy](v6, "mutableCopy");
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding"));
      v9 = (id)-[NSSet mutableCopy](v6, "mutableCopy");
      objc_msgSend(v9, "unionSet:", +[_NSPredicateUtilities _operatorClassesForSecureCoding](_NSPredicateUtilities, "_operatorClassesForSecureCoding"));
    }
    else
    {
      v8 = +[_NSPredicateUtilities _extendedExpressionClassesForSecureCoding](_NSPredicateUtilities, "_extendedExpressionClassesForSecureCoding");
      v9 = +[_NSPredicateUtilities _operatorClassesForSecureCoding](_NSPredicateUtilities, "_operatorClassesForSecureCoding");
    }
    v5->_lhs = (NSExpression *)-[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSLeftExpression"));
    v5->_rhs = (NSExpression *)-[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSRightExpression"));
    v5->_predicateOperator = (NSPredicateOperator *)-[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", v9, CFSTR("NSPredicateOperator"));
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
        v11 = CFSTR("Malformed comparison predicate (bad operator)");
      }
      else
      {
        v11 = CFSTR("Malformed comparison predicate (bad right expression)");
      }
    }
    else
    {
      v11 = CFSTR("Malformed comparison predicate (bad left expression)");
    }
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v11, 0);
    if (!v7)
      goto LABEL_16;
    goto LABEL_15;
  }
  return v5;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  void *v7;

  v7 = (void *)MEMORY[0x186DA8F78](self, a2);
  if ((a4 & 4) != 0)
    objc_msgSend(a3, "visitPredicate:", self);
  if ((a4 & 0xA) == 0xA)
    -[NSComparisonPredicate _acceptOperator:flags:](self, "_acceptOperator:flags:", a3, a4);
  if ((a4 & 1) != 0)
    -[NSComparisonPredicate _acceptExpressions:flags:](self, "_acceptExpressions:flags:", a3, a4);
  if ((a4 & 0xA) == 2)
    -[NSComparisonPredicate _acceptOperator:flags:](self, "_acceptOperator:flags:", a3, a4);
  if ((a4 & 4) == 0)
    objc_msgSend(a3, "visitPredicate:", self);
  objc_autoreleasePoolPop(v7);
}

- (void)_acceptExpressions:(id)a3 flags:(unint64_t)a4
{
  -[NSExpression acceptVisitor:flags:](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "acceptVisitor:flags:", a3, a4);
  -[NSExpression acceptVisitor:flags:](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "acceptVisitor:flags:", a3, a4);
}

- (void)_acceptOperator:(id)a3 flags:(unint64_t)a4
{
  objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "acceptVisitor:flags:", a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "isEqual:", objc_msgSend(a3, "predicateOperator"))&& -[NSExpression isEqual:](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "isEqual:", objc_msgSend(a3, "leftExpression")))
  {
    return -[NSExpression isEqual:](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "isEqual:", objc_msgSend(a3, "rightExpression"));
  }
  else
  {
    return 0;
  }
}

- (id)predicateFormat
{
  NSString *v3;
  const __CFString *v4;
  NSComparisonPredicateModifier v5;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@"), -[NSComparisonPredicate leftExpression](self, "leftExpression"), -[NSComparisonPredicate predicateOperator](self, "predicateOperator"), -[NSComparisonPredicate rightExpression](self, "rightExpression"));
  if (-[NSComparisonPredicate comparisonPredicateModifier](self, "comparisonPredicateModifier") == NSAllPredicateModifier)
  {
    v4 = CFSTR("ALL ");
  }
  else
  {
    v5 = -[NSComparisonPredicate comparisonPredicateModifier](self, "comparisonPredicateModifier");
    v4 = &stru_1E0F56070;
    if (v5 == NSAnyPredicateModifier)
      v4 = CFSTR("ANY ");
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, v3);
}

- (NSComparisonPredicateModifier)comparisonPredicateModifier
{
  return objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "modifier");
}

- (void)setPredicateOperator:(id)a3
{
  NSPredicateOperator *predicateOperator;

  predicateOperator = self->_predicateOperator;
  if (predicateOperator != a3)
  {

    self->_predicateOperator = (NSPredicateOperator *)a3;
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_lhs = 0;
  self->_rhs = 0;

  self->_predicateOperator = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSComparisonPredicate;
  -[NSComparisonPredicate dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSComparisonPredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSComparisonPredicate leftExpression](self, "leftExpression"), CFSTR("NSLeftExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSComparisonPredicate rightExpression](self, "rightExpression"), CFSTR("NSRightExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSComparisonPredicate predicateOperator](self, "predicateOperator"), CFSTR("NSPredicateOperator"));
}

+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs modifier:(NSComparisonPredicateModifier)modifier type:(NSPredicateOperatorType)type options:(NSComparisonPredicateOptions)options
{
  return (NSComparisonPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLeftExpression:rightExpression:modifier:type:options:", lhs, rhs, modifier, type, options);
}

- (NSComparisonPredicate)predicateWithSubstitutionVariables:(id)a3
{
  void *v5;
  void *v6;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  v5 = (void *)MEMORY[0x186DA8F78](self, a2);
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredicateOperator:leftExpression:rightExpression:", -[NSComparisonPredicate predicateOperator](self, "predicateOperator"), -[NSExpression _expressionWithSubstitutionVariables:](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "_expressionWithSubstitutionVariables:", a3), -[NSExpression _expressionWithSubstitutionVariables:](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "_expressionWithSubstitutionVariables:", a3));
  objc_autoreleasePoolPop(v5);
  return (NSComparisonPredicate *)v6;
}

- (SEL)customSelector
{
  return (SEL)objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "selector");
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(-[NSComparisonPredicate predicateOperator](self, "predicateOperator"), "hash");
  v4 = -[NSExpression hash](-[NSComparisonPredicate leftExpression](self, "leftExpression"), "hash") ^ v3;
  return v4 ^ -[NSExpression hash](-[NSComparisonPredicate rightExpression](self, "rightExpression"), "hash");
}

+ (NSComparisonPredicate)predicateWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector
{
  return (NSComparisonPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLeftExpression:rightExpression:customSelector:", lhs, rhs, selector);
}

- (NSComparisonPredicate)initWithLeftExpression:(NSExpression *)lhs rightExpression:(NSExpression *)rhs customSelector:(SEL)selector
{
  NSCustomPredicateOperator *v8;
  NSComparisonPredicate *v9;

  v8 = -[NSCustomPredicateOperator initWithCustomSelector:modifier:]([NSCustomPredicateOperator alloc], "initWithCustomSelector:modifier:", selector, 0);
  v9 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:](self, "initWithPredicateOperator:leftExpression:rightExpression:", v8, lhs, rhs);

  return v9;
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5
{
  return (NSComparisonPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPredicateOperator:leftKeyPath:rightValue:", a3, a4, a5);
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5
{
  return (NSComparisonPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPredicateOperator:leftKeyPath:rightKeyPath:", a3, a4, a5);
}

+ (NSComparisonPredicate)predicateWithPredicateOperator:(id)a3 leftExpression:(id)a4 rightExpression:(id)a5
{
  return (NSComparisonPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPredicateOperator:leftExpression:rightExpression:", a3, a4, a5);
}

- (id)keyPathExpressionForString:(id)a3
{
  return +[NSExpression _newKeyPathExpressionForString:](NSExpression, "_newKeyPathExpressionForString:", a3);
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightKeyPath:(id)a5
{
  NSKeyPathExpression *v8;
  NSKeyPathExpression *v9;
  NSComparisonPredicate *v10;

  v8 = -[NSKeyPathExpression initWithKeyPath:]([NSKeyPathExpression alloc], "initWithKeyPath:", -[NSComparisonPredicate keyPathExpressionForString:](self, "keyPathExpressionForString:", a4));
  v9 = -[NSKeyPathExpression initWithKeyPath:]([NSKeyPathExpression alloc], "initWithKeyPath:", -[NSComparisonPredicate keyPathExpressionForString:](self, "keyPathExpressionForString:", a5));
  v10 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:](self, "initWithPredicateOperator:leftExpression:rightExpression:", a3, v8, v9);

  return v10;
}

- (NSComparisonPredicate)initWithPredicateOperator:(id)a3 leftKeyPath:(id)a4 rightValue:(id)a5
{
  NSKeyPathExpression *v8;
  NSConstantValueExpression *v9;
  NSComparisonPredicate *v10;

  v8 = -[NSKeyPathExpression initWithKeyPath:]([NSKeyPathExpression alloc], "initWithKeyPath:", -[NSComparisonPredicate keyPathExpressionForString:](self, "keyPathExpressionForString:", a4));
  v9 = -[NSConstantValueExpression initWithObject:]([NSConstantValueExpression alloc], "initWithObject:", a5);
  v10 = -[NSComparisonPredicate initWithPredicateOperator:leftExpression:rightExpression:](self, "initWithPredicateOperator:leftExpression:rightExpression:", a3, v8, v9);

  return v10;
}

- (id)generateMetadataDescription
{
  NSPredicateOperatorType v3;
  unint64_t v4;
  NSExpression *v5;
  uint64_t v6;
  const __CFString *v7;
  NSString *v8;
  NSExpression *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  const char *v25;
  const char *v26;
  const char *v27;
  id result;
  uint64_t v29;

  v3 = -[NSComparisonPredicate predicateOperatorType](self, "predicateOperatorType");
  v4 = v3;
  if (v3 > NSCustomSelectorPredicateOperatorType)
  {
    if (v3 - 99 >= 2)
    {
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown type of NSComparisonPredicate given to NSMetadataQuery (%@)"), self);
      goto LABEL_78;
    }
  }
  else if (((1 << v3) & 0x7BF) == 0)
  {
    if (v3 == NSMatchesPredicateOperatorType)
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSMatchesPredicateOperatorType NSComparisonPredicate not allowed to NSMetadataQuery (%@)"), self);
    else
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSCustomSelectorPredicateOperatorType NSComparisonPredicate not allowed to NSMetadataQuery (%@)"), self);
    goto LABEL_78;
  }
  v5 = -[NSComparisonPredicate leftExpression](self, "leftExpression");
  v6 = -[NSExpression expressionType](v5, "expressionType");
  if (v6 != 3)
  {
    if (v6 == 15)
    {
      v7 = CFSTR("*");
      switch(v4)
      {
        case 0uLL:
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSLessThanPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        case 1uLL:
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSLessThanOrEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        case 2uLL:
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSGreaterThanPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        case 3uLL:
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSGreaterThanOrEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        case 5uLL:
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSNotEqualToPredicateOperatorType and left ANYKEY specifier expression given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        default:
          goto LABEL_8;
      }
    }
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with left expression which is not NSKeyPathExpressionType or NSAnyKeyExpressionType given to NSMetadataQuery (%@)"), self);
LABEL_78:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  v7 = -[NSExpression keyPath](v5, "keyPath");
LABEL_8:
  v9 = -[NSComparisonPredicate rightExpression](self, "rightExpression");
  v10 = -[NSExpression expressionType](v9, "expressionType");
  if (v10 && v10 != 14)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with right expression which is not NSConstantValueExpressionType or NSAggregateExpressionType given to NSMetadataQuery (%@)"), self);
    goto LABEL_78;
  }
  v11 = -[NSExpression constantValue](v9, "constantValue");
  if (_NSIsNSString())
  {
    v12 = "*";
    v13 = 4;
    v14 = v4 - 7;
    v15 = "*";
    v16 = "";
    v17 = "";
    switch(v14)
    {
      case 0uLL:
        goto LABEL_34;
      case 1uLL:
        v15 = "";
        v13 = 4;
        goto LABEL_33;
      case 2uLL:
        v15 = "*";
        v13 = 4;
        v12 = "";
        goto LABEL_33;
      case 3uLL:
        goto LABEL_33;
      default:
        v15 = "*";
        if ("" != (char *)99)
        {
          v12 = "";
          v15 = "";
          v13 = (uint64_t)"";
        }
LABEL_33:
        v11 = (id)objc_msgSend(v11, "__escapeString5991");
        v16 = v12;
        v17 = v15;
LABEL_34:
        v24 = -[NSComparisonPredicate options](self, "options");
        v25 = "c";
        if ((v24 & 1) == 0)
          v25 = "";
        v26 = "d";
        if ((v24 & 2) == 0)
          v26 = "";
        v27 = "w";
        if ((v24 & 0x10) == 0)
          v27 = "";
        v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%s%@%s'%s%s%s"), v17, v11, v16, v25, v26, v27);
        v4 = v13;
        break;
    }
    goto LABEL_41;
  }
  if (_NSIsNSNumber())
  {
    switch(v4)
    {
      case 7uLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSLikePredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      case 8uLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSBeginsWithPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      case 9uLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSEndsWithPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      case 0xAuLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSInPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      default:
        if (v4 == 99)
        {
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSContainsPredicateOperatorType and right expression which is a number given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        }
        v18 = (NSString *)objc_msgSend(v11, "description");
        break;
    }
LABEL_21:
    v20 = v18;
LABEL_41:
    switch(v4)
    {
      case 0uLL:
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ < %@"), v7, v20, v29);
        break;
      case 1uLL:
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <= %@"), v7, v20, v29);
        break;
      case 2uLL:
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ > %@"), v7, v20, v29);
        break;
      case 3uLL:
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ >= %@"), v7, v20, v29);
        break;
      case 4uLL:
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ == %@"), v7, v20, v29);
        break;
      case 5uLL:
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ != %@"), v7, v20, v29);
        break;
      default:
        if (v4 == 100)
        {
          v23 = 0;
          return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InRange(%@,%@,%@)"), v7, v20, v23);
        }
        result = 0;
        break;
    }
    return result;
  }
  if (_NSIsNSDate())
  {
    switch(v4)
    {
      case 7uLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSLikePredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      case 8uLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSBeginsWithPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      case 9uLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSEndsWithPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      case 0xAuLL:
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSInPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)"), self);
        goto LABEL_78;
      default:
        if (v4 == 99)
        {
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSContainsPredicateOperatorType and right expression which is a date given to NSMetadataQuery (%@)"), self);
          goto LABEL_78;
        }
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v19);
        break;
    }
    goto LABEL_21;
  }
  if (!_NSIsNSArray())
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with a right expression which is not a string, number, or date given to NSMetadataQuery (%@)"), self);
    goto LABEL_78;
  }
  if (v4 != 100)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with type other than NSBetweenPredicateOperatorType and right expression which is an array given to NSMetadataQuery (%@)"), self);
    goto LABEL_78;
  }
  if (objc_msgSend(v11, "count") != 2)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSBetweenPredicateOperatorType and right expression which is an array with an invalid count given to NSMetadataQuery (%@)"), self);
    goto LABEL_78;
  }
  v21 = (void *)objc_msgSend(v11, "objectAtIndex:", 0);
  v22 = (void *)objc_msgSend(v11, "objectAtIndex:", 1);
  if (!_NSIsNSNumber() || (_NSIsNSNumber() & 1) == 0)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSComparisonPredicate with NSBetweenPredicateOperatorType and right expression which is an array containing other than numbers given to NSMetadataQuery (%@)"), self);
    goto LABEL_78;
  }
  v20 = (NSString *)objc_msgSend(v21, "description");
  v23 = objc_msgSend(v22, "description");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InRange(%@,%@,%@)"), v7, v20, v23);
}

@end
