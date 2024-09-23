@implementation HKCardioFitnessLevelData

- (HKCardioFitnessLevelData)initWithCardioFitnessLevel:(int64_t)a3 biologicalSex:(int64_t)a4 ageLowerBound:(int64_t)a5 ageUpperBound:(int64_t)a6 vo2MaxLowerBound:(double)a7 vo2MaxUpperBound:(double)a8
{
  HKCardioFitnessLevelData *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HKCardioFitnessLevelData;
  result = -[HKCardioFitnessLevelData init](&v15, sel_init);
  if (result)
  {
    result->_biologicalSex = a4;
    result->_cardioFitnessLevel = a3;
    result->_ageLowerBound = a5;
    result->_ageUpperBound = a6;
    result->_vo2MaxLowerBound = a7;
    result->_vo2MaxUpperBound = a8;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKCardioFitnessLevelData: biological sex: %ld, age range: %ld-%ld, vo2max range: %.2f-%.2f, level: %ld"), self->_biologicalSex, self->_ageLowerBound, self->_ageUpperBound, *(_QWORD *)&self->_vo2MaxLowerBound, *(_QWORD *)&self->_vo2MaxUpperBound, self->_cardioFitnessLevel);
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)cardioFitnessLevel
{
  return self->_cardioFitnessLevel;
}

- (void)setCardioFitnessLevel:(int64_t)a3
{
  self->_cardioFitnessLevel = a3;
}

- (int64_t)ageLowerBound
{
  return self->_ageLowerBound;
}

- (void)setAgeLowerBound:(int64_t)a3
{
  self->_ageLowerBound = a3;
}

- (int64_t)ageUpperBound
{
  return self->_ageUpperBound;
}

- (void)setAgeUpperBound:(int64_t)a3
{
  self->_ageUpperBound = a3;
}

- (double)vo2MaxLowerBound
{
  return self->_vo2MaxLowerBound;
}

- (void)setVo2MaxLowerBound:(double)a3
{
  self->_vo2MaxLowerBound = a3;
}

- (double)vo2MaxUpperBound
{
  return self->_vo2MaxUpperBound;
}

- (void)setVo2MaxUpperBound:(double)a3
{
  self->_vo2MaxUpperBound = a3;
}

@end
