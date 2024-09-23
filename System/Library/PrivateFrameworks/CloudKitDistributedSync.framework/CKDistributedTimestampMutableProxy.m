@implementation CKDistributedTimestampMutableProxy

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
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  id v47;

  v47 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v47;
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
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v19);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v46, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 773, CFSTR("Proxy needs to be of type %@"), v45);

      }
      objc_msgSend_distributedSiteIdentifier(v10, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend_distributedSiteIdentifier(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_distributedSiteIdentifier(v10, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_copyFromReadProxy_(v25, v29, (uint64_t)v28);

      }
      objc_msgSend_siteIdentifier(v10, v23, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSiteIdentifier_(self, v31, (uint64_t)v30);

      v34 = objc_msgSend_clock(v10, v32, v33);
      objc_msgSend_setClock_(self, v35, v34);
      v38 = objc_msgSend_modifier(v10, v36, v37);
      objc_msgSend_setModifier_(self, v39, v38);
      v42 = objc_msgSend_unordered(v10, v40, v41);
      objc_msgSend_setUnordered_(self, v43, v42);

    }
  }

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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[5], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)assignDistributedSiteIdentifierFromProxy:(id)a3
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
    v14 = v13[5];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);

  }
}

- (void)setSiteIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  char v16;

  v16 = 0;
  v5 = objc_retainAutorelease(a3);
  v8 = objc_msgSend_bytes(v5, v6, v7);
  v11 = (char *)v8;
  if (v5 && !v8)
  {
    if (objc_msgSend_length(v5, v9, v10))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 806, CFSTR("Non-zero-length NSData has empty bytes"));

    }
    v11 = &v16;
  }
  v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setSiteIdentifierBytes_length_(self, v13, (uint64_t)v11, v12);

}

- (void)setSiteIdentifierBytes:(void *)a3 length:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;

  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    objc_msgSend_binding(v7, v8, v9);
    v11 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[17]);

    objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);

  }
}

- (void)setModifier:(unsigned __int8)a3
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
    v11 = v10[18];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v7, v14, (uint64_t)&v16, "C", v11, &v15);

  }
}

- (void)setClock:(unint64_t)a3
{
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_backingStore(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v17 = a3;
    objc_msgSend_writerForProxy_(v5, v6, (uint64_t)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v7, v9, v10);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v11[6];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "Q", v12, &v16);

  }
}

- (void)setUnordered:(BOOL)a3
{
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;

  objc_msgSend_backingStore(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v17 = a3;
    objc_msgSend_writerForProxy_(v5, v6, (uint64_t)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_binding(v7, v9, v10);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v11[19];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "C", v12, &v16);

  }
}

- (void)copyFromTimestamp:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  id v22;

  v22 = a3;
  objc_msgSend_distributedSiteIdentifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_siteIdentifierObject(v22, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_copyFromSiteIdentifier_(v6, v10, (uint64_t)v9);

  objc_msgSend_siteIdentifierObject(v22, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSiteIdentifier_(self, v17, (uint64_t)v16);

  v20 = objc_msgSend_clockValue(v22, v18, v19);
  objc_msgSend_setClock_(self, v21, v20);

}

@end
