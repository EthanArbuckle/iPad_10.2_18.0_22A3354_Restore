@implementation LighthouseCoreMLEvaluationResult

- (LighthouseCoreMLEvaluationResult)init
{
  LighthouseCoreMLEvaluationResult *v2;
  double v3;
  uint64_t v4;
  NSNumber *accuracy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LighthouseCoreMLEvaluationResult;
  v2 = -[LighthouseCoreMLEvaluationResult init](&v7, sel_init);
  if (v2)
  {
    LODWORD(v3) = -1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    accuracy = v2->_accuracy;
    v2->_accuracy = (NSNumber *)v4;

  }
  return v2;
}

- (NSNumber)accuracy
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccuracy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accuracy, 0);
}

@end
