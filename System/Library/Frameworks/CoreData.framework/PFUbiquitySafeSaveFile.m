@implementation PFUbiquitySafeSaveFile

- (PFUbiquitySafeSaveFile)init
{
  char *v2;
  char *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySafeSaveFile;
  v2 = -[PFUbiquitySafeSaveFile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_WORD *)v2 + 28) = 0;
    *((_QWORD *)v2 + 8) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *((_QWORD *)v2 + 9) = dispatch_semaphore_create(0);
    *((_WORD *)v3 + 20) = 0;
    *((_QWORD *)v3 + 6) = 0;
  }
  return (PFUbiquitySafeSaveFile *)v3;
}

- (PFUbiquitySafeSaveFile)initWithPermanentLocation:(id)a3 safeSaveLocation:(id)a4 andLocalPeerID:(id)a5
{
  PFUbiquitySafeSaveFile *v8;

  v8 = -[PFUbiquitySafeSaveFile init](self, "init");
  if (v8)
  {
    v8->_localPeerID = (NSString *)a5;
    v8->_permanentLocation = (PFUbiquityLocation *)a3;
    v8->_safeSaveLocation = (PFUbiquityLocation *)a4;
    -[PFUbiquitySafeSaveFile setCurrentLocation:](v8, v8->_permanentLocation);
  }
  return v8;
}

- (_QWORD)setCurrentLocation:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  NSObject *safeSaveSemaphore;
  objc_super v4;

  self->_currentLocation = 0;
  self->_permanentLocation = 0;

  self->_localPeerID = 0;
  self->_safeSaveLocation = 0;

  self->_safeSaveError = 0;
  self->_downloadError = 0;
  safeSaveSemaphore = self->_safeSaveSemaphore;
  if (safeSaveSemaphore)
  {
    dispatch_release(safeSaveSemaphore);
    self->_safeSaveSemaphore = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySafeSaveFile;
  -[PFUbiquitySafeSaveFile dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySafeSaveFile;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%d)\n\tpermanentLocation: %@\n\tsafeLocation: %@\n\tcurrentLocation: %@\n"), -[PFUbiquitySafeSaveFile description](&v3, sel_description), self->_safeSaveSuccess, self->_permanentLocation, self->_safeSaveLocation, self->_currentLocation);
}

- (uint64_t)existsInCloud
{
  void **v2;
  char v3;

  if (a1)
  {
    v2 = (void **)(a1 + 2);
    if (-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](a1[2], a1[4], 0))
    {
      objc_opt_self();
      v3 = _usesCloudDocs ^ 1;
    }
    else
    {
      v2 = (void **)(a1 + 1);
      v3 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](a1[1], a1[4], 0);
    }
    -[PFUbiquitySafeSaveFile setCurrentLocation:](a1, *v2);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)downloadLatestVersion:(uint64_t *)a3 error:
{
  uint64_t v3;
  PFUbiquityFileCoordinator *v6;
  PFUbiquityFileCoordinator *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  char v37;
  uint8_t v38[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;
  _QWORD v43[2];

  v3 = a1;
  v43[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v34 = 0;
    if ((-[PFUbiquitySafeSaveFile isFileDownloaded:](a1, (uint64_t)a3) & 1) != 0)
    {
      v6 = 0;
LABEL_4:
      v3 = 1;
LABEL_27:

      return v3;
    }
    v7 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
    v6 = v7;
    if (v7)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = 0;
      v8 = *(_QWORD *)(v3 + 24);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __54__PFUbiquitySafeSaveFile_downloadLatestVersion_error___block_invoke;
      v33[3] = &unk_1E1EE0A98;
      v33[4] = buf;
      -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v7, v8, 1, 1, &v34, (uint64_t)v33);
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
LABEL_20:
        _Block_object_dispose(buf, 8);
        goto LABEL_21;
      }
      if (a2)
      {
        v35 = 0;
        if ((-[PFUbiquitySafeSaveFile isFileDownloaded:](v3, (uint64_t)&v35) & 1) != 0)
        {
LABEL_9:
          _Block_object_dispose(buf, 8);
          goto LABEL_4;
        }
        v10 = v35;
        if (v35)
          goto LABEL_19;
        *(_BYTE *)(v3 + 40) = 1;
        objc_opt_self();
        v11 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
        -[PFUbiquityFilePresenter registerSafeSaveFile:]((uint64_t)v11, v3);
        *(_BYTE *)(v3 + 80) = 1;

        -[PFUbiquitySafeSaveFile checkFileDownload](v3);
        v12 = *(NSObject **)(v3 + 72);
        v13 = dispatch_time(0, 120000000000);
        if (!dispatch_semaphore_wait(v12, v13) && *(_BYTE *)(v3 + 57))
          goto LABEL_9;
        v35 = *(_QWORD *)(v3 + 48);
        if (!v35)
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v42 = *MEMORY[0x1E0CB2D50];
          v43[0] = CFSTR("The file download timed out.");
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
          v35 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, v15);
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nDownload failed for file, error: %@"), "-[PFUbiquitySafeSaveFile waitForFileToDownload:]", 492, v3, v35);
        v10 = v35;
        if (v35)
        {
LABEL_19:
          v34 = v10;
        }
        else
        {
          v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
          v32 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v38 = 136315394;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiqui"
                  "tySafeSaveFile.m";
            v40 = 1024;
            v41 = 497;
            _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v38, 0x12u);
          }
        }
        goto LABEL_20;
      }
      v9 = -[PFUbiquitySafeSaveFile isFileDownloaded:](v3, (uint64_t)&v34);
      _Block_object_dispose(buf, 8);
      if ((v9 & 1) != 0)
        goto LABEL_4;
    }
