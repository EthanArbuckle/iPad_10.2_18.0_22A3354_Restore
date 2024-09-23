@implementation DiskImageParamsSparseBundle_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  uint64_t *v2;
  uint64_t *v4;
  void *v5;
  void *v6;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unique_ptr<DiskImage, std::default_delete<DiskImage>> v13;
  __int128 v14;
  __int128 v15;

  v4 = v2;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backend");
    v7 = v14;
  }
  else
  {
    v7 = 0uLL;
  }
  v15 = v7;
  v8 = -[DiskImageParamsXPC blockSize](self, "blockSize", 0);
  v9 = operator new();
  DiskImageSparseBundle::DiskImageSparseBundle(v9, &v15, v8);
  *v4 = v9;
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
  if (*((_QWORD *)&v15 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v13;
}

- (BOOL)isWritableFormat
{
  return 1;
}

- (unint64_t)numBlocks
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backend");
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 40))(v10);
  v5 = -[DiskImageParamsXPC blockSize](self, "blockSize");
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

  return v4 / v5;
}

- (BOOL)isSparseFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
