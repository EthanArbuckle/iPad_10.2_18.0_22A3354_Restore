@implementation CBWriteRequest

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArray, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
