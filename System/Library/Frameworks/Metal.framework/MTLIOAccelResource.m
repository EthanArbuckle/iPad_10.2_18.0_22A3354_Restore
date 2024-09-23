@implementation MTLIOAccelResource

- (void)setLabel:(id)a3
{
  _MTLIOAccelResource *p_res;
  uint64_t v5;
  void *v6;

  p_res = &self->_res;
  if (*(id *)&self->_anon_50[40] != a3)
  {
    v5 = objc_msgSend(a3, "copy");
    os_unfair_lock_lock((os_unfair_lock_t)p_res[5].vendor.reserved + 1);
    v6 = *(void **)&p_res[1].var0;
    *(_QWORD *)&p_res[1].var0 = v5;
    os_unfair_lock_unlock((os_unfair_lock_t)p_res[5].vendor.reserved + 1);

    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      -[__IOSurface deviceRef](p_res[1].info.iosurface, "deviceRef");
      objc_msgSend(a3, "cStringUsingEncoding:", 1);
      p_res[2].vendor.reserved[1] = IOAccelDeviceTraceObjectLabel();
    }
  }
}

- (id)retainedLabel
{
  _MTLIOAccelResource *p_res;
  os_unfair_lock_s *v3;
  id v4;

  p_res = &self->_res;
  v3 = (os_unfair_lock_s *)&self->_anon_50[196];
  os_unfair_lock_lock((os_unfair_lock_t)&self->_anon_50[196]);
  v4 = *(id *)&p_res[1].var0;
  os_unfair_lock_unlock(v3);
  return v4;
}

- (NSString)label
{
  return (NSString *)-[MTLIOAccelResource retainedLabel](self, "retainedLabel");
}

- (unint64_t)cpuCacheMode
{
  return *(_QWORD *)&self->_anon_50[112];
}

- (unint64_t)storageMode
{
  return *(_QWORD *)&self->_anon_50[104];
}

- (unint64_t)resourceOptions
{
  int v2;
  uint64_t v3;

  v2 = *(_DWORD *)&self->_anon_50[104];
  v3 = *(_QWORD *)&self->_anon_50[112];
  return v3 & 0xF | (16 * (v2 & 0xF)) | ((-[MTLIOAccelResource hazardTrackingMode](self, "hazardTrackingMode") & 3) << 8);
}

- (unint64_t)unfilteredResourceOptions
{
  return *(_QWORD *)&self->_anon_50[96];
}

- (unint64_t)hazardTrackingMode
{
  unint64_t v2;
  MTLHeap *v4;

  v2 = (*(_QWORD *)&self->_anon_50[96] >> 8) & 3;
  if (v2)
    return v2;
  v4 = -[MTLIOAccelResource heap](self, "heap");
  if (!v4)
    return 2;
  return -[MTLHeap hazardTrackingMode](v4, "hazardTrackingMode");
}

- (void)setResponsibleProcess:(int)a3
{
  *(_DWORD *)&self->_anon_50[120] = a3;
}

- (int)responsibleProcess
{
  return *(_DWORD *)&self->_anon_50[120];
}

- (__IOAccelResource)resourceRef
{
  return *(__IOAccelResource **)&self->_anon_50[64];
}

- (BOOL)isPurgeable
{
  return -[MTLIOAccelResource setPurgeableState:](self, "setPurgeableState:", 1) > 2;
}

- (BOOL)isComplete
{
  return IOAccelResourceTestEvent() != 0;
}

- (void)waitUntilComplete
{
  IOAccelResourceFinishEvent();
}

- (id)initStandinWithDevice:(id)a3
{
  MTLIOAccelResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelResource;
  v4 = -[_MTLResource init](&v6, sel_init);
  if (v4)
  {
    *(_QWORD *)&v4->_anon_50[32] = a3;
    v4->_anon_50[136] = 1;
    *(_QWORD *)&v4->_anon_50[104] = 0;
    *(_QWORD *)&v4->_anon_50[112] = 0;
    *(_QWORD *)&v4->_anon_50[96] = 0;
    *(_DWORD *)&v4->_anon_50[120] = getpid();
    *(_QWORD *)&v4->_anon_50[128] = 2;
    *(_DWORD *)v4->_anon_50 = 0;
    *(_QWORD *)&v4->_anon_50[48] = 0;
    *(_QWORD *)&v4->_anon_50[64] = 0;
    *(_QWORD *)&v4->_anon_50[72] = 0;
    *(_QWORD *)&v4->_anon_50[80] = 0;
    *(_QWORD *)&v4->_anon_50[88] = 0;
    *(_QWORD *)&v4->_res.var0 = (unint64_t)*((unsigned __int8 *)&v4->_res.var1 + 3) << 56;
    *(_DWORD *)&v4->_anon_50[196] = 0;
    *(_QWORD *)&v4->_anon_50[16] = 0;
    *(_QWORD *)&v4->_anon_50[24] = 0;
    *(_QWORD *)&v4->_anon_50[8] = 0;
    *(_QWORD *)&v4->_anon_50[144] = 0;
    *(_QWORD *)&v4->_anon_50[152] = 0;
  }
  return v4;
}

