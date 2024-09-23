@implementation CHSynthesisContractViolation

- (CHSynthesisContractViolation)initWithLocationRange:(_NSRange)a3 comment:(id)a4 kind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  CHSynthesisContractViolation *v11;
  CHSynthesisContractViolation *v12;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSynthesisContractViolation;
  v11 = -[CHSynthesisContractViolation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_locationRange.location = location;
    v11->_locationRange.length = length;
    objc_storeStrong((id *)&v11->_comment, a4);
    v12->_kind = a5;
  }

  return v12;
}

- (_NSRange)locationRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_locationRange.length;
  location = self->_locationRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)comment
{
  return self->_comment;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
}

@end
