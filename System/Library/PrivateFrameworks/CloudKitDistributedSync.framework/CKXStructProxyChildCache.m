@implementation CKXStructProxyChildCache

- (CKXStructProxyChildCache)initWithProxy:(id)a3
{
  id v4;
  CKXStructProxyChildCache *v5;
  CKXStructProxyChildCache *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKXStructProxyChildCache;
  v5 = -[CKXStructProxyChildCache init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_proxy, v4);

  return v6;
}

- (void)reset
{
  unint64_t value;
  uint64_t i;

  if (self->fieldToProxy.__table_.__p2_.__value_)
  {
    sub_1D4BCBC64((id *)self->fieldToProxy.__table_.__p1_.__value_.__next_);
    self->fieldToProxy.__table_.__p1_.__value_.__next_ = 0;
    value = self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->fieldToProxy.__table_.__p2_.__value_ = 0;
  }
}

- (id)structProxyForStructReference:(unint64_t)a3 mutable:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t *p_fieldToProxy;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  _QWORD v21[3];
  unint64_t v22;

  v4 = a4;
  v22 = a3;
  p_fieldToProxy = (uint64_t *)&self->fieldToProxy;
  if (!sub_1D4BCBBB4(&self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_, a3))
  {
    objc_msgSend_proxy(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_backingStore(v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend_structInstance(v10, v13, v14);
    else
      memset(v21, 0, sizeof(v21));
    objc_msgSend_structProxyForStructReference_inStructInstance_mutable_(v15, v13, a3, v21, v4);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = sub_1D4BCBCA0(p_fieldToProxy, a3, &v22);
    v18 = (void *)v17[3];
    v17[3] = v16;

  }
  v19 = sub_1D4BCBBB4(p_fieldToProxy, a3);
  if (!v19)
    sub_1D4B1F118("unordered_map::at: key not found");
  return (id)v19[3];
}

- (id)structListProxyForListReference:(unint64_t)a3 mutable:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t *p_fieldToProxy;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  _QWORD v21[3];
  unint64_t v22;

  v4 = a4;
  v22 = a3;
  p_fieldToProxy = (uint64_t *)&self->fieldToProxy;
  if (!sub_1D4BCBBB4(&self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_, a3))
  {
    objc_msgSend_proxy(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_backingStore(v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend_structInstance(v10, v13, v14);
    else
      memset(v21, 0, sizeof(v21));
    objc_msgSend_structListProxyForListReference_inStructInstance_mutable_(v15, v13, a3, v21, v4);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = sub_1D4BCBCA0(p_fieldToProxy, a3, &v22);
    v18 = (void *)v17[3];
    v17[3] = v16;

  }
  v19 = sub_1D4BCBBB4(p_fieldToProxy, a3);
  if (!v19)
    sub_1D4B1F118("unordered_map::at: key not found");
  return (id)v19[3];
}

- (CKXStructProxyBase)proxy
{
  return (CKXStructProxyBase *)objc_loadWeakRetained((id *)&self->_proxy);
}

- (void).cxx_destruct
{
  void **value;

  objc_destroyWeak((id *)&self->_proxy);
  sub_1D4BCBC64((id *)self->fieldToProxy.__table_.__p1_.__value_.__next_);
  value = self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_;
  self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
