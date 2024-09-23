@implementation MTLIOAccelTexture

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  MTLIOAccelTexture *parentTexture;
  const __CFString *v11;
  MTLBuffer *v12;
  _BOOL4 allowGPUOptimizedContents;
  const __CFString *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[85];

  v18[84] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = -[MTLIOAccelResource retainedLabel](self, "retainedLabel");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)MTLIOAccelTexture;
  v8 = -[MTLIOAccelTexture description](&v17, sel_description);
  v18[0] = v5;
  v18[1] = CFSTR("label =");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("<none>");
  v18[2] = v9;
  v18[3] = v5;
  v18[4] = CFSTR("textureType =");
  v18[5] = MTLTextureTypeString(self->_textureType);
  v18[6] = v5;
  v18[7] = CFSTR("pixelFormat =");
  v18[8] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(self->_pixelFormat));
  v18[9] = v5;
  v18[10] = CFSTR("width =");
  v18[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_width);
  v18[12] = v5;
  v18[13] = CFSTR("height =");
  v18[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_height);
  v18[15] = v5;
  v18[16] = CFSTR("depth =");
  v18[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_depth);
  v18[18] = v5;
  v18[19] = CFSTR("arrayLength =");
  v18[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_arrayLength);
  v18[21] = v5;
  v18[22] = CFSTR("mipmapLevelCount =");
  v18[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mipmapLevelCount);
  v18[24] = v5;
  v18[25] = CFSTR("sampleCount =");
  v18[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sampleCount);
  v18[27] = v5;
  v18[28] = CFSTR("cpuCacheMode =");
  v18[29] = MTLCPUCacheModeString(*(_QWORD *)&self->super._anon_50[112]);
  v18[30] = v5;
  v18[31] = CFSTR("storageMode =");
  v18[32] = MTLStorageModeString(*(_QWORD *)&self->super._anon_50[104]);
  v18[33] = v5;
  v18[34] = CFSTR("hazardTrackingMode =");
  v18[35] = MTLHazardTrackingModeString(-[MTLIOAccelTexture hazardTrackingMode](self, "hazardTrackingMode"));
  v18[36] = v5;
  v18[37] = CFSTR("resourceOptions =");
  v18[38] = MTLResourceOptionsString(-[MTLIOAccelResource resourceOptions](self, "resourceOptions"));
  v18[39] = v5;
  v18[40] = CFSTR("usage =");
  v18[41] = MTLTextureUsageString(self->_usage);
  v18[42] = v5;
  v18[43] = CFSTR("shareable =");
  v18[44] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shareable);
  v18[45] = v5;
  v18[46] = CFSTR("framebufferOnly =");
  v18[47] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_framebufferOnly);
  v18[48] = v5;
  v18[49] = CFSTR("purgeableState =");
  v18[50] = MTLPurgeableStateString(*(_QWORD *)&self->super._anon_50[128]);
  v18[51] = v5;
  v18[52] = CFSTR("swizzle =");
  v18[53] = MTLTextureSwizzleString(self->_swizzle);
  v18[54] = v5;
  v18[55] = CFSTR("isCompressed =");
  v18[56] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCompressed);
  v18[57] = v5;
  v18[58] = CFSTR("parentTexture =");
  parentTexture = self->_parentTexture;
  if (parentTexture)
    v11 = -[MTLIOAccelTexture formattedDescription:](parentTexture, "formattedDescription:", v4);
  else
    v11 = CFSTR("<null>");
  v18[59] = v11;
  v18[60] = v5;
  v18[61] = CFSTR("parentRelativeLevel =");
  v18[62] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_parentRelativeLevel);
  v18[63] = v5;
  v18[64] = CFSTR("parentRelativeSlice =");
  v18[65] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_parentRelativeSlice);
  v18[66] = v5;
  v18[67] = CFSTR("buffer =");
  v12 = -[MTLIOAccelTexture buffer](self, "buffer");
  if (!v12)
    v12 = (MTLBuffer *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18[68] = v12;
  v18[69] = v5;
  v18[70] = CFSTR("bufferOffset =");
  v18[71] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTLIOAccelTexture bufferOffset](self, "bufferOffset"));
  v18[72] = v5;
  v18[73] = CFSTR("bufferBytesPerRow =");
  v18[74] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTLIOAccelTexture bufferBytesPerRow](self, "bufferBytesPerRow"));
  v18[75] = v5;
  v18[76] = CFSTR("iosurface =");
  v18[77] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self->_iosurface);
  v18[78] = v5;
  v18[79] = CFSTR("iosurfacePlane =");
  v18[80] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_iosurfacePlane);
  v18[81] = v5;
  allowGPUOptimizedContents = self->_allowGPUOptimizedContents;
  v18[82] = CFSTR("allowGPUOptimizedContents =");
  if (allowGPUOptimizedContents)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v18[83] = v14;
  v15 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 84), "componentsJoinedByString:", CFSTR(" ")));

  return v15;
}

- (id)description
{
  return -[MTLIOAccelTexture formattedDescription:](self, "formattedDescription:", 0);
}

- (MTLTexture)parentTexture
{
  return (MTLTexture *)self->_parentTexture;
}

- (MTLBuffer)buffer
{
  return (MTLBuffer *)self->_buffer;
}

