@implementation FCNewsPersonalizationLogisticRegressionClassifierConfiguration

- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationLogisticRegressionClassifierConfiguration *v5;
  uint64_t v6;
  NSNumber *l2Penalty;
  uint64_t v8;
  NSNumber *l1Penalty;
  uint64_t v10;
  NSNumber *maximumIterations;
  uint64_t v12;
  NSNumber *stepSize;
  uint64_t v14;
  NSNumber *convergenceThreshold;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCNewsPersonalizationLogisticRegressionClassifierConfiguration;
  v5 = -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration init](&v17, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("l2Penalty"), &unk_1E470D610);
    v6 = objc_claimAutoreleasedReturnValue();
    l2Penalty = v5->_l2Penalty;
    v5->_l2Penalty = (NSNumber *)v6;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("l1Penalty"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    l1Penalty = v5->_l1Penalty;
    v5->_l1Penalty = (NSNumber *)v8;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumIterations"), &unk_1E470B4B0);
    v10 = objc_claimAutoreleasedReturnValue();
    maximumIterations = v5->_maximumIterations;
    v5->_maximumIterations = (NSNumber *)v10;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("stepSize"), &unk_1E470D610);
    v12 = objc_claimAutoreleasedReturnValue();
    stepSize = v5->_stepSize;
    v5->_stepSize = (NSNumber *)v12;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("convergenceThreshold"), &unk_1E470D620);
    v14 = objc_claimAutoreleasedReturnValue();
    convergenceThreshold = v5->_convergenceThreshold;
    v5->_convergenceThreshold = (NSNumber *)v14;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convergenceThreshold, 0);
  objc_storeStrong((id *)&self->_stepSize, 0);
  objc_storeStrong((id *)&self->_maximumIterations, 0);
  objc_storeStrong((id *)&self->_l1Penalty, 0);
  objc_storeStrong((id *)&self->_l2Penalty, 0);
}

- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)init
{
  return -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration l2Penalty](self, "l2Penalty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; l2Penalty: %@"), v4);

  -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration l1Penalty](self, "l1Penalty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; l1Penalty: %@"), v5);

  -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration maximumIterations](self, "maximumIterations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; maximumIterations: %@"), v6);

  -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration stepSize](self, "stepSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; stepSize: %@"), v7);

  -[FCNewsPersonalizationLogisticRegressionClassifierConfiguration convergenceThreshold](self, "convergenceThreshold");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; convergenceThreshold: %@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSNumber)l2Penalty
{
  return self->_l2Penalty;
}

- (void)setL2Penalty:(id)a3
{
  objc_storeStrong((id *)&self->_l2Penalty, a3);
}

- (NSNumber)l1Penalty
{
  return self->_l1Penalty;
}

- (void)setL1Penalty:(id)a3
{
  objc_storeStrong((id *)&self->_l1Penalty, a3);
}

- (NSNumber)maximumIterations
{
  return self->_maximumIterations;
}

- (void)setMaximumIterations:(id)a3
{
  objc_storeStrong((id *)&self->_maximumIterations, a3);
}

- (NSNumber)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(id)a3
{
  objc_storeStrong((id *)&self->_stepSize, a3);
}

- (NSNumber)convergenceThreshold
{
  return self->_convergenceThreshold;
}

- (void)setConvergenceThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_convergenceThreshold, a3);
}

@end
