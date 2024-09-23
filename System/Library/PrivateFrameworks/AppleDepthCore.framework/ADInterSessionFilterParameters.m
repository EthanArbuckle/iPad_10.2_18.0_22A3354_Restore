@implementation ADInterSessionFilterParameters

- (ADInterSessionFilterParameters)init
{
  ADInterSessionFilterParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADInterSessionFilterParameters;
  result = -[ADInterSessionFilterParameters init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_minimalEntriesForResult = 0x4B0000004BLL;
    *(_QWORD *)&result->_minimalWeight = 0x3E8000003CE56042;
    *(_QWORD *)&result->_outlierNumber = 0x3CE5604200000011;
    result->_isStepDetectionActive = 1;
    *(_QWORD *)&result->_minStepIndex = 0xF00000002;
    result->_stepDetectionThreshold = 5.342;
  }
  return result;
}

- (unsigned)minimalEntriesForResult
{
  return self->_minimalEntriesForResult;
}

- (void)setMinimalEntriesForResult:(unsigned int)a3
{
  self->_minimalEntriesForResult = a3;
}

- (unsigned)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unsigned int)a3
{
  self->_capacity = a3;
}

- (float)minimalWeight
{
  return self->_minimalWeight;
}

- (void)setMinimalWeight:(float)a3
{
  self->_minimalWeight = a3;
}

- (float)maximalWeight
{
  return self->_maximalWeight;
}

- (void)setMaximalWeight:(float)a3
{
  self->_maximalWeight = a3;
}

- (unsigned)outlierNumber
{
  return self->_outlierNumber;
}

- (void)setOutlierNumber:(unsigned int)a3
{
  self->_outlierNumber = a3;
}

- (float)outlierWeight
{
  return self->_outlierWeight;
}

- (void)setOutlierWeight:(float)a3
{
  self->_outlierWeight = a3;
}

- (BOOL)isStepDetectionActive
{
  return self->_isStepDetectionActive;
}

- (void)setIsStepDetectionActive:(BOOL)a3
{
  self->_isStepDetectionActive = a3;
}

- (unsigned)minStepIndex
{
  return self->_minStepIndex;
}

- (void)setMinStepIndex:(unsigned int)a3
{
  self->_minStepIndex = a3;
}

- (unsigned)minStepSize
{
  return self->_minStepSize;
}

- (void)setMinStepSize:(unsigned int)a3
{
  self->_minStepSize = a3;
}

- (float)stepDetectionThreshold
{
  return self->_stepDetectionThreshold;
}

- (void)setStepDetectionThreshold:(float)a3
{
  self->_stepDetectionThreshold = a3;
}

@end
