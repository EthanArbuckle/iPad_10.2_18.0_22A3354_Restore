@implementation IRRuleOutputCandidate

- (id)evaluateRuleOutputWithCandidateIdentifier:(id)a3
{
  id v4;
  IRRuleOutputEvaluation *v5;
  void *v6;
  void *v7;
  void *v8;
  IRRuleOutputEvaluation *v9;

  v4 = a3;
  v5 = objc_alloc_init(IRRuleOutputEvaluation);
  -[IRRuleOutputCandidate values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IRRuleOutputCandidate values](self, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (IRRuleOutputEvaluation *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (BOOL)isAnyCandidateEvaluatedToYes
{
  return self->_isAnyCandidateEvaluatedToYes;
}

- (void)setIsAnyCandidateEvaluatedToYes:(BOOL)a3
{
  self->_isAnyCandidateEvaluatedToYes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
