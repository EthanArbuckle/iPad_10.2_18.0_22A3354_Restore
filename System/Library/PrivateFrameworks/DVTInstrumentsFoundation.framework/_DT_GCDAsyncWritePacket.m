@implementation _DT_GCDAsyncWritePacket

- (_DT_GCDAsyncWritePacket)initWithData:(id)a3 timeout:(double)a4 tag:(int64_t)a5
{
  id v9;
  _DT_GCDAsyncWritePacket *v10;
  _DT_GCDAsyncWritePacket *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DT_GCDAsyncWritePacket;
  v10 = -[_DT_GCDAsyncWritePacket init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->buffer, a3);
    v11->timeout = a4;
    v11->bytesDone = 0;
    v11->tag = a5;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buffer, 0);
}

@end
