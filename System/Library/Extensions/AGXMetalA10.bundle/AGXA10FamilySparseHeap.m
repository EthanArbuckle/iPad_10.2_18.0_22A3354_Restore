@implementation AGXA10FamilySparseHeap

- (MTLDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  __end_ **begin;
  __end_cap_ **var0;
  objc_super v5;

  begin = self->_resources.__begin_;
  var0 = self->_resources.var0;
  while (begin != var0)
  {
    ++begin;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }

  self->_sparse_pages_buffer = 0;
  self->_sparse_queue_buffer = 0;
  self->_device = 0;
  self->sparse_page_queue_addr = 0;
  self->sparse_page_size = 0;
  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilySparseHeap;
  -[_MTLObjectWithLabel dealloc](&v5, sel_dealloc);
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)usedSize
{
  char *v2;
  _DWORD *v3;
  unsigned int v4;
  unsigned int v5;

  v2 = (char *)self->_sparse_queue_buffer + (int)*MEMORY[0x24BE51650];
  v3 = (_DWORD *)(*((_QWORD *)v2 + 3) + self->sparse_page_queue_addr - *((_QWORD *)v2 + 1));
  v4 = v3[1];
  v5 = v4 - *v3;
  if (v4 < *v3)
    v5 += v3[2];
  return self->_size - self->sparse_page_size * (unint64_t)v5;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  return self->_size;
}

- (IOGPUMetalResource)sparsePagesResource
{
  return (IOGPUMetalResource *)self->_sparse_pages_buffer;
}

- (IOGPUMetalResource)sparseQueueResource
{
  return (IOGPUMetalResource *)self->_sparse_queue_buffer;
}

- (unint64_t)sparsePageQueueAddress
{
  return self->sparse_page_queue_addr;
}

