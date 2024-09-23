@implementation AGXTexture

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXTexture;
  -[IOGPUMetalTexture dealloc](&v2, sel_dealloc);
}

- (AGXTexture)initWithDevice:(id)a3 desc:(id)a4 isSuballocDisabled:(BOOL)a5
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AGXTexture *v15;
  AGXTexture *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;
  objc_super v22;
  uint64_t v23;
  int v24;
  _OWORD v25[5];
  __int128 v26;
  uint64_t v27;

  if (objc_msgSend(a4, "validateWithDevice:")
    && (LOWORD(v20) = 0,
        LOBYTE(v18) = 1,
        -[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a3, a4, 0, 0, 0, 0, 0, v18, 0, v20)))
  {
    v27 = 0;
    v26 = 0u;
    memset(v25, 0, sizeof(v25));
    -[AGXTexture initNewTextureData:](self, "initNewTextureData:", v25);
    if (!-[AGXTexture isMemoryless](self, "isMemoryless") && !objc_msgSend(a4, "protectionOptions"))
    {
      v9 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes");
      if (v9 < *MEMORY[0x24BDB03C8] && (BYTE8(v26) & 1) == 0 && !a5)
      {
        v24 = 0;
        v23 = 0;
        v10 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes");
        v11 = -[AGXTexture getAlignment](self, "getAlignment");
        v12 = objc_msgSend(a4, "descriptorPrivate");
        v13 = (*(_QWORD *)(v12 + 112) & 0xF0) == 0x20 ? *(_QWORD *)(v12 + 112) | 0x20000 : *(_QWORD *)(v12 + 112);
        v14 = objc_msgSend(a3, "allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:", v10, v13, v11, (char *)&v24 + 2, &v24, &v23);
        if (v14)
        {
          v22.receiver = self;
          v22.super_class = (Class)AGXTexture;
          v15 = -[IOGPUMetalTexture initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:descriptor:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:](&v22, sel_initWithPrimaryBuffer_heapIndex_bufferIndex_bufferOffset_length_descriptor_sysMemRowBytes_vidMemSize_vidMemRowBytes_args_argsSize_, v14, SHIWORD(v24), (__int16)v24, v23, v10, a4, -[AGXTexture getBytesPerRow](self, "getBytesPerRow"), 0, 0, v25, 104);
          if (!v15)
            return v15;
          goto LABEL_19;
        }
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)AGXTexture;
    LODWORD(v19) = 104;
    v17 = -[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:](&v21, sel_initWithDevice_descriptor_sysMemSize_sysMemRowBytes_vidMemSize_vidMemRowBytes_args_argsSize_, a3, a4, -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes"), -[AGXTexture getBytesPerRow](self, "getBytesPerRow"), 0, 0, v25, v19);
    v15 = v17;
    if (v17)
    {
      if (-[AGXTexture isMemoryless](v17, "isMemoryless"))
      {
        -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:](v15, "updateBindDataWithAddresses:gpuVirtualAddress:", 0, 4008574976);
LABEL_20:
        -[AGXTexture finalizeTextureCreation](v15, "finalizeTextureCreation");
        return v15;
      }
LABEL_19:
      -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:](v15, "updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:", *(_QWORD *)&v15->super.super._anon_50[*MEMORY[0x24BE51650] + 48], *(_QWORD *)((char *)&v15->super.super._res.var0 + (int)*MEMORY[0x24BE51650]), *((unsigned __int8 *)&v15->super._allowGPUOptimizedContents + 1));
      goto LABEL_20;
    }
  }
  else
  {

    return 0;
  }
  return v15;
}

