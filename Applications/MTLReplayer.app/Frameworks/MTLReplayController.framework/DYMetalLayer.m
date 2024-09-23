@implementation DYMetalLayer

- (id)nextDrawable
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  DYMetalDrawable *v11;

  v3 = -[DYMetalLayer pixelFormat](self, "pixelFormat");
  -[DYMetalLayer drawableSize](self, "drawableSize");
  v5 = (unint64_t)(v4 + 0.5);
  -[DYMetalLayer drawableSize](self, "drawableSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v3, v5, (unint64_t)(v6 + 0.5), 0));
  if (-[DYMetalLayer framebufferOnly](self, "framebufferOnly"))
    v8 = 4;
  else
    v8 = 0;
  objc_msgSend(v7, "setUsage:", v8);
  objc_msgSend(v7, "setIsDrawable:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYMetalLayer device](self, "device"));
  v10 = objc_msgSend(v9, "newTextureWithDescriptor:", v7);

  objc_msgSend(v10, "setLabel:", CFSTR("CAMetalLayer Drawable"));
  v11 = -[DYMetalDrawable initWithTexture:]([DYMetalDrawable alloc], "initWithTexture:", v10);

  return v11;
}

- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3
{
  unint64_t v5;
  double v6;
  unint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  DYMetalDrawable *v13;

  v5 = -[DYMetalLayer pixelFormat](self, "pixelFormat");
  -[DYMetalLayer drawableSize](self, "drawableSize");
  v7 = (unint64_t)(v6 + 0.5);
  -[DYMetalLayer drawableSize](self, "drawableSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v5, v7, (unint64_t)(v8 + 0.5), 0));
  if (-[DYMetalLayer framebufferOnly](self, "framebufferOnly"))
    v10 = 4;
  else
    v10 = 0;
  objc_msgSend(v9, "setUsage:", v10);
  objc_msgSend(v9, "setIsDrawable:", 1);
  objc_msgSend(v9, "setResourceIndex:", a3);
  objc_msgSend(v9, "setForceResourceIndex:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYMetalLayer device](self, "device"));
  v12 = objc_msgSend(v11, "newTextureWithDescriptor:", v9);

  objc_msgSend(v12, "setLabel:", CFSTR("CAMetalLayer Drawable"));
  v13 = -[DYMetalDrawable initWithTexture:]([DYMetalDrawable alloc], "initWithTexture:", v12);

  return v13;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (CATransform3D)transform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = v5;
  *(_OWORD *)&self->_transform.m11 = v3;
  *(_OWORD *)&self->_transform.m13 = v4;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = v8;
  *(_OWORD *)&self->_transform.m31 = v6;
  *(_OWORD *)&self->_transform.m33 = v7;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)drawableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawableSize.width;
  height = self->_drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDrawableSize:(CGSize)a3
{
  self->_drawableSize = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (BOOL)framebufferOnly
{
  return self->_framebufferOnly;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  self->_framebufferOnly = a3;
}

- (BOOL)wantsExtendedDynamicRangeContent
{
  return self->_wantsExtendedDynamicRangeContent;
}

- (void)setWantsExtendedDynamicRangeContent:(BOOL)a3
{
  self->_wantsExtendedDynamicRangeContent = a3;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void)setContentsScale:(double)a3
{
  self->_contentsScale = a3;
}

- (CGColorSpace)colorspace
{
  return self->_colorspace;
}

- (void)setColorspace:(CGColorSpace *)a3
{
  self->_colorspace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
