@implementation ATIDSConnectionInfo

- (ATIDSConnectionInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATIDSConnectionInfo;
  return -[ATIDSConnectionInfo init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ATIDSConnectionInfo;
  -[ATIDSConnectionInfo dealloc](&v2, sel_dealloc);
}

- (IDSDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)wakeupTimestamp
{
  return self->_wakeupTimestamp;
}

- (void)setWakeupTimestamp:(double)a3
{
  self->_wakeupTimestamp = a3;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unint64_t)a3
{
  self->_connectionState = a3;
}

- (unsigned)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(unsigned int)a3
{
  self->_failureCount = a3;
}

- (ATIDSSocket)socket
{
  return self->_socket;
}

- (void)setSocket:(id)a3
{
  objc_storeStrong((id *)&self->_socket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
