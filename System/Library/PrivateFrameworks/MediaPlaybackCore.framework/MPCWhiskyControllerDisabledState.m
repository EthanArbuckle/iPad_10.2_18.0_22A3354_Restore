@implementation MPCWhiskyControllerDisabledState

- (MPCWhiskyControllerDisabledState)initWithPolicyEvaluation:(id)a3
{
  id v4;
  MPCWhiskyControllerDisabledState *v5;
  uint64_t v6;
  NSString *explanation;
  unint64_t v8;
  int64_t v9;
  MPCWhiskyControllerDisabledState *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MPCWhiskyControllerDisabledState;
    v5 = -[MPCWhiskyControllerDisabledState init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "explanation");
      v6 = objc_claimAutoreleasedReturnValue();
      explanation = v5->_explanation;
      v5->_explanation = (NSString *)v6;

      v8 = objc_msgSend(v4, "policyType");
      if (v8 < 3)
        v9 = v8 + 1;
      else
        v9 = 0;
      v5->_reason = v9;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
}

@end