LABEL_21:
    if (v34)
    {
      if (a3)
      {
        v3 = 0;
        *a3 = v34;
        goto LABEL_27;
      }
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structu"
                             "re/PFUbiquitySafeSaveFile.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 160;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v3 = 0;
    goto LABEL_27;
  }
  return v3;
}

- (uint64_t)isFileDownloaded:(uint64_t)a1
{
  objc_opt_self();
  if ((_usesCloudDocs & 1) != 0)
    return 1;
  else
    return -[PFUbiquityLocation fileAtLocationIsDownloaded:](*(_QWORD *)(a1 + 24), a2);
}

uint64_t __54__PFUbiquitySafeSaveFile_downloadLatestVersion_error___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)removeFileFromLocation:(_QWORD *)a3 error:
{
  void *v6;
  PFUbiquityFileCoordinator *v7;
  void *v8;
  int *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__70;
  v35 = __Block_byref_object_dispose__70;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v6 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)a2);
  v7 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a2, a1[4]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__PFUbiquitySafeSaveFile_removeFileFromLocation_error___block_invoke;
  v26[3] = &unk_1E1EE1928;
  v26[4] = &v27;
  v26[5] = &v37;
  v26[6] = &v31;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v7, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 1, v32 + 5, v26);
  if (!*((_BYTE *)v28 + 24))
  {
    v8 = -[PFUbiquityLocation createFullPath]((uint64_t)a2);
    if (unlink((const char *)objc_msgSend(v8, "fileSystemRepresentation")))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        v9 = __error();
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to remove file at location: %@\nerrno: %d"), "-[PFUbiquitySafeSaveFile removeFileFromLocation:error:]", 206, a1, a2, *v9);
      }
      v10 = 0;
    }
    else
    {
      v10 = 1;
    }
    *((_BYTE *)v38 + 24) = v10;

  }
  if (*((_BYTE *)v38 + 24) && objc_msgSend(a2, "isEqual:", a1[3]))
  {
    v11 = a1[2];
    v12 = (void *)a1[3];
    v13 = (void *)a1[1];
    if (v12 != (void *)v11)
    {
      if (v12 != v13 || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v11, a1[4], 0))
        goto LABEL_16;
      v13 = (void *)a1[2];
    }
    -[PFUbiquitySafeSaveFile setCurrentLocation:](a1, v13);
  }
