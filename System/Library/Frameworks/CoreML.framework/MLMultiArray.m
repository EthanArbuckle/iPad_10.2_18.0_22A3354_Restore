@implementation MLMultiArray

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)initWithBytesNoCopy:(uint64_t)a1 shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:
{

  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)a1);
}

{

  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)a1);
  JUMPOUT(0x1A1AD6260);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  StorageManager *value;

  objc_storeStrong((id *)&self->_shape, 0);
  value = self->_storageManager.__ptr_.__value_;
  self->_storageManager.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<StorageManager>::operator()[abi:ne180100]((uint64_t)value);
}

- (MLMultiArray)initWithBytesNoCopy:(void *)a3 shape:(id)a4 dataType:(int64_t)a5 strides:(id)a6 deallocator:(id)a7 mutableShapedBufferProvider:(id)a8 error:(id *)a9
{
  int v12;
  id v16;
  id v17;
  id v18;
  id v19;
  MLMultiArray *v20;
  uint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  StorageManager *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t value;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  void *context;
  id v45;
  id v46;
  void *v47;
  std::__shared_weak_count *v48;
  void *__p;
  _BYTE *v50;
  void *v51;
  _BYTE *v52;
  objc_super v53;
  _QWORD v54[3];

  v12 = a5;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v53.receiver = self;
  v53.super_class = (Class)MLMultiArray;
  v20 = -[MLMultiArray init](&v53, sel_init);
  if (v20)
  {
    v21 = MEMORY[0x1A1AD6ED8]();
    objc_storeStrong((id *)&v20->_shape, a4);
    v46 = v16;
    context = (void *)v21;
    v45 = v18;
    v47 = v19;
    v22 = _Block_copy(v18);
    v23 = (std::__shared_weak_count *)operator new();
    v23->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    v23->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5C790;
    v23->__shared_weak_owners_ = 0;
    v23[1].__vftable = (std::__shared_weak_count_vtbl *)a3;
    v23[1].__shared_owners_ = (uint64_t)v22;
    v48 = v23;
    v25 = (std::__shared_weak_count *)operator new(0x88uLL);
    v26 = v25;
    v25->__shared_owners_ = 0;
    v27 = (unint64_t *)&v25->__shared_owners_;
    v25->__shared_weak_owners_ = 0;
    v25->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BD48;
    v25[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D59518;
    v28 = &v25[1].__vftable;
    v25[1].__shared_owners_ = (uint64_t)a3;
    v25[1].__shared_weak_owners_ = (uint64_t)v23;
    do
      v29 = __ldxr(p_shared_owners);
    while (__stxr(v29 + 1, p_shared_owners));
    v25[2].__vftable = 0;
    v25[2].__shared_owners_ = 0;
    v25[2].__shared_weak_owners_ = 0;
    v19 = v47;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v25[2].__vftable, v51, (uint64_t)v52, (v52 - (_BYTE *)v51) >> 3);
    v26[3].__vftable = 0;
    v26[3].__shared_owners_ = 0;
    v26[3].__shared_weak_owners_ = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v26[3].__vftable, __p, (uint64_t)v50, (v50 - (_BYTE *)__p) >> 3);
    LODWORD(v26[4].__vftable) = v12;
    v30 = (unint64_t *)v26[2].__vftable;
    v31 = 1;
    while (v30 != (unint64_t *)v26[2].__shared_owners_)
    {
      v32 = *v30++;
      v33 = v31 * v32;
      if (is_mul_ok(v31, v32))
        v31 = v33;
      else
        v31 = -1;
    }
    v26[4].__shared_owners_ = v31;
    LOWORD(v26[4].__shared_weak_owners_) = CoreML::MultiArrayBuffer::computeAttributes((uint64_t **)&v51, (uint64_t *)__p, (uint64_t)v50, 1);
    v26[5].__vftable = 0;
    LOBYTE(v26[5].__shared_owners_) = 0;
    v34 = operator new();
    v35 = (StorageManager *)v34;
    v54[0] = v28;
    v54[1] = v26;
    do
      v36 = __ldxr(v27);
    while (__stxr(v36 + 1, v27));
    StorageManager::StorageManager(v34, v54, v47);
    do
      v37 = __ldaxr(v27);
    while (__stlxr(v37 - 1, v27));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    value = (uint64_t)v20->_storageManager.__ptr_.__value_;
    v20->_storageManager.__ptr_.__value_ = v35;
    v16 = v46;
    if (value)
      std::default_delete<StorageManager>::operator()[abi:ne180100](value);
    v18 = v45;
    if (v26)
    {
      v39 = (unint64_t *)&v26->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    if (v48)
    {
      v41 = (unint64_t *)&v48->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
    if (__p)
    {
      v50 = __p;
      operator delete(__p);
    }
    if (v51)
    {
      v52 = v51;
      operator delete(v51);
    }
    objc_autoreleasePoolPop(context);

  }
  return v20;
}

- (MLMultiArray)initWithDataPointer:(void *)dataPointer shape:(NSArray *)shape dataType:(MLMultiArrayDataType)dataType strides:(NSArray *)strides deallocator:(void *)deallocator error:(NSError *)error
{
  return -[MLMultiArray initWithBytesNoCopy:shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:](self, "initWithBytesNoCopy:shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:", dataPointer, shape, dataType, strides, deallocator, 0, error);
}

- (NSArray)shape
{
  return self->_shape;
}

- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 storageOrder:(int64_t)a5 error:(id *)a6
{
  int v7;
  id v10;
  MLMultiArray *v11;
  MLMultiArray *v12;
  int v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t value;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  MLMultiArray *v24;
  void *__p;
  void *v27;
  std::__shared_weak_count *v28;
  std::__shared_weak_count *v29;
  objc_super v30;

  v7 = a4;
  v10 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MLMultiArray;
  v11 = -[MLMultiArray init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shape, a3);
    v13 = +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", a5);
    v14 = (std::__shared_weak_count *)operator new(0x88uLL);
    v14->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    v14->__shared_weak_owners_ = 0;
    v14->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BD48;
    CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v14[1], (unint64_t **)&__p, v7, v13, 1uLL);
    v28 = v14 + 1;
    v29 = v14;
    if (__p)
    {
      v27 = __p;
      operator delete(__p);
    }
    v16 = operator new();
    v17 = v16;
    __p = &v14[1];
    v27 = v14;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
    StorageManager::StorageManager(v16, &__p);
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    value = (uint64_t)v12->_storageManager.__ptr_.__value_;
    v12->_storageManager.__ptr_.__value_ = (StorageManager *)v17;
    if (value)
      std::default_delete<StorageManager>::operator()[abi:ne180100](value);
    v21 = v29;
    if (v29)
    {
      v22 = (unint64_t *)&v29->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
  v24 = v12;

  return v24;
}

+ (int)cppStorageOrder:(int64_t)a3
{
  return a3 != 0;
}

- (MLMultiArray)initWithShape:(NSArray *)shape dataType:(MLMultiArrayDataType)dataType error:(NSError *)error
{
  return -[MLMultiArray initWithShape:dataType:storageOrder:error:](self, "initWithShape:dataType:storageOrder:error:", shape, dataType, 0, error);
}

- (BOOL)copyIntoMultiArray:(id)a3 error:(id *)a4
{
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char v17;
  CoreML::MultiArrayBuffer *v19;
  std::__shared_weak_count *v20;
  CoreML::MultiArrayBuffer *v21;
  std::__shared_weak_count *v22;

  v6 = (uint64_t *)a3;
  v7 = kdebug_trace();
  v8 = (void *)MEMORY[0x1A1AD6ED8](v7);
  StorageManager::storage((StorageManager *)&v21, (uint64_t)self->_storageManager.__ptr_.__value_);
  StorageManager::mutableStorage((StorageManager *)&v19, v6[1]);
  v9 = CoreML::MultiArrayBuffer::copyInto(v21, v19);
  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Unable to copy %@ into %@"), self, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v22;
  if (v22)
  {
    v15 = (unint64_t *)&v22->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  objc_autoreleasePoolPop(v8);
  if (a4)
    v17 = v9;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
    *a4 = objc_retainAutorelease(v10);

  kdebug_trace();
  return v9;
}

- (void)setObject:(NSNumber *)obj atIndexedSubscript:(NSInteger)idx
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  NSNumber *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  NSNumber *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v11 = obj;
  StorageManager::mutableStorage((StorageManager *)&v12, (uint64_t)self->_storageManager.__ptr_.__value_);
  v6 = CoreML::MultiArrayBuffer::offsetForIndex(v12, idx);
  v7 = v13;
  v8 = v11;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *, NSNumber *))v7->__on_zero_shared)(v7, v11);
      std::__shared_weak_count::__release_weak(v7);
      v8 = v11;
    }
  }
  -[MLMultiArray setNumber:atOffset:](self, "setNumber:atOffset:", v8, v6);

}

- (void)setNumber:(id)a3 atOffset:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__MLMultiArray_setNumber_atOffset___block_invoke;
  v8[3] = &unk_1E3D64F20;
  v9 = v6;
  v10 = a4;
  v8[4] = self;
  v7 = v6;
  -[MLMultiArray getMutableBytesWithHandler:](self, "getMutableBytesWithHandler:", v8);

}

- (void)getMutableBytesWithHandler:(void *)handler
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  _QWORD v16[4];
  id v17;

  v4 = handler;
  StorageManager::mutableStorage((StorageManager *)&v14, (uint64_t)self->_storageManager.__ptr_.__value_);
  v5 = v14;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__MLMultiArray_ScopedBufferAccess__getMutableBytesWithHandler___block_invoke;
  v12[3] = &unk_1E3D64FD8;
  v7 = v4;
  v12[4] = self;
  v13 = v7;
  v8 = v12;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = ___ZN6CoreML16MultiArrayBuffer26getMutableBytesWithHandlerEU13block_pointerFvPvmE_block_invoke;
  v16[3] = &unk_1E3D64FB0;
  v17 = v8;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v5, v16);

  v9 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

}

void __63__MLMultiArray_ScopedBufferAccess__getMutableBytesWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "strides");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, a2, a3);

}

- (NSArray)strides
{
  StorageManager *value;
  unsigned __int8 v3;
  id v4;
  os_unfair_lock_s *v5;

  value = self->_storageManager.__ptr_.__value_;
  if (*((_QWORD *)value + 3) && (v3 = atomic_load((unsigned __int8 *)value), (v3 & 1) != 0))
  {
    v5 = (os_unfair_lock_s *)((char *)value + 4);
    os_unfair_lock_lock((os_unfair_lock_t)value + 1);
    v4 = *((id *)value + 4);
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v4 = *((id *)value + 4);
  }
  return (NSArray *)v4;
}

uint64_t __35__MLMultiArray_setNumber_atOffset___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v15;

  v6 = objc_msgSend(*(id *)(a1 + 32), "numberOfBytesPerElement");
  v7 = *(_QWORD *)(a1 + 48);
  if (!is_mul_ok(v6, v7) || v6 * v7 >= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Could not store NSNumber at offset %zu because it is beyond the end of the multi array."), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "dataType");
  if (result > 65599)
  {
    if (result == 65600)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "doubleValue");
      *(_QWORD *)(a2 + 8 * *(_QWORD *)(a1 + 48)) = v15;
    }
    else if (result == 131104)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "intValue");
      *(_DWORD *)(a2 + 4 * *(_QWORD *)(a1 + 48)) = result;
    }
  }
  else if (result == 65552)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "floatValue");
    __asm { FCVT            H0, S0 }
    *(_WORD *)(a2 + 2 * *(_QWORD *)(a1 + 48)) = _S0;
  }
  else if (result == 65568)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "floatValue");
    *(_DWORD *)(a2 + 4 * *(_QWORD *)(a1 + 48)) = v9;
  }
  return result;
}

- (unint64_t)numberOfBytesPerElement
{
  __n128 v2;
  std::__shared_weak_count *v3;
  int v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2.n128_f64[0] = StorageManager::storage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  v3 = v9;
  v4 = *(_DWORD *)(v8 + 72);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v3->__on_zero_shared)(v3, v2);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return (unsigned __int16)v4 >> 3;
}

- (MLMultiArrayDataType)dataType
{
  __n128 v2;
  std::__shared_weak_count *v3;
  int v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  MLMultiArrayDataType result;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2.n128_f64[0] = StorageManager::storage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  v3 = v9;
  v4 = *(_DWORD *)(v8 + 72);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v3->__on_zero_shared)(v3, v2);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  result = MLMultiArrayDataTypeFloat16;
  if (v4 != 65552)
  {
    if (v4 == 65600)
    {
      return 65600;
    }
    else if (v4 == 131104)
    {
      return 131104;
    }
    else
    {
      return 65568;
    }
  }
  return result;
}

uint64_t __56__MLMultiArray_ScopedBufferAccess__getBytesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__MLMultiArray_numberAtOffset___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  uint64_t v17;
  void *v18;

  v6 = objc_msgSend(*(id *)(a1 + 32), "numberOfBytesPerElement");
  v7 = *(_QWORD *)(a1 + 48);
  if (!is_mul_ok(v6, v7) || v6 * v7 >= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Could not fetch NSNumber at offset %zu because it is beyond the end of the multi array."), *(_QWORD *)(a1 + 48));
  v8 = objc_msgSend(*(id *)(a1 + 32), "dataType");
  if (v8 > 65599)
  {
    if (v8 == 65600)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a2 + 8 * *(_QWORD *)(a1 + 48)));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v8 == 131104)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a2 + 4 * *(_QWORD *)(a1 + 48)));
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v11;

    }
  }
  else
  {
    if (v8 == 65552)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      _H0 = *(_WORD *)(a2 + 2 * *(_QWORD *)(a1 + 48));
      __asm { FCVT            S0, H0 }
      goto LABEL_13;
    }
    if (v8 == 65568)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(_D0) = *(_DWORD *)(a2 + 4 * *(_QWORD *)(a1 + 48));
LABEL_13:
      objc_msgSend(v10, "numberWithFloat:", _D0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
}

void __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v9 = a4;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke_2;
  v10[3] = &__block_descriptor_48_e25_v32__0__NSNumber_8Q16_B24l;
  v10[4] = a2;
  v10[5] = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

