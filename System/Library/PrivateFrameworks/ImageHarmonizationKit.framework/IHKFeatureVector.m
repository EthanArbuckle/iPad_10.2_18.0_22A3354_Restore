@implementation IHKFeatureVector

- (IHKFeatureVector)initWithTensor:(EspressoTensor *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  IHKFeatureVector *v7;
  unint64_t *end;
  unint64_t *begin;
  int64_t v10;
  char *v11;
  char *v12;
  __shared_weak_count *cntrl;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t (**v20)();
  int type;
  void *__p;
  void *v23;
  char *v24;
  TensorStorage *ptr;
  __shared_weak_count *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)IHKFeatureVector;
  v7 = -[IHKFeatureVector init](&v27, sel_init);
  if (v7)
  {
    v20 = &off_250F5D430;
    type = a3->type_;
    v23 = 0;
    v24 = 0;
    __p = 0;
    begin = a3->shape_.sizes_.__begin_;
    end = a3->shape_.sizes_.__end_;
    v10 = (char *)end - (char *)begin;
    if (end != begin)
    {
      if (v10 < 0)
        sub_23ECB1668();
      v11 = (char *)operator new((char *)end - (char *)begin);
      v12 = &v11[8 * (v10 >> 3)];
      __p = v11;
      v24 = v12;
      memcpy(v11, begin, v10);
      v23 = v12;
    }
    cntrl = a3->storage_.__cntrl_;
    ptr = a3->storage_.__ptr_;
    v26 = cntrl;
    if (cntrl)
    {
      v14 = (unint64_t *)((char *)cntrl + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    v20 = &off_250F5D3E8;
    objc_msgSend_setTensor_(v7, v4, (uint64_t)&v20, v5, v6);
    v20 = &off_250F5D430;
    v16 = (std::__shared_weak_count *)v26;
    if (v26)
    {
      v17 = (unint64_t *)((char *)v26 + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    if (__p)
    {
      v23 = __p;
      operator delete(__p);
    }
  }
  return v7;
}

- (IHKFeatureVector)initWithData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  IHKFeatureVector *v9;
  unint64_t v10;
  _QWORD *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  int v44;
  _QWORD v45[2];
  void *__p;
  void *v47;
  std::__shared_weak_count *v48;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)IHKFeatureVector;
  v9 = -[IHKFeatureVector init](&v49, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_length(v4, v5, v6, v7, v8);
    v44 = 4;
    v11 = operator new(8uLL);
    v38 = v11;
    *v11 = v10 >> 2;
    v39 = v11 + 1;
    v40 = v11 + 1;
    sub_23ECB0EA8((uint64_t)v45, &v44, (uint64_t)&v38);
    objc_msgSend_setTensor_(v9, v12, (uint64_t)v45, v13, v14);
    v45[0] = &off_250F5D430;
    v19 = v48;
    if (v48)
    {
      p_shared_owners = (unint64_t *)&v48->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    if (__p)
    {
      v47 = __p;
      operator delete(__p);
    }
    if (v38)
    {
      v39 = v38;
      operator delete(v38);
    }
    objc_msgSend_tensor(v9, v15, v16, v17, v18);
    v22 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v42 + 24))(v42);
    v23 = objc_retainAutorelease(v4);
    v28 = (const void *)objc_msgSend_bytes(v23, v24, v25, v26, v27);
    v33 = objc_msgSend_length(v23, v29, v30, v31, v32);
    memcpy(v22, v28, v33);
    v38 = &off_250F5D430;
    v34 = v43;
    if (v43)
    {
      v35 = (unint64_t *)&v43->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    if (v40)
    {
      v41 = v40;
      operator delete(v40);
    }
  }

  return v9;
}

- (unint64_t)size
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  char *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  int32x4_t *v11;
  int32x4_t v12;
  uint64_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int8x16_t v19;
  int v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  int32x4_t *v23;
  int32x4_t *__p;
  int32x4_t *v26;
  std::__shared_weak_count *v27;

  objc_msgSend_tensor(self, a2, v2, v3, v4);
  if (__p == v26)
  {
    v8 = 0;
    v9 = v27;
    if (!v27)
      goto LABEL_14;
    goto LABEL_11;
  }
  v5 = (char *)v26 - (char *)__p - 8;
  if (v5 < 0x38)
  {
    v6 = 1;
    v7 = (char *)__p;
    do
    {
LABEL_9:
      v20 = *(_DWORD *)v7;
      v7 += 8;
      v6 *= v20;
    }
    while (v7 != (char *)v26);
    goto LABEL_10;
  }
  v10 = (v5 >> 3) + 1;
  v7 = &__p->i8[8 * (v10 & 0x3FFFFFFFFFFFFFF8)];
  v11 = __p + 2;
  v12.i64[0] = 0x100000001;
  v12.i64[1] = 0x100000001;
  v13 = v10 & 0x3FFFFFFFFFFFFFF8;
  v14.i64[0] = 0x100000001;
  v14.i64[1] = 0x100000001;
  do
  {
    v16 = v11[-2];
    v15 = v11[-1];
    v18 = *v11;
    v17 = v11[1];
    v11 += 4;
    v12 = vmulq_s32(v12, vuzp1q_s32(v16, v15));
    v14 = vmulq_s32(v14, vuzp1q_s32(v18, v17));
    v13 -= 8;
  }
  while (v13);
  v19 = (int8x16_t)vmulq_s32(v14, v12);
  *(int32x2_t *)v19.i8 = vmul_s32(*(int32x2_t *)v19.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL));
  v6 = v19.i32[0] * v19.i32[1];
  if (v10 != (v10 & 0x3FFFFFFFFFFFFFF8))
    goto LABEL_9;
LABEL_10:
  v8 = v6;
  v9 = v27;
  if (!v27)
    goto LABEL_14;
LABEL_11:
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v22 = __ldaxr(p_shared_owners);
  while (__stlxr(v22 - 1, p_shared_owners));
  if (!v22)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    v23 = __p;
    if (!__p)
      return v8;
    goto LABEL_15;
  }
LABEL_14:
  v23 = __p;
  if (__p)