- (MTLIOAccelResource)initWithDevice:(id)a3 options:(unint64_t)a4 args:(IOAccelNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  unsigned __int8 *v9;
  int v10;
  uint64_t ClientShared;
  int v12;
  unint64_t var0;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTLIOAccelResource;
  v9 = -[_MTLResource init](&v15, sel_init);
  if (v9)
  {
    *((_QWORD *)v9 + 14) = a3;
    v9[216] = 1;
    *((_QWORD *)v9 + 22) = a4;
    *((_QWORD *)v9 + 23) = a4 >> 4;
    *((_QWORD *)v9 + 24) = a4 & 0xF;
    *((_DWORD *)v9 + 50) = getpid();
    *((_QWORD *)v9 + 26) = 2;
    *((_OWORD *)v9 + 15) = 0u;
    *((_OWORD *)v9 + 16) = 0u;
    v9[272] = 1;
    *((_DWORD *)v9 + 69) = 0;
    if (*((_QWORD *)v9 + 23) == 3)
    {
      *((_DWORD *)v9 + 20) = 0;
      *((_QWORD *)v9 + 16) = 0;
      *((_QWORD *)v9 + 18) = 0;
      *((_QWORD *)v9 + 19) = 0;
      *((_QWORD *)v9 + 20) = 0;
      *((_QWORD *)v9 + 21) = 0;
      *((_QWORD *)v9 + 9) = (unint64_t)v9[79] << 56;
      v9[216] = 0;
      *((_QWORD *)v9 + 12) = 0;
      *((_QWORD *)v9 + 13) = 0;
      *((_QWORD *)v9 + 11) = 0;
      *((_QWORD *)v9 + 28) = 0;
      *((_QWORD *)v9 + 29) = 0;
    }
    else
    {
      if ((a4 & 0x300) == 0x100)
        a5->var0.var12 |= 0x1000u;
      if ((a4 & 0x40000) != 0)
        v10 = 66608;
      else
        v10 = 1072;
      a5->var0.var12 |= (*((_DWORD *)v9 + 44) >> 6) & 0x2000 | v10;
      objc_msgSend(*((id *)v9 + 14), "sharedRef");
      *((_QWORD *)v9 + 18) = IOAccelResourceCreate();
      ClientShared = IOAccelResourceGetClientShared();
      *((_QWORD *)v9 + 19) = ClientShared;
      if (!ClientShared)
      {

        return 0;
      }
      *((_DWORD *)v9 + 20) = *(_DWORD *)(ClientShared + 256);
      *((_QWORD *)v9 + 16) = IOAccelResourceGetGlobalTraceObjectID();
      *((_QWORD *)v9 + 9) = IOAccelResourceGetResidentDataSize() & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v9[79] << 56);
      v12 = *(_DWORD *)(*((_QWORD *)v9 + 19) + 260);
      if (v12 == 130)
      {
        var0 = 0;
      }
      else if ((v12 & 0x80) != 0)
      {
        var0 = a5->var0.var16.var0.var0;
      }
      else
      {
        var0 = IOAccelResourceGetDataBytes();
      }
      *((_QWORD *)v9 + 21) = var0;
      *((_QWORD *)v9 + 13) = IOAccelResourceGetGPUVirtualAddress();
      IOAccelResourceCreateAllocationIdentifierSet();
      objc_msgSend((id)_memoryInfo, "addResourceToList:", v9);
      objc_msgSend(a3, "_addResource:", v9);
    }
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      objc_msgSend(a3, "registryID");
      objc_msgSend(a3, "currentAllocatedSize");
      IOAccelDeviceTraceEvent();
    }
  }
  return (MTLIOAccelResource *)v9;
}

