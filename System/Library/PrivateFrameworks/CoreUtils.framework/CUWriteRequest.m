@implementation CUWriteRequest

- (CUWriteRequest)init
{
  CUWriteRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUWriteRequest;
  result = -[CUWriteRequest init](&v3, sel_init);
  if (result)
  {
    result->_bytesIOArray = result->_iov;
    result->_bytesIOMaxCount = 16;
  }
  return result;
}

- (char)messageUUID
{
  return (char *)self->_messageUUID;
}

- (iovec)bytesIOArray
{
  return self->_bytesIOArray;
}

- (unint64_t)bytesIOCount
{
  return self->_bytesIOCount;
}

- (void)setBytesIOCount:(unint64_t)a3
{
  self->_bytesIOCount = a3;
}

- (unint64_t)bytesIOMaxCount
{
  return self->_bytesIOMaxCount;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSArray)dataArray
{
  return self->_dataArray;
}

- (void)setDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_dataArray, a3);
}

- (BOOL)endOfData
{
  return self->_endOfData;
}

- (void)setEndOfData:(BOOL)a3
{
  self->_endOfData = a3;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)hasMessageUUID
{
  return self->_hasMessageUUID;
}

- (void)setHasMessageUUID:(BOOL)a3
{
  self->_hasMessageUUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArray, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
