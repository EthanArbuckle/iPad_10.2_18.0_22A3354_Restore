@implementation IOGPUMetalTexture

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (unint64_t)hazardTrackingMode
{
  unint64_t v2;
  MTLHeap *buffer;

  v2 = (*(_QWORD *)&self->super._anon_50[88] >> 8) & 3;
  if (v2)
    return v2;
  buffer = (MTLHeap *)self->_buffer;
  if (!buffer)
  {
    buffer = (MTLHeap *)self->_parentTexture;
    if (!buffer)
    {
      buffer = -[IOGPUMetalResource heap](self, "heap");
      if (!buffer)
        return 2;
    }
  }
  return -[MTLHeap hazardTrackingMode](buffer, "hazardTrackingMode");
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unsigned int)a6 field:(unsigned int)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  uint64_t v27;
  IOGPUMetalTexture *v28;
  IOGPUMetalTexture *v29;
  unint64_t v30;
  uint64_t v32;
  id v34;
  uint64_t v35;

  v35 = *(_QWORD *)&a6;
  a8->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a8->var0.var14 = 0u;
  *(_OWORD *)(&a8->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  *(_OWORD *)&a8->var0.var12 = 0u;
  *(_OWORD *)&a8->var0.var0 = 0u;
  v14 = objc_msgSend(a4, "descriptorPrivate");
  v15 = v14;
  if (*(_QWORD *)(v14 + 72) >= 5uLL)
  {
    v32 = *(_QWORD *)(v14 + 72);
    MTLReportFailure();
  }
  v16 = (void *)IOSurfaceCopyValue(a5, (CFStringRef)*MEMORY[0x24BDD8E90]);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA58]) != 0;

  }
  else
  {
    v18 = 0;
  }
  MTLPixelFormatGetInfoForDevice();
  v19 = *(_QWORD *)(v15 + 72);
  v34 = a3;
  if (v19 <= 4 && ((1 << v19) & 0x1A) != 0)
  {
    v20 = (_QWORD *)(v15 + 16);
    v21 = (_QWORD *)(v15 + 24);
  }
  else
  {
    v21 = (_QWORD *)(v15 + 24);
    v20 = (_QWORD *)(v15 + 16);
  }
  if (!a5)
    MTLReportFailure();
  if (IOSurfaceGetPlaneCount(a5))
    v22 = 1;
  else
    v22 = v18;
  if ((v22 & 1) == 0)
  {
    IOSurfaceGetBaseAddress(a5);
    IOSurfaceGetBytesPerRow(a5);
    _mtlValidateStrideTextureParameters();
    if ((_DWORD)v35)
    {
      v32 = v35;
      MTLReportFailure();
    }
    objc_msgSend(a4, "pixelFormat", v32);
    MTLGetTextureLevelInfoForDeviceWithOptions();
    IOSurfaceGetBytesPerRow(a5);
    IOSurfaceGetAllocSize(a5);
    IOSurfaceGetBytesPerRow(a5);
    IOSurfaceGetHeight(a5);
    IOSurfaceGetElementHeight(a5);
    if (!IOSurfaceAllowsPixelSizeCasting(a5) && IOSurfaceGetBytesPerElement(a5))
      MTLReportFailure();
  }
  v23 = *(_QWORD *)v15;
  if ((unint64_t)(*(_QWORD *)v15 - 7) < 0xFFFFFFFFFFFFFFFELL)
    v24 = 1;
  else
    v24 = 6;
  v25 = (unint64_t)(*(_QWORD *)v15 - 7) < 0xFFFFFFFFFFFFFFFELL || v18;
  if ((v25 & 1) == 0)
    -[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:].cold.2();
  *(_QWORD *)&a8->var0.var0 = 130;
  a8->var0.var2 = *v20;
  a8->var0.var3 = *v21;
  if (v23 == 6)
  {
    a8->var0.var4 = *(_WORD *)(v15 + 56) * v24;
    v26 = v34;
  }
  else
  {
    v26 = v34;
    if (v23 == 3)
    {
      v27 = *(_QWORD *)(v15 + 56);
    }
    else
    {
      if (v23 == 1)
      {
        a8->var0.var3 = *(_QWORD *)(v15 + 56);
        goto LABEL_36;
      }
      v27 = *(_QWORD *)(v15 + 32);
    }
    a8->var0.var4 = v27;
  }
LABEL_36:
  a8->var0.var6 = v24;
  a8->var0.var7 = *(_QWORD *)(v15 + 40);
  a8->var0.var9 = 0;
  a8->var0.var10 = 0;
  a8->var0.var16.var1.var0 = IOSurfaceGetID(a5);
  a8->var0.var16.var1.var1 = v35;
  a8->var0.var16.var1.var2 = a7;
  a8->var0.var16.var1.var3 = 0;
  v28 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", v26, *(_QWORD *)(v15 + 112), a8, a9);
  v29 = v28;
  if (v28)
  {
    v28->_textureType = *(_QWORD *)v15;
    v28->_width = *(_QWORD *)(v15 + 16);
    v28->_height = *(_QWORD *)(v15 + 24);
    v28->_depth = *(_QWORD *)(v15 + 32);
    v28->_mipmapLevelCount = *(_QWORD *)(v15 + 40);
    v28->_sampleCount = *(_QWORD *)(v15 + 48);
    v28->_arrayLength = *(_QWORD *)(v15 + 56);
    v28->_numFaces = v24;
    v28->_pixelFormat = *(_QWORD *)(v15 + 8);
    v28->_usage = *(_QWORD *)(v15 + 176);
    v30 = *(_QWORD *)(v15 + 72);
    if (v30 && !*(_BYTE *)(v15 + 80))
      -[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:].cold.1();
    v28->_rotation = v30;
    v28->_swizzle = *(_DWORD *)(v15 + 84);
    v28->_writeSwizzleEnabled = *(_BYTE *)(v15 + 88);
    v28->_shareable = v18;
    if (v18)
      *(_QWORD *)&v28->super._anon_50[40] = IOSurfaceCopyValue(a5, (CFStringRef)*MEMORY[0x24BDD8EE0]);
    v29->_framebufferOnly = *(_BYTE *)(v15 + 80);
    CFRetain(a5);
    v29->_iosurface = a5;
    v29->_iosurfacePlane = v35;
    v29->_isDrawable = *(_BYTE *)(v15 + 81);
    v29->super._res.info.iosurface = a5;
    *((_BYTE *)&v29->super._res.var1 + 3) = a7;
    *(_QWORD *)&v29->super._res.var0 = IOSurfaceGetAllocSize(a5) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&v29->super._res.var1 + 3) << 56);
    v29->_allowGPUOptimizedContents = *(_BYTE *)(v15 + 128);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(v26, "deviceRef");
      objc_msgSend(v26, "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v29;
}

- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, objc_msgSend(a3, "swizzle"), v8);
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)MTLTextureSwizzleKeyToChannels();
}

- (IOGPUMetalTexture)initWithTextureInternal:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 compressedView:(BOOL)a9
{
  NSUInteger length;
  NSUInteger location;
  unsigned int v15;
  IOGPUMetalTexture *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  __IOSurface *iosurface;
  uint64_t v26;

  if (!a3)
    -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.1();
  length = a6.length;
  location = a6.location;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.6();
  v15 = MTLTextureSwizzleChannelsToKey();
  _mtlValidateMTLTextureSwizzleKey();
  objc_msgSend(a3, "device");
  LOBYTE(v26) = a9;
  _mtlValidateArgumentsForTextureViewOnDevice();
  v16 = -[IOGPUMetalResource initWithResource:](self, "initWithResource:", a3, v26);
  if (v16)
  {
    v16->_parentTexture = (IOGPUMetalTexture *)a3;
    v16->_buffer = (IOGPUMetalBuffer *)(id)objc_msgSend(a3, "buffer");
    v16->_parentRelativeLevel = location;
    v16->_parentRelativeSlice = a7.location;
    if (v16->_buffer)
    {
      if (length != 1)
        -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.5();
      if (a7.length != 1)
        -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.4();
    }
    v16->_bufferOffset = objc_msgSend(a3, "bufferOffset");
    v16->_bufferBytesPerRow = objc_msgSend(a3, "bufferBytesPerRow");
    v16->_textureType = a5;
    v17 = *((_QWORD *)a3 + 48) >> location;
    if (v17 <= 1)
      v17 = 1;
    v16->_width = v17;
    v18 = *((_QWORD *)a3 + 49) >> location;
    if (v18 <= 1)
      v18 = 1;
    v16->_height = v18;
    v19 = *((_QWORD *)a3 + 50) >> location;
    if (v19 <= 1)
      v19 = 1;
    v16->_depth = v19;
    v16->_pixelFormat = a4;
    v16->_usage = *((_QWORD *)a3 + 46);
    v20 = 6;
    if (a5 - 5 >= 2)
      v20 = 1;
    v16->_numFaces = v20;
    v16->_arrayLength = a7.length / v20;
    v16->_mipmapLevelCount = length;
    v16->_sampleCount = *((_QWORD *)a3 + 52);
    v16->_rotation = *((_QWORD *)a3 + 47);
    v16->_swizzle = v15;
    v16->_writeSwizzleEnabled = *((_BYTE *)a3 + 324);
    if (objc_msgSend((id)objc_msgSend(a3, "device"), "supportsTextureSwizzle")
      && v16->_swizzle != 84148994)
    {
      if (!v16->_usage)
        -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.3();
      objc_msgSend(a3, "device");
      v16->_usage &= ~MTLGetDisallowedTextureUsagesWhenSwizzling();
      _mtlValidateTextureUsage();
    }
    v16->_shareable = 0;
    v16->_framebufferOnly = *((_BYTE *)a3 + 441);
    v16->_iosurface = (__IOSurface *)*((_QWORD *)a3 + 42);
    v16->_iosurfacePlane = *((_QWORD *)a3 + 43);
    v16->_isDrawable = *((_BYTE *)a3 + 442);
    v16->_allowGPUOptimizedContents = *((_BYTE *)a3 + 496);
    v21 = (char *)a3 + 32;
    v22 = *((id *)v21 + 23);
    v23 = *((_QWORD *)v21 + 24);
    *(_QWORD *)&v16->super._anon_50[136] = v22;
    *(_QWORD *)&v16->super._anon_50[144] = v23;
    *(_OWORD *)&v16->super._anon_50[152] = *(_OWORD *)(v21 + 200);
    v16->super._anon_50[168] = v21[216];
    *(_QWORD *)&v16->super._anon_50[80] = *((_QWORD *)v21 + 16);
    *(_QWORD *)&v16->super._anon_50[24] = *((_QWORD *)v21 + 9);
    iosurface = v16->_iosurface;
    if (iosurface != v16->super._res.info.iosurface)
      -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.2();
    if (iosurface)
      CFRetain(iosurface);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(*(id *)&v16->super._anon_50[32], "deviceRef");
      objc_msgSend(*(id *)&v16->super._anon_50[32], "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v16;
}

- (IOGPUMetalBuffer)buffer
{
  if (!self->_buffer)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalTexture buffer].cold.1();
  return self->_buffer;
}

- (unint64_t)bufferOffset
{
  if (self->_buffer)
    return self->_bufferOffset;
  else
    return 0;
}

- (unint64_t)bufferBytesPerRow
{
  if (self->_buffer)
    return self->_bufferBytesPerRow;
  else
    return 0;
}

- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6
{
  uint64_t v11;
  IOGPUMetalTexture *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
    -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:].cold.4();
  objc_msgSend(a3, "device");
  v11 = objc_msgSend(a4, "descriptorPrivate");
  _mtlValidateStrideTextureParameters();
  v12 = -[IOGPUMetalResource initWithResource:](self, "initWithResource:", a3);
  if (v12)
  {
    v12->_buffer = (IOGPUMetalBuffer *)a3;
    v12->_bufferOffset = a5;
    v12->_bufferBytesPerRow = a6;
    v12->_textureType = *(_QWORD *)v11;
    v12->_width = *(_QWORD *)(v11 + 16);
    v12->_height = *(_QWORD *)(v11 + 24);
    v12->_depth = *(_QWORD *)(v11 + 32);
    v12->_mipmapLevelCount = *(_QWORD *)(v11 + 40);
    v12->_sampleCount = *(_QWORD *)(v11 + 48);
    v12->_arrayLength = *(_QWORD *)(v11 + 56);
    v13 = *(_QWORD *)(v11 + 8);
    v14 = 6;
    if ((unint64_t)(*(_QWORD *)v11 - 5) >= 2)
      v14 = 1;
    v12->_numFaces = v14;
    v12->_pixelFormat = v13;
    v12->_usage = *(_QWORD *)(v11 + 176);
    if (*(_QWORD *)(v11 + 72))
      -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:].cold.3();
    v12->_rotation = 0;
    v12->_swizzle = *(_DWORD *)(v11 + 84);
    v12->_writeSwizzleEnabled = *(_BYTE *)(v11 + 88);
    v12->_shareable = 0;
    if (*(_BYTE *)(v11 + 80))
      -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:].cold.2();
    v12->_framebufferOnly = 0;
    v12->_isDrawable = *(_BYTE *)(v11 + 81);
    v12->_allowGPUOptimizedContents = *(_BYTE *)(v11 + 128);
    v15 = *((id *)a3 + 27);
    v16 = *((_QWORD *)a3 + 28);
    *(_QWORD *)&v12->super._anon_50[136] = v15;
    *(_QWORD *)&v12->super._anon_50[144] = v16;
    *(_OWORD *)&v12->super._anon_50[152] = *(_OWORD *)((char *)a3 + 232);
    v12->super._anon_50[168] = *((_BYTE *)a3 + 248);
    if (v15)
      v17 = *((_QWORD *)a3 + 13);
    else
      v17 = *(_QWORD *)&v12->super._anon_50[24];
    *(_QWORD *)&v12->super._anon_50[24] = v17 + a5;
    *(_QWORD *)&v12->super._anon_50[80] = *((_QWORD *)a3 + 20) + a5;
  }
  return v12;
}

