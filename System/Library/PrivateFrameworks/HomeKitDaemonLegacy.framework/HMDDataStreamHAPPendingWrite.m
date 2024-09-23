@implementation HMDDataStreamHAPPendingWrite

- (HMDDataStreamHAPPendingWrite)initWithData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDDataStreamHAPPendingWrite *v8;
  uint64_t v9;
  NSData *data;
  void *v11;
  id completion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDDataStreamHAPPendingWrite;
  v8 = -[HMDDataStreamHAPPendingWrite init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v9;

    v11 = _Block_copy(v7);
    completion = v8->_completion;
    v8->_completion = v11;

  }
  return v8;
}

- (BOOL)isComplete
{
  HMDDataStreamHAPPendingWrite *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  -[HMDDataStreamHAPPendingWrite data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  LOBYTE(v2) = v4 <= -[HMDDataStreamHAPPendingWrite bytesWritten](v2, "bytesWritten");

  return (char)v2;
}

- (id)popNextFrameUpToMaxLength:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[HMDDataStreamHAPPendingWrite data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = v6 - -[HMDDataStreamHAPPendingWrite bytesWritten](self, "bytesWritten");

  if (v7 < a3)
    a3 = v7;
  -[HMDDataStreamHAPPendingWrite data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subdataWithRange:", -[HMDDataStreamHAPPendingWrite bytesWritten](self, "bytesWritten"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDataStreamHAPPendingWrite setBytesWritten:](self, "setBytesWritten:", -[HMDDataStreamHAPPendingWrite bytesWritten](self, "bytesWritten") + a3);
  return v9;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
