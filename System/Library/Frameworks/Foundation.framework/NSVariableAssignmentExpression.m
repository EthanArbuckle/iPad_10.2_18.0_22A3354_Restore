@implementation NSVariableAssignmentExpression

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSVariableAssignmentExpression;
  -[NSVariableAssignmentExpression dealloc](&v3, sel_dealloc);
}

- (NSVariableAssignmentExpression)initWithAssignmentVariable:(id)a3 expression:(id)a4
{
  NSVariableExpression *v6;
  NSVariableAssignmentExpression *v7;

  v6 = -[NSVariableExpression initWithObject:](+[NSVariableExpression allocWithZone:](NSVariableExpression, "allocWithZone:", -[NSVariableAssignmentExpression zone](self, "zone")), "initWithObject:", a3);
  v7 = -[NSVariableAssignmentExpression initWithAssignmentExpression:expression:](self, "initWithAssignmentExpression:expression:", v6, a4);

  return v7;
}

- (NSVariableAssignmentExpression)initWithAssignmentExpression:(id)a3 expression:(id)a4
{
  NSVariableAssignmentExpression *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSVariableAssignmentExpression;
  v6 = -[NSExpression initWithExpressionType:](&v8, sel_initWithExpressionType_, 12);
  v6->_assignmentVariable = (NSVariableExpression *)a3;
  v6->_subexpression = (NSExpression *)a4;
  return v6;
}

- (unint64_t)expressionType
{
  return 12;
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
  -[NSExpression allowEvaluation](self->_assignmentVariable, "allowEvaluation");
  -[NSExpression allowEvaluation](self->_subexpression, "allowEvaluation");
  v3.receiver = self;
  v3.super_class = (Class)NSVariableAssignmentExpression;
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
  v5.super_class = (Class)NSVariableAssignmentExpression;
  -[NSExpression encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSVariableExpression variable](self->_assignmentVariable, "variable"), CFSTR("NSAssignmentVariable"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_subexpression, CFSTR("NSSubexpression"));
}

- (NSVariableAssignmentExpression)initWithCoder:(id)a3
{
  NSVariableAssignmentExpression *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSVariableExpression *v10;
  void *v11;
  const __CFString *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v14.receiver = self;
  v14.super_class = (Class)NSVariableAssignmentExpression;
  v5 = -[NSExpression initWithCoder:](&v14, sel_initWithCoder_, a3);
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
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSAssignmentVariable"));
    v10 = -[NSVariableExpression initWithObject:]([NSVariableExpression alloc], "initWithObject:", v9);
    v5->_assignmentVariable = v10;
    *(_DWORD *)&v10->super._expressionFlags |= 1u;
    v5->_subexpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSSubexpression"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v9)
      {
        v11 = 0;
        if (!v7)
        {
LABEL_14:
          if (v11)
          {

            objc_exception_throw(v11);
          }
          return v5;
        }
LABEL_13:

        goto LABEL_14;
      }
      v12 = CFSTR("Malformed assignment expression (bad variable)");
    }
    else
    {
      v12 = CFSTR("Malformed assignment expression (bad expression)");
    }
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v12, 0);
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
  void *v6;

  v4 = (void *)-[NSVariableExpression copy](self->_assignmentVariable, "copy", a3);
  v5 = (void *)-[NSExpression copy](self->_subexpression, "copy");
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssignmentExpression:expression:", v4, v5);

  return v6;
}

- (id)assignmentVariable
{
  return self->_assignmentVariable;
}

- (id)variable
{
  return -[NSVariableExpression variable](self->_assignmentVariable, "variable");
}

- (id)subexpression
{
  return self->_subexpression;
}

- (id)predicateFormat
{
  _BOOL4 v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[NSExpression _shouldUseParensWithDescription](self->_subexpression, "_shouldUseParensWithDescription");
  if (v3)
    v4 = CFSTR("(");
  else
    v4 = &stru_1E0F56070;
  if (v3)
    v5 = CFSTR(")");
  else
    v5 = &stru_1E0F56070;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ := %@%@%@"), -[NSExpression description](self->_assignmentVariable, "description"), v4, -[NSExpression description](self->_subexpression, "description"), v5);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "variable"), "isEqual:", -[NSVariableAssignmentExpression variable](self, "variable")))
  {
    return objc_msgSend((id)objc_msgSend(a3, "subexpression"), "isEqual:", -[NSVariableAssignmentExpression subexpression](self, "subexpression"));
  }
  else
  {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(-[NSVariableAssignmentExpression variable](self, "variable"), "hash");
  return objc_msgSend(-[NSVariableAssignmentExpression subexpression](self, "subexpression"), "hash") ^ v3;
}

- (id)expressionValueWithObject:(id)a3 context:(id)a4
{
  id v7;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  if (!-[NSExpression _allowsEvaluation](self, "_allowsEvaluation"))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = CFSTR("This expression has evaluation disabled");
    goto LABEL_6;
  }
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = CFSTR("must have a bindings dictionary to do variable assignments");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0));
  }
  v7 = -[NSExpression expressionValueWithObject:context:](self->_subexpression, "expressionValueWithObject:context:", a3, a4);
  objc_msgSend(a4, "setObject:forKey:", v7, -[NSVariableAssignmentExpression variable](self, "variable"));
  return v7;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  if ((a4 & 1) != 0)
  {
    if ((a4 & 4) != 0)
    {
      objc_msgSend(a3, "visitPredicateExpression:", self);
      -[NSExpression acceptVisitor:flags:](self->_assignmentVariable, "acceptVisitor:flags:", a3, a4);
      -[NSExpression acceptVisitor:flags:](self->_subexpression, "acceptVisitor:flags:", a3, a4);
    }
    else
    {
      -[NSExpression acceptVisitor:flags:](self->_assignmentVariable, "acceptVisitor:flags:", a3, a4);
      -[NSExpression acceptVisitor:flags:](self->_subexpression, "acceptVisitor:flags:", a3, a4);
      objc_msgSend(a3, "visitPredicateExpression:", self);
    }
  }
}

- (id)_expressionWithSubstitutionVariables:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssignmentExpression:expression:", objc_msgSend(-[NSVariableAssignmentExpression assignmentVariable](self, "assignmentVariable"), "_expressionWithSubstitutionVariables:", a3), objc_msgSend(-[NSVariableAssignmentExpression subexpression](self, "subexpression"), "_expressionWithSubstitutionVariables:", a3));
}

@end