- (void)dealloc
{
  void (**deallocator)(id, void *, unint64_t);
  __IOSurface *iosurface;
  objc_super v5;

  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    deallocator[2](deallocator, self->_pointer, self->_length);
    _Block_release(self->_deallocator);
    self->_deallocator = 0;
  }
  if (*(_QWORD *)&self->super._anon_50[136])
  {
    if ((*(_QWORD *)&self->super._anon_50[88] & 0xF0) != 0x30)
    {
      -[IOGPUMetalTexture makeAliasable](self, "makeAliasable");
      if (!self->_buffer && !self->_parentTexture)
        objc_msgSend(*(id *)&self->super._anon_50[136], "deallocHeapSubResource");
    }
  }

  if (self->_rootResourceIsSuballocatedBuffer)
    objc_msgSend(*(id *)&self->super._anon_50[32], "deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:", self->_primaryBuffer, self->_primaryHeapIndex, self->_primaryBufferIndex, self->_primaryBufferOffset, self->_length);
  iosurface = self->_iosurface;
  if (iosurface)
    CFRelease(iosurface);
  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalTexture;
  -[IOGPUMetalResource dealloc](&v5, sel_dealloc);
}

- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  uint64_t v17;
  IOGPUMetalTexture *v18;
  IOGPUMetalTexture *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;

  v17 = objc_msgSend(a4, "descriptorPrivate");
  v23 = *(_QWORD *)v17;
  +[IOGPUMetalTexture initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:](IOGPUMetalTexture, "initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:", a3, a4, a5, a6, a7, a8, a9);
  v18 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, *(_QWORD *)(v17 + 112), a9, a10);
  v19 = v18;
  if (v18)
  {
    v18->_textureType = *(_QWORD *)v17;
    v20 = *(_QWORD *)(v17 + 8);
    v18->_width = *(_QWORD *)(v17 + 16);
    v18->_height = *(_QWORD *)(v17 + 24);
    v18->_depth = *(_QWORD *)(v17 + 32);
    v18->_mipmapLevelCount = *(_QWORD *)(v17 + 40);
    v18->_sampleCount = *(_QWORD *)(v17 + 48);
    v18->_arrayLength = *(_QWORD *)(v17 + 56);
    v21 = 6;
    if (v23 - 5 >= 2)
      v21 = 1;
    v18->_numFaces = v21;
    v18->_pixelFormat = v20;
    v18->_usage = *(_QWORD *)(v17 + 176);
    if (*(_QWORD *)(v17 + 72))
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:].cold.2();
    v18->_rotation = 0;
    v18->_swizzle = *(_DWORD *)(v17 + 84);
    v18->_writeSwizzleEnabled = *(_BYTE *)(v17 + 88);
    v18->_isCompressed = 0;
    v18->_shareable = 0;
    if (*(_BYTE *)(v17 + 80))
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:].cold.1();
    v18->_framebufferOnly = 0;
    v18->_isDrawable = *(_BYTE *)(v17 + 81);
    v18->_allowGPUOptimizedContents = *(_BYTE *)(v17 + 128);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v19;
}

- (void)_setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalTexture;
  -[IOGPUMetalResource _setLabel:](&v5, sel__setLabel_);
  if (self->_shareable)
    IOSurfaceSetValue(self->_iosurface, (CFStringRef)*MEMORY[0x24BDD8EE0], a3);
}

+ (void)initNewTextureDataWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  a9->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)(&a9->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var12 = 0u;
  *(_OWORD *)&a9->var0.var0 = 0u;
  v10 = objc_msgSend(a4, "descriptorPrivate");
  if (*(_QWORD *)(v10 + 72))
    MTLReportFailure();
  v11 = (*(_QWORD *)(v10 + 112) & 0xFLL) == 1;
  v12 = *(_QWORD *)v10;
  v13 = 6;
  if ((unint64_t)(*(_QWORD *)v10 - 5) >= 2)
    v13 = 1;
  a9->var0.var0 = 0;
  a9->var0.var1 = v11 << 10;
  a9->var0.var2 = *(_QWORD *)(v10 + 16);
  a9->var0.var3 = *(_QWORD *)(v10 + 24);
  a9->var0.var11 = *(_QWORD *)(v10 + 144);
  if (v12 == 6)
  {
    LODWORD(v14) = *(_DWORD *)(v10 + 56) * v13;
LABEL_12:
    a9->var0.var4 = v14;
    goto LABEL_13;
  }
  if (v12 == 3)
  {
    v14 = *(_QWORD *)(v10 + 56);
    goto LABEL_12;
  }
  if (v12 != 1)
  {
    v14 = *(_QWORD *)(v10 + 32);
    goto LABEL_12;
  }
  a9->var0.var3 = *(_QWORD *)(v10 + 56);
LABEL_13:
  a9->var0.var6 = v13;
  a9->var0.var7 = *(_QWORD *)(v10 + 40);
  a9->var0.var9 = 1;
  MTLPixelFormatGetInfoForDevice();
  a9->var0.var9 = 0;
  a9->var0.var10 = *(unsigned __int8 *)(v10 + 64) << 6;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0uLL;
  a9->var0.var16.var0.var2 = a5;
}

