@implementation IOGPUMetalResource

- (unint64_t)storageMode
{
  return *(_QWORD *)&self->_anon_50[96];
}

- (unint64_t)hazardTrackingMode
{
  unint64_t v2;
  MTLHeap *v4;

  v2 = (*(_QWORD *)&self->_anon_50[88] >> 8) & 3;
  if (v2)
    return v2;
  v4 = -[IOGPUMetalResource heap](self, "heap");
  if (!v4)
    return 2;
  return -[MTLHeap hazardTrackingMode](v4, "hazardTrackingMode");
}

- (unint64_t)resourceOptions
{
  int v2;
  uint64_t v3;

  v2 = *(_DWORD *)&self->_anon_50[96];
  v3 = *(_QWORD *)&self->_anon_50[104];
  return v3 & 0xF | (16 * (v2 & 0xF)) | ((-[IOGPUMetalResource hazardTrackingMode](self, "hazardTrackingMode") & 3) << 8);
}

- (MTLHeap)heap
{
  return *(MTLHeap **)&self->_anon_50[136];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->weakSelf);
}

- (void)virtualAddress
{
  return *(void **)&self->_anon_50[80];
}

- (unint64_t)gpuAddress
{
  return *(_QWORD *)&self->_anon_50[24];
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  _IOGPUMetalResource *p_res;
  __IOSurface *iosurface;
  uint32_t v5;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uintptr_t v10;
  uint64_t v11;
  int v12;
  uint32_t oldState;

  p_res = &self->_res;
  if (!self->_anon_50[128])
    return 2;
  if (a3 != 1 && a3 != 256)
    *(_QWORD *)&self->_anon_50[120] = a3;
  if (a3 == 256 || (iosurface = self->_res.info.iosurface) == 0)
  {
    v12 = 0;
    if (a3 == 256)
      v7 = 5;
    else
      v7 = 1;
    if (a3 == 4)
      v8 = 4;
    else
      v8 = v7;
    if (a3 == 3)
      v9 = 3;
    else
      v9 = 1;
    if (a3 == 2)
      v9 = 2;
    if ((uint64_t)a3 <= 3)
      v10 = v9;
    else
      v10 = v8;
    IOGPUResourceSetPurgeable(p_res[2].vendor.reserved[2], v10, &v12);
    v11 = (v12 - 2);
    if (v11 >= 3)
      return 1;
    else
      return v11 + 2;
  }
  else
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
      return qword_21167AF60[oldState];
  }
}

- (IOGPUMetalResource)initWithResource:(id)a3
{
  char *v5;
  char *v6;
  _QWORD *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  if (!a3)
    -[IOGPUMetalResource initWithResource:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalResource initWithResource:].cold.3();
  v12.receiver = self;
  v12.super_class = (Class)IOGPUMetalResource;
  v5 = -[_MTLResource init](&v12, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 14) = (id)objc_msgSend(a3, "device");
    v5[208] = 0;
    v6 = (char *)a3 + 32;
    CFRetain(*((CFTypeRef *)v6 + 14));
    v7 = (_QWORD *)*((_QWORD *)v6 + 14);
    *((_QWORD *)v5 + 18) = v7;
    *((_QWORD *)v5 + 19) = IOGPUResourceGetClientShared(v7);
    v8 = *((_OWORD *)v6 + 2);
    v9 = *((_QWORD *)v6 + 6);
    *((_QWORD *)v5 + 10) = v9;
    *((_OWORD *)v5 + 4) = v8;
    v10 = *((_QWORD *)v5 + 18);
    if ((_DWORD)v9 != *(_DWORD *)(v10 + 48))
      -[IOGPUMetalResource initWithResource:].cold.2();
    *((_QWORD *)v5 + 20) = *((_QWORD *)v6 + 16);
    *((_QWORD *)v5 + 13) = IOGPUResourceGetGPUVirtualAddress(v10);
    *((_QWORD *)v5 + 23) = *((_QWORD *)v6 + 19);
    *(_OWORD *)(v5 + 168) = *(_OWORD *)(v6 + 136);
    *((_DWORD *)v5 + 48) = getpid();
    *((_QWORD *)v5 + 25) = *((_QWORD *)v6 + 21);
    *((_QWORD *)v5 + 16) = *((_QWORD *)v6 + 12);
    *(_OWORD *)(v5 + 88) = *(_OWORD *)(v6 + 56);
    objc_storeWeak((id *)v5 + 35, v5);
    objc_msgSend((id)_ioGPUMemoryInfo, "addResourceToList:", v5);
    objc_msgSend(*((id *)v5 + 14), "_addResource:", v5);
  }
  return (IOGPUMetalResource *)v5;
}

