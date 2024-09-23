@implementation MTLToolsTexture

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsTexture;
  -[MTLToolsResource dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
  v10[0] = v5;
  v10[1] = CFSTR("label =");
  if (-[MTLToolsResource label](self, "label"))
    v8 = -[MTLToolsResource label](self, "label");
  else
    v8 = CFSTR("<none>");
  v10[2] = v8;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (MTLToolsTexture)initWithBaseObject:(id)a3 parent:(id)a4 parentTexture:(id)a5
{
  MTLToolsTexture *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLToolsTexture;
  v6 = -[MTLToolsResource initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a5);
  if (v6)
  {
    v6->_parentTexture = (MTLTexture *)a5;
    v6->_buffer = (MTLBuffer *)(id)objc_msgSend(a5, "buffer");
  }
  return v6;
}

- (MTLToolsTexture)initWithBaseObject:(id)a3 parent:(id)a4 buffer:(id)a5
{
  MTLToolsTexture *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLToolsTexture;
  v6 = -[MTLToolsResource initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a5);
  if (v6)
  {
    v6->_buffer = (MTLBuffer *)a5;
    v6->_parentTexture = 0;
  }
  return v6;
}

- (id)realRootResource
{
  if (-[MTLToolsTexture buffer](self, "buffer"))
    return -[MTLToolsTexture buffer](self, "buffer");
  if (-[MTLToolsTexture parentTexture](self, "parentTexture"))
    return (id)-[MTLTexture realRootResource](-[MTLToolsTexture parentTexture](self, "parentTexture"), "realRootResource");
  return self;
}

- (MTLResource)rootResource
{
  MTLTexture *parentTexture;

  parentTexture = self->_parentTexture;
  if (!parentTexture)
    return self->_buffer;
  return parentTexture;
}

- (unint64_t)gpuHandle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

- (unint64_t)parentRelativeLevel
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentRelativeLevel");
}

- (unint64_t)parentRelativeSlice
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentRelativeSlice");
}

- (unint64_t)bufferOffset
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bufferOffset");
}

- (unint64_t)bufferBytesPerRow
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bufferBytesPerRow");
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "swizzle");
}

- (unsigned)swizzleKey
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "swizzleKey");
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (BOOL)isCompressed
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCompressed");
}

- (int64_t)compressionFeedback
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "compressionFeedback");
}

- (int64_t)compressionType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "compressionType");
}

- (unint64_t)compressionFootprint
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "compressionFootprint");
}

- (void)copyFromSlice:(unint64_t)a3 mipmapLevel:(unint64_t)a4 origin:(id *)a5 size:(id *)a6 toPixels:(void *)a7 rowBytes:(unint64_t)a8 imageBytes:(unint64_t)a9
{
  __int128 v9;
  _OWORD v10[4];
  _BYTE v11[32];

  *(_QWORD *)v11 = a5->var2;
  v9 = *(_OWORD *)&a5->var0;
  *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v11[8] = *a6;
  v10[0] = v9;
  v10[1] = *(_OWORD *)v11;
  v10[2] = *(_OWORD *)&v11[16];
  v10[3] = v9;
  -[MTLToolsTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a7, a8, a9, v10, a4, a3);
}

- (void)copyFromPixels:(const void *)a3 rowBytes:(unint64_t)a4 imageBytes:(unint64_t)a5 toSlice:(unint64_t)a6 mipmapLevel:(unint64_t)a7 origin:(id *)a8 size:(id *)a9
{
  __int128 v9;
  _OWORD v10[4];
  _BYTE v11[32];

  *(_QWORD *)v11 = a8->var2;
  v9 = *(_OWORD *)&a8->var0;
  *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v11[8] = *a9;
  v10[0] = v9;
  v10[1] = *(_OWORD *)v11;
  v10[2] = *(_OWORD *)&v11[16];
  v10[3] = v9;
  -[MTLToolsTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v10, a7, a6, a3, a4, a5);
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  -[MTLToolsTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a3, *(_OWORD *)&a5->var0.var0, a5->var0.var2, a5->var1.var0, *(_OWORD *)&a5->var1.var1);
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  __int128 v6;
  _OWORD v7[3];

  v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLToolsTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, a4, 0, a5, a6, 0);
}

- (unint64_t)textureType
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "textureType");
}

