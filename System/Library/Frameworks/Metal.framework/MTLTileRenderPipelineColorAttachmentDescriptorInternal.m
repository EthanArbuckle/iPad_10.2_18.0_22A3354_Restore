@implementation MTLTileRenderPipelineColorAttachmentDescriptorInternal

- (MTLTileRenderPipelineColorAttachmentDescriptorInternal)init
{
  MTLTileRenderPipelineColorAttachmentDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorInternal;
  result = -[MTLTileRenderPipelineColorAttachmentDescriptorInternal init](&v3, sel_init);
  if (result)
    result->_private.var0.var0.pixelFormat = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorInternal;
  -[MTLTileRenderPipelineColorAttachmentDescriptorInternal dealloc](&v2, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3) && self->_private.var0.var0.pixelFormat == *((_DWORD *)a3 + 2);
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 4uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
    *((_DWORD *)result + 2) = self->_private.var0.var0.pixelFormat;
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
  v8.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorInternal;
  v6 = -[MTLTileRenderPipelineColorAttachmentDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, tileColorAttachmentFormattedDescription(v4, &self->super));
}

- (id)description
{
  return -[MTLTileRenderPipelineColorAttachmentDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)pixelFormat
{
  return self->_private.var0.var0.pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[3];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  MTLPixelFormatGetInfoForDevice(0, a3, (uint64_t)v9);
  if (a3 && (BYTE8(v9[0]) & 1) == 0)
    MTLReportFailure(0, "validateMTLPixelFormat", 29, (uint64_t)CFSTR("pixelFormat is not a valid MTLPixelFormat."), v5, v6, v7, v8, *(uint64_t *)&v9[0]);
  self->_private.var0.var0.pixelFormat = a3;
}

- (uint64_t)_descriptorPrivate
{
  if (result)
    result += 8;
  return result;
}

@end
