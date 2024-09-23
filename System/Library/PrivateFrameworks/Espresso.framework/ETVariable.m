@implementation ETVariable

- (ETVariable)initWithModelDef:(id)a3
{
  id v4;
  ETVariable *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ETVariable;
  v5 = -[ETVariable init](&v7, sel_init);
  -[ETVariable setModel:](v5, "setModel:", v4);
  -[ETVariable setInitializationMode:](v5, "setInitializationMode:", 0);

  return v5;
}

- (void)updateWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35[3];
  std::__shared_weak_count *v36;
  void *__p;
  uint64_t v38;
  char v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;

  v4 = a3;
  -[ETVariable model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "network");
    v7 = v40;
  }
  else
  {
    v7 = 0;
    v40 = 0;
    v41 = 0;
  }
  -[ETVariable name](self, "name");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
  Espresso::net::get_global(&v42, v7, (unsigned __int8 *)&__p);
  if (v39 < 0)
    operator delete(__p);

  v9 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  v12 = v42;
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)v42 + 56))(&__p, v42);
  v13 = (void *)*((_QWORD *)__p + 3);
  v14 = objc_retainAutorelease(v4);
  v15 = (const void *)objc_msgSend(v14, "bytes");
  v16 = 0;
  v17 = *((int *)__p + 2);
  do
  {
    v17 *= *(int *)((char *)__p + v16 + 12);
    v16 += 4;
  }
  while (v16 != 12);
  memcpy(v13, v15, 4 * v17);
  v18 = v43;
  v35[2] = v12;
  v36 = v43;
  if (v43)
  {
    v19 = (unint64_t *)&v43->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  v21 = (std::__shared_weak_count *)v38;
  v35[0] = (uint64_t)__p;
  v35[1] = v38;
  if (v38)
  {
    v22 = (unint64_t *)(v38 + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  Espresso::sync_copy_from_host(v12, v18, v35);
  if (v21)
  {
    v24 = (unint64_t *)&v21->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v26 = v36;
  if (v36)
  {
    v27 = (unint64_t *)&v36->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (std::__shared_weak_count *)v38;
  if (v38)
  {
    v30 = (unint64_t *)(v38 + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = v43;
  if (v43)
  {
    v33 = (unint64_t *)&v43->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

}

- (id)copyData
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD v25[2];
  void *__p;
  std::__shared_weak_count *v27;
  char v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;

  -[ETVariable model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "network");
    v5 = v29;
  }
  else
  {
    v5 = 0;
    v29 = 0;
    v30 = 0;
  }
  -[ETVariable name](self, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v6, "UTF8String"));
  Espresso::net::get_global(&v31, v5, (unsigned __int8 *)&__p);
  if (v28 < 0)
    operator delete(__p);

  v7 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  __p = 0;
  v27 = 0;
  v10 = v32;
  v25[0] = v31;
  v25[1] = v32;
  if (v32)
  {
    v11 = (unint64_t *)&v32->__shared_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  Espresso::sync_copy_to_host(v25, &__p);
  if (v10)
  {
    v13 = (unint64_t *)&v10->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v15 = 0;
  v16 = *((int *)__p + 2);
  do
  {
    v16 *= *(int *)((char *)__p + v15 + 12);
    v15 += 4;
  }
  while (v15 != 12);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *((_QWORD *)__p + 3), 4 * v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
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
  v21 = v32;
  if (v32)
  {
    v22 = (unint64_t *)&v32->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  return v17;
}

- (id)getOpaqueCopy
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  ETOpaqueCopy *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *__p[2];
  char v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  -[ETVariable model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "network");
    v5 = v17;
  }
  else
  {
    v5 = 0;
    v17 = 0;
    v18 = 0;
  }
  -[ETVariable name](self, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  Espresso::net::sync_copy_global(v5, (unsigned __int8 *)__p, &v19);
  if (v16 < 0)
    operator delete(__p[0]);

  v7 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  v10 = -[ETOpaqueCopy initWithAbstractBlobContainer:]([ETOpaqueCopy alloc], "initWithAbstractBlobContainer:", &v19);
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (id)swapWithOpaqueCopy:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  ETOpaqueCopy *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *__p[2];
  char v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  v4 = a3;
  v5 = (uint64_t *)objc_msgSend(v4, "getBlob");
  v6 = v5[1];
  v29 = *v5;
  v30 = (std::__shared_weak_count *)v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  -[ETVariable model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "network");
    v11 = v25;
  }
  else
  {
    v11 = 0;
    v25 = 0;
    v26 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](self->_name, "UTF8String"));
  Espresso::net::swap_global(v11, (__int128 *)__p, &v29, &v27);
  if (v24 < 0)
    operator delete(__p[0]);
  v12 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  v15 = -[ETOpaqueCopy initWithAbstractBlobContainer:]([ETOpaqueCopy alloc], "initWithAbstractBlobContainer:", &v27);
  v16 = v28;
  if (v28)
  {
    v17 = (unint64_t *)&v28->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v30;
  if (v30)
  {
    v20 = (unint64_t *)&v30->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  return v15;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)layerName
{
  return self->_layerName;
}

- (void)setLayerName:(id)a3
{
  objc_storeStrong((id *)&self->_layerName, a3);
}

- (unint64_t)initializationMode
{
  return self->_initializationMode;
}

- (void)setInitializationMode:(unint64_t)a3
{
  self->_initializationMode = a3;
}

- (float)initializationAlpha
{
  return self->_initializationAlpha;
}

- (void)setInitializationAlpha:(float)a3
{
  self->_initializationAlpha = a3;
}

- (float)initializationBeta
{
  return self->_initializationBeta;
}

- (void)setInitializationBeta:(float)a3
{
  self->_initializationBeta = a3;
}

- (ETModelDef)model
{
  return (ETModelDef *)objc_loadWeakRetained((id *)&self->_model);
}

- (void)setModel:(id)a3
{
  objc_storeWeak((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_layerName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