- (AGXA10FamilySparseHeap)initWithDevice:(id)a3 descriptor:(id)a4
{
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t sparse_page_size;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  _BOOL8 v15;
  unint64_t v16;
  AGXA10FamilyBuffer *v17;
  MTLBuffer *sparse_pages_buffer;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  unint64_t v27;
  unsigned int *p_sparse_page_size;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  unint64_t v32;
  uint64x2_t v33;
  int32x4_t v34;
  int32x4_t *v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  unint64_t v39;
  uint32x4_t v40;
  uint32x4_t v41;
  unint64_t v43;
  vector<IOGPUMetalResource *, std::allocator<IOGPUMetalResource *>> *p_resources;
  MTLBuffer *v45;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v48;
  __end_ **begin;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _BYTE *v55;
  MTLBuffer **v56;
  id *v57;
  unint64_t v58;
  uint64_t v59;
  _OWORD *v60;
  __end_cap_ **v61;
  uint64_t v62;
  __int128 v63;
  MTLBuffer *v64;
  MTLBuffer *sparse_queue_buffer;
  id *v66;
  __end_ **v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _BYTE *v73;
  MTLBuffer **v74;
  id *v75;
  __end_cap_ **v76;
  unint64_t v77;
  __end_cap_ **v78;
  MTLBuffer *v79;
  uint64_t v80;
  _OWORD *v81;
  __end_cap_ **v82;
  uint64_t v83;
  __int128 v84;
  int v85;
  uint64_t v86;
  objc_super v87;

  if (objc_msgSend(a4, "validateWithDevice:"))
  {
    v7 = (_QWORD *)objc_msgSend(a4, "descriptorPrivate");
    v8 = v7[3];
    if (v8 == 102)
      v9 = 0x10000;
    else
      v9 = 0x4000;
    if (v8 == 103)
      v9 = 0x40000;
    self->sparse_page_size = v9;
    v10 = v8 == 103 ? 0x40000 : (v8 == 102) << 16;
    self->sparse_page_queue_alignment_padding = v10;
    sparse_page_size = self->sparse_page_size;
    v12 = (sparse_page_size - 1 + *v7) & -(uint64_t)sparse_page_size;
    v13 = (v12 + sparse_page_size - 1) / sparse_page_size;
    if (v13 <= 0x80000000)
    {
      v14 = __clz(v13);
      v85 = -v14;
      v86 = (((4 << -(char)v14) + 12) + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8];
      v15 = v7[2] != 0;
      v16 = v15 & 0xFFFFFFFFFFFFFCFFLL | ((objc_msgSend(a4, "hazardTrackingMode") & 3) << 8);
      v87.receiver = self;
      v87.super_class = (Class)AGXA10FamilySparseHeap;
      self = -[_MTLHeap initWithType:options:](&v87, sel_initWithType_options_, objc_msgSend(a4, "type"), v16 | 0x20);
      self->_sparse_pages_buffer = (MTLBuffer *)-[AGXBuffer initWithDevice:length:options:isSuballocDisabled:pinnedGPULocation:]([AGXA10FamilyBuffer alloc], "initWithDevice:length:options:isSuballocDisabled:pinnedGPULocation:", a3, v12 + self->sparse_page_queue_alignment_padding, v16 | 0x20, 0, 0);
      v17 = -[AGXBuffer initWithDevice:length:options:isSuballocDisabled:pinnedGPULocation:]([AGXA10FamilyBuffer alloc], "initWithDevice:length:options:isSuballocDisabled:pinnedGPULocation:", a3, v86, v16 | 0x20020, 0, 0);
      self->_sparse_queue_buffer = (MTLBuffer *)v17;
      sparse_pages_buffer = self->_sparse_pages_buffer;
      if (sparse_pages_buffer)
      {
        if (v17)
        {
          v19 = (int *)MEMORY[0x24BE51650];
          v20 = (int)*MEMORY[0x24BE51650];
          v21 = *(_QWORD *)((char *)sparse_pages_buffer + v20 + 8);
          v22 = *(unint64_t *)((char *)&v17->super.super.super.super.super.super._label + v20);
          self->sparse_page_queue_addr = v22;
          v23 = (char *)self->_sparse_queue_buffer + *v19;
          v24 = *((_QWORD *)v23 + 3);
          v25 = *((_QWORD *)v23 + 1);
          v26 = (_DWORD *)(v24 + v22 - v25);
          *v26 = 0;
          v26[2] = 1 << (v85 & 0x1F);
          if (!(_DWORD)v13)
            goto LABEL_29;
          v27 = (v21 + (sparse_page_size - 1)) & ~(unint64_t)(sparse_page_size - 1);
          p_sparse_page_size = &self->sparse_page_size;
          if (v13 > 0xB
            && ((v29 = v22 - v25 + v24,
                 v30 = v22 + 4 * v13 - v25 + v24 + 12,
                 v29 + 12 < (unint64_t)&self->sparse_page_queue_alignment_padding)
              ? (v31 = (unint64_t)p_sparse_page_size >= v30)
              : (v31 = 1),
                v31))
          {
            v32 = ((v12 + sparse_page_size - 1) / sparse_page_size) & 0xFFFFFFF8;
            v33 = (uint64x2_t)vdupq_n_s64(v27);
            v34 = (int32x4_t)vld1q_dup_f32((const float *)p_sparse_page_size);
            v35 = (int32x4_t *)(v29 + 28);
            v36 = (int32x4_t)xmmword_232D73750;
            v37.i64[0] = 0x400000004;
            v37.i64[1] = 0x400000004;
            v38.i64[0] = 0x800000008;
            v38.i64[1] = 0x800000008;
            v39 = v13 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v40 = (uint32x4_t)vmulq_s32(v34, v36);
              v41 = (uint32x4_t)vmulq_s32(v34, vaddq_s32(v36, v37));
              v35[-1] = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)vaddw_u32(v33, *(uint32x2_t *)v40.i8), 0xEuLL), (int64x2_t)vaddw_high_u32(v33, v40), 0xEuLL);
              *v35 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)vaddw_u32(v33, *(uint32x2_t *)v41.i8), 0xEuLL), (int64x2_t)vaddw_high_u32(v33, v41), 0xEuLL);
              v36 = vaddq_s32(v36, v38);
              v35 += 2;
              v39 -= 8;
            }
            while (v39);
            if (v13 == v32)
            {
LABEL_29:
              v26[1] = v13;
              self->_size = v12;
              self->_device = (MTLDevice *)a3;
              p_resources = &self->_resources;
              v45 = self->_sparse_pages_buffer;
              var0 = self->_resources.var0;
              value = self->_resources.var1.__value_;
              if (var0 >= (__end_cap_ **)value)
              {
                begin = p_resources->__begin_;
                v50 = (char *)var0 - (char *)p_resources->__begin_;
                v51 = v50 >> 3;
                v52 = (v50 >> 3) + 1;
                if (v52 >> 61)
                  goto LABEL_80;
                v53 = (char *)value - (char *)begin;
                if (v53 >> 2 > v52)
                  v52 = v53 >> 2;
                if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
                  v54 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v54 = v52;
                if (v54)
                {
                  if (v54 >> 61)
                    goto LABEL_81;
                  v55 = operator new(8 * v54);
                }
                else
                {
                  v55 = 0;
                }
                v56 = (MTLBuffer **)&v55[8 * v51];
                v57 = (id *)&v55[8 * v54];
                *v56 = v45;
                v48 = v56 + 1;
                if (var0 != begin)
                {
                  v58 = (char *)var0 - (char *)begin - 8;
                  if (v58 < 0x58)
                    goto LABEL_84;
                  if ((unint64_t)((char *)var0 - &v55[v50]) < 0x20)
                    goto LABEL_84;
                  v59 = (v58 >> 3) + 1;
                  v60 = &v55[8 * v51 - 16];
                  v61 = var0 - 2;
                  v62 = v59 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v63 = *(_OWORD *)v61;
                    *(v60 - 1) = *((_OWORD *)v61 - 1);
                    *v60 = v63;
                    v60 -= 2;
                    v61 -= 4;
                    v62 -= 4;
                  }
                  while (v62);
                  v56 -= v59 & 0x3FFFFFFFFFFFFFFCLL;
                  var0 -= v59 & 0x3FFFFFFFFFFFFFFCLL;
                  if (v59 != (v59 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_84:
                    do
                    {
                      v64 = *--var0;
                      *--v56 = v64;
                    }
                    while (var0 != begin);
                  }
                  var0 = p_resources->__begin_;
                }
                p_resources->__begin_ = v56;
                self->_resources.var0 = v48;
                self->_resources.var1.__value_ = v57;
                if (var0)
                  operator delete(var0);
              }
              else
              {
                *var0 = v45;
                v48 = var0 + 1;
              }
              self->_resources.var0 = v48;
              sparse_queue_buffer = self->_sparse_queue_buffer;
              v66 = self->_resources.var1.__value_;
              if (v48 < (__end_cap_ **)v66)
              {
                *v48 = sparse_queue_buffer;
                self->_resources.var0 = v48 + 1;
                return self;
              }
              v67 = p_resources->__begin_;
              v68 = (char *)v48 - (char *)p_resources->__begin_;
              v69 = v68 >> 3;
              v70 = (v68 >> 3) + 1;
              if (!(v70 >> 61))
              {
                v71 = (char *)v66 - (char *)v67;
                if (v71 >> 2 > v70)
                  v70 = v71 >> 2;
                if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
                  v72 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v72 = v70;
                if (!v72)
                {
                  v73 = 0;
LABEL_65:
                  v74 = (MTLBuffer **)&v73[8 * v69];
                  v75 = (id *)&v73[8 * v72];
                  *v74 = sparse_queue_buffer;
                  v76 = v74 + 1;
                  if (v48 == v67)
                  {
                    p_resources->__begin_ = v74;
                    self->_resources.var0 = v76;
                    self->_resources.var1.__value_ = v75;
LABEL_74:
                    operator delete(v48);
LABEL_75:
                    self->_resources.var0 = v76;
                    return self;
                  }
                  v77 = (char *)v48 - (char *)v67 - 8;
                  if (v77 > 0x57 && (unint64_t)((char *)v48 - v73 - v68) >= 0x20)
                  {
                    v80 = (v77 >> 3) + 1;
                    v78 = &v48[-(v80 & 0x3FFFFFFFFFFFFFFCLL)];
                    v81 = &v73[8 * v69 - 16];
                    v82 = v48 - 2;
                    v83 = v80 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v84 = *(_OWORD *)v82;
                      *(v81 - 1) = *((_OWORD *)v82 - 1);
                      *v81 = v84;
                      v81 -= 2;
                      v82 -= 4;
                      v83 -= 4;
                    }
                    while (v83);
                    v74 -= v80 & 0x3FFFFFFFFFFFFFFCLL;
                    if (v80 == (v80 & 0x3FFFFFFFFFFFFFFCLL))
                      goto LABEL_71;
                  }
                  else
                  {
                    v78 = v48;
                  }
                  do
                  {
                    v79 = *--v78;
                    *--v74 = v79;
                  }
                  while (v78 != v67);
                  v67 = p_resources->__begin_;
LABEL_71:
                  p_resources->__begin_ = v74;
                  self->_resources.var0 = v76;
                  v48 = v67;
                  self->_resources.var1.__value_ = v75;
                  if (!v67)
                    goto LABEL_75;
                  goto LABEL_74;
                }
                if (!(v72 >> 61))
                {
                  v73 = operator new(8 * v72);
                  goto LABEL_65;
                }
LABEL_81:
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
LABEL_80:
              abort();
            }
          }
          else
          {
            v32 = 0;
          }
          v43 = v32 + 3;
          do
          {
            v26[v43] = (v27 + *p_sparse_page_size * ((_DWORD)v43 - 3)) >> 14;
            ++v43;
          }
          while (v43 - v13 != 3);
          goto LABEL_29;
        }
      }
    }
  }
  -[AGXA10FamilySparseHeap dealloc](self, "dealloc");
  return 0;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  return 0;
}

