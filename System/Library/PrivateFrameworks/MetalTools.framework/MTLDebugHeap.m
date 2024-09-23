@implementation MTLDebugHeap

- (void)validatePixelFormatWithHeap:(unint64_t)a3 context:(_MTLMessageContext *)a4
{
  if (-[MTLToolsHeap type](self, "type") == 2)
    MTLPixelFormatGetInfoForDevice();
}

- (void)validateHeapResourceOptions:(unint64_t)a3 isTexture:(BOOL)a4 isIOSurface:(BOOL)a5 context:(_MTLMessageContext *)a6
{
  _BOOL4 v6;
  unint64_t v9;
  unint64_t v10;

  v6 = a4;
  v9 = a3 & 0xF;
  v10 = (a3 >> 8) & 3;
  if (v10 && v10 != -[MTLToolsHeap hazardTrackingMode](self, "hazardTrackingMode"))
    _MTLMessageContextPush_();
  if (v9 != -[MTLToolsHeap cpuCacheMode](self, "cpuCacheMode"))
    _MTLMessageContextPush_();
  if (a3 >> 4 == -[MTLToolsHeap storageMode](self, "storageMode"))
  {
    if (a3 >> 4)
      goto LABEL_11;
  }
  else
  {
    _MTLMessageContextPush_();
    if (a3 >> 4)
      goto LABEL_11;
  }
  if (v6
    && (-[MTLDevice supportsSharedStorageTextures](-[MTLToolsObject device](self, "device"), "supportsSharedStorageTextures") & 1) == 0)
  {
    _MTLMessageContextPush_();
  }
LABEL_11:
  if ((a3 & 0xFFFFFFFFFFF3FC00) != 0)
    _MTLMessageContextPush_();
}

- (void)validateHeapTextureUsage:(unint64_t)a3 options:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  char v5;
  int64_t v6;

  v5 = a3;
  v6 = -[MTLToolsHeap type](self, "type", a3, a4);
  if ((v5 & 2) != 0 && v6 == 2)
    _MTLMessageContextPush_();
}

- (void)validateTextureAtomicFlags:(id)a3 context:(_MTLMessageContext *)a4
{
  if ((objc_msgSend(a3, "usage") & 0x20) != 0)
  {
    if ((objc_msgSend(a3, "usage") & 3) == 0)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "pixelFormat") != 53
      && objc_msgSend(a3, "pixelFormat") != 54
      && objc_msgSend(a3, "pixelFormat") != 103)
    {
      _MTLMessageContextPush_();
    }
  }
}

