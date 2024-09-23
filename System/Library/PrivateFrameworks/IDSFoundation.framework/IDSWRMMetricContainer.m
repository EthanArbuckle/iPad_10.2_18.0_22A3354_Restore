@implementation IDSWRMMetricContainer

- (IDSWRMMetricContainer)init
{
  IDSWRMMetricContainer *v2;
  const char *v3;
  uint64_t v4;
  double v5;
  IDSWRMMetricContainer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSWRMMetricContainer;
  v2 = -[IDSWRMMetricContainer init](&v8, sel_init);
  v6 = v2;
  if (v2)
    objc_msgSend_resetMetric(v2, v3, v4, v5);
  return v6;
}

- (void)resetMetric
{
  __int128 v2;

  self->_MessageDeliveredDeliveryError = -1;
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *(_OWORD *)&self->_MessageDeliveredRTT = v2;
  *(_OWORD *)&self->_MessageSentSize = v2;
  *(_OWORD *)&self->_StreamPacketsSent = v2;
  *(_OWORD *)&self->_StreamBytesSent = v2;
  *(_OWORD *)&self->_numMessageSentSize = 0u;
  *(_OWORD *)&self->_numMessageDeliveredRTT = 0u;
}

- (id)description
{
  double v2;
  unint64_t StreamBytesSent;
  unint64_t StreamBytesReceived;
  unint64_t StreamPacketsSent;
  unint64_t StreamPacketsReceived;
  unint64_t MessageSentSize;
  unint64_t MessageDeliveredSize;
  unint64_t MessageDeliveredRTT;
  unint64_t MessageReceivedSize;
  unint64_t MessageDeliveredDeliveryError;

  StreamBytesSent = self->_StreamBytesSent;
  StreamBytesReceived = self->_StreamBytesReceived;
  if (StreamBytesSent == -1)
    StreamBytesSent = 0;
  if (StreamBytesReceived == -1)
    StreamBytesReceived = 0;
  StreamPacketsSent = self->_StreamPacketsSent;
  StreamPacketsReceived = self->_StreamPacketsReceived;
  if (StreamPacketsSent == -1)
    StreamPacketsSent = 0;
  if (StreamPacketsReceived == -1)
    StreamPacketsReceived = 0;
  MessageSentSize = self->_MessageSentSize;
  MessageDeliveredSize = self->_MessageDeliveredSize;
  if (MessageSentSize == -1)
    MessageSentSize = 0;
  if (MessageDeliveredSize == -1)
    MessageDeliveredSize = 0;
  MessageDeliveredRTT = self->_MessageDeliveredRTT;
  MessageReceivedSize = self->_MessageReceivedSize;
  if (MessageDeliveredRTT == -1)
    MessageDeliveredRTT = 0;
  if (MessageReceivedSize == -1)
    MessageReceivedSize = 0;
  MessageDeliveredDeliveryError = self->_MessageDeliveredDeliveryError;
  if (MessageDeliveredDeliveryError == -1)
    MessageDeliveredDeliveryError = 0;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("\nStreamBytesSent = %llu \nStreamBytesReceived = %llu \nStreamPacketsSent = %llu \nStreamPacketsReceived = %llu \nMessageSentSize = %llu \nMessageDeliveredSize = %llu \nMessageDeliveredRTT = %llu \nMessageReceivedSize = %llu \nCount of MessageDeliveredDeliveryError = %llu \n"), v2, StreamBytesSent, StreamBytesReceived, StreamPacketsSent, StreamPacketsReceived, MessageSentSize, MessageDeliveredSize, MessageDeliveredRTT, MessageReceivedSize, MessageDeliveredDeliveryError);
}

- (void)setStreamBytesSent:(unint64_t)a3
{
  unint64_t StreamBytesSent;

  StreamBytesSent = self->_StreamBytesSent;
  if (StreamBytesSent == -1)
    StreamBytesSent = 0;
  self->_StreamBytesSent = StreamBytesSent + a3;
}

- (void)setStreamBytesReceived:(unint64_t)a3
{
  unint64_t StreamBytesReceived;

  StreamBytesReceived = self->_StreamBytesReceived;
  if (StreamBytesReceived == -1)
    StreamBytesReceived = 0;
  self->_StreamBytesReceived = StreamBytesReceived + a3;
}

- (void)setStreamPacketsSent:(unint64_t)a3
{
  unint64_t StreamPacketsSent;

  StreamPacketsSent = self->_StreamPacketsSent;
  if (StreamPacketsSent == -1)
    StreamPacketsSent = 0;
  self->_StreamPacketsSent = StreamPacketsSent + a3;
}

- (void)setStreamPacketsReceived:(unint64_t)a3
{
  unint64_t StreamPacketsReceived;

  StreamPacketsReceived = self->_StreamPacketsReceived;
  if (StreamPacketsReceived == -1)
    StreamPacketsReceived = 0;
  self->_StreamPacketsReceived = StreamPacketsReceived + a3;
}