- (void)mutableBytes
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  void *v12;
  std::__shared_weak_count *v13;

  StorageManager::mutableStorage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v12, v10);
  v2 = v12;
  v3 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v2;
}

- (const)bytes
{
  const void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  const void *v12;
  std::__shared_weak_count *v13;

  StorageManager::storage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v12, v10);
  v2 = v12;
  v3 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v2;
}

- (MLMultiArray)initWithCoder:(id)a3
{
  id v4;
  int v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  NSObject *v11;
  MLMultiArray *v12;
  id v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  NSObject *v20;
  CVReturn v21;
  MLMultiArray *v22;
  NSObject *v23;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  MLMultiArray *v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  _BYTE *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  CVPixelBufferRef pixelBufferOut;
  size_t size;
  uint8_t v46[4];
  uint64_t v47;
  _BYTE buf[24];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dataType"));
  v6 = operator new(0x30uLL);
  v7 = 0;
  v8 = v5;
  *v6 = xmmword_19CB2E7E8;
  v6[1] = unk_19CB2E7F8;
  v6[2] = xmmword_19CB2E808;
  v9 = (char *)(v6 + 3);
  while (*((_QWORD *)v6 + v7) != v5)
  {
    if (++v7 == 6)
      goto LABEL_6;
  }
  v9 = (char *)v6 + 8 * v7;
LABEL_6:
  v10 = v9 - (char *)v6;
  operator delete(v6);
  if (v10 != 48)
  {
    size = 0;
    v13 = objc_retainAutorelease(v4);
    v14 = (const void *)objc_msgSend(v13, "decodeBytesForKey:returnedLength:", CFSTR("dataPointer"), &size);
    if (!v14 || !size)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive dataPointer.", buf, 2u);
      }
      v12 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v13, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("shape"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("strides"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v15, "count"))
    {
      v17 = -[NSObject count](v15, "count");
      if (v17 == objc_msgSend(v16, "count"))
      {
        if (v18 == size)
        {
          if (!objc_msgSend(v13, "decodeBoolForKey:", CFSTR("isBackedByPixelBuffer")))
          {
            v25 = malloc_type_malloc(size, 0x8610B5A8uLL);
            memcpy(v25, v14, size);
            self = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](self, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v25, v15, v8, v16, &__block_literal_global_2344, 0);
            v12 = self;
            goto LABEL_34;
          }
          if (v5 == 65552)
          {
            pixelBufferOut = 0;
            v50 = *MEMORY[0x1E0CA8FF0];
            v51[0] = MEMORY[0x1E0C9AA70];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
            v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v49 = 1;
            v40 = 0;
            v41 = &v40;
            v42 = 0x2020000000;
            v43 = 1;
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __30__MLMultiArray_initWithCoder___block_invoke;
            v36[3] = &unk_1E3D65260;
            v20 = v15;
            v37 = v20;
            v38 = buf;
            v39 = &v40;
            -[NSObject enumerateObjectsUsingBlock:](v20, "enumerateObjectsUsingBlock:", v36);
            v21 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(_QWORD *)(*(_QWORD *)&buf[8] + 24), v41[3], 0x4C303068u, v19, &pixelBufferOut);
            if (v21)
            {
              +[MLLogging coreChannel](MLLogging, "coreChannel");
              v22 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v22->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v46 = 67109120;
                LODWORD(v47) = v21;
                _os_log_error_impl(&dword_19C486000, &v22->super, OS_LOG_TYPE_ERROR, "CVPixelBufferCreate failed with error code: %d", v46, 8u);
              }
              v12 = 0;
            }
            else
            {
              v22 = -[MLMultiArray initWithPixelBuffer:shape:](self, "initWithPixelBuffer:shape:", pixelBufferOut, v20);
              CVPixelBufferRelease(pixelBufferOut);
              v29 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", v14, v20, 65552, v16, 0, 0);
              v35 = 0;
              v30 = -[MLMultiArray copyIntoMultiArray:error:](v29, "copyIntoMultiArray:error:", v22, &v35);
              v31 = v35;
              if (v30)
              {
                v12 = v22;
              }
              else
              {
                +[MLLogging coreChannel](MLLogging, "coreChannel");
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  v34 = objc_msgSend(v31, "code");
                  *(_DWORD *)v46 = 134217984;
                  v47 = v34;
                  _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "copyIntoMultiArray failed decoding MLMultiArray backed by a CVPixelBuffer. Code: %ld", v46, 0xCu);
                }

                v12 = 0;
              }

              self = v22;
            }

            _Block_object_dispose(&v40, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_34;
          }
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", v8);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v33;
            _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Invalid dataType decoding MLMultiArray backed by a CVPixelBuffer. %@", buf, 0xCu);

          }
LABEL_33:
          v12 = 0;
LABEL_34:

LABEL_35:
          goto LABEL_36;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = size;
          _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "dataPointer should be a buffer of size %zu but the unarchived buffer has size of %zu.", buf, 0x16u);
        }
      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v27 = -[NSObject count](v15, "count");
          v28 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v28;
          _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "shape's dimensions (%tu) is different from strides' dimensions (%tu).", buf, 0x16u);
        }
      }
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "shape's dimensions is zero.", buf, 2u);
      }
    }

    goto LABEL_33;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v5;
    _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "dataType %zd is not supported.", buf, 0xCu);
  }

  v12 = 0;
LABEL_36:

  return v12;
}

void __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * *(_QWORD *)(a1 + 40) * a3) = v5;

}

- (NSNumber)objectAtIndexedSubscript:(NSInteger)idx
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  StorageManager::storage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  v5 = CoreML::MultiArrayBuffer::offsetForIndex(v10, idx);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  -[MLMultiArray numberAtOffset:](self, "numberAtOffset:", v5);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)numberAtOffset:(unint64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2378;
  v10 = __Block_byref_object_dispose__2379;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MLMultiArray_numberAtOffset___block_invoke;
  v5[3] = &unk_1E3D66F18;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[MLMultiArray getBytesWithHandler:](self, "getBytesWithHandler:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getBytesWithHandler:(void *)handler
{
  void *v4;
  uint64_t v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = handler;
  StorageManager::storage((StorageManager *)&v12, (uint64_t)self->_storageManager.__ptr_.__value_);
  v5 = v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MLMultiArray_ScopedBufferAccess__getBytesWithHandler___block_invoke;
  v10[3] = &unk_1E3D64FB0;
  v6 = v4;
  v11 = v6;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v5, v10);

  v7 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

+ (id)doubleVectorWithValues:(id)a3
{
  id v3;
  MLMultiArray *v4;
  void *v5;
  void *v6;
  MLMultiArray *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [MLMultiArray alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MLMultiArray initWithShape:dataType:error:](v4, "initWithShape:dataType:error:", v6, 65600, 0);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__MLMultiArray_ConvenientConstruction__doubleVectorWithValues___block_invoke;
  v10[3] = &unk_1E3D65070;
  v8 = v3;
  v11 = v8;
  -[MLMultiArray getMutableBytesWithHandler:](v7, "getMutableBytesWithHandler:", v10);

  return v7;
}

- (NSInteger)count
{
  __n128 v2;
  std::__shared_weak_count *v3;
  NSInteger v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2.n128_f64[0] = StorageManager::storage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  v3 = v9;
  v4 = *(_QWORD *)(v8 + 80);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v3->__on_zero_shared)(v3, v2);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v4;
}

- (void)multiArrayBuffer
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v7;
  std::__shared_weak_count *v8;

  StorageManager::mutableStorage((StorageManager *)&v7, (uint64_t)self->_storageManager.__ptr_.__value_);
  v2 = v7;
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v2;
}

+ (id)multiArrayOwningBufferObjectOfPort:(e5rt_io_port *)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  MLMultiArray *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  uint64_t iosurface;
  NSObject *v19;
  _QWORD v20[6];
  IOSurfaceRef buffer;
  uint64_t v22;
  uint64_t v23;
  _BYTE buf[24];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v5 = e5rt_io_port_retain_tensor_desc();
  if ((_DWORD)v5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = e5rt_get_last_error_message();
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
    }

    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 1, v7, CFSTR("Unable to create a multi-array feature value because ML Program didn't report the shape and other properties."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      a4 = 0;
    }
  }
  else
  {
    v22 = 0;
    v8 = e5rt_io_port_retain_buffer_object();
    if ((_DWORD)v8)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = e5rt_get_last_error_message();
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      if (a4)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 1, v10, CFSTR("Unable to create a multi-array feature value because ML Program didn't output the buffer object."));
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    else
    {
      v11 = MLE5DataPointerOfBufferObject();
      buffer = 0;
      if (!MLE5TypeOfBufferObject())
      {
        iosurface = e5rt_buffer_object_get_iosurface();
        if ((_DWORD)iosurface)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = e5rt_get_last_error_message();
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = iosurface;
            _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Failed to get IOSurface backing of the buffer object. E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to get IOSurface backing of the buffer object. E5RT: %s (%d)"), e5rt_get_last_error_message(), iosurface);
        }
      }
      buffer = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v25 = v22;
      v12 = [MLMultiArray alloc];
      MLE5MultiArrayShapeForTensor();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MLE5MultiArrayDataTypeForTensor();
      MLE5MultiArrayStridesForTensor();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__MLMultiArray_MLE5Utils__multiArrayOwningBufferObjectOfPort_error___block_invoke;
      v20[3] = &unk_1E3D64EF8;
      v20[4] = buf;
      v20[5] = 0;
      a4 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v12, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v11, v13, v14, v15, v20, a4);

      if (a4)
        v16 = a4;

      _Block_object_dispose(buf, 8);
    }
  }
  e5rt_tensor_desc_release();
  return a4;
}

uint64_t __68__MLMultiArray_MLE5Utils__multiArrayOwningBufferObjectOfPort_error___block_invoke(uint64_t a1)
{
  __IOSurface *v1;

  v1 = *(__IOSurface **)(a1 + 40);
  if (v1)
    IOSurfaceDecrementUseCount(v1);
  return e5rt_buffer_object_release();
}

- (MLMultiArray)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_19C486000, v3, OS_LOG_TYPE_FAULT, "The default initializer of MLMultiArray will be removed soon. Please don't use.", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)MLMultiArray;
  return -[MLMultiArray init](&v5, sel_init);
}

- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 strides:(id)a5
{
  int v6;
  id v9;
  id v10;
  MLMultiArray *v11;
  MLMultiArray *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  StorageManager *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t value;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *__p;
  std::__shared_weak_count *v27;
  void *v28;
  std::__shared_weak_count *v29;
  objc_super v30;
  void *v31[8];

  v6 = a4;
  v31[7] = *(void **)MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MLMultiArray;
  v11 = -[MLMultiArray init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shape, a3);
    v13 = (std::__shared_weak_count *)operator new(0x88uLL);
    v13->__shared_owners_ = 0;
    v13->__shared_weak_owners_ = 0;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BD48;
    v28 = (void *)CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v13[1], (uint64_t)v31, (uint64_t)&__p, v6, 1uLL);
    v29 = v13;
    if (__p)
    {
      v27 = (std::__shared_weak_count *)__p;
      operator delete(__p);
    }
    if (v31[0])
    {
      v31[1] = v31[0];
      operator delete(v31[0]);
    }
    v14 = operator new();
    v15 = (StorageManager *)v14;
    __p = v28;
    v27 = v29;
    if (v29)
    {
      p_shared_owners = (unint64_t *)&v29->__shared_owners_;
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
    }
    StorageManager::StorageManager(v14, &__p);
    v18 = v27;
    if (v27)
    {
      v19 = (unint64_t *)&v27->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    value = (uint64_t)v12->_storageManager.__ptr_.__value_;
    v12->_storageManager.__ptr_.__value_ = v15;
    if (value)
      std::default_delete<StorageManager>::operator()[abi:ne180100](value);
    v22 = v29;
    if (v29)
    {
      v23 = (unint64_t *)&v29->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }

  return v12;
}

- (MLMultiArray)initWithMultiArrayBuffer:(shared_ptr<CoreML::MultiArrayBuffer>)a3
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  MLMultiArray *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = (std::__shared_weak_count *)*((_QWORD *)a3.var0 + 1);
  v11 = *(_QWORD *)a3.var0;
  v12 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = -[MLMultiArray initWithMultiArrayBuffer:mutableShapedBufferProvider:](self, "initWithMultiArrayBuffer:mutableShapedBufferProvider:", &v11, 0);
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v6;
}

- (MLMultiArray)initWithMultiArrayBuffer:(shared_ptr<CoreML:(id)a4 :MultiArrayBuffer>)a3 mutableShapedBufferProvider:
{
  MultiArrayBuffer *var0;
  __shared_weak_count *v6;
  MLMultiArray *v7;
  uint64_t v8;
  NSArray *shape;
  uint64_t v10;
  StorageManager *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t value;
  objc_super v20;
  _QWORD v21[2];

  var0 = a3.var0;
  v6 = a3.var1;
  v20.receiver = self;
  v20.super_class = (Class)MLMultiArray;
  v7 = -[MLMultiArray init](&v20, sel_init);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue();
    shape = v7->_shape;
    v7->_shape = (NSArray *)v8;

    v10 = operator new();
    v11 = (StorageManager *)v10;
    v12 = *(_QWORD *)var0;
    v13 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v21[0] = v12;
    v21[1] = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }
    StorageManager::StorageManager(v10, v21, v6);
    if (v13)
    {
      v16 = (unint64_t *)&v13->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    value = (uint64_t)v7->_storageManager.__ptr_.__value_;
    v7->_storageManager.__ptr_.__value_ = v11;
    if (value)
      std::default_delete<StorageManager>::operator()[abi:ne180100](value);
  }

  return v7;
}

