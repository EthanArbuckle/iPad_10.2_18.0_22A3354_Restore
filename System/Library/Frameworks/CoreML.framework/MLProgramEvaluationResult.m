@implementation MLProgramEvaluationResult

- (MLProgramEvaluationResult)init
{
  MLProgramEvaluationResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLProgramEvaluationResult;
  result = -[MLProgramEvaluationResult init](&v3, sel_init);
  if (result)
    result->_loss = 0.0;
  return result;
}

- (double)loss
{
  return self->_loss;
}

- (void)setLoss:(double)a3
{
  self->_loss = a3;
}

- (MLBatchProvider)evaluationMetrics
{
  return (MLBatchProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEvaluationMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
}

@end