LABEL_15:
    operator delete(v23);
  return v8;
}

- (id)featureVectorByAppendingFeatureVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  IHKFeatureVector *v52;
  const void *v53;
  int64_t v54;
  char *v55;
  char *v56;
  unint64_t *v57;
  unint64_t v58;
  void *v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t (**v67)();
  int v68;
  void *v69;
  void *v70;
  char *v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  void *__p;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  int v80;
  uint64_t (**v81)();
  int v82;
  _BYTE *v83;
  _BYTE *v84;
  uint64_t v85;
  std::__shared_weak_count *v86;

  v4 = a3;
  v9 = objc_msgSend_size(self, v5, v6, v7, v8);
  v14 = objc_msgSend_size(v4, v10, v11, v12, v13);
  v80 = 4;
  v15 = operator new(8uLL);
  __p = v15;
  *v15 = v14 + v9;
  v75 = v15 + 1;
  v76 = v15 + 1;
  sub_23ECB0EA8((uint64_t)&v81, &v80, (uint64_t)&__p);
  if (__p)
  {
    v75 = __p;
    operator delete(__p);
  }
  v16 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v85 + 24))(v85);
  objc_msgSend_tensor(self, v17, v18, v19, v20);
  v21 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v78 + 24))(v78);
  v26 = objc_msgSend_size(self, v22, v23, v24, v25);
  memcpy(v16, v21, 4 * v26);
  __p = &off_250F5D430;
  v27 = v79;
  if (v79)
  {
    p_shared_owners = (unint64_t *)&v79->__shared_owners_;
    do
      v29 = __ldaxr(p_shared_owners);
    while (__stlxr(v29 - 1, p_shared_owners));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  v30 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v85 + 24))(v85);
  v35 = objc_msgSend_size(self, v31, v32, v33, v34);
  objc_msgSend_tensor(v4, v36, v37, v38, v39);
  v40 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v78 + 24))(v78);
  v45 = objc_msgSend_size(v4, v41, v42, v43, v44);
  memcpy((void *)(v30 + 4 * v35), v40, 4 * v45);
  __p = &off_250F5D430;
  v46 = v79;
  if (v79)
  {
    v47 = (unint64_t *)&v79->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  v52 = [IHKFeatureVector alloc];
  v67 = &off_250F5D430;
  v68 = v82;
  v70 = 0;
  v71 = 0;
  v69 = 0;
  v53 = v83;
  v54 = v84 - v83;
  if (v84 != v83)
  {
    if (v54 < 0)
      sub_23ECB1668();
    v55 = (char *)operator new(v84 - v83);
    v56 = &v55[8 * (v54 >> 3)];
    v69 = v55;
    v71 = v56;
    memcpy(v55, v53, v54);
    v70 = v56;
  }
  v72 = v85;
  v73 = v86;
  if (v86)
  {
    v57 = (unint64_t *)&v86->__shared_owners_;
    do
      v58 = __ldxr(v57);
    while (__stxr(v58 + 1, v57));
  }
  v67 = &off_250F5D3E8;
  v59 = (void *)objc_msgSend_initWithTensor_(v52, v49, (uint64_t)&v67, v50, v51);
  v67 = &off_250F5D430;
  v60 = v73;
  if (v73)
  {
    v61 = (unint64_t *)&v73->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  v81 = &off_250F5D430;
  v63 = v86;
  if (v86)
  {
    v64 = (unint64_t *)&v86->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  if (v83)
  {
    v84 = v83;
    operator delete(v83);
  }

  return v59;
}

- (id)subFeatureVectorWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  IHKFeatureVector *v19;
  const void *v20;
  int64_t v21;
  char *v22;
  char *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t (**v34)();
  int v35;
  void *v36;
  void *v37;
  char *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  void *__p;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  int v47;
  uint64_t (**v48)();
  int v49;
  _BYTE *v50;
  _BYTE *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;

  length = a3.length;
  location = a3.location;
  v47 = 4;
  v6 = operator new(8uLL);
  __p = v6;
  *v6 = length;
  v42 = v6 + 1;
  v43 = v6 + 1;
  sub_23ECB0EA8((uint64_t)&v48, &v47, (uint64_t)&__p);
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  v7 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v52 + 24))(v52);
  objc_msgSend_tensor(self, v8, v9, v10, v11);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v45 + 24))(v45);
  memcpy(v7, (const void *)(v12 + 4 * location), 4 * length);
  __p = &off_250F5D430;
  v13 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }
  v19 = [IHKFeatureVector alloc];
  v34 = &off_250F5D430;
  v35 = v49;
  v37 = 0;
  v38 = 0;
  v36 = 0;
  v20 = v50;
  v21 = v51 - v50;
  if (v51 != v50)
  {
    if (v21 < 0)
      sub_23ECB1668();
    v22 = (char *)operator new(v51 - v50);
    v23 = &v22[8 * (v21 >> 3)];
    v36 = v22;
    v38 = v23;
    memcpy(v22, v20, v21);
    v37 = v23;
  }
  v39 = v52;
  v40 = v53;
  if (v53)
  {
    v24 = (unint64_t *)&v53->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v34 = &off_250F5D3E8;
  v26 = (void *)objc_msgSend_initWithTensor_(v19, v16, (uint64_t)&v34, v17, v18);
  v34 = &off_250F5D430;
  v27 = v40;
  if (v40)
  {
    v28 = (unint64_t *)&v40->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (v36)
  {
    v37 = v36;
    operator delete(v36);
  }
  v48 = &off_250F5D430;
  v30 = v53;
  if (v53)
  {
    v31 = (unint64_t *)&v53->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  return v26;
}

- (void)saveToTextFile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  char *i;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  int v27;
  unsigned int v28;
  size_t v29;
  std::runtime_error *exception;
  int v31;
  char *__p;
  char *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[21];

  v38[19] = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  sub_23ECAE738(&v36);
  objc_msgSend_tensor(self, v9, v10, v11, v12);
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v35->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  if (__p != v33)
  {
    sub_23ECB1A30(&v36, (uint64_t)"", 0);
    std::ostream::operator<<();
    for (i = __p + 8; i != v33; i += 8)
    {
      sub_23ECB1A30(&v36, (uint64_t)", ", 2);
      std::ostream::operator<<();
    }
  }
  sub_23ECB1A30(&v36, (uint64_t)"\n", 1);
  objc_msgSend_tensor(self, v16, v17, v18, v19, &off_250F5D430);
  if (v31 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v20 = (*(uint64_t (**)())(*(_QWORD *)v34 + 24))();
  v22 = v21;
  if (v35)
  {
    v23 = (unint64_t *)&v35->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)())v35->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (__p)
    operator delete(__p);
  if (v22 >= 4)
  {
    v25 = 4 * (v22 >> 2);
    v26 = "";
    v27 = -1;
    v28 = 1;
    do
    {
      v29 = strlen(v26);
      sub_23ECB1A30(&v36, (uint64_t)v26, v29);
      std::ostream::operator<<();
      if (v27 + 10 * (v28 / 0xA))
        v26 = ", ";
      else
        v26 = ",\n";
      v20 += 4;
      --v27;
      ++v28;
      v25 -= 4;
    }
    while (v25);
  }
  sub_23ECB1A30(&v36, (uint64_t)"\n", 1);
  v36 = *MEMORY[0x24BEDB7E8];
  *(uint64_t *)((char *)&v36 + *(_QWORD *)(v36 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
  MEMORY[0x24265E0C4](&v37);
  std::ostream::~ostream();
  MEMORY[0x24265E154](v38);

}

- (void)saveToBinaryFile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  FILE *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  size_t v23;
  uint64_t v24;
  int32x4_t *v25;
  int32x4_t v26;
  uint64_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int8x16_t v33;
  int v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  int32x4_t *__p;
  char *v40;
  std::__shared_weak_count *v41;
  void *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;

  v4 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  v10 = fopen(v9, "wb");
  objc_msgSend_tensor(self, v11, v12, v13, v14);
  v15 = (const void *)(*(uint64_t (**)())(*(_QWORD *)v43 + 24))();
  objc_msgSend_tensor(self, v16, v17, v18, v19);
  if (__p != (int32x4_t *)v40)
  {
    v20 = v40 - (char *)__p - 8;
    if (v20 >= 0x38)
    {
      v24 = (v20 >> 3) + 1;
      v22 = &__p->i8[8 * (v24 & 0x3FFFFFFFFFFFFFF8)];
      v25 = __p + 2;
      v26.i64[0] = 0x100000001;
      v26.i64[1] = 0x100000001;
      v27 = v24 & 0x3FFFFFFFFFFFFFF8;
      v28.i64[0] = 0x100000001;
      v28.i64[1] = 0x100000001;
      do
      {
        v30 = v25[-2];
        v29 = v25[-1];
        v32 = *v25;
        v31 = v25[1];
        v25 += 4;
        v26 = vmulq_s32(v26, vuzp1q_s32(v30, v29));
        v28 = vmulq_s32(v28, vuzp1q_s32(v32, v31));
        v27 -= 8;
      }
      while (v27);
      v33 = (int8x16_t)vmulq_s32(v28, v26);
      *(int32x2_t *)v33.i8 = vmul_s32(*(int32x2_t *)v33.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL));
      v21 = v33.i32[0] * v33.i32[1];
      if (v24 == (v24 & 0x3FFFFFFFFFFFFFF8))
        goto LABEL_9;
    }
    else
    {
      v21 = 1;
      v22 = (char *)__p;
    }
    do
    {
      v34 = *(_DWORD *)v22;
      v22 += 8;
      v21 *= v34;
    }
    while (v22 != v40);
LABEL_9:
    v23 = v21;
    goto LABEL_10;
  }
  v23 = 0;
LABEL_10:
  fwrite(v15, 4uLL, v23, v10);
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v36 = __ldaxr(p_shared_owners);
    while (__stlxr(v36 - 1, p_shared_owners));
    if (!v36)
    {
      ((void (*)())v41->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  if (__p)
    operator delete(__p);
  if (v44)
  {
    v37 = (unint64_t *)&v44->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)())v44->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (v42)
    operator delete(v42);
  fclose(v10);

}

- (void)debugPrintTensor:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  const char *i;
  unint64_t v24;
  int v25;
  int32x4_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  int32x4_t *v30;
  int32x4_t v31;
  uint64_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int8x16_t v38;
  __int32 v39;
  unint64_t *v40;
  unint64_t v41;
  int32x4_t *v42;
  std::runtime_error *exception;
  int v44;
  int32x4_t *__p;
  int32x4_t *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;

  v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  if (v44 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v9 = (*(uint64_t (**)())(*(_QWORD *)v47 + 24))();
  if (v48)
  {
    p_shared_owners = (unint64_t *)&v48->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v48->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
  v12 = objc_retainAutorelease(v4);
  v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  printf("DEBUG>> %s = [", v17);
  v22 = 0;
  for (i = "; ; i = ", ")
  {
    objc_msgSend_tensor(self, v18, v19, v20, v21);
    if (__p == v46)
    {
      v27 = 0;
      v28 = v48;
      if (!v48)
        goto LABEL_23;
      goto LABEL_20;
    }
    v24 = (char *)v46 - (char *)__p - 8;
    if (v24 < 0x38)
    {
      v25 = 1;
      v26 = __p;
      do
      {
LABEL_18:
        v39 = v26->i32[0];
        v26 = (int32x4_t *)((char *)v26 + 8);
        v25 *= v39;
      }
      while (v26 != v46);
      goto LABEL_19;
    }
    v29 = (v24 >> 3) + 1;
    v26 = (int32x4_t *)((char *)__p + 8 * (v29 & 0x3FFFFFFFFFFFFFF8));
    v30 = __p + 2;
    v31.i64[0] = 0x100000001;
    v31.i64[1] = 0x100000001;
    v32 = v29 & 0x3FFFFFFFFFFFFFF8;
    v33.i64[0] = 0x100000001;
    v33.i64[1] = 0x100000001;
    do
    {
      v35 = v30[-2];
      v34 = v30[-1];
      v37 = *v30;
      v36 = v30[1];
      v30 += 4;
      v31 = vmulq_s32(v31, vuzp1q_s32(v35, v34));
      v33 = vmulq_s32(v33, vuzp1q_s32(v37, v36));
      v32 -= 8;
    }
    while (v32);
    v38 = (int8x16_t)vmulq_s32(v33, v31);
    *(int32x2_t *)v38.i8 = vmul_s32(*(int32x2_t *)v38.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
    v25 = v38.i32[0] * v38.i32[1];
    if (v29 != (v29 & 0x3FFFFFFFFFFFFFF8))
      goto LABEL_18;
LABEL_19:
    v27 = v25;
    v28 = v48;
    if (!v48)
      goto LABEL_23;
LABEL_20:
    v40 = (unint64_t *)&v28->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (v41)
    {
LABEL_23:
      v42 = __p;
      if (!__p)
        goto LABEL_25;
LABEL_24:
      v46 = v42;
      operator delete(v42);
      goto LABEL_25;
    }
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    v42 = __p;
    if (__p)
      goto LABEL_24;
LABEL_25:
    if (v22 >= v27)
      break;
    printf("%s%f", i, *(float *)(v9 + 4 * v22++));
  }
  puts("]");

}

- (float)cosineSimilarity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  float v20;
  unint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float *v26;
  float *v27;
  uint64_t v28;
  float v29;
  float v30;
  unint64_t v31;
  uint64_t v32;
  float *v33;
  float *v34;
  float v35;
  float v36;
  float v37;
  std::runtime_error *exception;
  std::runtime_error *v40;
  int v41;
  void *__p;
  uint64_t v43;
  std::__shared_weak_count *v44;

  v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  if (v41 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v13 = (*(uint64_t (**)())(*(_QWORD *)v43 + 24))();
  v14 = (unint64_t)v9;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)())v44->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (__p)
    operator delete(__p);
  if (!v4)
  {
    v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v40, "Incorrect data type requested.");
    __cxa_throw(v40, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  objc_msgSend_tensor(v4, v9, v10, v11, v12, &off_250F5D430);
  v17 = (*(uint64_t (**)())(*(_QWORD *)v43 + 24))();
  if (v44)
  {
    v18 = (unint64_t *)&v44->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)())v44->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (__p)
    operator delete(__p);
  v20 = 0.0;
  if (v14 >= 4)
  {
    v21 = v14 >> 2;
    if (v14 >> 2 <= 1)
      v21 = 1;
    if (v21 >= 2)
    {
      v22 = v21 & 0x3FFFFFFFFFFFFFFELL;
      v26 = (float *)(v13 + 4);
      v27 = (float *)(v17 + 4);
      v23 = 0.0;
      v28 = v21 & 0x3FFFFFFFFFFFFFFELL;
      v24 = 0.0;
      v25 = 0.0;
      do
      {
        v29 = *(v26 - 1);
        v30 = *(v27 - 1);
        v23 = (float)(v23 + (float)(v29 * v30)) + (float)(*v26 * *v27);
        v24 = (float)(v24 + (float)(v30 * v30)) + (float)(*v27 * *v27);
        v25 = (float)(v25 + (float)(v29 * v29)) + (float)(*v26 * *v26);
        v26 += 2;
        v27 += 2;
        v28 -= 2;
      }
      while (v28);
      if (v21 == v22)
      {
LABEL_27:
        v20 = 0.0;
        if (v25 != 0.0 && v24 != 0.0)
          v20 = v23 / (float)(sqrtf(v25) * sqrtf(v24));
        goto LABEL_30;
      }
    }
    else
    {
      v22 = 0;
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
    }
    v31 = v21 - v22;
    v32 = 4 * v22;
    v33 = (float *)(v13 + 4 * v22);
    v34 = (float *)(v17 + v32);
    do
    {
      v35 = *v33++;
      v36 = v35;
      v37 = *v34++;
      v23 = v23 + (float)(v36 * v37);
      v25 = v25 + (float)(v36 * v36);
      v24 = v24 + (float)(v37 * v37);
      --v31;
    }
    while (v31);
    goto LABEL_27;
  }
LABEL_30:

  return v20;
}

- (float)l2Distance:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  float v20;
  unint64_t v21;
  uint64_t v22;
  float32x4_t *v23;
  float32x4_t *v24;
  uint64_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  unint64_t v30;
  uint64_t v31;
  float *v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  std::runtime_error *exception;
  std::runtime_error *v40;
  int v41;
  void *__p;
  uint64_t v43;
  std::__shared_weak_count *v44;

  v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  if (v41 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v13 = (*(uint64_t (**)())(*(_QWORD *)v43 + 24))();
  v14 = (unint64_t)v9;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)())v44->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (__p)
    operator delete(__p);
  if (!v4)
  {
    v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v40, "Incorrect data type requested.");
    __cxa_throw(v40, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  objc_msgSend_tensor(v4, v9, v10, v11, v12, &off_250F5D430);
  v17 = (*(uint64_t (**)())(*(_QWORD *)v43 + 24))();
  if (v44)
  {
    v18 = (unint64_t *)&v44->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)())v44->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (__p)
    operator delete(__p);
  v20 = 0.0;
  if (v14 >= 4)
  {
    v21 = v14 >> 2;
    if (v14 >> 2 <= 1)
      v21 = 1;
    if (v21 < 8)
    {
      v22 = 0;
LABEL_25:
      v30 = v21 - v22;
      v31 = 4 * v22;
      v32 = (float *)(v13 + 4 * v22);
      v33 = (float *)(v17 + v31);
      do
      {
        v34 = *v32++;
        v35 = v34;
        v36 = *v33++;
        v20 = v20 + (float)((float)(v35 - v36) * (float)(v35 - v36));
        --v30;
      }
      while (v30);
      goto LABEL_27;
    }
    v22 = v21 & 0x3FFFFFFFFFFFFFF8;
    v23 = (float32x4_t *)(v13 + 16);
    v24 = (float32x4_t *)(v17 + 16);
    v25 = v21 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v26 = vsubq_f32(v23[-1], v24[-1]);
      v27 = vsubq_f32(*v23, *v24);
      v28 = vmulq_f32(v26, v26);
      v29 = vmulq_f32(v27, v27);
      v20 = (float)((float)((float)((float)((float)((float)((float)(v20 + v28.f32[0]) + v28.f32[1]) + v28.f32[2])
                                          + v28.f32[3])
                                  + v29.f32[0])
                          + v29.f32[1])
                  + v29.f32[2])
          + v29.f32[3];
      v23 += 2;
      v24 += 2;
      v25 -= 8;
    }
    while (v25);
    if (v21 != v22)
      goto LABEL_25;
  }
LABEL_27:
  v37 = sqrtf(v20);

  return v37;
}

