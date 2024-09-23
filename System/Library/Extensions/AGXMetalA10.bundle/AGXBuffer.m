@implementation AGXBuffer

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXBuffer;
  -[IOGPUMetalBuffer dealloc](&v2, sel_dealloc);
}

- (id)initInternalBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  _BYTE v6[88];
  uint64_t v7;

  v7 = 0x400000000;
  return -[AGXBuffer initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, a5, 1, v6, 0);
}

- (id)initUntrackedInternalBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  _BYTE v6[88];
  uint64_t v7;

  v7 = 0xC00000000;
  return -[AGXBuffer initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, a5, 0, v6, 0);
}

- (id)initCounterSampleBufferWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  _BYTE v6[88];
  uint64_t v7;

  v7 = 0x1000000000;
  return -[AGXBuffer initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, a5, 1, v6, 0);
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 pinnedGPULocation:(const GPUResourcePinningLocation *)a7
{
  _BYTE v8[88];
  uint64_t v9;

  v9 = 0;
  return -[AGXBuffer initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, a5, a6, v8, a7);
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7 pinnedGPULocation:(const GPUResourcePinningLocation *)a8
{
  _BYTE v9[88];
  uint64_t v10;

  v10 = 0;
  return -[AGXBuffer initWithDevice:length:alignment:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:alignment:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, *(_QWORD *)&a5, a6, a7, v9, a8);
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 isSuballocDisabled:(BOOL)a8 pinnedGPULocation:(const GPUResourcePinningLocation *)a9
{
  _BYTE v10[88];
  uint64_t v11;

  v11 = 0;
  return -[AGXBuffer initWithDevice:length:alignment:pointerTag:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:alignment:pointerTag:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, v10, a9);
}

- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 deallocator:(id)a7 pinnedGPUAddress:(unint64_t)a8
{
  return -[AGXBuffer initWithDevice:bytes:length:alignment:options:deallocator:pinnedGPUAddress:](self, "initWithDevice:bytes:length:alignment:options:deallocator:pinnedGPUAddress:", a3, a4, a5, 1, a6, a7, a8);
}

- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 deallocator:(id)a8 pinnedGPUAddress:(unint64_t)a9
{
  return -[AGXBuffer initWithDevice:bytes:length:alignment:pointerTag:options:deallocator:pinnedGPUAddress:](self, "initWithDevice:bytes:length:alignment:pointerTag:options:deallocator:pinnedGPUAddress:", a3, a4, a5, *(_QWORD *)&a6, 0, a7, a8, a9);
}

- (AGXBuffer)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 pointerTag:(unint64_t)a7 options:(unint64_t)a8 deallocator:(id)a9 pinnedGPUAddress:(unint64_t)a10
{
  AGXBuffer *v10;
  AGXBuffer *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  objc_super v18;
  _BYTE v19[88];
  uint64_t v20;

  v20 = 0;
  v18.receiver = self;
  v18.super_class = (Class)AGXBuffer;
  v17 = 104;
  v10 = -[IOGPUMetalBuffer initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:](&v18, sel_initWithDevice_pointer_length_alignment_options_sysMemSize_gpuAddress_gpuTag_args_argsSize_deallocator_, a3, a4, a5, *(_QWORD *)&a6, a8, a5, a10, a7, v19, v17, a9);
  v11 = v10;
  if (v10)
  {
    v12 = (Class *)((char *)&v10->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
    v13 = v12[9];
    v14 = v12[16];
    v15 = v12[2] & 0x1F00000000000000 | -[IOGPUMetalBuffer length](v10, "length") & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v12[1] = v13;
    v12[2] = v15;
    v12[3] = v14;
  }
  return v11;
}

- (AGXBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 pinnedGPUAddress:(unint64_t)a5
{
  AGXBuffer *v5;
  AGXBuffer *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  _BYTE v13[88];
  uint64_t v14;

  v14 = 0;
  v12.receiver = self;
  v12.super_class = (Class)AGXBuffer;
  v5 = -[IOGPUMetalBuffer initWithDevice:iosurface:gpuAddress:args:argsSize:](&v12, sel_initWithDevice_iosurface_gpuAddress_args_argsSize_, a3, a4, a5, v13, 104);
  v6 = v5;
  if (v5)
  {
    v7 = (Class *)((char *)&v5->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
    v8 = v7[9];
    v9 = v7[16];
    v10 = v7[2] & 0x1F00000000000000 | -[IOGPUMetalBuffer length](v5, "length") & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v7[1] = v8;
    v7[2] = v10;
    v7[3] = v9;
  }
  return v6;
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  return -[AGXBuffer initWithHeap:length:alignment:options:](self, "initWithHeap:length:alignment:options:", a3, a4, 1, a5);
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6
{
  return -[AGXBuffer initWithHeap:length:alignment:pointerTag:options:](self, "initWithHeap:length:alignment:pointerTag:options:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  if (!objc_msgSend(a3, "type"))
  {
    v13 = a5 <= 0x100 ? 256 : a5;
    v16 = 0;
    v14 = objc_msgSend(a3, "newSubResourceWithLength:alignment:options:offset:", a4, v13, a7, &v16);
    if (v14)
      return (AGXBuffer *)-[AGXBuffer initImplWithHeap:resource:length:pointerTag:atOffset:](self, "initImplWithHeap:resource:length:pointerTag:atOffset:", a3, v14, a4, a6, v16);
  }

  return 0;
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 atOffset:(unint64_t)a6
{
  return -[AGXBuffer initWithHeap:length:alignment:options:atOffset:](self, "initWithHeap:length:alignment:options:atOffset:", a3, a4, 1, a5, a6);
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 atOffset:(unint64_t)a7
{
  return -[AGXBuffer initWithHeap:length:alignment:pointerTag:options:atOffset:](self, "initWithHeap:length:alignment:pointerTag:options:atOffset:", a3, a4, *(_QWORD *)&a5, 0, a6, a7);
}

- (AGXBuffer)initWithHeap:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 atOffset:(unint64_t)a8
{
  uint64_t v14;
  uint64_t v15;

  if (objc_msgSend(a3, "type") == 1)
  {
    v14 = a5 <= 0x100 ? 256 : a5;
    v15 = objc_msgSend(a3, "newSubResourceAtOffset:withLength:alignment:options:", a8, a4, v14, a7);
    if (v15)
      return (AGXBuffer *)-[AGXBuffer initImplWithHeap:resource:length:atOffset:](self, "initImplWithHeap:resource:length:atOffset:", a3, v15, a4, a8);
  }

  return 0;
}

- (AGXBuffer)initWithDevice:(id)a3 addressRanges:(MTLAddressRange *)a4 addressRangeCount:(unint64_t)a5 length:(unint64_t)a6 alignment:(unsigned int)a7 options:(unint64_t)a8 pinnedGPUAddress:(unint64_t)a9
{
  AGXBuffer *v9;
  AGXBuffer *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  objc_super v17;
  _BYTE v18[88];
  uint64_t v19;

  v19 = 0;
  v17.receiver = self;
  v17.super_class = (Class)AGXBuffer;
  v16 = 104;
  v9 = -[IOGPUMetalBuffer initWithDevice:addressRanges:addressRangeCount:length:options:gpuAddress:args:argsSize:](&v17, sel_initWithDevice_addressRanges_addressRangeCount_length_options_gpuAddress_args_argsSize_, a3, a4, a5, a6, a8, a9, v18, v16);
  v10 = v9;
  if (v9)
  {
    v11 = (Class *)((char *)&v9->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
    v12 = v11[9];
    v13 = v11[16];
    v14 = v11[2] & 0x1F00000000000000 | -[IOGPUMetalBuffer length](v9, "length") & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v11[1] = v12;
    v11[2] = v14;
    v11[3] = v13;
  }
  return v10;
}

- (unint64_t)parentGPUAddress
{
  unint64_t result;

  result = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51618]);
  if (result)
    return objc_msgSend((id)result, "gpuAddress");
  return result;
}

- (unint64_t)parentGPUSize
{
  unint64_t result;

  result = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51618]);
  if (result)
    return objc_msgSend((id)result, "length");
  return result;
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceInArgs:(AGXNewTextureDataStruc *)a7 pinnedGPULocation:(const GPUResourcePinningLocation *)a8
{
  return -[AGXBuffer initWithDevice:length:alignment:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:alignment:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, 1, a5, a6, a7, a8);
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7 resourceInArgs:(AGXNewTextureDataStruc *)a8 pinnedGPULocation:(const GPUResourcePinningLocation *)a9
{
  return -[AGXBuffer initWithDevice:length:alignment:pointerTag:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:](self, "initWithDevice:length:alignment:pointerTag:options:isSuballocDisabled:resourceInArgs:pinnedGPULocation:", a3, a4, *(_QWORD *)&a5, 0, a6, a7, a8, a9);
}

- (AGXBuffer)initWithDevice:(id)a3 length:(unint64_t)a4 alignment:(unsigned int)a5 pointerTag:(unint64_t)a6 options:(unint64_t)a7 isSuballocDisabled:(BOOL)a8 resourceInArgs:(AGXNewTextureDataStruc *)a9 pinnedGPULocation:(const GPUResourcePinningLocation *)a10
{
  unint64_t v11;
  AGXBuffer *v12;
  uint64_t v17;
  unint64_t var1;
  unint64_t var2;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t var0;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;

  v11 = (a4 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
  if (v11 < a4)
    goto LABEL_2;
  if (a5 <= 1)
    v17 = 1;
  else
    v17 = a5;
  if (!a10)
  {
    var0 = 0;
    if (*MEMORY[0x24BDB03C8] > a4 && !a8)
    {
      v34 = 0;
      v33 = 0;
      if (a5 <= 0x100)
        *(_QWORD *)&a5 = 256;
      else
        v29 = a5;
      if ((a7 & 0xF0) == 0x20)
        v30 = a7 | 0x20000;
      else
        v30 = a7;
      v22 = objc_msgSend(a3, "allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:parentAddress:parentLength:", a4, v30, *(_QWORD *)&a5, (char *)&v34 + 2, &v34, &v33, 0, 0);
      if (v22)
        goto LABEL_30;
      var0 = 0;
    }
LABEL_18:
    LODWORD(v32) = 104;
    v12 = -[IOGPUMetalBuffer initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:](self, "initWithDevice:pointer:length:alignment:options:sysMemSize:gpuAddress:gpuTag:args:argsSize:deallocator:", a3, 0, a4, v17, a7, v11, var0, a6, a9, v32, 0);
    if (!v12)
      return v12;
LABEL_19:
    v24 = (Class *)((char *)&v12->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
    v25 = v24[9];
    v26 = v24[16];
    v27 = v24[2] & 0x1F00000000000000 | -[IOGPUMetalBuffer length](v12, "length") & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v24[1] = v25;
    v24[2] = v27;
    v24[3] = v26;
    return v12;
  }
  var1 = a10->var1;
  if (!var1)
  {
LABEL_17:
    var0 = a10->var0;
    goto LABEL_18;
  }
  v34 = 0;
  if (a10->var0 >= var1)
  {
    var2 = a10->var2;
    if (a10->var0 + a4 <= var2 + var1)
    {
      v33 = a10->var0 - var1;
      if (a5 <= 0x100)
        *(_QWORD *)&a5 = 256;
      else
        v20 = a5;
      if ((a7 & 0xF0) == 0x20)
        v21 = a7 | 0x20000;
      else
        v21 = a7;
      v22 = objc_msgSend(a3, "allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:parentAddress:parentLength:", a4, v21, *(_QWORD *)&a5, (char *)&v34 + 2, &v34, &v33, var1, var2);
      if (!v22)
        goto LABEL_17;
LABEL_30:
      LODWORD(v31) = 104;
      v12 = -[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:](self, "initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:", v22, SHIWORD(v34), (__int16)v34, v33, a4, a9, v31, a6);
      if (!v12)
        return v12;
      goto LABEL_19;
    }
  }
LABEL_2:

  return 0;
}

- (id)initImplWithHeap:(id)a3 resource:(id)a4 length:(unint64_t)a5 atOffset:(unint64_t)a6
{
  return -[AGXBuffer initImplWithHeap:resource:length:pointerTag:atOffset:](self, "initImplWithHeap:resource:length:pointerTag:atOffset:", a3, a4, a5, 0, a6);
}

- (id)initImplWithHeap:(id)a3 resource:(id)a4 length:(unint64_t)a5 pointerTag:(unint64_t)a6 atOffset:(unint64_t)a7
{
  AGXBuffer *v7;
  AGXBuffer *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AGXBuffer;
  v7 = -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:](&v14, sel_initWithHeap_resource_offset_length_gpuTag_, a3, a4, a7, a5, a6);
  v8 = v7;
  if (v7)
  {
    v9 = (Class *)((char *)&v7->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
    v10 = v9[9];
    v11 = v9[16];
    v12 = v9[2] & 0x1F00000000000000 | -[IOGPUMetalBuffer length](v7, "length") & 0xFFFFFFFFFFFFFFLL | 0x2000000000000000;
    v9[1] = v10;
    v9[2] = v12;
    v9[3] = v11;
  }
  return v8;
}

@end
