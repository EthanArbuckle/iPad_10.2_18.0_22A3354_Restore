@implementation _MFOutgoingMessageBody

- (_MFOutgoingMessageBody)init
{
  _MFOutgoingMessageBody *v2;
  MFBufferedDataConsumer *v3;
  MFBufferedDataConsumer *consumer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFOutgoingMessageBody;
  v2 = -[_MFOutgoingMessageBody init](&v6, sel_init);
  if (v2)
  {
    v3 = (MFBufferedDataConsumer *)objc_alloc_init(MEMORY[0x1E0D46068]);
    consumer = v2->_consumer;
    v2->_consumer = v3;

  }
  return v2;
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
  -[MFBufferedDataConsumer data](self->_consumer, "data");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)appendData:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[MFBufferedDataConsumer appendData:](self->_consumer, "appendData:", v4);
  if (v5 >= 1)
  {
    self->_lastNewLine = *(_BYTE *)(v5 + objc_msgSend(objc_retainAutorelease(v4), "bytes") - 1) == 10;
    self->_count += v5;
  }

  return v5;
}

- (void)done
{
  NSData *v3;
  NSData *rawData;
  MFBufferedDataConsumer *consumer;

  -[MFBufferedDataConsumer done](self->_consumer, "done");
  -[MFBufferedDataConsumer data](self->_consumer, "data");
  v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  rawData = self->_rawData;
  self->_rawData = v3;

  consumer = self->_consumer;
  self->_consumer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
}

@end
