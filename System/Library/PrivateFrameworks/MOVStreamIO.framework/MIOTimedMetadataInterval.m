@implementation MIOTimedMetadataInterval

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (CVSMPTETime)timeCode
{
  CVSMPTETime *result;

  objc_copyStruct(retstr, &self->_timeCode, 24, 1, 0);
  return result;
}

- (void)setTimeCode:(CVSMPTETime *)a3
{
  objc_copyStruct(&self->_timeCode, a3, 24, 1, 0);
}

@end
