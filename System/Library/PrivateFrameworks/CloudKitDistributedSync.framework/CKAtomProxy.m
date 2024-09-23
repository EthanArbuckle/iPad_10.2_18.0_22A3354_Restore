@implementation CKAtomProxy

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
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_valueSizeForField_(v7, v11, v10[10]);
    v46[3] += v12;

    objc_msgSend_location(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_size(v15, v16, v17);
    v46[3] += v18;

    objc_msgSend_timestamp(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_size(v21, v22, v23);
    v46[3] += v24;

    objc_msgSend_references(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1D4BB8DF0;
    v44[3] = &unk_1E984B408;
    v44[4] = &v45;
    objc_msgSend_enumerate_(v27, v28, (uint64_t)v44);

    objc_msgSend_binding(v6, v29, v30);
    v31 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_valueSizeForField_(v7, v32, v31[27]);
    v46[3] += v33;

    objc_msgSend_binding(v6, v34, v35);
    v36 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_valueSizeForField_(v7, v37, v36[13]);
    v46[3] += v38;

    v41 = objc_msgSend_valueSize(self, v39, v40);
    v42 = v46[3] + v41;
    v46[3] = v42;
    _Block_object_dispose(&v45, 8);

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

- (unint64_t)version
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
    v11 = v10[10];
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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[26], 0);
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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[11], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)references
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
    objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[12], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unsigned)atomBehavior
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
    v11 = v10[27];
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

- (unint64_t)atomType
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
    v11 = v10[13];
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

- (unint64_t)valueSize
{
  uint64_t v3;
  char v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend_copyValueBytes_length_isNull_(self, a2, 0, &v3, &v4);
  if (v4)
    return 0;
  else
    return v3 + 8;
}

- (id)value
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
    objc_msgSend_dataForToken_(self, v9, v8[14]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)copyValueBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5
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
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v13, (uint64_t)a3, a4, a5, v12[14]);

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

@end
