@implementation CSUDataUtilities

+ (EspressoTensor)tensorForInputEmbedding:(SEL)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64x2_t *v17;
  char *v18;
  int64x2_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  _OWORD *v26;
  __int128 *v27;
  uint64_t v28;
  __int128 v29;
  int *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  EspressoTensor *result;
  std::runtime_error *exception;
  std::runtime_error *v37;
  void *__p;
  char *v39;
  _QWORD *v40;
  void *v41;
  uint64_t v42;
  void *v43[3];

  v5 = a4;
  v10 = objc_msgSend_length(v5, v6, v7, v8, v9);
  v11 = objc_retainAutorelease(v5);
  v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15);
  v17 = (int64x2_t *)operator new(0x20uLL);
  *v17 = vdupq_n_s64(1uLL);
  v17[1].i64[0] = 1;
  v17[1].i64[1] = v10 >> 2;
  LODWORD(v43[0]) = 4;
  v18 = (char *)operator new(0x20uLL);
  v39 = v18 + 32;
  v40 = v18 + 32;
  v19 = v17[1];
  *(int64x2_t *)v18 = *v17;
  *((int64x2_t *)v18 + 1) = v19;
  __p = v18;
  sub_239FFFC10((uint64_t)retstr, (int *)v43, (uint64_t)&__p);
  if (__p)
  {
    v39 = (char *)__p;
    operator delete(__p);
  }
  if (retstr->type_ != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v20 = (*(uint64_t (**)(TensorStorage *))(*(_QWORD *)retstr->storage_.__ptr_ + 24))(retstr->storage_.__ptr_);
  (*(void (**)(void **__return_ptr))(*(_QWORD *)retstr->storage_.__ptr_ + 32))(v43);
  sub_239FFECB4(&__p, v20, (uint64_t)v43);
  __p = &off_250B0D558;
  if (v43[0])
  {
    v43[1] = v43[0];
    operator delete(v43[0]);
  }
  if (v10 > 3)
  {
    if (v42 != 4)
    {
      v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v37, "Invalid number of indices provided.");
      __cxa_throw(v37, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    v22 = 0;
    v23 = v39;
    v21 = v40;
    v24 = v40[3];
    if (v10 >> 2 <= 1)
      v25 = 1;
    else
      v25 = v10 >> 2;
    if (v25 < 8)
      goto LABEL_18;
    if (v24 != 1)
      goto LABEL_18;
    if ((unint64_t)&v39[-v16] < 0x20)
      goto LABEL_18;
    v22 = v25 & 0x3FFFFFFFFFFFFFF8;
    v26 = v39 + 16;
    v27 = (__int128 *)(v16 + 16);
    v28 = v25 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v29 = *v27;
      *(v26 - 1) = *(v27 - 1);
      *v26 = v29;
      v26 += 2;
      v27 += 2;
      v28 -= 8;
    }
    while (v28);
    if (v25 != v22)
    {
LABEL_18:
      v30 = (int *)(v16 + 4 * v22);
      v31 = &v23[4 * v22 * v24];
      v32 = 4 * v24;
      v33 = v25 - v22;
      do
      {
        v34 = *v30++;
        *(_DWORD *)v31 = v34;
        v31 += v32;
        --v33;
      }
      while (v33);
    }
  }
  else
  {
    v21 = v40;
  }
  __p = &off_250B0DD08;
  if (v21)
  {
    v41 = v21;
    operator delete(v21);
  }
  operator delete(v17);

  return result;
}

@end
