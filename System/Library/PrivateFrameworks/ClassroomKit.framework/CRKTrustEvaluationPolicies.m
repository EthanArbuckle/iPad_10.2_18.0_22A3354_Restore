@implementation CRKTrustEvaluationPolicies

+ (CRKTrustEvaluationPolicies)defaultPoliciesForClientEvaluation
{
  return (CRKTrustEvaluationPolicies *)(id)objc_opt_new();
}

+ (CRKTrustEvaluationPolicies)defaultPolicicesForServerEvaluation
{
  return (CRKTrustEvaluationPolicies *)(id)objc_opt_new();
}

- (CRKTrustEvaluationPolicies)init
{
  return -[CRKTrustEvaluationPolicies initWithPolicyRefs:](self, "initWithPolicyRefs:", 0);
}

- (CRKTrustEvaluationPolicies)initWithPolicyRefs:(id)a3
{
  id v4;
  CRKTrustEvaluationPolicies *v5;
  uint64_t v6;
  NSArray *policyRefs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKTrustEvaluationPolicies;
  v5 = -[CRKTrustEvaluationPolicies init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    policyRefs = v5->_policyRefs;
    v5->_policyRefs = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)policyRefs
{
  return self->_policyRefs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyRefs, 0);
}

@end