- (MTLDebugHeap)initWithHeap:(id)a3 device:(id)a4
{
  MTLDebugHeap *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLDebugHeap;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3);
  if (result)
  {
    result->_debugDevice = (MTLDebugDevice *)a4;
    atomic_store(0, (unsigned int *)&result->super.super._externalReferences + 1);
    LOBYTE(result->_purgeableStateToken.__a_.__a_value) = 0;
  }
  return result;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  if ((a3 & (a3 - 1)) != 0)
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxAvailableSizeWithAlignment:", a3);
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  MTLDebugBuffer *v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD v15[3];
  uint64_t v16;

  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (-[MTLToolsHeap size](self, "size") < a3)
  {
    v11 = a3;
    v13 = -[MTLToolsHeap size](self, "size");
    _MTLMessageContextPush_();
  }
  if ((_QWORD)-[MTLToolsDevice limits](self->_debugDevice, "limits", v11, v13)[256] < a3)
  {
    v12 = a3;
    v14 = (_QWORD)-[MTLToolsDevice limits](self->_debugDevice, "limits")[256] >> 20;
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsHeap type](self, "type", v12, v14) == 2)
    _MTLMessageContextPush_();
  if (-[MTLToolsHeap type](self, "type") == 1)
    _MTLMessageContextPush_();
  -[MTLDebugHeap validateHeapResourceOptions:isTexture:isIOSurface:context:](self, "validateHeapResourceOptions:isTexture:isIOSurface:context:", a4, 0, 0, v15);
  _MTLMessageContextEnd();
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = -[MTLDebugBuffer initWithBuffer:heap:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:heap:device:options:", v7, self, self->_debugDevice, a4);

  return v9;
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v5;
  void *v6;
  MTLDebugTexture *v7;
  _OWORD v9[3];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  if (-[MTLToolsHeap type](self, "type") == 1)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v9[0])
  {
    -[MTLDebugDevice validateMemorylessResource:context:](self->_debugDevice, "validateMemorylessResource:context:", a3, v9);
    if (objc_msgSend(a3, "textureType") == 9)
      _validateTextureBufferDescriptor(a3, -[MTLToolsObject baseObject](self->_debugDevice, "baseObject"));
    -[MTLDebugHeap validateHeapResourceOptions:isTexture:isIOSurface:context:](self, "validateHeapResourceOptions:isTexture:isIOSurface:context:", objc_msgSend(a3, "resourceOptions"), 1, 0, v9);
    -[MTLDebugHeap validateHeapTextureUsage:options:context:](self, "validateHeapTextureUsage:options:context:", objc_msgSend(a3, "usage"), objc_msgSend(a3, "resourceOptions"), v9);
    if (-[MTLToolsHeap type](self, "type") == 2
      && (-[MTLToolsHeap type](self, "type") != 2
       || (-[MTLDevice supportsSparseTextures](-[MTLToolsObject device](self, "device"), "supportsSparseTextures") & 1) == 0))
    {
      _MTLMessageContextPush_();
    }
    if (-[MTLToolsHeap type](self, "type") == 2 && objc_msgSend(a3, "storageMode") != 2)
      _MTLMessageContextPush_();
    if (-[MTLToolsHeap type](self, "type") == 2)
    {
      if (!objc_msgSend(a3, "textureType") || objc_msgSend(a3, "textureType") == 1)
        _MTLMessageContextPush_();
      if (objc_msgSend(a3, "textureType") == 9)
        _MTLMessageContextPush_();
    }
    if (objc_msgSend(a3, "sparseSurfaceDefaultValue") == 1 && objc_msgSend(a3, "pixelFormat") != 252)
      _MTLMessageContextPush_();
    -[MTLDebugHeap validatePixelFormatWithHeap:context:](self, "validatePixelFormatWithHeap:context:", objc_msgSend(a3, "pixelFormat"), v9);
    -[MTLDebugHeap validateTextureAtomicFlags:context:](self, "validateTextureAtomicFlags:context:", a3, v9);
  }
  _MTLMessageContextEnd();
  v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = -[MTLDebugTexture initWithBaseTexture:heap:device:]([MTLDebugTexture alloc], "initWithBaseTexture:heap:device:", v5, self, self->_debugDevice);

  return v7;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->super.super._externalReferences + 1))
        MTLReportFailure();
    }
    LOBYTE(self->_purgeableStateToken.__a_.__a_value) = 1;
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (void)lockPurgeableState
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)(&self->super.super._externalReferences + 1);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
}

- (void)unlockPurgeableState
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)(&self->super.super._externalReferences + 1);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 - 1, v2));
}

- (BOOL)purgeableStateValidForRendering
{
  return !LOBYTE(self->_purgeableStateToken.__a_.__a_value)
      || -[MTLDebugHeap setPurgeableState:](self, "setPurgeableState:", 1) == 2;
}

