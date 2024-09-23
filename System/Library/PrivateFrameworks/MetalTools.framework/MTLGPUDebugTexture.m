@implementation MTLGPUDebugTexture

- (MTLGPUDebugTexture)initWithTexture:(id)a3 heap:(id)a4 device:(id)a5
{
  MTLGPUDebugTexture *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugTexture;
  v5 = -[MTLToolsResource initWithBaseObject:parent:heap:](&v7, sel_initWithBaseObject_parent_heap_, a3, a5, a4);
  InitResourceIdentifier(v5);
  return v5;
}

- (MTLGPUDebugTexture)initWithTextureView:(id)a3 parentBuffer:(id)a4 heap:(id)a5 device:(id)a6
{
  MTLGPUDebugTexture *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugTexture;
  v6 = -[MTLToolsTexture initWithBaseObject:parent:buffer:](&v8, sel_initWithBaseObject_parent_buffer_, a3, a6, a4);
  InitResourceIdentifier(v6);
  return v6;
}

- (MTLGPUDebugTexture)initWithTextureView:(id)a3 parentTexture:(id)a4 heap:(id)a5 device:(id)a6
{
  MTLGPUDebugTexture *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugTexture;
  v6 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:](&v8, sel_initWithBaseObject_parent_parentTexture_, a3, a6, a4);
  InitResourceIdentifier(v6);
  return v6;
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return 0;
}

- (MTLTextureSPI)baseObject
{
  return (MTLTextureSPI *)self->super.super.super._baseObject;
}

- (unint64_t)gpuIdentifier
{
  return self->_identifier;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  id result;
  id v5;
  MTLGPUDebugTexture *v6;

  result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v6;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  id result;
  id v8;
  MTLGPUDebugTexture *v9;

  result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, a5.location, a5.length, a6.location, a6.length);
  if (result)
  {
    v8 = result;
    v9 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v9;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  id result;
  id v9;
  MTLGPUDebugTexture *v10;

  result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7);
  if (result)
  {
    v9 = result;
    v10 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v10;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id result;
  id v6;
  MTLGPUDebugTexture *v7;

  result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:resourceIndex:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:resourceIndex:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v7;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  id result;
  id v9;
  MTLGPUDebugTexture *v10;

  result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, a7);
  if (result)
  {
    v9 = result;
    v10 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v10;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  id result;
  id v10;
  MTLGPUDebugTexture *v11;

  result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, a8);
  if (result)
  {
    v10 = result;
    v11 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v11;
  }
  return result;
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id result;
  id v8;
  MTLGPUDebugTexture *v9;

  result = (id)-[MTLToolsObject newCompressedTextureViewWithPixelFormat:textureType:level:slice:](self->super.super.super._baseObject, "newCompressedTextureViewWithPixelFormat:textureType:level:slice:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLGPUDebugTexture initWithTextureView:parentTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTextureView:parentTexture:heap:device:", result, self, -[MTLToolsResource heap](self, "heap"), self->super.super.super._device);

    return v9;
  }
  return result;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject, a4);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject, a4, a5.var0.var1, *(_QWORD *)&a5.var1);
}

@end
