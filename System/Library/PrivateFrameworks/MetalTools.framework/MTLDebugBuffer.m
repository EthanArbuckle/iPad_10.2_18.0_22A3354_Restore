@implementation MTLDebugBuffer

- (unint64_t)length
{
  return self->_length;
}

- (MTLDebugBuffer)initWithBuffer:(id)a3 device:(id)a4 options:(unint64_t)a5
{
  MTLDebugBuffer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLDebugBuffer;
  v7 = -[MTLToolsResource initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3, a4);
  if (v7)
  {
    v7->_length = objc_msgSend(a3, "length");
    v7->_common = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v7->super.super._options = a5;
    atomic_store(0, (unsigned int *)&v7->_purgeableStateToken);
    v7->_purgeableStateHasBeenSet = 0;
  }
  return v7;
}

- (MTLDebugBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  MTLDebugBuffer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLDebugBuffer;
  v8 = -[MTLToolsResource initWithBaseObject:parent:heap:](&v10, sel_initWithBaseObject_parent_heap_, a3, a4, a4);
  if (v8)
  {
    v8->_length = objc_msgSend(a3, "length");
    v8->_common = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v8->super.super._options = a6;
    atomic_store(0, (unsigned int *)&v8->_purgeableStateToken);
    v8->_purgeableStateHasBeenSet = 0;
  }
  return v8;
}

- (MTLDebugBuffer)initWithBuffer:(id)a3 device:(id)a4 bytes:(const void *)a5 options:(unint64_t)a6
{
  MTLDebugBuffer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugBuffer;
  v9 = -[MTLToolsResource initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3, a4);
  if (v9)
  {
    v9->_length = objc_msgSend(a3, "length");
    v9->_common = -[MTLDebugResource initWithBaseObject:]([MTLDebugResource alloc], "initWithBaseObject:", a3);
    v9->_pointer = a5;
    v9->super.super._options = a6;
    atomic_store(0, (unsigned int *)&v9->_purgeableStateToken);
    v9->_purgeableStateHasBeenSet = 0;
    v9->_isContentExposedToCPU = 1;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugBuffer;
  -[MTLToolsBuffer dealloc](&v3, sel_dealloc);
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (BOOL)doesAliasResource:(id)a3
{
  return -[MTLDebugResource doesAliasResource:](self->_common, "doesAliasResource:", a3);
}

- (void)makeAliasable
{
  if (!objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap"))
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "makeAliasable");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (unint64_t)parentGPUAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentGPUAddress");
}

- (void)setParentGPUAddress:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setParentGPUAddress:", a3);
}

- (unint64_t)parentGPUSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parentGPUSize");
}

- (void)setParentGPUSize:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setParentGPUSize:", a3);
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  return -[MTLDebugResource doesAliasAllResources:count:](self->_common, "doesAliasAllResources:count:", a3, a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  return -[MTLDebugResource doesAliasAnyResources:count:](self->_common, "doesAliasAnyResources:count:", a3, a4);
}

