@implementation MTLIOAccelBuffer

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[22];

  v12[21] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = -[MTLIOAccelResource retainedLabel](self, "retainedLabel");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)MTLIOAccelBuffer;
  v7 = -[MTLIOAccelBuffer description](&v11, sel_description);
  v12[0] = v4;
  v12[1] = CFSTR("label =");
  v8 = CFSTR("<none>");
  if (v5)
    v8 = v5;
  v12[2] = v8;
  v12[3] = v4;
  v12[4] = CFSTR("length =");
  v12[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_length);
  v12[6] = v4;
  v12[7] = CFSTR("cpuCacheMode =");
  v12[8] = MTLCPUCacheModeString(*(_QWORD *)&self->super._anon_50[112]);
  v12[9] = v4;
  v12[10] = CFSTR("storageMode =");
  v12[11] = MTLStorageModeString(*(_QWORD *)&self->super._anon_50[104]);
  v12[12] = v4;
  v12[13] = CFSTR("hazardTrackingMode =");
  v12[14] = MTLHazardTrackingModeString(-[MTLIOAccelResource hazardTrackingMode](self, "hazardTrackingMode"));
  v12[15] = v4;
  v12[16] = CFSTR("resourceOptions =");
  v12[17] = MTLResourceOptionsString(-[MTLIOAccelResource resourceOptions](self, "resourceOptions"));
  v12[18] = v4;
  v12[19] = CFSTR("purgeableState =");
  v12[20] = MTLPurgeableStateString(*(_QWORD *)&self->super._anon_50[128]);
  v9 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 21), "componentsJoinedByString:", CFSTR(" ")));

  return v9;
}

