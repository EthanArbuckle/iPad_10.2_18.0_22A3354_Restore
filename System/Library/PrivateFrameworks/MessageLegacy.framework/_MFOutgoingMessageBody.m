@implementation _MFOutgoingMessageBody

- (_MFOutgoingMessageBody)init
{
  _MFOutgoingMessageBody *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MFOutgoingMessageBody;
  v2 = -[_MFOutgoingMessageBody init](&v4, sel_init);
  if (v2)
    v2->_consumer = (MFBufferedDataConsumer *)objc_alloc_init(MEMORY[0x1E0D46068]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFOutgoingMessageBody;
  -[_MFOutgoingMessageBody dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)isLastCharacterNewLine
{
  return self->_lastNewLine;
}

- (id)rawData
{
  NSData *rawData;

  rawData = self->_rawData;
  if (rawData)
    return rawData;
  else
    return -[MFBufferedDataConsumer data](self->_consumer, "data");
}

- (int64_t)appendData:(id)a3
{
  int64_t v5;

  v5 = -[MFBufferedDataConsumer appendData:](self->_consumer, "appendData:");
  if (v5 >= 1)
  {
    self->_lastNewLine = *(_BYTE *)(v5 + objc_msgSend(a3, "bytes") - 1) == 10;
    self->_count += v5;
  }
  return v5;
}

- (void)done
{
  -[MFBufferedDataConsumer done](self->_consumer, "done");
  self->_rawData = (NSData *)-[MFBufferedDataConsumer data](self->_consumer, "data");

  self->_consumer = 0;
}

@end