- (AGXTexture)initWithSparseHeap:(id)a3 desc:(id)a4 resource:(id)a5 sparsePagesAddress:(unint64_t)a6 sparsePageSize:(unint64_t)a7
{
  void *v11;
  size_t v12;
  uint64_t v13;
  void *v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  objc_super v21;
  uint64_t v22;
  int v23;
  _OWORD v24[6];
  uint64_t v25;

  v11 = (void *)objc_msgSend(a3, "device");
  if (!objc_msgSend(a4, "validateWithDevice:", v11))
    goto LABEL_6;
  LOWORD(v19) = 0;
  LOBYTE(v17) = 0;
  if (!-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", v11, a4, 0, 0, 0, 0, 0, v17, a7, v19))goto LABEL_6;
  v25 = 0;
  memset(v24, 0, sizeof(v24));
  -[AGXTexture initNewTextureData:](self, "initNewTextureData:", v24);
  v12 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes");
  if (v12 >= *MEMORY[0x24BDB03C8]
    || (v23 = 0,
        v22 = 0,
        (v13 = objc_msgSend(v11, "allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:", v12, *(_QWORD *)(objc_msgSend(a4, "descriptorPrivate") + 112) | 0x20000, 1024, (char *)&v23 + 2, &v23, &v22)) == 0))
  {
    v15 = (void *)objc_msgSend(a4, "copy");
    objc_msgSend(v15, "setResourceOptions:", objc_msgSend(v15, "resourceOptions") | 0x20000);
    v20.receiver = self;
    v20.super_class = (Class)AGXTexture;
    LODWORD(v18) = 104;
    self = -[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:](&v20, sel_initWithDevice_descriptor_sysMemSize_sysMemRowBytes_vidMemSize_vidMemRowBytes_args_argsSize_, v11, v15, v12, -[AGXTexture getBytesPerRow](self, "getBytesPerRow"), 0, 0, v24, v18);

    if (!self)
      goto LABEL_6;
LABEL_9:
    v16 = (void **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
    bzero(v16[16], v12);
    -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:](self, "updateBindDataWithAddresses:gpuVirtualAddress:", v16[16], v16[9]);
    -[AGXTexture setSparseHeap:](self, "setSparseHeap:", a3);
    -[AGXTexture finalizeTextureCreation](self, "finalizeTextureCreation");
    return self;
  }
  v21.receiver = self;
  v21.super_class = (Class)AGXTexture;
  self = -[IOGPUMetalTexture initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:descriptor:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:](&v21, sel_initWithPrimaryBuffer_heapIndex_bufferIndex_bufferOffset_length_descriptor_sysMemRowBytes_vidMemSize_vidMemRowBytes_args_argsSize_, v13, SHIWORD(v23), (__int16)v23, v22, v12, a4, -[AGXTexture getBytesPerRow](self, "getBytesPerRow"), 0, 0, v24, 104);
  if (self)
    goto LABEL_9;
LABEL_6:

  return 0;
}

- (AGXTexture)initWithHeap:(id)a3 desc:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = objc_msgSend(a3, "device");
  if (objc_msgSend(a3, "type"))
    goto LABEL_8;
  if (!objc_msgSend(a4, "validateWithDevice:", v7))
    goto LABEL_8;
  LOWORD(v13) = 256;
  LOBYTE(v12) = 0;
  if (!-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", v7, a4, 0, 0, 0, 0, 0, v12, 0, v13))goto LABEL_8;
  v8 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes");
  v9 = -[AGXTexture getAlignment](self, "getAlignment");
  if (-[AGXTexture isMemoryless](self, "isMemoryless"))
    return -[AGXTexture initWithImplHeapMemoryless:descriptor:length:](self, "initWithImplHeapMemoryless:descriptor:length:", a3, a4, v8);
  v14 = 0;
  v11 = objc_msgSend(a3, "newSubResourceWithLength:alignment:options:offset:", v8, v9, *(_QWORD *)(objc_msgSend(a4, "descriptorPrivate") + 112), &v14);
  if (v11)
    return -[AGXTexture initWithImplHeap:resource:descriptor:length:atOffset:](self, "initWithImplHeap:resource:descriptor:length:atOffset:", a3, v11, a4, v8, v14);
LABEL_8:

  return 0;
}

- (AGXTexture)initWithHeap:(id)a3 desc:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = objc_msgSend(a3, "device");
  if (objc_msgSend(a3, "type") != 1)
    goto LABEL_8;
  if (!objc_msgSend(a4, "validateWithDevice:", v9))
    goto LABEL_8;
  LOWORD(v15) = 256;
  LOBYTE(v14) = 0;
  if (!-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", v9, a4, 0, 0, 0, 0, 0, v14, 0, v15))goto LABEL_8;
  v10 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes");
  v11 = -[AGXTexture getAlignment](self, "getAlignment");
  if (-[AGXTexture isMemoryless](self, "isMemoryless"))
    return -[AGXTexture initWithImplHeapMemoryless:descriptor:length:](self, "initWithImplHeapMemoryless:descriptor:length:", a3, a4, v10);
  v13 = objc_msgSend(a3, "newSubResourceAtOffset:withLength:alignment:options:", a5, v10, v11, *(_QWORD *)(objc_msgSend(a4, "descriptorPrivate") + 112));
  if (v13)
    return -[AGXTexture initWithImplHeap:resource:descriptor:length:atOffset:](self, "initWithImplHeap:resource:descriptor:length:atOffset:", a3, v13, a4, v10, a5);
LABEL_8:

  return 0;
}

- (AGXTexture)initWithBuffer:(id)a3 desc:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6
{
  unint64_t v11;
  uint64_t v12;
  AGXTexture *v13;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  if (!objc_msgSend(a4, "validateWithDevice:", objc_msgSend(a3, "device"))
    || (LOWORD(v17) = 0,
        LOBYTE(v16) = 0,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", objc_msgSend(a3, "device"), a4, 0, 0, 0, a3, a6, v16, 0, v17))|| (v11 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes"), v12 = (int)*MEMORY[0x24BE51650], v11 + a5 > (*(_QWORD *)((_BYTE *)a3 + v12 + 40) & 0xFFFFFFFFFFFFFFuLL)))
  {

    return 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)AGXTexture;
  v13 = -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:](&v18, sel_initWithBuffer_descriptor_offset_bytesPerRow_, a3, a4, a5, a6);
  if (v13)
  {
    v15 = objc_msgSend(a3, "iosurface")
        ? (char *)IOSurfaceGetBaseAddressOfPlane((IOSurfaceRef)objc_msgSend(a3, "iosurface"), 0) + a5
        : *(char **)&v13->super.super._anon_50[v12 + 48];
    -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:](v13, "updateBindDataWithAddresses:gpuVirtualAddress:", v15, *(_QWORD *)((char *)&v13->super.super._res.var0 + v12));
    -[AGXTexture finalizeTextureCreation](v13, "finalizeTextureCreation");
    if (!-[AGXTexture validateBufferTextureWithSize:](v13, "validateBufferTextureWithSize:", (*(unint64_t *)((_BYTE *)&v13->super.super._res.vendor.reserved[1] + v12) & 0xFFFFFFFFFFFFFFLL) - a5))
    {

      return 0;
    }
  }
  return v13;
}