- (id)description
{
  return -[MTLToolsBuffer formattedDescription:](self, "formattedDescription:", 0);
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int16 v13;
  unint64_t options_low;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  MTLDebugTexture *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t options;

  v9 = (void *)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device"), "baseObject");
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "textureType") == 9)
    _validateTextureBufferDescriptor(a3, v9);
  _MTLMessageContextEnd();
  v10 = objc_msgSend(a3, "textureType");
  v11 = objc_msgSend(a3, "pixelFormat");
  if (v10 == 9)
    v12 = objc_msgSend(v9, "minimumTextureBufferAlignmentForPixelFormat:", v11);
  else
    v12 = objc_msgSend(v9, "minimumLinearTextureAlignmentForPixelFormat:", v11);
  validateNewTexture(self, (MTLTextureDescriptor *)a3, a4, a5, v12, v12);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v13 = objc_msgSend(a3, "resourceOptions");
  options_low = LOBYTE(self->super.super._options);
  v15 = -[MTLToolsResource resourceOptions](self, "resourceOptions");
  if ((v13 & 0x300) != 0)
    v16 = 0;
  else
    v16 = v15 & 0x300;
  if ((v16 | v13 & 0x3FF) != (v15 & 0x300 | options_low))
  {
    v21 = objc_msgSend(a3, "resourceOptions");
    options = self->super.super._options;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "depth", v21, options) != 1)
  {
    v22 = objc_msgSend(a3, "depth");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", v22) != 1)
  {
    v23 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "sampleCount", v23) != 1)
  {
    v24 = objc_msgSend(a3, "sampleCount");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "arrayLength", v24) != 1)
  {
    v25 = objc_msgSend(a3, "arrayLength");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "compressionType", v25) || objc_msgSend(a3, "compressionFootprint"))
    _MTLMessageContextPush_();
  if ((objc_msgSend(v9, "supportsRenderToLinearTextures") & 1) == 0 && (objc_msgSend(a3, "usage") & 4) != 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v17 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5);
  if (!v17)
    return 0;
  v18 = (void *)v17;
  v19 = -[MTLDebugTexture initWithBaseTexture:device:buffer:offset:bytesPerRow:]([MTLDebugTexture alloc], "initWithBaseTexture:device:buffer:offset:bytesPerRow:", v17, -[MTLToolsObject device](self, "device"), self, a4, a5);

  return v19;
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int16 v18;
  unint64_t options_low;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  MTLDebugTexture *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t options;

  v11 = (void *)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device"), "baseObject");
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "textureType") == 3)
  {
    v12 = objc_msgSend(v11, "linearTextureArrayAlignmentBytes");
    v13 = objc_msgSend(v11, "linearTextureArrayAlignmentSlice");
    v14 = v13;
    if (!v12 || !(_DWORD)v13)
      _MTLMessageContextPush_();
    if ((a6 & ((_DWORD)v14 - 1)) != 0)
    {
      v26 = v14;
      _MTLMessageContextPush_();
    }
  }
  else if (objc_msgSend(a3, "textureType") == 9)
  {
    _validateTextureBufferDescriptor(a3, v11);
  }
  _MTLMessageContextEnd();
  if (objc_msgSend(a3, "textureType") == 3)
  {
    v15 = objc_msgSend(v11, "linearTextureArrayAlignmentBytes");
    v16 = objc_msgSend(v11, "linearTextureArrayAlignmentSlice");
  }
  else if (objc_msgSend(a3, "textureType") == 9)
  {
    v16 = objc_msgSend(v11, "minimumTextureBufferAlignmentForPixelFormat:", objc_msgSend(a3, "pixelFormat"));
    v15 = 0;
  }
  else
  {
    if (objc_msgSend(a3, "usage") == 1)
      v17 = objc_msgSend(v11, "deviceLinearReadOnlyTextureAlignmentBytes");
    else
      v17 = objc_msgSend(v11, "minLinearTextureAlignmentForPixelFormat:", objc_msgSend(a3, "pixelFormat"));
    v15 = v17;
    v16 = v17;
  }
  validateNewTexture(self, (MTLTextureDescriptor *)a3, a4, a5, v16, v15);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v18 = objc_msgSend(a3, "resourceOptions");
  options_low = LOBYTE(self->super.super._options);
  v20 = -[MTLToolsResource resourceOptions](self, "resourceOptions");
  if ((v18 & 0x300) != 0)
    v21 = 0;
  else
    v21 = v20 & 0x300;
  if ((v21 | v18 & 0x3FF) != (v20 & 0x300 | options_low))
  {
    v26 = objc_msgSend(a3, "resourceOptions");
    options = self->super.super._options;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "depth", v26, options) != 1)
  {
    v27 = objc_msgSend(a3, "depth");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", v27) != 1)
  {
    v28 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "sampleCount", v28) != 1)
  {
    v29 = objc_msgSend(a3, "sampleCount");
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend(v11, "supportsRenderToLinearTextures", v29) & 1) == 0 && (objc_msgSend(a3, "usage") & 4) != 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v22 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", a3, a4, a5, a6);
  if (!v22)
    return 0;
  v23 = (void *)v22;
  v24 = -[MTLDebugTexture initWithBaseTexture:device:buffer:offset:bytesPerRow:bytesPerImage:]([MTLDebugTexture alloc], "initWithBaseTexture:device:buffer:offset:bytesPerRow:bytesPerImage:", v22, -[MTLToolsObject device](self, "device"), self, a4, a5, a6);

  return v24;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap"))
    MTLReportFailure();
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken))
        MTLReportFailure();
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (void)didModifyRange:(_NSRange)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "didModifyRange:", a3.location, a3.length);
}

