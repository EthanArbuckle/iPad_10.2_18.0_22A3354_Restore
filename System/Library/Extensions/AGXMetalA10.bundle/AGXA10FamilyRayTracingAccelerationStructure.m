@implementation AGXA10FamilyRayTracingAccelerationStructure

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return self->_impl.buffer.address.gpu;
}

- (AGXA10FamilyRayTracingAccelerationStructure)initWithDevice:(id)a3 length:(unint64_t)a4
{
  return -[AGXA10FamilyRayTracingAccelerationStructure initWithDevice:length:resourceIndex:storageMode:](self, "initWithDevice:length:resourceIndex:storageMode:", a3, a4, 0, 2);
}

- (AGXA10FamilyRayTracingAccelerationStructure)initWithDevice:(id)a3 length:(unint64_t)a4 resourceIndex:(unint64_t)a5 storageMode:(unint64_t)a6
{
  void *v11;
  void *v12;
  AGXA10FamilyRayTracingAccelerationStructure *v13;

  v11 = (void *)objc_msgSend((id)objc_opt_new(), "init");
  objc_msgSend(v11, "setResourceOptions:", 16 * a6);
  objc_msgSend(v11, "setLength:", a4);
  objc_msgSend(v11, "setAlignment:", 256);
  v12 = (void *)objc_msgSend(a3, "newBufferWithDescriptor:", v11);

  if (!v12)
    return 0;
  v13 = -[AGXA10FamilyRayTracingAccelerationStructure initWithBuffer:device:length:resourceIndex:](self, "initWithBuffer:device:length:resourceIndex:", v12, a3, a4, a5);

  return v13;
}

- (AGXA10FamilyRayTracingAccelerationStructure)initWithBuffer:(id)a3 device:(id)a4 length:(unint64_t)a5 resourceIndex:(unint64_t)a6
{
  uint64_t v8;
  char *v9;
  os_unfair_lock_s *v10;
  AGXA10FamilyRayTracingAccelerationStructure *v11;
  AGXA10FamilyRayTracingAccelerationStructure *v12;
  unint64_t size;
  AddressView<unsigned char> address;
  unint64_t v15;
  char *cpu;
  int size_low;
  os_unfair_lock_s *v18;
  char *v19;
  uint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v26;
  objc_super v27;
  AddressView<unsigned char> v28;
  unint64_t v29;
  unsigned int v30;
  char *v31;
  unsigned __int8 v32;

  v29 = a5;
  v8 = (int)*MEMORY[0x24BE51650];
  v9 = *(char **)((char *)a3 + v8 + 24);
  v28.gpu = *(_QWORD *)((char *)a3 + v8 + 8);
  v28.cpu = v9;
  AGX::Mempool<16u,0u,true,unsigned long long>::Allocation::Allocation(&v30, (os_unfair_lock_s *)(*((_QWORD *)a4 + 101) + 5528), a6);
  v10 = (os_unfair_lock_s *)(v31 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)v31 + 10);
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v31 + 1) + v8 + 24) + 8 * v30) = v28.gpu;
  os_unfair_lock_unlock(v10);
  v27.receiver = self;
  v27.super_class = (Class)AGXA10FamilyRayTracingAccelerationStructure;
  v11 = -[IOGPUMetalAccelerationStructure initWithBuffer:offset:resourceIndex:](&v27, sel_initWithBuffer_offset_resourceIndex_, a3, 0, v30);
  v12 = v11;
  if (v11)
  {
    size = v11->_impl.buffer.size;
    address = v11->_impl.buffer.address;
    v15 = v29;
    v11->_impl.buffer.address = v28;
    v11->_impl.buffer.size = v15;
    v28 = address;
    v29 = size;
    LODWORD(size) = v11->_impl.bvh_state_heap_allocation.buffer_.address.gpu;
    LODWORD(v11->_impl.bvh_state_heap_allocation.buffer_.address.gpu) = 0;
    cpu = v11->_impl.bvh_state_heap_allocation.buffer_.address.cpu;
    v11->_impl.bvh_state_heap_allocation.buffer_.address.cpu = 0;
    size_low = LOBYTE(v11->_impl.bvh_state_heap_allocation.buffer_.size);
    LOBYTE(v11->_impl.bvh_state_heap_allocation.buffer_.size) = 0;
    LODWORD(v11->_impl.bvh_state_heap_allocation.buffer_.address.gpu) = v30;
    v11->_impl.bvh_state_heap_allocation.buffer_.address.cpu = v31;
    LOBYTE(v11->_impl.bvh_state_heap_allocation.buffer_.size) = v32;
    v30 = size;
    v31 = cpu;
    v32 = size_low;
    if (!(_DWORD)size)
      return v12;
  }
  else
  {
    size_low = v32;
    if (!v30)
      return v12;
  }
  if (!size_low)
  {
    v18 = (os_unfair_lock_s *)(v31 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)v31 + 10);
    v19 = v31;
    v20 = v30;
    v21 = (unint64_t *)(v31 + 32);
    v22 = *((_QWORD *)v31 + 4);
    v23 = 8 * v30;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v31 + 3) + 8) + v8 + 24) + v23) = v22;
    v24 = __ldaxr(v21);
    if (v24 != v22)
    {
      __clrex();
      while (1)
      {
LABEL_15:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v19 + 3) + 8) + v8 + 24) + v23) = v24;
        v26 = __ldaxr(v21);
        if (v26 == v24)
        {
          if (!__stlxr((v24 & 0xFFFFFFFF00000000 | v20) + 0x100000000, v21))
            goto LABEL_11;
        }
        else
        {
          __clrex();
        }
        v24 = v26;
      }
    }
    if (__stlxr((v22 & 0xFFFFFFFF00000000 | v20) + 0x100000000, v21))
      goto LABEL_15;