- (AGXTexture)initWithSharedTextureHandle:(__IOSurface *)a3 device:(id)a4 desc:(id)a5 compressionMode:(unint64_t)a6
{
  AGXTexture *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  _OWORD v16[6];
  uint64_t v17;

  objc_msgSend(a5, "setCompressionMode:", a6);
  if (objc_msgSend(a5, "validateWithDevice:", a4)
    && (LOWORD(v14) = 0,
        LOBYTE(v13) = 1,
        -[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a4, a5, 0, 0, 0, 0, 0, v13, 0, v14)))
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
    -[AGXTexture initNewTextureData:](self, "initNewTextureData:", v16);
    v15.receiver = self;
    v15.super_class = (Class)AGXTexture;
    LODWORD(v12) = 104;
    v10 = -[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:](&v15, sel_initWithDevice_descriptor_iosurface_plane_field_args_argsSize_, a4, a5, a3, 0, 0, v16, v12);
    if (v10)
    {
      -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:](v10, "updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:", IOSurfaceGetBaseAddressOfPlane(a3, 0), *(_QWORD *)((char *)&v10->super.super._res.var0 + (int)*MEMORY[0x24BE51650]), 0);
      -[AGXTexture finalizeTextureCreation](v10, "finalizeTextureCreation");
    }
  }
  else
  {

    return 0;
  }
  return v10;
}

