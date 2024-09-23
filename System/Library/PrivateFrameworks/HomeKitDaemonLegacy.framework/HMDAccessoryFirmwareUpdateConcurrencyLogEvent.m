@implementation HMDAccessoryFirmwareUpdateConcurrencyLogEvent

- (HMDAccessoryFirmwareUpdateConcurrencyLogEvent)initWithPeakConcurrentIPAccessoryUpdateStaging:(unint64_t)a3 peakConcurrentIPAccessoryUpdateApply:(unint64_t)a4 peakConcurrentBLEAccessoryUpdateStaging:(unint64_t)a5 peakConcurrentBLEAccessoryUpdateApply:(unint64_t)a6 peakConcurrentThreadAccessoryUpdateStaging:(unint64_t)a7 peakConcurrentThreadAccessoryUpdateApply:(unint64_t)a8
{
  HMDAccessoryFirmwareUpdateConcurrencyLogEvent *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryFirmwareUpdateConcurrencyLogEvent;
  result = -[HMMLogEvent init](&v15, sel_init);
  if (result)
  {
    result->_peakConcurrentIPAccessoryUpdateStaging = a3;
    result->_peakConcurrentIPAccessoryUpdateApply = a4;
    result->_peakConcurrentBLEAccessoryUpdateStaging = a5;
    result->_peakConcurrentBLEAccessoryUpdateApply = a6;
    result->_peakConcurrentThreadAccessoryUpdateStaging = a7;
    result->_peakConcurrentThreadAccessoryUpdateApply = a8;
  }
  return result;
}

- (unint64_t)peakConcurrentIPAccessoryUpdateStaging
{
  return self->_peakConcurrentIPAccessoryUpdateStaging;
}

- (unint64_t)peakConcurrentIPAccessoryUpdateApply
{
  return self->_peakConcurrentIPAccessoryUpdateApply;
}

- (unint64_t)peakConcurrentBLEAccessoryUpdateStaging
{
  return self->_peakConcurrentBLEAccessoryUpdateStaging;
}

- (unint64_t)peakConcurrentBLEAccessoryUpdateApply
{
  return self->_peakConcurrentBLEAccessoryUpdateApply;
}

- (unint64_t)peakConcurrentThreadAccessoryUpdateStaging
{
  return self->_peakConcurrentThreadAccessoryUpdateStaging;
}

- (unint64_t)peakConcurrentThreadAccessoryUpdateApply
{
  return self->_peakConcurrentThreadAccessoryUpdateApply;
}

@end