+ (id)copy:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  IHKFeatureVector *v29;
  const void *v30;
  int64_t v31;
  char *v32;
  char *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t (**v44)();
  int v45;
  void *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  __int128 v51;
  void *__p[2];
  __int128 v53;
  std::__shared_weak_count *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  std::__shared_weak_count *v58;
  int v59;
  uint64_t (**v60)();
  int v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;

  v3 = a3;
  v8 = v3;
  if (v3)
  {
    objc_msgSend_tensor(v3, v4, v5, v6, v7);
    v59 = DWORD2(v55);
    objc_msgSend_tensor(v8, v9, v10, v11, v12);
  }
  else
  {
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    v59 = 0;
    v54 = 0;
    *(_OWORD *)__p = 0u;
    v53 = 0u;
    v51 = 0u;
  }
  sub_23ECB0EA8((uint64_t)&v60, &v59, (uint64_t)__p);
  *(_QWORD *)&v51 = &off_250F5D430;
  v17 = v54;
  if (v54)
  {
    p_shared_owners = (unint64_t *)&v54->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  *(_QWORD *)&v55 = &off_250F5D430;
  v20 = v58;
  if (v58)
  {
    v21 = (unint64_t *)&v58->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if ((_QWORD)v56)
  {
    *((_QWORD *)&v56 + 1) = v56;
    operator delete((void *)v56);
  }
  if (v8)
  {
    objc_msgSend_tensor(v8, v13, v14, v15, v16);
  }
  else
  {
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
  }
  sub_23ECAF7CC((uint64_t)&v60, (uint64_t)&v55);
  *(_QWORD *)&v55 = &off_250F5D430;
  v23 = v58;
  if (v58)
  {
    v24 = (unint64_t *)&v58->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if ((_QWORD)v56)
  {
    *((_QWORD *)&v56 + 1) = v56;
    operator delete((void *)v56);
  }
  v29 = [IHKFeatureVector alloc];
  v44 = &off_250F5D430;
  v45 = v61;
  v47 = 0;
  v48 = 0;
  v46 = 0;
  v30 = v62;
  v31 = v63 - v62;
  if (v63 != v62)
  {
    if (v31 < 0)
      sub_23ECB1668();
    v32 = (char *)operator new(v63 - v62);
    v33 = &v32[8 * (v31 >> 3)];
    v46 = v32;
    v48 = v33;
    memcpy(v32, v30, v31);
    v47 = v33;
  }
  v49 = v64;
  v50 = v65;
  if (v65)
  {
    v34 = (unint64_t *)&v65->__shared_owners_;
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
  v44 = &off_250F5D3E8;
  v36 = (void *)objc_msgSend_initWithTensor_(v29, v26, (uint64_t)&v44, v27, v28);
  v44 = &off_250F5D430;
  v37 = v50;
  if (v50)
  {
    v38 = (unint64_t *)&v50->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  v60 = &off_250F5D430;
  v40 = v65;
  if (v65)
  {
    v41 = (unint64_t *)&v65->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  if (v62)
  {
    v63 = v62;
    operator delete(v62);
  }

  return v36;
}

+ (id)addFeatureVectorA:(id)a3 B:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *p_shared_owners;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  float *v34;
  float *v35;
  float *v36;
  float v37;
  float v38;
  float v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  IHKFeatureVector *v43;
  const void *v44;
  int64_t v45;
  char *v46;
  char *v47;
  uint64_t *v48;
  unint64_t v49;
  void *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  uint64_t *v55;
  unint64_t v56;
  float32x4_t *v58;
  float32x4_t *v59;
  float32x4_t *v60;
  uint64_t v61;
  float32x4_t v62;
  std::runtime_error *exception;
  std::runtime_error *v64;
  std::runtime_error *v65;
  uint64_t (**v66)();
  int v67;
  void *v68;
  void *v69;
  char *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  uint64_t (**v73)();
  void *v74[4];
  std::__shared_weak_count *v75;
  int v76;
  __int128 v77;
  __int128 __p;
  __int128 v79;
  std::__shared_weak_count *v80;

  v5 = a3;
  v10 = a4;
  if (!v5)
  {
    v80 = 0;
    __p = 0u;
    v79 = 0u;
    v77 = 0u;
LABEL_61:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  objc_msgSend_tensor(v5, v6, v7, v8, v9);
  if (DWORD2(v77) != 4)
    goto LABEL_61;
  v15 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)&v79 + 1) + 24))(*((_QWORD *)&v79 + 1));
  v16 = (unint64_t)v11;
  *(_QWORD *)&v77 = &off_250F5D430;
  if (v80)
  {
    p_shared_owners = &v80->__shared_owners_;
    do
      v18 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v18 - 1, (unint64_t *)p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (!v10)
  {
    v80 = 0;
    __p = 0u;
    v79 = 0u;
    v77 = 0u;
    v64 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v64, "Incorrect data type requested.");
    __cxa_throw(v64, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  objc_msgSend_tensor(v10, v11, v12, v13, v14);
  v23 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)&v79 + 1) + 24))(*((_QWORD *)&v79 + 1));
  *(_QWORD *)&v77 = &off_250F5D430;
  if (v80)
  {
    v24 = &v80->__shared_owners_;
    do
      v25 = __ldaxr((unint64_t *)v24);
    while (__stlxr(v25 - 1, (unint64_t *)v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  v76 = 4;
  objc_msgSend_tensor(v5, v19, v20, v21, v22);
  sub_23ECB0EA8((uint64_t)&v77, &v76, (uint64_t)v74);
  v73 = &off_250F5D430;
  v26 = v75;
  if (v75)
  {
    v27 = (unint64_t *)&v75->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  if (v74[0])
  {
    v74[1] = v74[0];
    operator delete(v74[0]);
  }
  if (DWORD2(v77) != 4)
  {
    v65 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v65, "Incorrect data type requested.");
    __cxa_throw(v65, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v29 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)&v79 + 1) + 24))(*((_QWORD *)&v79 + 1));
  if (v16 >= 4)
  {
    v30 = v16 >> 2;
    if (v16 >> 2 <= 1)
      v30 = 1;
    if (v30 < 8)
    {
      v31 = 0;
LABEL_31:
      v32 = v30 - v31;
      v33 = 4 * v31;
      v34 = (float *)(v15 + 4 * v31);
      v35 = (float *)(v23 + v33);
      v36 = (float *)(v29 + v33);
      do
      {
        v37 = *v34++;
        v38 = v37;
        v39 = *v35++;
        *v36++ = v38 + v39;
        --v32;
      }
      while (v32);
      goto LABEL_33;
    }
    v31 = 0;
    if ((unint64_t)(v29 - v15) < 0x20)
      goto LABEL_31;
    if ((unint64_t)(v29 - v23) < 0x20)
      goto LABEL_31;
    v31 = v30 & 0x3FFFFFFFFFFFFFF8;
    v58 = (float32x4_t *)(v15 + 16);
    v59 = (float32x4_t *)(v23 + 16);
    v60 = (float32x4_t *)(v29 + 16);
    v61 = v30 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v62 = vaddq_f32(*v58, *v59);
      v60[-1] = vaddq_f32(v58[-1], v59[-1]);
      *v60 = v62;
      v58 += 2;
      v59 += 2;
      v60 += 2;
      v61 -= 8;
    }
    while (v61);
    if (v30 != v31)
      goto LABEL_31;
  }