- (MLMultiArray)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer shape:(NSArray *)shape
{
  NSArray *v6;
  OSType PixelFormatType;
  NSArray *v8;
  size_t Width;
  uint64_t v10;
  size_t Height;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  _QWORD *v16;
  _BYTE *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t BytesPerRow;
  unint64_t v24;
  MLMultiArray *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  void *__p;
  _BYTE *v36;
  _QWORD *v37;
  std::__shared_weak_count *v38;
  _QWORD v39[4];
  NSArray *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _BYTE *v52;

  v6 = shape;
  if (!pixelBuffer)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("pixelBuffer must not be NULL."));
  if (CVPixelBufferGetPixelFormatType(pixelBuffer) != 1278226536)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The pixel format type must be kCVPixelFormatType_OneComponent16Half. (%c%c%c%c is specified.)"), HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
  }
  if (!CVPixelBufferGetIOSurface(pixelBuffer))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The pixel buffer must use IOSurface."));
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 1;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __42__MLMultiArray_initWithPixelBuffer_shape___block_invoke;
  v39[3] = &unk_1E3D65260;
  v8 = v6;
  v40 = v8;
  v41 = &v47;
  v42 = &v43;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v39);
  Width = CVPixelBufferGetWidth(pixelBuffer);
  v10 = v44[3];
  if (Width != v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The shape's last dimension (%zu) doesn't match the pixel buffer's width (%zu)"), v10, CVPixelBufferGetWidth(pixelBuffer));
  Height = CVPixelBufferGetHeight(pixelBuffer);
  if (Height != v48[3])
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    -[NSArray componentsJoinedByString:](v8, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The product of dimensions in the shape ([%@]) except last one must match the pixel buffer's height (%zu)"), v13, CVPixelBufferGetHeight(pixelBuffer));

  }
  v14 = (std::__shared_weak_count *)operator new(0x88uLL);
  v14->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  v14->__shared_weak_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BD48;
  std::vector<unsigned long>::vector(&v51, (v36 - (_BYTE *)__p) >> 3);
  v16 = v51;
  v17 = v52;
  if (v52 != (_BYTE *)v51)
  {
    v18 = 0;
    v19 = 0;
    v20 = (v52 - (_BYTE *)v51) >> 3;
    do
    {
      v21 = v20 + v18;
      v22 = v20 + v18 - 1;
      if (v19)
      {
        if (v21 + 1 == v20)
        {
          BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
          v16 = v51;
          v51[v22] = BytesPerRow >> 1;
          v17 = v52;
        }
        else
        {
          v16[v22] = *((_QWORD *)__p + v21) * v16[v21];
        }
      }
      else
      {
        v16[v22] = 1;
      }
      ++v19;
      v20 = (v17 - (_BYTE *)v16) >> 3;
      --v18;
    }
    while (v19 < v20);
  }
  CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v14[1], pixelBuffer, (uint64_t)&__p, (uint64_t)&v51);
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  v37 = &v14[1].__vftable;
  v38 = v14;
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }
  v33 = &v14[1].__vftable;
  v34 = v14;
  do
    v24 = __ldxr(p_shared_owners);
  while (__stxr(v24 + 1, p_shared_owners));
  v25 = -[MLMultiArray initWithMultiArrayBuffer:](self, "initWithMultiArrayBuffer:", &v33);
  v26 = v34;
  if (v34)
  {
    v27 = (unint64_t *)&v34->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v38;
  if (v38)
  {
    v30 = (unint64_t *)&v38->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v25;
}

- (unint64_t)offsetForKeyedSubscript:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  MLMultiArray *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  void *v33;
  uint64_t *v34;
  unint64_t v35;
  void *__p;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;

  v30 = self;
  v3 = a3;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  std::vector<long long>::reserve(&v33, objc_msgSend(v3, "count"));
  v4 = 0;
  v5 = v35;
  v6 = (uint64_t *)v33;
  while (v4 < objc_msgSend(v3, "count", v30))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
    v9 = v8;
    v10 = v34;
    if ((unint64_t)v34 >= v5)
    {
      v12 = v34 - v6;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 61)
      {
        v35 = v5;
        v33 = v6;
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v5 - (_QWORD)v6) >> 2 > v13)
        v13 = (uint64_t)(v5 - (_QWORD)v6) >> 2;
      if (v5 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8)
        v14 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      if (v14)
        v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v14);
      else
        v15 = 0;
      v16 = (uint64_t *)(v14 + 8 * v12);
      *v16 = v9;
      v11 = v16 + 1;
      while (v10 != v6)
      {
        v17 = *--v10;
        *--v16 = v17;
      }
      v5 = v14 + 8 * v15;
      if (v6)
        operator delete(v6);
      v6 = v16;
    }
    else
    {
      *v34 = v8;
      v11 = v10 + 1;
    }
    v34 = v11;

    ++v4;
  }
  v35 = v5;
  v33 = v6;
  StorageManager::storage((StorageManager *)&v31, (uint64_t)v30->_storageManager.__ptr_.__value_);
  v18 = v31;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v39, *(const void **)(v31 + 48), *(_QWORD *)(v31 + 56), (uint64_t)(*(_QWORD *)(v31 + 56) - *(_QWORD *)(v31 + 48)) >> 3);
  __p = 0;
  v37 = 0;
  v38 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, *(const void **)(v18 + 24), *(_QWORD *)(v18 + 32), (uint64_t)(*(_QWORD *)(v18 + 32) - *(_QWORD *)(v18 + 24)) >> 3);
  v19 = 0;
  v20 = v39;
  if (v6 < v34 && (unint64_t)v39 < v40)
  {
    v19 = 0;
    v21 = (char *)(v6 + 1);
    v22 = (char *)v39 + 8;
    v23 = __p;
    do
    {
      v24 = *((_QWORD *)v21 - 1);
      if (v24 < 0)
        v24 += *v23;
      v19 += *((_QWORD *)v22 - 1) * v24;
      if (v21 >= (char *)v34)
        break;
      ++v23;
      v21 += 8;
      v25 = (unint64_t)v22 >= v40;
      v22 += 8;
    }
    while (!v25);
  }
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
    v20 = v39;
  }
  if (v20)
  {
    v40 = (unint64_t)v20;
    operator delete(v20);
  }
  v26 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  if (v33)
    operator delete(v33);

  return v19;
}

- (NSNumber)objectForKeyedSubscript:(NSArray *)key
{
  NSArray *v4;
  uint64_t v5;
  __n128 v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = key;
  v5 = -[NSArray count](v4, "count");
  v6.n128_f64[0] = StorageManager::storage((StorageManager *)&v13, (uint64_t)self->_storageManager.__ptr_.__value_);
  v7 = v14;
  v8 = (uint64_t)(*(_QWORD *)(v13 + 32) - *(_QWORD *)(v13 + 24)) >> 3;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v7->__on_zero_shared)(v7, v6);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v5 == v8)
  {
    -[MLMultiArray numberAtOffset:](self, "numberAtOffset:", -[MLMultiArray offsetForKeyedSubscript:](self, "offsetForKeyedSubscript:", v4, v6.n128_f64[0]));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return (NSNumber *)v11;
}

- (void)setObject:(NSNumber *)obj forKeyedSubscript:(NSArray *)key
{
  NSArray *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSNumber *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v12 = obj;
  v6 = key;
  v7 = -[NSArray count](v6, "count");
  StorageManager::mutableStorage((StorageManager *)&v13, (uint64_t)self->_storageManager.__ptr_.__value_);
  v8 = v14;
  v9 = (uint64_t)(*(_QWORD *)(v13 + 32) - *(_QWORD *)(v13 + 24)) >> 3;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v7 == v9)
    -[MLMultiArray setNumber:atOffset:](self, "setNumber:atOffset:", v12, -[MLMultiArray offsetForKeyedSubscript:](self, "offsetForKeyedSubscript:", v6));

}

- (void)dataPointer
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  void *v12;
  std::__shared_weak_count *v13;

  StorageManager::mutableStorage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v12, v10);
  v2 = v12;
  v3 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v2;
}

- (BOOL)backingPixelBufferWasLocked
{
  __n128 v2;
  std::__shared_weak_count *v3;
  int v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2.n128_f64[0] = StorageManager::storage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  v3 = v9;
  v4 = *(unsigned __int8 *)(v8 + 104);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v3->__on_zero_shared)(v3, v2);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v4 != 0;
}

- (CVPixelBufferRef)pixelBuffer
{
  NSObject *v3;
  __n128 v4;
  std::__shared_weak_count *v5;
  __CVBuffer *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  if (-[MLMultiArray backingPixelBufferWasLocked](self, "backingPixelBufferWasLocked"))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_debug_impl(&dword_19C486000, v3, OS_LOG_TYPE_DEBUG, "Pixel buffer backing MLMultiArray is locked until this MultiArray is deallocated (or storage swapped) due to usage of deprecated dataPointer or bytes properties. Please use getBytesWithHandler instead.", (uint8_t *)&v10, 2u);
    }

  }
  v4.n128_f64[0] = StorageManager::storage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  v5 = v11;
  v6 = *(__CVBuffer **)(v10 + 96);
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v5->__on_zero_shared)(v5, v4);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSInteger i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  unint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForDataType:", -[MLMultiArray dataType](self, "dataType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[MLMultiArray shape](self, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR(" "));
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" × "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (objc_msgSend(v18, "count") == 1)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" vector\n"));
    objc_msgSend(v3, "appendString:", CFSTR("["));
    for (i = 0; i < -[MLMultiArray count](self, "count"); ++i)
    {
      -[MLMultiArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v7);

      if (i + 1 < -[MLMultiArray count](self, "count"))
        objc_msgSend(v3, "appendString:", CFSTR(","));
    }
    objc_msgSend(v3, "appendString:", CFSTR("]"));
  }
  else if (objc_msgSend(v18, "count") == 2)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" matrix\n"));
    objc_msgSend(v3, "appendString:", CFSTR("["));
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (v19)
    {
      v11 = 0;
      do
      {
        if (v10)
        {
          v12 = 0;
          do
          {
            if (v11 && !v12)
              objc_msgSend(v3, "appendString:", CFSTR(" "));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v20[0] = v13;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v20[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLMultiArray objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v16);

            if (++v12 < v10)
              objc_msgSend(v3, "appendString:", CFSTR(","));
          }
          while (v10 != v12);
        }
        if (++v11 < v19)
          objc_msgSend(v3, "appendString:", CFSTR(";\n"));
      }
      while (v11 != v19);
    }
    objc_msgSend(v3, "appendString:", CFSTR("]"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" array"));
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[MLMultiArray dataType](self, "dataType"), CFSTR("dataType"));
  -[MLMultiArray shape](self, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("shape"));

  -[MLMultiArray strides](self, "strides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("strides"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MLMultiArray pixelBuffer](self, "pixelBuffer") != 0, CFSTR("isBackedByPixelBuffer"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__MLMultiArray_encodeWithCoder___block_invoke;
  v8[3] = &unk_1E3D64F48;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[MLMultiArray getBytesWithHandler:](self, "getBytesWithHandler:", v8);

}

void __30__MLMultiArray_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v8;

  v8 = a2;
  if (a3 + 1 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = objc_msgSend(v8, "unsignedIntValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v7 = objc_msgSend(v8, "unsignedIntValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(_QWORD *)(v6 + 24) * v7;
  }
  *(_QWORD *)(v6 + 24) = v5;

}

void __30__MLMultiArray_initWithCoder___block_invoke_72(int a1, void *a2)
{
  free(a2);
}

uint64_t __32__MLMultiArray_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "strides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 > a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The buffer is %zd bytes but it is smaller than the expected length (%zu bytes). This is a programming error."), a3, v8);
  return objc_msgSend(*(id *)(a1 + 40), "encodeBytes:length:forKey:", a2, a3, CFSTR("dataPointer"));
}

void __42__MLMultiArray_initWithPixelBuffer_shape___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (a3 + 1 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = objc_msgSend(v8, "unsignedIntValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  else
  {
    v5 = objc_msgSend(v8, "unsignedIntValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(_QWORD *)(v6 + 24) * v5;
  }
  *(_QWORD *)(v6 + 24) = v7;

}

- (uint64_t)initWithBytesNoCopy:(uint64_t)a1 shape:(uint64_t)a2 dataType:strides:deallocator:mutableShapedBufferProvider:error:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z105-[MLMultiArray initWithBytesNoCopy:shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:]E3$_0"))
  {
    return a1 + 32;
  }
  else
  {
    return 0;
  }
}

+ (id)stringForDataType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Float16");
  if (a3 == 65568)
    v3 = CFSTR("Float32");
  if (a3 == 65600)
    v3 = CFSTR("Double");
  if (a3 == 131104)
    return CFSTR("Int32");
  else
    return (id)v3;
}

- (id)sliceAtOrigin:(id)a3 shape:(id)a4 squeeze:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = -[MLMultiArrayView initSlicingMultiArray:origin:shape:squeeze:error:]([MLMultiArrayView alloc], "initSlicingMultiArray:origin:shape:squeeze:error:", self, v10, v11, v7, a6);

  return v12;
}

- (id)squeeze
{
  return -[MLMultiArrayView initSqueezingMultiArray:dimensions:error:]([MLMultiArrayView alloc], "initSqueezingMultiArray:dimensions:error:", self, 0, 0);
}

- (id)squeezeDimensions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[MLMultiArrayView initSqueezingMultiArray:dimensions:error:]([MLMultiArrayView alloc], "initSqueezingMultiArray:dimensions:error:", self, v6, a4);

  return v7;
}

- (id)multiArrayViewExpandingDimensionsAtAxis:(int64_t)a3
{
  return -[MLMultiArrayView initExpandingDimensionsOfMultiArray:axis:]([MLMultiArrayView alloc], "initExpandingDimensionsOfMultiArray:axis:", self, a3);
}

- (MLMultiArray)initWithShape:(id)a3 dataType:(int64_t)a4 storageOrder:(int64_t)a5 bufferAlignment:(unint64_t)a6
{
  int v8;
  id v11;
  MLMultiArray *v12;
  MLMultiArray *v13;
  int v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t value;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  MLMultiArray *v25;
  void *__p;
  void *v28;
  objc_super v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;

  v8 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MLMultiArray;
  v12 = -[MLMultiArray init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shape, a3);
    v14 = +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", a5);
    v15 = (std::__shared_weak_count *)operator new(0x88uLL);
    v15->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    v15->__shared_weak_owners_ = 0;
    v15->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BD48;
    CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v15[1], (unint64_t **)&__p, v8, v14, a6);
    v30 = v15 + 1;
    v31 = v15;
    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }
    v17 = operator new();
    v18 = v17;
    __p = &v15[1];
    v28 = v15;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
    StorageManager::StorageManager(v17, &__p);
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    value = (uint64_t)v13->_storageManager.__ptr_.__value_;
    v13->_storageManager.__ptr_.__value_ = (StorageManager *)v18;
    if (value)
      std::default_delete<StorageManager>::operator()[abi:ne180100](value);
    v22 = v31;
    if (v31)
    {
      v23 = (unint64_t *)&v31->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  v25 = v13;

  return v25;
}

