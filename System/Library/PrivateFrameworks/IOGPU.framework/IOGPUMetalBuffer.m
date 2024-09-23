@implementation IOGPUMetalBuffer

- (void)dealloc
{
  _IOGPUMetalResource *p_res;
  void *v4;
  IOGPUMetalBuffer *primaryBuffer;
  void (**deallocator)(id, void *, unint64_t);
  __IOSurface *iosurface;
  __IOSurface *aneIOSurface;
  objc_super v9;

  p_res = &self->super._res;
  v4 = *(void **)&self->super._anon_50[136];
  if (v4)
  {
    -[IOGPUMetalResource makeAliasable](self, "makeAliasable");
    objc_msgSend(*(id *)&p_res[3].var0, "deallocHeapSubResource");
    v4 = *(void **)&p_res[3].var0;
  }

  primaryBuffer = self->_primaryBuffer;
  if (primaryBuffer)
    -[__IOSurface deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:](p_res[1].info.iosurface, "deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:", primaryBuffer, self->_primaryHeapIndex, self->_primaryBufferIndex, self->_primaryBufferOffset, self->_length);
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    deallocator[2](deallocator, self->_pointer, -[IOGPUMetalBuffer length](self, "length"));
    _Block_release(self->_deallocator);
    self->_deallocator = 0;
  }
  iosurface = self->_iosurface;
  if (iosurface)
    CFRelease(iosurface);
  aneIOSurface = self->_aneIOSurface;
  if (aneIOSurface)
    CFRelease(aneIOSurface);
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalBuffer;
  -[IOGPUMetalResource dealloc](&v9, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (IOGPUMetalBuffer)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  uint64_t v10;

  LODWORD(v10) = a9;
  return -[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:](self, "initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:", a3, a4, a5, a6, a7, a8, v10, 0);
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 sysMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 args:(IOGPUNewResourceArgs *)a10 argsSize:(unsigned int)a11 deallocator:(id)a12
{
  uint64_t v13;

  LODWORD(v13) = a11;
  return -[IOGPUMetalBuffer initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:](self, "initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:", a3, a4, a5, 1, a7, a8, a9, 0, a10, v13, a12);
}

- (IOGPUMetalBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  return -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:](self, "initWithHeap:resource:offset:length:gpuTag:", a3, a4, a5, a6, 0);
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  unint64_t StatusReg;
  id result;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(_QWORD *)(StatusReg + 288) = 7085;
  result = (id)-[IOGPUMetalBuffer newTextureWithDescriptor:offset:bytesPerRow:](self, "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5, a6);
  *(_QWORD *)(StatusReg + 288) = 0;
  return result;
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11
{
  uint64_t v12;

  LODWORD(v12) = a10;
  return -[IOGPUMetalBuffer initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:](self, "initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:", a3, a4, a5, 1, a6, a7, 0, 0, a9, v12, a11);
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 gpuAddress:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11
{
  uint64_t v12;

  LODWORD(v12) = a10;
  return -[IOGPUMetalBuffer initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:](self, "initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:", a3, a4, a5, 1, a6, a7, a8, 0, a9, v12, a11);
}

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

  v12[21] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = -[IOGPUMetalResource retainedLabel](self, "retainedLabel");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)IOGPUMetalBuffer;
  v7 = -[IOGPUMetalBuffer description](&v11, sel_description);
  v12[0] = v4;
  v12[1] = CFSTR("label =");
  v8 = CFSTR("<none>");
  if (v5)
    v8 = v5;
  v12[2] = v8;
  v12[3] = v4;
  v12[4] = CFSTR("length =");
  v12[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_length);
  v12[6] = v4;
  v12[7] = CFSTR("cpuCacheMode =");
  v12[8] = MTLCPUCacheModeString();
  v12[9] = v4;
  v12[10] = CFSTR("storageMode =");
  v12[11] = MTLStorageModeString();
  v12[12] = v4;
  v12[13] = CFSTR("hazardTrackingMode =");
  -[IOGPUMetalResource hazardTrackingMode](self, "hazardTrackingMode");
  v12[14] = MTLHazardTrackingModeString();
  v12[15] = v4;
  v12[16] = CFSTR("resourceOptions =");
  -[IOGPUMetalResource resourceOptions](self, "resourceOptions");
  v12[17] = MTLResourceOptionsString();
  v12[18] = v4;
  v12[19] = CFSTR("purgeableState =");
  v12[20] = MTLPurgeableStateString();
  v9 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 21), "componentsJoinedByString:", CFSTR(" ")));

  return v9;
}

