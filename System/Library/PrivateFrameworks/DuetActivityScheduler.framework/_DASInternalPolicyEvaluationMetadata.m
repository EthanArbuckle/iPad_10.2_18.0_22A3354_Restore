@implementation _DASInternalPolicyEvaluationMetadata

+ (id)metadataWithScore:(double)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setScore:", a3);
  return v4;
}

- (_DASInternalPolicyEvaluationMetadata)initWithScore:(double)a3 reason:(int64_t)a4 decision:(int64_t)a5
{
  _DASInternalPolicyEvaluationMetadata *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DASInternalPolicyEvaluationMetadata;
  result = -[_DASInternalPolicyEvaluationMetadata init](&v9, sel_init);
  if (result)
  {
    result->_score = a3;
    result->_reason = a4;
    result->_decision = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_DASInternalPolicyEvaluationMetadata initWithScore:reason:decision:](+[_DASInternalPolicyEvaluationMetadata allocWithZone:](_DASInternalPolicyEvaluationMetadata, "allocWithZone:", a3), "initWithScore:reason:decision:", self->_reason, self->_decision, self->_score);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)decision
{
  return self->_decision;
}

- (void)setDecision:(int64_t)a3
{
  self->_decision = a3;
}

@end