- (void)contents
{
  -[MTLToolsResource validateCPUWriteable](self, "validateCPUWriteable");
  self->_isContentExposedToCPU = 1;
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "contents");
}

- (id)copyDebugMarkers
{
  id result;

  result = (id)-[NSMutableArray count](self->_debugMarkers, "count");
  if (result)
    return (id)-[NSMutableArray copy](self->_debugMarkers, "copy");
  return result;
}

- (void)addDebugMarker:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugBufferMarker *v8;
  NSMutableArray *debugMarkers;
  objc_super v10;

  length = a4.length;
  location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugBuffer;
  -[MTLToolsBuffer addDebugMarker:range:](&v10, sel_addDebugMarker_range_);
  v8 = objc_alloc_init(MTLDebugBufferMarker);
  -[MTLDebugBufferMarker setLabel:](v8, "setLabel:", a3);
  -[MTLDebugBufferMarker setRange:](v8, "setRange:", location, length);
  debugMarkers = self->_debugMarkers;
  if (!debugMarkers)
  {
    debugMarkers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_debugMarkers = debugMarkers;
  }
  -[NSMutableArray addObject:](debugMarkers, "addObject:", v8);

}

- (void)removeAllDebugMarkers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugBuffer;
  -[MTLToolsBuffer removeAllDebugMarkers](&v3, sel_removeAllDebugMarkers);
  -[NSMutableArray removeAllObjects](self->_debugMarkers, "removeAllObjects");
}

- (void)lockPurgeableState
{
  atomic<int> *p_purgeableStateToken;
  unsigned int v3;

  p_purgeableStateToken = &self->_purgeableStateToken;
  do
    v3 = __ldaxr((unsigned int *)p_purgeableStateToken);
  while (__stlxr(v3 + 1, (unsigned int *)p_purgeableStateToken));
}

- (void)unlockPurgeableState
{
  atomic<int> *p_purgeableStateToken;
  unsigned int v3;

  p_purgeableStateToken = &self->_purgeableStateToken;
  do
    v3 = __ldaxr((unsigned int *)p_purgeableStateToken);
  while (__stlxr(v3 - 1, (unsigned int *)p_purgeableStateToken));
}

- (BOOL)purgeableStateValidForRendering
{
  return !self->_purgeableStateHasBeenSet || -[MTLDebugBuffer setPurgeableState:](self, "setPurgeableState:", 1) == 2;
}

- (BOOL)detachBacking
{
  if ((-[MTLDevice supportsResourceDetachBacking](-[MTLToolsObject device](self, "device"), "supportsResourceDetachBacking") & 1) == 0)MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "detachBacking");
}

- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  if ((-[MTLDevice supportsResourceDetachBacking](-[MTLToolsObject device](self, "device"), "supportsResourceDetachBacking") & 1) == 0)MTLReportFailure();
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithBytesNoCopy:length:deallocator:", a3, a4, a5);
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  __int128 v8;

  v4 = a4;
  if ((-[MTLDevice supportsResourceDetachBacking](-[MTLToolsObject device](self, "device"), "supportsResourceDetachBacking") & 1) == 0)MTLReportFailure();
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  -[MTLDebugDevice validateAddressRanges:expectedTotalSize:context:](self->_debugDevice, "validateAddressRanges:expectedTotalSize:context:", a3, -[MTLDebugBuffer length](self, "length"), &v8);
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithRanges:readOnly:", a3, v4);
}

- (MTLDebugResource)common
{
  return self->_common;
}

- (const)pointer
{
  return self->_pointer;
}

- (BOOL)isContentExposedToCPU
{
  return self->_isContentExposedToCPU;
}

- (void)setIsContentExposedToCPU:(BOOL)a3
{
  self->_isContentExposedToCPU = a3;
}

@end