- (void)validateOffset:(unint64_t)a3 withRequirements:(id)a4
{
  unint64_t var1;
  unint64_t var0;

  var1 = a4.var1;
  var0 = a4.var0;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (var0 + a3 > -[MTLToolsHeap size](self, "size"))
  {
    -[MTLToolsHeap size](self, "size");
    _MTLMessageContextPush_();
  }
  if (a3 % var1)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MTLDebugBuffer *v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _OWORD v19[3];
  uint64_t v20;

  v20 = 0;
  memset(v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (-[MTLToolsHeap size](self, "size") < a3)
  {
    v15 = a3;
    v17 = -[MTLToolsHeap size](self, "size");
    _MTLMessageContextPush_();
  }
  if ((_QWORD)-[MTLToolsDevice limits](self->_debugDevice, "limits", v15, v17)[256] < a3)
  {
    v16 = a3;
    v18 = (_QWORD)-[MTLToolsDevice limits](self->_debugDevice, "limits")[256] >> 20;
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsHeap type](self, "type", v16, v18) != 1)
    _MTLMessageContextPush_();
  -[MTLDebugHeap validateHeapResourceOptions:isTexture:isIOSurface:context:](self, "validateHeapResourceOptions:isTexture:isIOSurface:context:", a4, 0, 0, v19);
  _MTLMessageContextEnd();
  v9 = -[MTLDevice heapBufferSizeAndAlignWithLength:options:](-[MTLToolsObject device](self, "device"), "heapBufferSizeAndAlignWithLength:options:", a3, a4);
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a5, v9, v10);
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:offset:", a3, a4, a5);
  if (!v11)
    return 0;
  v12 = (void *)v11;
  v13 = -[MTLDebugBuffer initWithBuffer:heap:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:heap:device:options:", v11, self, self->_debugDevice, a4);

  return v13;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MTLDebugTexture *v11;
  _OWORD v13[3];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    _MTLMessageContextPush_();
  if (-[MTLToolsHeap type](self, "type") != 1)
    _MTLMessageContextPush_();
  if (!*(_QWORD *)&v13[0])
  {
    -[MTLDebugDevice validateMemorylessResource:context:](self->_debugDevice, "validateMemorylessResource:context:", a3, v13);
    if (objc_msgSend(a3, "textureType") == 9)
      _validateTextureBufferDescriptor(a3, -[MTLToolsObject baseObject](self->_debugDevice, "baseObject"));
    -[MTLDebugHeap validateHeapResourceOptions:isTexture:isIOSurface:context:](self, "validateHeapResourceOptions:isTexture:isIOSurface:context:", objc_msgSend(a3, "resourceOptions"), 1, 0, v13);
    -[MTLDebugHeap validateHeapTextureUsage:options:context:](self, "validateHeapTextureUsage:options:context:", objc_msgSend(a3, "usage"), objc_msgSend(a3, "resourceOptions"), v13);
    -[MTLDebugHeap validatePixelFormatWithHeap:context:](self, "validatePixelFormatWithHeap:context:", objc_msgSend(a3, "pixelFormat"), v13);
    -[MTLDebugHeap validateTextureAtomicFlags:context:](self, "validateTextureAtomicFlags:context:", a3, v13);
  }
  _MTLMessageContextEnd();
  v7 = -[MTLDevice heapTextureSizeAndAlignWithDescriptor:](-[MTLToolsObject device](self, "device"), "heapTextureSizeAndAlignWithDescriptor:", a3);
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v7, v8);
  v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:offset:", a3, a4);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = -[MTLDebugTexture initWithBaseTexture:heap:device:]([MTLDebugTexture alloc], "initWithBaseTexture:heap:device:", v9, self, self->_debugDevice);

  return v11;
}

- (id)_newDebugAccelerationStructure:(id)a3
{
  MTLDebugAccelerationStructure *v4;

  if (!a3)
    return 0;
  v4 = -[MTLDebugAccelerationStructure initWithBaseObject:parent:heap:]([MTLDebugAccelerationStructure alloc], "initWithBaseObject:parent:heap:", a3, self, self);

  return v4;
}

