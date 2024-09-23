@implementation CKDistributedTimestampProxy

- (unint64_t)size
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t *v29;
  const char *v30;
  unint64_t v31;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_distributedSiteIdentifier(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_size(v10, v11, v12);

    v16 = objc_msgSend_siteIdentifierSize(self, v14, v15);
    objc_msgSend_binding(v6, v17, v18);
    v19 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_valueSizeForField_(v7, v20, v19[18]);

    objc_msgSend_binding(v6, v22, v23);
    v24 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_valueSizeForField_(v7, v25, v24[6]);

    objc_msgSend_binding(v6, v27, v28);
    v29 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v31 = v16 + v13 + v21 + v26 + objc_msgSend_valueSizeForField_(v7, v30, v29[19]);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)distributedSiteIdentifier
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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[5], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)siteIdentifierSize
{
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend_copySiteIdentifierBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4)
    return 0;
  else
    return v3 + 8;
}

- (id)siteIdentifier
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  const char *v9;
  void *v10;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_binding(v4, v5, v6);
    v8 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataForToken_(self, v9, v8[17]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copySiteIdentifierBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  void *v14;

  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = v9;
    objc_msgSend_binding(v9, v10, v11);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[17]);

    v9 = v14;
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 1;
  }

}

- (unsigned)modifier
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
    v11 = v10[18];
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

- (unint64_t)clock
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
  unint64_t v15;
  uint64_t v17;
  unint64_t v18;

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
    v11 = v10[6];
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

- (BOOL)unordered
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
  BOOL v15;
  uint64_t v17;
  char v18;

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
    v11 = v10[19];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_copyData_forField_inStruct_(v7, v14, (uint64_t)&v18, v11, &v17);

    v15 = v18 != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;

  objc_msgSend_distributedSiteIdentifier(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_distributedSiteIdentifier(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_siteIdentifier(v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C94CF8]);
    objc_msgSend_siteIdentifier(self, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_initWithIdentifier_(v11, v14, (uint64_t)v7);
  }
  v15 = (void *)v10;

  v16 = objc_alloc(MEMORY[0x1E0C94D00]);
  v19 = objc_msgSend_clock(self, v17, v18);
  v21 = (void *)objc_msgSend_initWithSiteIdentifierObject_clockValue_(v16, v20, (uint64_t)v15, v19);

  return v21;
}

@end
