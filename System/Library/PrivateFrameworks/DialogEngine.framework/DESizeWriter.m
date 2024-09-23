@implementation DESizeWriter

- (DESizeWriter)init
{
  DESizeWriter *v2;
  DESizeWriter *v3;
  DESizeWriter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DESizeWriter;
  v2 = -[DESizeWriter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_size = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeData:(id)a3
{
  self->_size += objc_msgSend(a3, "length");
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