- (void)validateRaytracingHeap
{
  if ((-[MTLDevice supportsRaytracing](-[MTLToolsObject device](self, "device"), "supportsRaytracing") & 1) == 0)
    MTLReportFailure();
  if (-[MTLToolsHeap storageMode](self, "storageMode") != 2)
    MTLReportFailure();
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  unint64_t v6;
  unint64_t v7;

  -[MTLDebugHeap validateRaytracingHeap](self, "validateRaytracingHeap");
  if (!a3)
    MTLReportFailure();
  if (-[MTLToolsHeap size](self, "size") < a3)
  {
    v6 = a3;
    v7 = -[MTLToolsHeap size](self, "size");
    MTLReportFailure();
  }
  return -[MTLDebugHeap _newDebugAccelerationStructure:](self, "_newDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:](self->super.super._baseObject, "newAccelerationStructureWithSize:", a3, v6, v7));
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  -[MTLDebugHeap validateRaytracingHeap](self, "validateRaytracingHeap");
  checkAccelerationStructureDescriptor(-[MTLToolsObject device](self, "device"), a3, 0);
  return -[MTLDebugHeap _newDebugAccelerationStructure:](self, "_newDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithDescriptor:](self->super.super._baseObject, "newAccelerationStructureWithDescriptor:", unwrapAccelerationStructureDescriptor(a3)));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;
  unint64_t v11;

  -[MTLDebugHeap validateRaytracingHeap](self, "validateRaytracingHeap");
  if (-[MTLToolsHeap type](self, "type") == 1)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    MTLReportFailure();
    if (a3)
      goto LABEL_3;
  }
  MTLReportFailure();
LABEL_3:
  if (-[MTLToolsHeap size](self, "size") < a3)
  {
    v10 = a3;
    v11 = -[MTLToolsHeap size](self, "size");
    MTLReportFailure();
  }
  v7 = -[MTLDevice heapAccelerationStructureSizeAndAlignWithSize:](-[MTLToolsObject device](self, "device", v10, v11), "heapAccelerationStructureSizeAndAlignWithSize:", a3);
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v7, v8);
  return -[MTLDebugHeap _newDebugAccelerationStructure:](self, "_newDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:offset:](self->super.super._baseObject, "newAccelerationStructureWithSize:offset:", a3, a4));
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;

  -[MTLDebugHeap validateRaytracingHeap](self, "validateRaytracingHeap");
  checkAccelerationStructureDescriptor(-[MTLToolsObject device](self, "device"), a3, 0);
  if (-[MTLToolsHeap type](self, "type") != 1)
    MTLReportFailure();
  v7 = -[MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:](-[MTLToolsObject device](self, "device"), "heapAccelerationStructureSizeAndAlignWithDescriptor:", a3);
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v7, v8);
  return -[MTLDebugHeap _newDebugAccelerationStructure:](self, "_newDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithDescriptor:offset:](self->super.super._baseObject, "newAccelerationStructureWithDescriptor:offset:", unwrapAccelerationStructureDescriptor(a3), a4));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  unint64_t v8;
  unint64_t v9;

  -[MTLDebugHeap validateRaytracingHeap](self, "validateRaytracingHeap");
  if (!a3)
    MTLReportFailure();
  if (-[MTLToolsHeap size](self, "size") < a3)
  {
    v8 = a3;
    v9 = -[MTLToolsHeap size](self, "size");
    MTLReportFailure();
  }
  return -[MTLDebugHeap _newDebugAccelerationStructure:](self, "_newDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:resourceIndex:](self->super.super._baseObject, "newAccelerationStructureWithSize:resourceIndex:", a3, a4, v8, v9));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  unint64_t v13;

  -[MTLDebugHeap validateRaytracingHeap](self, "validateRaytracingHeap");
  if (-[MTLToolsHeap type](self, "type") == 1)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    MTLReportFailure();
    if (a3)
      goto LABEL_3;
  }
  MTLReportFailure();
LABEL_3:
  if (-[MTLToolsHeap size](self, "size") < a3)
  {
    v12 = a3;
    v13 = -[MTLToolsHeap size](self, "size");
    MTLReportFailure();
  }
  v9 = -[MTLDevice heapAccelerationStructureSizeAndAlignWithSize:](-[MTLToolsObject device](self, "device", v12, v13), "heapAccelerationStructureSizeAndAlignWithSize:", a3);
  -[MTLDebugHeap validateOffset:withRequirements:](self, "validateOffset:withRequirements:", a4, v9, v10);
  return -[MTLDebugHeap _newDebugAccelerationStructure:](self, "_newDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:offset:resourceIndex:](self->super.super._baseObject, "newAccelerationStructureWithSize:offset:resourceIndex:", a3, a4, a5));
}

- (BOOL)detachBacking
{
  if ((-[MTLDevice supportsResourceDetachBacking](-[MTLToolsObject device](self, "device"), "supportsResourceDetachBacking") & 1) == 0)MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "detachBacking");
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  __int128 v8;

  v4 = a4;
  if ((-[MTLDevice supportsResourceDetachBacking](-[MTLToolsObject device](self, "device"), "supportsResourceDetachBacking") & 1) == 0)MTLReportFailure();
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  -[MTLDebugDevice validateAddressRanges:expectedTotalSize:context:](self->_debugDevice, "validateAddressRanges:expectedTotalSize:context:", a3, -[MTLToolsHeap size](self, "size"), &v8);
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithRanges:readOnly:", a3, v4);
}

- (MTLDebugDevice)debugDevice
{
  return self->_debugDevice;
}

@end