- (void)setMessageSentSize:(unint64_t)a3
{
  unint64_t MessageSentSize;
  unint64_t numMessageSentSize;
  unint64_t v5;

  MessageSentSize = self->_MessageSentSize;
  if (MessageSentSize == -1)
  {
    self->_MessageSentSize = a3;
    self->_numMessageSentSize = 1;
  }
  else
  {
    numMessageSentSize = self->_numMessageSentSize;
    v5 = a3 + numMessageSentSize * MessageSentSize;
    ++numMessageSentSize;
    self->_MessageSentSize = v5 / numMessageSentSize;
    self->_numMessageSentSize = numMessageSentSize;
  }
}

- (void)setMessageDeliveredSize:(unint64_t)a3
{
  unint64_t MessageDeliveredSize;
  unint64_t numMessageDeliveredSize;
  unint64_t v5;

  MessageDeliveredSize = self->_MessageDeliveredSize;
  if (MessageDeliveredSize == -1)
  {
    self->_MessageDeliveredSize = a3;
    self->_numMessageDeliveredSize = 1;
  }
  else
  {
    numMessageDeliveredSize = self->_numMessageDeliveredSize;
    v5 = a3 + numMessageDeliveredSize * MessageDeliveredSize;
    ++numMessageDeliveredSize;
    self->_MessageDeliveredSize = v5 / numMessageDeliveredSize;
    self->_numMessageDeliveredSize = numMessageDeliveredSize;
  }
}

- (void)setMessageDeliveredRTT:(unint64_t)a3
{
  unint64_t MessageDeliveredRTT;
  unint64_t numMessageDeliveredRTT;
  unint64_t v5;

  MessageDeliveredRTT = self->_MessageDeliveredRTT;
  if (MessageDeliveredRTT == -1)
  {
    self->_MessageDeliveredRTT = a3;
    self->_numMessageDeliveredRTT = 1;
  }
  else
  {
    numMessageDeliveredRTT = self->_numMessageDeliveredRTT;
    v5 = a3 + numMessageDeliveredRTT * MessageDeliveredRTT;
    ++numMessageDeliveredRTT;
    self->_MessageDeliveredRTT = v5 / numMessageDeliveredRTT;
    self->_numMessageDeliveredRTT = numMessageDeliveredRTT;
  }
}

- (void)setMessageReceivedSize:(unint64_t)a3
{
  unint64_t MessageReceivedSize;
  unint64_t numMessageReceivedSize;
  unint64_t v5;

  MessageReceivedSize = self->_MessageReceivedSize;
  if (MessageReceivedSize == -1)
  {
    self->_MessageReceivedSize = a3;
    self->_numMessageReceivedSize = 1;
  }
  else
  {
    numMessageReceivedSize = self->_numMessageReceivedSize;
    v5 = a3 + numMessageReceivedSize * MessageReceivedSize;
    ++numMessageReceivedSize;
    self->_MessageReceivedSize = v5 / numMessageReceivedSize;
    self->_numMessageReceivedSize = numMessageReceivedSize;
  }
}

- (void)setMessageDeliveredDeliveryError:(unint64_t)a3
{
  unint64_t MessageDeliveredDeliveryError;
  BOOL v4;
  unint64_t v5;

  if (a3)
  {
    MessageDeliveredDeliveryError = self->_MessageDeliveredDeliveryError;
    v4 = __CFADD__(MessageDeliveredDeliveryError, 1);
    v5 = MessageDeliveredDeliveryError + 1;
    if (v4)
      v5 = 1;
    self->_MessageDeliveredDeliveryError = v5;
  }
}

- (unint64_t)StreamBytesSent
{
  return self->_StreamBytesSent;
}

- (unint64_t)StreamBytesReceived
{
  return self->_StreamBytesReceived;
}

- (unint64_t)StreamPacketsSent
{
  return self->_StreamPacketsSent;
}

- (unint64_t)StreamPacketsReceived
{
  return self->_StreamPacketsReceived;
}

- (unint64_t)MessageSentSize
{
  return self->_MessageSentSize;
}

- (unint64_t)MessageDeliveredSize
{
  return self->_MessageDeliveredSize;
}

- (unint64_t)MessageDeliveredRTT
{
  return self->_MessageDeliveredRTT;
}

- (unint64_t)MessageReceivedSize
{
  return self->_MessageReceivedSize;
}

- (unint64_t)MessageDeliveredDeliveryError
{
  return self->_MessageDeliveredDeliveryError;
}

- (unint64_t)numMessageSentSize
{
  return self->_numMessageSentSize;
}

- (unint64_t)numMessageDeliveredSize
{
  return self->_numMessageDeliveredSize;
}

- (unint64_t)numMessageDeliveredRTT
{
  return self->_numMessageDeliveredRTT;
}

- (unint64_t)numMessageReceivedSize
{
  return self->_numMessageReceivedSize;
}

@end
