@implementation CKAtomMutableProxy

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
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  void *v57;
  const char *v58;
  id v59;
  _QWORD v60[5];

  v59 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v59;
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
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v19);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v56, v58, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 1015, CFSTR("Proxy needs to be of type %@"), v57);

      }
      v22 = objc_msgSend_version(v10, v20, v21);
      objc_msgSend_setVersion_(self, v23, v22);
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
      objc_msgSend_references(v10, v35, v36);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = sub_1D4BBB358;
      v60[3] = &unk_1E984B458;
      v60[4] = self;
      objc_msgSend_enumerate_(v42, v43, (uint64_t)v60);

      v46 = objc_msgSend_atomBehavior(v10, v44, v45);
      objc_msgSend_setAtomBehavior_(self, v47, v46);
      v50 = objc_msgSend_atomType(v10, v48, v49);
      objc_msgSend_setAtomType_(self, v51, v50);
      objc_msgSend_value(v10, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_(self, v55, (uint64_t)v54);

    }
  }

}

- (void)setVersion:(unint64_t)a3
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
    v12 = v11[10];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "Q", v12, &v16);

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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[26], 1);
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
    objc_msgSend_structProxyForStructReference_mutable_(v7, v11, v10[11], 1);
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
    v14 = v13[11];
    objc_msgSend_structInstance(self, v15, v16);
    objc_msgSend_assignStruct_toReference_inStruct_(v12, v17, (uint64_t)v19, v14, &v18);

  }
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
    objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[12], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setAtomBehavior:(unsigned __int8)a3
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
    v11 = v10[27];
    objc_msgSend_structInstance(self, v12, v13);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v7, v14, (uint64_t)&v16, "C", v11, &v15);

  }
}

- (void)setAtomType:(unint64_t)a3
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
    v12 = v11[13];
    objc_msgSend_structInstance(self, v13, v14);
    objc_msgSend_setData_withEncoding_forField_inStruct_(v8, v15, (uint64_t)&v17, "Q", v12, &v16);

  }
}

- (void)setValue:(id)a3
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
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 1103, CFSTR("Non-zero-length NSData has empty bytes"));

    }
    v11 = &v16;
  }
  v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setValueBytes_length_(self, v13, (uint64_t)v11, v12);

}

- (void)setValueBytes:(void *)a3 length:(unint64_t)a4
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
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[14]);

    objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);

  }
}

@end
