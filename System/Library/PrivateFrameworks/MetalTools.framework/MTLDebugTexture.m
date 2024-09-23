@implementation MTLDebugTexture

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 offset:(unint64_t)a6 bytesPerRow:(unint64_t)a7
{
  char *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTLDebugTexture;
  v11 = -[MTLToolsTexture initWithBaseObject:parent:buffer:](&v18, sel_initWithBaseObject_parent_buffer_, a3, a4, a5);
  if (v11)
  {
    *((_QWORD *)v11 + 33) = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v12 = objc_msgSend(a3, "cpuCacheMode");
    *((_QWORD *)v11 + 5) = v12 | (16 * objc_msgSend(a3, "storageMode"));
    *((_QWORD *)v11 + 17) = 0;
    *((_QWORD *)v11 + 34) = a6;
    *((_QWORD *)v11 + 35) = a7;
    *((_QWORD *)v11 + 36) = 0;
    atomic_store(0, (unsigned int *)v11 + 36);
    v11[148] = 0;
    objc_msgSend(a4, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v11 + 15) = v17;
    *(_OWORD *)(v11 + 88) = v15;
    *(_OWORD *)(v11 + 104) = v16;
    *(_OWORD *)(v11 + 72) = v14;
    v11[256] = 0;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((_QWORD *)v11 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v11;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 buffer:(id)a5 offset:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  char *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MTLDebugTexture;
  v13 = -[MTLToolsTexture initWithBaseObject:parent:buffer:](&v20, sel_initWithBaseObject_parent_buffer_, a3, a4, a5);
  if (v13)
  {
    *((_QWORD *)v13 + 33) = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v14 = objc_msgSend(a3, "cpuCacheMode");
    *((_QWORD *)v13 + 5) = v14 | (16 * objc_msgSend(a3, "storageMode"));
    *((_QWORD *)v13 + 17) = 0;
    *((_QWORD *)v13 + 34) = a6;
    *((_QWORD *)v13 + 35) = a7;
    *((_QWORD *)v13 + 36) = a8;
    atomic_store(0, (unsigned int *)v13 + 36);
    v13[148] = 0;
    objc_msgSend(a4, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v13 + 15) = v19;
    *(_OWORD *)(v13 + 88) = v17;
    *(_OWORD *)(v13 + 104) = v18;
    *(_OWORD *)(v13 + 72) = v16;
    v13[256] = 1;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((_QWORD *)v13 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v13;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4
{
  return -[MTLDebugTexture initWithBaseTexture:device:plane:](self, "initWithBaseTexture:device:plane:", a3, a4, 0);
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 plane:(unint64_t)a5
{
  char *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTLDebugTexture;
  v8 = -[MTLToolsResource initWithBaseObject:parent:](&v15, sel_initWithBaseObject_parent_);
  if (v8)
  {
    *((_QWORD *)v8 + 33) = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v9 = objc_msgSend(a3, "cpuCacheMode");
    *((_QWORD *)v8 + 5) = v9 | (16 * objc_msgSend(a3, "storageMode"));
    *((_QWORD *)v8 + 17) = 0;
    *((_QWORD *)v8 + 37) = a5;
    atomic_store(0, (unsigned int *)v8 + 36);
    v8[148] = 0;
    objc_msgSend(a4, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v8 + 15) = v14;
    *(_OWORD *)(v8 + 88) = v12;
    *(_OWORD *)(v8 + 104) = v13;
    *(_OWORD *)(v8 + 72) = v11;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((_QWORD *)v8 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v8;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 heap:(id)a4 device:(id)a5
{
  char *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTLDebugTexture;
  v7 = -[MTLToolsResource initWithBaseObject:parent:heap:](&v14, sel_initWithBaseObject_parent_heap_, a3, a4, a4);
  if (v7)
  {
    *((_QWORD *)v7 + 33) = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v8 = objc_msgSend(a3, "cpuCacheMode");
    *((_QWORD *)v7 + 5) = v8 | (16 * objc_msgSend(a3, "storageMode"));
    *((_QWORD *)v7 + 17) = 0;
    *((_QWORD *)v7 + 37) = 0;
    atomic_store(0, (unsigned int *)v7 + 36);
    v7[148] = 0;
    objc_msgSend(a5, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v7 + 15) = v13;
    *(_OWORD *)(v7 + 88) = v11;
    *(_OWORD *)(v7 + 104) = v12;
    *(_OWORD *)(v7 + 72) = v10;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((_QWORD *)v7 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v7;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5
{
  char *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTLDebugTexture;
  v7 = -[MTLToolsTexture initWithBaseObject:parent:parentTexture:](&v14, sel_initWithBaseObject_parent_parentTexture_, a3, a4, a5);
  if (v7)
  {
    *((_QWORD *)v7 + 33) = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    atomic_store(0, (unsigned int *)v7 + 36);
    v7[148] = 0;
    v8 = objc_msgSend(a3, "cpuCacheMode");
    *((_QWORD *)v7 + 5) = v8 | (16 * objc_msgSend(a3, "storageMode"));
    *((_QWORD *)v7 + 17) = 0;
    objc_msgSend(a4, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v7 + 15) = v13;
    *(_OWORD *)(v7 + 88) = v11;
    *(_OWORD *)(v7 + 104) = v12;
    *(_OWORD *)(v7 + 72) = v10;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__assign_unique<std::pair<SubView const,unsigned long> const*>((_QWORD *)v7 + 27, 0, 0);
  }
  return (MTLDebugTexture *)v7;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6
{
  MTLDebugTexture *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v8 = -[MTLDebugTexture initWithBaseTexture:device:texture:](self, "initWithBaseTexture:device:texture:", a3, a4, a5, a6);
  if (v8)
  {
    objc_msgSend(a4, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v8 + 15) = v13;
    *(_OWORD *)((char *)v8 + 88) = v11;
    *(_OWORD *)((char *)v8 + 104) = v12;
    *(_OWORD *)((char *)v8 + 72) = v10;
  }
  return v8;
}

- (MTLDebugTexture)initWithBaseTexture:(id)a3 device:(id)a4 texture:(id)a5 pixelFormat:(unint64_t)a6 textureType:(unint64_t)a7 levels:(_NSRange)a8 slices:(_NSRange)a9
{
  MTLDebugTexture *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v11 = -[MTLDebugTexture initWithBaseTexture:device:texture:](self, "initWithBaseTexture:device:texture:", a3, a4, a5, a6, a7);
  if (v11)
  {
    objc_msgSend(a4, "originalObject");
    objc_msgSend(a3, "pixelFormat");
    MTLPixelFormatGetInfoForDevice();
    *((_QWORD *)v11 + 15) = v16;
    *(_OWORD *)((char *)v11 + 88) = v14;
    *(_OWORD *)((char *)v11 + 104) = v15;
    *(_OWORD *)((char *)v11 + 72) = v13;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (*((_QWORD *)self + 17)
    && -[MTLToolsTexture usage](self, "usage") != *((_QWORD *)self + 17)
    && +[MTLDebugDevice complainAboutSloppyTextureUsage](MTLDebugDevice, "complainAboutSloppyTextureUsage"))
  {
    -[MTLToolsTexture usage](self, "usage");
    MTLReportFailure();
  }
  std::__hash_table<AttachmentDescriptorSimple,AttachmentDescriptorSimple::hash_t,AttachmentDescriptorSimple::equal_t,std::allocator<AttachmentDescriptorSimple>>::clear((_QWORD *)self + 27);

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugTexture;
  -[MTLToolsTexture dealloc](&v3, sel_dealloc);
}

- (BOOL)doesAliasResource:(id)a3
{
  return objc_msgSend(*((id *)self + 33), "doesAliasResource:", a3);
}

- (void)makeAliasable
{
  if (-[MTLToolsTexture isSparse](self, "isSparse"))
    MTLReportFailure();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode") == 3)
    MTLReportFailure();
  if (!objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap"))
    MTLReportFailure();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentTexture"))
    MTLReportFailure();
  if (!objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "buffer"))
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "makeAliasable");
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  return objc_msgSend(*((id *)self + 33), "doesAliasAllResources:count:", a3, a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  return objc_msgSend(*((id *)self + 33), "doesAliasAnyResources:count:", a3, a4);
}

- (BOOL)requireUsage:(unint64_t)a3
{
  *((_QWORD *)self + 17) |= a3;
  return (a3 & ~-[MTLToolsTexture usage](self, "usage")) == 0;
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v15;
  __int128 v16;
  unint64_t v17;
  _OWORD v18[3];
  MTLSize var1;
  MTLOrigin var0;

  var0 = (MTLOrigin)a3->var0;
  var1 = (MTLSize)a3->var1;
  _validateReplaceRegion(self, &var0, &var1, a5, a4, a6, a7, 1, a8, v17);
  -[MTLToolsResource validateCPUWriteable](self, "validateCPUWriteable");
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = *(_OWORD *)&a3->var0.var2;
  v18[0] = *(_OWORD *)&a3->var0.var0;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v15, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v18, a4, a5, a6, a7, a8);
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  id v11;
  __int128 v12;
  unint64_t v13;
  _OWORD v14[3];
  MTLSize var1;
  MTLOrigin var0;

  var0 = (MTLOrigin)a3->var0;
  var1 = (MTLSize)a3->var1;
  _validateReplaceRegion(self, &var0, &var1, 0, a4, a5, a6, 0, 0, v13);
  -[MTLToolsResource validateCPUWriteable](self, "validateCPUWriteable");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = *(_OWORD *)&a3->var0.var2;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v11, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v14, a4, a5, a6);
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  id v15;
  __int128 v16;
  unint64_t v17;
  _OWORD v18[3];
  MTLSize var1;
  MTLOrigin var0;

  var0 = (MTLOrigin)a6->var0;
  var1 = (MTLSize)a6->var1;
  _validateGetBytes(self, &var0, &var1, a8, a7, a3, a4, 1, a5, v17);
  -[MTLToolsResource validateCPUReadable](self, "validateCPUReadable");
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v15, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a3, a4, a5, v18, a7, a8);
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  id v11;
  __int128 v12;
  unint64_t v13;
  _OWORD v14[3];
  MTLSize var1;
  MTLOrigin var0;

  var0 = (MTLOrigin)a5->var0;
  var1 = (MTLSize)a5->var1;
  _validateGetBytes(self, &var0, &var1, 0, a6, a3, a4, 0, 0, v13);
  -[MTLToolsResource validateCPUReadable](self, "validateCPUReadable");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = *(_OWORD *)&a5->var0.var2;
  v14[0] = *(_OWORD *)&a5->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v11, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", a3, a4, v14, a6);
}

- (id)description
{
  return -[MTLToolsTexture formattedDescription:](self, "formattedDescription:", 0);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  MTLDebugTexture *v10;

  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)-[MTLToolsTexture textureType](self, "textureType"));
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a4)
    v8 = objc_msgSend(v7, "newTextureViewWithPixelFormat:resourceIndex:", a3, a4);
  else
    v8 = objc_msgSend(v7, "newTextureViewWithPixelFormat:", a3);
  v9 = (void *)v8;
  if (!v8)
    return 0;
  v10 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:", v8, -[MTLToolsObject device](self, "device"), self, a3);

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
  MTLDebugTexture *v17;

  length = a6.length;
  location = a6.location;
  v9 = a5.length;
  v10 = a5.location;
  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)a4);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a7)
    v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, v10, v9, location, length, a7);
  else
    v15 = objc_msgSend(v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, v10, v9, location, length);
  v16 = (void *)v15;
  if (!v15)
    return 0;
  v17 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:", v15, -[MTLToolsObject device](self, "device"), self, a3, a4, v10, v9, location, length);

  return v17;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  return -[MTLDebugTexture newTextureViewWithPixelFormat:resourceIndex:](self, "newTextureViewWithPixelFormat:resourceIndex:", a3, 0);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  return -[MTLDebugTexture newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, 0);
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
  MTLDebugTexture *v18;

  length = a6.length;
  location = a6.location;
  v10 = a5.length;
  v11 = a5.location;
  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)a4);
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  if (a8)
    v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7, a8);
  else
    v16 = objc_msgSend(v15, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, v11, v10, location, length, *(unsigned int *)&a7);
  v17 = (void *)v16;
  if (!v16)
    return 0;
  v18 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:", v16, -[MTLToolsObject device](self, "device"), self, a3, a4, v11, v10, location, length);

  return v18;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  return -[MTLDebugTexture newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, 0);
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id result;
  id v12;
  MTLDebugTexture *v13;

  _validateTextureView(self, (MTLPixelFormat)a3, (MTLTextureType)a4);
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCompressedTextureViewWithPixelFormat:textureType:level:slice:", a3, a4, a5, a6);
  if (result)
  {
    v12 = result;
    v13 = -[MTLDebugTexture initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:]([MTLDebugTexture alloc], "initWithBaseTexture:device:texture:pixelFormat:textureType:levels:slices:", result, -[MTLToolsObject device](self, "device"), self, a3, a4, a5, 1, a6, 1);

    return v13;
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap"))
    _MTLMessageContextPush_();
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)self + 36))
        _MTLMessageContextPush_();
    }
    *((_BYTE *)self + 148) = 1;
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (void)lockPurgeableState
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)((char *)self + 144);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
}

