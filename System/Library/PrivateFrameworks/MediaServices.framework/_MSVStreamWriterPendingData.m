@implementation _MSVStreamWriterPendingData

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(int64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
