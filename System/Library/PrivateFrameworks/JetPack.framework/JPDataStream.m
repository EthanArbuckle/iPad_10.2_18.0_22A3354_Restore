@implementation JPDataStream

- (JPDataStream)initWithData:(id)a3
{
  id v4;
  _QWORD *DataStream;
  JPDataStream *v6;
  JPDataStream *v7;
  objc_super v9;

  v4 = objc_retainAutorelease(a3);
  DataStream = JetPackCreateDataStream(objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  v9.receiver = self;
  v9.super_class = (Class)JPDataStream;
  v6 = -[JPStream initWithBacking:releaseOnDealloc:](&v9, sel_initWithBacking_releaseOnDealloc_, DataStream, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, v4);

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