LABEL_11:
    os_unfair_lock_unlock(v18);
  }
  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXA10FamilyRayTracingAccelerationStructure;
  -[IOGPUMetalAccelerationStructure dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  RayTracingAccelerationStructure *p_impl;
  os_unfair_lock_s *v3;
  char *cpu;
  uint64_t gpu_low;
  unint64_t *v6;
  uint64_t v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;

  p_impl = &self->_impl;
  if (LODWORD(self->_impl.bvh_state_heap_allocation.buffer_.address.gpu)
    && !LOBYTE(self->_impl.bvh_state_heap_allocation.buffer_.size))
  {
    v3 = (os_unfair_lock_s *)(self->_impl.bvh_state_heap_allocation.buffer_.address.cpu + 40);
    os_unfair_lock_lock(v3);
    cpu = p_impl->bvh_state_heap_allocation.buffer_.address.cpu;
    gpu_low = LODWORD(p_impl->bvh_state_heap_allocation.buffer_.address.gpu);
    v6 = (unint64_t *)(cpu + 32);
    v7 = *((_QWORD *)cpu + 4);
    v8 = (int *)MEMORY[0x24BE51650];
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)cpu + 3) + 8) + (int)*MEMORY[0x24BE51650] + 24) + 8 * gpu_low) = v7;
    v9 = __ldaxr((unint64_t *)cpu + 4);
    if (v9 != v7)
    {
      __clrex();
      while (1)
      {
LABEL_12:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)cpu + 3) + 8) + *v8 + 24) + 8 * gpu_low) = v9;
        v10 = __ldaxr(v6);
        if (v10 == v9)
        {
          if (!__stlxr((v9 & 0xFFFFFFFF00000000 | gpu_low) + 0x100000000, v6))
            goto LABEL_9;
        }
        else
        {
          __clrex();
        }
        v9 = v10;
      }
    }
    if (__stlxr((v7 & 0xFFFFFFFF00000000 | gpu_low) + 0x100000000, v6))
      goto LABEL_12;
LABEL_9:
    os_unfair_lock_unlock(v3);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 44) = 0;
  *((_BYTE *)self + 360) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 40) = 0;
  *((_DWORD *)self + 86) = 0;
  return self;
}

@end