- (MTLResource)rootResource
{
  MTLIOAccelTexture *parentTexture;

  parentTexture = self->_parentTexture;
  if (!parentTexture)
    return (MTLResource *)self->_buffer;
  return (MTLResource *)parentTexture;
}

- (unint64_t)allocatedSize
{
  objc_super v3;

  if (self->_masterBuffer)
    return self->_length;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelTexture;
  return -[MTLIOAccelResource allocatedSize](&v3, sel_allocatedSize);
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
    return self->super._anon_50[192] == 0;
}

- (void)makeAliasable
{
  objc_super v2;

  if (!self->_buffer && !self->_parentTexture)
  {
    v2.receiver = self;
    v2.super_class = (Class)MTLIOAccelTexture;
    -[MTLIOAccelResource makeAliasable](&v2, sel_makeAliasable);
  }
}

- (id)newSharedTextureHandle
{
  if (self->_shareable)
    return -[MTLSharedTextureHandle initWithIOSurface:label:]([MTLSharedTextureHandle alloc], "initWithIOSurface:label:", self->_iosurface, -[MTLIOAccelResource label](self, "label"));
  else
    return 0;
}

- (__IOSurface)iosurface
{
  __IOSurface *result;

  result = self->_iosurface;
  if (!result || self->_shareable)
    return 0;
  return result;
}

- (BOOL)isShareable
{
  return self->_shareable;
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
  if (*(_QWORD *)&self->super._anon_50[160])
  {
    if ((*(_QWORD *)&self->super._anon_50[96] & 0xF0) != 0x30)
    {
      -[MTLIOAccelTexture makeAliasable](self, "makeAliasable");
      if (!self->_buffer && !self->_parentTexture)
        objc_msgSend(*(id *)&self->super._anon_50[160], "deallocHeapSubResource");
    }
  }

  if (self->_rootResourceIsSuballocatedBuffer)
    objc_msgSend(*(id *)&self->super._anon_50[32], "deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:", self->_masterBuffer, self->_masterHeapIndex, self->_masterBufferIndex, self->_masterBufferOffset, self->_length);
  iosurface = self->_iosurface;
  if (iosurface)
    CFRelease(iosurface);
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelTexture;
  -[MTLIOAccelResource dealloc](&v5, sel_dealloc);
}

+ (void)initNewTextureDataWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  *((_QWORD *)&a9->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a9->var0.var8 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  v14 = objc_msgSend(a4, "descriptorPrivate");
  v19 = v14;
  if (*(_QWORD *)(v14 + 72))
    MTLReportFailure(0, "+[MTLIOAccelTexture initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:]", 400, (uint64_t)CFSTR("Non IOSurface texture has invalid rotation %u"), v15, v16, v17, v18, *(_QWORD *)(v14 + 72));
  v20 = (*(_QWORD *)(v19 + 112) & 0xFLL) == 1;
  v21 = *(_QWORD *)v19;
  v22 = 6;
  if ((unint64_t)(*(_QWORD *)v19 - 5) >= 2)
    v22 = 1;
  a9->var0.var0 = (a7 != 0) << 6;
  a9->var0.var1 = v20 << 10;
  a9->var0.var2 = *(_QWORD *)(v19 + 16);
  a9->var0.var3 = *(_QWORD *)(v19 + 24);
  a9->var0.var13 = *(_QWORD *)(v19 + 144);
  if (v21 == 6)
  {
    LODWORD(v23) = *(_DWORD *)(v19 + 56) * v22;
LABEL_12:
    a9->var0.var4 = v23;
    goto LABEL_13;
  }
  if (v21 == 3)
  {
    v23 = *(_QWORD *)(v19 + 56);
    goto LABEL_12;
  }
  if (v21 != 1)
  {
    v23 = *(_QWORD *)(v19 + 32);
    goto LABEL_12;
  }
  a9->var0.var3 = *(_QWORD *)(v19 + 56);
LABEL_13:
  a9->var0.var6 = a8;
  a9->var0.var7 = a6;
  a9->var0.var8 = v22;
  a9->var0.var9 = *(_QWORD *)(v19 + 40);
  a9->var0.var11 = 1;
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  MTLPixelFormatGetInfoForDevice(a3, *(_QWORD *)(v19 + 8), (uint64_t)&v24);
  a9->var0.var11 = BYTE8(v25);
  a9->var0.var12 = *(unsigned __int8 *)(v19 + 64) << 6;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0uLL;
  a9->var0.var16.var0.var2 = a7;
  a9->var0.var16.var0.var3 = a5;
}

- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  uint64_t v17;
  MTLIOAccelTexture *v18;
  MTLIOAccelTexture *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;

  v17 = objc_msgSend(a4, "descriptorPrivate");
  v23 = *(_QWORD *)v17;
  +[MTLIOAccelTexture initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:](MTLIOAccelTexture, "initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:", a3, a4, a5, a6, a7, a8, a9);
  v18 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, *(_QWORD *)(v17 + 112), a9, a10);
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
    v18->_rotation = 0;
    v18->_swizzle = *(_DWORD *)(v17 + 84);
    v18->_writeSwizzleEnabled = *(_BYTE *)(v17 + 88);
    v18->_isCompressed = 0;
    v18->_shareable = 0;
    v18->_framebufferOnly = 0;
    v18->_isDrawable = *(_BYTE *)(v17 + 81);
    v18->_allowGPUOptimizedContents = *(_BYTE *)(v17 + 128);
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v19;
}

- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemPointer:(void *)a5 sysMemSize:(unint64_t)a6 sysMemLength:(unint64_t)a7 sysMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)aBlock
{
  uint64_t v17;
  uint64_t v18;
  MTLIOAccelTexture *v19;
  MTLIOAccelTexture *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v25;

  v17 = objc_msgSend(a4, "descriptorPrivate");
  v18 = *(_QWORD *)(v17 + 112);
  v25 = *(_QWORD *)v17;
  +[MTLIOAccelTexture initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:](MTLIOAccelTexture, "initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:", a3, a4, a6, a8, 0, 0, a9);
  a9->var0.var0 = 128;
  a9->var0.var16.var0.var0 = (unint64_t)a5;
  a9->var0.var16.var0.var1 = (unint64_t)a5;
  v19 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, v18, a9, a10);
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
    v22 = 6;
    v19->_arrayLength = *(_QWORD *)(v17 + 56);
    if (v25 - 5 >= 2)
      v22 = 1;
    v19->_numFaces = v22;
    v19->_pixelFormat = v21;
    v19->_usage = *(_QWORD *)(v17 + 176);
    v19->_rotation = 0;
    v19->_swizzle = *(_DWORD *)(v17 + 84);
    v19->_writeSwizzleEnabled = *(_BYTE *)(v17 + 88);
    v19->_shareable = 0;
    v19->_framebufferOnly = 0;
    v19->_isDrawable = *(_BYTE *)(v17 + 81);
    if (aBlock)
    {
      v19->_length = a7;
      v19->_pointer = a5;
      v19->_deallocator = _Block_copy(aBlock);
    }
    v20->_allowGPUOptimizedContents = *(_BYTE *)(v17 + 128);
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v20;
}

- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unsigned int)a6 field:(unsigned int)a7 args:(IOAccelNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  uint64_t v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  void *BaseAddress;
  size_t BytesPerRow;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  size_t Height;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  size_t BytesPerElement;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  unint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  MTLIOAccelTexture *v60;
  MTLIOAccelTexture *v61;
  uint64_t v63;
  BOOL v64;
  id v67;
  _OWORD v68[3];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;

  v10 = *(_QWORD *)&a6;
  *((_QWORD *)&a8->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a8->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a8->var0.var8 = 0u;
  *(_OWORD *)&a8->var0.var14 = 0u;
  *(_OWORD *)&a8->var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  v14 = objc_msgSend(a4, "descriptorPrivate");
  v19 = v14;
  if (*(_QWORD *)(v14 + 72) >= 5uLL)
    MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 630, (uint64_t)CFSTR("IOSurface texture has invalid rotation %u"), v15, v16, v17, v18, *(_QWORD *)(v14 + 72));
  v20 = (void *)IOSurfaceCopyValue(a5, (CFStringRef)*MEMORY[0x1E0CBBFA0]);
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v20, "objectForKeyedSubscript:", kMetalRegistryID) != 0;

  }
  else
  {
    v22 = 0;
  }
  v76 = 0;
  v74 = 0u;
  v75 = 0u;
  v73 = 0u;
  MTLPixelFormatGetInfoForDevice(a3, *(_QWORD *)(v19 + 8), (uint64_t)&v73);
  v27 = *(_QWORD *)(v19 + 72);
  if (v27 <= 4 && ((1 << v27) & 0x1A) != 0)
  {
    v28 = (unint64_t *)(v19 + 16);
    v29 = (unint64_t *)(v19 + 24);
  }
  else
  {
    v29 = (unint64_t *)(v19 + 16);
    v28 = (unint64_t *)(v19 + 24);
  }
  v30 = *v29;
  v31 = *v28;
  if (!a5)
    MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 666, (uint64_t)CFSTR("IOSurface argument must not be NULL"), v23, v24, v25, v26, v63);
  v64 = v22;
  if (IOSurfaceGetPlaneCount(a5))
    v32 = 1;
  else
    v32 = v22;
  if ((v32 & 1) == 0)
  {
    BaseAddress = IOSurfaceGetBaseAddress(a5);
    BytesPerRow = IOSurfaceGetBytesPerRow(a5);
    _mtlValidateStrideTextureParameters(a3, a4, v30, (uint64_t)BaseAddress, BytesPerRow, 1);
    if ((_DWORD)v10)
      MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 672, (uint64_t)CFSTR("IOSurface is non-planar, but plane %u specified"), v35, v36, v37, v38, v10);
    v72 = 0;
    v70 = 0u;
    v71 = 0u;
    v69 = 0u;
    memset(v68, 0, sizeof(v68));
    MTLGetTextureLevelInfoForDeviceWithOptions(a3, objc_msgSend(a4, "pixelFormat"), v30, v31, 1uLL, 1, 0, 0, (uint64_t *)v68);
    v39 = v71;
    if (v39 > IOSurfaceGetBytesPerRow(a5))
      MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 682, (uint64_t)CFSTR("Descriptor rowBytes (%lu) > IOSurface rowBytes (%lu)"), v40, v41, v42, v43, v39);
    v44 = *(_QWORD *)(v19 + 56) * *((_QWORD *)&v69 + 1);
    Height = IOSurfaceGetHeight(a5);
    if (v44 > IOSurfaceGetElementHeight(a5) * Height)
      MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 685, (uint64_t)CFSTR("Descriptor height*arrayLength > IOSurface height"), v46, v47, v48, v49, v63);
    if (!IOSurfaceAllowsPixelSizeCasting(a5))
    {
      BytesPerElement = IOSurfaceGetBytesPerElement(a5);
      if (*((_QWORD *)&v70 + 1) != BytesPerElement)
        MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 690, (uint64_t)CFSTR("Pixel format bytes per pixel doesn't match IOSurface bytes per pixel (size casting disallowed by this IOSurface)"), v51, v52, v53, v54, v63);
    }
  }
  v67 = a3;
  v55 = v10;
  v56 = *(_QWORD *)v19;
  if ((unint64_t)(*(_QWORD *)v19 - 5) >= 2)
    v57 = 1;
  else
    v57 = 6;
  *(_QWORD *)&a8->var0.var0 = 130;
  a8->var0.var2 = *(_QWORD *)(v19 + 16);
  a8->var0.var3 = *(_QWORD *)(v19 + 24);
  if (v56 == 6)
  {
    a8->var0.var4 = *(_WORD *)(v19 + 56) * v57;
    v58 = a7;
    goto LABEL_36;
  }
  v58 = a7;
  if (v56 == 3)
  {
    v59 = *(_QWORD *)(v19 + 56);
LABEL_35:
    a8->var0.var4 = v59;
    goto LABEL_36;
  }
  if (v56 != 1)
  {
    v59 = *(_QWORD *)(v19 + 32);
    goto LABEL_35;
  }
  a8->var0.var3 = *(_QWORD *)(v19 + 56);