- (id)description
{
  return -[IOGPUMetalBuffer formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)allocatedSize
{
  objc_super v3;

  if (self->_primaryBuffer)
    return self->_length;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalBuffer;
  return -[IOGPUMetalResource allocatedSize](&v3, sel_allocatedSize);
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 sysMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 gpuTag:(unint64_t)a10 args:(IOGPUNewResourceArgs *)a11 argsSize:(unsigned int)a12 deallocator:(id)aBlock
{
  IOGPUMetalBuffer *v20;
  unint64_t v21;
  unint64_t v23;

  a11->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a11->var0.var14 = 0u;
  *(_OWORD *)(&a11->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a11->var0.var6 = 0u;
  *(_OWORD *)&a11->var0.var12 = 0u;
  *(_OWORD *)&a11->var0.var0 = 0u;
  if (a4 && ((a7 & 0xF0) == 0x20 || (a7 & 0xF0) == 0x30))
    MTLReportFailure();
  if (a8 >= a5)
  {
    v21 = a7 & 0xF;
    if (v21 >= 2)
    {
      v23 = a7 & 0xF;
      MTLReportFailure();
    }
    if (a4)
      v21 = 0;
    if ((a7 & 0xD0) != 0)
    {
      v23 = a7 >> 4;
      MTLReportFailure();
    }
    a11->var0.var0 = (a4 != 0) << 7;
    a11->var0.var1 = (v21 == 1) << 10;
    *(_DWORD *)&a11->var0.var2 = 65537;
    a11->var0.var4 = 1;
    *(_QWORD *)&a11->var0.var6 = 16777473;
    a11->var0.var14 = a6;
    if (a9)
    {
      a11->var0.var12 = a9;
      a11->var0.var13 = a5;
    }
    a11->var0.var15 = HIDWORD(a10);
    a11->var0.var16.var0.var0 = (unint64_t)a4;
    a11->var0.var16.var0.var1 = (unint64_t)a4;
    a11->var0.var16.var0.var2 = a8;
    if ((a7 & 0x10000) == 0)
      a11->var0.var10 = 64;
    v20 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, a7, a11, a12, v23);
    if (v20)
    {
      v20->_length = a5;
      if (aBlock)
      {
        v20->_pointer = a4;
        v20->_deallocator = _Block_copy(aBlock);
      }
      if (*(_DWORD *)__globalGPUCommPage)
      {
        objc_msgSend(a3, "deviceRef");
        objc_msgSend(a3, "registryID");
        IOGPUDeviceTraceEvent();
      }
    }
  }
  else
  {

    return 0;
  }
  return v20;
}

- (IOGPUMetalBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 gpuTag:(unint64_t)a7
{
  IOGPUMetalBuffer *v13;
  IOGPUMetalBuffer *v14;

  if (!a3)
    -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:].cold.1();
  if (!a4)
    -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:].cold.2();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:].cold.3();
  v13 = -[IOGPUMetalResource initWithResource:](self, "initWithResource:", a4);
  v14 = v13;
  if (v13)
  {
    v13->_length = a6;
    *(_QWORD *)&v13->super._anon_50[136] = a3;
    *(_QWORD *)&v14->super._anon_50[144] = a4;
    *(_QWORD *)&v14->super._anon_50[152] = a5;
    *(_QWORD *)&v14->super._anon_50[160] = a6;
    v14->super._anon_50[168] = 1;
    if (objc_msgSend(a3, "type") == 1)
      v14->super._anon_50[168] = 0;
    *(_QWORD *)&v14->super._anon_50[80] += a5;
    *(_QWORD *)&v14->super._anon_50[24] = (*(_QWORD *)&v14->super._anon_50[24] + a5) | a7;
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(*(id *)&v14->super._anon_50[32], "deviceRef");
      objc_msgSend(*(id *)&v14->super._anon_50[32], "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v14;
}

- (IOGPUMetalBuffer)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9 gpuTag:(unint64_t)a10
{
  char *v12;
  IOGPUMetalBuffer *v13;
  IOGPUMetalBuffer *v14;
  _IOGPUMetalResource *p_res;

  self->_primaryBuffer = (IOGPUMetalBuffer *)a3;
  self->_primaryHeapIndex = a4;
  self->_primaryBufferIndex = a5;
  self->_primaryBufferOffset = a6;
  self->_length = a7;
  a8->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a8->var0.var14 = 0u;
  *(_OWORD *)(&a8->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  *(_OWORD *)&a8->var0.var12 = 0u;
  *(_OWORD *)&a8->var0.var0 = 0u;
  v12 = (char *)a3 + 32;
  a8->var0.var0 = *(_DWORD *)(*((_QWORD *)a3 + 18) + 52) | 0x80;
  *(_DWORD *)&a8->var0.var2 = 65537;
  a8->var0.var4 = 1;
  *(_DWORD *)&a8->var0.var6 = 16777473;
  a8->var0.var16.var0.var0 = *((_QWORD *)a3 + 20) + a6;
  a8->var0.var16.var0.var1 = *((_QWORD *)a3 + 20);
  a8->var0.var16.var0.var2 = *((_QWORD *)a3 + 41);
  a8->var0.var16.var0.var3.var0 = *((_DWORD *)a3 + 20);
  a8->var0.var10 = 2048;
  a8->var0.var15 = HIDWORD(a10);
  v13 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", objc_msgSend(a3, "device"), *((_QWORD *)a3 + 21), a8, a9);
  v14 = v13;
  if (v13)
  {
    p_res = &v13->super._res;
    v13->super._anon_50[128] = 0;
    if (a8->var0.var16.var0.var0 != *(_QWORD *)&v13->super._anon_50[80])
      -[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:].cold.2();
    if (*(_QWORD *)&v13->super._anon_50[24] != ((*((_QWORD *)v12 + 9) + a6) | a10))
      -[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:].cold.1();
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(*(id *)&v13->super._anon_50[32], "deviceRef");
      -[__IOSurface registryID](p_res[1].info.iosurface, "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v14;
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  return -[IOGPUMetalBuffer initWithDevice:iosurface:gpuAddress:args:argsSize:](self, "initWithDevice:iosurface:gpuAddress:args:argsSize:", a3, a4, 0, a5, *(_QWORD *)&a6);
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 gpuAddress:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7
{
  uint64_t v7;
  size_t AllocSize;
  size_t v14;
  IOGPUMetalBuffer *v15;

  v7 = *(_QWORD *)&a7;
  *(_OWORD *)&a6->var0.var0 = 0u;
  *(_OWORD *)&a6->var0.var6 = 0u;
  a6->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a6->var0.var14 = 0u;
  *(_OWORD *)(&a6->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a6->var0.var12 = 0u;
  *(_QWORD *)&a6->var0.var0 = 130;
  *(_DWORD *)&a6->var0.var2 = 65537;
  a6->var0.var4 = 1;
  *(_QWORD *)&a6->var0.var6 = 16777473;
  a6->var0.var16.var1.var0 = IOSurfaceGetID(a4);
  a6->var0.var16.var1.var1 = 0;
  a6->var0.var16.var0.var1 = 0;
  AllocSize = IOSurfaceGetAllocSize(a4);
  v14 = AllocSize;
  if (a5)
  {
    a6->var0.var12 = a5;
    a6->var0.var13 = AllocSize;
  }
  v15 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, 0, a6, v7);
  if (v15)
  {
    CFRetain(a4);
    v15->_iosurface = a4;
    v15->_length = v14;
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v15;
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 addressRanges:(IOGPUAddressRange *)a4 addressRangeCount:(unint64_t)a5 length:(unint64_t)a6 options:(unint64_t)a7 gpuAddress:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  IOGPUMetalBuffer *v12;
  IOGPUMetalBuffer *v13;
  objc_super v15;

  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)(&a9->var0.var16.var3 + 2) = 0u;
  a9->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a9->var0.var12 = 0u;
  *(_QWORD *)&a9->var0.var0 = 128;
  *(_DWORD *)&a9->var0.var2 = 65537;
  a9->var0.var4 = 1;
  *(_DWORD *)&a9->var0.var6 = 16777473;
  a9->var0.var16.var0.var0 = (unint64_t)a4;
  a9->var0.var16.var0.var1 = a5;
  a9->var0.var10 |= 0x200000u;
  v15.receiver = self;
  v15.super_class = (Class)IOGPUMetalBuffer;
  v12 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](&v15, sel_initWithDevice_options_args_argsSize_, a3, a7, a9, a10);
  v13 = v12;
  if (v12)
  {
    v12->_length = a6;
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(a3, "deviceRef");
      objc_msgSend(a3, "registryID");
      IOGPUDeviceTraceEvent();
    }
  }
  return v13;
}

- (void)didModifyRange:(_NSRange)a3
{
  MTLReportFailure();
}

- (__CFArray)copyAnnotations
{
  __CFDictionary *Mutable;
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  __CFArray *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  __CFDictionary *v14;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  -[IOGPUMetalResource annotateResource:](self, "annotateResource:", Mutable);
  CFDictionaryAddValue(Mutable, CFSTR("Type"), CFSTR("Buffer"));
  v4 = CFStringCreateMutable(0, 512);
  CFStringAppendFormat(v4, 0, CFSTR("%s"), "IOGPUMetalBuffer ");
  v5 = (void *)MEMORY[0x212BDF02C]();
  v6 = (const __CFString *)objc_msgSend((id)objc_msgSend((id)MTLResourceOptionsString(), "stringByReplacingOccurrencesOfString:withString:", CFSTR("MTLResource"), &stru_24CC40088), "stringByReplacingOccurrencesOfString:withString:", CFSTR("Mode"), &stru_24CC40088);
  CFStringAppend(v4, v6);
  if (objc_loadWeak((id *)&self->super.weakSelf))
    CFStringAppendFormat(v4, 0, CFSTR(", handle (%012llx)"), -[IOGPUMetalResource gpuAddress](self, "gpuAddress"));
  else
    CFStringAppend(v4, CFSTR(", dead"));
  objc_autoreleasePoolPop(v5);
  CFStringAppendFormat(v4, 0, CFSTR(", size %lluB"), self->_length);
  if (*(_QWORD *)&self->super._anon_50[136])
    CFStringAppendFormat(v4, 0, CFSTR(", heap (+%llx)"), *(_QWORD *)&self->super._anon_50[152]);
  if (self->_primaryBuffer)
    CFStringAppendFormat(v4, 0, CFSTR(", suballoc (+%llx)"), self->_primaryBufferOffset);
  v7 = -[IOGPUMetalResource retainedLabel](self, "retainedLabel");
  if (v7)
  {
    v8 = v7;
    CFStringAppendFormat(v4, 0, CFSTR(", \"%s\"), objc_msgSend(v7, "UTF8String"));

  }
  CFDictionaryAddValue(Mutable, CFSTR("Description"), v4);
  CFRelease(v4);
  v9 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v10 = 0;
  v16 = *(_OWORD *)&self->super._anon_50[8];
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = *((_QWORD *)&v16 + v10);
    if (v13)
    {
      v14 = -[IOGPUMetalResource copyAnnotationDictionary:obj_key_name:obj_dict:](self, "copyAnnotationDictionary:obj_key_name:obj_dict:", v13, CFSTR("OpenGLObjects"), Mutable);
      CFArrayAppendValue(v9, v14);
      CFRelease(v14);
    }
    v11 = 0;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  CFRelease(Mutable);
  return v9;
}

- (__IOSurface)_aneIOSurface
{
  _IOGPUMetalResource *p_res;
  os_unfair_lock_s *v4;
  __IOSurface *aneIOSurface;
  unint64_t *p_primaryBufferOffset;

  p_res = &self->super._res;
  v4 = (os_unfair_lock_s *)&self->super._anon_50[172];
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._anon_50[172]);
  aneIOSurface = self->_aneIOSurface;
  if (!aneIOSurface)
  {
    if (self->_primaryBuffer)
      p_primaryBufferOffset = &self->_primaryBufferOffset;
    else
      p_primaryBufferOffset = &p_res[4].vendor.reserved[1];
    aneIOSurface = IOGPUResourceCreateIOSurface((uint64_t)-[IOGPUMetalResource resourceRef](self, "resourceRef"), *p_primaryBufferOffset, self->_length);
    self->_aneIOSurface = aneIOSurface;
  }
  os_unfair_lock_unlock(v4);
  return aneIOSurface;
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  objc_super v4;

  if (self->_iosurface)
    return IOSurfaceSetOwnershipIdentity();
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalBuffer;
  return -[IOGPUMetalResource setOwnerWithIdentity:](&v4, sel_setOwnerWithIdentity_, *(_QWORD *)&a3);
}

- (BOOL)detachBacking
{
  return IOGPUResourceDetachBacking((uint64_t)-[IOGPUMetalResource resourceRef](self, "resourceRef")) == 0;
}

- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  int v8;
  void (**deallocator)(id, void *, unint64_t);

  v8 = IOGPUResourceReplaceBackingWithBytes((uint64_t)-[IOGPUMetalResource resourceRef](self, "resourceRef"), (uint64_t)a3, a4);
  if (!v8)
  {
    deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    if (deallocator)
    {
      deallocator[2](deallocator, self->_pointer, -[IOGPUMetalBuffer length](self, "length"));
      _Block_release(self->_deallocator);
      self->_deallocator = 0;
    }
    if (a5)
      self->_deallocator = _Block_copy(a5);
    self->_pointer = a3;
    *(_QWORD *)&self->super._anon_50[80] = a3;
  }
  return v8 == 0;
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  int v5;
  void (**deallocator)(id, void *, unint64_t);
  uint64_t v8;

  v8 = 0;
  v5 = IOGPUResourceReplaceBackingWithRanges((uint64_t)-[IOGPUMetalResource resourceRef](self, "resourceRef"), objc_msgSend(a3, "ranges"), objc_msgSend(a3, "count"), a4, 1, &v8);
  if (!v5)
  {
    deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    if (deallocator)
    {
      deallocator[2](deallocator, self->_pointer, -[IOGPUMetalBuffer length](self, "length"));
      _Block_release(self->_deallocator);
      self->_deallocator = 0;
    }
    self->_pointer = 0;
    *(_QWORD *)&self->super._anon_50[80] = v8;
  }
  return v5 == 0;
}

- (void)initWithHeap:resource:offset:length:gpuTag:.cold.1()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]", "IOGPUMetalBuffer.m", 251, "heap != nil");
}

- (void)initWithHeap:resource:offset:length:gpuTag:.cold.2()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]", "IOGPUMetalBuffer.m", 252, "resource != nil");
}

- (void)initWithHeap:resource:offset:length:gpuTag:.cold.3()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]", "IOGPUMetalBuffer.m", 253, "[resource isKindOfClass:[IOGPUMetalResource class]]");
}

- (void)initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:.cold.1()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:]", "IOGPUMetalBuffer.m", 355, "(uint64_t)_res.gpuAddress == (((uint64_t)primaryBuffer->_res.gpuAddress + bufferOffset) | gpuTag)");
}

- (void)initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:.cold.2()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:]", "IOGPUMetalBuffer.m", 354, "(uintptr_t)_res.virtualAddress == (uintptr_t)args->comm.opt.standard.texture_address");
}

@end
