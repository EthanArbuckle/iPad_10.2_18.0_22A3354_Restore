@implementation MKImportContext

- (unint64_t)importCount
{
  return self->_importCount;
}

- (void)setImportCount:(unint64_t)a3
{
  self->_importCount = a3;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (void)setImportErrorCount:(unint64_t)a3
{
  self->_importErrorCount = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end