LABEL_36:
  a8->var0.var6 = 0;
  a8->var0.var7 = 0;
  a8->var0.var8 = v57;
  a8->var0.var9 = *(_QWORD *)(v19 + 40);
  a8->var0.var11 = BYTE8(v74);
  a8->var0.var12 = 0;
  a8->var0.var16.var1.var0 = IOSurfaceGetID(a5);
  a8->var0.var16.var1.var1 = v55;
  a8->var0.var16.var2.var2 = v58;
  a8->var0.var16.var2.var3 = 0;
  v60 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", v67, *(_QWORD *)(v19 + 112), a8, a9);
  v61 = v60;
  if (v60)
  {
    v60->_textureType = *(_QWORD *)v19;
    v60->_width = *(_QWORD *)(v19 + 16);
    v60->_height = *(_QWORD *)(v19 + 24);
    v60->_depth = *(_QWORD *)(v19 + 32);
    v60->_mipmapLevelCount = *(_QWORD *)(v19 + 40);
    v60->_sampleCount = *(_QWORD *)(v19 + 48);
    v60->_arrayLength = *(_QWORD *)(v19 + 56);
    v60->_numFaces = v57;
    v60->_pixelFormat = *(_QWORD *)(v19 + 8);
    v60->_usage = *(_QWORD *)(v19 + 176);
    v60->_rotation = *(_QWORD *)(v19 + 72);
    v60->_swizzle = *(_DWORD *)(v19 + 84);
    v60->_writeSwizzleEnabled = *(_BYTE *)(v19 + 88);
    v60->_shareable = v64;
    v60->_framebufferOnly = *(_BYTE *)(v19 + 80);
    CFRetain(a5);
    v61->_iosurface = a5;
    v61->_iosurfacePlane = v55;
    v61->_isDrawable = *(_BYTE *)(v19 + 81);
    v61->super._res.info.iosurface = a5;
    *((_BYTE *)&v61->super._res.var1 + 3) = v58;
    *(_QWORD *)&v61->super._res.var0 = IOSurfaceGetAllocSize(a5) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&v61->super._res.var1 + 3) << 56);
    v61->_allowGPUOptimizedContents = *(_BYTE *)(v19 + 128);
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(v67, "deviceRef");
      objc_msgSend(v67, "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v61;
}

- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, *((_QWORD *)a3 + 46), 0, *((_QWORD *)a3 + 53), 0, *((_QWORD *)a3 + 55) * *((_QWORD *)a3 + 56), objc_msgSend(a3, "swizzle"), v5);
}

- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, objc_msgSend(a3, "swizzle"), v8);
}

- (MTLIOAccelTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6, 1, a7, 1, objc_msgSend(a3, "swizzle"), v8);
}

- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, *(unsigned int *)&a8, v9);
}

