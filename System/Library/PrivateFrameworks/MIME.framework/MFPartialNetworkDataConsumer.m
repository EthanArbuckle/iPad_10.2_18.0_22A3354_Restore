@implementation MFPartialNetworkDataConsumer

- (MFPartialNetworkDataConsumer)init
{
  MFPartialNetworkDataConsumer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFPartialNetworkDataConsumer;
  v2 = -[MFPartialNetworkDataConsumer init](&v4, sel_init);
  if (v2)
    v2->_rawDataConsumer = (MFGuaranteedCollectingDataConsumer *)objc_alloc_init(MFBufferedDataConsumer);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFPartialNetworkDataConsumer;
  -[MFPartialNetworkDataConsumer dealloc](&v3, sel_dealloc);
}

- (int64_t)appendData:(id)a3
{
  int64_t result;

  self->_strippedData = 0;
  if ((*((_BYTE *)self + 32) & 1) == 0)
    *((_BYTE *)self + 32) = *((_BYTE *)self + 32) & 0xFE | (memchr((void *)objc_msgSend(a3, "bytes"), 13, objc_msgSend(a3, "length")) != 0);
  result = -[MFGuaranteedCollectingDataConsumer appendData:](self->_rawDataConsumer, "appendData:", a3);
  if (result >= 1)
    self->_length += result;
  return result;
}

- (void)done
{
  -[MFGuaranteedCollectingDataConsumer done](self->_rawDataConsumer, "done");

  self->_strippedData = 0;
}

- (unint64_t)length
{
  return self->_length;
}

- (id)data
{
  if (self->_length)
    return (id)-[MFGuaranteedCollectingDataConsumer data](self->_rawDataConsumer, "data");
  else
    return 0;
}

- (id)copyDataWithUnixLineEndings
{
  NSData *strippedData;
  MFBufferedDataConsumer *v4;
  MFLineEndingConverterFilter *v5;
  NSData *v7;

  if (self->_length)
  {
    if ((*((_BYTE *)self + 32) & 1) != 0)
    {
      strippedData = self->_strippedData;
      if (!strippedData)
      {
        v4 = objc_alloc_init(MFBufferedDataConsumer);
        v5 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFLineEndingConverterFilter alloc], "initWithConsumer:", v4);
        -[MFLineEndingConverterFilter appendData:](v5, "appendData:", -[MFGuaranteedCollectingDataConsumer data](self->_rawDataConsumer, "data"));
        -[MFLineEndingConverterFilter done](v5, "done");
        -[MFBufferedDataConsumer done](v4, "done");
        v7 = (NSData *)-[MFBufferedDataConsumer data](v4, "data");
        self->_strippedData = v7;

        strippedData = v7;
      }
    }
    else
    {
      strippedData = (NSData *)-[MFGuaranteedCollectingDataConsumer data](self->_rawDataConsumer, "data");
    }
  }
  else
  {
    strippedData = 0;
  }
  return strippedData;
}

- (void)purge
{

  self->_strippedData = 0;
}

@end
