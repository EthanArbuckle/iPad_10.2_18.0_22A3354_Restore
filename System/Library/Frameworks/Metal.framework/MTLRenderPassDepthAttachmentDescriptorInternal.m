@implementation MTLRenderPassDepthAttachmentDescriptorInternal

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
    MTLReportFailure(1uLL, "-[MTLRenderPassDepthAttachmentDescriptorInternal setTexture:]", 790, (uint64_t)CFSTR("texture is not a MTLTextureImplementation."), v6, v7, v8, v9, v10);
  self->_private.texture = (MTLTextureImplementation *)a3;
}

- (id)texture
{
  return self->_private.texture;
}

- (void)setStoreAction:(unint64_t)a3
{
  self->_private.storeAction = a3;
}

- (void)setLoadAction:(unint64_t)a3
{
  self->_private.loadAction = a3;
}

- (void)setClearDepth:(double)a3
{
  self->_private.clearDepth = a3;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)setLevel:(unint64_t)a3
{
  self->_private.level = a3;
}

- (void)setSlice:(unint64_t)a3
{
  self->_private.slice = a3;
}

- (unint64_t)storeAction
{
  return self->_private.storeAction;
}

- (MTLRenderPassDepthAttachmentDescriptorInternal)init
{
  MTLRenderPassDepthAttachmentDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPassDepthAttachmentDescriptorInternal;
  result = -[MTLRenderPassDepthAttachmentDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_private.clearColor.red = _defaultClearColor;
    result->_private.storeAction = 0;
    result->_private.storeActionOptions = 0;
    result->_private.loadAction = 2;
    *(_OWORD *)&result->_private.clearColor.blue = unk_18281B090;
    result->_private.clearDepth = 1.0;
    result->_private.clearStencil = 0;
    result->_private.stencilResolveFilter = 0;
  }
  return result;
}

- (void)dealloc
{
  MTLRenderPassAttachmentDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassDepthAttachmentDescriptorInternal;
  -[MTLRenderPassDepthAttachmentDescriptorInternal dealloc](&v4, sel_dealloc);
}

- (void)setResolveSlice:(unint64_t)a3
{
  self->_private.resolveSlice = a3;
}

- (void)setStoreActionOptions:(unint64_t)a3
{
  self->_private.storeActionOptions = a3;
}

- (void)setResolveLevel:(unint64_t)a3
{
  self->_private.resolveLevel = a3;
}

- (void)setResolveDepthPlane:(unint64_t)a3
{
  self->_private.resolveDepthPlane = a3;
}

- (void)setDepthResolveFilter:(unint64_t)a3
{
  self->_private.resolveFilter = a3;
}

- (void)setDepthPlane:(unint64_t)a3
{
  self->_private.depthPlane = a3;
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

- (unint64_t)storeActionOptions
{
  return self->_private.storeActionOptions;
}

- (unint64_t)slice
{
  return self->_private.slice;
}

- (unint64_t)resolveSlice
{
  return self->_private.resolveSlice;
}

- (unint64_t)resolveLevel
{
  return self->_private.resolveLevel;
}

- (unint64_t)resolveDepthPlane
{
  return self->_private.resolveDepthPlane;
}

- (unint64_t)depthPlane
{
  return self->_private.depthPlane;
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
    MTLReportFailure(1uLL, "-[MTLRenderPassDepthAttachmentDescriptorInternal setResolveTexture:]", 791, (uint64_t)CFSTR("resolveTexture is not a MTLTextureImplementation."), v7, v8, v9, v10, v11);
  p_private->resolveTexture = (MTLTextureImplementation *)a3;
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
  v8.super_class = (Class)MTLRenderPassDepthAttachmentDescriptorInternal;
  v6 = -[MTLRenderPassDepthAttachmentDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, depthAttachmentFormattedDescription(a3, &self->_private));
}

- (id)description
{
  return -[MTLRenderPassDepthAttachmentDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (double)clearDepth
{
  return self->_private.clearDepth;
}

- (void)setYInvert:(BOOL)a3
{
  self->_private.yInvert = a3;
}

- (BOOL)yInvert
{
  return self->_private.yInvert;
}

- (unint64_t)depthResolveFilter
{
  return self->_private.resolveFilter;
}

@end
