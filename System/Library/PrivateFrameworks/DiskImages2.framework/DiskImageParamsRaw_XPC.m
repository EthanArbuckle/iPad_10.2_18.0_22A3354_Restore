@implementation DiskImageParamsRaw_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  uint64_t *v2;
  uint64_t *v4;
  void *v5;
  void *v6;
  AEA_backend *v7;
  _QWORD *p_lpsrc;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  AEA_backend *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  AEA_backend *v34;
  _QWORD *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  AEA_backend *v39;
  uint64_t compressed_blk_size;
  uint64_t (**AEAIdentifier)();
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  void *lpsrc;
  std::__shared_weak_count *v64;
  AEA_backend *v65;
  std::__shared_weak_count *v66;

  v4 = v2;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backend");
  }
  else
  {
    v61 = 0;
    v62 = 0;
  }
  get_sink_backend((uint64_t)&v61, &lpsrc);
  if (lpsrc
  {
    v65 = v7;
    v66 = v64;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = &v65;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v9 = v64;
  if (v64)
  {
    p_shared_owners = (unint64_t *)&v64->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v62;
  if (v62)
  {
    v13 = (unint64_t *)&v62->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  v16 = v65;
  if (v65)
  {
    -[DiskImageParamsXPC setBlockSize:](self, "setBlockSize:", *(_QWORD *)(*((_QWORD *)v65 + 3) + 64));
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "backend");
    }
    else
    {
      lpsrc = 0;
      v64 = 0;
    }
    v19 = -[DiskImageParamsXPC blockSize](self, "blockSize", v61);
    v20 = operator new();
    v21 = di_utils::random_uuid((di_utils *)v20);
    *(_BYTE *)(v20 + 8) = 0;
    *(_QWORD *)v20 = &off_24CEEDCF0;
    v23 = v64;
    *(_QWORD *)(v20 + 16) = lpsrc;
    *(_QWORD *)(v20 + 24) = v23;
    if (v23)
    {
      v24 = (unint64_t *)&v23->__shared_owners_;
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
      v26 = v64;
    }
    else
    {
      v26 = 0;
    }
    *(_QWORD *)(v20 + 72) = v21;
    *(_QWORD *)(v20 + 80) = v22;
    *(_QWORD *)(v20 + 32) = 512;
    *(_QWORD *)(v20 + 40) = v19;
    *(_QWORD *)(v20 + 48) = 1;
    *(_QWORD *)(v20 + 56) = 2 * v19;
    *(_QWORD *)(v20 + 64) = 0;
    *v4 = v20;
    if (v26)
    {
      v27 = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }

  }
  v29 = v66;
  if (!v66)
    goto LABEL_37;
  v30 = (unint64_t *)&v66->__shared_owners_;
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    if (v16)
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
  }
  else
  {
LABEL_37:
    if (v16)
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
  }
  -[DiskImageParamsXPC backendXPC](self, "backendXPC", v61);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "backend");
    if (lpsrc)
    {
      if (v34)
      {
        v65 = v34;
        v66 = v64;
        v35 = &lpsrc;
        goto LABEL_46;
      }
    }
  }
  else
  {
    lpsrc = 0;
    v64 = 0;
  }
  v35 = &v65;
LABEL_46:
  *v35 = 0;
  v35[1] = 0;
  v36 = v64;
  if (v64)
  {
    v37 = (unint64_t *)&v64->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  v39 = v65;
  if (v65)
  {
    compressed_blk_size = AEA_backend::get_compressed_blk_size((AEAContext **)v65);
    AEAIdentifier = AEAwrapper::Context::getAEAIdentifier((AEAContext_impl **)(*((_QWORD *)v39 + 7) + 8));
    v43 = v42;
    v15 = operator new();
    v44 = v15;
    v45 = v66;
    if (v66)
    {
      v46 = (unint64_t *)&v66->__shared_owners_;
      do
        v47 = __ldxr(v46);
      while (__stxr(v47 + 1, v46));
      *(_BYTE *)(v15 + 8) = 0;
      *(_QWORD *)v15 = &off_24CEEDCF0;
      *(_QWORD *)(v15 + 16) = v39;
      *(_QWORD *)(v15 + 24) = v45;
      do
        v48 = __ldxr(v46);
      while (__stxr(v48 + 1, v46));
    }
    else
    {
      *(_BYTE *)(v15 + 8) = 0;
      *(_QWORD *)v15 = &off_24CEEDCF0;
      *(_QWORD *)(v15 + 16) = v39;
      *(_QWORD *)(v15 + 24) = 0;
    }
    *(_QWORD *)(v15 + 72) = AEAIdentifier;
    *(_QWORD *)(v15 + 80) = v43;
    *(_QWORD *)(v15 + 32) = 512;
    *(_QWORD *)(v15 + 40) = compressed_blk_size;
    *(_QWORD *)(v15 + 48) = 1;
    *(_QWORD *)(v15 + 56) = 2 * compressed_blk_size;
    *(_QWORD *)(v15 + 64) = 0;
    if (v45)
    {
      v49 = (unint64_t *)&v45->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    *v4 = v44;
  }
  v51 = v66;
  if (!v66)
    goto LABEL_69;
  v52 = (unint64_t *)&v66->__shared_owners_;
  do
    v53 = __ldaxr(v52);
  while (__stlxr(v53 - 1, v52));
  if (!v53)
  {
    ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
    std::__shared_weak_count::__release_weak(v51);
    if (v39)
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
  }
  else
  {
LABEL_69:
    if (v39)
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
  }
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    objc_msgSend(v54, "backend");
  }
  else
  {
    v65 = 0;
    v66 = 0;
  }
  v56 = -[DiskImageParamsXPC blockSize](self, "blockSize");
  v57 = operator new();
  DiskImageRaw::DiskImageRaw(v57, &v65, v56);
  *v4 = v57;
  v58 = v66;
  if (v66)
  {
    v59 = (unint64_t *)&v66->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }

  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isWritableFormat
{
  void *v2;
  void *v3;
  void *v4;
  void **p_lpsrc;
  std::__shared_weak_count *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  void *lpsrc;
  std::__shared_weak_count *v20;
  void *v21;
  std::__shared_weak_count *v22;

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "backend");
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  get_sink_backend((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    v21 = v4;
    v22 = v20;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = &v21;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v7 = v21;
  v6 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v10 = v20;
  if (v20)
  {
    v11 = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v18;
  if (v18)
  {
    v14 = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return v7 == 0;
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

@end
