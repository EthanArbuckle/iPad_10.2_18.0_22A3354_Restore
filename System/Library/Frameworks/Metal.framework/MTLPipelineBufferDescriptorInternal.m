@implementation MTLPipelineBufferDescriptorInternal

- (MTLPipelineBufferDescriptorInternal)init
{
  MTLPipelineBufferDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLPipelineBufferDescriptorInternal;
  result = -[MTLPipelineBufferDescriptorInternal init](&v3, sel_init);
  if (result)
    result->_private.var0.var1.var0 = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLPipelineBufferDescriptorInternal;
  -[MTLPipelineBufferDescriptorInternal dealloc](&v2, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3) && self->_private.var0.var1.var0 == *((_QWORD *)a3 + 1);
}

- (BOOL)isDefault
{
  return self->_private.var0.var1.var0 == 0;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 8uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
    *((_QWORD *)result + 1) = self->_private.var0.var1.var0;
  return result;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v8;

  v4 = a3 + 4;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLPipelineBufferDescriptorInternal;
  v6 = -[MTLPipelineBufferDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, pipelineBufferFormattedDescription(v4, self));
}

- (id)description
{
  return -[MTLPipelineBufferDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)mutability
{
  return *(_BYTE *)&self->_private.var0.var0 & 3;
}

- (void)setMutability:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = a3;
  if (a3 >= 3)
    MTLReportFailure(0, "validateMTLMutability", 27, (uint64_t)CFSTR("%lu is not a valid MTLMutability."), v3, v4, v5, v6, a3);
  *(_BYTE *)&self->_private.var0.var0 = *(_BYTE *)&self->_private.var0.var0 & 0xFC | v7 & 3;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

@end
