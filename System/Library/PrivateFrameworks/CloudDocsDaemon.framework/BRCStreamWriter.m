@implementation BRCStreamWriter

- (BRCStreamWriter)initWithOutputStream:(id)a3
{
  id v5;
  BRCStreamWriter *v6;
  BRCStreamWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCStreamWriter;
  v6 = -[BRCStreamWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    -[NSOutputStream open](v7->_outputStream, "open");
  }

  return v7;
}

- (void)appendString:(id)a3
{
  BRCStreamWriter *v4;
  void *v5;
  NSOutputStream *outputStream;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outputStream = v4->_outputStream;
  v7 = objc_retainAutorelease(v5);
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_sync_exit(v4);
}

- (void)close
{
  NSOutputStream *outputStream;
  BRCStreamWriter *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSOutputStream close](obj->_outputStream, "close");
  outputStream = obj->_outputStream;
  obj->_outputStream = 0;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  objc_super v3;

  -[BRCStreamWriter close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)BRCStreamWriter;
  -[BRCStreamWriter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end