- (MLMultiArray)initWithBytesNoCopy:(void *)a3 shape:(id)a4 dataType:(int64_t)a5 strides:(id)a6 mutableShapedBufferProvider:(id)a7
{
  return -[MLMultiArray initWithBytesNoCopy:shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:](self, "initWithBytesNoCopy:shape:dataType:strides:deallocator:mutableShapedBufferProvider:error:", a3, a4, a5, a6, 0, a7, 0);
}

- (MLMultiArray)initWithArray:(id)a3 dataType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  unint64_t *v18;
  unint64_t v19;
  MLMultiArray *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  int64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  void *__p[3];
  id v47;
  _QWORD v48[4];
  id v49;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  v47 = 0;
  objc_msgSend((id)objc_opt_class(), "_shapeOfNestedArray:error:", v6, &v47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v47;
  v34 = v9;
  if (!v8)
  {
    v31 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v9, "localizedDescription", v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v32, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v33);
  }
  std::allocate_shared[abi:ne180100]<CoreML::MultiArrayBuffer,std::allocator<CoreML::MultiArrayBuffer>,std::vector<unsigned long> &,CoreML::ScalarType &,CoreML::StorageOrder &,int,void>(&v44, (unint64_t **)__p, a4, +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", 0), 1);
  v10 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3321888768;
  v38[2] = __60__MLMultiArray_PrivateConstruction__initWithArray_dataType___block_invoke;
  v38[3] = &unk_1E3D5C8D8;
  v11 = v44;
  v12 = v45;
  v41 = v44;
  v42 = v45;
  if (v45)
  {
    p_shared_owners = (unint64_t *)&v45->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = v8;
  v39 = v15;
  v16 = v6;
  v40 = v16;
  v43 = a4;
  v17 = v38;
  v48[0] = v10;
  v48[1] = 3221225472;
  v48[2] = ___ZN6CoreML16MultiArrayBuffer26getMutableBytesWithHandlerEU13block_pointerFvPvmE_block_invoke;
  v48[3] = &unk_1E3D64FB0;
  v49 = v17;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v11, v48);

  v36 = v11;
  v37 = v12;
  if (v12)
  {
    v18 = (unint64_t *)&v12->__shared_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v20 = -[MLMultiArray initWithMultiArrayBuffer:](self, "initWithMultiArrayBuffer:", &v36, v34);
  v21 = v37;
  if (v37)
  {
    v22 = (unint64_t *)&v37->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  v24 = v42;
  if (v42)
  {
    v25 = (unint64_t *)&v42->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v45;
  if (v45)
  {
    v28 = (unint64_t *)&v45->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  objc_autoreleasePoolPop(v7);
  return v20;
}

- (MLMultiArray)initWithScalars:(id)a3 shape:(id)a4 dataType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  id v22;
  id v23;
  _QWORD *v24;
  unint64_t *v25;
  unint64_t v26;
  MLMultiArray *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *context;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  int64_t v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  void *__p[3];
  _BYTE buf[24];
  void *v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  context = (void *)MEMORY[0x1A1AD6ED8]();
  if (!objc_msgSend(v9, "count"))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "shape is nil or empty.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("shape is nil or empty."));
  }
  std::allocate_shared[abi:ne180100]<CoreML::MultiArrayBuffer,std::allocator<CoreML::MultiArrayBuffer>,std::vector<unsigned long> &,CoreML::ScalarType &,CoreML::StorageOrder &,int,void>(&v50, (unint64_t **)__p, a5, +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", 0), 1);
  v11 = objc_msgSend(v8, "count");
  v12 = v50;
  if (v11 != *(_QWORD *)(v50 + 80))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" x "));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(_QWORD *)(v12 + 80);
      v40 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2048;
      v54 = (void *)v40;

    }
    v14 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" x "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(v12 + 80);
    v17 = objc_msgSend(v8, "count");

  }
  v18 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3321888768;
  v44[2] = __68__MLMultiArray_PrivateConstruction__initWithScalars_shape_dataType___block_invoke;
  v44[3] = &unk_1E3D5C8D8;
  v19 = v51;
  v47 = v12;
  v48 = v51;
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
  }
  v22 = v9;
  v45 = v22;
  v23 = v8;
  v46 = v23;
  v49 = a5;
  v24 = v44;
  *(_QWORD *)buf = v18;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN6CoreML16MultiArrayBuffer26getMutableBytesWithHandlerEU13block_pointerFvPvmE_block_invoke;
  v54 = &unk_1E3D64FB0;
  v55 = v24;
  CoreML::MultiArrayBuffer::getBytesWithHandler(v12, buf);

  v42 = v12;
  v43 = v19;
  if (v19)
  {
    v25 = (unint64_t *)&v19->__shared_owners_;
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  v27 = -[MLMultiArray initWithMultiArrayBuffer:](self, "initWithMultiArrayBuffer:", &v42);
  v28 = v43;
  if (v43)
  {
    v29 = (unint64_t *)&v43->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }

  v31 = v48;
  if (v48)
  {
    v32 = (unint64_t *)&v48->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v51;
  if (v51)
  {
    v35 = (unint64_t *)&v51->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  objc_autoreleasePoolPop(context);

  return v27;
}

- (MLMultiArray)initWithPixelBuffer:(__CVBuffer *)a3 shape:(id)a4 strides:(id)a5
{
  return -[MLMultiArray initWithPixelBuffer:shape:strides:mutableShapedBufferProvider:](self, "initWithPixelBuffer:shape:strides:mutableShapedBufferProvider:", a3, a4, a5, 0);
}

- (MLMultiArray)initWithPixelBuffer:(__CVBuffer *)a3 shape:(id)a4 strides:(id)a5 mutableShapedBufferProvider:(id)a6
{
  id v9;
  OSType PixelFormatType;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  MLMultiArrayBufferLayout *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MLMultiArrayBufferLayout *v26;
  MLMultiArrayBufferLayout *v27;
  NSObject *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  MLMultiArray *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  id v41;
  id v42;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  void *__p[4];
  std::__shared_weak_count *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE buf[22];
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v41 = a4;
  v9 = a5;
  v42 = a6;
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("pixelBuffer must not be NULL."));
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226536)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v12 = HIBYTE(PixelFormatType);
      *(_DWORD *)&buf[4] = HIBYTE(PixelFormatType);
      v13 = BYTE2(PixelFormatType);
      *(_WORD *)&buf[8] = 1024;
      v15 = BYTE1(PixelFormatType);
      v14 = PixelFormatType;
      *(_DWORD *)&buf[10] = BYTE2(PixelFormatType);
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = BYTE1(PixelFormatType);
      *(_WORD *)&buf[20] = 1024;
      v50 = PixelFormatType;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "The pixel format type must be kCVPixelFormatType_OneComponent16Half. (%c%c%c%c is specified.)", buf, 0x1Au);
    }
    else
    {
      v12 = HIBYTE(PixelFormatType);
      v13 = BYTE2(PixelFormatType);
      v14 = PixelFormatType;
      v15 = BYTE1(PixelFormatType);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The pixel format type must be kCVPixelFormatType_OneComponent16Half. (%c%c%c%c is specified.)"), v12, v13, v15, v14);
  }
  if (!CVPixelBufferGetIOSurface(a3))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "The pixel buffer must use IOSurface.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The pixel buffer must use IOSurface."));
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v20 = [MLMultiArrayBufferLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Height);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", BytesPerRow >> 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v24;
  v47[1] = &unk_1E3DA1ED0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MLMultiArrayBufferLayout initWithShape:strides:](v20, "initWithShape:strides:", v23, v25);

  v27 = -[MLMultiArrayBufferLayout initWithShape:strides:]([MLMultiArrayBufferLayout alloc], "initWithShape:strides:", v41, v9);
  if (!-[MLMultiArrayBufferLayout isSubspaceOfBufferLayout:](v27, "isSubspaceOfBufferLayout:", v26))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      _os_log_error_impl(&dword_19C486000, v28, OS_LOG_TYPE_ERROR, "The pixel buffer's buffer layout (%@) cannot support the requested MLMultiArray buffer layout (%@).", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The pixel buffer's buffer layout (%@) cannot support the requested MLMultiArray buffer layout (%@)."), v26, v27);
  }
  CoreML::numericVectorFromObjC<unsigned long>((uint64_t)buf, v41);
  CoreML::numericVectorFromObjC<unsigned long>((uint64_t)__p, v9);
  v29 = (std::__shared_weak_count *)operator new(0x88uLL);
  v29->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v29->__shared_owners_;
  v29->__shared_weak_owners_ = 0;
  v29->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BD48;
  CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v29[1], a3, (uint64_t)buf, (uint64_t)__p);
  __p[3] = &v29[1];
  v46 = v29;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  v43 = &v29[1].__vftable;
  v44 = v29;
  do
    v31 = __ldxr(p_shared_owners);
  while (__stxr(v31 + 1, p_shared_owners));
  v32 = -[MLMultiArray initWithMultiArrayBuffer:mutableShapedBufferProvider:](self, "initWithMultiArrayBuffer:mutableShapedBufferProvider:", &v43, v42);
  v33 = v44;
  if (v44)
  {
    v34 = (unint64_t *)&v44->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = v46;
  if (v46)
  {
    v37 = (unint64_t *)&v46->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  return v32;
}

void __68__MLMultiArray_PrivateConstruction__initWithScalars_shape_dataType___block_invoke(uint64_t a1, NSArray *a2, uint64_t a3)
{
  MLMultiArrayBufferLayout *v6;
  MLMultiArrayDataType v7;
  id v8;

  CoreML::numericArrayToObjC<std::vector<unsigned long>,unsigned long>((_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[MLMultiArrayBufferLayout initWithShape:strides:]([MLMultiArrayBufferLayout alloc], "initWithShape:strides:", *(_QWORD *)(a1 + 32), v8);

}

void __60__MLMultiArray_PrivateConstruction__initWithArray_dataType___block_invoke(uint64_t a1, NSArray *a2, uint64_t a3)
{
  MLMultiArrayBufferLayout *v6;
  MLMultiArrayDataType v7;
  id v8;

  CoreML::numericArrayToObjC<std::vector<unsigned long>,unsigned long>((_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[MLMultiArrayBufferLayout initWithShape:strides:]([MLMultiArrayBufferLayout alloc], "initWithShape:strides:", *(_QWORD *)(a1 + 32), v8);

}

- (BOOL)fillWithNumber:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MLMultiArray_Filling__fillWithNumber___block_invoke;
  v7[3] = &unk_1E3D65108;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  -[MLMultiArray getMutableBytesWithHandler:](self, "getMutableBytesWithHandler:", v7);

  return 1;
}

- (BOOL)setRangeWithRawData:(id)a3 destIndex:(unint64_t)a4 error:(id *)a5
{
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  char v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD v31[3];
  _QWORD *v32;
  std::__shared_weak_count *v33;
  _QWORD *v34;
  _BYTE v35[112];
  uint64_t v36;
  std::__shared_weak_count *v37;

  v8 = (uint64_t *)a3;
  StorageManager::mutableStorage((StorageManager *)&v36, (uint64_t)self->_storageManager.__ptr_.__value_);
  v9 = objc_msgSend(v8, "count");
  if ((uint64_t)(v9 + a4) > -[MLMultiArray count](self, "count"))
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("setRangeWithRawData: range out of bounds."));
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  v11 = v36;
  v12 = *(_QWORD *)(v11 + 32) - *(_QWORD *)(v11 + 24);
  if (v12 != 8)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v12 >> 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("setRangeWithRawData: non-contiguous %@d destination unsupported"), v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_23;
  }
  v13 = **(_QWORD **)(v36 + 48);
  v14 = CoreML::MultiArrayBuffer::offsetForIndex(v36, a4);
  v15 = *(_DWORD *)(v11 + 72);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v32, v11);
  v17 = (uint64_t)v32;
  v16 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v20 = operator new(8uLL);
  *v20 = v9;
  v33 = (std::__shared_weak_count *)(v20 + 1);
  v34 = v20 + 1;
  v32 = v20;
  v21 = operator new(8uLL);
  *v21 = v13;
  v31[1] = v21 + 1;
  v31[2] = v21 + 1;
  v31[0] = v21;
  CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)v35, v17 + v14 * ((unsigned __int16)v15 >> 3), (uint64_t)&v32, (uint64_t)v31, *(_DWORD *)(v36 + 72));
  operator delete(v21);
  operator delete(v20);
  StorageManager::storage((StorageManager *)&v32, v8[1]);
  v10 = CoreML::MultiArrayBuffer::vectorizeInto((uint64_t)v32, (uint64_t)v35, 0);
  v22 = v33;
  if (v33)
  {
    v23 = (unint64_t *)&v33->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (a5)
    v25 = v10;
  else
    v25 = 1;
  if ((v25 & 1) == 0)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("setRangeWithRawData: failed to vectorize source"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)v35);
LABEL_24:
  v27 = v37;
  if (v37)
  {
    v28 = (unint64_t *)&v37->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  return v10;
}

- (id)numberArray
{
  return -[MLMultiArrayAsNSArrayWrapper initWrappingMultiArray:]([MLMultiArrayAsNSArrayWrapper alloc], "initWrappingMultiArray:", self);
}