- (unint64_t)pixelFormat
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pixelFormat");
}

- (unint64_t)usage
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "usage");
}

- (unint64_t)width
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "width");
}

- (unint64_t)height
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "height");
}

- (unint64_t)depth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "depth");
}

- (unint64_t)mipmapLevelCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "mipmapLevelCount");
}

- (unint64_t)sampleCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCount");
}

- (unint64_t)arrayLength
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "arrayLength");
}

- (BOOL)isShareable
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isShareable");
}

- (BOOL)isSparse
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isSparse");
}

- (BOOL)isFramebufferOnly
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isFramebufferOnly");
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sparseSurfaceDefaultValue");
}

- (unint64_t)firstMipmapInTail
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "firstMipmapInTail");
}

- (unint64_t)tailSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tailSizeInBytes");
}

- (unint64_t)tailSizeInBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tailSizeInBytes");
}

- (BOOL)allowGPUOptimizedContents
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allowGPUOptimizedContents");
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  id v14;
  __int128 v15;
  _OWORD v16[3];

  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = *(_OWORD *)&a6->var0.var2;
  v16[0] = *(_OWORD *)&a6->var0.var0;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v14, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a3, a4, a5, v16, a7, a8);
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14;
  __int128 v15;
  _OWORD v16[3];

  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = *(_OWORD *)&a3->var0.var2;
  v16[0] = *(_OWORD *)&a3->var0.var0;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v14, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v16, a4, a5, a6, a7, a8);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  MTLToolsTexture *v10;

  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a4)
    v8 = objc_msgSend(v7, "newTextureViewWithPixelFormat:resourceIndex:", a3, a4);
  else
    v8 = objc_msgSend(v7, "newTextureViewWithPixelFormat:", a3);
  v9 = (void *)v8;
  if (!v8)
    return 0;
  v10 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:]([MTLToolsTexture alloc], "initWithBaseObject:parent:parentTexture:", v8, self->super.super._device, self);

  return v10;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v14;
  uint64_t v15;
  void *v16;
  MTLToolsTexture *v17;

  length = a6.length;
  location = a6.location;
  v9 = a5.length;
  v10 = a5.location;
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a7)
    v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, v10, v9, location, length, a7);
  else
    v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, v10, v9, location, length);
  v16 = (void *)v15;
  if (!v15)
    return 0;
  v17 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:]([MTLToolsTexture alloc], "initWithBaseObject:parent:parentTexture:", v15, self->super.super._device, self);

  return v17;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  return -[MTLToolsTexture newTextureViewWithPixelFormat:resourceIndex:](self, "newTextureViewWithPixelFormat:resourceIndex:", a3, 0);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  return -[MTLToolsTexture newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, 0);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  id v15;
  uint64_t v16;
  void *v17;
  MTLToolsTexture *v18;

  length = a6.length;
  location = a6.location;
  v10 = a5.length;
  v11 = a5.location;
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a8)
    v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7, a8);
  else
    v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7);
  v17 = (void *)v16;
  if (!v16)
    return 0;
  v18 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:]([MTLToolsTexture alloc], "initWithBaseObject:parent:parentTexture:", v16, -[MTLToolsObject device](self, "device"), self);

  return v18;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  return -[MTLToolsTexture newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, 0);
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id result;
  id v8;
  MTLToolsTexture *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCompressedTextureViewWithPixelFormat:textureType:level:slice:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:]([MTLToolsTexture alloc], "initWithBaseObject:parent:parentTexture:", result, -[MTLToolsObject device](self, "device"), self);

    return v9;
  }
  return result;
}

- (BOOL)canGenerateMipmapLevels
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "canGenerateMipmapLevels");
}

- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "generateMipmapLevel:slice:", a3, a4);
}

- (unint64_t)rotation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "rotation");
}

- (id)newSharedTextureHandle
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureHandle");
}

- (__IOSurface)iosurface
{
  return (__IOSurface *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "iosurface");
}

- (unint64_t)iosurfacePlane
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "iosurfacePlane");
}

- (unint64_t)numFaces
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "numFaces");
}

- (BOOL)isDrawable
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isDrawable");
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (unint64_t)colorSpaceConversionMatrix
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "colorSpaceConversionMatrix");
}

- (MTLTexture)parentTexture
{
  return self->_parentTexture;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

@end
