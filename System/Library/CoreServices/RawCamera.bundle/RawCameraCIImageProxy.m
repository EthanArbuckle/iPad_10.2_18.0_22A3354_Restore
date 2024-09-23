@implementation RawCameraCIImageProxy

- (id)proxyedObject
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;

  objc_msgSend_rawImage(self, a2, v2, v3, v4);
  if (v19)
  {
    objc_msgSend_ciImage(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  else
  {
    v11 = 0;
  }
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
      if (!v11)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  if (v11)
  {
LABEL_9:
    sub_1D532D0B0(self->rawImage.__ptr_, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCiImage_(self, v15, (uint64_t)v14, v16, v17);

  }
LABEL_10:
  objc_msgSend_ciImage(self, v6, v7, v8, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (RawCameraCIImageProxy)initWithRawImage:(shared_ptr<CRawImage>)a3
{
  uint64_t v3;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  if (self)
  {
    v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
    v12 = *(_QWORD *)a3.__ptr_;
    v13 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    objc_msgSend_setRawImage_(self, a2, (uint64_t)&v12, (uint64_t)a3.__cntrl_, v3);
    v8 = v13;
    if (v13)
    {
      v9 = (unint64_t *)&v13->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  return self;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend_proxyedObject(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selector(v4, v10, v11, v12, v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_invokeWithTarget_(v4, v14, (uint64_t)v9, v15, v16);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RawCameraCIImageProxy;
    -[RawCameraCIImageProxy forwardInvocation:](&v17, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_proxyedObject(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignatureForSelector_(v6, v7, (uint64_t)a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (shared_ptr<CRawImage>)rawImage
{
  void *v2;
  CRawImage *v3;
  __shared_weak_count *v4;
  shared_ptr<CRawImage> result;

  objc_copyCppObjectAtomic(v2, &self->rawImage, (void (__cdecl *)(void *, const void *))sub_1D52DE89C);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setRawImage:(shared_ptr<CRawImage>)a3
{
  objc_copyCppObjectAtomic(&self->rawImage, a3.__ptr_, (void (__cdecl *)(void *, const void *))sub_1D52DE8DC);
}

- (CIImage)ciImage
{
  return (CIImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCiImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  sub_1D5282EB4((uint64_t)&self->rawImage);
  objc_storeStrong((id *)&self->ciImage, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