- (void)unlockPurgeableState
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)((char *)self + 144);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 - 1, v2));
}

- (BOOL)purgeableStateValidForRendering
{
  return !*((_BYTE *)self + 148) || -[MTLDebugTexture setPurgeableState:](self, "setPurgeableState:", 1) == 2;
}

- (void)addUsedRenderTarget:(unint64_t)a3 slices:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugTexture *v7;
  MTLTexture *v8;
  char *v9;
  _QWORD *v10;
  int v11;
  _QWORD v12[3];

  length = a4.length;
  location = a4.location;
  v7 = self;
  v8 = -[MTLToolsTexture parentTexture](self, "parentTexture");
  if (v8)
  {
    do
    {
      v9 = (char *)v8;
      a3 += -[MTLToolsTexture parentRelativeLevel](v7, "parentRelativeLevel");
      location += -[MTLToolsTexture parentRelativeSlice](v7, "parentRelativeSlice");
      v8 = (MTLTexture *)objc_msgSend(v9, "parentTexture");
      v7 = (MTLDebugTexture *)v9;
    }
    while (v8);
  }
  else
  {
    v9 = (char *)v7;
  }
  v12[0] = a3;
  v12[1] = location;
  v12[2] = length;
  std::mutex::lock((std::mutex *)(v9 + 152));
  v10 = std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::find<SubView>((_QWORD *)v9 + 27, v12);
  if (v10)
  {
    ++v10[5];
  }
  else
  {
    v11 = 1;
    std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::__emplace_unique_key_args<SubView,SubView const&,int>((uint64_t)(v9 + 216), v12, (uint64_t)v12, &v11);
  }
  std::mutex::unlock((std::mutex *)(v9 + 152));
}

