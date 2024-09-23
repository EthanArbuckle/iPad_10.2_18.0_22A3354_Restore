@implementation MTLRenderPassColorAttachmentDescriptorInternal

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)setStoreAction:(unint64_t)a3
{
  self->_private.storeAction = a3;
}

- (void)setLoadAction:(unint64_t)a3
{
  self->_private.loadAction = a3;
}

- (void)setLevel:(unint64_t)a3
{
  self->_private.level = a3;
}

- (id)texture
{
  return self->_private.texture;
}

- (void)setTexture:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;

  if (a3 && MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3A30) & 1) == 0)
    MTLReportFailure(1uLL, "-[MTLRenderPassColorAttachmentDescriptorInternal setTexture:]", 661, (uint64_t)CFSTR("texture is not a MTLTextureImplementation."), v6, v7, v8, v9, v10);
  self->_private.texture = (MTLTextureImplementation *)a3;
}

- (void)setClearColor:(id)a3
{
  self->_private.clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- (void)setSlice:(unint64_t)a3
{
  self->_private.slice = a3;
}

- (void)setResolveSlice:(unint64_t)a3
{
  self->_private.resolveSlice = a3;
}

- (void)setResolveLevel:(unint64_t)a3
{
  self->_private.resolveLevel = a3;
}

- (void)setStoreActionOptions:(unint64_t)a3
{
  self->_private.storeActionOptions = a3;
}

- (void)setResolveDepthPlane:(unint64_t)a3
{
  self->_private.resolveDepthPlane = a3;
}

- (void)setDepthPlane:(unint64_t)a3
{
  self->_private.depthPlane = a3;
}

- (MTLRenderPassColorAttachmentDescriptorInternal)init
{
  MTLRenderPassColorAttachmentDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPassColorAttachmentDescriptorInternal;
  result = -[MTLRenderPassColorAttachmentDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_private.loadAction = xmmword_182809F60;
    *(_OWORD *)&result->_private.clearColor.red = _defaultClearColor;
    result->_private.storeActionOptions = 0;
    *(_OWORD *)&result->_private.clearColor.blue = unk_18281B090;
    result->_private.clearDepth = 1.0;
    result->_private.clearStencil = 0;
    result->_private.stencilResolveFilter = 0;
    result->_private.yInvert = 0;
  }
  return result;
}

- (unint64_t)storeAction
{
  return self->_private.storeAction;
}

- (unint64_t)level
{
  return self->_private.level;
}

- (id)resolveTexture
{
  return self->_private.resolveTexture;
}

- (unint64_t)loadAction
{
  return self->_private.loadAction;
}

- (void)setResolveTexture:(id)a3
{
  id v5;
  MTLRenderPassAttachmentDescriptorPrivate *p_private;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  p_private = &self->_private;

  if (a3 && MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3A30) & 1) == 0)
    MTLReportFailure(1uLL, "-[MTLRenderPassColorAttachmentDescriptorInternal setResolveTexture:]", 662, (uint64_t)CFSTR("resolveTexture is not a MTLTextureImplementation."), v7, v8, v9, v10, v11);
  p_private->resolveTexture = (MTLTextureImplementation *)a3;
}

- (void)dealloc
{
  MTLRenderPassAttachmentDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassColorAttachmentDescriptorInternal;
  -[MTLRenderPassColorAttachmentDescriptorInternal dealloc](&v4, sel_dealloc);
}

+ (id)attachmentDescriptor
{
  return objc_alloc_init((Class)a1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  copyAttachmentPrivate(&self->_private, (MTLRenderPassAttachmentDescriptorPrivate *)(v4 + 8));
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3) && memcmp(&self->_private, (char *)a3 + 8, 0xB0uLL) == 0;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 0xB0uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLRenderPassColorAttachmentDescriptorInternal;
  v6 = -[MTLRenderPassColorAttachmentDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, colorAttachmentFormattedDescription(a3, &self->_private));
}

- (id)description
{
  return -[MTLRenderPassColorAttachmentDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)slice
{
  return self->_private.slice;
}

- (unint64_t)depthPlane
{
  return self->_private.depthPlane;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  double red;
  double green;
  double blue;
  double alpha;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  red = self->_private.clearColor.red;
  green = self->_private.clearColor.green;
  blue = self->_private.clearColor.blue;
  alpha = self->_private.clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (unint64_t)resolveLevel
{
  return self->_private.resolveLevel;
}

- (unint64_t)resolveSlice
{
  return self->_private.resolveSlice;
}

- (unint64_t)resolveDepthPlane
{
  return self->_private.resolveDepthPlane;
}

- (void)setYInvert:(BOOL)a3
{
  self->_private.yInvert = a3;
}

- (BOOL)yInvert
{
  return self->_private.yInvert;
}

- (unint64_t)storeActionOptions
{
  return self->_private.storeActionOptions;
}

@end
