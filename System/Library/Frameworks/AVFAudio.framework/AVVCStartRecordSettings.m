@implementation AVVCStartRecordSettings

- (AVVCStartRecordSettings)initWithStreamID:(unint64_t)a3 atStartHostTime:(unint64_t)a4
{
  AVVCStartRecordSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVVCStartRecordSettings;
  result = -[AVVCStartRecordSettings init](&v7, sel_init);
  if (result)
  {
    result->_streamID = a3;
    result->_startHostTime = a4;
    result->_startAlert = -1;
    result->_stopAlert = -1;
    result->_stopOnErrorAlert = -1;
    result->_skipAlert = 0;
    result->_startAnchorPoint = 0;
  }
  return result;
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (unint64_t)startHostTime
{
  return self->_startHostTime;
}

- (void)setStartHostTime:(unint64_t)a3
{
  self->_startHostTime = a3;
}

- (int64_t)startAlert
{
  return self->_startAlert;
}

- (void)setStartAlert:(int64_t)a3
{
  self->_startAlert = a3;
}

- (int64_t)stopAlert
{
  return self->_stopAlert;
}

- (void)setStopAlert:(int64_t)a3
{
  self->_stopAlert = a3;
}

- (int64_t)stopOnErrorAlert
{
  return self->_stopOnErrorAlert;
}

- (void)setStopOnErrorAlert:(int64_t)a3
{
  self->_stopOnErrorAlert = a3;
}

- (BOOL)skipAlert
{
  return self->_skipAlert;
}

- (void)setSkipAlert:(BOOL)a3
{
  self->_skipAlert = a3;
}

- (unsigned)startAnchorPoint
{
  return self->_startAnchorPoint;
}

- (void)setStartAnchorPoint:(unsigned int)a3
{
  self->_startAnchorPoint = a3;
}

@end
