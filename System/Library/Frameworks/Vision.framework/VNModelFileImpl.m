@implementation VNModelFileImpl

- (VNModelFileImpl)initWithMappedModel:(const mapped_model_file *)a3
{
  VNModelFileImpl *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNModelFileImpl;
  result = -[VNModelFileImpl init](&v5, sel_init);
  if (result)
    result->m_impl = a3;
  return result;
}

- (const)baseAddress
{
  return (const void *)(*((uint64_t (**)(const mapped_model_file *))self->m_impl->var0 + 2))(self->m_impl);
}

- (unint64_t)length
{
  return self->m_impl->var1;
}

- (void)advise:(int64_t)a3
{
  (*((void (**)(const mapped_model_file *, int64_t))self->m_impl->var0 + 3))(self->m_impl, a3);
}

- (__sFILE)ptrFile
{
  return (__sFILE *)(*((uint64_t (**)(const mapped_model_file *))self->m_impl->var0 + 4))(self->m_impl);
}

@end
