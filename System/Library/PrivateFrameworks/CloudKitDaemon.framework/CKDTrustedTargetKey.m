@implementation CKDTrustedTargetKey

- (CKDTrustedTargetKey)init
{
  CKDTrustedTargetKey *v2;
  uint64_t v3;
  uint64_t (**v4)(_QWORD, uint64_t, void *);
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSData *key;
  objc_super v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CKDTrustedTargetKey;
  v2 = -[CKDTrustedTargetKey init](&v15, sel_init);
  if (v2)
  {
    v3 = ccrng();
    if (v3)
    {
      v4 = (uint64_t (**)(_QWORD, uint64_t, void *))v3;
      v5 = malloc_type_malloc(0x20uLL, 0x9F9B537EuLL);
      v6 = (*v4)(v4, 32, v5);
      if (v6)
      {
        v7 = v6;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v8 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v17 = v7;
          _os_log_fault_impl(&dword_1BE990000, v8, OS_LOG_TYPE_FAULT, "Failed to generate random number with error code %d", buf, 8u);
        }
        free(v5);
      }
      else
      {
        v10 = objc_alloc(MEMORY[0x1E0C99D50]);
        v12 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v10, v11, (uint64_t)v5, 32, 1);
        key = v2->_key;
        v2->_key = (NSData *)v12;

      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v9 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BE990000, v9, OS_LOG_TYPE_FAULT, "Failed to create random number generator", buf, 2u);
      }
    }
  }
  return v2;
}

- (id)encrypt:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t (**v15)(_QWORD, uint64_t, void *);
  int v16;
  int v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  _QWORD v39[2];
  uint8_t buf[4];
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v22, OS_LOG_TYPE_ERROR, "Trying to encrypt a zero-length data", buf, 2u);
    }
    goto LABEL_21;
  }
  v9 = objc_msgSend_length(v4, v7, v8);
  v10 = objc_retainAutorelease(v4);
  objc_msgSend_bytes(v10, v11, v12);
  v13 = malloc_type_malloc(v9 + 32, 0x6662B84CuLL);
  if (!v13)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BE990000, v23, OS_LOG_TYPE_FAULT, "Could not malloc bytes to encrypt data", buf, 2u);
    }
    goto LABEL_21;
  }
  v14 = v13;
  v15 = (uint64_t (**)(_QWORD, uint64_t, void *))ccrng();
  if (v15)
  {
    v16 = (*v15)(v15, 16, v14);
    if (!v16)
    {
      v27 = ccaes_gcm_encrypt_mode();
      v39[1] = v39;
      MEMORY[0x1E0C80A78](v27);
      objc_msgSend_key(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_length(v30, v31, v32);
      objc_msgSend_key(self, v33, v34);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend_bytes(v35, v36, v37);
      ccgcm_init();

      ccgcm_set_iv();
      ccgcm_update();
      ccgcm_finalize();
      ccgcm_context_size();
      cc_clear();
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v38, (uint64_t)v14, v9 + 32, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    v17 = v16;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 67109120;
    v41 = v17;
    v19 = "Failed to generate random number with error code %d";
    v20 = v18;
    v21 = 8;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v19 = "Failed to create random number generator";
    v20 = v24;
    v21 = 2;
  }
  _os_log_fault_impl(&dword_1BE990000, v20, OS_LOG_TYPE_FAULT, v19, buf, v21);
LABEL_20:
  free(v14);
LABEL_21:
  v25 = 0;
LABEL_22:

  return v25;
}

- (id)decrypt:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint8_t v34[16];
  uint8_t buf[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend_length(v4, v5, v6) <= 0x1F)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v9, OS_LOG_TYPE_ERROR, "Trying to decrypt a zero-length data", buf, 2u);
    }
LABEL_17:
    v31 = 0;
    goto LABEL_19;
  }
  v10 = objc_msgSend_length(v4, v7, v8);
  v11 = objc_retainAutorelease(v4);
  objc_msgSend_bytes(v11, v12, v13);
  v14 = v10 - 32;
  v15 = malloc_type_malloc(v10 - 32, 0x8B4AB1F6uLL);
  if (!v15)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v32 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BE990000, v32, OS_LOG_TYPE_FAULT, "Could not malloc bytes to decrypt data", buf, 2u);
    }
    goto LABEL_17;
  }
  v16 = v15;
  v17 = ccaes_gcm_decrypt_mode();
  MEMORY[0x1E0C80A78](v17);
  objc_msgSend_key(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_length(v20, v21, v22);
  objc_msgSend_key(self, v23, v24);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_bytes(v25, v26, v27);
  ccgcm_init();

  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  v28 = cc_cmp_safe();
  ccgcm_context_size();
  cc_clear();
  if (v28)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, "Tag did not match when decrypting", v34, 2u);
    }
    free(v16);
    v31 = 0;
  }
  else
  {
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v29, (uint64_t)v16, v14, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

  return v31;
}

- (NSData)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