- (void)makeAliasable
{
  objc_super v2;

  if (!self->_buffer && !self->_parentTexture)
  {
    v2.receiver = self;
    v2.super_class = (Class)IOGPUMetalTexture;
    -[IOGPUMetalResource makeAliasable](&v2, sel_makeAliasable);
  }
}

- (IOGPUMetalTexture)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 device:(id)a7 descriptor:(id)a8
{
  uint64_t v15;
  IOGPUMetalTexture *v16;
  IOGPUMetalTexture *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  if (!a3)
    -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:].cold.1();
  v15 = objc_msgSend(a8, "descriptorPrivate");
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:].cold.4();
    v16 = -[IOGPUMetalResource initWithResource:](self, "initWithResource:", a4);
  }
  else
  {
    v16 = -[IOGPUMetalResource initMemoryless:descriptor:](self, "initMemoryless:descriptor:", a7, a8);
  }
  v17 = v16;
  if (v16)
  {
    v16->_textureType = *(_QWORD *)v15;
    v16->_width = *(_QWORD *)(v15 + 16);
    v16->_height = *(_QWORD *)(v15 + 24);
    v16->_depth = *(_QWORD *)(v15 + 32);
    v16->_mipmapLevelCount = *(_QWORD *)(v15 + 40);
    v16->_sampleCount = *(_QWORD *)(v15 + 48);
    v16->_arrayLength = *(_QWORD *)(v15 + 56);
    v18 = *(_QWORD *)(v15 + 8);
    v19 = 6;
    if ((unint64_t)(*(_QWORD *)v15 - 5) >= 2)
      v19 = 1;
    v16->_numFaces = v19;
    v16->_pixelFormat = v18;
    v16->_usage = *(_QWORD *)(v15 + 176);
    if (*(_QWORD *)(v15 + 72))
      -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:].cold.3();
    v16->_rotation = 0;
    v16->_swizzle = *(_DWORD *)(v15 + 84);
    v16->_writeSwizzleEnabled = *(_BYTE *)(v15 + 88);
    v16->_shareable = 0;
    if (*(_BYTE *)(v15 + 80))
      -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:].cold.2();
    v16->_framebufferOnly = 0;
    v16->_isDrawable = *(_BYTE *)(v15 + 81);
    v16->_allowGPUOptimizedContents = *(_BYTE *)(v15 + 128);
    *(_QWORD *)&v16->super._anon_50[136] = a3;
    *(_QWORD *)&v17->super._anon_50[144] = a4;
    if (a4)
      v20 = a6;
    else
      v20 = 0;
    *(_QWORD *)&v17->super._anon_50[152] = a5;
    *(_QWORD *)&v17->super._anon_50[160] = v20;
    v17->super._anon_50[168] = 1;
    if (objc_msgSend(a3, "type") == 1)
      v17->super._anon_50[168] = 0;
    if (a4)
    {
      *(_QWORD *)&v17->super._anon_50[80] = *((_QWORD *)a4 + 20) + a5;
      *(_QWORD *)&v17->super._anon_50[24] += a5;
    }
  }
  return v17;
}

- (IOGPUMetalTexture)parentTexture
{
  if (!self->_parentTexture)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalTexture parentTexture].cold.1();
  return self->_parentTexture;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)numFaces
{
  return self->_numFaces;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (__IOSurface)iosurface
{
  __IOSurface *result;

  result = self->_iosurface;
  if (!result || self->_shareable)
    return 0;
  return result;
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  __int128 v6;
  _OWORD v7[3];

  v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  -[IOGPUMetalTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, a4, 0, a5, a6, 0);
}

- (IOGPUMetalTexture)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 descriptor:(id)a8 sysMemRowBytes:(unint64_t)a9 vidMemSize:(unint64_t)a10 vidMemRowBytes:(unint64_t)a11 args:(IOGPUNewResourceArgs *)a12 argsSize:(unsigned int)a13
{
  IOGPUMetalTexture *result;
  uint64_t v19;

  BYTE4(v19) = 0;
  LODWORD(v19) = a13;
  result = -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a8, a6, a9, a10, a11, a12, v19);
  if (result)
  {
    result->_rootResourceIsSuballocatedBuffer = 1;
    result->_primaryBuffer = (IOGPUMetalBuffer *)a3;
    result->_primaryHeapIndex = a4;
    result->_primaryBufferIndex = a5;
    result->_primaryBufferOffset = a6;
    result->_length = a7;
  }
  return result;
}

- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 isStrideTexture:(BOOL)a11
{
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  IOGPUMetalTexture *v23;
  IOGPUMetalTexture *v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  IOGPUMetalTexture *v29;
  IOGPUMetalBuffer *v30;
  char *v31;
  id v32;
  uint64_t v34;
  unint64_t v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  if (!a3)
    -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:].cold.4();
  v35 = a6;
  v17 = objc_msgSend(a3, "device");
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var12 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)(&a9->var0.var16.var3 + 2) = 0u;
  a9->var0.var16.var0.var3.var1 = 0;
  v18 = (_QWORD *)objc_msgSend(a4, "descriptorPrivate");
  v19 = v18;
  v20 = *v18;
  if ((unint64_t)(*v18 - 5) >= 2)
    v21 = 1;
  else
    v21 = 6;
  if (a11)
  {
    v22 = v35;
    _mtlValidateStrideTextureParameters();
    v23 = -[IOGPUMetalResource initWithResource:](self, "initWithResource:", a3);
    v24 = v23;
    if (!v23)
      return v24;
    *(_QWORD *)&v23->super._anon_50[24] += a5;
    goto LABEL_24;
  }
  if (v18[9])
  {
    v34 = v18[9];
    MTLReportFailure();
    v20 = *v19;
  }
  a9->var0.var0 = (v19[24] != 2) << 7;
  a9->var0.var1 = 0;
  a9->var0.var2 = v19[2];
  a9->var0.var3 = v19[3];
  switch(v20)
  {
    case 6:
      LODWORD(v25) = *((_DWORD *)v19 + 14) * v21;
      break;
    case 3:
      v25 = v19[7];
      break;
    case 1:
      a9->var0.var3 = v19[7];
      goto LABEL_19;
    default:
      v25 = v19[4];
      break;
  }
  a9->var0.var4 = v25;
