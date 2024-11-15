@implementation AVVCConfigureAlertBehaviorSettings

- (AVVCConfigureAlertBehaviorSettings)initWithStreamID:(unint64_t)a3
{
  AVVCConfigureAlertBehaviorSettings *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVVCConfigureAlertBehaviorSettings;
  result = -[AVVCConfigureAlertBehaviorSettings init](&v5, sel_init);
  if (result)
  {
    result->_streamID = a3;
    result->_startAlert = -1;
    result->_stopAlert = -1;
    result->_stopOnErrorAlert = -1;
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

@end
