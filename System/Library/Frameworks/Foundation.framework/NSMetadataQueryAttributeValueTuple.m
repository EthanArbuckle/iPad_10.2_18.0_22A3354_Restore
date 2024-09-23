@implementation NSMetadataQueryAttributeValueTuple

- (id)_init:(id)a3 attribute:(id)a4 value:(id)a5 count:(unint64_t)a6
{
  self->_attr = a4;
  self->_value = a5;
  self->_count = a6;
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMetadataQueryAttributeValueTuple;
  -[NSMetadataQueryAttributeValueTuple dealloc](&v3, sel_dealloc);
}

- (NSString)attribute
{
  return (NSString *)self->_attr;
}

- (id)value
{
  return self->_value;
}

- (NSUInteger)count
{
  return self->_count;
}

@end