void __40__MLMultiArray_Filling__fillWithNumber___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  MLMultiArrayBufferLayout *v6;
  void *v7;
  MLMultiArrayBufferLayout *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _DWORD *v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  _DWORD *v19;
  unint64_t v20;
  uint64_t v21;
  _WORD *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  id v34;
  uint64_t v35;

  v34 = a4;
  v6 = [MLMultiArrayBufferLayout alloc];
  objc_msgSend(*(id *)(a1 + 32), "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MLMultiArrayBufferLayout initWithShape:strides:](v6, "initWithShape:strides:", v7, v34);

  v9 = -[MLMultiArrayBufferLayout count](v8, "count");
  if (v9 >= 1)
  {
    for (i = 0; i < v9; i += v35)
    {
      v35 = 0;
      v11 = -[MLMultiArrayBufferLayout offsetOfScalarAtIndex:contiguousScalars:](v8, "offsetOfScalarAtIndex:contiguousScalars:", i, &v35, v34);
      v12 = objc_msgSend(*(id *)(a1 + 32), "dataType");
      if (v12 > 65599)
      {
        if (v12 == 65600)
        {
          v30 = v35;
          objc_msgSend(*(id *)(a1 + 40), "doubleValue");
          if (v30 >= 1)
          {
            v32 = (_QWORD *)(a2 + 8 * v11);
            v33 = v30 + 1;
            do
            {
              *v32++ = v31;
              --v33;
            }
            while (v33 > 1);
          }
        }
        else if (v12 == 131104)
        {
          v17 = v35;
          v18 = objc_msgSend(*(id *)(a1 + 40), "intValue");
          if (v17 >= 1)
          {
            v19 = (_DWORD *)(a2 + 4 * v11);
            v20 = v17 + 1;
            do
            {
              *v19++ = v18;
              --v20;
            }
            while (v20 > 1);
          }
        }
      }
      else if (v12 == 65552)
      {
        v21 = v35;
        objc_msgSend(*(id *)(a1 + 40), "floatValue");
        if (v21 >= 1)
        {
          __asm { FCVT            H0, S0 }
          v28 = (_WORD *)(a2 + 2 * v11);
          v29 = v21 + 1;
          do
          {
            *v28++ = _H0;
            --v29;
          }
          while (v29 > 1);
        }
      }
      else if (v12 == 65568)
      {
        v13 = v35;
        objc_msgSend(*(id *)(a1 + 40), "floatValue");
        if (v13 >= 1)
        {
          v15 = (_DWORD *)(a2 + 4 * v11);
          v16 = v13 + 1;
          do
          {
            *v15++ = v14;
            --v16;
          }
          while (v16 > 1);
        }
      }
    }
  }

}

- (void)transferToMultiArray:(id)a3
{
  -[MLMultiArray copyIntoMultiArray:error:](self, "copyIntoMultiArray:error:", a3, 0);
}

- (BOOL)vectorizeIntoMultiArray:(id)a3 storageOrder:(int64_t)a4 error:(id *)a5
{
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v8 = (uint64_t *)a3;
  v9 = kdebug_trace();
  v10 = (void *)MEMORY[0x1A1AD6ED8](v9);
  StorageManager::storage((StorageManager *)&v23, (uint64_t)self->_storageManager.__ptr_.__value_);
  StorageManager::mutableStorage((StorageManager *)&v21, v8[1]);
  v11 = CoreML::MultiArrayBuffer::vectorizeInto(v23, v21, +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", a4));
  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Unable to vectorize %@ into %@"), self, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v24;
  if (v24)
  {
    v17 = (unint64_t *)&v24->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  objc_autoreleasePoolPop(v10);
  if (a5)
    v19 = v11;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
    *a5 = objc_retainAutorelease(v12);

  kdebug_trace();
  return v11;
}

- (BOOL)isContiguous
{
  __n128 v2;
  std::__shared_weak_count *v3;
  __int16 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2.n128_f64[0] = StorageManager::storage((StorageManager *)&v8, (uint64_t)self->_storageManager.__ptr_.__value_);
  v3 = v9;
  v4 = *(_WORD *)(v8 + 88);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v3->__on_zero_shared)(v3, v2);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return (v4 & 3) != 0;
}

- (BOOL)isContiguousInOrder:(int64_t)a3
{
  double v4;
  uint64_t v5;
  int v6;
  int v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  int v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = StorageManager::storage((StorageManager *)&v13, (uint64_t)self->_storageManager.__ptr_.__value_);
  v5 = v13;
  v6 = +[MLMultiArray cppStorageOrder:](MLMultiArray, "cppStorageOrder:", a3, v4);
  v7 = *(unsigned __int16 *)(v5 + 88);
  v8 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v6)
    v11 = 2;
  else
    v11 = 1;
  return (v11 & v7) != 0;
}

- (BOOL)isEqual:(id)a3
{
  MLMultiArray *v4;
  BOOL v5;

  v4 = (MLMultiArray *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MLMultiArray isEqualToMultiArray:](self, "isEqualToMultiArray:", v4);
  }

  return v5;
}

- (BOOL)isEqualToMultiArray:(id)a3
{
  BOOL v3;
  uint64_t *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  __int16 v13;
  __int16 v14;
  void *v15;
  void *v16;
  __int16 v17;
  __int16 v18;
  void *v19;
  void *v20;
  __int16 v21;
  __int16 v22;
  void *v23;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  __int16 v32;
  __int16 v33;
  uint64_t v42;
  std::__shared_weak_count *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  _BYTE v46[112];
  double *v47;
  void *__p;
  void *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  double *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  void *v60;
  uint64_t *v61;
  uint64_t v62;
  double *v63;
  void *v64;
  void *v65;
  _BYTE *v66;
  _BYTE *v67;
  uint64_t v68;
  void *v69;
  _BYTE *v70;
  uint64_t v71;

  v5 = (uint64_t *)a3;
  StorageManager::storage((StorageManager *)&v44, (uint64_t)self->_storageManager.__ptr_.__value_);
  v6 = v44;
  v7.n128_f64[0] = StorageManager::storage((StorageManager *)&v42, v5[1]);
  v8 = v42;
  v9 = *(_DWORD *)(v42 + 72);
  if (v9 != *(_DWORD *)(v6 + 72))
  {
    v3 = 0;
    goto LABEL_44;
  }
  if (v9 > 65599)
  {
    if (v9 != 131104)
    {
      if (v9 != 65600)
        goto LABEL_44;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v69, *(const void **)(v6 + 24), *(_QWORD *)(v6 + 32), (uint64_t)(*(_QWORD *)(v6 + 32) - *(_QWORD *)(v6 + 24)) >> 3);
      v66 = 0;
      v67 = 0;
      v68 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v66, *(const void **)(v8 + 24), *(_QWORD *)(v8 + 32), (uint64_t)(*(_QWORD *)(v8 + 32) - *(_QWORD *)(v8 + 24)) >> 3);
      v15 = v69;
      v16 = v70;
      v12 = v66;
      if (v70 - (_BYTE *)v69 == v67 - v66)
      {
        if (!memcmp(v69, v66, v70 - (_BYTE *)v69))
        {
          if (v16 != v15)
          {
            v17 = *(_WORD *)(v6 + 88);
            if ((v17 & 3) != 0)
            {
              v18 = (v17 & 1) != 0 ? 1 : 2;
              if (((unsigned __int16)v18 & *(_WORD *)(v8 + 88)) != 0)
              {
                v50 = 0;
                v51 = &v50;
                v52 = 0x2000000000;
                v53 = 1;
                v57 = MEMORY[0x1E0C809B0];
                v58 = 0x40000000;
                v59 = ___ZN6CoreMLL14equalalityTestIdEEbRKNS_16MultiArrayBufferES3__block_invoke;
                v60 = &unk_1E3D65EA8;
                v61 = &v50;
                v62 = v8;
                CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v57);
                goto LABEL_62;
              }
            }
            CoreML::MultiArrayIterator<double>::MultiArrayIterator((uint64_t)&v57, v6, 0, 1);
            CoreML::MultiArrayIterator<double>::MultiArrayIterator((uint64_t)&v50, v6, 1, 0);
            CoreML::MultiArrayIterator<double>::MultiArrayIterator((uint64_t)v46, v8, 0, 1);
            while (v63 != v54)
            {
              v3 = *v63 == *v47;
              if (*v63 != *v47)
                goto LABEL_81;
              CoreML::MultiArrayIterator<double>::operator++((uint64_t)&v57);
              CoreML::MultiArrayIterator<double>::operator++((uint64_t)v46);
            }
            goto LABEL_80;
          }
          goto LABEL_63;
        }
LABEL_37:
        v3 = 0;
        goto LABEL_38;
      }
LABEL_40:
      v3 = 0;
      if (!v12)
        goto LABEL_42;
      goto LABEL_41;
    }
    v69 = 0;
    v70 = 0;
    v71 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v69, *(const void **)(v6 + 24), *(_QWORD *)(v6 + 32), (uint64_t)(*(_QWORD *)(v6 + 32) - *(_QWORD *)(v6 + 24)) >> 3);
    v66 = 0;
    v67 = 0;
    v68 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v66, *(const void **)(v8 + 24), *(_QWORD *)(v8 + 32), (uint64_t)(*(_QWORD *)(v8 + 32) - *(_QWORD *)(v8 + 24)) >> 3);
    v23 = v69;
    v24 = v70;
    v12 = v66;
    if (v70 - (_BYTE *)v69 != v67 - v66)
      goto LABEL_40;
    if (memcmp(v69, v66, v70 - (_BYTE *)v69))
      goto LABEL_37;
    if (v24 == v23)
      goto LABEL_63;
    v32 = *(_WORD *)(v6 + 88);
    if ((v32 & 3) != 0)
    {
      v33 = (v32 & 1) != 0 ? 1 : 2;
      if (((unsigned __int16)v33 & *(_WORD *)(v8 + 88)) != 0)
      {
        v50 = 0;
        v51 = &v50;
        v52 = 0x2000000000;
        v53 = 1;
        v57 = MEMORY[0x1E0C809B0];
        v58 = 0x40000000;
        v59 = ___ZN6CoreMLL14equalalityTestIiEEbRKNS_16MultiArrayBufferES3__block_invoke;
        v60 = &unk_1E3D65F48;
        v61 = &v50;
        v62 = v8;
        CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v57);
        goto LABEL_62;
      }
    }
    CoreML::MultiArrayIterator<int>::MultiArrayIterator((uint64_t)&v57, v6, 0, 1);
    CoreML::MultiArrayIterator<int>::MultiArrayIterator((uint64_t)&v50, v6, 1, 0);
    CoreML::MultiArrayIterator<int>::MultiArrayIterator((uint64_t)v46, v8, 0, 1);
    while (v63 != v54)
    {
      v3 = *(_DWORD *)v63 == *(_DWORD *)v47;
      if (*(_DWORD *)v63 != *(_DWORD *)v47)
        goto LABEL_81;
      CoreML::MultiArrayIterator<float>::operator++((uint64_t)&v57);
      CoreML::MultiArrayIterator<float>::operator++((uint64_t)v46);
    }
  }
  else
  {
    if (v9 != 65552)
    {
      if (v9 != 65568)
        goto LABEL_44;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v69, *(const void **)(v6 + 24), *(_QWORD *)(v6 + 32), (uint64_t)(*(_QWORD *)(v6 + 32) - *(_QWORD *)(v6 + 24)) >> 3);
      v66 = 0;
      v67 = 0;
      v68 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v66, *(const void **)(v8 + 24), *(_QWORD *)(v8 + 32), (uint64_t)(*(_QWORD *)(v8 + 32) - *(_QWORD *)(v8 + 24)) >> 3);
      v10 = v69;
      v11 = v70;
      v12 = v66;
      if (v70 - (_BYTE *)v69 == v67 - v66)
      {
        if (!memcmp(v69, v66, v70 - (_BYTE *)v69))
        {
          if (v11 != v10)
          {
            v13 = *(_WORD *)(v6 + 88);
            if ((v13 & 3) != 0)
            {
              v14 = (v13 & 1) != 0 ? 1 : 2;
              if (((unsigned __int16)v14 & *(_WORD *)(v8 + 88)) != 0)
              {
                v50 = 0;
                v51 = &v50;
                v52 = 0x2000000000;
                v53 = 1;
                v57 = MEMORY[0x1E0C809B0];
                v58 = 0x40000000;
                v59 = ___ZN6CoreMLL14equalalityTestIfEEbRKNS_16MultiArrayBufferES3__block_invoke;
                v60 = &unk_1E3D65EF8;
                v61 = &v50;
                v62 = v8;
                CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v57);
LABEL_62:
                v3 = *((_BYTE *)v51 + 24) != 0;
                _Block_object_dispose(&v50, 8);
                goto LABEL_38;
              }
            }
            CoreML::MultiArrayIterator<float>::MultiArrayIterator((uint64_t)&v57, v6, 0, 1);
            CoreML::MultiArrayIterator<float>::MultiArrayIterator((uint64_t)&v50, v6, 1, 0);
            CoreML::MultiArrayIterator<float>::MultiArrayIterator((uint64_t)v46, v8, 0, 1);
            while (v63 != v54)
            {
              v3 = *(float *)v63 == *(float *)v47;
              if (*(float *)v63 != *(float *)v47)
                goto LABEL_81;
              CoreML::MultiArrayIterator<float>::operator++((uint64_t)&v57);
              CoreML::MultiArrayIterator<float>::operator++((uint64_t)v46);
            }
            goto LABEL_80;
          }
LABEL_63:
          v3 = 1;
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    v69 = 0;
    v70 = 0;
    v71 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v69, *(const void **)(v6 + 24), *(_QWORD *)(v6 + 32), (uint64_t)(*(_QWORD *)(v6 + 32) - *(_QWORD *)(v6 + 24)) >> 3);
    v66 = 0;
    v67 = 0;
    v68 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v66, *(const void **)(v8 + 24), *(_QWORD *)(v8 + 32), (uint64_t)(*(_QWORD *)(v8 + 32) - *(_QWORD *)(v8 + 24)) >> 3);
    v19 = v69;
    v20 = v70;
    v12 = v66;
    if (v70 - (_BYTE *)v69 != v67 - v66)
      goto LABEL_40;
    if (memcmp(v69, v66, v70 - (_BYTE *)v69))
      goto LABEL_37;
    if (v20 == v19)
      goto LABEL_63;
    v21 = *(_WORD *)(v6 + 88);
    if ((v21 & 3) != 0)
    {
      v22 = (v21 & 1) != 0 ? 1 : 2;
      if (((unsigned __int16)v22 & *(_WORD *)(v8 + 88)) != 0)
      {
        v50 = 0;
        v51 = &v50;
        v52 = 0x2000000000;
        v53 = 1;
        v57 = MEMORY[0x1E0C809B0];
        v58 = 0x40000000;
        v59 = ___ZN6CoreMLL14equalalityTestIDF16_EEbRKNS_16MultiArrayBufferES3__block_invoke;
        v60 = &unk_1E3D65F98;
        v61 = &v50;
        v62 = v8;
        CoreML::MultiArrayBuffer::getBytesWithHandler(v6, &v57);
        goto LABEL_62;
      }
    }
    _ZN6CoreML18MultiArrayIteratorIDF16_EC2ERKNS_16MultiArrayBufferENS_12StorageOrderEb((uint64_t)&v57, v6, 0, 1);
    _ZN6CoreML18MultiArrayIteratorIDF16_EC2ERKNS_16MultiArrayBufferENS_12StorageOrderEb((uint64_t)&v50, v6, 1, 0);
    _ZN6CoreML18MultiArrayIteratorIDF16_EC2ERKNS_16MultiArrayBufferENS_12StorageOrderEb((uint64_t)v46, v8, 0, 1);
    while (v63 != v54)
    {
      _H0 = *(_WORD *)v63;
      _H1 = *(_WORD *)v47;
      __asm
      {
        FCVT            S1, H1
        FCVT            S0, H0
      }
      v3 = _S0 == _S1;
      if (_S0 != _S1)
        goto LABEL_81;
      _ZN6CoreML18MultiArrayIteratorIDF16_EppEv((uint64_t)&v57);
      _ZN6CoreML18MultiArrayIteratorIDF16_EppEv((uint64_t)v46);
    }
  }
