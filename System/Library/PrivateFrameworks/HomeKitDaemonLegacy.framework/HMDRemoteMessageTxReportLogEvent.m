@implementation HMDRemoteMessageTxReportLogEvent

- (HMDRemoteMessageTxReportLogEvent)initWithTransport:(int)a3 latency:(double)a4
{
  HMDRemoteMessageTxReportLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteMessageTxReportLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_transportType = a3;
    result->_latency = a4;
  }
  return result;
}

- (int)transportType
{
  return self->_transportType;
}

- (double)latency
{
  return self->_latency;
}

+ (id)txReportForTransport:(int)a3 latency:(double)a4
{
  return -[HMDRemoteMessageTxReportLogEvent initWithTransport:latency:]([HMDRemoteMessageTxReportLogEvent alloc], "initWithTransport:latency:", *(_QWORD *)&a3, a4);
}

@end
