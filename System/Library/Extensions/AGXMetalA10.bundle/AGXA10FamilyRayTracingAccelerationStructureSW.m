@implementation AGXA10FamilyRayTracingAccelerationStructureSW

- (unint64_t)accelerationStructureUniqueIdentifier
{
  AGXARayTracingAccelerationStructureSW *p_impl;
  os_unfair_lock_s *v3;
  unint64_t v4;

  p_impl = &self->_impl;
  v3 = (os_unfair_lock_s *)(self->_impl.bvh_heap_allocation.buffer_.address.cpu + 40);
  os_unfair_lock_lock(v3);
  v4 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)p_impl->bvh_heap_allocation.buffer_.address.cpu + 1)
                             + (int)*MEMORY[0x24BE51650]
                             + 24)
                 + 8 * LODWORD(p_impl->bvh_heap_allocation.buffer_.address.gpu));
  os_unfair_lock_unlock(v3);
  return v4;
}

- (AGXA10FamilyRayTracingAccelerationStructureSW)initWithBuffer:(id)a3 offset:(unint64_t)a4 device:(id)a5 resourceIndex:(unint64_t)a6
{
  unsigned int v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  id v15;
  AGXA10FamilyRayTracingAccelerationStructureSW *v16;
  unsigned int v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v27;
  objc_super v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v6 = a6;
  v11 = (int)*MEMORY[0x24BE51650];
  v12 = *(_QWORD *)((char *)a3 + v11 + 8);
  v13 = objc_msgSend(a3, "length");
  AGX::Mempool<16u,0u,true,unsigned long long>::Allocation::Allocation(&v29, (os_unfair_lock_s *)(*((_QWORD *)a5 + 101) + 5528), v6);
  v32 = v13;
  v14 = (os_unfair_lock_s *)(v30 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v30 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 8) + v11 + 24) + 8 * v29) = v12;
  os_unfair_lock_unlock(v14);
  v28.receiver = self;
  v28.super_class = (Class)AGXA10FamilyRayTracingAccelerationStructureSW;
  v15 = -[IOGPUMetalAccelerationStructure initWithBuffer:offset:resourceIndex:](&v28, sel_initWithBuffer_offset_resourceIndex_, a3, a4, v29);
  v16 = (AGXA10FamilyRayTracingAccelerationStructureSW *)v15;
  if (v15)
  {
    v17 = *((_DWORD *)v15 + 80);
    *((_DWORD *)v15 + 80) = v29;
    v29 = v17;
    v18 = *((_QWORD *)v15 + 41);
    *((_QWORD *)v15 + 41) = v30;
    v30 = v18;
    LOBYTE(v18) = *((_BYTE *)v15 + 336);
    *((_BYTE *)v15 + 336) = v31;
    v31 = v18;
    *((_QWORD *)v15 + 43) = v32;
  }
  if (v29 && !v31)
  {
    v19 = (os_unfair_lock_s *)(v30 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(v30 + 40));
    v20 = v30;
    v21 = v29;
    v22 = (unint64_t *)(v30 + 32);
    v23 = *(_QWORD *)(v30 + 32);
    v24 = 8 * v29;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 24) + 8) + v11 + 24) + v24) = v23;
    v25 = __ldaxr(v22);
    if (v25 != v23)
    {
      __clrex();
      while (1)
      {
LABEL_14:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v20 + 24) + 8) + v11 + 24) + v24) = v25;
        v27 = __ldaxr(v22);
        if (v27 == v25)
        {
          if (!__stlxr((v25 & 0xFFFFFFFF00000000 | v21) + 0x100000000, v22))
            goto LABEL_10;
        }
        else
        {
          __clrex();
        }
        v25 = v27;
      }
    }
    if (__stlxr((v23 & 0xFFFFFFFF00000000 | v21) + 0x100000000, v22))
      goto LABEL_14;
LABEL_10:
    os_unfair_lock_unlock(v19);
  }
  return v16;
}

- (AGXA10FamilyRayTracingAccelerationStructureSW)initWithBuffer:(id)a3 offset:(unint64_t)a4 device:(id)a5
{
  return -[AGXA10FamilyRayTracingAccelerationStructureSW initWithBuffer:offset:device:resourceIndex:](self, "initWithBuffer:offset:device:resourceIndex:", a3, a4, a5, 0);
}