LABEL_19:
  a9->var0.var6 = v21;
  a9->var0.var7 = v19[5];
  a9->var0.var9 = 1;
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  MTLPixelFormatGetInfoForDevice();
  a9->var0.var9 = 0;
  a9->var0.var10 = *((unsigned __int8 *)v19 + 64) << 6;
  v26 = *((_QWORD *)a3 + 20);
  a9->var0.var16.var0.var0 = v26 + a5;
  a9->var0.var16.var0.var1 = v26;
  a9->var0.var16.var0.var2 = objc_msgSend(a3, "resourceSize");
  v27 = *((_DWORD *)a3 + 20);
  if (v27)
  {
    a9->var0.var16.var0.var3.var0 = v27;
    a9->var0.var10 |= 0x800u;
  }
  v28 = *((_QWORD *)a3 + 23) | (16 * *((_QWORD *)a3 + 22)) | *((_QWORD *)a3 + 21) & 0x300;
  v36.receiver = self;
  v36.super_class = (Class)IOGPUMetalTexture;
  v29 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](&v36, sel_initWithDevice_options_args_argsSize_, v17, v28, a9, a10, v34);
  v24 = v29;
  if (v29)
  {
    v29->super._anon_50[128] = 0;
    if (!a7)
    {
      v30 = 0;
      v22 = v35;
      goto LABEL_25;
    }
    v22 = v35;
LABEL_24:
    v30 = (IOGPUMetalBuffer *)a3;
LABEL_25:
    v24->_buffer = v30;
    v24->_bufferOffset = a5;
    v24->_bufferBytesPerRow = v22;
    v24->_textureType = *v19;
    v24->_width = v19[2];
    v24->_height = v19[3];
    v24->_depth = v19[4];
    v24->_mipmapLevelCount = v19[5];
    v24->_sampleCount = v19[6];
    v24->_arrayLength = v19[7];
    v24->_numFaces = v21;
    v24->_pixelFormat = v19[1];
    v24->_usage = v19[22];
    if (v19[9])
      -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:].cold.3();
    v24->_rotation = 0;
    v24->_swizzle = *((_DWORD *)v19 + 21);
    v24->_writeSwizzleEnabled = *((_BYTE *)v19 + 88);
    v24->_shareable = 0;
    if (*((_BYTE *)v19 + 80))
      -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:].cold.2();
    v24->_framebufferOnly = 0;
    v24->_isDrawable = *((_BYTE *)v19 + 81);
    v24->_allowGPUOptimizedContents = *((_BYTE *)v19 + 128);
    v31 = (char *)a3 + 32;
    v32 = *((id *)v31 + 23);
    *(_QWORD *)&v24->super._anon_50[136] = v32;
    *(_QWORD *)&v24->super._anon_50[144] = *((_QWORD *)v31 + 24);
    *(_OWORD *)&v24->super._anon_50[152] = *(_OWORD *)(v31 + 200);
    v24->super._anon_50[168] = v31[216];
    if (a11 && v32)
      *(_QWORD *)&v24->super._anon_50[24] = *((_QWORD *)v31 + 9) + a5;
    *(_QWORD *)&v24->super._anon_50[80] = *((_QWORD *)v31 + 16) + a5;
  }
  return v24;
}

- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemPointer:(void *)a5 sysMemSize:(unint64_t)a6 sysMemLength:(unint64_t)a7 sysMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)aBlock
{
  uint64_t v17;
  uint64_t v18;
  IOGPUMetalTexture *v19;
  IOGPUMetalTexture *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v25;

  v17 = objc_msgSend(a4, "descriptorPrivate");
  v18 = *(_QWORD *)(v17 + 112);
  v25 = *(_QWORD *)v17;
  +[IOGPUMetalTexture initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:](IOGPUMetalTexture, "initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:", a3, a4, a6, a8, 0, 0, a9);
  a9->var0.var0 = 128;
  a9->var0.var16.var0.var0 = (unint64_t)a5;
  a9->var0.var16.var0.var1 = (unint64_t)a5;
  v19 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, v18, a9, a10);
  v20 = v19;
  if (v19)
  {
    v19->_textureType = *(_QWORD *)v17;
    v21 = *(_QWORD *)(v17 + 8);
    v19->_width = *(_QWORD *)(v17 + 16);
    v19->_height = *(_QWORD *)(v17 + 24);
    v19->_depth = *(_QWORD *)(v17 + 32);
    v19->_mipmapLevelCount = *(_QWORD *)(v17 + 40);
    v19->_sampleCount = *(_QWORD *)(v17 + 48);
    v19->_arrayLength = *(_QWORD *)(v17 + 56);
    v22 = 6;
    if (v25 - 5 >= 2)
      v22 = 1;
    v19->_numFaces = v22;
    v19->_pixelFormat = v21;
    v19->_usage = *(_QWORD *)(v17 + 176);
    if (*(_QWORD *)(v17 + 72))
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:].cold.2();
    v19->_rotation = 0;
    v19->_swizzle = *(_DWORD *)(v17 + 84);
    v19->_writeSwizzleEnabled = *(_BYTE *)(v17 + 88);
    v19->_shareable = 0;
    if (*(_BYTE *)(v17 + 80))
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:].cold.1();
    v19->_framebufferOnly = 0;
    v19->_isDrawable = *(_BYTE *)(v17 + 81);
    if (aBlock)
    {
      v19->_length = a7;
      v19->_pointer = a5;
      v19->_deallocator = _Block_copy(aBlock);
    }
    v20->_allowGPUOptimizedContents = *(_BYTE *)(v17 + 128);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v20;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  objc_super v4;

  if (self->_iosurface)
    return IOSurfaceSetOwnershipIdentity();
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalTexture;
  return -[IOGPUMetalResource setOwnerWithIdentity:](&v4, sel_setOwnerWithIdentity_, *(_QWORD *)&a3);
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  -[IOGPUMetalTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a3, *(_OWORD *)&a5->var0.var0, a5->var0.var2, a5->var1.var0, *(_OWORD *)&a5->var1.var1);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  IOGPUMetalTexture *parentTexture;
  const __CFString *v11;
  IOGPUMetalBuffer *v12;
  _BOOL4 allowGPUOptimizedContents;
  const __CFString *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[85];

  v18[84] = *MEMORY[0x24BDAC8D0];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = -[IOGPUMetalResource retainedLabel](self, "retainedLabel");
  v7 = (void *)MEMORY[0x24BDD17C8];
  v17.receiver = self;
  v17.super_class = (Class)IOGPUMetalTexture;
  v8 = -[IOGPUMetalTexture description](&v17, sel_description);
  v18[0] = v5;
  v18[1] = CFSTR("label =");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("<none>");
  v18[2] = v9;
  v18[3] = v5;
  v18[4] = CFSTR("textureType =");
  v18[5] = MTLTextureTypeString();
  v18[6] = v5;
  v18[7] = CFSTR("pixelFormat =");
  v18[8] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", MTLPixelFormatGetName());
  v18[9] = v5;
  v18[10] = CFSTR("width =");
  v18[11] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_width);
  v18[12] = v5;
  v18[13] = CFSTR("height =");
  v18[14] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_height);
  v18[15] = v5;
  v18[16] = CFSTR("depth =");
  v18[17] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_depth);
  v18[18] = v5;
  v18[19] = CFSTR("arrayLength =");
  v18[20] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_arrayLength);
  v18[21] = v5;
  v18[22] = CFSTR("mipmapLevelCount =");
  v18[23] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_mipmapLevelCount);
  v18[24] = v5;
  v18[25] = CFSTR("sampleCount =");
  v18[26] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sampleCount);
  v18[27] = v5;
  v18[28] = CFSTR("cpuCacheMode =");
  v18[29] = MTLCPUCacheModeString();
  v18[30] = v5;
  v18[31] = CFSTR("storageMode =");
  v18[32] = MTLStorageModeString();
  v18[33] = v5;
  v18[34] = CFSTR("hazardTrackingMode =");
  -[IOGPUMetalTexture hazardTrackingMode](self, "hazardTrackingMode");
  v18[35] = MTLHazardTrackingModeString();
  v18[36] = v5;
  v18[37] = CFSTR("resourceOptions =");
  -[IOGPUMetalResource resourceOptions](self, "resourceOptions");
  v18[38] = MTLResourceOptionsString();
  v18[39] = v5;
  v18[40] = CFSTR("usage =");
  v18[41] = MTLTextureUsageString();
  v18[42] = v5;
  v18[43] = CFSTR("shareable =");
  v18[44] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shareable);
  v18[45] = v5;
  v18[46] = CFSTR("framebufferOnly =");
  v18[47] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_framebufferOnly);
  v18[48] = v5;
  v18[49] = CFSTR("purgeableState =");
  v18[50] = MTLPurgeableStateString();
  v18[51] = v5;
  v18[52] = CFSTR("swizzle =");
  v18[53] = MTLTextureSwizzleString();
  v18[54] = v5;
  v18[55] = CFSTR("isCompressed =");
  v18[56] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCompressed);
  v18[57] = v5;
  v18[58] = CFSTR("parentTexture =");
  parentTexture = self->_parentTexture;
  if (parentTexture)
    v11 = -[IOGPUMetalTexture formattedDescription:](parentTexture, "formattedDescription:", v4);
  else
    v11 = CFSTR("<null>");
  v18[59] = v11;
  v18[60] = v5;
  v18[61] = CFSTR("parentRelativeLevel =");
  v18[62] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_parentRelativeLevel);
  v18[63] = v5;
  v18[64] = CFSTR("parentRelativeSlice =");
  v18[65] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_parentRelativeSlice);
  v18[66] = v5;
  v18[67] = CFSTR("buffer =");
  v12 = -[IOGPUMetalTexture buffer](self, "buffer");
  if (!v12)
    v12 = (IOGPUMetalBuffer *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v18[68] = v12;
  v18[69] = v5;
  v18[70] = CFSTR("bufferOffset =");
  v18[71] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IOGPUMetalTexture bufferOffset](self, "bufferOffset"));
  v18[72] = v5;
  v18[73] = CFSTR("bufferBytesPerRow =");
  v18[74] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IOGPUMetalTexture bufferBytesPerRow](self, "bufferBytesPerRow"));
  v18[75] = v5;
  v18[76] = CFSTR("iosurface =");
  v18[77] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self->_iosurface);
  v18[78] = v5;
  v18[79] = CFSTR("iosurfacePlane =");
  v18[80] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_iosurfacePlane);
  v18[81] = v5;
  allowGPUOptimizedContents = self->_allowGPUOptimizedContents;
  v18[82] = CFSTR("allowGPUOptimizedContents =");
  if (allowGPUOptimizedContents)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v18[83] = v14;
  v15 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 84), "componentsJoinedByString:", CFSTR(" ")));

  return v15;
}

- (id)description
{
  return -[IOGPUMetalTexture formattedDescription:](self, "formattedDescription:", 0);
}

- (IOGPUMetalResource)rootResource
{
  IOGPUMetalTexture *parentTexture;

  parentTexture = self->_parentTexture;
  if (!parentTexture)
    return &self->_buffer->super;
  return &parentTexture->super;
}

- (unint64_t)allocatedSize
{
  objc_super v3;

  if (self->_primaryBuffer)
    return self->_length;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalTexture;
  return -[IOGPUMetalResource allocatedSize](&v3, sel_allocatedSize);
}

- (BOOL)isAliasable
{
  void *buffer;

  buffer = self->_buffer;
  if (buffer)
    return objc_msgSend(buffer, "isAliasable");
  buffer = self->_parentTexture;
  if (buffer)
    return objc_msgSend(buffer, "isAliasable");
  else
    return self->super._anon_50[168] == 0;
}

