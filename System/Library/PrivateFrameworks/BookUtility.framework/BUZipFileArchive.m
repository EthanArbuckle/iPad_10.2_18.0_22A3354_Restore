@implementation BUZipFileArchive

+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  char isZipArchiveAtFD;
  void *v21;
  void *v22;
  int *v23;
  const char *v24;
  id v25;

  v6 = a3;
  objc_msgSend_path(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v9, v10, v11))
  {
    objc_msgSend_path(v6, v12, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend_fileSystemRepresentation(v14, v15, v16);
    v18 = open(v17, 0, 0);

    if ((v18 & 0x80000000) != 0)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = __error();
      objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v22, v24, *v23, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      isZipArchiveAtFD = 0;
      if (!a4)
        goto LABEL_12;
      goto LABEL_8;
    }
    isZipArchiveAtFD = objc_msgSend_isZipArchiveAtFD_(a1, v19, v18);
    close(v18);
  }
  else
  {
    isZipArchiveAtFD = 0;
  }
  v21 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_8:
  if ((isZipArchiveAtFD & 1) == 0)
  {
    if (v21)
    {
      *a4 = objc_retainAutorelease(v21);
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v12, 0);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v25;

    }
  }
LABEL_12:

  return isZipArchiveAtFD;
}

+ (BOOL)isZipArchiveAtFD:(int)a3
{
  off_t v4;
  off_t v5;
  BOOL v7;
  int v9;

  v4 = lseek(a3, 0, 1);
  v5 = v4;
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v4 == -1)
      return 0;
  }
  else if (lseek(a3, 0, 0) == -1)
  {
    goto LABEL_12;
  }
  if (read(a3, &v9, 4uLL) == 4)
  {
    v7 = v9 == 67324752 || v9 == 101010256;
    return lseek(a3, v5, 0) != -1 && v7;
  }
LABEL_12:
  v7 = 0;
  return lseek(a3, v5, 0) != -1 && v7;
}

- (NSURL)URL
{
  return self->_URL;
}

+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  v21 = 0;
  v15 = (void *)objc_msgSend_initForReadingFromURL_options_error_(v13, v14, (uint64_t)v12, a4, &v21);

  v17 = v21;
  if (v15)
  {
    objc_msgSend_readArchiveWithQueue_completion_(v15, v16, (uint64_t)v11, v10);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212E577B4;
    block[3] = &unk_24CED9B68;
    v20 = v10;
    v19 = v17;
    dispatch_async(v11, block);

    v11 = v20;
  }

}

+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  int isZipArchiveAtURL_error;
  const char *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_212E57A18;
  v35 = sub_212E57A28;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_212E57A18;
  v29 = sub_212E57A28;
  v30 = 0;
  obj = 0;
  isZipArchiveAtURL_error = objc_msgSend_isZipArchiveAtURL_error_(a1, v9, (uint64_t)v8, &obj);
  objc_storeStrong(&v30, obj);
  if (isZipArchiveAtURL_error)
  {
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    dispatch_get_global_queue(0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_212E57A30;
    v20[3] = &unk_24CEDA280;
    v22 = &v31;
    v23 = &v25;
    v14 = v12;
    v21 = v14;
    objc_msgSend_readArchiveFromURL_options_queue_completion_(a1, v15, (uint64_t)v8, a4, v13, v20);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a5 && !v32[5])
  {
    v16 = (void *)v26[5];
    if (v16)
    {
      *a5 = objc_retainAutorelease(v16);
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v11, 0);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v17;

    }
  }
  v18 = (id)v32[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v18;
}

- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BUZipFileArchive *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *accessQueue;
  const char *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BUZipFileArchive;
  v9 = -[BUZipArchive initWithOptions:](&v15, sel_initWithOptions_, a4);
  if (v9)
  {
    BUZipLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_212E6C620((uint64_t)v9, v8, (uint64_t)v10);

    v11 = dispatch_queue_create("BUZipFileArchive.Access", 0);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v11;

    if ((objc_msgSend_openWithURL_error_(v9, v13, (uint64_t)v8, a5) & 1) == 0)
    {

      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)openWithURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSURL *v10;
  NSURL *URL;
  uint64_t v12;
  const char *v13;
  const char *v14;
  int ResourceValue_forKey_error;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  BUZipFileDescriptorWrapper *v27;
  const char *v28;
  BUZipFileDescriptorWrapper *v29;
  BUZipFileDescriptorWrapper *fdWrapper;
  const char *v31;
  void *v32;
  const char *v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  int *v37;
  const char *v38;
  uint64_t v39;
  BUZipFileDescriptorWrapper *v40;
  const char *v41;
  id v43;
  id v44;

  v6 = a3;
  BUZipLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_212E6C784((uint64_t)self, v6, (uint64_t)v7);

  v10 = (NSURL *)objc_msgSend_copy(v6, v8, v9);
  URL = self->_URL;
  self->_URL = v10;

  v12 = *MEMORY[0x24BDBCC48];
  objc_msgSend_removeCachedResourceValueForKey_(v6, v13, *MEMORY[0x24BDBCC48]);
  v43 = 0;
  v44 = 0;
  ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v6, v14, (uint64_t)&v44, v12, &v43);
  v16 = v44;
  v19 = v43;
  if (!ResourceValue_forKey_error)
  {
    BUZipLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_212E6C6A4((uint64_t)v6, v19, v35);
LABEL_15:

    v34 = 0;
    if (!a4)
      goto LABEL_18;
    goto LABEL_16;
  }
  self->_archiveLength = objc_msgSend_unsignedLongLongValue(v16, v17, v18);
  objc_msgSend_path(v6, v20, v21);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = (const char *)objc_msgSend_fileSystemRepresentation(v22, v23, v24);
  v26 = open(v25, 0, 0);

  if ((v26 & 0x80000000) != 0)
  {
    v36 = (void *)MEMORY[0x24BDD1540];
    v37 = __error();
    objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v36, v38, *v37, 0);
    v39 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v35 = v19;
    v19 = v39;
    goto LABEL_15;
  }
  v27 = [BUZipFileDescriptorWrapper alloc];
  v29 = (BUZipFileDescriptorWrapper *)objc_msgSend_initWithFileDescriptor_queue_(v27, v28, v26, self->_accessQueue);
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = v29;

  if (!self->_fdWrapper)
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v31, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v32 = (void *)objc_opt_class();
  if ((objc_msgSend_isZipArchiveAtFD_(v32, v33, v26) & 1) == 0)
  {
    v40 = self->_fdWrapper;
    self->_fdWrapper = 0;

    objc_msgSend_bu_fileReadCorruptedFileErrorWithUserInfo_(MEMORY[0x24BDD1540], v41, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v34 = 1;
  if (!a4)
    goto LABEL_18;
LABEL_16:
  if (v19)
    *a4 = objc_retainAutorelease(v19);
LABEL_18:

  return v34;
}

- (BUZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  BUZipFileArchive *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  BUZipFileArchive *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v13 = objc_msgSend_initForReadingFromURL_options_error_(self, v12, (uint64_t)v11, a5, a6);
  if (v13)
  {
    v14 = (void *)v13;
    BUZipLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v14;
      v38 = 2112;
      v39 = (uint64_t)v10;
      v40 = 2112;
      v41 = (uint64_t)v11;
      _os_log_debug_impl(&dword_212E45000, v15, OS_LOG_TYPE_DEBUG, "%@: initWithWriter: %@, atURL: %@", buf, 0x20u);
    }

    v18 = objc_msgSend_archiveLength(v14, v16, v17);
    if (v18 == objc_msgSend_archiveLength(v10, v19, v20))
    {
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = sub_212E57FE8;
      v34[3] = &unk_24CEDA2A8;
      v21 = v14;
      v35 = v21;
      objc_msgSend_enumerateEntriesUsingBlock_(v10, v22, (uint64_t)v34);
      v14 = v35;
    }
    else
    {
      BUZipLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_path(v11, v24, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_archiveLength(v14, v28, v29);
        v33 = objc_msgSend_archiveLength(v10, v31, v32);
        *(_DWORD *)buf = 138412802;
        v37 = v27;
        v38 = 2048;
        v39 = v30;
        v40 = 2048;
        v41 = v33;
        _os_log_error_impl(&dword_212E45000, v23, OS_LOG_TYPE_ERROR, "Length of archive at %@ doesn't match archive length of writer. %llu != %llu", buf, 0x20u);

      }
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  BUZipFileDescriptorWrapper *fdWrapper;
  const char *v4;
  uint64_t v5;
  objc_super v6;

  self->_archiveLength = 0;
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = 0;

  objc_msgSend_removeTemporaryDirectory(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)BUZipFileArchive;
  -[BUZipFileArchive dealloc](&v6, sel_dealloc);
}

- (void)createTemporaryDirectoryRelativeToURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  NSURL *v9;
  NSURL *temporaryDirectoryURL;
  BUTemporaryDirectory *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSURL *v18;
  NSURL *v19;
  id v20;

  v4 = a3;
  if (!self->_temporaryDirectoryURL)
  {
    v20 = v4;
    if (!v4)
      goto LABEL_4;
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v7, v8, 99, 1, v20, 1, 0);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = v9;

    v4 = v20;
    if (!self->_temporaryDirectoryURL)
    {
LABEL_4:
      v11 = [BUTemporaryDirectory alloc];
      v13 = (void *)objc_msgSend_initWithSignature_error_(v11, v12, (uint64_t)CFSTR("ZipFile"), 0);
      objc_msgSend_leakTemporaryDirectory(v13, v14, v15);
      objc_msgSend_URL(v13, v16, v17);
      v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v19 = self->_temporaryDirectoryURL;
      self->_temporaryDirectoryURL = v18;

      v4 = v20;
    }
  }

}