- (AGXTexture)initWithDevice:(id)a3 desc:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7
{
  unsigned int CompressionTypeOfPlane;
  unsigned int v15;
  _BOOL8 v17;
  unint64_t SliceCount;
  size_t BytesPerRowOfPlane;
  AGXTexture *v20;
  uint64_t BaseAddressOfPlane;
  uint64_t BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  _OWORD v31[6];
  uint64_t v32;

  CompressionTypeOfPlane = IOSurfaceGetCompressionTypeOfPlane();
  if (CompressionTypeOfPlane > 4 || CompressionTypeOfPlane == 1)
    return 0;
  v15 = CompressionTypeOfPlane;
  v17 = CompressionTypeOfPlane == 4 || (CompressionTypeOfPlane & 0xFFFFFFFE) == 2;
  SliceCount = IOSurfaceGetSliceCount();
  BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(a5, a6);
  if (!objc_msgSend(a4, "validateWithDevice:", a3)
    || IOSurfaceIsTiled()
    || (LOWORD(v29) = v17,
        LOBYTE(v28) = 1,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a3, a4, a5, a6, a7, 0, BytesPerRowOfPlane, v28, 0, v29)))
  {

    return 0;
  }
  v32 = 0;
  memset(v31, 0, sizeof(v31));
  -[AGXTexture initNewTextureData:](self, "initNewTextureData:", v31);
  v30.receiver = self;
  v30.super_class = (Class)AGXTexture;
  LODWORD(v27) = 104;
  v20 = -[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:](&v30, sel_initWithDevice_descriptor_iosurface_plane_field_args_argsSize_, a3, a4, a5, a6, 0, v31, v27);
  if (v20)
  {
    if (SliceCount < 2)
    {
      BaseAddressOfPlane = (uint64_t)IOSurfaceGetBaseAddressOfPlane(a5, a6);
      v24 = (int)*MEMORY[0x24BE51650];
      v25 = *(_QWORD *)((char *)&v20->super.super._res.var0 + v24);
      BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane = v15 - 2 > 2
                                                             ? 0
                                                             : IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
    }
    else
    {
      BaseAddressOfPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane();
      v23 = BaseAddressOfPlane - IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      v24 = (int)*MEMORY[0x24BE51650];
      v25 = v23 + *(_QWORD *)((char *)&v20->super.super._res.var0 + v24);
    }
    -[AGXTexture updateBindDataWithAddresses:cpuMetadataAddress:gpuVirtualAddress:isCompressible:shouldInitMetadata:](v20, "updateBindDataWithAddresses:cpuMetadataAddress:gpuVirtualAddress:isCompressible:shouldInitMetadata:", BaseAddressOfPlane, BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane, v25, v17, 0);
    -[AGXTexture finalizeTextureCreation](v20, "finalizeTextureCreation");
    if (!-[AGXTexture validateBufferTextureWithSize:](v20, "validateBufferTextureWithSize:", *(unint64_t *)((_BYTE *)&v20->super.super._res.vendor.reserved[1] + v24) & 0xFFFFFFFFFFFFFFLL))
    {

      return 0;
    }
  }
  return v20;
}

