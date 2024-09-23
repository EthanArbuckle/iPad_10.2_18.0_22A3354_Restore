@implementation CKDistributedSiteIdentifierMutableProxy

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
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  id v31;

  v31 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v31;
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
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v30, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 714, CFSTR("Proxy needs to be of type %@"), v29);

      }
      objc_msgSend_identifier(v10, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIdentifier_(self, v23, (uint64_t)v22);

      objc_msgSend_modifier(v10, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setModifier_(self, v27, (uint64_t)v26);

    }
  }

}

- (void)setIdentifier:(id)a3
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
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 724, CFSTR("Non-zero-length NSData has empty bytes"));

    }
    v11 = &v16;
  }
  v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setIdentifierBytes_length_(self, v13, (uint64_t)v11, v12);

}

- (void)setIdentifierBytes:(void *)a3 length:(unint64_t)a4
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
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[2]);

    objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);

  }
}

- (void)setModifier:(id)a3
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
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 744, CFSTR("Non-zero-length NSData has empty bytes"));

    }
    v11 = &v16;
  }
  v12 = objc_msgSend_length(v5, v9, v10);
  objc_msgSend_setModifierBytes_length_(self, v13, (uint64_t)v11, v12);

}

- (void)setModifierBytes:(void *)a3 length:(unint64_t)a4
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
    objc_msgSend_mutableListInstanceForField_(self, v12, v11[3]);

    objc_msgSend_writerForProxy_(v10, v13, (uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend_setData_withLength_forList_(v14, v15, (uint64_t)a3, a4, v16);

  }
}

- (void)copyFromSiteIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v12 = a3;
  objc_msgSend_identifier(v12, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(self, v7, (uint64_t)v6);

  objc_msgSend_modifier(v12, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModifier_(self, v11, (uint64_t)v10);

}

@end