- (id)initMemoryless:(id)a3 descriptor:(id)a4
{
  MTLIOAccelResource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelResource;
  v6 = -[_MTLResource init](&v8, sel_init);
  if (v6)
  {
    *(_QWORD *)&v6->_anon_50[32] = a3;
    *(_OWORD *)&v6->_anon_50[96] = xmmword_182819D00;
    *(_QWORD *)&v6->_anon_50[112] = objc_msgSend(a4, "cpuCacheMode");
    *(_DWORD *)&v6->_anon_50[120] = getpid();
    *(_QWORD *)&v6->_anon_50[128] = 1;
    *(_DWORD *)v6->_anon_50 = 0;
    *(_QWORD *)&v6->_anon_50[64] = 0;
    *(_QWORD *)&v6->_anon_50[72] = 0;
    *(_QWORD *)&v6->_anon_50[80] = 0;
    *(_QWORD *)&v6->_anon_50[88] = 0;
    *(_QWORD *)&v6->_res.var0 = (unint64_t)*((unsigned __int8 *)&v6->_res.var1 + 3) << 56;
    *(_QWORD *)&v6->_anon_50[48] = 0;
    *(_DWORD *)&v6->_anon_50[196] = 0;
    *(_QWORD *)&v6->_anon_50[16] = 0;
    *(_QWORD *)&v6->_anon_50[24] = 0;
    *(_QWORD *)&v6->_anon_50[8] = 0;
    *(_OWORD *)&v6->_anon_50[144] = 0u;
    *(_OWORD *)&v6->_anon_50[160] = 0u;
    *(_OWORD *)&v6->_anon_50[176] = 0u;
    v6->_anon_50[192] = 0;
  }
  return v6;
}

- (MTLIOAccelResource)initWithResource:(id)a3
{
  char *v4;
  char *v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelResource;
  v4 = -[_MTLResource init](&v8, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 14) = (id)objc_msgSend(a3, "device");
    v4[216] = 0;
    v5 = (char *)a3 + 32;
    CFRetain(*((CFTypeRef *)v5 + 14));
    *((_QWORD *)v4 + 18) = *((_QWORD *)v5 + 14);
    *((_QWORD *)v4 + 19) = IOAccelResourceGetClientShared();
    v6 = *((_OWORD *)v5 + 2);
    *((_QWORD *)v4 + 10) = *((_QWORD *)v5 + 6);
    *((_OWORD *)v4 + 4) = v6;
    *((_QWORD *)v4 + 21) = *((_QWORD *)v5 + 17);
    *((_QWORD *)v4 + 13) = IOAccelResourceGetGPUVirtualAddress();
    *((_QWORD *)v4 + 24) = *((_QWORD *)v5 + 20);
    *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 9);
    *((_DWORD *)v4 + 50) = getpid();
    *((_QWORD *)v4 + 26) = *((_QWORD *)v5 + 22);
    *((_QWORD *)v4 + 16) = *((_QWORD *)v5 + 12);
    *(_OWORD *)(v4 + 88) = *(_OWORD *)(v5 + 56);
    objc_msgSend((id)_memoryInfo, "addResourceToList:", v4);
    objc_msgSend(*((id *)v4 + 14), "_addResource:", v4);
  }
  return (MTLIOAccelResource *)v4;
}

- (void)dealloc
{
  objc_super v3;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    objc_msgSend(*(id *)&self->_anon_50[32], "registryID");
    objc_msgSend(*(id *)&self->_anon_50[32], "currentAllocatedSize");
    IOAccelDeviceTraceEvent();
  }
  if (*(_QWORD *)&self->_anon_50[64])
  {
    objc_msgSend((id)_memoryInfo, "removeResourceFromList:", self);
    objc_msgSend(*(id *)&self->_anon_50[32], "_removeResource:", self);
    IOAccelResourceRelease();
    *(_QWORD *)&self->_anon_50[64] = 0;
  }

  *(_QWORD *)&self->_anon_50[32] = 0;
  *(_QWORD *)&self->_anon_50[40] = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelResource;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return *(MTLDevice **)&self->_anon_50[32];
}

- (void)virtualAddress
{
  return *(void **)&self->_anon_50[88];
}

- (unint64_t)gpuAddress
{
  return *(_QWORD *)&self->_anon_50[24];
}

- (unsigned)resourceID
{
  return *(_DWORD *)self->_anon_50;
}