- (AGXTexture)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 desc:(id)a6 deallocator:(id)a7
{
  AGXTexture *v13;
  AGXTexture *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  _OWORD v20[6];
  uint64_t v21;

  if (!objc_msgSend(a6, "validateWithDevice:")
    || (LOWORD(v18) = 0,
        LOBYTE(v16) = 1,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a3, a6, 0, 0, 0, 0, 0, v16, 0, v18)))
  {

    return 0;
  }
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  -[AGXTexture initNewTextureData:](self, "initNewTextureData:", v20);
  v19.receiver = self;
  v19.super_class = (Class)AGXTexture;
  LODWORD(v17) = 104;
  v13 = -[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:](&v19, sel_initWithDevice_descriptor_sysMemPointer_sysMemSize_sysMemLength_sysMemRowBytes_args_argsSize_deallocator_, a3, a6, a4, -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes"), a5, -[AGXTexture getBytesPerRow](self, "getBytesPerRow"), v20, v17, a7);
  v14 = v13;
  if (v13)
  {
    -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:](v13, "updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:", a4, *(_QWORD *)((char *)&v13->super.super._res.var0 + (int)*MEMORY[0x24BE51650]), 0);
    -[AGXTexture finalizeTextureCreation](v14, "finalizeTextureCreation");
    if (!-[AGXTexture validateBufferTextureWithSize:](v14, "validateBufferTextureWithSize:", a5))
    {

      return 0;
    }
  }
  return v14;
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  return -[AGXTexture initWithTexture:pixelFormat:resourceIndex:](self, "initWithTexture:pixelFormat:resourceIndex:", a3, a4, 0);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  return -[AGXTexture initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, 0);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  return -[AGXTexture initWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "initWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, *(unsigned int *)&a8, 0);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return -[AGXTexture initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", 0, *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE51658]) * *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE51680]), a5);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8
{
  NSUInteger length;
  NSUInteger location;
  AGXTexture *v14;
  AGXTexture *v15;
  objc_super v17;

  length = a6.length;
  location = a6.location;
  if (-[AGXTexture initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", a7.location, a7.length, a8))
  {
    v17.receiver = self;
    v17.super_class = (Class)AGXTexture;
    v14 = -[IOGPUMetalTexture initWithTexture:pixelFormat:textureType:levels:slices:](&v17, sel_initWithTexture_pixelFormat_textureType_levels_slices_, a3, a4, a5, location, length, a7.location, a7.length);
    v15 = v14;
    if (v14)
    {
      -[AGXTexture updateBindDataWithTexture:pixelFormat:textureType:levels:slices:](v14, "updateBindDataWithTexture:pixelFormat:textureType:levels:slices:", a3, a4, a5, location, length, a7.location, a7.length);
      -[AGXTexture finalizeTextureCreation](v15, "finalizeTextureCreation");
    }
  }
  else
  {

    return 0;
  }
  return v15;
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 resourceIndex:(unint64_t)a9
{
  NSUInteger length;
  NSUInteger location;
  AGXTexture *v15;
  AGXTexture *v16;
  objc_super v18;

  length = a6.length;
  location = a6.location;
  if (-[AGXTexture initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a7.location, a7.length, *(unsigned int *)&a8, a9))
  {
    v18.receiver = self;
    v18.super_class = (Class)AGXTexture;
    v15 = -[IOGPUMetalTexture initWithTexture:pixelFormat:textureType:levels:slices:swizzle:](&v18, sel_initWithTexture_pixelFormat_textureType_levels_slices_swizzle_, a3, a4, a5, location, length, a7.location, a7.length, *(unsigned int *)&a8);
    v16 = v15;
    if (v15)
    {
      -[AGXTexture updateBindDataWithTexture:pixelFormat:textureType:levels:slices:](v15, "updateBindDataWithTexture:pixelFormat:textureType:levels:slices:", a3, a4, a5, location, length, a7.location, a7.length);
      -[AGXTexture finalizeTextureCreation](v16, "finalizeTextureCreation");
    }
  }
  else
  {

    return 0;
  }
  return v16;
}

- (AGXTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  AGXTexture *v12;
  AGXTexture *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AGXTexture;
  v12 = -[IOGPUMetalTexture initWithCompressedTexture:pixelFormat:textureType:level:slice:](&v15, sel_initWithCompressedTexture_pixelFormat_textureType_level_slice_);
  v13 = v12;
  if (v12)
  {
    if (-[AGXTexture initImplWithCompressedTexture:pixelFormat:textureType:level:](v12, "initImplWithCompressedTexture:pixelFormat:textureType:level:", a3, a4, a5, a6)&& -[AGXTexture updateBindDataWithCompressedTexture:pixelFormat:textureType:level:slice:](v13, "updateBindDataWithCompressedTexture:pixelFormat:textureType:level:slice:", a3, a4, a5, a6, a7))
    {
      -[AGXTexture finalizeCompressedTextureViewCreation](v13, "finalizeCompressedTextureViewCreation");
    }
    else
    {

      return 0;
    }
  }
  return v13;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:", self, a3);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:", self, a3, a4, a5.location, a5.length, a6.location, a6.length);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:swizzle:", self, a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:resourceIndex:", self, a3, a4);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", self, a3, a4, a5.location, a5.length, a6.location, a6.length, a7);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", self, a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, a8);
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCompressedTexture:pixelFormat:textureType:level:slice:", self, a3, a4, a5, a6);
}

- (BOOL)updateBindDataWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  return 0;
}