- (id)newTextureWithDescriptor:(id)a3
{
  AGXA10FamilyTexture *v4;
  AGXA10FamilyTexture *v5;
  vector<IOGPUMetalResource *, std::allocator<IOGPUMetalResource *>> *p_resources;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v9;
  __end_ **begin;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  __end_ **v17;
  id *v18;
  unint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  __end_cap_ **v22;
  uint64_t v23;
  __int128 v24;
  __end_ *v25;

  v4 = -[AGXTexture initWithSparseHeap:desc:resource:sparsePagesAddress:sparsePageSize:]([AGXA10FamilyTexture alloc], "initWithSparseHeap:desc:resource:sparsePagesAddress:sparsePageSize:", self, a3, self->_sparse_pages_buffer, self->sparse_page_queue_addr, self->sparse_page_size);
  v5 = v4;
  if (v4)
  {
    p_resources = &self->_resources;
    var0 = self->_resources.var0;
    value = self->_resources.var1.__value_;
    if (var0 >= (__end_cap_ **)value)
    {
      begin = p_resources->__begin_;
      v11 = (char *)var0 - (char *)p_resources->__begin_;
      v12 = v11 >> 3;
      v13 = (v11 >> 3) + 1;
      if (v13 >> 61)
        abort();
      v14 = (char *)value - (char *)begin;
      if (v14 >> 2 > v13)
        v13 = v14 >> 2;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
        v15 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        if (v15 >> 61)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v16 = operator new(8 * v15);
      }
      else
      {
        v16 = 0;
      }
      v17 = (__end_ **)&v16[8 * v12];
      v18 = (id *)&v16[8 * v15];
      *v17 = (__end_ *)v5;
      v9 = v17 + 1;
      if (var0 == begin)
      {
        begin = var0;
      }
      else
      {
        v19 = (char *)var0 - (char *)begin - 8;
        if (v19 < 0x58)
          goto LABEL_31;
        if ((unint64_t)((char *)var0 - v16 - v11) < 0x20)
          goto LABEL_31;
        v20 = (v19 >> 3) + 1;
        v21 = &v16[8 * v12 - 16];
        v22 = var0 - 2;
        v23 = v20 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v24 = *(_OWORD *)v22;
          *(v21 - 1) = *((_OWORD *)v22 - 1);
          *v21 = v24;
          v21 -= 2;
          v22 -= 4;
          v23 -= 4;
        }
        while (v23);
        v17 -= v20 & 0x3FFFFFFFFFFFFFFCLL;
        var0 -= v20 & 0x3FFFFFFFFFFFFFFCLL;
        if (v20 != (v20 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_31:
          do
          {
            v25 = *--var0;
            *--v17 = v25;
          }
          while (var0 != begin);
          begin = p_resources->__begin_;
        }
      }
      p_resources->__begin_ = v17;
      p_resources->var0 = v9;
      p_resources->var1.__value_ = v18;
      if (begin)
        operator delete(begin);
    }
    else
    {
      *var0 = (__end_cap_ *)v4;
      v9 = var0 + 1;
    }
    p_resources->var0 = v9;
  }
  return v5;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 atOffset:(unint64_t)a5
{
  return 0;
}