LABEL_33:
  v43 = [IHKFeatureVector alloc];
  v66 = &off_250F5D430;
  v67 = DWORD2(v77);
  v69 = 0;
  v70 = 0;
  v68 = 0;
  v44 = (const void *)__p;
  v45 = *((_QWORD *)&__p + 1) - __p;
  if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
  {
    if (v45 < 0)
      sub_23ECB1668();
    v46 = (char *)operator new(*((_QWORD *)&__p + 1) - __p);
    v47 = &v46[8 * (v45 >> 3)];
    v68 = v46;
    v70 = v47;
    memcpy(v46, v44, v45);
    v69 = v47;
  }
  v71 = *((_QWORD *)&v79 + 1);
  v72 = v80;
  if (v80)
  {
    v48 = &v80->__shared_owners_;
    do
      v49 = __ldxr((unint64_t *)v48);
    while (__stxr(v49 + 1, (unint64_t *)v48));
  }
  v66 = &off_250F5D3E8;
  v50 = (void *)objc_msgSend_initWithTensor_(v43, v40, (uint64_t)&v66, v41, v42);
  v66 = &off_250F5D430;
  v51 = v72;
  if (v72)
  {
    v52 = (unint64_t *)&v72->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (v68)
  {
    v69 = v68;
    operator delete(v68);
  }
  *(_QWORD *)&v77 = &off_250F5D430;
  v54 = v80;
  if (v80)
  {
    v55 = &v80->__shared_owners_;
    do
      v56 = __ldaxr((unint64_t *)v55);
    while (__stlxr(v56 - 1, (unint64_t *)v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }

  return v50;
}

+ (id)multiplyFeatureVector:(id)a3 byScalar:(float)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  float v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  float32x4_t *v27;
  float32x4_t *v28;
  uint64_t v29;
  float32x4_t v30;
  unint64_t v31;
  uint64_t v32;
  float *v33;
  float *v34;
  float v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  IHKFeatureVector *v39;
  const void *v40;
  int64_t v41;
  char *v42;
  char *v43;
  unint64_t *v44;
  unint64_t v45;
  void *v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::runtime_error *exception;
  std::runtime_error *v55;
  uint64_t v56;
  uint64_t (**v57)();
  int v58;
  void *v59;
  void *v60;
  char *v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  __int128 v64;
  void *__p[2];
  __int128 v66;
  std::__shared_weak_count *v67;
  int v68;
  uint64_t (**v69)();
  int v70;
  _BYTE *v71;
  _BYTE *v72;
  uint64_t v73;
  std::__shared_weak_count *v74;

  v56 = *(_QWORD *)&a4;
  v4 = a3;
  v9 = v4;
  v68 = 4;
  if (v4)
  {
    objc_msgSend_tensor(v4, v5, v6, v7, v8);
  }
  else
  {
    v67 = 0;
    *(_OWORD *)__p = 0u;
    v66 = 0u;
    v64 = 0u;
  }
  sub_23ECB0EA8((uint64_t)&v69, &v68, (uint64_t)__p);
  *(_QWORD *)&v64 = &off_250F5D430;
  v10 = v67;
  if (v67)
  {
    p_shared_owners = (unint64_t *)&v67->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v70 != 4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Incorrect data type requested.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v73 + 24))(v73);
  if (!v9)
  {
    v67 = 0;
    *(_OWORD *)__p = 0u;
    v66 = 0u;
    v64 = 0u;
LABEL_54:
    v55 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v55, "Incorrect data type requested.");
    __cxa_throw(v55, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v18 = v13;
  v19 = (unint64_t)v14;
  objc_msgSend_tensor(v9, v14, v15, v16, v17);
  if (DWORD2(v64) != 4)
    goto LABEL_54;
  v20 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)&v66 + 1) + 24))(*((_QWORD *)&v66 + 1));
  *(_QWORD *)&v64 = &off_250F5D430;
  v21 = v67;
  v22 = *(float *)&v56;
  if (v67)
  {
    v23 = (unint64_t *)&v67->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
      v22 = *(float *)&v56;
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
    v22 = *(float *)&v56;
  }
  if (v19 >= 4)
  {
    v25 = 0;
    v26 = v19 >> 2;
    if (v19 >> 2 <= 1)
      v26 = 1;
    if (v26 < 8)
      goto LABEL_29;
    if ((unint64_t)(v18 - v20) < 0x20)
      goto LABEL_29;
    v25 = v26 & 0x3FFFFFFFFFFFFFF8;
    v27 = (float32x4_t *)(v20 + 16);
    v28 = (float32x4_t *)(v18 + 16);
    v29 = v26 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      v30 = vmulq_n_f32(*v27, v22);
      v28[-1] = vmulq_n_f32(v27[-1], v22);
      *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 8;
    }
    while (v29);
    if (v26 != v25)
    {
LABEL_29:
      v31 = v26 - v25;
      v32 = 4 * v25;
      v33 = (float *)(v20 + 4 * v25);
      v34 = (float *)(v18 + v32);
      do
      {
        v35 = *v33++;
        *v34++ = v35 * v22;
        --v31;
      }
      while (v31);
    }
  }
  v39 = [IHKFeatureVector alloc];
  v57 = &off_250F5D430;
  v58 = v70;
  v60 = 0;
  v61 = 0;
  v59 = 0;
  v40 = v71;
  v41 = v72 - v71;
  if (v72 != v71)
  {
    if (v41 < 0)
      sub_23ECB1668();
    v42 = (char *)operator new(v72 - v71);
    v43 = &v42[8 * (v41 >> 3)];
    v59 = v42;
    v61 = v43;
    memcpy(v42, v40, v41);
    v60 = v43;
  }
  v62 = v73;
  v63 = v74;
  if (v74)
  {
    v44 = (unint64_t *)&v74->__shared_owners_;
    do
      v45 = __ldxr(v44);
    while (__stxr(v45 + 1, v44));
  }
  v57 = &off_250F5D3E8;
  v46 = (void *)objc_msgSend_initWithTensor_(v39, v36, (uint64_t)&v57, v37, v38, v56);
  v57 = &off_250F5D430;
  v47 = v63;
  if (v63)
  {
    v48 = (unint64_t *)&v63->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  if (v59)
  {
    v60 = v59;
    operator delete(v59);
  }
  v69 = &off_250F5D430;
  v50 = v74;
  if (v74)
  {
    v51 = (unint64_t *)&v74->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  if (v71)
  {
    v72 = v71;
    operator delete(v71);
  }

  return v46;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  char *v12;
  char *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  unint64_t v27;
  int v28;
  char *v29;
  uint64_t v30;
  int32x4_t *v31;
  int32x4_t v32;
  uint64_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int8x16_t v39;
  int v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  int32x4_t *v45;
  char *v46;
  std::__shared_weak_count *v47;
  _BYTE *__p;
  _BYTE *v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  _BYTE *v52;
  char *v53;

  v4 = a3;
  objc_msgSend_tensor(self, v5, v6, v7, v8);
  v52 = 0;
  v53 = 0;
  v11 = v49 - __p;
  if (v49 != __p)
  {
    if (v11 < 0)
      sub_23ECB1668();
    v12 = (char *)operator new(v49 - __p);
    v13 = &v12[8 * (v11 >> 3)];
    v52 = v12;
    memcpy(v12, __p, v11);
    v53 = v13;
  }
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v51->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (__p)
    operator delete(__p);
  objc_msgSend_encodeInt_forKey_(v4, v9, (unint64_t)(v53 - v52) >> 3, (uint64_t)CFSTR("kTensorNDims"), v10);
  objc_msgSend_encodeBytes_length_forKey_(v4, v16, (uint64_t)v52, v53 - v52, (uint64_t)CFSTR("kTensorDimensions"));
  objc_msgSend_tensor(self, v17, v18, v19, v20);
  v21 = (*(uint64_t (**)())(*(_QWORD *)v50 + 24))();
  objc_msgSend_tensor(self, v22, v23, v24, v25);
  if (v45 != (int32x4_t *)v46)
  {
    v27 = v46 - (char *)v45 - 8;
    if (v27 >= 0x38)
    {
      v30 = (v27 >> 3) + 1;
      v29 = &v45->i8[8 * (v30 & 0x3FFFFFFFFFFFFFF8)];
      v31 = v45 + 2;
      v32.i64[0] = 0x100000001;
      v32.i64[1] = 0x100000001;
      v33 = v30 & 0x3FFFFFFFFFFFFFF8;
      v34.i64[0] = 0x100000001;
      v34.i64[1] = 0x100000001;
      do
      {
        v36 = v31[-2];
        v35 = v31[-1];
        v38 = *v31;
        v37 = v31[1];
        v31 += 4;
        v32 = vmulq_s32(v32, vuzp1q_s32(v36, v35));
        v34 = vmulq_s32(v34, vuzp1q_s32(v38, v37));
        v33 -= 8;
      }
      while (v33);
      v39 = (int8x16_t)vmulq_s32(v34, v32);
      *(int32x2_t *)v39.i8 = vmul_s32(*(int32x2_t *)v39.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL));
      v28 = v39.i32[0] * v39.i32[1];
      if (v30 == (v30 & 0x3FFFFFFFFFFFFFF8))
        goto LABEL_19;
    }
    else
    {
      v28 = 1;
      v29 = (char *)v45;
    }
    do
    {
      v40 = *(_DWORD *)v29;
      v29 += 8;
      v28 *= v40;
    }
    while (v29 != v46);
LABEL_19:
    objc_msgSend_encodeBytes_length_forKey_(v4, v26, v21, 4 * v28, (uint64_t)CFSTR("kTensorValues"));
    goto LABEL_20;
  }
  objc_msgSend_encodeBytes_length_forKey_(v4, v26, v21, 0, (uint64_t)CFSTR("kTensorValues"));
LABEL_20:
  if (v47)
  {
    v41 = (unint64_t *)&v47->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)())v47->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  if (v45)
    operator delete(v45);
  if (v51)
  {
    v43 = (unint64_t *)&v51->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)())v51->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  if (__p)
    operator delete(__p);
  if (v52)
    operator delete(v52);

}