LABEL_16:
  if (!*((_BYTE *)v38 + 24))
  {
    v16 = (void *)objc_msgSend((id)v32[5], "domain");
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8])
      && objc_msgSend((id)v32[5], "code") == 4)
    {
      *((_BYTE *)v38 + 24) = 1;
      v32[5] = 0;
    }
    else
    {
      v17 = v32[5];
      if (v17)
      {
        if (a3)
          *a3 = v17;
      }
      else
      {
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
        v25 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
          v43 = 1024;
          v44 = 232;
          _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  v14 = *((_BYTE *)v38 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v14;
}

uint64_t __55__PFUbiquitySafeSaveFile_removeFileFromLocation_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a2, *(_QWORD *)(a1[6] + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (uint64_t)safeSaveFile:(char)a3 moveToPermanentLocation:(_QWORD *)a4 error:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v18 = 0;
  *(_BYTE *)(a1 + 57) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 58) = a3;
  -[PFUbiquitySafeSaveFile setCurrentLocation:]((_QWORD *)a1, *(void **)(a1 + 16));
  if (!objc_msgSend((id)a1, "writeFileToLocation:error:", *(_QWORD *)(a1 + 24), &v18))
  {
LABEL_8:
    if (v18)
    {
      if (a4)
      {
        v8 = 0;
        *a4 = v18;
        return v8;
      }
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
        v21 = 1024;
        v22 = 275;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    return 0;
  }
  objc_opt_self();
  v7 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
  -[PFUbiquityFilePresenter registerSafeSaveFile:]((uint64_t)v7, a1);
  *(_BYTE *)(a1 + 80) = 1;

  objc_opt_self();
  if ((_usesCloudDocs & 1) == 0)
  {
    if (!a2)
    {
      v8 = 1;
      *(_BYTE *)(a1 + 56) = 1;
      -[PFUbiquitySafeSaveFile checkSafeSaveFileUploadAsync](a1);
      return v8;
    }
    if ((objc_msgSend((id)a1, "waitForFileToUpload:", &v18) & 1) != 0)
      return 1;
    goto LABEL_8;
  }
  v8 = 1;
  *(_BYTE *)(a1 + 57) = 1;
  -[PFUbiquitySafeSaveFile safeSaveFinishedUpload](a1);
  return v8;
}

- (void)checkSafeSaveFileUploadAsync
{
  uint64_t v1;
  _QWORD v2[5];
  _QWORD v3[5];

  if (a1 && *(_BYTE *)(a1 + 56))
  {
    v1 = *(_QWORD *)(a1 + 24);
    if (v1 && *(_BYTE *)(v1 + 88))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke;
      v3[3] = &unk_1E1EDD520;
      v3[4] = a1;
      +[_PFUbiquityRecordsImporter afterDelay:executeBlockOnRootQueue:](30.0, (uint64_t)_PFUbiquityRecordsImporter, (uint64_t)v3);
    }
    else
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke_2;
      v2[3] = &unk_1E1EDD520;
      v2[4] = a1;
      +[_PFUbiquityRecordsImporter executeBlockOnRootQueue:]((uint64_t)_PFUbiquityRecordsImporter, (uint64_t)v2);
    }
  }
}

- (void)safeSaveFinishedUpload
{
  char v2;
  id v3;
  void *v4;

  *(_BYTE *)(a1 + 56) = 0;
  if (*(_BYTE *)(a1 + 57))
  {
    if (*(_BYTE *)(a1 + 58))
    {
      v4 = 0;
      v2 = objc_msgSend((id)a1, "moveToPermanentLocation:", &v4);
      *(_BYTE *)(a1 + 57) = v2;
      if ((v2 & 1) == 0)
        -[PFUbiquitySafeSaveFile setSafeSaveError:]((_QWORD *)a1, v4);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  if (*(_BYTE *)(a1 + 80))
  {
    objc_opt_self();
    v3 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
    -[PFUbiquityFilePresenter unregisterSafeSaveFile:]((uint64_t)v3, a1);
    *(_BYTE *)(a1 + 80) = 0;

  }
}

- (BOOL)waitForFileToUpload:(id *)a3
{
  BOOL v5;
  _BOOL4 safeSaveSuccess;
  NSError *v7;
  NSObject *safeSaveSemaphore;
  dispatch_time_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSError *safeSaveError;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  safeSaveError = 0;
  if ((-[PFUbiquitySafeSaveFile isFileUploaded:]((uint64_t)self, (uint64_t)&safeSaveError) & 1) == 0)
  {
    v7 = safeSaveError;
    if (safeSaveError)
      goto LABEL_11;
    self->_continueCheckingUpload = 1;
    -[PFUbiquitySafeSaveFile checkSafeSaveFileUploadAsync]((uint64_t)self);
    safeSaveSemaphore = self->_safeSaveSemaphore;
    v9 = dispatch_time(0, 120000000000);
    if (!dispatch_semaphore_wait(safeSaveSemaphore, v9) && self->_safeSaveSuccess)
      return 1;
    safeSaveError = self->_safeSaveError;
    if (!safeSaveError)
    {
      v10 = *MEMORY[0x1E0CB28A8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("The file upload timed out.");
      safeSaveError = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v10, 512, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
    }
    v11 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
    v7 = safeSaveError;
    if (v11)
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSafe save failed for file, error: %@"), "-[PFUbiquitySafeSaveFile waitForFileToUpload:]", 309, self, safeSaveError);
      v7 = safeSaveError;
    }
LABEL_10:
    if (!v7)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
        v24 = 1024;
        v25 = 314;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      return 0;
    }
LABEL_11:
    if (a3)
    {
      v5 = 0;
      *a3 = v7;
      return v5;
    }
    return 0;
  }
  v5 = 1;
  self->_continueCheckingUpload = 1;
  -[PFUbiquitySafeSaveFile checkSafeSaveFileUpload]((uint64_t)self);
  safeSaveSuccess = self->_safeSaveSuccess;
  v7 = self->_safeSaveError;
  safeSaveError = v7;
  if (!safeSaveSuccess)
    goto LABEL_10;
  return v5;
}

- (uint64_t)isFileUploaded:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_opt_self();
    if ((_usesCloudDocs & 1) != 0)
      return 1;
    else
      return -[PFUbiquityLocation fileAtLocationIsUploaded:](*(_QWORD *)(v3 + 24), a2);
  }
  return result;
}