- (MTLDevice)device
{
  return *(MTLDevice **)&self->_anon_50[32];
}

- (void)dealloc
{
  objc_super v3;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)&self->_anon_50[32], "registryID");
    objc_msgSend(*(id *)&self->_anon_50[32], "currentAllocatedSize");
    IOGPUDeviceTraceEvent();
  }
  if (*(_QWORD *)&self->_anon_50[64])
  {
    objc_msgSend((id)_ioGPUMemoryInfo, "removeResourceFromList:", self);
    objc_storeWeak((id *)&self->weakSelf, 0);
    objc_msgSend(*(id *)&self->_anon_50[32], "_removeResource:", self);
    IOGPUResourceRelease(*(CFTypeRef *)&self->_anon_50[64]);
    *(_QWORD *)&self->_anon_50[64] = 0;
  }

  *(_QWORD *)&self->_anon_50[32] = 0;
  *(_QWORD *)&self->_anon_50[40] = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalResource;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (IOGPUMetalResource)initWithDevice:(id)a3 options:(unint64_t)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  char *v11;
  uint64_t v12;
  unsigned int var10;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;
  _QWORD *v18;
  _QWORD *ClientShared;
  uint64_t v20;
  uint64_t v21;
  int v22;
  objc_super v24;

  if (!a3)
    -[IOGPUMetalResource initWithDevice:options:args:argsSize:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalResource initWithDevice:options:args:argsSize:].cold.2();
  v24.receiver = self;
  v24.super_class = (Class)IOGPUMetalResource;
  v11 = -[_MTLResource init](&v24, sel_init);
  if (v11)
  {
    *((_QWORD *)v11 + 14) = a3;
    v11[208] = 1;
    *((_QWORD *)v11 + 21) = a4;
    *((_QWORD *)v11 + 22) = a4 >> 4;
    *((_QWORD *)v11 + 23) = a4 & 0xF;
    *((_DWORD *)v11 + 48) = getpid();
    *((_QWORD *)v11 + 25) = 2;
    *(_OWORD *)(v11 + 216) = 0u;
    *(_OWORD *)(v11 + 232) = 0u;
    v11[248] = 1;
    *((_DWORD *)v11 + 63) = 0;
    if (*((_QWORD *)v11 + 22) == 3)
    {
      *((_DWORD *)v11 + 20) = 0;
      *((_QWORD *)v11 + 16) = 0;
      *((_QWORD *)v11 + 19) = 0;
      *((_QWORD *)v11 + 20) = 0;
      *((_QWORD *)v11 + 18) = 0;
      *((_QWORD *)v11 + 9) = (unint64_t)v11[79] << 56;
      v11[208] = 0;
      *((_QWORD *)v11 + 12) = 0;
      *((_QWORD *)v11 + 13) = 0;
      *((_QWORD *)v11 + 11) = 0;
    }
    else
    {
      if ((a4 & 0x300) == 0x100)
        a5->var0.var10 |= 0x1000u;
      if (initWithDevice_options_args_argsSize__once_token != -1)
        dispatch_once(&initWithDevice_options_args_argsSize__once_token, &__block_literal_global_3);
      v12 = *((_QWORD *)v11 + 21);
      if ((v12 & 0x80000) != 0
        || (initWithDevice_options_args_argsSize__gAllowCPUMapping & 1) == 0
        && (a4 & 0x20000) == 0
        && *((_QWORD *)v11 + 22) == 2)
      {
        a5->var0.var10 |= 0x2000u;
      }
      var10 = a5->var0.var10;
      v14 = var10 & 0xFFFFFBCF | 0x10;
      v15 = var10 | 0x30;
      if ((v12 & 0x1000000) != 0)
        v16 = v14;
      else
        v16 = v15;
      if ((a4 & 0x40000) != 0)
        v17 = 66560;
      else
        v17 = 1024;
      a5->var0.var10 = v16 | v17;
      v18 = (_QWORD *)IOGPUResourceCreate((mach_port_t *)objc_msgSend(*((id *)v11 + 14), "deviceRef"), a5, a6);
      *((_QWORD *)v11 + 18) = v18;
      ClientShared = IOGPUResourceGetClientShared(v18);
      *((_QWORD *)v11 + 19) = ClientShared;
      if (!ClientShared)
      {

        return 0;
      }
      v20 = *((_QWORD *)v11 + 18);
      *((_DWORD *)v11 + 20) = *(_DWORD *)(v20 + 48);
      *((_QWORD *)v11 + 16) = IOGPUResourceGetGlobalTraceObjectID(v20);
      *((_QWORD *)v11 + 9) = IOGPUResourceGetResidentDataSize(*((_QWORD *)v11 + 18)) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v11[79] << 56);
      v21 = *((_QWORD *)v11 + 18);
      v22 = *(_DWORD *)(v21 + 52);
      if (v22 == 130)
      {
        *((_QWORD *)v11 + 20) = 0;
      }
      else if ((v22 & 0x80) == 0 || (a5->var0.var10 & 0x200000) != 0)
      {
        *((_QWORD *)v11 + 20) = IOGPUResourceGetDataBytes((_QWORD *)v21);
        v21 = *((_QWORD *)v11 + 18);
      }
      else
      {
        *((_QWORD *)v11 + 20) = a5->var0.var16.var0.var0;
      }
      *((_QWORD *)v11 + 13) = IOGPUResourceGetGPUVirtualAddress(v21);
      IOGPUResourceCreateAllocationIdentifierSet(*((_QWORD *)v11 + 18), (_QWORD *)v11 + 11, (_QWORD *)v11 + 12);
      objc_msgSend(a3, "_addResource:", v11);
      objc_storeWeak((id *)v11 + 35, v11);
      objc_msgSend((id)_ioGPUMemoryInfo, "addResourceToList:", v11);
    }
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(a3, "registryID");
      objc_msgSend(a3, "currentAllocatedSize");
      IOGPUDeviceTraceEvent();
    }
  }
  return (IOGPUMetalResource *)v11;
}