- (id)newSharedTextureHandle
{
  if (self->_shareable)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD700]), "initWithIOSurface:label:", self->_iosurface, -[IOGPUMetalResource label](self, "label"));
  else
    return 0;
}

- (BOOL)isShareable
{
  return self->_shareable;
}

- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, *((_QWORD *)a3 + 44), 0, *((_QWORD *)a3 + 51), 0, *((_QWORD *)a3 + 53) * *((_QWORD *)a3 + 54), objc_msgSend(a3, "swizzle"), v5);
}

- (IOGPUMetalTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6, 1, a7, 1, objc_msgSend(a3, "swizzle"), v8);
}

- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, *(unsigned int *)&a8, v9);
}

- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  uint64_t v11;

  BYTE4(v11) = 1;
  LODWORD(v11) = a10;
  return -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a4, a5, a6, a7, a8, a9, v11);
}

- (unsigned)swizzleKey
{
  return self->_swizzle;
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
  -[IOGPUMetalTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a7, a8, a9, v10, a4, a3);
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
  -[IOGPUMetalTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v10, a7, a6, a3, a4, a5);
}

- (__CFArray)copyAnnotations
{
  __CFDictionary *Mutable;
  const __CFString *v4;
  void *v5;
  __CFString *v6;
  unint64_t textureType;
  unint64_t depth;
  uint64_t Name;
  unint64_t *p_depth;
  void *v11;
  void *v12;
  unint64_t usage;
  const __CFString *v14;
  unint64_t v15;
  unsigned int swizzle;
  IOGPUMetalTexture *parentTexture;
  uint64_t parentRelativeSlice_low;
  uint64_t parentRelativeLevel_low;
  id Weak;
  IOGPUMetalBuffer *buffer;
  id v22;
  id v23;
  void *v24;
  __CFArray *v25;
  __CFDictionary *v26;
  uint64_t v28;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  -[IOGPUMetalResource annotateResource:](self, "annotateResource:", Mutable);
  if (self->_framebufferOnly)
    v4 = CFSTR("Renderbuffer");
  else
    v4 = CFSTR("Texture");
  CFDictionaryAddValue(Mutable, CFSTR("Type"), v4);
  v5 = (void *)MEMORY[0x212BDF02C]();
  v6 = CFStringCreateMutable(0, 512);
  CFStringAppendFormat(v6, 0, CFSTR("%s"), "IOGPUMetalTexture");
  textureType = self->_textureType;
  if (textureType >= 0xA)
  {
    while (1)
LABEL_60:
      MTLReleaseAssertionFailure();
  }
  CFStringAppendFormat(v6, 0, CFSTR(", %s"), off_24CC3FB10[textureType]);
  switch(self->_textureType)
  {
    case 0uLL:
    case 1uLL:
    case 9uLL:
      CFStringAppendFormat(v6, 0, CFSTR(", %ld"), self->_width);
      goto LABEL_11;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      CFStringAppendFormat(v6, 0, CFSTR(", %ld x %ld"), self->_width, self->_height);
      goto LABEL_11;
    case 7uLL:
      depth = self->_depth;
      goto LABEL_10;
    case 8uLL:
      depth = self->_arrayLength;
LABEL_10:
      CFStringAppendFormat(v6, 0, CFSTR(", %ld x %ld x %ld"), self->_width, self->_height, depth);
LABEL_11:
      Name = MTLPixelFormatGetName();
      CFStringAppendFormat(v6, 0, CFSTR(", %s"), Name + 14);
      if (self->_mipmapLevelCount >= 2)
        CFStringAppendFormat(v6, 0, CFSTR(", %d mipmaps"), self->_mipmapLevelCount);
      if (self->_arrayLength >= 2)
      {
        if (self->_textureType - 2 >= 6)
          p_depth = &self->_depth;
        else
          p_depth = &self->_height;
        CFStringAppendFormat(v6, 0, CFSTR(", %d array slices"), *p_depth);
      }
      if (self->_sampleCount >= 2)
        CFStringAppendFormat(v6, 0, CFSTR(", %d samples"), self->_sampleCount);
      v11 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v12 = v11;
      usage = self->_usage;
      if (!usage)
      {
        objc_msgSend(v11, "appendString:", CFSTR(" none"));
        usage = self->_usage;
      }
      if ((~(_BYTE)usage & 3) == 0)
      {
        v14 = CFSTR(" srw");
LABEL_28:
        objc_msgSend(v12, "appendString:", v14);
        goto LABEL_29;
      }
      if ((usage & 1) != 0)
      {
        objc_msgSend(v12, "appendString:", CFSTR(" sr"));
        usage = self->_usage;
      }
      if ((usage & 2) != 0)
      {
        v14 = CFSTR(" sw");
        goto LABEL_28;
      }
LABEL_29:
      v15 = self->_usage;
      if ((v15 & 4) != 0)
      {
        objc_msgSend(v12, "appendString:", CFSTR(" rt"));
        v15 = self->_usage;
        if ((v15 & 0x10) == 0)
        {
LABEL_31:
          if ((v15 & 0x4000) == 0)
            goto LABEL_32;
          goto LABEL_38;
        }
      }
      else if ((v15 & 0x10) == 0)
      {
        goto LABEL_31;
      }
      objc_msgSend(v12, "appendString:", CFSTR(" pfv"));
      v15 = self->_usage;
      if ((v15 & 0x4000) == 0)
      {
LABEL_32:
        if ((v15 & 0x10000) == 0)
          goto LABEL_34;
        goto LABEL_33;
      }
LABEL_38:
      objc_msgSend(v12, "appendString:", CFSTR(" nca"));
      v15 = self->_usage;
      if ((v15 & 0x10000) != 0)
      {
LABEL_33:
        objc_msgSend(v12, "appendString:", CFSTR(" bwo"));
        v15 = self->_usage;
      }
LABEL_34:
      CFStringAppendFormat(v6, 0, CFSTR(", usage (%05x)%@"), v15, v12);
      if (objc_loadWeak((id *)&self->super.weakSelf))
        CFStringAppendFormat(v6, 0, CFSTR(", handle (%05llx)"), -[IOGPUMetalTexture gpuResourceID](self, "gpuResourceID"));
      else
        CFStringAppend(v6, CFSTR(", dead"));
      if (self->_length)
        CFStringAppendFormat(v6, 0, CFSTR(", size %lluB"), self->_length);
      if (*(_QWORD *)&self->super._anon_50[136])
        CFStringAppendFormat(v6, 0, CFSTR(", heap (+%llx)"), *(_QWORD *)&self->super._anon_50[152]);
      if (self->_primaryBuffer)
        CFStringAppendFormat(v6, 0, CFSTR(", suballoc (+%llx)"), self->_primaryBufferOffset);
      swizzle = self->_swizzle;
      if (swizzle != 84148994)
        CFStringAppendFormat(v6, 0, CFSTR(", swizzle %c%c%c%c"), copyAnnotations_kLetter[swizzle % 6u], copyAnnotations_kLetter[BYTE1(swizzle) % 6u], copyAnnotations_kLetter[BYTE2(swizzle) % 6u], copyAnnotations_kLetter[(HIBYTE(swizzle) - 6 * ((171 * HIBYTE(swizzle)) >> 10))]);
      parentTexture = self->_parentTexture;
      if (parentTexture)
      {
        parentRelativeSlice_low = LODWORD(self->_parentRelativeSlice);
        parentRelativeLevel_low = LODWORD(self->_parentRelativeLevel);
        Weak = objc_loadWeak((id *)&parentTexture->super.weakSelf);
        if (Weak)
          CFStringAppendFormat(v6, 0, CFSTR(", view (parent %05llx, slice %d, level %d)"), objc_msgSend(Weak, "gpuResourceID"), parentRelativeSlice_low, parentRelativeLevel_low);
        else
          CFStringAppendFormat(v6, 0, CFSTR(", view (parent dead, slice %d, level %d)"), parentRelativeSlice_low, parentRelativeLevel_low, v28);
      }
      buffer = self->_buffer;
      if (buffer)
      {
        v22 = objc_loadWeak((id *)&buffer->super.weakSelf);
        if (v22)
          CFStringAppendFormat(v6, 0, CFSTR(", buffer (parent %012llx, offset %lluB, stride %lluB)"), objc_msgSend(v22, "gpuAddress"), self->_bufferOffset, self->_bufferBytesPerRow);
        else
          CFStringAppendFormat(v6, 0, CFSTR(", buffer (parent dead, offset %lluB, stride %lluB)"), self->_bufferOffset, self->_bufferBytesPerRow, v28);
      }
      v23 = -[IOGPUMetalResource retainedLabel](self, "retainedLabel");
      if (v23)
      {
        v24 = v23;
        CFStringAppendFormat(v6, 0, CFSTR(", \"%s\"), objc_msgSend(v23, "UTF8String"));

      }
      CFDictionaryAddValue(Mutable, CFSTR("Description"), v6);
      CFRelease(v6);
      objc_autoreleasePoolPop(v5);
      v25 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      v26 = -[IOGPUMetalResource copyAnnotationDictionary:obj_key_name:obj_dict:](self, "copyAnnotationDictionary:obj_key_name:obj_dict:", *(_QWORD *)&self->super._anon_50[8], CFSTR("OpenGLObjects"), Mutable);
      CFArrayAppendValue(v25, v26);
      CFRelease(v26);
      CFRelease(Mutable);
      return v25;
    default:
      goto LABEL_60;
  }
}

- (BOOL)isSparse
{
  MTLHeap *v2;

  v2 = -[IOGPUMetalResource heap](self, "heap");
  if (v2)
    LOBYTE(v2) = -[MTLHeap type](v2, "type") == 2;
  return (char)v2;
}

- (int64_t)compressionFeedback
{
  return 0;
}

- (unint64_t)parentRelativeLevel
{
  return self->_parentRelativeLevel;
}

- (unint64_t)parentRelativeSlice
{
  return self->_parentRelativeSlice;
}

- (unint64_t)iosurfacePlane
{
  return self->_iosurfacePlane;
}

- (unint64_t)rotation
{
  return self->_rotation;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (BOOL)isFramebufferOnly
{
  return self->_framebufferOnly;
}

- (BOOL)isDrawable
{
  return self->_isDrawable;
}

- (BOOL)rootResourceIsSuballocatedBuffer
{
  return self->_rootResourceIsSuballocatedBuffer;
}

- (BOOL)allowGPUOptimizedContents
{
  return self->_allowGPUOptimizedContents;
}

- (void)parentTexture
{
  __assert_rtn("-[IOGPUMetalTexture parentTexture]", "IOGPUMetalTexture.m", 136, "(_parentTexture == nil) || [_parentTexture isKindOfClass:[IOGPUMetalTexture class]]");
}

- (void)buffer
{
  __assert_rtn("-[IOGPUMetalTexture buffer]", "IOGPUMetalTexture.m", 142, "(_buffer == nil) || [_buffer isKindOfClass:[IOGPUMetalBuffer class]]");
}

- (void)initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:]", "IOGPUMetalTexture.m", 491, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:]", "IOGPUMetalTexture.m", 478, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:]", "IOGPUMetalTexture.m", 561, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:]", "IOGPUMetalTexture.m", 551, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithDevice:descriptor:iosurface:plane:field:args:argsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", "IOGPUMetalTexture.m", 736, "descriptorPrivate->rotation == MTLTextureRotation0Degrees || descriptorPrivate->framebufferOnly");
}

- (void)initWithDevice:descriptor:iosurface:plane:field:args:argsSize:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", "IOGPUMetalTexture.m", 681, "carriesComplexTexture || numFaces == 1");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 855, "texture != nil");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 935, "_iosurface == _res.info.iosurface");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 902, "_usage != MTLTextureUsageUnknown");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.4()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 876, "sliceRange.length == 1");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.5()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 875, "levelRange.length == 1");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.6()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 856, "[texture isKindOfClass:[IOGPUMetalTexture class]]");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 966, "buffer != nil");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 1094, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 1084, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.4()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 967, "[buffer isKindOfClass:[IOGPUMetalBuffer class]]");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1144, "buffer != nil");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1182, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1172, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.4()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1145, "[buffer isKindOfClass:[IOGPUMetalBuffer class]]");
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1219, "heap != nil");
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1263, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1253, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.4()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1233, "[resource isKindOfClass:[IOGPUMetalResource class]]");
}

@end
