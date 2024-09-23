@implementation _MFDAMSBasicConsumer

- (_MFDAMSBasicConsumer)initWithMaximumSize:(unsigned int)a3 latency:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MFDAMSBasicConsumer;
  return -[MFBufferedQueue initWithMaximumSize:latency:](&v5, sel_initWithMaximumSize_latency_, 0xFFFFFFFFLL, 1.79769313e308);
}

- (void)dealloc
{
  objc_super v3;

  -[_MFDAMSBasicConsumer setMonitor:](self, "setMonitor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_MFDAMSBasicConsumer;
  -[_MFDAMSBasicConsumer dealloc](&v3, sel_dealloc);
}

- (MFActivityMonitor)monitor
{
  return self->monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->monitor, a3);
}

- (MFError)error
{
  return self->error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->monitor, 0);
  objc_storeStrong((id *)&self->library, 0);
  objc_storeStrong((id *)&self->store, 0);
  objc_storeStrong((id *)&self->mailbox, 0);
}

@end