LABEL_80:
  v3 = 1;
LABEL_81:
  if (__p)
  {
    v49 = __p;
    operator delete(__p);
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)v46);
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)&v50);
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)&v57);
LABEL_38:
  v12 = v66;
  if (v66)
  {
LABEL_41:
    v67 = v12;
    operator delete(v12);
  }
LABEL_42:
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
LABEL_44:
  v25 = v43;
  if (v43)
  {
    p_shared_owners = (unint64_t *)&v43->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v25->__on_zero_shared)(v25, v7);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v45;
  if (v45)
  {
    v29 = (unint64_t *)&v45->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v28->__on_zero_shared)(v28, v7);
      std::__shared_weak_count::__release_weak(v28);
    }
  }

  return v3;
}

- (double)doublePointer
{
  double *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  double *v12;
  std::__shared_weak_count *v13;

  StorageManager::mutableStorage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v12, v10);
  v2 = v12;
  v3 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v2;
}

- (float)float32Pointer
{
  float *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  float *v12;
  std::__shared_weak_count *v13;

  StorageManager::mutableStorage((StorageManager *)&v10, (uint64_t)self->_storageManager.__ptr_.__value_);
  CoreML::MultiArrayBuffer::loadBuffer((CoreML::MultiArrayBuffer *)&v12, v10);
  v2 = v12;
  v3 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v2;
}

+ (BOOL)validateNestedArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  v11 = 0;
  objc_msgSend(a1, "_shapeOfNestedArray:error:", v6, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  objc_autoreleasePoolPop(v7);
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8 != 0;
}

+ (id)_shapeOfNestedArray:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2378;
  v21 = __Block_byref_object_dispose__2379;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke;
  v13[3] = &unk_1E3D65028;
  v16 = &v17;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  if (v18[5])
    v10 = 0;
  else
    v10 = v8;
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;

  v25 = a2;
  if (!objc_msgSend(v25, "count"))
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Empty dimension was found at axis %tu."), a3);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") != a3)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);

  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", objc_opt_class(), a3);

  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("The element type is neither NSArray nor NSNumber at axis %tu."), a3);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");
  v17 = objc_msgSend(v25, "count");

  if (v16 != v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Dimension mismatch at axis %tu; some have %tu element(s) but others have %tu element(s)."),
      a3,
      objc_msgSend(v21, "integerValue"),
      objc_msgSend(v25, "count"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    goto LABEL_13;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke_2;
  v26[3] = &unk_1E3D65000;
  v27 = *(id *)(a1 + 40);
  v28 = a3;
  if (objc_msgSend(v25, "indexOfObjectPassingTest:", v26) != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Invalid element type at axis %tu."), a3);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *a4 = 1;
  }

LABEL_14:
}

BOOL __63__MLMultiArray_PrivateConstruction___shapeOfNestedArray_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return (a1 & 1) == 0;
}

+ (id)doubleMultiArrayWithCopyOfMultiArray:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithShape:dataType:error:", v6, 65600, 0);

  objc_msgSend(v4, "copyIntoMultiArray:error:", v7, 0);
  return v7;
}

+ (id)doubleMultiArrayWithShape:(id)a3 valueArray:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MLMultiArray *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", v7, 65600, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "count");
    if (v10 == -[MLMultiArray count](v9, "count"))
    {
      if (!-[MLMultiArray isContiguousInOrder:](v9, "isContiguousInOrder:", 0))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[MLMultiArray initWithShape:dataType:error:] was supposed to use first-major contiguous memory layout, but it doesn't."));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke;
      v14[3] = &unk_1E3D65070;
      v15 = v8;
      -[MLMultiArray getMutableBytesWithHandler:](v9, "getMutableBytesWithHandler:", v14);
      a5 = v9;
      v11 = v15;
      goto LABEL_9;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MLMultiArray count](v9, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("value count (%@) does not match array count (%@)"), v11, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
LABEL_9:

    }
  }
  else
  {
    a5 = 0;
  }

  return a5;
}

+ (BOOL)getShapeOfArrayOfSameLengthArrays:(id)a3 numberOfRows:(unint64_t *)a4 numberOfColumns:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  unint64_t v10;
  char v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v9 = a3;
  v10 = objc_msgSend(v9, "count");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2378;
  v18 = __Block_byref_object_dispose__2379;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__MLMultiArray_ConvenientConstruction__getShapeOfArrayOfSameLengthArrays_numberOfRows_numberOfColumns_error___block_invoke;
  v13[3] = &unk_1E3D650B8;
  v13[4] = &v20;
  v13[5] = &v14;
  v13[6] = &v24;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
  if (a4)
    *a4 = v10;
  if (a5)
    *a5 = v21[3];
  if (a6)
    *a6 = objc_retainAutorelease((id)v15[5]);
  v11 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

+ (id)doubleMatrixWithValues:(id)a3 error:(id *)a4
{
  MLMultiArray *v6;
  void *v7;
  void *v8;
  void *v9;
  MLMultiArray *v10;
  double *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MLMultiArray *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = 0;
  v24 = a3;
  if ((objc_msgSend(a1, "getShapeOfArrayOfSameLengthArrays:numberOfRows:numberOfColumns:error:") & 1) != 0)
  {
    v6 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v6, "initWithShape:dataType:storageOrder:error:", v9, 65600, 0, a4);

    if (v10)
    {
      v11 = -[MLMultiArray doublePointer](v10, "doublePointer");
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v24;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v30;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v26;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v26 != v19)
                    objc_enumerationMutation(v17);
                  objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "doubleValue");
                  *(_QWORD *)v11++ = v21;
                  ++v20;
                }
                while (v18 != v20);
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
              }
              while (v18);
            }

            ++v15;
          }
          while (v15 != v13);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v13);
      }

      v22 = v10;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)float32MatrixWithValues:(id)a3 error:(id *)a4
{
  MLMultiArray *v6;
  void *v7;
  void *v8;
  void *v9;
  MLMultiArray *v10;
  float *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  MLMultiArray *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = 0;
  v24 = a3;
  if ((objc_msgSend(a1, "getShapeOfArrayOfSameLengthArrays:numberOfRows:numberOfColumns:error:") & 1) != 0)
  {
    v6 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v6, "initWithShape:dataType:storageOrder:error:", v9, 65568, 0, a4);

    if (v10)
    {
      v11 = -[MLMultiArray float32Pointer](v10, "float32Pointer");
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v24;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v30;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v26;
              do
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v26 != v19)
                    objc_enumerationMutation(v17);
                  objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "floatValue");
                  *(_DWORD *)v11++ = v21;
                  ++v20;
                }
                while (v18 != v20);
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
              }
              while (v18);
            }

            ++v15;
          }
          while (v15 != v13);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v13);
      }

      v22 = v10;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __109__MLMultiArray_ConvenientConstruction__getShapeOfArrayOfSameLengthArrays_numberOfRows_numberOfColumns_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = objc_msgSend(v13, "count");
  v8 = *(_QWORD *)(a1[4] + 8);
  if (a3)
  {
    v9 = *(_QWORD *)(v8 + 24);
    if (v9 != v7)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("The array of array is not a matrix: some row's length is %lu, but another row's length is %lu"), v9, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[5] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    *(_QWORD *)(v8 + 24) = v7;
  }

}

uint64_t __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke_2;
  v4[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
  v4[4] = a2;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

void __83__MLMultiArray_ConvenientConstruction__doubleMultiArrayWithShape_valueArray_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3) = v5;

}

+ (BOOL)validateMultiArrays:(id)a3 forConcatenatingAlongAxis:(int64_t)a4 normalizedAxis:(unint64_t *)a5 reason:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v10;
    v11 = objc_msgSend(v10, "count");
    if (v11 < 0)
    {
      v12 = v10;
      if (a6)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("The first input MLMultiArray has too many dimensions (%@)"), v18);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v16 = 0;
LABEL_33:
        v12 = v29;
        goto LABEL_34;
      }
    }
    else
    {
      v12 = v10;
      if (v11)
      {
        v13 = (a4 % v11 + v11) % v11;
        v39 = 0;
        v40 = &v39;
        v41 = 0x3032000000;
        v42 = __Block_byref_object_copy__2378;
        v43 = __Block_byref_object_dispose__2379;
        v44 = 0;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __99__MLMultiArray_Concatenating__validateMultiArrays_forConcatenatingAlongAxis_normalizedAxis_reason___block_invoke;
        v34[3] = &unk_1E3D650E0;
        v35 = v10;
        v36 = &v39;
        v37 = v11;
        v38 = v13;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v34);
        v14 = (void *)v40[5];
        if (v14)
        {
          if (a6)
          {
            *a6 = objc_retainAutorelease(v14);
            v15 = (void *)v40[5];
            v40[5] = 0;

          }
LABEL_31:
          v16 = 0;
        }
        else
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v19 = v8;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
          if (v20)
          {
            v21 = 0;
            v22 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v31 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "shape");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectAtIndexedSubscript:", v13);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "unsignedIntegerValue");
                if (__CFADD__(v21, v26))
                  v21 = -1;
                else
                  v21 += v26;

                if (v21 == -1)
                {
                  if (a6)
                    *a6 = CFSTR("The sum of the dimensions at the concatenating axis was too big and caused an integer overflow.");

                  goto LABEL_31;
                }

              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
              if (v20)
                continue;
              break;
            }
          }

          if (a5)
            *a5 = v13;
          v16 = 1;
        }

        _Block_object_dispose(&v39, 8);
        goto LABEL_33;
      }
      if (a6)
      {
        v16 = 0;
        *a6 = CFSTR("MLMultiArray of rank-0 shape (scalar) doesn't support concatenation.");
LABEL_34:

        goto LABEL_35;
      }
    }
    v16 = 0;
    goto LABEL_34;
  }
  v16 = 0;
  if (a6)
    *a6 = CFSTR("multiArrays shall not be empty.");
LABEL_35:

  return v16;
}

+ (MLMultiArray)multiArrayByConcatenatingMultiArrays:(NSArray *)multiArrays alongAxis:(NSInteger)axis dataType:(MLMultiArrayDataType)dataType
{
  NSArray *v8;
  void *v9;
  void *v10;

  v8 = multiArrays;
  v9 = (void *)MEMORY[0x1A1AD6ED8]();
  objc_msgSend(a1, "_multiArrayByConcatenatingMultiArrays:alongAxis:dataType:", v8, axis, dataType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);

  return (MLMultiArray *)v10;
}