- (void)setLabel:(id)a3
{
  _IOGPUMetalResource *p_res;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  p_res = &self->_res;
  if (*(id *)&self->_anon_50[40] != a3)
  {
    v6 = objc_msgSend(a3, "copy");
    os_unfair_lock_lock((os_unfair_lock_t)&p_res[4].vendor.reserved[3] + 1);
    v7 = *(void **)&p_res[1].var0;
    -[IOGPUMetalResource _setLabel:](self, "_setLabel:", v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&p_res[4].vendor.reserved[3] + 1);

    if (*(_DWORD *)__globalGPUCommPage)
    {
      v8 = -[__IOSurface deviceRef](p_res[1].info.iosurface, "deviceRef");
      v9 = p_res[2].vendor.reserved[0];
      v10 = p_res[2].vendor.reserved[1];
      objc_msgSend(a3, "cStringUsingEncoding:", 1);
      p_res[2].vendor.reserved[1] = IOGPUDeviceTraceObjectLabel(v8, 8, 0, v9, v10);
    }
  }
}

- (void)_setLabel:(id)a3
{
  *(_QWORD *)&self->_anon_50[40] = a3;
}

- (void)makeAliasable
{
  _IOGPUMetalResource *p_res;
  void *v3;

  p_res = &self->_res;
  v3 = *(void **)&self->_anon_50[136];
  if (v3)
  {
    if (LOBYTE(p_res[4].vendor.reserved[3]))
    {
      objc_msgSend(v3, "unpinMemoryAtOffset:withLength:", p_res[4].vendor.reserved[1], p_res[4].vendor.reserved[2]);
      LOBYTE(p_res[4].vendor.reserved[3]) = 0;
    }
  }
}

