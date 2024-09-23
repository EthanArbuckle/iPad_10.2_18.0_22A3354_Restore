@implementation ACHPredicateExpressionValidationResult

- (ACHPredicateExpressionValidationResult)initWithValid:(BOOL)a3 issues:(id)a4
{
  id v7;
  ACHPredicateExpressionValidationResult *v8;
  ACHPredicateExpressionValidationResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACHPredicateExpressionValidationResult;
  v8 = -[ACHPredicateExpressionValidationResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_valid = a3;
    objc_storeStrong((id *)&v8->_issues, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issues, 0);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSArray)issues
{
  return self->_issues;
}

@end
