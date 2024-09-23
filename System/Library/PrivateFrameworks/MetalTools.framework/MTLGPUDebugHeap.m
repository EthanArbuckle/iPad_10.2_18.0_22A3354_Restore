@implementation MTLGPUDebugHeap

- (MTLGPUDebugHeap)initWithHeap:(id)a3 descriptor:(id)a4 device:(id)a5
{
  MTLGPUDebugHeap *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugHeap;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a5);
  if (result)
  {
    *(_DWORD *)&result->_enableResourceUsageValidation = 0;
    result->_textureLock._os_unfair_lock_opaque = 0;
    *((_BYTE *)&result->super.super._externalReferences + 4) = (*(_QWORD *)((_BYTE *)a5 + 284) & 0x200000001) != 0;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  MTLGPUDebugBuffer *v7;

  v5 = -[MTLToolsObject newBufferWithLength:options:](self->super.super._baseObject, "newBufferWithLength:options:", a3, a4);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = -[MTLGPUDebugBuffer initWithBuffer:heap:device:]([MTLGPUDebugBuffer alloc], "initWithBuffer:heap:device:", v5, self, self->super.super._device);
  addBufferForUsageValidation(self, v7);

  return v7;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  uint64_t v6;
  void *v7;
  MTLGPUDebugBuffer *v8;

  v6 = -[MTLToolsObject newBufferWithLength:options:offset:](self->super.super._baseObject, "newBufferWithLength:options:offset:", a3, a4, a5);
  if (!v6)
    return 0;
  v7 = (void *)v6;
  v8 = -[MTLGPUDebugBuffer initWithBuffer:heap:device:]([MTLGPUDebugBuffer alloc], "initWithBuffer:heap:device:", v6, self, self->super.super._device);
  addBufferForUsageValidation(self, v8);

  return v8;
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v4;
  void *v5;
  MTLGPUDebugTexture *v6;

  v4 = -[MTLToolsObject newTextureWithDescriptor:](self->super.super._baseObject, "newTextureWithDescriptor:", a3);
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = -[MTLGPUDebugTexture initWithTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTexture:heap:device:", v4, self, self->super.super._device);
  addTextureForUsageValidation(self, v6);

  return v6;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  MTLGPUDebugTexture *v7;

  v5 = -[MTLToolsObject newTextureWithDescriptor:offset:](self->super.super._baseObject, "newTextureWithDescriptor:offset:", a3, a4);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = -[MTLGPUDebugTexture initWithTexture:heap:device:]([MTLGPUDebugTexture alloc], "initWithTexture:heap:device:", v5, self, self->super.super._device);
  addTextureForUsageValidation(self, v7);

  return v7;
}

- (void)notifyResourceReleasing:(id)a3
{
  os_unfair_lock_s *p_textureLock;
  vector<std::pair<unsigned int, MTLTextureType>, std::allocator<std::pair<unsigned int, MTLTextureType>>> *p_textureIndicesAndTypes;
  char *begin;
  char *end;
  int v9;
  BOOL *p_enableResourceUsageValidation;
  vector<unsigned int, std::allocator<unsigned int>> *p_bufferIndices;
  __int32 *v12;
  __int32 *v13;
  vector<unsigned int, std::allocator<unsigned int>> *p_accelerationStructureIndices;
  __int32 *v15;
  __int32 *v16;
  char *i;
  int v18;
  __int32 v19;
  __int32 v20;

  if (*((_BYTE *)&self->super.super._externalReferences + 4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      p_textureLock = &self->_textureLock;
      os_unfair_lock_lock(&self->_textureLock);
      p_textureIndicesAndTypes = &self->_textureIndicesAndTypes;
      begin = (char *)self->_textureIndicesAndTypes.__begin_;
      end = (char *)p_textureIndicesAndTypes->__end_;
      while (begin != end)
      {
        v9 = *(_DWORD *)begin;
        if (v9 == objc_msgSend(a3, "resourceIndex"))
        {
          if (begin != end)
          {
            for (i = begin + 16; i != end; i += 16)
            {
              v18 = *(_DWORD *)i;
              if (v18 != objc_msgSend(a3, "resourceIndex"))
              {
                *(_DWORD *)begin = *(_DWORD *)i;
                *((_QWORD *)begin + 1) = *((_QWORD *)i + 1);
                begin += 16;
              }
            }
          }
          break;
        }
        begin += 16;
      }
      os_unfair_lock_unlock(p_textureLock);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        p_enableResourceUsageValidation = &self->_enableResourceUsageValidation;
        os_unfair_lock_lock((os_unfair_lock_t)&self->_enableResourceUsageValidation);
        p_bufferIndices = &self->_bufferIndices;
        v12 = (__int32 *)self->_bufferIndices.__begin_;
        v13 = (__int32 *)p_bufferIndices->__end_;
        v20 = objc_msgSend(a3, "bufferIndex");
        std::remove[abi:ne180100]<std::__wrap_iter<unsigned int *>,unsigned int>(v12, v13, &v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return;
        p_enableResourceUsageValidation = &self->_enableResourceUsageValidation;
        os_unfair_lock_lock((os_unfair_lock_t)&self->_enableResourceUsageValidation);
        p_accelerationStructureIndices = &self->_accelerationStructureIndices;
        v15 = (__int32 *)self->_accelerationStructureIndices.__begin_;
        v16 = (__int32 *)p_accelerationStructureIndices->__end_;
        v19 = objc_msgSend(a3, "resourceIndex");
        std::remove[abi:ne180100]<std::__wrap_iter<unsigned int *>,unsigned int>(v15, v16, &v19);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)p_enableResourceUsageValidation);
    }
  }
}

