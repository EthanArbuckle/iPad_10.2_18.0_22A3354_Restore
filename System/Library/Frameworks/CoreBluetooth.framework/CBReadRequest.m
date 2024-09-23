@implementation CBReadRequest

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (NSMutableData)bufferData
{
  return self->_bufferData;
}

- (void)setBufferData:(id)a3
{
  objc_storeStrong((id *)&self->_bufferData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
