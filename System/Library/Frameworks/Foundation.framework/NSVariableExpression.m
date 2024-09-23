@implementation NSVariableExpression

- (unint64_t)expressionType
{
  return 2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSVariableExpression;
  -[NSVariableExpression dealloc](&v3, sel_dealloc);
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  NSVariableExpression *v3;
  uint64_t v4;
  void *v5;
  void *v7;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  v3 = self;
  v4 = objc_msgSend(a3, "objectForKey:", self->_variable);
  if (!v4)
    return v3;
  v5 = (void *)v4;
  if (objc_msgSend(MEMORY[0x1E0C99E38], "null") == v4)
  {
    v7 = 0;
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v5;
    v7 = v5;
  }
  return +[NSExpression expressionForConstantValue:](NSExpression, "expressionForConstantValue:", v7);
}

- (NSVariableExpression)initWithObject:(id)a3
{
  NSVariableExpression *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSVariableExpression;
  v4 = -[NSExpression initWithExpressionType:](&v6, sel_initWithExpressionType_, 2);
  v4->_variable = (NSString *)a3;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", self->_variable);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(a3, "variable"), "isEqual:", -[NSVariableExpression variable](self, "variable"));
  else
    return 0;
}

- (id)variable
{
  return self->_variable;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;

  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v12 = (NSString *)CFSTR("This expression has evaluation disabled");
    goto LABEL_10;
  }
  v7 = objc_msgSend(a4, "objectForKey:", self->_variable);
  if (!v7)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't get value for '%@' in bindings %@."), self->_variable, a4);
    v10 = v13;
    v11 = v14;
LABEL_10:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0));
  }
  v8 = (void *)v7;
  if (objc_msgSend(MEMORY[0x1E0C99E38], "null") == v7)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v8, "expressionValueWithObject:context:", a3, a4);
  return v8;
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
  v5.super_class = (Class)NSVariableExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_variable, CFSTR("NSVariable"));
}

- (NSVariableExpression)initWithCoder:(id)a3
{
  NSVariableExpression *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSVariableExpression;
  v5 = -[NSExpression initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
    v5->_variable = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSVariable"));
  return v5;
}

- (id)predicateFormat
{
  id v2;
  _BOOL4 v3;
  const __CFString *v4;

  v2 = -[NSVariableExpression variable](self, "variable");
  v3 = +[_NSPredicateUtilities _isReservedWordInParser:](_NSPredicateUtilities, "_isReservedWordInParser:", v2);
  v4 = &stru_1E0F56070;
  if (v3)
    v4 = CFSTR("#");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%@%@"), v4, v2);
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSVariableExpression variable](self, "variable"), "hash");
}

@end