- (unint64_t)protectionOptions
{
  unint64_t result;

  result = *(_QWORD *)&self->_anon_50[64];
  if (result)
    return IOGPUResourceGetProtectionOptions(result);
  return result;
}

- (unint64_t)cpuCacheMode
{
  return *(_QWORD *)&self->_anon_50[104];
}

- (unint64_t)resourceSize
{
  return *(_QWORD *)&self->_res.var0 & 0xFFFFFFFFFFFFFFLL;
}

- (NSString)label
{
  return (NSString *)-[IOGPUMetalResource retainedLabel](self, "retainedLabel");
}

- (id)retainedLabel
{
  _IOGPUMetalResource *p_res;
  os_unfair_lock_s *v3;
  id v4;

  p_res = &self->_res;
  v3 = (os_unfair_lock_s *)&self->_anon_50[172];
  os_unfair_lock_lock((os_unfair_lock_t)&self->_anon_50[172]);
  v4 = *(id *)&p_res[1].var0;
  os_unfair_lock_unlock(v3);
  return v4;
}

const char *__59__IOGPUMetalResource_initWithDevice_options_args_argsSize___block_invoke()
{
  const char *result;

  if ((dyld_program_sdk_at_least() & 1) == 0)
    initWithDevice_options_args_argsSize__gAllowCPUMapping = 1;
  result = getenv("MTL_PRIVATE_ALLOW_CPU_ACCESS");
  if (result)
  {
    result = (const char *)strcmp(result, "1");
    if (!(_DWORD)result)
      initWithDevice_options_args_argsSize__gAllowCPUMapping = 1;
  }
  return result;
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->_anon_50[64];
  if (v3)
    return IOGPUResourceSetOwnerIdentity(v3, a3);
  else
    return -536870206;
}

- (unint64_t)heapOffset
{
  _IOGPUMetalResource *p_res;
  unint64_t result;

  p_res = &self->_res;
  result = *(_QWORD *)&self->_anon_50[136];
  if (result)
  {
    if (objc_msgSend((id)result, "type") == 1)
      return p_res[4].vendor.reserved[1];
    else
      return 0;
  }
  return result;
}

- (unint64_t)unfilteredResourceOptions
{
  return *(_QWORD *)&self->_anon_50[88];
}

- (void)setResponsibleProcess:(int)a3
{
  *(_DWORD *)&self->_anon_50[112] = a3;
}

- (int)responsibleProcess
{
  return *(_DWORD *)&self->_anon_50[112];
}

- (__IOGPUResource)resourceRef
{
  return *(__IOGPUResource **)&self->_anon_50[64];
}

- (BOOL)isPurgeable
{
  return -[IOGPUMetalResource setPurgeableState:](self, "setPurgeableState:", 1) > 2;
}

- (BOOL)isComplete
{
  return IOGPUResourceTestEvent(*(_QWORD *)&self->_anon_50[64], 0) != 0;
}

- (void)waitUntilComplete
{
  IOGPUResourceFinishEvent(*(_QWORD *)&self->_anon_50[64], 0);
}

- (id)initStandinWithDevice:(id)a3
{
  IOGPUMetalResource *v5;
  objc_super v7;

  if (!a3)
    -[IOGPUMetalResource initStandinWithDevice:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalResource initStandinWithDevice:].cold.2();
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalResource;
  v5 = -[_MTLResource init](&v7, sel_init);
  if (v5)
  {
    *(_QWORD *)&v5->_anon_50[32] = a3;
    v5->_anon_50[128] = 1;
    *(_QWORD *)&v5->_anon_50[96] = 0;
    *(_QWORD *)&v5->_anon_50[104] = 0;
    *(_QWORD *)&v5->_anon_50[88] = 0;
    *(_DWORD *)&v5->_anon_50[112] = getpid();
    *(_QWORD *)&v5->_anon_50[120] = 2;
    *(_DWORD *)v5->_anon_50 = 0;
    *(_QWORD *)&v5->_anon_50[48] = 0;
    *(_QWORD *)&v5->_anon_50[72] = 0;
    *(_QWORD *)&v5->_anon_50[80] = 0;
    *(_QWORD *)&v5->_anon_50[64] = 0;
    *(_QWORD *)&v5->_res.var0 = (unint64_t)*((unsigned __int8 *)&v5->_res.var1 + 3) << 56;
    *(_DWORD *)&v5->_anon_50[172] = 0;
    *(_QWORD *)&v5->_anon_50[16] = 0;
    *(_QWORD *)&v5->_anon_50[24] = 0;
    *(_QWORD *)&v5->_anon_50[8] = 0;
  }
  return v5;
}