- (void)enumerateBufferIndices:(id)a3
{
  BOOL *p_enableResourceUsageValidation;

  p_enableResourceUsageValidation = &self->_enableResourceUsageValidation;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_enableResourceUsageValidation);
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock((os_unfair_lock_t)p_enableResourceUsageValidation);
}

- (void)enumerateTextureIndicesAndTypes:(id)a3
{
  os_unfair_lock_s *p_textureLock;

  p_textureLock = &self->_textureLock;
  os_unfair_lock_lock(&self->_textureLock);
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_textureLock);
}

- (void)enumerateAccelerationStructureIndices:(id)a3
{
  os_unfair_lock_s *p_accelerationStructureLock;

  p_accelerationStructureLock = &self->_accelerationStructureLock;
  os_unfair_lock_lock(&self->_accelerationStructureLock);
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_accelerationStructureLock);
}

- (id)_newGPUDebugAccelerationStructure:(id)a3
{
  MTLGPUDebugAccelerationStructure *v5;
  os_unfair_lock_s *p_accelerationStructureLock;
  unsigned int v7;
  unsigned int v8;
  vector<unsigned int, std::allocator<unsigned int>> *p_accelerationStructureIndices;
  unsigned int *end;
  unsigned int *value;
  unsigned int *v12;
  unsigned int *begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;

  if (!a3)
    return 0;
  v5 = -[MTLGPUDebugAccelerationStructure initWithAccelerationStructure:heap:]([MTLGPUDebugAccelerationStructure alloc], "initWithAccelerationStructure:heap:", a3, self);
  if (*((_BYTE *)&self->super.super._externalReferences + 4))
  {
    p_accelerationStructureLock = &self->_accelerationStructureLock;
    os_unfair_lock_lock(&self->_accelerationStructureLock);
    v7 = -[MTLToolsAccelerationStructure resourceIndex](v5, "resourceIndex");
    v8 = v7;
    p_accelerationStructureIndices = &self->_accelerationStructureIndices;
    end = p_accelerationStructureIndices->__end_;
    value = p_accelerationStructureIndices->__end_cap_.__value_;
    if (end >= value)
    {
      begin = p_accelerationStructureIndices->__begin_;
      v14 = end - p_accelerationStructureIndices->__begin_;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v16 = (char *)value - (char *)begin;
      if (v16 >> 1 > v15)
        v15 = v16 >> 1;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
        v17 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&p_accelerationStructureIndices->__end_cap_, v17);
        begin = p_accelerationStructureIndices->__begin_;
        end = p_accelerationStructureIndices->__end_;
      }
      else
      {
        v18 = 0;
      }
      v19 = (unsigned int *)&v18[4 * v14];
      v20 = (unsigned int *)&v18[4 * v17];
      *v19 = v8;
      v12 = v19 + 1;
      while (end != begin)
      {
        v21 = *--end;
        *--v19 = v21;
      }
      p_accelerationStructureIndices->__begin_ = v19;
      p_accelerationStructureIndices->__end_ = v12;
      p_accelerationStructureIndices->__end_cap_.__value_ = v20;
      if (begin)
        operator delete(begin);
    }
    else
    {
      *end = v7;
      v12 = end + 1;
    }
    p_accelerationStructureIndices->__end_ = v12;
    os_unfair_lock_unlock(p_accelerationStructureLock);
  }

  return v5;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return -[MTLGPUDebugHeap _newGPUDebugAccelerationStructure:](self, "_newGPUDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:](self->super.super._baseObject, "newAccelerationStructureWithSize:", a3));
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  return -[MTLGPUDebugHeap _newGPUDebugAccelerationStructure:](self, "_newGPUDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithDescriptor:](self->super.super._baseObject, "newAccelerationStructureWithDescriptor:", unwrapAccelerationStructureDescriptor(a3)));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return -[MTLGPUDebugHeap _newGPUDebugAccelerationStructure:](self, "_newGPUDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:offset:](self->super.super._baseObject, "newAccelerationStructureWithSize:offset:", a3, a4));
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  return -[MTLGPUDebugHeap _newGPUDebugAccelerationStructure:](self, "_newGPUDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithDescriptor:offset:](self->super.super._baseObject, "newAccelerationStructureWithDescriptor:offset:", unwrapAccelerationStructureDescriptor(a3), a4));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  return -[MTLGPUDebugHeap _newGPUDebugAccelerationStructure:](self, "_newGPUDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:resourceIndex:](self->super.super._baseObject, "newAccelerationStructureWithSize:resourceIndex:", a3, a4));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return -[MTLGPUDebugHeap _newGPUDebugAccelerationStructure:](self, "_newGPUDebugAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:offset:resourceIndex:](self->super.super._baseObject, "newAccelerationStructureWithSize:offset:resourceIndex:", a3, a4, a5));
}

- (void).cxx_destruct
{
  vector<unsigned int, std::allocator<unsigned int>> *p_accelerationStructureIndices;
  unsigned int *begin;
  void *v5;
  unsigned int *v6;

  p_accelerationStructureIndices = &self->_accelerationStructureIndices;
  begin = self->_accelerationStructureIndices.__begin_;
  if (begin)
  {
    p_accelerationStructureIndices->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_textureIndicesAndTypes.__begin_;
  if (v5)
  {
    self->_textureIndicesAndTypes.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_bufferIndices.__begin_;
  if (v6)
  {
    self->_bufferIndices.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0;
  return self;
}

@end
