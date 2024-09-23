@implementation CMIExternalMemoryDescriptor

- (CMIExternalMemoryDescriptor)initWithMemSize:(unint64_t)a3 allocatorType:(int)a4
{
  CMIExternalMemoryDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMIExternalMemoryDescriptor;
  result = -[CMIExternalMemoryDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_memSize = a3;
    result->_allocatorType = a4;
  }
  return result;
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (void)setMemSize:(unint64_t)a3
{
  self->_memSize = a3;
}

- (int)allocatorType
{
  return self->_allocatorType;
}

- (void)setAllocatorType:(int)a3
{
  self->_allocatorType = a3;
}

@end