- (MTLIOAccelTexture)initWithTextureInternal:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 compressedView:(BOOL)a9
{
  NSUInteger length;
  NSUInteger location;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  MTLIOAccelTexture *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  id v37;
  id v38;
  __IOSurface *iosurface;

  length = a6.length;
  location = a6.location;
  v15 = MTLTextureSwizzleChannelsToKey(*(unsigned int *)&a8);
  _mtlValidateMTLTextureSwizzleKey(v15, v16, v17, v18, v19, v20, v21, v22);
  _mtlValidateArgumentsForTextureViewOnDevice((void *)objc_msgSend(a3, "device"), a3, a4, a5, location, length, a7.location, a7.length, a9);
  v23 = -[MTLIOAccelResource initWithResource:](self, "initWithResource:", a3);
  if (v23)
  {
    v23->_parentTexture = (MTLIOAccelTexture *)a3;
    v23->_buffer = (MTLIOAccelBuffer *)*((id *)a3 + 41);
    v23->_parentRelativeLevel = location;
    v23->_parentRelativeSlice = a7.location;
    v23->_bufferOffset = objc_msgSend(a3, "bufferOffset");
    v23->_bufferBytesPerRow = objc_msgSend(a3, "bufferBytesPerRow");
    v23->_textureType = a5;
    v24 = *((_QWORD *)a3 + 50) >> location;
    if (v24 <= 1)
      v24 = 1;
    v23->_width = v24;
    v25 = *((_QWORD *)a3 + 51) >> location;
    if (v25 <= 1)
      v25 = 1;
    v23->_height = v25;
    v26 = *((_QWORD *)a3 + 52) >> location;
    if (v26 <= 1)
      v26 = 1;
    v23->_depth = v26;
    v23->_pixelFormat = a4;
    v23->_usage = *((_QWORD *)a3 + 48);
    v27 = 6;
    if (a5 - 5 >= 2)
      v27 = 1;
    v23->_numFaces = v27;
    v23->_arrayLength = a7.length / v27;
    v23->_mipmapLevelCount = length;
    v23->_sampleCount = *((_QWORD *)a3 + 54);
    v23->_rotation = *((_QWORD *)a3 + 49);
    v23->_swizzle = v15;
    v23->_writeSwizzleEnabled = *((_BYTE *)a3 + 340);
    if (objc_msgSend((id)objc_msgSend(a3, "device"), "supportsTextureSwizzle")
      && v23->_swizzle != 84148994)
    {
      v28 = v23->_usage & ~MTLGetDisallowedTextureUsagesWhenSwizzling(objc_msgSend(a3, "device"), v23->_writeSwizzleEnabled);
      v23->_usage = v28;
      _mtlValidateTextureUsage(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    v23->_shareable = 0;
    v23->_framebufferOnly = *((_BYTE *)a3 + 457);
    v23->_iosurface = (__IOSurface *)*((_QWORD *)a3 + 44);
    v23->_iosurfacePlane = *((_QWORD *)a3 + 45);
    v23->_isDrawable = *((_BYTE *)a3 + 458);
    v23->_allowGPUOptimizedContents = *((_BYTE *)a3 + 512);
    v36 = (id *)((char *)a3 + 32);
    v37 = v36[26];
    v38 = v36[27];
    *(_QWORD *)&v23->super._anon_50[160] = v37;
    *(_QWORD *)&v23->super._anon_50[168] = v38;
    *(_OWORD *)&v23->super._anon_50[176] = *((_OWORD *)v36 + 14);
    v23->super._anon_50[192] = *((_BYTE *)v36 + 240);
    *(_QWORD *)&v23->super._anon_50[88] = v36[17];
    *(_QWORD *)&v23->super._anon_50[24] = v36[9];
    iosurface = v23->_iosurface;
    if (iosurface)
      CFRetain(iosurface);
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(*(id *)&v23->super._anon_50[32], "deviceRef");
      objc_msgSend(*(id *)&v23->super._anon_50[32], "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v23;
}

- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 isStrideTexture:(BOOL)a11
{
  _QWORD *v15;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  MTLIOAccelTexture *v26;
  MTLIOAccelTexture *v27;
  _QWORD *v28;
  void *v29;
  unsigned int v30;
  MTLIOAccelTexture *v31;
  void *v32;
  _QWORD *v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  MTLIOAccelTexture *v37;
  MTLIOAccelBuffer *v38;
  _BOOL4 v39;
  _QWORD *v40;
  id v41;
  __int16 v43;
  uint64_t v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v15 = a3;
  v17 = (void *)objc_msgSend(a3, "device");
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var8 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var16.var3.var2[1] = 0u;
  *((_QWORD *)&a9->var0.var16.var3 + 4) = 0;
  v18 = (_QWORD *)objc_msgSend(a4, "descriptorPrivate");
  v23 = v18;
  v24 = *v18;
  if ((unint64_t)(*v18 - 5) >= 2)
    v25 = 1;
  else
    v25 = 6;
  v45 = v25;
  if (a11)
  {
    _mtlValidateStrideTextureParameters(v17, a4, v18[2], v15[21] + a5, a6, 0);
    v26 = -[MTLIOAccelResource initWithResource:](self, "initWithResource:", v15);
    v27 = v26;
    if (!v26)
      return v27;
    *(_QWORD *)&v26->super._anon_50[24] += a5;
    goto LABEL_24;
  }
  v28 = v15;
  v29 = v17;
  if (v18[9])
  {
    v43 = v25;
    MTLReportFailure(0, "-[MTLIOAccelTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", 1102, (uint64_t)CFSTR("Buffer texture has invalid rotation %u"), v19, v20, v21, v22, v18[9]);
    LOWORD(v25) = v43;
    v24 = *v23;
  }
  if (a7)
    v30 = 192;
  else
    v30 = 128;
  a9->var0.var0 = v30;
  a9->var0.var1 = 0;
  a9->var0.var2 = v23[2];
  a9->var0.var3 = v23[3];
  if (v24 == 6)
  {
    a9->var0.var4 = *((_WORD *)v23 + 28) * v25;
    v31 = self;
LABEL_18:
    v32 = v29;
    goto LABEL_20;
  }
  v31 = self;
  if (v24 == 3)
  {
    a9->var0.var4 = v23[7];
    goto LABEL_18;
  }
  v32 = v29;
  if (v24 == 1)
    a9->var0.var3 = v23[7];
  else
    a9->var0.var4 = v23[4];
LABEL_20:
  v15 = v28;
  a9->var0.var6 = a8;
  a9->var0.var7 = a6;
  a9->var0.var8 = v25;
  a9->var0.var9 = v23[5];
  a9->var0.var11 = 1;
  v50 = 0;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  MTLPixelFormatGetInfoForDevice(v32, v23[1], (uint64_t)&v47);
  a9->var0.var11 = BYTE8(v48);
  a9->var0.var12 = *((unsigned __int8 *)v23 + 64) << 6;
  v33 = v28 + 4;
  v34 = v33[17];
  a9->var0.var16.var0.var0 = v34 + a5;
  a9->var0.var16.var0.var1 = v34;
  a9->var0.var16.var0.var2 = a7;
  a9->var0.var16.var0.var3 = objc_msgSend(v15, "resourceSize");
  v35 = *((_DWORD *)v33 + 12);
  if (v35)
  {
    a9->var0.var16.var0.var4 = v35;
    a9->var0.var12 |= 0x800u;
  }
  v36 = v33[20] | (16 * v33[19]) | v33[18] & 0x300;
  v46.receiver = v31;
  v46.super_class = (Class)MTLIOAccelTexture;
  v37 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](&v46, sel_initWithDevice_options_args_argsSize_, v32, v36, a9, a10);
  v27 = v37;
  if (v37)
  {
    v37->super._anon_50[136] = 0;
    if (!a7)
    {
      v38 = 0;
      v39 = 0;
LABEL_25:
      v27->_buffer = v38;
      v27->_bufferOffset = a5;
      v27->_bufferBytesPerRow = a6;
      v27->_textureType = *v23;
      v27->_width = v23[2];
      v27->_height = v23[3];
      v27->_depth = v23[4];
      v27->_mipmapLevelCount = v23[5];
      v27->_sampleCount = v23[6];
      v27->_arrayLength = v23[7];
      v27->_numFaces = v45;
      v27->_pixelFormat = v23[1];
      v27->_usage = v23[22];
      v27->_rotation = 0;
      v27->_swizzle = *((_DWORD *)v23 + 21);
      v27->_writeSwizzleEnabled = *((_BYTE *)v23 + 88);
      v27->_shareable = 0;
      v27->_framebufferOnly = 0;
      v27->_isDrawable = *((_BYTE *)v23 + 81);
      v27->_allowGPUOptimizedContents = *((_BYTE *)v23 + 128);
      v40 = v15 + 4;
      v41 = (id)v40[26];
      *(_QWORD *)&v27->super._anon_50[160] = v41;
      *(_QWORD *)&v27->super._anon_50[168] = v40[27];
      *(_OWORD *)&v27->super._anon_50[176] = *((_OWORD *)v40 + 14);
      v27->super._anon_50[192] = *((_BYTE *)v40 + 240);
      if (v39 && v41)
        *(_QWORD *)&v27->super._anon_50[24] = v40[9] + a5;
      *(_QWORD *)&v27->super._anon_50[88] = v40[17] + a5;
      return v27;
    }
LABEL_24:
    v38 = v15;
    v39 = a11;
    goto LABEL_25;
  }
  return v27;
}

- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  uint64_t v11;

  BYTE4(v11) = 1;
  LODWORD(v11) = a10;
  return -[MTLIOAccelTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a4, a5, a6, a7, a8, a9, v11);
}

- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  MTLIOAccelTexture *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v11 = (void *)objc_msgSend(a3, "device");
  v12 = objc_msgSend(a4, "descriptorPrivate");
  _mtlValidateStrideTextureParameters(v11, a4, *(_QWORD *)(v12 + 16), *((_QWORD *)a3 + 21) + a5, a6, 0);
  v13 = -[MTLIOAccelResource initWithResource:](self, "initWithResource:", a3);
  if (v13)
  {
    v13->_buffer = (MTLIOAccelBuffer *)a3;
    v13->_bufferOffset = a5;
    v13->_bufferBytesPerRow = a6;
    v13->_textureType = *(_QWORD *)v12;
    v13->_width = *(_QWORD *)(v12 + 16);
    v13->_height = *(_QWORD *)(v12 + 24);
    v13->_depth = *(_QWORD *)(v12 + 32);
    v13->_mipmapLevelCount = *(_QWORD *)(v12 + 40);
    v13->_sampleCount = *(_QWORD *)(v12 + 48);
    v13->_arrayLength = *(_QWORD *)(v12 + 56);
    v14 = *(_QWORD *)(v12 + 8);
    v15 = 6;
    if ((unint64_t)(*(_QWORD *)v12 - 5) >= 2)
      v15 = 1;
    v13->_numFaces = v15;
    v13->_pixelFormat = v14;
    v13->_usage = *(_QWORD *)(v12 + 176);
    v13->_rotation = 0;
    v13->_swizzle = *(_DWORD *)(v12 + 84);
    v13->_writeSwizzleEnabled = *(_BYTE *)(v12 + 88);
    v13->_shareable = 0;
    v13->_framebufferOnly = 0;
    v13->_isDrawable = *(_BYTE *)(v12 + 81);
    v13->_allowGPUOptimizedContents = *(_BYTE *)(v12 + 128);
    v16 = *((id *)a3 + 30);
    v17 = *((_QWORD *)a3 + 31);
    *(_QWORD *)&v13->super._anon_50[160] = v16;
    *(_QWORD *)&v13->super._anon_50[168] = v17;
    *(_OWORD *)&v13->super._anon_50[176] = *((_OWORD *)a3 + 16);
    v13->super._anon_50[192] = *((_BYTE *)a3 + 272);
    if (v16)
      v18 = *((_QWORD *)a3 + 13);
    else
      v18 = *(_QWORD *)&v13->super._anon_50[24];
    *(_QWORD *)&v13->super._anon_50[24] = v18 + a5;
    *(_QWORD *)&v13->super._anon_50[88] = *((_QWORD *)a3 + 21) + a5;
  }
  return v13;
}

- (MTLIOAccelTexture)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 device:(id)a7 descriptor:(id)a8
{
  uint64_t v15;
  MTLIOAccelTexture *v16;
  MTLIOAccelTexture *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v15 = objc_msgSend(a8, "descriptorPrivate");
  if (a4)
    v16 = -[MTLIOAccelResource initWithResource:](self, "initWithResource:", a4);
  else
    v16 = -[MTLIOAccelResource initMemoryless:descriptor:](self, "initMemoryless:descriptor:", a7, a8);
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
    v16->_rotation = 0;
    v16->_swizzle = *(_DWORD *)(v15 + 84);
    v16->_writeSwizzleEnabled = *(_BYTE *)(v15 + 88);
    v16->_shareable = 0;
    v16->_framebufferOnly = 0;
    v16->_isDrawable = *(_BYTE *)(v15 + 81);
    v16->_allowGPUOptimizedContents = *(_BYTE *)(v15 + 128);
    *(_QWORD *)&v16->super._anon_50[160] = a3;
    *(_QWORD *)&v17->super._anon_50[168] = a4;
    if (a4)
      v20 = a6;
    else
      v20 = 0;
    *(_QWORD *)&v17->super._anon_50[176] = a5;
    *(_QWORD *)&v17->super._anon_50[184] = v20;
    v17->super._anon_50[192] = 1;
    if (objc_msgSend(a3, "type") == 1)
      v17->super._anon_50[192] = 0;
    if (a4)
    {
      *(_QWORD *)&v17->super._anon_50[88] = *((_QWORD *)a4 + 21) + a5;
      *(_QWORD *)&v17->super._anon_50[24] += a5;
    }
  }
  return v17;
}

