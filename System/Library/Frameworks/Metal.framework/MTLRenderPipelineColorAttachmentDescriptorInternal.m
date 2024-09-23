@implementation MTLRenderPipelineColorAttachmentDescriptorInternal

- (MTLRenderPipelineColorAttachmentDescriptorInternal)init
{
  MTLRenderPipelineColorAttachmentDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorInternal;
  result = -[MTLRenderPipelineColorAttachmentDescriptorInternal init](&v3, sel_init);
  if (result)
    result->_private.var0.var1.var0 = 2013270144;
  return result;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFLL | ((unint64_t)a3 << 36);
}

- (void)setWriteMask:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFF87FFFFFFLL | ((a3 & 0xF) << 27);
}

- (void)setBlendingEnabled:(BOOL)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)setSourceRGBBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFF07FLL | ((a3 & 0x1F) << 7);
}

- (void)setDestinationRGBBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFC1FFFFLL | ((a3 & 0x1F) << 17);
}

- (void)setDestinationAlphaBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFF83FFFFFLL | ((a3 & 0x1F) << 22);
}

- (void)setSourceAlphaBlendFactor:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFE0FFFLL | ((a3 & 0x1F) << 12);
}

- (unint64_t)pixelFormat
{
  return self->_private.var0.var1.var0 >> 36;
}

- (unint64_t)writeMask
{
  return (self->_private.var0.var1.var0 >> 27) & 0xF;
}

- (BOOL)isBlendingEnabled
{
  return *(_DWORD *)&self->_private.var0.var0 & 1;
}

- (unint64_t)sourceRGBBlendFactor
{
  return (self->_private.var0.var1.var0 >> 7) & 0x1F;
}

- (unint64_t)sourceAlphaBlendFactor
{
  return (self->_private.var0.var1.var0 >> 12) & 0x1F;
}

- (unint64_t)rgbBlendOperation
{
  return (self->_private.var0.var1.var0 >> 1) & 7;
}

- (unint64_t)destinationRGBBlendFactor
{
  return (self->_private.var0.var1.var0 >> 17) & 0x1F;
}

- (unint64_t)destinationAlphaBlendFactor
{
  return (self->_private.var0.var1.var0 >> 22) & 0x1F;
}

- (unint64_t)alphaBlendOperation
{
  return (self->_private.var0.var1.var0 >> 4) & 7;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorInternal;
  -[MTLRenderPipelineColorAttachmentDescriptorInternal dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
    *((_QWORD *)result + 1) = self->_private.var0.var1.var0;
  return result;
}

- (void)setRgbBlendOperation:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFFFF1 | (2 * (a3 & 7));
}

- (void)setAlphaBlendOperation:(unint64_t)a3
{
  self->_private.var0.var1.var0 = self->_private.var0.var1.var0 & 0xFFFFFFFFFFFFFF8FLL | (16 * (a3 & 7));
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3) && self->_private.var0.var1.var0 == *((_QWORD *)a3 + 1);
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 8uLL);
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
  v8.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorInternal;
  v6 = -[MTLRenderPipelineColorAttachmentDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, pipelineColorAttachmentFormattedDescription(v4, self));
}

- (id)description
{
  return -[MTLRenderPipelineColorAttachmentDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
