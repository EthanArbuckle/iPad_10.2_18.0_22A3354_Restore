@implementation IRInspectionOrderOfExectionForCandidate

- (NSDictionary)executionOrderForClassification
{
  return self->_executionOrderForClassification;
}

- (void)setExecutionOrderForClassification:(id)a3
{
  objc_storeStrong((id *)&self->_executionOrderForClassification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionOrderForClassification, 0);
}

@end