- (void)removeTemporaryDirectory
{
  uint64_t v2;
  void *v4;
  NSURL *temporaryDirectoryURL;
  const char *v6;
  char v7;
  id v8;
  char *v9;
  uint64_t v10;
  NSURL *v11;
  id v12;

  if (self->_temporaryDirectoryURL)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    v12 = 0;
    v7 = objc_msgSend_removeItemAtURL_error_(v4, v6, (uint64_t)temporaryDirectoryURL, &v12);
    v8 = v12;

    if ((v7 & 1) == 0)
    {
      BUZipLog();
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
        sub_212E6C808(v8, v9, v10);

    }
    v11 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;

  }
}

- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4
{
  unint64_t archiveLength;
  id *p_fdWrapper;
  BUZipFileDescriptorWrapper *fdWrapper;
  BUZipFileDescriptorWrapper *v10;
  id v11;
  id v12;
  const char *v13;
  char v14;

  archiveLength = self->_archiveLength;
  p_fdWrapper = (id *)&self->_fdWrapper;
  fdWrapper = self->_fdWrapper;
  v10 = fdWrapper;
  self->_archiveLength = 0;
  v11 = *p_fdWrapper;
  *p_fdWrapper = 0;
  v12 = a3;

  v14 = objc_msgSend_openWithURL_error_(self, v13, (uint64_t)v12, a4);
  if ((v14 & 1) == 0)
  {
    self->_archiveLength = archiveLength;
    objc_storeStrong(p_fdWrapper, fdWrapper);
  }

  return v14;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, uint64_t);
  void *v17;
  BUZipFileArchive *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_212E57A18;
  v26 = sub_212E57A28;
  accessQueue = self->_accessQueue;
  v27 = 0;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = sub_212E58420;
  v17 = &unk_24CEDA320;
  v18 = self;
  v8 = v6;
  v19 = v8;
  v20 = &v22;
  v21 = &v28;
  dispatch_sync(accessQueue, &v14);
  if (a4 && !*((_BYTE *)v29 + 24))
  {
    v10 = (void *)v23[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v9, 0, v14, v15, v16, v17, v18);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v11;

    }
  }
  v12 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (unint64_t)archiveLength
{
  uint64_t v2;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend_accessQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212E58A7C;
  v7[3] = &unk_24CED9AC8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)newArchiveReadChannel
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_212E57A18;
  v10 = sub_212E57A28;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E58B54;
  v5[3] = &unk_24CED9D98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isValid
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E58D54;
  v5[3] = &unk_24CED9D98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)debugDescription
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = objc_opt_class();
  objc_msgSend_descriptionWithObject_class_(BUDescription, v4, (uint64_t)self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%qu"), self->_archiveLength);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addField_value_(v5, v8, (uint64_t)CFSTR("archiveLength"), v7);

  v15.receiver = self;
  v15.super_class = (Class)BUZipFileArchive;
  -[BUZipArchive debugDescription](&v15, sel_debugDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addFieldValue_(v5, v10, (uint64_t)v9);

  objc_msgSend_descriptionString(v5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)extractArchiveFromURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  BOOL v14;
  id v15;
  char v16;
  id v18;
  id v19;

  v9 = a4;
  v19 = 0;
  objc_msgSend_zipArchiveFromURL_options_error_(BUZipFileArchive, v10, (uint64_t)a3, a5, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (!v14)
  {
    v15 = v12;
    v16 = 0;
    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  v18 = 0;
  v16 = objc_msgSend_extractToURL_error_(v11, v13, (uint64_t)v9, &v18);
  v15 = v18;
  if (a6)
LABEL_8:
    *a6 = objc_retainAutorelease(v15);
LABEL_9:

  return v16;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BUZipFileDescriptorWrapper)fdWrapper
{
  return self->_fdWrapper;
}

- (void)setFdWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_fdWrapper, a3);
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, a3);
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fdWrapper, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