- (id)newTextureWithDescriptor:(id)a3 atOffset:(unint64_t)a4
{
  return 0;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return -[MTLBuffer setPurgeableState:](self->_sparse_pages_buffer, "setPurgeableState:", a3);
}

- (unint64_t)currentAllocatedSize
{
  return -[MTLBuffer allocatedSize](self->_sparse_pages_buffer, "allocatedSize")
       - self->sparse_page_queue_alignment_padding;
}

- (void)removeTexture:(id)a3
{
  __end_cap_ **var0;
  __end_ **begin;
  __end_cap_ **v5;

  var0 = self->_resources.var0;
  begin = self->_resources.__begin_;
  if (begin != var0)
  {
    while (*begin != a3)
    {
      if (++begin == var0)
      {
        begin = self->_resources.var0;
        break;
      }
    }
  }
  v5 = begin + 1;
  if (begin == var0 || v5 == var0)
  {
    if (begin != var0)
LABEL_16:
      self->_resources.var0 = begin;
  }
  else
  {
    do
    {
      if (*v5 != a3)
        *begin++ = *v5;
      ++v5;
    }
    while (v5 != var0);
    if (begin != self->_resources.var0)
      goto LABEL_16;
  }
}

- (void).cxx_destruct
{
  vector<IOGPUMetalResource *, std::allocator<IOGPUMetalResource *>> *p_resources;
  __end_ **begin;

  p_resources = &self->_resources;
  begin = self->_resources.__begin_;
  if (begin)
  {
    p_resources->var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
