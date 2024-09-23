@implementation MTLDebugRenderTargetAttachmentInfo

- (MTLDebugRenderTargetAttachmentInfo)initWithDesc:(const MTLRenderPassAttachmentDescriptorPrivate *)a3 renderTargetArrayLength:(unint64_t)a4
{
  MTLDebugRenderTargetAttachmentInfo *v6;
  id var0;
  unint64_t var2;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id var11;
  unint64_t var13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTLDebugRenderTargetAttachmentInfo;
  v6 = -[MTLDebugRenderTargetAttachmentInfo init](&v17, sel_init);
  v6->_attachmentTexture = (MTLTexture *)a3->var0;
  v6->_renderTargetArrayLength = a4;
  var0 = a3->var0;
  v6->_baseLevelOffset = a3->var1;
  var2 = a3->var2;
  v9 = objc_msgSend(var0, "parentTexture");
  if (v9)
  {
    do
    {
      v10 = (void *)v9;
      v6->_baseLevelOffset += objc_msgSend(var0, "parentRelativeLevel");
      var2 += objc_msgSend(var0, "parentRelativeSlice");
      v9 = objc_msgSend(v10, "parentTexture");
      var0 = v10;
    }
    while (v9);
  }
  else
  {
    v10 = var0;
  }
  v6->_baseTexture = (MTLTexture *)v10;
  if (a4 <= 1)
    v11 = 1;
  else
    v11 = a4;
  v6->_baseSliceRangeOffset.location = var2;
  v6->_baseSliceRangeOffset.length = v11;
  var11 = a3->var11;
  v6->_resolveLevelOffset = a3->var12;
  var13 = a3->var13;
  v14 = objc_msgSend(var11, "parentTexture");
  if (v14)
  {
    do
    {
      v15 = (void *)v14;
      v6->_resolveLevelOffset += objc_msgSend(var11, "parentRelativeLevel");
      var13 += objc_msgSend(var11, "parentRelativeSlice");
      v14 = objc_msgSend(v15, "parentTexture");
      var11 = v15;
    }
    while (v14);
  }
  else
  {
    v15 = var11;
  }
  v6->_baseResolveTexture = (MTLTexture *)v15;
  v6->_resolveSliceRangeOffset.location = var13;
  v6->_resolveSliceRangeOffset.length = v11;
  return v6;
}

- (unint64_t)intersectsTexture:(id)a3
{
  MTLTexture *v3;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  MTLTexture *v8;
  MTLTexture *v9;
  unint64_t v10;
  NSUInteger v11;
  MTLTexture *i;
  unint64_t resolveLevelOffset;
  unint64_t v14;
  BOOL v15;
  unint64_t baseLevelOffset;
  unint64_t v18;
  NSRange v19;
  NSRange v20;

  v3 = (MTLTexture *)a3;
  v5 = objc_msgSend(a3, "parentTexture");
  v6 = 0;
  v7 = 0;
  if (v5)
  {
    v8 = v3;
    do
    {
      v9 = (MTLTexture *)v5;
      v6 += -[MTLTexture parentRelativeLevel](v8, "parentRelativeLevel");
      v7 += -[MTLTexture parentRelativeSlice](v8, "parentRelativeSlice");
      v5 = -[MTLTexture parentTexture](v9, "parentTexture");
      v8 = v9;
    }
    while (v5);
  }
  else
  {
    v9 = v3;
  }
  v10 = -[MTLTexture mipmapLevelCount](v3, "mipmapLevelCount");
  v11 = -[MTLTexture arrayLength](v3, "arrayLength");
  if (self->_baseResolveTexture)
  {
    for (i = v3; -[MTLTexture parentTexture](i, "parentTexture"); v3 = i)
      i = (MTLTexture *)-[MTLTexture parentTexture](v3, "parentTexture");
    if (self->_baseResolveTexture == v3)
    {
      resolveLevelOffset = self->_resolveLevelOffset;
      v15 = resolveLevelOffset >= v6;
      v14 = resolveLevelOffset - v6;
      v15 = !v15 || v14 >= v10;
      if (!v15)
      {
        v19.location = v7;
        v19.length = v11;
        if (NSIntersectionRange((NSRange)self[72], v19).length)
          return 2;
      }
    }
  }
  if (self->_baseTexture == v9)
  {
    baseLevelOffset = self->_baseLevelOffset;
    v15 = baseLevelOffset >= v6;
    v18 = baseLevelOffset - v6;
    if (v15 && v18 < v10)
    {
      v20.location = v7;
      v20.length = v11;
      if (NSIntersectionRange((NSRange)self[56], v20).length)
        return 1;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return self->_baseLevelOffset ^ (unint64_t)self->_baseTexture;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_baseTexture == (MTLTexture *)*((_QWORD *)a3 + 3)
      && self->_baseLevelOffset == *((_QWORD *)a3 + 5)
      && NSIntersectionRange((NSRange)self[56], *(NSRange *)(a3 + 56)).length != 0;
}

- (MTLTexture)attachmentTexture
{
  return self->_attachmentTexture;
}

- (MTLTexture)baseResolveTexture
{
  return self->_baseResolveTexture;
}

- (MTLTexture)baseTexture
{
  return self->_baseTexture;
}

- (unint64_t)renderTargetArrayLength
{
  return self->_renderTargetArrayLength;
}

- (unint64_t)baseLevelOffset
{
  return self->_baseLevelOffset;
}

- (unint64_t)resolveLevelOffset
{
  return self->_resolveLevelOffset;
}

- (_NSRange)baseSliceRangeOffset
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_baseSliceRangeOffset.length;
  location = self->_baseSliceRangeOffset.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)resolveSliceRangeOffset
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_resolveSliceRangeOffset.length;
  location = self->_resolveSliceRangeOffset.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
