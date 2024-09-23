@implementation AGXA10FamilyHeap

- (AGXA10FamilyHeap)initWithDevice:(id)a3 descriptor:(id)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL8 v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  objc_super v19;
  _QWORD v20[2];
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (objc_msgSend(a4, "validateWithDevice:"))
  {
    v7 = (uint64_t *)objc_msgSend(a4, "descriptorPrivate");
    v8 = *v7;
    v20[0] = 0;
    HIDWORD(v20[0]) = (v7[2] != 0) << 10;
    v20[1] = 0x100010001;
    v9 = *MEMORY[0x24BDB03C8];
    v10 = (unint64_t)(v8 + *MEMORY[0x24BDB03C8] - 1) / *MEMORY[0x24BDB03C8];
    v21 = 16777473;
    v11 = v10 * v9;
    v22 = 0;
    v23 = 0;
    v24 = objc_msgSend(a4, "pinnedGPUAddress");
    v25 = objc_msgSend(a4, "size");
    v27 = 0;
    v26 = 0u;
    v28 = v11;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v12 = v7[1] == 2;
    v13 = v7[2] != 0;
    v14 = (objc_msgSend(a4, "hazardTrackingMode") & 3) << 8;
    if ((*(_BYTE *)(*((_QWORD *)a3 + 101) + 6224) & 0x10) != 0)
      v14 = 512;
    v15 = (v13 || 32 * v12) | (unint64_t)v14;
    v16 = v7[6];
    if ((v16 & 0x600000) != 0)
    {
      if ((v16 & 0x200000) != 0)
        v17 = 393216;
      else
        v17 = 0x40000;
      if ((v16 & 0x400000) == 0)
        v17 = 0x20000;
      v22 = v17;
    }
    v19.receiver = self;
    v19.super_class = (Class)AGXA10FamilyHeap;
    return -[IOGPUMetalHeap initWithDevice:size:options:args:argsSize:desc:](&v19, sel_initWithDevice_size_options_args_argsSize_desc_, a3, v11, v15 | v16 & 0x1600000, v20, 104, a4);
  }
  else
  {
    -[IOGPUMetalHeap dealloc](self, "dealloc");
    return 0;
  }
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  return -[AGXBuffer initWithHeap:length:options:]([AGXA10FamilyBuffer alloc], "initWithHeap:length:options:", self, a3, a4);
}