- (IHKFeatureVector)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  size_t v10;
  int32x4_t *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const void *v19;
  int v20;
  int32x4_t *v21;
  IHKFeatureVector *v22;
  unint64_t v23;
  int32x4_t *v24;
  int32x4_t v25;
  uint64_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int8x16_t v32;
  int v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int64_t v39;
  char *v40;
  char *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t (**v51)();
  int v52;
  void *v53;
  void *v54;
  char *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  void *__p;
  char *v59;
  char *v60;
  int v61;
  uint64_t (**v62)();
  int v63;
  void *v64;
  _BYTE *v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  size_t v68;
  int32x4_t *v69;
  char *v70;
  char *v71;

  v4 = a3;
  v8 = objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("kTensorNDims"), v6, v7);
  v69 = 0;
  v70 = 0;
  v71 = 0;
  if (!v8)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (v8 < 0)
    sub_23ECB1668();
  v9 = v8;
  v10 = 8 * v8;
  v11 = (int32x4_t *)operator new(v10);
  v69 = v11;
  v71 = &v11->i8[8 * v9];
  bzero(v11, v10);
  v70 = &v11->i8[v10];
  v68 = 0;
  v12 = objc_retainAutorelease(v4);
  v15 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(v12, v13, (uint64_t)CFSTR("kTensorDimensions"), (uint64_t)&v68, v14);
  if (v68 != v10)
    goto LABEL_36;
  memcpy(v11, v15, v10);
  v68 = 0;
  v16 = objc_retainAutorelease(v12);
  v19 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(v16, v17, (uint64_t)CFSTR("kTensorValues"), (uint64_t)&v68, v18);
  if (v10 - 8 < 0x38)
  {
    v20 = 1;
    v21 = v11;
    do
    {
LABEL_10:
      v33 = v21->i32[0];
      v21 = (int32x4_t *)((char *)v21 + 8);
      v20 *= v33;
    }
    while (v21 != (int32x4_t *)&v11->i8[v10]);
    goto LABEL_11;
  }
  v23 = ((v10 - 8) >> 3) + 1;
  v21 = (int32x4_t *)((char *)v11 + 8 * (v23 & 0x3FFFFFFFFFFFFFF8));
  v24 = v11 + 2;
  v25.i64[0] = 0x100000001;
  v25.i64[1] = 0x100000001;
  v26 = v23 & 0x3FFFFFFFFFFFFFF8;
  v27.i64[0] = 0x100000001;
  v27.i64[1] = 0x100000001;
  do
  {
    v29 = v24[-2];
    v28 = v24[-1];
    v31 = *v24;
    v30 = v24[1];
    v24 += 4;
    v25 = vmulq_s32(v25, vuzp1q_s32(v29, v28));
    v27 = vmulq_s32(v27, vuzp1q_s32(v31, v30));
    v26 -= 8;
  }
  while (v26);
  v32 = (int8x16_t)vmulq_s32(v27, v25);
  *(int32x2_t *)v32.i8 = vmul_s32(*(int32x2_t *)v32.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL));
  v20 = v32.i32[0] * v32.i32[1];
  if (v23 != (v23 & 0x3FFFFFFFFFFFFFF8))
    goto LABEL_10;
