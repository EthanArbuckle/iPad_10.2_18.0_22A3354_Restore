@implementation _MTLPipelineStateBinary

- (_MTLPipelineStateBinary)initWithBinary:(id)a3 uniqueIdentifier:(unint64_t)a4
{
  self->_binary = (NSData *)a3;
  self->_uniqueIdentifier = a4;
  return self;
}

- (_MTLPipelineStateBinary)initWithBinary:(id)a3 uniqueIdentifier:(unint64_t)a4 debugIdentifier:(unint64_t)a5
{
  self->_binary = (NSData *)a3;
  self->_uniqueIdentifier = a4;
  self->_debugIdentifier = a5;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLPipelineStateBinary;
  -[_MTLPipelineStateBinary dealloc](&v3, sel_dealloc);
}

- (NSData)binary
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)debugIdentifier
{
  return self->_debugIdentifier;
}

@end
