@implementation CMIVNRPrepareDescriptor

- (unint64_t)inputWidth
{
  return self->_inputWidth;
}

- (void)setInputWidth:(unint64_t)a3
{
  self->_inputWidth = a3;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (void)setInputHeight:(unint64_t)a3
{
  self->_inputHeight = a3;
}

@end
