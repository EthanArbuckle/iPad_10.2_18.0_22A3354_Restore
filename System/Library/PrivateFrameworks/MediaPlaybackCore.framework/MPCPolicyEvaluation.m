@implementation MPCPolicyEvaluation

- (BOOL)isEqual:(id)a3
{
  MPCPolicyEvaluation *v4;
  BOOL v5;

  v4 = (MPCPolicyEvaluation *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_policyType == v4->_policyType;
  }

  return v5;
}

- (BOOL)shouldDisableVocalAttenuation
{
  return self->_disableVocalAttenuation;
}

- (void)setDisableVocalAttenuation:(BOOL)a3
{
  self->_disableVocalAttenuation = a3;
}

- (int64_t)policyType
{
  return self->_policyType;
}

- (void)setPolicyType:(int64_t)a3
{
  self->_policyType = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)canBeOverriden
{
  return self->_canBeOverriden;
}

- (void)setCanBeOverriden:(BOOL)a3
{
  self->_canBeOverriden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
}

@end