- (void)removeUsedRenderTarget:(unint64_t)a3 slices:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugTexture *v7;
  MTLTexture *v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD v12[3];

  length = a4.length;
  location = a4.location;
  v7 = self;
  v8 = -[MTLToolsTexture parentTexture](self, "parentTexture");
  if (v8)
  {
    do
    {
      v9 = (char *)v8;
      a3 += -[MTLToolsTexture parentRelativeLevel](v7, "parentRelativeLevel");
      location += -[MTLToolsTexture parentRelativeSlice](v7, "parentRelativeSlice");
      v8 = (MTLTexture *)objc_msgSend(v9, "parentTexture");
      v7 = (MTLDebugTexture *)v9;
    }
    while (v8);
  }
  else
  {
    v9 = (char *)v7;
  }
  v12[0] = a3;
  v12[1] = location;
  v12[2] = length;
  std::mutex::lock((std::mutex *)(v9 + 152));
  v10 = std::__hash_table<std::__hash_value_type<SubView,unsigned long>,std::__unordered_map_hasher<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::hash_t,SubView::equal_t,true>,std::__unordered_map_equal<SubView,std::__hash_value_type<SubView,unsigned long>,SubView::equal_t,SubView::hash_t,true>,std::allocator<std::__hash_value_type<SubView,unsigned long>>>::find<SubView>((_QWORD *)v9 + 27, v12);
  if (v10)
  {
    v11 = v10[5] - 1;
    v10[5] = v11;
    if (!v11)
      std::__hash_table<MTLToolsObject *,std::hash<MTLToolsObject *>,std::equal_to<MTLToolsObject *>,std::allocator<MTLToolsObject *>>::erase((_QWORD *)v9 + 27, v10);
  }
  std::mutex::unlock((std::mutex *)(v9 + 152));
}

- (MTLDebugResource)common
{
  return (MTLDebugResource *)*((_QWORD *)self + 33);
}

- (unint64_t)offset
{
  return *((_QWORD *)self + 34);
}

- (unint64_t)bytesPerRow
{
  return *((_QWORD *)self + 35);
}

- (unint64_t)bytesPerImage
{
  return *((_QWORD *)self + 36);
}

- (unint64_t)plane
{
  return *((_QWORD *)self + 37);
}

- (BOOL)isLinearTexture
{
  return *((_BYTE *)self + 256);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)self + 216);
  std::mutex::~mutex((std::mutex *)((char *)self + 152));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 19) = 850045863;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_QWORD *)self + 26) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 62) = 1065353216;
  return self;
}

@end