- (id)initMemoryless:(id)a3 descriptor:(id)a4
{
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IOGPUMetalResource;
  v6 = -[_MTLResource init](&v8, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 14) = a3;
    *(_OWORD *)(v6 + 168) = xmmword_21167AF50;
    *((_QWORD *)v6 + 23) = objc_msgSend(a4, "cpuCacheMode");
    *((_DWORD *)v6 + 48) = getpid();
    *((_QWORD *)v6 + 25) = 1;
    *((_DWORD *)v6 + 20) = 0;
    *((_QWORD *)v6 + 19) = 0;
    *((_QWORD *)v6 + 20) = 0;
    *((_QWORD *)v6 + 18) = 0;
    *((_QWORD *)v6 + 9) = (unint64_t)v6[79] << 56;
    *((_QWORD *)v6 + 16) = 0;
    *((_DWORD *)v6 + 63) = 0;
    *((_QWORD *)v6 + 12) = 0;
    *((_QWORD *)v6 + 13) = 0;
    *((_QWORD *)v6 + 11) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    v6[248] = 0;
  }
  return v6;
}

- (unsigned)resourceID
{
  return *(_DWORD *)self->_anon_50;
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
  v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
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
    v13 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    CFDictionaryAddValue(v11, a4, v13);
    CFRelease(v13);
    CFArrayAppendValue(v13, a5);
  }
  values = CFNumberCreate(0, kCFNumberSInt64Type, &v18);
  v14 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  CFDictionaryAddValue(Mutable, CFSTR("AllocationIdentifiers"), v14);
  CFRelease(v14);
  CFRelease(values);
  return Mutable;
}

