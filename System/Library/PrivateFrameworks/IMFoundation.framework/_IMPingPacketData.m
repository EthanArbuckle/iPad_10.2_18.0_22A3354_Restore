@implementation _IMPingPacketData

- (_IMPingPacketData)initWithSequeneceNumber:(int)a3 timesent:(timeval *)a4 error:(int)a5
{
  _IMPingPacketData *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_IMPingPacketData;
  result = -[_IMPingPacketData init](&v9, sel_init);
  if (result)
  {
    result->_sequenceNumber = a3;
    result->_timeSent = *a4;
    result->_error = a5;
  }
  return result;
}

- (void)_markPacketAsTimedOut:(double)a3
{
  self->_timedOut = sub_1906B313C((uint64_t)&self->_timeSent) > a3;
}

- (void)_returnPacketArrived
{
  self->_rtt = sub_1906B313C((uint64_t)&self->_timeSent);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id result;

  v5 = (void *)objc_msgSend_allocWithZone_(_IMPingPacketData, a2, (uint64_t)a3, v3);
  result = (id)objc_msgSend_init(v5, v6, v7, v8);
  if (result)
  {
    *((_DWORD *)result + 2) = self->_sequenceNumber;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_rtt;
    *((_BYTE *)result + 12) = self->_timedOut;
    *(timeval *)((char *)result + 24) = self->_timeSent;
    *((_DWORD *)result + 4) = self->_error;
  }
  return result;
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (timeval)timeSent
{
  uint64_t v2;
  __darwin_time_t tv_sec;
  timeval result;

  v2 = *(_QWORD *)&self->_timeSent.tv_usec;
  tv_sec = self->_timeSent.tv_sec;
  result.tv_usec = v2;
  result.tv_sec = tv_sec;
  return result;
}

- (int)error
{
  return self->_error;
}

- (double)rtt
{
  return self->_rtt;
}

@end