- (MTLIOAccelTexture)initWithMasterBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 descriptor:(id)a8 sysMemRowBytes:(unint64_t)a9 vidMemSize:(unint64_t)a10 vidMemRowBytes:(unint64_t)a11 args:(IOAccelNewResourceArgs *)a12 argsSize:(unsigned int)a13
{
  MTLIOAccelTexture *result;
  uint64_t v19;

  BYTE4(v19) = 0;
  LODWORD(v19) = a13;
  result = -[MTLIOAccelTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a8, a6, a9, a10, a11, a12, v19);
  if (result)
  {
    result->_rootResourceIsSuballocatedBuffer = 1;
    result->_masterBuffer = (MTLIOAccelBuffer *)a3;
    result->_masterHeapIndex = a4;
    result->_masterBufferIndex = a5;
    result->_masterBufferOffset = a6;
    result->_length = a7;
  }
  return result;
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)MTLTextureSwizzleKeyToChannels(self->_swizzle, a2);
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
  -[MTLIOAccelTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a7, a8, a9, v10, a4, a3);
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
  -[MTLIOAccelTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v10, a7, a6, a3, a4, a5);
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  -[MTLIOAccelTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:](self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", a3, *(_OWORD *)&a5->var0.var0, a5->var0.var2, a5->var1.var0, *(_OWORD *)&a5->var1.var1);
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  __int128 v6;
  _OWORD v7[3];

  v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLIOAccelTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v7, a4, 0, a5, a6, 0);
}