- (unint64_t)resourceSize
{
  return *(_QWORD *)&self->_res.var0 & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)protectionOptions
{
  unint64_t result;

  result = *(_QWORD *)&self->_anon_50[64];
  if (result)
    return IOAccelResourceGetProtectionOptions();
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  __IOSurface *iosurface;
  uint32_t v5;
  uint32_t oldState;

  if (!self->_anon_50[136])
    return 2;
  if (a3 != 1)
  {
    if (a3 == 256)
      return *(_QWORD *)&self->_anon_50[128];
    *(_QWORD *)&self->_anon_50[128] = a3;
  }
  iosurface = self->_res.info.iosurface;
  if (iosurface)
  {
    oldState = 0;
    if (a3 - 2 >= 3)
      v5 = 3;
    else
      v5 = a3 - 2;
    IOSurfaceSetPurgeable(iosurface, v5, &oldState);
    if (oldState > 3)
      return 4;
    else
      return qword_182819D10[oldState];
  }
  else
  {
    IOAccelResourceSetPurgeable();
    return 1;
  }
}

- (__CFDictionary)copyAnnotationDictionary:(unint64_t)a3 obj_key_name:(__CFString *)a4 obj_dict:(__CFDictionary *)a5
{
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  __CFDictionary *Mutable;
  CFMutableArrayRef v10;
  CFMutableDictionaryRef v11;
  CFNumberRef v12;
  CFMutableArrayRef v13;
  CFArrayRef v14;
  void *values;
  pid_t valuePtr;
  unint64_t v18;

  v18 = a3;
  v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v10 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  CFDictionaryAddValue(Mutable, CFSTR("Processes"), v10);
  CFRelease(v10);
  v11 = CFDictionaryCreateMutable(0, 0, v7, v8);
  CFArrayAppendValue(v10, v11);
  CFRelease(v11);
  valuePtr = getpid();
  v12 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v11, CFSTR("PID"), v12);
  CFRelease(v12);
  if (a4 && a5)
  {
    v13 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    CFDictionaryAddValue(v11, a4, v13);
    CFRelease(v13);
    CFArrayAppendValue(v13, a5);
  }
  values = CFNumberCreate(0, kCFNumberSInt64Type, &v18);
  v14 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  CFDictionaryAddValue(Mutable, CFSTR("AllocationIdentifiers"), v14);
  CFRelease(v14);
  CFRelease(values);
  return Mutable;
}

- (void)annotateResource:(__CFDictionary *)a3
{
  _MTLIOAccelResource *p_res;
  CFNumberRef v5;
  unint64_t *v6;
  int v7;
  CFNumberRef v8;
  int valuePtr;

  p_res = &self->_res;
  valuePtr = *(_DWORD *)(*(_QWORD *)&self->_anon_50[72] + 256);
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(a3, CFSTR("Name"), v5);
  CFRelease(v5);
  v7 = p_res[3].vendor.reserved[3];
  v6 = &p_res[3].vendor.reserved[3];
  if (v7 != getpid())
  {
    v8 = CFNumberCreate(0, kCFNumberIntType, v6);
    CFDictionaryAddValue(a3, CFSTR("ResponsiblePID"), v8);
    CFRelease(v8);
  }
}

- (__CFArray)copyAnnotations
{
  __CFDictionary *Mutable;
  id v4;
  void *v5;
  CFStringRef v6;
  __CFArray *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  __CFDictionary *v12;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  -[MTLIOAccelResource annotateResource:](self, "annotateResource:", Mutable);
  CFDictionaryAddValue(Mutable, CFSTR("Type"), CFSTR("Buffer"));
  v4 = -[MTLIOAccelResource retainedLabel](self, "retainedLabel");
  if (v4)
  {
    v5 = v4;
    v6 = CFStringCreateWithCString(0, (const char *)objc_msgSend(v4, "UTF8String"), 0x600u);

  }
  else
  {
    v6 = CFStringCreateWithCString(0, "MTLIOAccelResource", 0x600u);
  }
  CFDictionaryAddValue(Mutable, CFSTR("Description"), v6);
  CFRelease(v6);
  v7 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v8 = 0;
  v14 = *(_OWORD *)&self->_anon_50[8];
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = *((_QWORD *)&v14 + v8);
    if (v11)
    {
      v12 = -[MTLIOAccelResource copyAnnotationDictionary:obj_key_name:obj_dict:](self, "copyAnnotationDictionary:obj_key_name:obj_dict:", v11, CFSTR("OpenGLObjects"), Mutable, v14);
      CFArrayAppendValue(v7, v12);
      CFRelease(v12);
    }
    v9 = 0;
    v8 = 1;
  }
  while ((v10 & 1) != 0);
  CFRelease(Mutable);
  return v7;
}

