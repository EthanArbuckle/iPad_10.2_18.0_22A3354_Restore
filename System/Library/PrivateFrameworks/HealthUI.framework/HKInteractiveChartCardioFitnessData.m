@implementation HKInteractiveChartCardioFitnessData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartCardioFitnessData;
  -[HKInteractiveChartSinglePointData description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, biologicalSex: %ld, age: %ld, classification: %ld, sample count: %lu"), v4, self->_biologicalSex, self->_age, self->_classification, self->_sampleCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)age
{
  return self->_age;
}

- (void)setAge:(int64_t)a3
{
  self->_age = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_sampleCount = a3;
}

@end
