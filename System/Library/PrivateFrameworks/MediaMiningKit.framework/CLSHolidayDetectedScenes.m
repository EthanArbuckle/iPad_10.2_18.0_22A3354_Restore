@implementation CLSHolidayDetectedScenes

- (CLSHolidayDetectedScenes)init
{
  CLSHolidayDetectedScenes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSHolidayDetectedScenes;
  result = -[CLSHolidayDetectedScenes init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_detectedSceneImportantCount = 0u;
    *(_OWORD *)&result->_detectedSceneEdgeCaseCount = 0u;
  }
  return result;
}

- (void)recordDetectedSceneImportance:(unint64_t)a3
{
  if (a3 - 1 <= 3)
    ++*((_QWORD *)&self->super.isa + a3);
}

- (unint64_t)detectedSceneEdgeCaseCount
{
  return self->_detectedSceneEdgeCaseCount;
}

- (unint64_t)detectedSceneMediumCount
{
  return self->_detectedSceneMediumCount;
}

- (unint64_t)detectedSceneImportantCount
{
  return self->_detectedSceneImportantCount;
}

- (unint64_t)detectedSceneImperativeCount
{
  return self->_detectedSceneImperativeCount;
}

@end