LABEL_11:
  if (v68 != 4 * v20)
  {
LABEL_36:
    v22 = 0;
LABEL_37:
    operator delete(v11);
    goto LABEL_38;
  }
  v61 = 4;
  __p = operator new(v10);
  v60 = (char *)__p + 8 * v9;
  memcpy(__p, v11, v10);
  v59 = (char *)__p + 8 * v9;
  sub_23ECB0EA8((uint64_t)&v62, &v61, (uint64_t)&__p);
  if (__p)
  {
    v59 = (char *)__p;
    operator delete(__p);
  }
  v34 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v66 + 24))(v66);
  memcpy(v34, v19, v68);
  v51 = &off_250F5D430;
  v52 = v63;
  v54 = 0;
  v55 = 0;
  v53 = 0;
  v38 = v64;
  v39 = v65 - (_BYTE *)v64;
  if (v65 != v64)
  {
    if (v39 < 0)
      sub_23ECB1668();
    v40 = (char *)operator new(v65 - (_BYTE *)v64);
    v41 = &v40[8 * (v39 >> 3)];
    v53 = v40;
    v55 = v41;
    memcpy(v40, v38, v39);
    v54 = v41;
  }
  v56 = v66;
  v57 = v67;
  if (v67)
  {
    p_shared_owners = (unint64_t *)&v67->__shared_owners_;
    do
      v43 = __ldxr(p_shared_owners);
    while (__stxr(v43 + 1, p_shared_owners));
  }
  v51 = &off_250F5D3E8;
  v22 = (IHKFeatureVector *)(id)objc_msgSend_initWithTensor_(self, v35, (uint64_t)&v51, v36, v37);
  v51 = &off_250F5D430;
  v44 = v57;
  if (v57)
  {
    v45 = (unint64_t *)&v57->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  v62 = &off_250F5D430;
  v47 = v67;
  if (v67)
  {
    v48 = (unint64_t *)&v67->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  v11 = v69;
  self = v22;
  if (v69)
    goto LABEL_37;
LABEL_38:

  return v22;
}

- (EspressoTensor)tensor
{
  EspressoTensor *result;

  objc_copyCppObjectAtomic(retstr, &self->_tensor, (void (__cdecl *)(void *, const void *))sub_23ECB0A50);
  return result;
}

- (void)setTensor:(EspressoTensor *)a3
{
  objc_copyCppObjectAtomic(&self->_tensor, a3, (void (__cdecl *)(void *, const void *))sub_23ECB0B40);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *begin;

  self->_tensor._vptr$Tensor = (void **)&off_250F5D430;
  cntrl = self->_tensor.storage_.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (v5)
  {
LABEL_5:
    begin = self->_tensor.shape_.sizes_.__begin_;
    if (!begin)
      return;
    goto LABEL_6;
  }
  (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  begin = self->_tensor.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_tensor.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 4;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 1) = &off_250F5D3E8;
  return self;
}

@end
