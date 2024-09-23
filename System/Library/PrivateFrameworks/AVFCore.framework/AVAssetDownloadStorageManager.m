@implementation AVAssetDownloadStorageManager

- (AVAssetDownloadStorageManager)init
{
  AVAssetDownloadStorageManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVAssetDownloadStorageManager;
  v2 = -[AVAssetDownloadStorageManager init](&v4, sel_init);
  if (v2)
    v2->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avassetdownloadstoragemanager.ivars");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_ivarAccessQueue);
  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadStorageManager;
  -[AVAssetDownloadStorageManager dealloc](&v3, sel_dealloc);
}

+ (AVAssetDownloadStorageManager)sharedDownloadStorageManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AVAssetDownloadStorageManager_sharedDownloadStorageManager__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = a1;
  if (sharedDownloadStorageManager_sAVAssetDownloadStorageManager_Once != -1)
    dispatch_once(&sharedDownloadStorageManager_sAVAssetDownloadStorageManager_Once, block);
  return (AVAssetDownloadStorageManager *)sharedDownloadStorageManager_sDownloadStorageManager;
}

id __61__AVAssetDownloadStorageManager_sharedDownloadStorageManager__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedDownloadStorageManager_sDownloadStorageManager = (uint64_t)result;
  return result;
}

- (void)setStorageManagementPolicy:(AVAssetDownloadStorageManagementPolicy *)storageManagementPolicy forURL:(NSURL *)downloadStorageURL
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSDate *v26;
  NSString *v27;
  NSObject *ivarAccessQueue;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD block[8];

  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  v9 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (!storageManagementPolicy)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = "storageManagementPolicy != nil";
LABEL_10:
    v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)v31);
    v33 = v29;
    v34 = v30;
    goto LABEL_14;
  }
  if (!downloadStorageURL)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = "downloadStorageURL != nil";
    goto LABEL_10;
  }
  if (!v8)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = "bundleIdentifier != nil";
    goto LABEL_10;
  }
  v15 = (void *)v9;
  if (!-[NSURL isFileURL](downloadStorageURL, "isFileURL"))
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99768];
    v37 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not a fileURL %@"), v16, v17, v18, v19, v20, (uint64_t)downloadStorageURL);
LABEL_13:
    v32 = v37;
    v33 = v35;
    v34 = v36;
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v33, "exceptionWithName:reason:userInfo:", v34, v32, 0));
  }
  if ((objc_msgSend(v15, "fileExistsAtPath:", -[NSURL path](downloadStorageURL, "path")) & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E0C99DA0];
    v36 = *MEMORY[0x1E0C99768];
    v37 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("No file at %@"), v21, v22, v23, v24, v25, (uint64_t)downloadStorageURL);
    goto LABEL_13;
  }
  v26 = -[AVAssetDownloadStorageManagementPolicy expirationDate](storageManagementPolicy, "expirationDate");
  v27 = -[AVAssetDownloadStorageManagementPolicy priority](storageManagementPolicy, "priority");
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVAssetDownloadStorageManager_setStorageManagementPolicy_forURL___block_invoke;
  block[3] = &unk_1E3030F90;
  block[4] = v26;
  block[5] = downloadStorageURL;
  block[6] = v8;
  block[7] = v27;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void *__67__AVAssetDownloadStorageManager_setStorageManagementPolicy_forURL___block_invoke(uint64_t a1)
{
  void *result;

  if (!*(_QWORD *)(a1 + 32)
    || (result = (void *)FigAssetDownloadStorageManagementSetExpirationDateForAssetAtURL(), !(_DWORD)result))
  {
    result = *(void **)(a1 + 56);
    if (result)
    {
      objc_msgSend(result, "isEqualToString:", CFSTR("important"));
      return (void *)FigAssetDownloadStorageManagementSetPriorityForAssetAtURL();
    }
  }
  return result;
}

- (AVAssetDownloadStorageManagementPolicy)storageManagementPolicyForURL:(NSURL *)downloadStorageURL
{
  uint64_t v6;
  AVMutableAssetDownloadStorageManagementPolicy *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *ivarAccessQueue;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[8];

  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  v7 = objc_alloc_init(AVMutableAssetDownloadStorageManagementPolicy);
  v8 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (!downloadStorageURL)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = "downloadStorageURL != nil";
LABEL_8:
    v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)v29);
    v31 = v27;
    v32 = v28;
    goto LABEL_12;
  }
  if (!v6)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = "bundleIdentifier != nil";
    goto LABEL_8;
  }
  v14 = (void *)v8;
  if (!-[NSURL isFileURL](downloadStorageURL, "isFileURL"))
  {
    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = *MEMORY[0x1E0C99768];
    v35 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not a fileURL %@"), v15, v16, v17, v18, v19, (uint64_t)downloadStorageURL);
LABEL_11:
    v30 = v35;
    v31 = v33;
    v32 = v34;
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, v30, 0));
  }
  if ((objc_msgSend(v14, "fileExistsAtPath:", -[NSURL path](downloadStorageURL, "path")) & 1) == 0)
  {
    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = *MEMORY[0x1E0C99768];
    v35 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("No file at %@"), v20, v21, v22, v23, v24, (uint64_t)downloadStorageURL);
    goto LABEL_11;
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVAssetDownloadStorageManager_storageManagementPolicyForURL___block_invoke;
  block[3] = &unk_1E3030F90;
  block[4] = downloadStorageURL;
  block[5] = v6;
  block[6] = 0;
  block[7] = v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  return (AVAssetDownloadStorageManagementPolicy *)v7;
}

uint64_t __63__AVAssetDownloadStorageManager_storageManagementPolicyForURL___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)(a1 + 48);
  result = FigAssetDownloadStorageManagementCopyExpirationDateForAssetAtURL();
  if (!(_DWORD)result)
  {
    result = FigAssetDownloadStorageManagementCopyPriorityForAssetAtURL();
    if (!(_DWORD)result)
    {
      if (*v2)
        objc_msgSend(*(id *)(a1 + 56), "setExpirationDate:");
      return objc_msgSend(*(id *)(a1 + 56), "setPriority:", CFSTR("default"));
    }
  }
  return result;
}

@end