+ (id)_multiArrayByConcatenatingMultiArrays:(id)a3 alongAxis:(int64_t)a4 dataType:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __n128 v13;
  _QWORD *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  char *v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  unint64_t *v33;
  unint64_t v34;
  std::string::size_type *v35;
  std::string::size_type *v36;
  char *v37;
  unint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  std::string::size_type v41;
  uint64_t v42;
  std::string::size_type *v43;
  std::string::size_type v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  unint64_t *v57;
  unint64_t *v58;
  unint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  CoreML::MultiArrayBuffer *v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  MLMultiArray *v81;
  unint64_t v82;
  MLMultiArray *v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  _QWORD *v91;
  std::string *v92;
  std::string::size_type size;
  _QWORD *v94;
  _QWORD *v95;
  void **v96;
  uint64_t v97;
  _QWORD *v98;
  _QWORD *v99;
  std::logic_error *v100;
  _QWORD *v101;
  std::logic_error *v102;
  id v103;
  std::logic_error *exception;
  char *v105;
  uint64_t *v106;
  char *v107;
  void *v108;
  char *v109;
  int v110;
  void **v111;
  char *v112;
  std::__shared_weak_count *v113;
  char *v114;
  std::__shared_weak_count *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __n128 v120;
  char *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void *__p;
  _BYTE *v126;
  uint64_t v127;
  void *v128;
  _BYTE *v129;
  uint64_t v130;
  std::string::size_type v131;
  std::__shared_weak_count *v132;
  void *v133[2];
  unsigned __int8 v134;
  __int128 v135;
  _QWORD v136[34];
  _BYTE v137[128];
  std::string v138;
  uint64_t v139;

  v110 = a5;
  v139 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v122 = 0;
  v123 = 0;
  LOBYTE(a4) = objc_msgSend(a1, "validateMultiArrays:forConcatenatingAlongAxis:normalizedAxis:reason:", v7, a4, &v123, &v122, v7);
  v8 = v122;
  v108 = v8;
  if ((a4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v103);
  }
  v120 = 0uLL;
  v121 = 0;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v117 != v11)
          objc_enumerationMutation(v9);
        v13.n128_f64[0] = StorageManager::storage((StorageManager *)&v135, *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i) + 8));
        v14 = (_QWORD *)v120.n128_u64[1];
        if (v120.n128_u64[1] >= (unint64_t)v121)
        {
          v19 = (_QWORD *)v120.n128_u64[0];
          v20 = (uint64_t)(v120.n128_u64[1] - v120.n128_u64[0]) >> 4;
          v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 60)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v22 = (uint64_t)&v121[-v120.n128_u64[0]];
          if ((uint64_t)&v121[-v120.n128_u64[0]] >> 3 > v21)
            v21 = v22 >> 3;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
            v23 = 0xFFFFFFFFFFFFFFFLL;
          else
            v23 = v21;
          if (v23 >> 60)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v24 = (char *)operator new(16 * v23);
          v25 = &v24[16 * v20];
          v26 = *((_QWORD *)&v135 + 1);
          *(_OWORD *)v25 = v135;
          if (v26)
          {
            v27 = (unint64_t *)(v26 + 8);
            do
              v28 = __ldxr(v27);
            while (__stxr(v28 + 1, v27));
            v14 = (_QWORD *)v120.n128_u64[1];
          }
          if (v14 == v19)
          {
            v13 = (__n128)vdupq_n_s64((unint64_t)v14);
            v29 = &v24[16 * v20];
          }
          else
          {
            v29 = &v24[16 * v20];
            do
            {
              v30 = *((_OWORD *)v14 - 1);
              v14 -= 2;
              *((_OWORD *)v29 - 1) = v30;
              v29 -= 16;
              *v14 = 0;
              v14[1] = 0;
            }
            while (v14 != v19);
            v13 = v120;
          }
          v18 = v25 + 16;
          v120.n128_u64[0] = (unint64_t)v29;
          v120.n128_u64[1] = (unint64_t)(v25 + 16);
          v121 = &v24[16 * v23];
          v31 = v13.n128_i64[1];
          v32 = (void *)v13.n128_u64[0];
          while ((void *)v31 != v32)
            v31 = std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100](v31 - 16);
          if (v32)
            operator delete(v32);
          v15 = (std::__shared_weak_count *)*((_QWORD *)&v135 + 1);
        }
        else
        {
          *(_QWORD *)v120.n128_u64[1] = v135;
          v15 = (std::__shared_weak_count *)*((_QWORD *)&v135 + 1);
          v14[1] = *((_QWORD *)&v135 + 1);
          if (v15)
          {
            p_shared_owners = (unint64_t *)&v15->__shared_owners_;
            do
              v17 = __ldxr(p_shared_owners);
            while (__stxr(v17 + 1, p_shared_owners));
          }
          v18 = v14 + 2;
        }
        v120.n128_u64[1] = (unint64_t)v18;
        if (v15)
        {
          v33 = (unint64_t *)&v15->__shared_owners_;
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *, __n128))v15->__on_zero_shared)(v15, v13);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v116, v137, 16, v13.n128_f64[0]);
    }
    while (v10);
  }

  v35 = (std::string::size_type *)v120.n128_u64[1];
  v36 = (std::string::size_type *)v120.n128_u64[0];
  v37 = (char *)operator new(0x88uLL);
  *((_QWORD *)v37 + 1) = 0;
  v38 = (unint64_t *)(v37 + 8);
  *((_QWORD *)v37 + 2) = 0;
  *(_QWORD *)v37 = &off_1E3D5BD48;
  *((_QWORD *)v37 + 3) = &off_1E3D59518;
  *((_OWORD *)v37 + 2) = 0u;
  v39 = (uint64_t *)(v37 + 32);
  *((_OWORD *)v37 + 3) = 0u;
  v40 = v123;
  v111 = (void **)(v37 + 72);
  v37[128] = 0;
  *((_OWORD *)v37 + 4) = 0u;
  *((_OWORD *)v37 + 5) = 0u;
  v109 = v37;
  v107 = v37 + 48;
  if (v35 == v36)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Nothing to concatenate.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
  }
  v105 = v37 + 24;
  v41 = *v36;
  v128 = 0;
  v129 = 0;
  v130 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v128, *(const void **)(v41 + 24), *(_QWORD *)(v41 + 32), (uint64_t)(*(_QWORD *)(v41 + 32) - *(_QWORD *)(v41 + 24)) >> 3);
  v124 = v40;
  __p = 0;
  v126 = 0;
  v127 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v128, (uint64_t)v129, (v129 - (_BYTE *)v128) >> 3);
  v106 = v39;
  v42 = 0;
  v43 = v36;
  do
  {
    v44 = *v43;
    v45 = (std::__shared_weak_count *)v43[1];
    v131 = *v43;
    v132 = v45;
    if (v45)
    {
      v46 = (unint64_t *)&v45->__shared_owners_;
      do
        v47 = __ldxr(v46);
      while (__stxr(v47 + 1, v46));
    }
    v48 = *(_QWORD *)(v44 + 24);
    v49 = (*(_QWORD *)(v44 + 32) - v48) >> 3;
    v50 = __p;
    if (v49 != (v126 - (_BYTE *)__p) >> 3)
    {
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v135);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v136, (uint64_t)"The first multi array has a shape with size ", 44);
      v101 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v101, (uint64_t)" but another multi array's shape size is ", 41);
      std::ostream::operator<<();
      v102 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::stringbuf::str();
      std::logic_error::logic_error(v102, &v138);
      v102->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
      __cxa_throw(v102, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
    }
    if (v126 != __p)
    {
      v51 = v124;
      v52 = *(_QWORD **)(v44 + 24);
      do
      {
        if (v51 && *v52 != *v50)
        {
          std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v135);
          v91 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v136, (uint64_t)"The first multi array has a shape ", 34);
          CoreML::shapeToString((uint64_t)&v138, (uint64_t *)&__p);
          if ((v138.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v92 = &v138;
          else
            v92 = (std::string *)v138.__r_.__value_.__r.__words[0];
          if ((v138.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v138.__r_.__value_.__r.__words[2]);
          else
            size = v138.__r_.__value_.__l.__size_;
          v94 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v91, (uint64_t)v92, size);
          v95 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v94, (uint64_t)" but another multi array's shape is ", 36);
          CoreML::shapeToString((uint64_t)v133, (uint64_t *)(v44 + 24));
          if ((v134 & 0x80u) == 0)
            v96 = v133;
          else
            v96 = (void **)v133[0];
          if ((v134 & 0x80u) == 0)
            v97 = v134;
          else
            v97 = (uint64_t)v133[1];
          v98 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v95, (uint64_t)v96, v97);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v98, (uint64_t)"; they cannot be concatenate along with axis: ",
            46);
          v99 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v99, (uint64_t)".", 1);
          if ((char)v134 < 0)
            operator delete(v133[0]);
          if (SHIBYTE(v138.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v138.__r_.__value_.__l.__data_);
          v100 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::stringbuf::str();
          std::logic_error::logic_error(v100, &v138);
          v100->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
          __cxa_throw(v100, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
        }
        ++v50;
        ++v52;
        --v51;
        --v49;
      }
      while (v49);
    }
    v53 = *(_QWORD *)(v48 + 8 * v124);
    if (v45)
    {
      v54 = (unint64_t *)&v45->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    v42 += v53;
    v43 += 2;
  }
  while (v43 != v35);
  if (__p)
  {
    v126 = __p;
    operator delete(__p);
  }
  std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v107, (char *)v128, (uint64_t)v129, (v129 - (_BYTE *)v128) >> 3);
  *(_QWORD *)(*(_QWORD *)v107 + 8 * v40) = v42;
  CoreML::MultiArrayBuffer::stridesForConiguousArray((unint64_t **)&v135, (unint64_t **)v107, 0);
  v56 = *v111;
  if (*v111)
  {
    *((_QWORD *)v109 + 10) = v56;
    operator delete(v56);
    *v111 = 0;
    v111[1] = 0;
    v111[2] = 0;
  }
  *(_OWORD *)(v109 + 72) = v135;
  *((_QWORD *)v109 + 11) = v136[0];
  *((_DWORD *)v109 + 24) = v110;
  v57 = (unint64_t *)*((_QWORD *)v109 + 6);
  v58 = (unint64_t *)*((_QWORD *)v109 + 7);
  v59 = 1;
  if (v57 == v58)
  {
    *((_QWORD *)v109 + 13) = 1;
    *((_WORD *)v109 + 56) = 5;
    *((_QWORD *)v109 + 15) = 0;
  }
  else
  {
    v60 = (unint64_t *)*((_QWORD *)v109 + 6);
    do
    {
      v61 = *v60++;
      v62 = v59 * v61;
      if (is_mul_ok(v59, v61))
        v59 = v62;
      else
        v59 = -1;
    }
    while (v60 != v58);
    *((_QWORD *)v109 + 13) = v59;
    *((_WORD *)v109 + 56) = 5;
    *((_QWORD *)v109 + 15) = 0;
    v63 = 1;
    do
    {
      v64 = *v57++;
      v65 = v63 * v64;
      if (is_mul_ok(v63, v64))
        v63 = v65;
      else
        v63 = -1;
    }
    while (v57 != v58);
  }
  v66 = operator new[]();
  *(_QWORD *)&v135 = v66;
  v67 = (_QWORD *)operator new();
  *v67 = &off_1E3D5C870;
  v67[1] = 0;
  v67[2] = 0;
  v67[3] = v66;
  *((_QWORD *)&v135 + 1) = v67;
  std::shared_ptr<MIL::IRProgram const>::operator=[abi:ne180100]((uint64_t)v106, &v135);
  v68 = (std::__shared_weak_count *)*((_QWORD *)&v135 + 1);
  if (*((_QWORD *)&v135 + 1))
  {
    v69 = (unint64_t *)(*((_QWORD *)&v135 + 1) + 8);
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  v71 = *v106;
  do
  {
    v72 = (CoreML::MultiArrayBuffer *)*v36;
    v73 = (std::__shared_weak_count *)v36[1];
    v138.__r_.__value_.__r.__words[0] = *v36;
    v138.__r_.__value_.__l.__size_ = (std::string::size_type)v73;
    if (v73)
    {
      v74 = (unint64_t *)&v73->__shared_owners_;
      do
        v75 = __ldxr(v74);
      while (__stxr(v75 + 1, v74));
    }
    v76 = (_QWORD *)((char *)v72 + 24);
    CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)&v135, v71, (uint64_t)v72 + 24, (uint64_t)v111, v110);
    CoreML::MultiArrayBuffer::copyInto(v72, (CoreML::MultiArrayBuffer *)&v135);
    v77 = *((_QWORD *)*v111 + v40);
    v78 = *(_QWORD *)(*v76 + 8 * v40);
    CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)&v135);
    if (v73)
    {
      v79 = (unint64_t *)&v73->__shared_owners_;
      do
        v80 = __ldaxr(v79);
      while (__stlxr(v80 - 1, v79));
      if (!v80)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }
    v71 += v77 * ((unsigned __int16)v110 >> 3) * v78;
    v36 += 2;
  }
  while (v36 != v35);
  if (v128)
  {
    v129 = v128;
    operator delete(v128);
  }
  v114 = v105;
  v115 = (std::__shared_weak_count *)v109;
  v81 = [MLMultiArray alloc];
  v112 = v105;
  v113 = (std::__shared_weak_count *)v109;
  do
    v82 = __ldxr(v38);
  while (__stxr(v82 + 1, v38));
  v83 = -[MLMultiArray initWithMultiArrayBuffer:](v81, "initWithMultiArrayBuffer:", &v112);
  v84 = v113;
  if (v113)
  {
    v85 = (unint64_t *)&v113->__shared_owners_;
    do
      v86 = __ldaxr(v85);
    while (__stlxr(v86 - 1, v85));
    if (!v86)
    {
      ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
      std::__shared_weak_count::__release_weak(v84);
    }
  }
  v87 = v115;
  if (v115)
  {
    v88 = (unint64_t *)&v115->__shared_owners_;
    do
      v89 = __ldaxr(v88);
    while (__stlxr(v89 - 1, v88));
    if (!v89)
    {
      ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
      std::__shared_weak_count::__release_weak(v87);
    }
  }
  *(_QWORD *)&v135 = &v120;
  std::vector<std::shared_ptr<CoreML::MultiArrayBuffer const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v135);

  return v83;
}

void __99__MLMultiArray_Concatenating__validateMultiArrays_forConcatenatingAlongAxis_normalizedAxis_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 != objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-th input MLMultiArray has shape (%@), which is different from the first input's shape: (%@)."), v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
LABEL_11:

    *a4 = 1;
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      if (v13 < 0)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-th input MLMultiArray has shape (%@), but %@-th dimension shall not be negative."), v15, v16, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (v9 != *(_QWORD *)(a1 + 56) && v13 != v11)
        break;
      if ((unint64_t)++v9 >= *(_QWORD *)(a1 + 48))
        goto LABEL_12;
    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-th input MLMultiArray has shape (%@) but the first input's shape is (%@); %@-th dimension doesn't match."),
      v15,
      v16,
      v17,
      v20);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    goto LABEL_11;
  }
LABEL_12:

}

- (void)getContiguousFirstMajorFloat32BufferWithHandler:(id)a3
{
  id v4;
  MLMultiArray *v5;
  void *v6;
  void *v7;
  MLMultiArray *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MLMultiArray dataType](self, "dataType") == MLMultiArrayDataTypeFloat32
    && -[MLMultiArray isContiguousInOrder:](self, "isContiguousInOrder:", 0))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke;
    v11[3] = &unk_1E3D65158;
    v12 = v4;
    -[MLMultiArray getBytesWithHandler:](self, "getBytesWithHandler:", v11);

  }
  else
  {
    v5 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MLMultiArray count](self, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MLMultiArray initWithShape:dataType:error:](v5, "initWithShape:dataType:error:", v7, 65568, 0);

    -[MLMultiArray vectorizeIntoMultiArray:storageOrder:error:](self, "vectorizeIntoMultiArray:storageOrder:error:", v8, 0, 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke_2;
    v9[3] = &unk_1E3D65158;
    v10 = v4;
    -[MLMultiArray getBytesWithHandler:](v8, "getBytesWithHandler:", v9);

  }
}