- (void)annotateResource:(__CFDictionary *)a3
{
  _IOGPUMetalResource *p_res;
  CFNumberRef v5;
  unint64_t *v6;
  int v7;
  CFNumberRef v8;
  int valuePtr;

  p_res = &self->_res;
  valuePtr = *(_DWORD *)(*(_QWORD *)&self->_anon_50[64] + 48);
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(a3, CFSTR("Name"), v5);
  CFRelease(v5);
  v7 = p_res[3].vendor.reserved[2];
  v6 = &p_res[3].vendor.reserved[2];
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

  v15 = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  -[IOGPUMetalResource annotateResource:](self, "annotateResource:", Mutable);
  CFDictionaryAddValue(Mutable, CFSTR("Type"), CFSTR("Buffer"));
  v4 = -[IOGPUMetalResource retainedLabel](self, "retainedLabel");
  if (v4)
  {
    v5 = v4;
    v6 = CFStringCreateWithCString(0, (const char *)objc_msgSend(v4, "UTF8String"), 0x600u);

  }
  else
  {
    v6 = CFStringCreateWithCString(0, "IOGPUMetalResource", 0x600u);
  }
  CFDictionaryAddValue(Mutable, CFSTR("Description"), v6);
  CFRelease(v6);
  v7 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v8 = 0;
  v14 = *(_OWORD *)&self->_anon_50[8];
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = *((_QWORD *)&v14 + v8);
    if (v11)
    {
      v12 = -[IOGPUMetalResource copyAnnotationDictionary:obj_key_name:obj_dict:](self, "copyAnnotationDictionary:obj_key_name:obj_dict:", v11, CFSTR("OpenGLObjects"), Mutable, v14);
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

- (BOOL)isAliasable
{
  return self->_anon_50[168] == 0;
}

- (BOOL)doesAliasResource:(id)a3
{
  _IOGPUMetalResource *p_res;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  p_res = &self->_res;
  v4 = *(_QWORD *)&self->_anon_50[136];
  if (!v4)
    return 0;
  if (v4 != objc_msgSend(a3, "heap"))
    return 0;
  v7 = p_res[4].vendor.reserved[2];
  if (!v7)
    return 0;
  v8 = *((_QWORD *)a3 + 30);
  if (!v8)
    return 0;
  v9 = p_res[4].vendor.reserved[1];
  v10 = *((_QWORD *)a3 + 29);
  v11 = v10 + v8;
  return v9 + v7 > v10 && v11 > v9;
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
    v4 = *(_QWORD *)&self->_anon_50[136];
    v5 = (char *)*a3 + 32;
    if (v4 == *((_QWORD *)*a3 + 27))
    {
      v6 = 0;
      v8 = *(_QWORD *)&self->_anon_50[160];
      v9 = 1;
      do
      {
        if (!v8)
          break;
        v10 = *((_QWORD *)v5 + 26);
        if (!v10)
          break;
        v11 = *(_QWORD *)&self->_anon_50[152];
        v12 = *((_QWORD *)v5 + 25);
        v13 = v12 + v10;
        if (v11 + v8 <= v12 || v13 <= v11)
          break;
        v6 = v9 >= a4;
        if (a4 == v9)
          break;
        v5 = (char *)a3[v9] + 32;
        v15 = *((_QWORD *)a3[v9++] + 27);
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
  _IOGPUMetalResource *p_res;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  if (a4)
  {
    v6 = 0;
    p_res = &self->_res;
    v8 = 1;
    do
    {
      v9 = *(_QWORD *)&p_res[3].var0;
      if (v9 == objc_msgSend((id)a3[v6], "heap"))
      {
        v10 = p_res[4].vendor.reserved[2];
        if (v10)
        {
          v11 = *((_QWORD *)a3[v6] + 30);
          if (v11)
          {
            v12 = p_res[4].vendor.reserved[1];
            v13 = *((_QWORD *)a3[v6] + 29);
            v14 = v13 + v11;
            if (v12 + v10 > v13 && v14 > v12)
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
  if (*(_QWORD *)&self->_anon_50[136])
    return *(_QWORD *)&self->_anon_50[160];
  else
    return -[IOGPUMetalResource resourceSize](self, "resourceSize");
}

- (unint64_t)allocationID
{
  return *(_QWORD *)&self->_anon_50[8];
}

- (void)initStandinWithDevice:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResource initStandinWithDevice:]", "IOGPUMetalResource.m", 165, "device");
}

- (void)initStandinWithDevice:.cold.2()
{
  __assert_rtn("-[IOGPUMetalResource initStandinWithDevice:]", "IOGPUMetalResource.m", 166, "[device isKindOfClass:[IOGPUMetalDevice class]]");
}

- (void)initWithDevice:options:args:argsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResource initWithDevice:options:args:argsSize:]", "IOGPUMetalResource.m", 215, "device");
}

- (void)initWithDevice:options:args:argsSize:.cold.2()
{
  __assert_rtn("-[IOGPUMetalResource initWithDevice:options:args:argsSize:]", "IOGPUMetalResource.m", 216, "[device isKindOfClass:[IOGPUMetalDevice class]]");
}

- (void)initWithResource:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResource initWithResource:]", "IOGPUMetalResource.m", 458, "resource != nil");
}

- (void)initWithResource:.cold.2()
{
  __assert_rtn("-[IOGPUMetalResource initWithResource:]", "IOGPUMetalResource.m", 479, "_res.info.resourceID == _res.resourceRef->resourceId");
}

- (void)initWithResource:.cold.3()
{
  __assert_rtn("-[IOGPUMetalResource initWithResource:]", "IOGPUMetalResource.m", 459, "[resource isKindOfClass:[IOGPUMetalResource class]]");
}

@end
