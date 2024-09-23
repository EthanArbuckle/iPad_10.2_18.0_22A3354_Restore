@implementation CKAtomBatchMutableProxy

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
  void *v24;
  void *v25;
  const char *v26;
  id v27;
  _QWORD v28[5];

  v27 = a3;
  objc_msgSend_backingStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v27;
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
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v26, (uint64_t)a2, self, CFSTR("CKAtomSerialization.mm"), 1132, CFSTR("Proxy needs to be of type %@"), v25);

      }
      objc_msgSend_atoms(v10, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_1D4BBBD1C;
      v28[3] = &unk_1E984B4A8;
      v28[4] = self;
      objc_msgSend_enumerate_(v22, v23, (uint64_t)v28);

    }
  }

}

- (id)atoms
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
    objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[16], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