- (id)description
{
  return -[MTLIOAccelBuffer formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)allocatedSize
{
  objc_super v3;

  if (self->_masterBuffer)
    return self->_length;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelBuffer;
  return -[MTLIOAccelResource allocatedSize](&v3, sel_allocatedSize);
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  unint64_t StatusReg;
  id result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(_QWORD *)(StatusReg + 288) = 7085;
  result = (id)-[MTLIOAccelBuffer newTextureWithDescriptor:offset:bytesPerRow:](self, "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5, a6);
  *(_QWORD *)(StatusReg + 288) = 0;
  return result;
}

- (MTLIOAccelBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11
{
  uint64_t v12;

  LODWORD(v12) = a10;
  return -[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:](self, "initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:", a3, a4, a5, a6, a7, a8, 0, a9, v12, a11);
}

- (MTLIOAccelBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 args:(IOAccelNewResourceArgs *)a10 argsSize:(unsigned int)a11 deallocator:(id)aBlock
{
  MTLIOAccelBuffer *v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  int v23;
  unint64_t v24;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  *((_QWORD *)&a10->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a10->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a10->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a10->var0.var8 = 0u;
  *(_OWORD *)&a10->var0.var14 = 0u;
  *(_OWORD *)&a10->var0.var0 = 0u;
  *(_OWORD *)&a10->var0.var6 = 0u;
  if (a4)
  {
    if ((a6 & 0xF0) == 0x20)
    {
      v26 = CFSTR("storageModePrivate incompatible with ...WithBytes variant of newBuffer");
      v27 = 121;
    }
    else
    {
      if ((a6 & 0xF0) != 0x30)
        goto LABEL_4;
      v26 = CFSTR("storageModeMemoryless incompatible with ...WithBytes variant of newBuffer");
      v27 = 123;
    }
    MTLReportFailure(0, "-[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:]", v27, (uint64_t)v26, a5, a6, a7, a8, v28);
  }
LABEL_4:
  if (a7 >= a5)
  {
    v29 = a3;
    if ((a6 & 0xF) >= 2)
      MTLReportFailure(0, "-[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:]", 147, (uint64_t)CFSTR("Invalid cacheMode %u"), a5, a6, a7, a8, a6 & 0xF);
    if (a4)
      v20 = 0;
    else
      v20 = a6 & 0xF;
    if (((a6 >> 4) | 2) != 2)
      MTLReportFailure(0, "-[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:]", 157, (uint64_t)CFSTR("Invalid storageMode %u"), a5, a6, a7, a8, a6 >> 4);
    if (a6 >> 4)
      v21 = a8;
    else
      v21 = 0;
    v22 = (v21 != 0) << 6;
    if (v21)
      v23 = 192;
    else
      v23 = 128;
    if (a4)
      v22 = v23;
    a10->var0.var0 = v22;
    a10->var0.var1 = (v20 == 1) << 10;
    *(_DWORD *)&a10->var0.var2 = 65537;
    a10->var0.var4 = 1;
    a10->var0.var6 = v21;
    a10->var0.var7 = a7;
    *(_QWORD *)&a10->var0.var8 = 16777473;
    if (a9)
    {
      if (v21)
        v24 = v21;
      else
        v24 = a7;
      a10->var0.var14 = a9;
      a10->var0.var15 = v24;
    }
    a10->var0.var16.var0.var0 = (unint64_t)a4;
    a10->var0.var16.var0.var1 = (unint64_t)a4;
    a10->var0.var16.var0.var2 = v21;
    a10->var0.var16.var0.var3 = a7;
    if ((a6 & 0x10000) == 0)
      a10->var0.var12 = 64;
    v19 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", v29, a6, a10, a11);
    if (v19)
    {
      v19->_length = a5;
      if (aBlock)
      {
        v19->_pointer = a4;
        v19->_deallocator = _Block_copy(aBlock);
      }
      if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
      {
        objc_msgSend(v29, "deviceRef");
        objc_msgSend(v29, "registryID");
        IOAccelDeviceTraceEvent();
      }
    }
  }
  else
  {

    return 0;
  }
  return v19;
}

- (MTLIOAccelBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  MTLIOAccelBuffer *v10;
  MTLIOAccelBuffer *v11;

  v10 = -[MTLIOAccelResource initWithResource:](self, "initWithResource:", a4);
  v11 = v10;
  if (v10)
  {
    v10->_length = a6;
    *(_QWORD *)&v10->super._anon_50[160] = a3;
    *(_QWORD *)&v11->super._anon_50[168] = a4;
    *(_QWORD *)&v11->super._anon_50[176] = a5;
    *(_QWORD *)&v11->super._anon_50[184] = a6;
    v11->super._anon_50[192] = 1;
    if (objc_msgSend(a3, "type") == 1)
      v11->super._anon_50[192] = 0;
    *(_QWORD *)&v11->super._anon_50[88] += a5;
    *(_QWORD *)&v11->super._anon_50[24] += a5;
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(*(id *)&v11->super._anon_50[32], "deviceRef");
      objc_msgSend(*(id *)&v11->super._anon_50[32], "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v11;
}

- (MTLIOAccelBuffer)initWithMasterBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOAccelNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  int v9;
  unint64_t v10;
  unint64_t v11;
  MTLIOAccelBuffer *v12;
  MTLIOAccelBuffer *v13;
  _MTLIOAccelResource *p_res;

  self->_masterBuffer = (MTLIOAccelBuffer *)a3;
  self->_masterHeapIndex = a4;
  self->_masterBufferIndex = a5;
  self->_masterBufferOffset = a6;
  self->_length = a7;
  *(_OWORD *)&a8->var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  *((_QWORD *)&a8->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a8->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a8->var0.var8 = 0u;
  *(_OWORD *)&a8->var0.var14 = 0u;
  v9 = *(_DWORD *)(*((_QWORD *)a3 + 19) + 260);
  a8->var0.var0 = v9 | 0x80;
  *(_DWORD *)&a8->var0.var2 = 65537;
  a8->var0.var4 = 1;
  if ((v9 & 0x40) != 0)
  {
    v11 = 0;
    v10 = *((_QWORD *)a3 + 9) & 0xFFFFFFFFFFFFFFLL;
    a8->var0.var6 = v10;
  }
  else
  {
    v10 = 0;
    a8->var0.var6 = 0;
    v11 = *((_QWORD *)a3 + 43);
  }
  a8->var0.var7 = v11;
  *(_DWORD *)&a8->var0.var8 = 16777473;
  a8->var0.var16.var0.var0 = *((_QWORD *)a3 + 21) + a6;
  a8->var0.var16.var0.var1 = *((_QWORD *)a3 + 21);
  a8->var0.var16.var0.var2 = v10;
  a8->var0.var16.var0.var3 = v11;
  a8->var0.var16.var0.var4 = *(_DWORD *)(*((_QWORD *)a3 + 19) + 256);
  a8->var0.var12 = 2048;
  v12 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", objc_msgSend(a3, "device"), *((_QWORD *)a3 + 22), a8, a9);
  v13 = v12;
  if (v12)
  {
    p_res = &v12->super._res;
    v12->super._anon_50[136] = 0;
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(*(id *)&v12->super._anon_50[32], "deviceRef");
      -[__IOSurface registryID](p_res[1].info.iosurface, "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v13;
}

- (MTLIOAccelBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 args:(IOAccelNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  uint64_t v6;
  MTLIOAccelBuffer *v11;

  v6 = *(_QWORD *)&a6;
  *(_OWORD *)&a5->var0.var0 = 0u;
  *(_OWORD *)&a5->var0.var6 = 0u;
  *((_QWORD *)&a5->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a5->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a5->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a5->var0.var8 = 0u;
  *(_OWORD *)&a5->var0.var14 = 0u;
  *(_QWORD *)&a5->var0.var0 = 130;
  *(_DWORD *)&a5->var0.var2 = 65537;
  a5->var0.var4 = 1;
  a5->var0.var6 = 0;
  a5->var0.var7 = 0;
  *(_QWORD *)&a5->var0.var8 = 16777473;
  a5->var0.var16.var1.var0 = IOSurfaceGetID(a4);
  a5->var0.var16.var1.var1 = 0;
  a5->var0.var16.var0.var1 = 0;
  v11 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, 0, a5, v6);
  if (v11)
  {
    CFRetain(a4);
    v11->_iosurface = a4;
    v11->_length = IOSurfaceGetAllocSize(a4);
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOAccelDeviceTraceEvent();
    }
  }
  return v11;
}

- (void)dealloc
{
  _MTLIOAccelResource *p_res;
  void *v4;
  MTLIOAccelBuffer *masterBuffer;
  void (**deallocator)(id, void *, unint64_t);
  __IOSurface *iosurface;
  objc_super v8;

  p_res = &self->super._res;
  v4 = *(void **)&self->super._anon_50[160];
  if (v4)
  {
    -[MTLIOAccelResource makeAliasable](self, "makeAliasable");
    objc_msgSend((id)p_res[4].vendor.reserved[2], "deallocHeapSubResource");
    v4 = (void *)p_res[4].vendor.reserved[2];
  }

  masterBuffer = self->_masterBuffer;
  if (masterBuffer)
    -[__IOSurface deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:](p_res[1].info.iosurface, "deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:", masterBuffer, self->_masterHeapIndex, self->_masterBufferIndex, self->_masterBufferOffset, self->_length);
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    deallocator[2](deallocator, self->_pointer, -[MTLIOAccelBuffer length](self, "length"));
    _Block_release(self->_deallocator);
    self->_deallocator = 0;
  }
  iosurface = self->_iosurface;
  if (iosurface)
    CFRelease(iosurface);
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelBuffer;
  -[MTLIOAccelResource dealloc](&v8, sel_dealloc);
}

- (void)didModifyRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[MTLIOAccelBuffer didModifyRange:]", 515, (uint64_t)CFSTR("didModifyRange: is not supported on this platform."), v3, v4, v5, v6, v7);
}

- (__CFArray)copyAnnotations
{
  __CFDictionary *Mutable;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  __CFArray *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  __CFDictionary *v13;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  -[MTLIOAccelResource annotateResource:](self, "annotateResource:", Mutable);
  CFDictionaryAddValue(Mutable, CFSTR("Type"), CFSTR("Buffer"));
  v4 = CFStringCreateMutable(0, 512);
  CFStringAppendFormat(v4, 0, CFSTR("%s"), "MTLIOAccelBuffer");
  v5 = MTLResourceOptionsString(*(_QWORD *)&self->super._anon_50[96]);
  CFStringAppendFormat(v4, 0, CFSTR(", %@"), v5);
  v6 = -[MTLIOAccelResource retainedLabel](self, "retainedLabel");
  if (v6)
  {
    v7 = v6;
    CFStringAppendFormat(v4, 0, CFSTR(", \"%s\"), objc_msgSend(v6, "UTF8String"));

  }
  CFDictionaryAddValue(Mutable, CFSTR("Description"), v4);
  CFRelease(v4);
  v8 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v9 = 0;
  v15 = *(_OWORD *)&self->super._anon_50[8];
  v10 = 1;
  do
  {
    v11 = v10;
    v12 = *((_QWORD *)&v15 + v9);
    if (v12)
    {
      v13 = -[MTLIOAccelResource copyAnnotationDictionary:obj_key_name:obj_dict:](self, "copyAnnotationDictionary:obj_key_name:obj_dict:", v12, CFSTR("OpenGLObjects"), Mutable);
      CFArrayAppendValue(v8, v13);
      CFRelease(v13);
    }
    v10 = 0;
    v9 = 1;
  }
  while ((v11 & 1) != 0);
  CFRelease(Mutable);
  return v8;
}

- (unint64_t)length
{
  return self->_length;
}

- (__IOSurface)_aneIOSurface
{
  return 0;
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  objc_super v4;

  if (self->_iosurface)
    return IOSurfaceSetOwnershipIdentity();
  v4.receiver = self;
  v4.super_class = (Class)MTLIOAccelBuffer;
  return -[MTLIOAccelResource setOwnerWithIdentity:](&v4, sel_setOwnerWithIdentity_, *(_QWORD *)&a3);
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

@end