- (void)checkSafeSaveFileUpload
{
  void *v2;

  if (a1 && *(_BYTE *)(a1 + 56))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Checking peer file upload: %@"), "-[PFUbiquitySafeSaveFile checkSafeSaveFileUpload]", 394, a1);
    v2 = 0;
    if (-[PFUbiquitySafeSaveFile isFileUploaded:](a1, (uint64_t)&v2))
    {
      *(_BYTE *)(a1 + 57) = 1;
LABEL_9:
      -[PFUbiquitySafeSaveFile safeSaveFinishedUpload](a1);
      return;
    }
    if (v2)
    {
      -[PFUbiquitySafeSaveFile setSafeSaveError:]((_QWORD *)a1, v2);
      *(_BYTE *)(a1 + 57) = 0;
      goto LABEL_9;
    }
    -[PFUbiquitySafeSaveFile checkSafeSaveFileUploadAsync](a1);
  }
}

- (BOOL)moveToPermanentLocation:(id *)a3
{
  PFUbiquityFileCoordinator *v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__70;
  v24 = __Block_byref_object_dispose__70;
  v25 = 0;
  v5 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)self->_permanentLocation);
  v6 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)self->_safeSaveLocation);
  v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)self->_permanentLocation);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__PFUbiquitySafeSaveFile_moveToPermanentLocation___block_invoke;
  v19[3] = &unk_1E1EE1EE8;
  v19[6] = &v20;
  v19[4] = self;
  v19[5] = &v26;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](v5, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v7, 8, v6, 2, v21 + 5, v19);
  if (*((_BYTE *)v27 + 24))
    -[PFUbiquitySafeSaveFile setCurrentLocation:](self, self->_permanentLocation);
  if (!*((_BYTE *)v27 + 24))
  {
    v10 = (void *)v21[5];
    if (v10)
    {
      if (a3)
        *a3 = v10;
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m");
      v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquitySafeSaveFile.m";
        v32 = 1024;
        v33 = 349;
        _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v8 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v8;
}

void __50__PFUbiquitySafeSaveFile_moveToPermanentLocation___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", a2, a3, 0, 0, &v8, *(_QWORD *)(a1[6] + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully moved file from: %@ to: %@"), "-[PFUbiquitySafeSaveFile moveToPermanentLocation:]_block_invoke", 338, a1[4], a3, a2);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
  {
    v6 = a1[4];
    v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nHad trouble file from: %@ to: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquitySafeSaveFile moveToPermanentLocation:]_block_invoke", 340, v6, a3, a2, v7, objc_msgSend(v7, "userInfo"));
  }
}

- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (_QWORD)setSafeSaveError:(_QWORD *)result
{
  void *v2;
  _QWORD *v4;

  v2 = (void *)result[8];
  if (v2 != a2)
  {
    v4 = result;

    result = a2;
    v4[8] = result;
  }
  return result;
}

void __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke(uint64_t a1)
{
  -[PFUbiquitySafeSaveFile checkSafeSaveFileUpload](*(_QWORD *)(a1 + 32));
}

void __54__PFUbiquitySafeSaveFile_checkSafeSaveFileUploadAsync__block_invoke_2(uint64_t a1)
{
  -[PFUbiquitySafeSaveFile checkSafeSaveFileUpload](*(_QWORD *)(a1 + 32));
}

- (void)checkFileDownload
{
  char v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  if (a1 && *(_BYTE *)(a1 + 40))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nChecking file download: %@"), "-[PFUbiquitySafeSaveFile checkFileDownload]", 505, a1, *(_QWORD *)(a1 + 24));
    v7 = 0;
    if ((-[PFUbiquitySafeSaveFile isFileDownloaded:](a1, (uint64_t)&v7) & 1) != 0)
    {
      v2 = 1;
    }
    else
    {
      v3 = v7;
      if (!v7)
        return;
      v4 = *(void **)(a1 + 48);
      if (v4 == v7)
      {
        v2 = 0;
      }
      else
      {

        v5 = v3;
        v2 = 0;
        *(_QWORD *)(a1 + 48) = v5;
      }
    }
    *(_BYTE *)(a1 + 41) = v2;
    *(_BYTE *)(a1 + 40) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
    if (*(_BYTE *)(a1 + 80))
    {
      objc_opt_self();
      v6 = (id)-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
      -[PFUbiquityFilePresenter unregisterSafeSaveFile:]((uint64_t)v6, a1);
      *(_BYTE *)(a1 + 80) = 0;

    }
  }
}

@end