- (BOOL)renderToOneComponent8PixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  char GrayImageDimensionsFromMultiArrayShape;
  BOOL v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  -[MLMultiArray shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v7, &v19, &v18, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0)
    return 0;
  if (CVPixelBufferLockBaseAddress(a3, 0))
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to lock pixel buffer"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    return 0;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__MLMultiArray_ImageUtils__renderToOneComponent8PixelBuffer_error___block_invoke;
  v13[3] = &unk_1E3D65180;
  v13[6] = v18;
  v13[7] = a3;
  v13[4] = &v14;
  v13[5] = v19;
  -[MLMultiArray getContiguousFirstMajorFloat32BufferWithHandler:](self, "getContiguousFirstMajorFloat32BufferWithHandler:", v13);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  v10 = v15[3];
  v9 = v10 == 0;
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to convert planar to OneComponent8: Code=%@"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)renderToOneComponent16HalfPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  char GrayImageDimensionsFromMultiArrayShape;
  BOOL v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  -[MLMultiArray shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v7, &v19, &v18, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0)
    return 0;
  if (CVPixelBufferLockBaseAddress(a3, 0))
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to lock pixel buffer"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    return 0;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__MLMultiArray_ImageUtils__renderToOneComponent16HalfPixelBuffer_error___block_invoke;
  v13[3] = &unk_1E3D65180;
  v13[6] = v18;
  v13[7] = a3;
  v13[4] = &v14;
  v13[5] = v19;
  -[MLMultiArray getContiguousFirstMajorFloat32BufferWithHandler:](self, "getContiguousFirstMajorFloat32BufferWithHandler:", v13);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  v10 = v15[3];
  v9 = v10 == 0;
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to convert planar to OneComponent8: Code=%@"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)renderTo32BGRAPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  void *v18;
  vImagePixelCount v19;
  void *v20;
  vImagePixelCount v21;
  MLMultiArray *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  vImage_Error v29;
  void *v30;
  void *v31;
  void *v32;
  MLMultiArray *v33;
  vImage_Buffer dest;
  vImage_Buffer blue;
  vImage_Buffer green;
  vImage_Buffer red;
  id v38;
  id v39;
  __int128 maxFloat;
  _QWORD minFloat[2];
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  -[MLMultiArray shape](self, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 3)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue") != 3;

  }
  v12 = 0;
  while (v12 + 3 < (unint64_t)objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    ++v12;
    if (v14 != 1)
      goto LABEL_9;
  }
  if (v11)
  {
LABEL_9:
    if (a5)
    {
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid array shape [%@] for converting to BGR image. %@"), v15, CFSTR("Shape must have at least 3 dimensions, The third dimension to the last (channels) must be 3, and any earlier dimensions must have a size of 1."));
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  if (v19 == CVPixelBufferGetWidth(a3))
  {
    if (v21 == CVPixelBufferGetHeight(a3))
    {
      if (-[MLMultiArray dataType](self, "dataType") == MLMultiArrayDataTypeFloat32
        && -[MLMultiArray isContiguousInOrder:](self, "isContiguousInOrder:", 0))
      {
        v22 = self;
      }
      else
      {
        v33 = [MLMultiArray alloc];
        v42 = &unk_1E3DA1F00;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v21);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v19);
        v31 = (void *)v43;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        v22 = -[MLMultiArray initWithShape:dataType:storageOrder:error:](v33, "initWithShape:dataType:storageOrder:error:", v24, 65568, 0, &v39);
        v25 = v39;

        if (v25
          || (v38 = 0,
              -[MLMultiArray vectorizeIntoMultiArray:storageOrder:error:](self, "vectorizeIntoMultiArray:storageOrder:error:", v22, 0, &v38), (v25 = v38) != 0))
        {
          if (a5)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to create temporary buffer for conversion to image"));
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_28;
        }
      }
      if (!CVPixelBufferLockBaseAddress(a3, 0))
      {
        v22 = objc_retainAutorelease(v22);
        v26 = -[MLMultiArray bytes](v22, "bytes");
        if (v6)
          v27 = (void *)(v26 + 8 * v21 * v19);
        else
          v27 = (void *)v26;
        red.data = v27;
        red.height = v21;
        red.width = v19;
        red.rowBytes = 4 * v19;
        green.data = (void *)(v26 + 4 * v21 * v19);
        green.height = v21;
        green.width = v19;
        green.rowBytes = 4 * v19;
        if (v6)
          v28 = (void *)v26;
        else
          v28 = (void *)(v26 + 8 * v21 * v19);
        blue.data = v28;
        blue.height = v21;
        blue.width = v19;
        blue.rowBytes = 4 * v19;
        dest.height = v21;
        dest.width = v19;
        dest.data = CVPixelBufferGetBaseAddress(a3);
        dest.rowBytes = CVPixelBufferGetBytesPerRow(a3);
        minFloat[0] = 0;
        minFloat[1] = 0;
        maxFloat = xmmword_19CB39A00;
        v29 = vImageConvert_PlanarFToBGRX8888(&blue, &green, &red, 0xFFu, &dest, (const float *)&maxFloat, (const float *)minFloat, 0);
        CVPixelBufferUnlockBaseAddress(a3, 0);
        v16 = v29 == 0;
        if (a5 && v29)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to convert planar to BGRAX888: Code=%@"), v30);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_29;
      }
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to lock pixel buffer"));
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
LABEL_28:
      v16 = 0;
LABEL_29:

      goto LABEL_12;
    }
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Shape's height (%d) doesn't match the pixel buffer's height (%d)"), v19, CVPixelBufferGetHeight(a3));
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  if (!a5)
    goto LABEL_11;
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Shape's width (%d) doesn't match the pixel buffer's width (%d)"), v19, CVPixelBufferGetWidth(a3));
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v16 = 0;
  *a5 = v23;
LABEL_12:

  return v16;
}

- (BOOL)renderToCVPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  OSType PixelFormatType;

  v6 = a4;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 1278226488)
    return -[MLMultiArray renderToOneComponent8PixelBuffer:error:](self, "renderToOneComponent8PixelBuffer:error:", a3, a5);
  if (PixelFormatType == 1111970369)
    return -[MLMultiArray renderTo32BGRAPixelBuffer:channelOrderIsBGR:error:](self, "renderTo32BGRAPixelBuffer:channelOrderIsBGR:error:", a3, v6, a5);
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("pixel format type %c%c%c%c is not supported."), HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

vImage_Error __72__MLMultiArray_ImageUtils__renderToOneComponent16HalfPixelBuffer_error___block_invoke(uint64_t a1, void *a2)
{
  int8x16_t v3;
  vImage_Error result;
  vImage_Buffer v5;
  vImage_Buffer src;

  src.data = a2;
  v3 = *(int8x16_t *)(a1 + 40);
  *(int8x16_t *)&src.height = vextq_s8(v3, v3, 8uLL);
  src.rowBytes = 4 * v3.i64[0];
  v5.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 56));
  *(int8x16_t *)&v5.height = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v5.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 56));
  result = vImageConvert_PlanarFtoPlanar16F(&src, &v5, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

vImage_Error __67__MLMultiArray_ImageUtils__renderToOneComponent8PixelBuffer_error___block_invoke(uint64_t a1, void *a2)
{
  int8x16_t v3;
  vImage_Error result;
  vImage_Buffer v5;
  vImage_Buffer src;

  src.data = a2;
  v3 = *(int8x16_t *)(a1 + 40);
  *(int8x16_t *)&src.height = vextq_s8(v3, v3, 8uLL);
  src.rowBytes = 4 * v3.i64[0];
  v5.data = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 56));
  *(int8x16_t *)&v5.height = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v5.rowBytes = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 56));
  result = vImageConvert_PlanarFtoPlanar8(&src, &v5, 255.0, 0.0, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3 / 4);
}

uint64_t __76__MLMultiArray_ImageUtils__getContiguousFirstMajorFloat32BufferWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3 / 4);
}

+ (__CVBuffer)pixelBufferGray8FromMultiArrayHW:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char GrayImageDimensionsFromMultiArrayShape;
  void *v8;
  void *v9;
  char v10;
  CVPixelBufferRef pixelBufferOut;
  size_t v13;
  size_t v14;

  v5 = a3;
  v13 = 0;
  v14 = 0;
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v6, (uint64_t *)&v14, (uint64_t *)&v13, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0)
    goto LABEL_7;
  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, v13, 0x4C303038u, 0, &pixelBufferOut))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to create BGRA image %@ x %@"), v8, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      a4 = 0;
    }
  }
  else
  {
    v10 = objc_msgSend(v5, "renderToOneComponent8PixelBuffer:error:", pixelBufferOut, a4);
    a4 = (id *)pixelBufferOut;
    if ((v10 & 1) == 0)
    {
      CVPixelBufferRelease(pixelBufferOut);
      goto LABEL_7;
    }
  }

  return (__CVBuffer *)a4;
}

+ (__CVBuffer)pixelBufferGray16HalfFromMultiArrayHW:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char GrayImageDimensionsFromMultiArrayShape;
  void *v8;
  void *v9;
  char v10;
  CVPixelBufferRef pixelBufferOut;
  size_t v13;
  size_t v14;

  v5 = a3;
  v13 = 0;
  v14 = 0;
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GrayImageDimensionsFromMultiArrayShape = getGrayImageDimensionsFromMultiArrayShape(v6, (uint64_t *)&v14, (uint64_t *)&v13, a4);

  if ((GrayImageDimensionsFromMultiArrayShape & 1) == 0)
    goto LABEL_7;
  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, v13, 0x4C303068u, 0, &pixelBufferOut))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to create BGRA image %@ x %@"), v8, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      a4 = 0;
    }
  }
  else
  {
    v10 = objc_msgSend(v5, "renderToOneComponent16HalfPixelBuffer:error:", pixelBufferOut, a4);
    a4 = (id *)pixelBufferOut;
    if ((v10 & 1) == 0)
    {
      CVPixelBufferRelease(pixelBufferOut);
      goto LABEL_7;
    }
  }

  return (__CVBuffer *)a4;
}

+ (__CVBuffer)pixelBufferBGRA8FromMultiArrayCHW:(id)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  size_t v17;
  void *v18;
  size_t v19;
  void *v20;
  char v21;
  CVPixelBufferRef pixelBufferOut;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 3)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue") != 3;

  }
  v11 = 0;
  while (v11 + 3 < (unint64_t)objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    ++v11;
    if (v13 != 1)
      goto LABEL_9;
  }
  if (v10)
  {
LABEL_9:
    if (!a5)
      goto LABEL_13;
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid array shape [%@] for converting to BGR image. %@"), v14, CFSTR("Shape must have at least 3 dimensions, The third dimension to the last (channels) must be 3, and any earlier dimensions must have a size of 1."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, v19, 0x42475241u, 0, &pixelBufferOut))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to create BGRA image %@ x %@"), v14, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_12:
      a5 = 0;
    }
  }
  else
  {
    v21 = objc_msgSend(v7, "renderTo32BGRAPixelBuffer:channelOrderIsBGR:error:", pixelBufferOut, v6, a5);
    a5 = (id *)pixelBufferOut;
    if ((v21 & 1) == 0)
    {
      CVPixelBufferRelease(pixelBufferOut);
      goto LABEL_12;
    }
  }
LABEL_13:

  return (__CVBuffer *)a5;
}

+ (id)newMultiArrayForState:(id)a3 strides:(id)a4 dtype:(int64_t)a5 error:(id *)a6
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFDictionary *v27;
  __IOSurface *v28;
  uint64_t v29;
  CVPixelBufferRef v30;
  MLMultiArray *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t v47[8];
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[8];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint8_t v58[8];
  uint64_t v59;
  void *v60;
  _QWORD v61[5];
  _QWORD v62[5];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongValue");
LABEL_5:
    v11 = 2 * v10;

    goto LABEL_7;
  }
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongValue");
    goto LABEL_5;
  }
  v11 = 2;
LABEL_7:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongValue");

  }
  else
  {
    v13 = 1;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v51;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v14);
        v19 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * i);
        v17 = CoreML::SafeMultiplies<unsigned long>::operator()(objc_msgSend(v19, "unsignedLongValue"), v17);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 1;
  }

  v20 = *MEMORY[0x1E0CBC048];
  v62[0] = CFSTR("CoreML State");
  v21 = *MEMORY[0x1E0CBBF08];
  v61[0] = v20;
  v61[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CBC070];
  v62[1] = v22;
  v62[2] = &unk_1E3DA2200;
  v24 = *MEMORY[0x1E0CBC1E0];
  v61[2] = v23;
  v61[3] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v25;
  v61[4] = *MEMORY[0x1E0CBC008];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v17 / v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 5);
  v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v28 = IOSurfaceCreate(v27);
  if (v28)
  {
    pixelBufferOut = 0;
    *(_QWORD *)buf = v28;
    v29 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v28, 0, &pixelBufferOut);
    v30 = pixelBufferOut;
    if (pixelBufferOut)
    {
      *(_QWORD *)v58 = pixelBufferOut;
      if ((unint64_t)objc_msgSend(v8, "count") < 2 || v11 == CVPixelBufferGetBytesPerRow(pixelBufferOut))
      {
        v31 = -[MLMultiArray initWithPixelBuffer:shape:]([MLMultiArray alloc], "initWithPixelBuffer:shape:", v30, v14);
      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v47 = 0;
          _os_log_error_impl(&dword_19C486000, v41, OS_LOG_TYPE_ERROR, "Could not create pixel buffer for state with required bytes per row.", v47, 2u);
        }

        if (a6)
        {
          v42 = (void *)MEMORY[0x1E0CB35C8];
          v54 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not create pixel buffer for state with required bytes per row."));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v44);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v31 = 0;
      }
      std::unique_ptr<__CVBuffer,MLE5ObjectDeleter<__CVBuffer>>::reset[abi:ne180100]((__CVBuffer **)v58);
    }
    else
    {
      v36 = v29;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v58 = 67109120;
        *(_DWORD *)&v58[4] = v36;
        _os_log_error_impl(&dword_19C486000, v37, OS_LOG_TYPE_ERROR, "Failed to make backing pixel buffer for state with error %i.", v58, 8u);
      }

      if (a6)
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v56 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to make backing pixel buffer for state with error %i."), v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v40);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v31 = 0;
    }
    std::unique_ptr<__IOSurface,MLE5ObjectDeleter<__IOSurface>>::reset[abi:ne180100]((const void **)buf);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "Failed to make backing IOSurface for state.", buf, 2u);
    }

    if (a6)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to make backing IOSurface for state."));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v35);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = 0;
  }

  return v31;
}

@end