- (__CFArray)copyAnnotations
{
  __CFDictionary *Mutable;
  const __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t textureType;
  unint64_t v11;
  uint64_t Name;
  unint64_t *p_depth;
  void *v14;
  void *v15;
  unint64_t usage;
  id v17;
  void *v18;
  __CFArray *v19;
  __CFDictionary *v20;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  -[MTLIOAccelResource annotateResource:](self, "annotateResource:", Mutable);
  if (self->_framebufferOnly)
    v4 = CFSTR("Renderbuffer");
  else
    v4 = CFSTR("Texture");
  CFDictionaryAddValue(Mutable, CFSTR("Type"), v4);
  v5 = CFStringCreateMutable(0, 512);
  v25 = "MTLIOAccelTexture";
  CFStringAppendFormat(v5, 0, CFSTR("%s"));
  textureType = self->_textureType;
  if (textureType >= 0xA)
  {
    v22 = "getTargetString";
    v23 = "!\"INVALID TEXTURE TYPE\";
    v24 = 1530;
    goto LABEL_38;
  }
  v25 = off_1E0FE3AE0[textureType];
  CFStringAppendFormat(v5, 0, CFSTR(", %s"));
  v11 = self->_textureType;
  if (v11 > 9)
    goto LABEL_39;
  if (((1 << v11) & 0x7C) != 0)
  {
    CFStringAppendFormat(v5, 0, CFSTR(", %ld x %ld"), self->_width, self->_height);
    goto LABEL_12;
  }
  if (((1 << v11) & 0x203) != 0)
  {
    CFStringAppendFormat(v5, 0, CFSTR(", %ld"), self->_width);
    goto LABEL_12;
  }
  if (v11 != 7)
  {
LABEL_39:
    v22 = "appendDimensionString";
    v23 = "0";
    v24 = 1467;
LABEL_38:
    MTLReleaseAssertionFailure((uint64_t)v22, v24, (uint64_t)v23, 0, v6, v7, v8, v9, (uint64_t)v25);
  }
  CFStringAppendFormat(v5, 0, CFSTR(", %ld x %ld x %ld"), self->_width, self->_height, self->_depth);
LABEL_12:
  Name = MTLPixelFormatGetName(self->_pixelFormat);
  CFStringAppendFormat(v5, 0, CFSTR(", %s"), Name);
  if (self->_mipmapLevelCount >= 2)
    CFStringAppendFormat(v5, 0, CFSTR(", %d mipmap levels"), self->_mipmapLevelCount);
  if (self->_arrayLength >= 2)
  {
    if (self->_textureType - 2 >= 6)
      p_depth = &self->_depth;
    else
      p_depth = &self->_height;
    CFStringAppendFormat(v5, 0, CFSTR(", %d array slices"), *p_depth);
  }
  if (self->_sampleCount)
    CFStringAppendFormat(v5, 0, CFSTR(", %d samples"), self->_sampleCount);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v15 = v14;
  usage = self->_usage;
  if ((usage & 1) != 0)
  {
    objc_msgSend(v14, "appendString:", CFSTR("shaderRead "));
    usage = self->_usage;
    if ((usage & 2) == 0)
    {
LABEL_23:
      if ((usage & 4) == 0)
        goto LABEL_24;
      goto LABEL_33;
    }
  }
  else if ((usage & 2) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v15, "appendString:", CFSTR("shaderWrite "));
  usage = self->_usage;
  if ((usage & 4) == 0)
  {
LABEL_24:
    if ((usage & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v15, "appendString:", CFSTR("renderTarget "));
  usage = self->_usage;
  if ((usage & 0x10) == 0)
  {
LABEL_25:
    if ((usage & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v15, "appendString:", CFSTR("pixelFormatView "));
  usage = self->_usage;
  if ((usage & 0x4000) == 0)
  {
LABEL_26:
    if ((usage & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_35:
  objc_msgSend(v15, "appendString:", CFSTR("noConcurrentAccess "));
  usage = self->_usage;
  if ((usage & 0x10000) != 0)
  {
LABEL_27:
    objc_msgSend(v15, "appendString:", CFSTR("blockWritesOnly "));
    usage = self->_usage;
  }
LABEL_28:
  CFStringAppendFormat(v5, 0, CFSTR(", usage (%08x) %@"), usage, v15);
  v17 = -[MTLIOAccelResource retainedLabel](self, "retainedLabel");
  if (v17)
  {
    v18 = v17;
    CFStringAppendFormat(v5, 0, CFSTR(", \"%s\"), objc_msgSend(v17, "UTF8String"));

  }
  CFDictionaryAddValue(Mutable, CFSTR("Description"), v5);
  CFRelease(v5);
  v19 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v20 = -[MTLIOAccelResource copyAnnotationDictionary:obj_key_name:obj_dict:](self, "copyAnnotationDictionary:obj_key_name:obj_dict:", *(_QWORD *)&self->super._anon_50[8], CFSTR("OpenGLObjects"), Mutable);
  CFArrayAppendValue(v19, v20);
  CFRelease(v20);
  CFRelease(Mutable);
  return v19;
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

- (unint64_t)hazardTrackingMode
{
  unint64_t v2;
  MTLHeap *buffer;

  v2 = (*(_QWORD *)&self->super._anon_50[96] >> 8) & 3;
  if (v2)
    return v2;
  buffer = (MTLHeap *)self->_buffer;
  if (!buffer)
  {
    buffer = (MTLHeap *)self->_parentTexture;
    if (!buffer)
    {
      buffer = -[MTLIOAccelResource heap](self, "heap");
      if (!buffer)
        return 2;
    }
  }
  return -[MTLHeap hazardTrackingMode](buffer, "hazardTrackingMode");
}

- (BOOL)isSparse
{
  MTLHeap *v2;

  v2 = -[MTLIOAccelResource heap](self, "heap");
  if (v2)
    LOBYTE(v2) = -[MTLHeap type](v2, "type") == 2;
  return (char)v2;
}

- (int64_t)compressionFeedback
{
  return 0;
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  objc_super v4;

  if (self->_iosurface)
    return IOSurfaceSetOwnershipIdentity();
  v4.receiver = self;
  v4.super_class = (Class)MTLIOAccelTexture;
  return -[MTLIOAccelResource setOwnerWithIdentity:](&v4, sel_setOwnerWithIdentity_, *(_QWORD *)&a3);
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

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)numFaces
{
  return self->_numFaces;
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

@end
