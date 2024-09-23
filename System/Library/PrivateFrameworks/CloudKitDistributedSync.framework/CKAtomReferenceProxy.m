@implementation CKAtomReferenceProxy

- (unint64_t)size
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_valueSizeForField_(v7, v11, v10[24]);

    objc_msgSend_location(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_size(v15, v16, v17);

    objc_msgSend_timestamp(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18 + v12 + objc_msgSend_size(v21, v22, v23);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unsigned)type
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  unsigned __int8 v15;
  uint64_t v17;
  unsigned __int8 v18;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    v18 = 0;
    objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v6, v8, v9);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11 = v10[24];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_copyData_forField_inStruct_(v7, v14, (uint64_t)&v18, v11, &v17);

    v15 = v18;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)location
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t *v10;
  const char *v11;
  void *v12;

  objc_msgSend_backingStore(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_childProxyCache(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[25], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)timestamp
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t *v10;
  const char *v11;
  void *v12;

  objc_msgSend_backingStore(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_childProxyCache(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[8], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)reference
{
  CKAtomReference *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;

  v3 = [CKAtomReference alloc];
  objc_msgSend_location(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeableValueID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timestamp(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timestamp(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_type(self, v16, v17);
  v20 = (void *)objc_msgSend_initWithMergeableValueID_timestamp_type_(v3, v19, (uint64_t)v9, v15, v18);

  return v20;
}

@end