- (MTLHeap)heap
{
  return *(MTLHeap **)&self->_anon_50[160];
}

- (unint64_t)heapOffset
{
  _MTLIOAccelResource *p_res;
  unint64_t result;

  p_res = &self->_res;
  result = *(_QWORD *)&self->_anon_50[160];
  if (result)
  {
    if (objc_msgSend((id)result, "type") == 1)
      return (unint64_t)p_res[4].info.iosurface;
    else
      return 0;
  }
  return result;
}

- (BOOL)isAliasable
{
  return self->_anon_50[192] == 0;
}

- (void)makeAliasable
{
  _MTLIOAccelResource *p_res;
  void *v3;

  p_res = &self->_res;
  v3 = *(void **)&self->_anon_50[160];
  if (v3)
  {
    if (LOBYTE(p_res[5].vendor.reserved[0]))
    {
      objc_msgSend(v3, "unpinMemoryAtOffset:withLength:", p_res[4].info.iosurface, *(_QWORD *)&p_res[4].var0);
      LOBYTE(p_res[5].vendor.reserved[0]) = 0;
    }
  }
}

- (BOOL)doesAliasResource:(id)a3
{
  _MTLIOAccelResource *p_res;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  __IOSurface *iosurface;
  unint64_t v10;
  unint64_t v11;

  p_res = &self->_res;
  v4 = *(_QWORD *)&self->_anon_50[160];
  if (!v4)
    return 0;
  if (v4 != objc_msgSend(a3, "heap"))
    return 0;
  v7 = *(_QWORD *)&p_res[4].var0;
  if (!v7)
    return 0;
  v8 = *((_QWORD *)a3 + 33);
  if (!v8)
    return 0;
  iosurface = p_res[4].info.iosurface;
  v10 = *((_QWORD *)a3 + 32);
  v11 = v10 + v8;
  return (unint64_t)iosurface + v7 > v10 && v11 > (unint64_t)iosurface;
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  char *v5;
  BOOL v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  if (a4)
  {
    v4 = *(_QWORD *)&self->_anon_50[160];
    v5 = (char *)*a3 + 32;
    if (v4 == *((_QWORD *)*a3 + 30))
    {
      v6 = 0;
      v8 = *(_QWORD *)&self->_anon_50[184];
      v9 = 1;
      do
      {
        if (!v8)
          break;
        v10 = *((_QWORD *)v5 + 29);
        if (!v10)
          break;
        v11 = *(_QWORD *)&self->_anon_50[176];
        v12 = *((_QWORD *)v5 + 28);
        v13 = v12 + v10;
        if (v11 + v8 <= v12 || v13 <= v11)
          break;
        v6 = v9 >= a4;
        if (a4 == v9)
          break;
        v5 = (char *)a3[v9] + 32;
        v15 = *((_QWORD *)a3[v9++] + 30);
      }
      while (v4 == v15);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return v6;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v6;
  _MTLIOAccelResource *p_res;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __IOSurface *iosurface;
  unint64_t v13;
  unint64_t v14;

  if (a4)
  {
    v6 = 0;
    p_res = &self->_res;
    v8 = 1;
    do
    {
      v9 = p_res[4].vendor.reserved[2];
      if (v9 == objc_msgSend((id)a3[v6], "heap"))
      {
        v10 = *(_QWORD *)&p_res[4].var0;
        if (v10)
        {
          v11 = *((_QWORD *)a3[v6] + 33);
          if (v11)
          {
            iosurface = p_res[4].info.iosurface;
            v13 = *((_QWORD *)a3[v6] + 32);
            v14 = v13 + v11;
            if ((unint64_t)iosurface + v10 > v13 && v14 > (unint64_t)iosurface)
              break;
          }
        }
      }
      v8 = ++v6 < a4;
    }
    while (a4 != v6);
  }
  else
  {
    return 0;
  }
  return v8;
}

- (unint64_t)allocatedSize
{
  if (*(_QWORD *)&self->_anon_50[160])
    return *(_QWORD *)&self->_anon_50[184];
  else
    return -[MTLIOAccelResource resourceSize](self, "resourceSize");
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  return -536870201;
}

- (unint64_t)allocationID
{
  return *(_QWORD *)&self->_anon_50[8];
}

- (unint64_t)gpuHandle
{
  -[MTLIOAccelResource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

@end
