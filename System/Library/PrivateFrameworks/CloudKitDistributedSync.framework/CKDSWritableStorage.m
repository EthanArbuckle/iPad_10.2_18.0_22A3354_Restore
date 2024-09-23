@implementation CKDSWritableStorage

- (CKDSWritableStorage)initWithFileURL:(id)a3
{
  id v4;
  CKDSStorageFile *v5;
  const char *v6;
  void *isOwned;
  const char *v8;
  CKDSWritableStorage *v9;

  v4 = a3;
  v5 = [CKDSStorageFile alloc];
  isOwned = (void *)objc_msgSend_initWithURL_isOwned_(v5, v6, (uint64_t)v4, 0);

  v9 = (CKDSWritableStorage *)objc_msgSend_initForWriting_withFile_orData_(self, v8, 1, isOwned, 0);
  return v9;
}

- (id)initInMemory
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_dataWithCapacity_(MEMORY[0x1E0C99DF0], a2, 2048);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend_initForWriting_withFile_orData_(self, v4, 1, 0, v3);

  return v5;
}

- (CKDSWritableStorage)initWithTemporaryFile:(id *)a3
{
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  CKDSStorageFile *v29;
  const char *v30;
  void *isOwned;
  const char *v32;
  CKDSWritableStorage *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  v38[1] = CFSTR("CloudKitDistributedSync");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v38, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPathComponents_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v15 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v13, v14, (uint64_t)v10, 1, 0, &v35);
  v16 = v35;

  if ((v15 & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v24, (uint64_t)CFSTR("%@.batch"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_URLByAppendingPathComponent_(v10, v26, (uint64_t)v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v27;
      _os_log_debug_impl(&dword_1D4AFF000, v28, OS_LOG_TYPE_DEBUG, "Using temporary file %@", buf, 0xCu);
    }
    v29 = [CKDSStorageFile alloc];
    isOwned = (void *)objc_msgSend_initWithURL_isOwned_(v29, v30, (uint64_t)v27, 1);
    self = (CKDSWritableStorage *)(id)objc_msgSend_initForWriting_withFile_orData_(self, v32, 1, isOwned, 0);

    v33 = self;
  }
  else
  {
    v33 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v16);
  }

  return v33;
}

- (id)readableStorage
{
  CKDSReadableStorage *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = [CKDSReadableStorage alloc];
  objc_msgSend_file(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initForWriting_withFile_orData_(v3, v10, 0, v6, v9);

  return v11;
}

@end