- (AGXA10FamilyRayTracingAccelerationStructureSW)initWithDevice:(id)a3 src:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  id v14;
  AGXA10FamilyRayTracingAccelerationStructureSW *v15;
  unsigned int v16;
  uint64_t v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v26;
  objc_super v27;
  unsigned int v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v7 = objc_msgSend(a4, "buffer");
  v8 = objc_msgSend(a4, "bufferOffset");
  v9 = (int)*MEMORY[0x24BE51650];
  v10 = *(_QWORD *)(v7 + v9 + 8);
  v11 = (os_unfair_lock_s *)(*((_QWORD *)a3 + 101) + 5528);
  v12 = objc_msgSend(a4, "size");
  AGX::Mempool<16u,0u,true,unsigned long long>::Allocation::Allocation(&v28, v11, 0);
  v31 = v12;
  v13 = (os_unfair_lock_s *)(v29 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v29 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v29 + 8) + v9 + 24) + 8 * v28) = v10;
  os_unfair_lock_unlock(v13);
  v27.receiver = self;
  v27.super_class = (Class)AGXA10FamilyRayTracingAccelerationStructureSW;
  v14 = -[IOGPUMetalAccelerationStructure initWithBuffer:offset:resourceIndex:](&v27, sel_initWithBuffer_offset_resourceIndex_, v7, v8, v28);
  v15 = (AGXA10FamilyRayTracingAccelerationStructureSW *)v14;
  if (v14)
  {
    v16 = *((_DWORD *)v14 + 80);
    *((_DWORD *)v14 + 80) = v28;
    v28 = v16;
    v17 = *((_QWORD *)v14 + 41);
    *((_QWORD *)v14 + 41) = v29;
    v29 = v17;
    LOBYTE(v17) = *((_BYTE *)v14 + 336);
    *((_BYTE *)v14 + 336) = v30;
    v30 = v17;
    *((_QWORD *)v14 + 43) = v31;
  }
  if (v28 && !v30)
  {
    v18 = (os_unfair_lock_s *)(v29 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(v29 + 40));
    v19 = v29;
    v20 = v28;
    v21 = (unint64_t *)(v29 + 32);
    v22 = *(_QWORD *)(v29 + 32);
    v23 = 8 * v28;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v29 + 24) + 8) + v9 + 24) + v23) = v22;
    v24 = __ldaxr(v21);
    if (v24 != v22)
    {
      __clrex();
      while (1)
      {
LABEL_14:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v19 + 24) + 8) + v9 + 24) + v23) = v24;
        v26 = __ldaxr(v21);
        if (v26 == v24)
        {
          if (!__stlxr((v24 & 0xFFFFFFFF00000000 | v20) + 0x100000000, v21))
            goto LABEL_10;
        }
        else
        {
          __clrex();
        }
        v24 = v26;
      }
    }
    if (__stlxr((v22 & 0xFFFFFFFF00000000 | v20) + 0x100000000, v21))
      goto LABEL_14;
LABEL_10:
    os_unfair_lock_unlock(v18);
  }
  return v15;
}

- (AGXA10FamilyRayTracingAccelerationStructureSW)initWithDevice:(id)a3 length:(unint64_t)a4 resourceIndex:(unint64_t)a5 storageMode:(unint64_t)a6
{
  AGXA10FamilyRayTracingAccelerationStructureSW *result;
  AGXA10FamilyRayTracingAccelerationStructureSW *v10;
  AGXA10FamilyRayTracingAccelerationStructureSW *v11;

  result = (AGXA10FamilyRayTracingAccelerationStructureSW *)objc_msgSend(a3, "newBufferWithLength:options:", a4, 16 * a6);
  if (result)
  {
    v10 = result;
    v11 = -[AGXA10FamilyRayTracingAccelerationStructureSW initWithBuffer:offset:device:resourceIndex:](self, "initWithBuffer:offset:device:resourceIndex:", result, 0, a3, a5);

    return v11;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXA10FamilyRayTracingAccelerationStructureSW;
  -[IOGPUMetalAccelerationStructure dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  AGXARayTracingAccelerationStructureSW *p_impl;
  os_unfair_lock_s *v3;
  char *cpu;
  uint64_t gpu_low;
  unint64_t *v6;
  uint64_t v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;

  p_impl = &self->_impl;
  if (LODWORD(self->_impl.bvh_heap_allocation.buffer_.address.gpu)
    && !LOBYTE(self->_impl.bvh_heap_allocation.buffer_.size))
  {
    v3 = (os_unfair_lock_s *)(self->_impl.bvh_heap_allocation.buffer_.address.cpu + 40);
    os_unfair_lock_lock(v3);
    cpu = p_impl->bvh_heap_allocation.buffer_.address.cpu;
    gpu_low = LODWORD(p_impl->bvh_heap_allocation.buffer_.address.gpu);
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
  *((_DWORD *)self + 80) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_BYTE *)self + 336) = 0;
  return self;
}

@end
