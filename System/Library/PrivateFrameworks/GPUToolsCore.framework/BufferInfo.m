@implementation BufferInfo

- (BufferInfo)initWithSize:(unint64_t)a3 usage:(unint64_t)a4
{
  BufferInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BufferInfo;
  result = -[BufferInfo init](&v7, sel_init);
  if (result)
  {
    result->_size = a3;
    result->_usage = a4;
  }
  return result;
}

- (void)incrementUsage
{
  ++self->_usage;
}

- (void)resetUsage
{
  self->_usage = 0;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)usage
{
  return self->_usage;
}

@end
