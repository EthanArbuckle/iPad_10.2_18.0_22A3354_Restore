@implementation CKAtomReferenceMutableProxy

- (void)copyFromReadProxy:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  objc_class *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  const char *v44;
  id v45;

  v45 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v45;
    if (v10)
    {
      objc_msgSend_binding(v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_binding(v7, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      v17 = objc_msgSend_structTokenForClass_(v14, v16, v15);
      objc_msgSend_proxyClassForStructToken_(v11, v18, v17);
      v19 = (objc_class *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v19);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v44, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 946, CFSTR("Proxy needs to be of type %@"), v43);

      }
      v22 = objc_msgSend_type(v10, v20, v21);
      objc_msgSend_setType_(self, v23, v22);
      objc_msgSend_location(v10, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend_location(self, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_location(v10, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_copyFromReadProxy_(v29, v33, (uint64_t)v32);

      }
      objc_msgSend_timestamp(v10, v27, v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_timestamp(self, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timestamp(v10, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_copyFromReadProxy_(v37, v41, (uint64_t)v40);

      }
    }

  }
}

- (void)setType:(unsigned __int8)a3
{
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
  uint64_t v15;
  unsigned __int8 v16;

  v16 = a3;
  objc_msgSend_backingStore(self, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_writerForProxy_(v4, v5, (uint64_t)self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v6, v8, v9);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11 = v10[24];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v7, v14, (uint64_t)&v16, "C", v11, &v15);

  }
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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[25], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)assignLocationFromProxy:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  _QWORD v19[3];

  v4 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    objc_msgSend_writerForProxy_(v7, v8, (uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend_structInstance(v4, v10, v11);
    else
      memset(v19, 0, sizeof(v19));
    objc_msgSend_binding(v9, v10, v11);
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v14 = v13[25];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);

  }
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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[8], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)assignTimestampFromProxy:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  _QWORD v19[3];

  v4 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    objc_msgSend_writerForProxy_(v7, v8, (uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend_structInstance(v4, v10, v11);
    else
      memset(v19, 0, sizeof(v19));
    objc_msgSend_binding(v9, v10, v11);
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v14 = v13[8];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);

  }
}

- (void)copyFromReference:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;

  v26 = a3;
  v6 = objc_msgSend_type(v26, v4, v5);
  objc_msgSend_setType_(self, v7, v6);
  objc_msgSend_mergeableValueID(v26, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_location(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeableValueID(v26, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyFromMergeableValueID_(v13, v17, (uint64_t)v16);

  }
  objc_msgSend_timestamp(v26, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_timestamp(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timestamp(v26, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyFromTimestamp_(v21, v25, (uint64_t)v24);

  }
}

@end