- (id)newTextureWithDescriptor:(id)a3
{
  return -[AGXTexture initWithHeap:desc:]([AGXA10FamilyTexture alloc], "initWithHeap:desc:", self, a3);
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 atOffset:(unint64_t)a5
{
  return -[AGXBuffer initWithHeap:length:options:atOffset:]([AGXA10FamilyBuffer alloc], "initWithHeap:length:options:atOffset:", self, a3, a4, a5);
}

- (id)newTextureWithDescriptor:(id)a3 atOffset:(unint64_t)a4
{
  return -[AGXTexture initWithHeap:desc:atOffset:]([AGXA10FamilyTexture alloc], "initWithHeap:desc:atOffset:", self, a3, a4);
}

- (id)newBufferWithDescriptor:(id)a3
{
  return -[AGXBuffer initWithHeap:length:alignment:pointerTag:options:]([AGXA10FamilyBuffer alloc], "initWithHeap:length:alignment:pointerTag:options:", self, objc_msgSend(a3, "length"), objc_msgSend(a3, "alignment"), objc_msgSend(a3, "pointerTag"), -[_MTLHeap resourceOptions](self, "resourceOptions"));
}

- (id)newBufferWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  return -[AGXBuffer initWithHeap:length:alignment:pointerTag:options:atOffset:]([AGXA10FamilyBuffer alloc], "initWithHeap:length:alignment:pointerTag:options:atOffset:", self, objc_msgSend(a3, "length"), objc_msgSend(a3, "alignment"), objc_msgSend(a3, "pointerTag"), -[_MTLHeap resourceOptions](self, "resourceOptions"), a4);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return -[AGXA10FamilyHeap newAccelerationStructureWithSize:resourceIndex:](self, "newAccelerationStructureWithSize:resourceIndex:", a3, 0);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  MTLDevice *v7;
  uint64_t v8;
  AGXA10FamilyBuffer *v9;
  AGXA10FamilyBuffer *v10;
  AGXA10FamilyRayTracingAccelerationStructure *v11;
  AGXA10FamilyRayTracingAccelerationStructure *v12;

  if (-[_MTLHeap storageMode](self, "storageMode") != 2)
    return 0;
  v7 = -[IOGPUMetalHeap device](self, "device");
  -[MTLDevice heapAccelerationStructureSizeAndAlignWithSize:](v7, "heapAccelerationStructureSizeAndAlignWithSize:", a3);
  v9 = -[AGXBuffer initWithHeap:length:alignment:options:]([AGXA10FamilyBuffer alloc], "initWithHeap:length:alignment:options:", self, a3, v8, -[_MTLHeap resourceOptions](self, "resourceOptions"));
  if (!v9)
    return 0;
  v10 = v9;
  if ((-[MTLDevice buildBVHForRIA](v7, "buildBVHForRIA") & 1) != 0)
    v11 = -[AGXA10FamilyRayTracingAccelerationStructure initWithBuffer:device:length:resourceIndex:]([AGXA10FamilyRayTracingAccelerationStructure alloc], "initWithBuffer:device:length:resourceIndex:", v10, v7, a3, a4);
  else
    v11 = -[AGXA10FamilyRayTracingAccelerationStructureSW initWithBuffer:offset:device:resourceIndex:]([AGXA10FamilyRayTracingAccelerationStructureSW alloc], "initWithBuffer:offset:device:resourceIndex:", v10, 0, v7, a4);
  v12 = v11;

  return v12;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  MTLDevice *v5;

  v5 = -[IOGPUMetalHeap device](self, "device");
  if (v5)
    -[MTLDevice accelerationStructureSizesWithDescriptor:](v5, "accelerationStructureSizesWithDescriptor:", a3);
  return -[AGXA10FamilyHeap newAccelerationStructureWithSize:resourceIndex:](self, "newAccelerationStructureWithSize:resourceIndex:", 0, 0);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return -[AGXA10FamilyHeap newAccelerationStructureWithSize:offset:resourceIndex:](self, "newAccelerationStructureWithSize:offset:resourceIndex:", a3, a4, 0);
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  MTLDevice *v7;

  v7 = -[IOGPUMetalHeap device](self, "device");
  if (v7)
    -[MTLDevice accelerationStructureSizesWithDescriptor:](v7, "accelerationStructureSizesWithDescriptor:", a3);
  return -[AGXA10FamilyHeap newAccelerationStructureWithSize:offset:resourceIndex:](self, "newAccelerationStructureWithSize:offset:resourceIndex:", 0, a4, 0);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  MTLDevice *v9;
  uint64_t v10;
  AGXA10FamilyBuffer *v11;
  AGXA10FamilyBuffer *v12;
  AGXA10FamilyRayTracingAccelerationStructure *v13;
  AGXA10FamilyRayTracingAccelerationStructure *v14;

  if (-[_MTLHeap storageMode](self, "storageMode") != 2)
    return 0;
  v9 = -[IOGPUMetalHeap device](self, "device");
  -[MTLDevice heapAccelerationStructureSizeAndAlignWithSize:](v9, "heapAccelerationStructureSizeAndAlignWithSize:", a3);
  v11 = -[AGXBuffer initWithHeap:length:alignment:options:atOffset:]([AGXA10FamilyBuffer alloc], "initWithHeap:length:alignment:options:atOffset:", self, a3, v10, -[_MTLHeap resourceOptions](self, "resourceOptions"), a4);
  if (!v11)
    return 0;
  v12 = v11;
  if ((-[MTLDevice buildBVHForRIA](v9, "buildBVHForRIA") & 1) != 0)
    v13 = -[AGXA10FamilyRayTracingAccelerationStructure initWithBuffer:device:length:resourceIndex:]([AGXA10FamilyRayTracingAccelerationStructure alloc], "initWithBuffer:device:length:resourceIndex:", v12, v9, a3, a5);
  else
    v13 = -[AGXA10FamilyRayTracingAccelerationStructureSW initWithBuffer:offset:device:resourceIndex:]([AGXA10FamilyRayTracingAccelerationStructureSW alloc], "initWithBuffer:offset:device:resourceIndex:", v12, 0, v9, a5);
  v14 = v13;

  return v14;
}

@end