- (BOOL)initImplWithDevice:(id)a3 Descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 buffer:(id)a8 bytesPerRow:(unint64_t)a9 allowNPOT:(BOOL)a10 sparsePageSize:(unint64_t)a11 isCompressedIOSurface:(BOOL)a12 isHeapBacked:(BOOL)a13
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  return 0;
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8
{
  return 0;
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 resourceIndex:(unint64_t)a7
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 resourceIndex:(unint64_t)a9
{
  return 0;
}

- (BOOL)canGenerateMipmapLevels
{
  return 0;
}

- (unint64_t)colorSpaceConversionMatrix
{
  return 0;
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return 0;
}

- (unint64_t)tailSize
{
  return 0;
}

- (unint64_t)tailSizeInBytes
{
  return 0;
}

- (unint64_t)firstMipmapInTail
{
  return 0;
}

- (BOOL)isSparse
{
  return 0;
}

- (BOOL)isMemoryless
{
  return 0;
}

- (BOOL)validateBufferTextureWithSize:(unint64_t)a3
{
  return 0;
}

- (id)backingResource
{
  id result;
  IOGPUMetalTexture *v4;

  result = *(id *)&self->_hasCPUMapping;
  if (!result)
  {
    if (-[IOGPUMetalTexture buffer](self, "buffer"))
    {
      result = -[IOGPUMetalTexture buffer](self, "buffer");
    }
    else
    {
      v4 = -[IOGPUMetalTexture parentTexture](self, "parentTexture");
      result = self;
      if (v4)
        result = (id)-[IOGPUMetalTexture backingResource](-[IOGPUMetalTexture parentTexture](self, "parentTexture"), "backingResource");
    }
    *(_QWORD *)&self->_hasCPUMapping = result;
  }
  return result;
}

- (unint64_t)getAlignment
{
  return (unint64_t)self->_backingResourceCached;
}

- (void)set_alignment:(unint64_t)a3
{
  self->_backingResourceCached = (IOGPUMetalResource *)a3;
}

- (unint64_t)getCPUSizeBytes
{
  return self->_alignment;
}

- (void)set_cpuSizeBytes:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)getBytesPerRow
{
  return self->_cpuSizeBytes;
}

- (void)set_bytesPerRow:(unint64_t)a3
{
  self->_cpuSizeBytes = a3;
}

- (AGXTexture)initWithImplHeapMemoryless:(id)a3 descriptor:(id)a4 length:(unint64_t)a5
{
  AGXTexture *v5;
  AGXTexture *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AGXTexture;
  v5 = -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:](&v8, sel_initWithHeap_resource_offset_length_device_descriptor_, a3, 0, 0, a5, objc_msgSend(a3, "device"), a4);
  v6 = v5;
  if (v5)
  {
    -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:](v5, "updateBindDataWithAddresses:gpuVirtualAddress:", 0, 4008574976);
    -[AGXTexture finalizeTextureCreation](v6, "finalizeTextureCreation");
  }
  *(_QWORD *)((char *)&v6->super.super.super.super.super._labelLock._os_unfair_lock_opaque + (int)*MEMORY[0x24BE51650]) = *(_QWORD *)((_BYTE *)&v6->super.super.super.super.super._labelLock._os_unfair_lock_opaque + (int)*MEMORY[0x24BE51650]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
  return v6;
}

- (AGXTexture)initWithImplHeap:(id)a3 resource:(id)a4 descriptor:(id)a5 length:(unint64_t)a6 atOffset:(unint64_t)a7
{
  AGXTexture *v7;
  AGXTexture *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AGXTexture;
  v7 = -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:](&v11, sel_initWithHeap_resource_offset_length_device_descriptor_, a3, a4, a7, a6, objc_msgSend(a3, "device"), a5);
  v8 = v7;
  v9 = (int)*MEMORY[0x24BE51650];
  if (v7)
  {
    -[AGXTexture updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:](v7, "updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:", *(_QWORD *)&v7->super.super._anon_50[v9 + 48], *(_QWORD *)((char *)&v7->super.super._res.var0 + v9), 0);
    -[AGXTexture finalizeTextureCreation](v8, "finalizeTextureCreation");
  }
  *(_QWORD *)((char *)&v8->super.super.super.super.super._labelLock._os_unfair_lock_opaque + v9) = *(_QWORD *)((_BYTE *)&v8->super.super.super.super.super._labelLock._os_unfair_lock_opaque + v9) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
  return v8;
}

@end
