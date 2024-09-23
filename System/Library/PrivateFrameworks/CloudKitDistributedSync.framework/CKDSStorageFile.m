@implementation CKDSStorageFile

- (CKDSStorageFile)initWithURL:(id)a3 isOwned:(BOOL)a4
{
  const char *v8;
  uint64_t v9;
  id v10;
  CKDSStorageFile *v11;
  CKDSStorageFile *v12;
  void *v14;
  const char *v15;
  objc_super v16;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDSUtils.m"), 25, CFSTR("Unexpected arguments"));

  }
  v16.receiver = self;
  v16.super_class = (Class)CKDSStorageFile;
  v11 = -[CKDSStorageFile init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_URL, a3);
    v12->_isOwned = a4;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int isOwned;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  objc_super v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_URL(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (void *)v4;
    isOwned = objc_msgSend_isOwned(self, v5, v6);

    if (isOwned)
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v16 = objc_msgSend_removeItemAtURL_error_(v11, v15, (uint64_t)v14, &v24);
      v17 = v24;

      if ((v16 & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v18 = (void *)*MEMORY[0x1E0C952C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          objc_msgSend_URL(self, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v26 = v22;
          v27 = 2112;
          v28 = v17;
          _os_log_error_impl(&dword_1D4AFF000, v19, OS_LOG_TYPE_ERROR, "Could not delete temporary file %@: %@", buf, 0x16u);

        }
      }

    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CKDSStorageFile;
  -[CKDSStorageFile dealloc](&v23, sel_dealloc);
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isOwned
{
  return self->_isOwned;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
