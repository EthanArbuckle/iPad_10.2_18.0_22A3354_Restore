@implementation MSVABTestGenerator

- (MSVABTestGenerator)initWithProbabilityForOutcomeA:(float)a3
{
  MSVABTestGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVABTestGenerator;
  result = -[MSVABTestGenerator init](&v5, sel_init);
  if (result)
  {
    result->_probabilityForOutcomeA = a3;
    result->_totalExperiments = 0;
    result->_totalForOutcomeA = 0;
  }
  return result;
}

- (void)updateProbabilityForOutcomeA:(float)a3
{
  self->_probabilityForOutcomeA = a3;
  self->_totalForOutcomeA = 0;
  self->_totalForOutcomeB = 0;
  self->_totalExperiments = 0;
}

- (int64_t)nextOutcome
{
  int64_t totalForOutcomeA;
  int64_t *p_totalForOutcomeA;
  int64_t v4;
  float probabilityForOutcomeA;
  int64_t v6;

  p_totalForOutcomeA = &self->_totalForOutcomeA;
  totalForOutcomeA = self->_totalForOutcomeA;
  v4 = self->_totalExperiments + 1;
  self->_totalExperiments = v4;
  probabilityForOutcomeA = self->_probabilityForOutcomeA;
  if (probabilityForOutcomeA < 1.0
    && (probabilityForOutcomeA <= 0.0 || (float)((float)totalForOutcomeA / (float)v4) >= probabilityForOutcomeA))
  {
    totalForOutcomeA = self->_totalForOutcomeB;
    v6 = 1;
    p_totalForOutcomeA = &self->_totalForOutcomeB;
  }
  else
  {
    v6 = 0;
  }
  *p_totalForOutcomeA = totalForOutcomeA + 1;
  return v6;
}

- (int64_t)lastOutcome
{
  int64_t totalExperiments;
  float probabilityForOutcomeA;
  float v4;
  _BOOL4 v5;

  totalExperiments = self->_totalExperiments;
  probabilityForOutcomeA = self->_probabilityForOutcomeA;
  if (totalExperiments)
  {
    if (probabilityForOutcomeA >= 1.0)
    {
      return 0;
    }
    else
    {
      v4 = (float)self->_totalForOutcomeA / (float)totalExperiments;
      v5 = probabilityForOutcomeA <= 0.0;
      if (v4 >= probabilityForOutcomeA)
        return 1;
    }
  }
  else
  {
    return probabilityForOutcomeA <= 0.0;
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#outcomes: %ld, #A: %ld, #B: %ld, target A: %0.3f, actual A: %0.3f"), self->_totalExperiments, self->_totalForOutcomeA, self->_totalForOutcomeB, self->_probabilityForOutcomeA, (float)((float)self->_totalForOutcomeA / (float)self->_totalExperiments));
}

- (float)probabilityForOutcomeA
{
  return self->_probabilityForOutcomeA;
}

- (int64_t)totalExperiments
{
  return self->_totalExperiments;
}

- (int64_t)totalForOutcomeA
{
  return self->_totalForOutcomeA;
}

- (int64_t)totalForOutcomeB
{
  return self->_totalForOutcomeB;
}

@end
