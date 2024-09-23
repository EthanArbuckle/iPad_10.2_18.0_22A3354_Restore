@implementation MLCTensorData

- (MLCTensorData)initWithDataNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL8 v5;
  MLCTensorData *v8;
  uint64_t v9;
  NSData *data;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MLCTensorData;
  v8 = -[MLCTensorData init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    data = v8->_data;
    v8->_data = (NSData *)v9;

  }
  return v8;
}

- (MLCTensorData)initWithDataNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  id v8;
  MLCTensorData *v9;
  uint64_t v10;
  NSData *data;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MLCTensorData;
  v9 = -[MLCTensorData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", a3, a4, v8);
    data = v9->_data;
    v9->_data = (NSData *)v10;

  }
  return v9;
}

- (MLCTensorData)initWithData:(void *)a3 length:(unint64_t)a4
{
  MLCTensorData *v6;
  uint64_t v7;
  NSData *data;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLCTensorData;
  v6 = -[MLCTensorData init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    data = v6->_data;
    v6->_data = (NSData *)v7;

  }
  return v6;
}

+ (MLCTensorData)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length
{
  return (MLCTensorData *)objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:", bytes, length, 0);
}

+ (MLCTensorData)dataWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  return (MLCTensorData *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDataNoCopy:length:freeWhenDone:", a3, a4, a5);
}

+ (MLCTensorData)dataWithBytes:(void *)a3 length:(unint64_t)a4
{
  return (MLCTensorData *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:length:", a3, a4);
}

+ (MLCTensorData)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length deallocator:(void *)deallocator
{
  void *v8;
  void *v9;

  v8 = deallocator;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataNoCopy:length:deallocator:", bytes, length, v8);

  return (MLCTensorData *)v9;
}

- (void)bytes
{
  id v2;
  void *v3;

  -[MLCTensorData data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (void *)objc_msgSend(v2, "bytes");

  return v3;
}

- (NSUInteger)length
{
  void *v2;
  NSUInteger v3;

  -[MLCTensorData data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
