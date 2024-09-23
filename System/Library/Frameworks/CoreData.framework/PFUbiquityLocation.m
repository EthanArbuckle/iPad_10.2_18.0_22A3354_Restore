@implementation PFUbiquityLocation

+ (void)initialize
{
  uint64_t v3;

  objc_opt_self();
  objc_opt_class();
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    if (_usesCloudDocs == 1)
      v3 = objc_msgSend((id)+[PFUbiquityFilePresenter cloudDocsRootFolder](), "copy");
    else
      v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLForUbiquityContainerIdentifier:", 0);
    _PFUbiquityLocationSentinel = v3;
    _PFUbiquityLocationLocalSentinel = (uint64_t)CFSTR("CoreDataUbiquitySupport");
  }
}

- (PFUbiquityLocation)init
{
  PFUbiquityLocation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocation;
  result = -[PFUbiquityLocation init](&v3, sel_init);
  if (result)
  {
    result->_ubiquityRootLocation = 0;
    result->_ubiquityRootLocationPath = 0;
    result->_ubiquityLocationType = 1;
    result->_isRootUbiquitous = 0;
    *(_OWORD *)&result->_exportingPeerID = 0u;
    *(_OWORD *)&result->_modelVersionHash = 0u;
    *(_OWORD *)((char *)&result->_filename + 1) = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFUbiquityLocation *v4;
  PFUbiquityLocation *v5;
  PFUbiquityLocation *ubiquityRootLocation;
  PFUbiquityLocation *v7;
  NSString *ubiquityRootLocationPath;
  uint64_t ubiquityLocationType;
  _BOOL8 isRootUbiquitous;

  v4 = -[PFUbiquityLocation init](+[PFUbiquityLocation allocWithZone:](PFUbiquityLocation, "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    ubiquityRootLocation = self;
    if (self->_ubiquityLocationType != 1)
      ubiquityRootLocation = self->_ubiquityRootLocation;
    -[PFUbiquityLocation setUbiquityRootLocation:](v4, "setUbiquityRootLocation:", ubiquityRootLocation);
    v7 = self;
    while (v7->_ubiquityLocationType != 1)
    {
      v7 = v7->_ubiquityRootLocation;
      if (!v7)
      {
        ubiquityRootLocationPath = 0;
        goto LABEL_9;
      }
    }
    ubiquityRootLocationPath = v7->_ubiquityRootLocationPath;
LABEL_9:
    -[PFUbiquityLocation setUbiquityRootLocationPath:](v5, "setUbiquityRootLocationPath:", ubiquityRootLocationPath);
    -[PFUbiquityLocation setExportingPeerID:](v5, "setExportingPeerID:", self->_exportingPeerID);
    -[PFUbiquityLocation setStoreName:](v5, "setStoreName:", self->_storeName);
    -[PFUbiquityLocation setModelVersionHash:](v5, "setModelVersionHash:", self->_modelVersionHash);
    -[PFUbiquityLocation setFilename:](v5, "setFilename:", self->_filename);
    -[PFUbiquityLocation setOtherPathComponents:](v5, "setOtherPathComponents:", self->_otherPathComponents);
    ubiquityLocationType = self->_ubiquityLocationType;
  }
  else
  {
    -[PFUbiquityLocation setUbiquityRootLocation:](v4, "setUbiquityRootLocation:", 0);
    -[PFUbiquityLocation setUbiquityRootLocationPath:](v5, "setUbiquityRootLocationPath:", 0);
    -[PFUbiquityLocation setExportingPeerID:](v5, "setExportingPeerID:", 0);
    -[PFUbiquityLocation setStoreName:](v5, "setStoreName:", 0);
    -[PFUbiquityLocation setModelVersionHash:](v5, "setModelVersionHash:", 0);
    -[PFUbiquityLocation setFilename:](v5, "setFilename:", 0);
    -[PFUbiquityLocation setOtherPathComponents:](v5, "setOtherPathComponents:", 0);
    ubiquityLocationType = 0;
  }
  -[PFUbiquityLocation setUbiquityLocationType:](v5, "setUbiquityLocationType:", ubiquityLocationType);
  -[PFUbiquityLocation setHash:](v5, "setHash:", -[PFUbiquityLocation hash](self, "hash"));
  if (self)
    isRootUbiquitous = self->_isRootUbiquitous;
  else
    isRootUbiquitous = 0;
  -[PFUbiquityLocation setIsRootUbiquitous:](v5, "setIsRootUbiquitous:", isRootUbiquitous);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_ubiquityRootLocation = 0;
  self->_ubiquityRootLocationPath = 0;

  self->_exportingPeerID = 0;
  self->_storeName = 0;

  self->_modelVersionHash = 0;
  self->_filename = 0;

  self->_otherPathComponents = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocation;
  -[PFUbiquityLocation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v3 = -[PFUbiquityLocation createFullPath]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityLocation;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), -[PFUbiquityLocation description](&v6, sel_description), v3);

  return v4;
}

- (void)createFullPath
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!a1)
    return 0;
  v1 = a1;
  v2 = a1;
  while (*(_DWORD *)(v2 + 24) != 1)
  {
    v2 = *(_QWORD *)(v2 + 8);
    if (!v2)
      return 0;
  }
  if (!*(_QWORD *)(v2 + 16))
    return 0;
  v3 = -[PFUbiquityLocation createRelativePath](a1);
  while (*(_DWORD *)(v1 + 24) != 1)
  {
    v1 = *(_QWORD *)(v1 + 8);
    if (!v1)
    {
      v4 = 0;
      goto LABEL_12;
    }
  }
  v4 = *(_QWORD *)(v1 + 16);
LABEL_12:
  v5 = +[PFUbiquityLocation createStringByAppendingSubpath:toPath:]((uint64_t)PFUbiquityLocation, v3, v4);

  return v5;
}

- (BOOL)fileExistsAtLocationWithLocalPeerID:(_QWORD *)a3 error:
{
  PFUbiquityFileCoordinator *v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL8 v18;
  _QWORD v20[6];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a1, a2);
  v7 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v8 = -[PFUbiquityLocation createFullPath](a1);
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v8);
  *((_BYTE *)v23 + 24) = v9;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2) & 1) != 0 || !*((_BYTE *)v23 + 24))
  {
    v21 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__PFUbiquityLocation_fileExistsAtLocationWithLocalPeerID_error___block_invoke;
    v20[3] = &unk_1E1EE0A48;
    v20[4] = v7;
    v20[5] = &v22;
    -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v6, a1, 1, 1, &v21, (uint64_t)v20);
    if (v21)
    {
      if (objc_msgSend(v21, "code") == 134320)
      {
        *((_BYTE *)v23 + 24) = 0;
      }
      else if (v21)
      {
        if (a3)
          *a3 = v21;
      }
      else
      {
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquityLocation.m");
        v17 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquityLocation.m";
          v28 = 1024;
          v29 = 327;
          _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }
  }

  v18 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  return v18;
}

uint64_t __64__PFUbiquityLocation_fileExistsAtLocationWithLocalPeerID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (uint64_t)fileAtLocationIsUploaded:(uint64_t)result
{
  void *v3;
  uint64_t v4;

  if (result)
  {
    if (*(_BYTE *)(result + 88))
    {
      v3 = (void *)-[PFUbiquityLocation createFullURL](result);
      v4 = +[_PFRoutines isUbiquitousURLUploaded:error:]((uint64_t)_PFRoutines, v3, a2);

      return v4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)createFullURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = -[PFUbiquityLocation createFullPath](a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v2, *(unsigned __int8 *)(a1 + 72));

  return v4;
}

- (uint64_t)fileAtLocationIsDownloaded:(uint64_t)result
{
  void *v3;
  uint64_t v4;

  if (result)
  {
    if (*(_BYTE *)(result + 88))
    {
      v3 = (void *)-[PFUbiquityLocation createFullURL](result);
      v4 = +[_PFRoutines isUbiquitousURLDownloaded:error:]((uint64_t)_PFRoutines, v3, a2);

      return v4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)removeFileAtLocation:(_QWORD *)a3 error:
{
  PFUbiquityFileCoordinator *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _BYTE buf[24];
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v22 = 0;
  v5 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a1, a2);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v28 = __Block_byref_object_copy__55;
  v29 = __Block_byref_object_dispose__55;
  v30 = 0;
  v6 = (void *)-[PFUbiquityLocation createFullURL](a1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__PFUbiquityLocation_removeFileAtLocation_error___block_invoke;
  v17[3] = &unk_1E1EE1928;
  v17[4] = &v18;
  v17[5] = &v23;
  v17[6] = buf;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v5, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 1, &v22, v17);
  if (*((_BYTE *)v24 + 24))
  {
    if (!*((_BYTE *)v19 + 24))
      *((_BYTE *)v24 + 24) = 0;
  }
  else
  {
    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v18, 8);
  if (!*((_BYTE *)v24 + 24))
  {
    if (v22)
    {
      if (a3)
        *a3 = v22;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structure/PFUbiquityLocation.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/File Structu"
                             "re/PFUbiquityLocation.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 382;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v7 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  return v7;
}

uint64_t __49__PFUbiquityLocation_removeFileAtLocation_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a2, *(_QWORD *)(a1[6] + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)createRelativePath
{
  id v2;
  void *v3;
  __CFString **v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString **v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v3 = v2;
  switch(*(_DWORD *)(a1 + 24))
  {
    case 2:
      goto LABEL_51;
    case 3:
      goto LABEL_16;
    case 4:
      goto LABEL_21;
    case 5:
      goto LABEL_19;
    case 6:
      goto LABEL_18;
    case 7:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_18:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_19:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      goto LABEL_20;
    case 8:
      goto LABEL_23;
    case 9:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_23:
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("stores"), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 32), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      v8 = CFSTR("current.nosync");
      goto LABEL_50;
    case 0xA:
    case 0x28:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      goto LABEL_15;
    case 0xB:
LABEL_15:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_16:
      v8 = *(const __CFString **)(a1 + 40);
      goto LABEL_50;
    case 0xC:
      goto LABEL_7;
    case 0xD:
      goto LABEL_5;
    case 0xE:
    case 0x21:
    case 0x22:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      goto LABEL_4;
    case 0xF:
      goto LABEL_40;
    case 0x10:
      goto LABEL_13;
    case 0x11:
      goto LABEL_12;
    case 0x12:
      goto LABEL_30;
    case 0x13:
      goto LABEL_29;
    case 0x14:
      goto LABEL_28;
    case 0x15:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v9 = objc_msgSend(*(id *)(a1 + 64), "count") - 1;
        if (v9 >= 0)
        {
          do
          {
            v10 = objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", v9);
            objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
            objc_msgSend(v3, "insertString:atIndex:", v10, 0);
            --v9;
          }
          while (v9 != -1);
        }
      }
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_28:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_29:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_30:
      v11 = PFUbiquityTransactionLogTemporaryDirectoryName;
      goto LABEL_38;
    case 0x16:
    case 0x20:
    case 0x29:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v5 = objc_msgSend(*(id *)(a1 + 64), "count") - 1;
        if (v5 >= 0)
        {
          do
          {
            v6 = objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", v5);
            objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
            objc_msgSend(v3, "insertString:atIndex:", v6, 0);
            --v5;
          }
          while (v5 != -1);
        }
      }
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_12:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_13:
      v7 = *(__CFString **)(a1 + 40);
      goto LABEL_39;
    case 0x17:
      goto LABEL_37;
    case 0x18:
      goto LABEL_36;
    case 0x19:
      goto LABEL_35;
    case 0x1A:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v12 = objc_msgSend(*(id *)(a1 + 64), "count") - 1;
        if (v12 >= 0)
        {
          do
          {
            v13 = objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", v12);
            objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
            objc_msgSend(v3, "insertString:atIndex:", v13, 0);
            --v12;
          }
          while (v12 != -1);
        }
      }
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_35:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_36:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_37:
      v11 = &PFUbiquityTransactionLogStagingDirectoryName;
LABEL_38:
      v7 = *v11;
LABEL_39:
      objc_msgSend(v3, "insertString:atIndex:", v7, 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_40:
      v14 = *(const __CFString **)(a1 + 32);
      goto LABEL_53;
    case 0x1B:
      goto LABEL_43;
    case 0x1C:
      goto LABEL_42;
    case 0x1D:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_42:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_43:
      v14 = CFSTR(".externalData");
      goto LABEL_53;
    case 0x1E:
      goto LABEL_49;
    case 0x1F:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      goto LABEL_49;
    case 0x23:
LABEL_4:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_5:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 32), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      goto LABEL_6;
    case 0x24:
LABEL_6:
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("metadata.nosync"), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_7:
      v4 = PFUbiquityStackMetadataDirectoryName;
      goto LABEL_52;
    case 0x25:
    case 0x26:
      goto LABEL_46;
    case 0x27:
      objc_msgSend(v2, "insertString:atIndex:", *(_QWORD *)(a1 + 56), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_46:
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v15 = objc_msgSend(*(id *)(a1 + 64), "count") - 1;
        if (v15 >= 0)
        {
          do
          {
            objc_msgSend(v3, "insertString:atIndex:", objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", v15), 0);
            objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
            --v15;
          }
          while (v15 != -1);
        }
      }
LABEL_49:
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("staging.nosync"), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
      v8 = *(const __CFString **)(a1 + 40);
      goto LABEL_50;
    case 0x2A:
LABEL_20:
      objc_msgSend(v3, "insertString:atIndex:", *(_QWORD *)(a1 + 32), 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_21:
      v8 = CFSTR("current.nosync");
LABEL_50:
      objc_msgSend(v3, "insertString:atIndex:", v8, 0);
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("/"), 0);
LABEL_51:
      v4 = PFUbiquityBaselineDirectory;
LABEL_52:
      v14 = *v4;
LABEL_53:
      objc_msgSend(v3, "insertString:atIndex:", v14, 0);
      break;
    default:
      return v3;
  }
  return v3;
}

+ (void)createStringByAppendingSubpath:(uint64_t)a3 toPath:
{
  void *v5;
  int v6;
  int v7;

  objc_opt_self();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", a3);
  if (objc_msgSend(a2, "length"))
  {
    v6 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1);
    v7 = objc_msgSend(a2, "characterAtIndex:", 0);
    if (v6 == 47 && v7 == 47)
    {
      a2 = (void *)objc_msgSend(a2, "substringFromIndex:", 1);
    }
    else if (v6 != 47 && v7 != 47)
    {
      objc_msgSend(v5, "appendString:", CFSTR("/"));
    }
    objc_msgSend(v5, "appendString:", a2);
  }
  return v5;
}

- (void)setUbiquityLocationType:(int)a3
{
  self->_ubiquityLocationType = a3;
  self->_isDirectory = (a3 > 0x2A) | (0x4785B9FB97FuLL >> a3) & 1;
}

- (void)setExportingPeerID:(id)a3
{
  NSString *exportingPeerID;

  exportingPeerID = self->_exportingPeerID;
  if (exportingPeerID != a3)
  {

    self->_exportingPeerID = (NSString *)a3;
  }
}

- (void)setStoreName:(id)a3
{
  NSString *storeName;

  storeName = self->_storeName;
  if (storeName != a3)
  {

    self->_storeName = (NSString *)a3;
  }
}

- (void)setModelVersionHash:(id)a3
{
  NSString *modelVersionHash;

  modelVersionHash = self->_modelVersionHash;
  if (modelVersionHash != a3)
  {

    self->_modelVersionHash = (NSString *)a3;
  }
}

- (void)setFilename:(id)a3
{
  NSString *filename;

  filename = self->_filename;
  if (filename != a3)
  {

    self->_filename = (NSString *)a3;
  }
}

- (void)setOtherPathComponents:(id)a3
{
  NSArray *otherPathComponents;

  otherPathComponents = self->_otherPathComponents;
  if (otherPathComponents != a3)
  {

    self->_otherPathComponents = (NSArray *)a3;
  }
}

- (void)setUbiquityRootLocationPath:(id)a3
{
  NSString *ubiquityRootLocationPath;

  ubiquityRootLocationPath = self->_ubiquityRootLocationPath;
  if (ubiquityRootLocationPath != a3)
  {

    self->_ubiquityRootLocationPath = (NSString *)a3;
  }
}

- (void)setUbiquityRootLocation:(id)a3
{
  PFUbiquityLocation *ubiquityRootLocation;
  PFUbiquityLocation *v6;
  BOOL isRootUbiquitous;

  ubiquityRootLocation = self->_ubiquityRootLocation;
  if (ubiquityRootLocation != a3)
  {

    v6 = (PFUbiquityLocation *)a3;
    self->_ubiquityRootLocation = v6;
    if (v6)
      isRootUbiquitous = v6->_isRootUbiquitous;
    else
      isRootUbiquitous = 0;
    self->_isRootUbiquitous = isRootUbiquitous;
  }
}

- (void)setHash:(unint64_t)a3
{
  self->_hash = a3;
}

- (void)setIsRootUbiquitous:(BOOL)a3
{
  self->_isRootUbiquitous = a3;
}

- (void)updateHash
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    v3 = -[PFUbiquityLocation createFullPath]((uint64_t)a1);
    v4 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v3);
    objc_msgSend(a1, "setHash:", +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v4));

    objc_autoreleasePoolPop(v2);
  }
}

+ (uint64_t)pathByTruncatingBeforeLibraryMobileDocuments:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_opt_self();
  objc_opt_self();
  v3 = objc_msgSend(a2, "rangeOfString:options:", _PFUbiquityLocationSentinel, 1);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_self();
    v3 = objc_msgSend(a2, "rangeOfString:options:", _PFUbiquityLocationLocalSentinel, 1);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Core Data's ubiquity integration requires that the value for NSPersistentStoreUbiquitousContentURLKey point inside ~/Library/Mobile Documents. Given value: %@"), a2);
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = (void *)MEMORY[0x1E0C99D80];
      if (!a2)
        a2 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v7, objc_msgSend(v10, "dictionaryWithObject:forKey:", a2, CFSTR("offendingPath"))));
    }
  }
  v5 = (void *)objc_msgSend(a2, "substringFromIndex:", v3 + v4);
  if (objc_msgSend(v5, "length") && objc_msgSend(v5, "characterAtIndex:", 0) == 47)
    return objc_msgSend(v5, "substringFromIndex:", 1);
  else
    return (uint64_t)v5;
}

+ (PFUbiquityLocation)createUbiquityLocationForRootPath:(uint64_t)a1
{
  objc_opt_self();
  return +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, a2, 1);
}

+ (PFUbiquityLocation)createUbiquityLocationForRootPath:(int)a3 checkIsUbiquitous:
{
  void *v5;
  PFUbiquityLocation *v6;
  void *v7;

  objc_opt_self();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", a2);
  if (objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1) == 47)
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("/private")))
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(CFSTR("/private"), "length"));
  v6 = objc_alloc_init(PFUbiquityLocation);
  -[PFUbiquityLocation setUbiquityRootLocationPath:](v6, "setUbiquityRootLocationPath:", v5);

  -[PFUbiquityLocation setUbiquityLocationType:](v6, "setUbiquityLocationType:", 1);
  -[PFUbiquityLocation updateHash](v6);
  if (a3 && objc_msgSend(a2, "rangeOfString:", _PFUbiquityLocationLocalSentinel) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v6);
    -[PFUbiquityLocation setIsRootUbiquitous:](v6, "setIsRootUbiquitous:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isUbiquitousItemAtURL:", v7));

  }
  return v6;
}

+ (PFUbiquityLocation)createUbiquityLocationForRootURL:(uint64_t)a1
{
  void *v3;

  objc_opt_self();
  v3 = (void *)objc_msgSend(a2, "path");
  objc_opt_self();
  return +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, v3, 1);
}

+ (_BYTE)createUbiquityLocationForURL:(_BYTE *)a3 withUbiquityRootLocation:
{
  objc_opt_self();
  return +[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (id)objc_msgSend(a2, "path"), a3);
}

+ (_BYTE)createUbiquityLocationForPath:(_BYTE *)a3 withUbiquityRootLocation:
{
  _BYTE *v4;
  id v5;
  void *v6;
  void *v7;
  __objc2_class **p_superclass;
  void *v9;
  void *v10;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  void *v30;
  BOOL v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  void *v48;

  objc_opt_self();
  v4 = a3;
  if (a3)
  {
    while (*((_DWORD *)v4 + 6) != 1)
    {
      v4 = (_BYTE *)*((_QWORD *)v4 + 1);
      if (!v4)
        goto LABEL_4;
    }
    v5 = (id)*((_QWORD *)v4 + 2);
  }
  else
  {
LABEL_4:
    v5 = 0;
  }
  if (!a2)
    return a2;
  if (objc_msgSend(a2, "characterAtIndex:", objc_msgSend(a2, "length") - 1) == 47)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", a2);
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(a2, "length") - 1, 1);
    a2 = v6;
  }
  if (objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1) == 47)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v5);
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
    v5 = v7;
  }
  if (objc_msgSend(v5, "isEqualToString:", a2))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Path: %@ is a ubiquity root url.\nMatches: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 841, a2, v5);
    return a3;
  }
  p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
  v9 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v5);
  v10 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, a2);
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v10, "rangeOfString:", v9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Path: %@ does not appear to be a descendant of the root url: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 851, a2, v5);
      return 0;
    }
    if (a3 && a3[88] && objc_msgSend(v10, "rangeOfString:", _PFUbiquityLocationLocalSentinel) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  It appears the store file is nested inside the container log directory. This is a really bad idea: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 856, v10);
      a2 = (id)objc_msgSend(a3, "copy");
      objc_msgSend(a2, "setUbiquityLocationType:", 0);
      return a2;
    }
  }
  if (objc_msgSend(v10, "isEqualToString:", v9))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Truncated path: %@ is a ubiquity root url.\nMatches: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 866, v10, v9);
    return a3;
  }
  v12 = (void *)objc_msgSend(v10, "pathComponents");
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend((id)objc_msgSend(v9, "pathComponents"), "count");
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ".icloud");
  if (v14 >= v13)
  {
    v19 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v20 = 1;
  }
  else
  {
    v17 = v16;
    v18 = 0;
    v45 = 0;
    v46 = 0;
    v19 = 0;
    v44 = 0;
    v47 = 0;
    v48 = 0;
    v20 = 1;
    do
    {
      v21 = v18;
      v22 = (void *)objc_msgSend(v12, "objectAtIndex:", v14);
      if (objc_msgSend(v22, "hasSuffix:", v17))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Changing path component to remove promise suffix previous: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 899, v22);
        v22 = (void *)objc_msgSend(v22, "stringByDeletingPathExtension");
        if ((unint64_t)objc_msgSend(v22, "length") >= 2
          && objc_msgSend(v22, "characterAtIndex:", 0) == 46)
        {
          v22 = (void *)objc_msgSend(v22, "substringFromIndex:", 1);
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Changing path component to remove promise suffix new: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 904, v22);
      }
      v23 = 42;
      v24 = v22;
      switch((int)v20)
      {
        case 1:
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR(".baseline")) & 1) != 0)
          {
            v23 = 2;
            goto LABEL_149;
          }
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR(".cdmetadata")) & 1) != 0)
          {
            v23 = 12;
            goto LABEL_149;
          }
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR(".externalData")) & 1) != 0)
          {
            v23 = 27;
            goto LABEL_149;
          }
          v31 = objc_msgSend(v22, "isEqualToString:", CFSTR(".cdmetadata.nosync")) == 0;
          v32 = 15;
          v33 = 12;
          goto LABEL_87;
        case 2:
          v29 = objc_msgSend(v22, "isEqualToString:", CFSTR("current.nosync"));
          if (v29)
            v20 = 4;
          else
            v20 = 3;
          v30 = v47;
          if (!v29)
            v30 = v22;
          v47 = v30;
          LOBYTE(v45) = v29 | v45;
          if ((v21 & 1) != 0)
            goto LABEL_157;
          goto LABEL_139;
        case 3:
        case 5:
          v26 = (v45 & 1) == 0;
          v25 = 11;
          v27 = 6;
          goto LABEL_60;
        case 4:
          goto LABEL_135;
        case 6:
        case 11:
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR("staging.nosync")) & 1) != 0)
          {
            v23 = 30;
            goto LABEL_149;
          }
          if ((v45 & 1) != 0)
          {
            if (objc_msgSend(v22, "isEqualToString:", CFSTR("stores")))
              v20 = 8;
            else
              v20 = 7;
            LOBYTE(v45) = 1;
            if ((v21 & 1) != 0)
              goto LABEL_156;
            goto LABEL_120;
          }
          v37 = objc_msgSend(v22, "isEqualToString:", CFSTR("baseline.zip"));
          LOBYTE(v45) = 0;
          v18 = 0;
          if (v37)
            v20 = 10;
          else
            v20 = 40;
          v38 = v48;
          if (!v37)
            v38 = v22;
          v48 = v38;
          v19 = v22;
          if ((v21 & 1) != 0)
            goto LABEL_157;
          break;
        case 8:
          v20 = 9;
          if ((v21 & 1) != 0)
            goto LABEL_156;
          goto LABEL_120;
        case 12:
          v31 = objc_msgSend(v22, "isEqualToString:", CFSTR("metadata.nosync")) == 0;
          v32 = 13;
          v33 = 36;
LABEL_87:
          if (v31)
            v20 = v32;
          else
            v20 = v33;
          v34 = v48;
          if (v31)
            v34 = v22;
          v48 = v34;
          if ((v21 & 1) != 0)
            goto LABEL_157;
          goto LABEL_139;
        case 13:
          v20 = 35;
          if ((v21 & 1) == 0)
            goto LABEL_114;
          goto LABEL_72;
        case 15:
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR("tempLogs.nosync")) & 1) == 0)
          {
            v35 = objc_msgSend(v22, "isEqualToString:", CFSTR(".stage.nosync"));
            if (v35)
              v20 = 23;
            else
              v20 = 16;
            v36 = v47;
            if (!v35)
              v36 = v22;
            v47 = v36;
            BYTE4(v45) |= v35;
            if ((v21 & 1) == 0)
              goto LABEL_139;
            goto LABEL_157;
          }
          v46 = 1;
          v23 = 18;
LABEL_149:
          v24 = v48;
          if ((v21 & 1) != 0)
            goto LABEL_136;
          goto LABEL_150;
        case 16:
        case 19:
        case 24:
          if ((v45 & 0x100000000) != 0)
            v25 = 25;
          else
            v25 = 17;
          v26 = (v46 & 1) == 0;
          v27 = 20;
LABEL_60:
          if (v26)
            v20 = v25;
          else
            v20 = v27;
          if ((v21 & 1) != 0)
          {
            v44 = v22;
            goto LABEL_157;
          }
          v18 = 0;
          v44 = v22;
          break;
        case 17:
        case 20:
        case 25:
          if ((v45 & 0x100000000) != 0)
            v28 = 26;
          else
            v28 = 22;
          if ((v46 & 1) != 0)
            v20 = 21;
          else
            v20 = v28;
          if (v14 < v13 - 1 && ++v14 < v13)
          {
            do
            {
              objc_msgSend(v15, "addObject:", v22);
              v22 = (void *)objc_msgSend(v12, "objectAtIndex:", v14++);
            }
            while (v13 != v14);
            v14 = v13;
          }
          v19 = v22;
          if ((objc_msgSend(v22, "hasSuffix:", CFSTR(".0.cdt")) & 1) != 0
            || objc_msgSend(v22, "hasSuffix:", CFSTR(".0.cdt.nosync")))
          {
            if (objc_msgSend(v22, "isEqualToString:", CFSTR("receipt.0.cdt")))
              v20 = 32;
            else
              v20 = 41;
          }
          if ((objc_msgSend(v22, "hasSuffix:", CFSTR(".cdt")) & 1) != 0)
          {
            v23 = v20;
            v24 = v48;
            if ((v21 & 1) != 0)
              goto LABEL_136;
            goto LABEL_150;
          }
          if (!(v21 & 1 | ((objc_msgSend(v22, "hasSuffix:", CFSTR(".cdt.nosync")) & 1) == 0)))
            goto LABEL_139;
          goto LABEL_157;
        case 18:
        case 23:
          if ((v46 & 1) != 0)
            v20 = 19;
          else
            v20 = 24;
          if ((v21 & 1) != 0)
            goto LABEL_72;
          goto LABEL_114;
        case 27:
          v20 = 28;
          if ((v21 & 1) == 0)
            goto LABEL_114;
          goto LABEL_72;
        case 28:
          v20 = 29;
          if ((v21 & 1) != 0)
            goto LABEL_156;
          goto LABEL_120;
        case 30:
          if (objc_msgSend(v22, "rangeOfString:", CFSTR("_SUPPORT")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v23 = 31;
            goto LABEL_134;
          }
          objc_msgSend(v15, "addObject:", v22);
          v20 = 37;
          if ((v21 & 1) != 0)
            goto LABEL_157;
          goto LABEL_139;
        case 35:
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR("metadata.store")) & 1) != 0)
          {
            v23 = 14;
          }
          else
          {
            if ((objc_msgSend(v22, "hasPrefix:", CFSTR("metadata.store")) & 1) == 0)
            {
              v39 = (void *)objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("."));
              if (objc_msgSend(v39, "count") == 2)
              {
                v40 = objc_msgSend((id)objc_msgSend(v39, "lastObject"), "isEqualToString:", CFSTR("cid"));
                v20 = 33;
                if (!(v21 & 1 | ((v40 & 1) == 0)))
                {
LABEL_120:
                  v18 = 0;
                  v19 = v22;
                  break;
                }
              }
              else
              {
                v20 = 33;
              }
LABEL_156:
              v19 = v22;
              goto LABEL_157;
            }
            v23 = 34;
          }
LABEL_134:
          v24 = v48;
          v19 = v22;
LABEL_135:
          if ((v21 & 1) != 0)
          {
LABEL_136:
            v48 = v24;
            v20 = v23;
            goto LABEL_157;
          }
LABEL_150:
          v18 = 0;
          v48 = v24;
          v20 = v23;
          break;
        case 36:
          v20 = 13;
          if ((v21 & 1) != 0)
          {
            v48 = v22;
            goto LABEL_157;
          }
          v18 = 0;
          v48 = v22;
          break;
        case 37:
          if (objc_msgSend(v22, "rangeOfString:", CFSTR("EXTERNAL_DATA")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = 37;
            goto LABEL_157;
          }
          objc_msgSend(v15, "addObject:", v22);
          v20 = 38;
          if ((v21 & 1) != 0)
            goto LABEL_157;
LABEL_139:
          v18 = 0;
          break;
        case 38:
          v20 = 39;
          if ((v21 & 1) != 0)
            goto LABEL_156;
          goto LABEL_120;
        case 42:
          v20 = 5;
          if ((v21 & 1) != 0)
          {
LABEL_72:
            v47 = v22;
LABEL_157:
            if ((!objc_msgSend(v19, "length") || objc_msgSend(v19, "characterAtIndex:", 0) != 46)
              && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to continue parse components of URL: %@\nConfused by: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 1139, a2, v22);
            }
            v18 = 1;
          }
          else
          {
LABEL_114:
            v18 = 0;
            v47 = v22;
          }
          break;
        default:
          goto LABEL_157;
      }
      ++v14;
    }
    while (v14 < v13);
    p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
    v41 = v44;
    v42 = v47;
    v43 = v48;
    if ((v18 & 1) != 0)
      goto LABEL_170;
  }
  if (!objc_msgSend(v19, "length") || objc_msgSend(v19, "characterAtIndex:", 0) != 46)
  {
    a2 = objc_alloc_init((Class)(p_superclass + 314));
    objc_msgSend(a2, "setUbiquityRootLocation:", a3);
    objc_msgSend(a2, "setUbiquityLocationType:", v20);
    objc_msgSend(a2, "setExportingPeerID:", v43);
    objc_msgSend(a2, "setStoreName:", v42);
    objc_msgSend(a2, "setModelVersionHash:", v41);
    objc_msgSend(a2, "setFilename:", v19);
    objc_msgSend(a2, "setOtherPathComponents:", v15);
    -[PFUbiquityLocation updateHash](a2);
    goto LABEL_172;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Ignoring private file: %@"), "+[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]", 1151, a2);
LABEL_170:
  a2 = 0;
LABEL_172:

  return a2;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t hash;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self == a3)
        return 1;
      hash = self->_hash;
      if (hash == objc_msgSend(a3, "hash"))
      {
        v6 = -[PFUbiquityLocation createFullPath]((uint64_t)self);
        v7 = -[PFUbiquityLocation createFullPath]((uint64_t)a3);
        v8 = v7;
        if (v6)
        {
          v9 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v6);
          if (v8)
          {
LABEL_7:
            v10 = +[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v8);
            v11 = 0;
            if (v9 && v10)
              v11 = objc_msgSend(v9, "isEqualToString:", v10);
            goto LABEL_15;
          }
        }
        else
        {
          v9 = 0;
          if (v7)
            goto LABEL_7;
        }
        v11 = 0;
LABEL_15:

        return v11;
      }
    }
  }
  return 0;
}

- (BOOL)isEqualToURL:(id)a3
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) == 0)
    return 0;
  v6 = (void *)objc_msgSend(a3, "path");
  v7 = -[PFUbiquityLocation createFullPath]((uint64_t)self);
  objc_opt_self();
  v8 = (void *)+[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v6);
  LOBYTE(v8) = objc_msgSend(v8, "isEqualToString:", +[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v7));

  return (char)v8;
}

+ (uint64_t)createVersionHashStringForModel:(uint64_t)a1
{
  objc_opt_self();
  return +[_PFRoutines _createNicksBase64EncodedStringFromData:]((uint64_t)_PFRoutines, (void *)objc_msgSend(a2, "versionHash"));
}

+ (void)createMetadataStoreFileLocationForLocalPeerID:(uint64_t)a3 storeName:(void *)a4 andUbiquityRootLocation:
{
  void *v7;

  objc_opt_self();
  v7 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v7, "setExportingPeerID:", a2);
  objc_msgSend(v7, "setStoreName:", a3);
  objc_msgSend(v7, "setFilename:", CFSTR("metadata.store"));
  objc_msgSend(v7, "setUbiquityLocationType:", 14);
  -[PFUbiquityLocation updateHash](v7);
  return v7;
}

+ (void)createMetadataPeerStoreLocationForLocalPeerID:(uint64_t)a3 storeName:(void *)a4 andUbiquityRootLocation:
{
  void *v7;

  objc_opt_self();
  v7 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v7, "setStoreName:", a3);
  objc_msgSend(v7, "setExportingPeerID:", a2);
  objc_msgSend(v7, "setUbiquityLocationType:", 35);
  -[PFUbiquityLocation updateHash](a4);
  return v7;
}

+ (void)createMetadataUUIDLocationForLocalPeerID:(uint64_t)a3 storeName:(uint64_t)a4 UUID:(void *)a5 andUbiquityRootLocation:
{
  void *v9;
  void *v10;

  objc_opt_self();
  v9 = (void *)objc_msgSend(a5, "copy");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), a4, CFSTR("cid"));
  objc_msgSend(v9, "setFilename:", v10);

  objc_msgSend(v9, "setStoreName:", a3);
  objc_msgSend(v9, "setExportingPeerID:", a2);
  objc_msgSend(v9, "setUbiquityLocationType:", 33);
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createPeerBaselineFileLocationForLocalPeerID:(void *)a3 andBaselineFileLocation:
{
  void *v5;

  objc_opt_self();
  v5 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "setFilename:", a2);
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createPeerBaselineFileSafeSaveLocationForLocalPeerID:(void *)a3 andBaselineFileLocation:
{
  void *v5;

  objc_opt_self();
  v5 = (void *)objc_msgSend(a3, "copy");
  objc_opt_self();
  if (_usesCloudDocs == 1)
    a2 = (void *)objc_msgSend(a2, "stringByAppendingString:", CFSTR(".nosync"));
  objc_msgSend(v5, "setFilename:", a2);
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createBaselineLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  void *v9;

  objc_opt_self();
  v9 = (void *)objc_msgSend(a5, "copy");
  objc_msgSend(v9, "setUbiquityLocationType:", a2);
  switch((int)a2)
  {
    case 2:
      goto LABEL_5;
    case 3:
      goto LABEL_4;
    case 10:
      objc_msgSend(v9, "setFilename:", CFSTR("baseline.zip"));
      goto LABEL_3;
    case 11:
LABEL_3:
      objc_msgSend(v9, "setModelVersionHash:", a4);
LABEL_4:
      objc_msgSend(v9, "setStoreName:", a3);
LABEL_5:
      -[PFUbiquityLocation updateHash](v9);
      return v9;
    default:

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d is not a valid baseline location type."), a2), 0));
  }
}

+ (void)createBaselineStagingLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 modelVersionHash:(uint64_t)a5 andFilename:(void *)a6 withUbiquityRootLocation:
{
  void *v11;

  objc_opt_self();
  v11 = (void *)objc_msgSend(a6, "copy");
  objc_msgSend(v11, "setUbiquityLocationType:", a2);
  if ((int)a2 > 10)
  {
    if ((_DWORD)a2 == 11 || (_DWORD)a2 == 30)
      goto LABEL_6;
    if ((_DWORD)a2 == 31)
    {
      objc_msgSend(v11, "setFilename:", a5);
LABEL_6:
      objc_msgSend(v11, "setModelVersionHash:", a4);
LABEL_9:
      objc_msgSend(v11, "setStoreName:", a3);
      goto LABEL_10;
    }
LABEL_11:

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d is not a valid baseline location type."), a2), 0));
  }
  if ((_DWORD)a2 != 2)
  {
    if ((_DWORD)a2 == 3)
      goto LABEL_9;
    goto LABEL_11;
  }
LABEL_10:
  -[PFUbiquityLocation updateHash](v11);
  return v11;
}

+ (void)createCurrentBaselineLocation:(uint64_t)a3 forStoreName:(uint64_t)a4 peerID:(uint64_t)a5 andModelVersionHash:(uint64_t)a6 forFileNamed:(void *)a7 withUbiquityRootLocation:
{
  void *v13;
  void *result;

  objc_opt_self();
  v13 = (void *)objc_msgSend(a7, "copy");
  objc_msgSend(v13, "setUbiquityLocationType:", a2);
  switch((int)a2)
  {
    case 4:
      goto LABEL_6;
    case 5:
      goto LABEL_4;
    case 6:
      goto LABEL_3;
    case 7:
    case 8:
    case 9:
      objc_msgSend(v13, "setFilename:", a6);
LABEL_3:
      objc_msgSend(v13, "setModelVersionHash:", a5);
LABEL_4:
      objc_msgSend(v13, "setStoreName:", a3);
      break;
    default:
      if ((_DWORD)a2 != 42)
      {

        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d is not a valid current baseline location type."), a2), 0));
      }
      return result;
  }
  objc_msgSend(v13, "setExportingPeerID:", a4);
LABEL_6:
  -[PFUbiquityLocation updateHash](v13);
  return v13;
}

+ (void)createTransactionLogLocationForPeerID:(uint64_t)a3 storeName:(uint64_t)a4 modelVersionHash:(uint64_t)a5 logFilename:(void *)a6 andUbiquityRootLocation:
{
  void *v11;

  objc_opt_self();
  v11 = (void *)objc_msgSend(a6, "copy");
  objc_msgSend(v11, "setExportingPeerID:", a2);
  objc_msgSend(v11, "setStoreName:", a3);
  objc_msgSend(v11, "setModelVersionHash:", a4);
  objc_msgSend(v11, "setFilename:", a5);
  objc_msgSend(v11, "setUbiquityLocationType:", 22);
  -[PFUbiquityLocation updateHash](v11);
  return v11;
}

+ (void)createStagingPeerStoreVersionLocationForExportingPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  void *v9;

  objc_opt_self();
  v9 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a2, a3, a4, a5);
  objc_msgSend(v9, "setUbiquityLocationType:", 25);
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createPeerStoreVersionLocationForPeerID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  void *v9;

  objc_opt_self();
  v9 = (void *)objc_msgSend(a5, "copy");
  objc_msgSend(v9, "setUbiquityLocationType:", 17);
  objc_msgSend(v9, "setExportingPeerID:", a2);
  objc_msgSend(v9, "setStoreName:", a3);
  objc_msgSend(v9, "setModelVersionHash:", a4);
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createPeerRootLocationForPeerID:(void *)a3 withUbiquityRootLocation:
{
  void *v5;

  objc_opt_self();
  v5 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "setUbiquityLocationType:", 15);
  objc_msgSend(v5, "setExportingPeerID:", a2);
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createPeerStoreLocationForPeerID:(uint64_t)a3 andStoreName:(void *)a4 withUbiquityRootLocation:
{
  void *v7;

  objc_opt_self();
  v7 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v7, "setUbiquityLocationType:", 16);
  objc_msgSend(v7, "setExportingPeerID:", a2);
  objc_msgSend(v7, "setStoreName:", a3);
  -[PFUbiquityLocation updateHash](v7);
  return v7;
}

+ (PFUbiquityLocation)createUbiquityExternalDataReferenceStoreLocationForStoreName:(uint64_t)a3 withUbiquityRootLocation:
{
  PFUbiquityLocation *v5;

  objc_opt_self();
  v5 = objc_alloc_init(PFUbiquityLocation);
  -[PFUbiquityLocation setUbiquityRootLocation:](v5, "setUbiquityRootLocation:", a3);
  -[PFUbiquityLocation setStoreName:](v5, "setStoreName:", a2);
  -[PFUbiquityLocation setUbiquityLocationType:](v5, "setUbiquityLocationType:", 28);
  -[PFUbiquityLocation updateHash](v5);
  return v5;
}

+ (void)createUbiquityExternalDataReferenceFileLocationForUUID:(void *)a3 andStore:(void *)a4 withUbiquityRootLocation:
{
  uint64_t v7;
  void *v8;

  objc_opt_self();
  v7 = objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  objc_opt_self();
  v8 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v8, "setUbiquityRootLocation:", a4);
  objc_msgSend(v8, "setFilename:", a2);
  objc_msgSend(v8, "setStoreName:", v7);
  objc_msgSend(v8, "setUbiquityLocationType:", 29);
  -[PFUbiquityLocation updateHash](v8);
  return v8;
}

+ (void)createUbiquityExternalDataReferenceFileLocationForUUID:(uint64_t)a3 andLog:
{
  void *v5;
  void *v6;

  objc_opt_self();
  if (a3)
    v5 = *(void **)(a3 + 24);
  else
    v5 = 0;
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "setFilename:", a2);
  objc_msgSend(v6, "setModelVersionHash:", 0);
  objc_msgSend(v6, "setUbiquityLocationType:", 29);
  -[PFUbiquityLocation updateHash](v6);
  return v6;
}

+ (void)createUbiquityPeerReceiptFileLocationForPeerWithID:(uint64_t)a3 storeName:(uint64_t)a4 andModelVersionHash:(void *)a5 withUbiquityRootLocation:
{
  void *v9;

  objc_opt_self();
  v9 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a2, a3, a4, (uint64_t)CFSTR("receipt.0.cdt"), a5);
  objc_msgSend(v9, "setUbiquityLocationType:", 32);
  -[PFUbiquityLocation updateHash](v9);
  return v9;
}

+ (void)createUbiquityPeerReceiptSafeSaveLocationFromReceiptFileLocation:(uint64_t)a1
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_opt_self();
  v3 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v3, "setUbiquityLocationType:", 41);
  objc_opt_self();
  v4 = _usesCloudDocs;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v4 == 1)
  {
    if (a2)
      v6 = a2[4];
    else
      v6 = 0;
    v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@.0.cdt.nosync"), v6);
  }
  else
  {
    if (a2)
      v8 = a2[4];
    else
      v8 = 0;
    v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@.0.cdt"), v8);
  }
  v9 = (void *)v7;
  objc_msgSend(v3, "setFilename:", v7);

  -[PFUbiquityLocation updateHash](v3);
  return v3;
}

+ (id)createMapOfLocationsForOldManagedObjectModel:(void *)a3 andNewManagedObjectModel:(uint64_t)a4 inUbiquityPeerStoreLocation:
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  PFUbiquityLocation *v18;
  _DWORD *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_self();
  v23 = (void *)+[_PFRoutines _createNicksBase64EncodedStringFromData:]((uint64_t)_PFRoutines, (void *)objc_msgSend(a2, "versionHash"));
  objc_opt_self();
  v25 = (void *)+[_PFRoutines _createNicksBase64EncodedStringFromData:]((uint64_t)_PFRoutines, (void *)objc_msgSend(a3, "versionHash"));
  if (a4)
  {
    v7 = *(_QWORD *)(a4 + 32);
    v8 = *(_QWORD *)(a4 + 40);
    if (*(_DWORD *)(a4 + 24) == 1)
      v9 = (void *)a4;
    else
      v9 = *(void **)(a4 + 8);
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v9 = 0;
  }
  v10 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v7, v8, (uint64_t)v23, v9);
  v27 = -[PFUbiquityLocation createFullPath]((uint64_t)v10);
  v22 = v10;
  v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "subpathsAtPath:", v27);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    obj = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v27, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        if (a4)
        {
          v16 = a4;
          while (*(_DWORD *)(v16 + 24) != 1)
          {
            v16 = *(_QWORD *)(v16 + 8);
            if (!v16)
              goto LABEL_14;
          }
          v17 = *(void **)(v16 + 16);
        }
        else
        {
LABEL_14:
          v17 = 0;
        }
        objc_opt_self();
        objc_opt_self();
        v18 = +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, v17, 1);
        v19 = +[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v15, v18);

        if (v19 && v19[6] == 32)
        {

        }
        else
        {
          v20 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v20, "setModelVersionHash:", v25);
          objc_msgSend(v24, "setObject:forKey:", v20, v19);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  return v24;
}

+ (void)createLocalStoresPathWithLocalPeerID:(const __CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:
{
  void *v9;

  objc_opt_self();
  v9 = +[PFUbiquityLocation createLocalBasePathWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, a2, a3, a4, a5);
  objc_msgSend(v9, "appendString:", CFSTR("store"));
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  return v9;
}

+ (void)createLocalBasePathWithLocalPeerID:(const __CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:
{
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;

  objc_opt_self();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", objc_msgSend((id)objc_msgSend(a5, "path"), "stringByDeletingLastPathComponent"));
  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("CoreDataUbiquitySupport"));
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "deleteCharactersInRange:", v10, objc_msgSend(v9, "length") - v10);
  if (objc_msgSend(v9, "characterAtIndex:", objc_msgSend(v9, "length") - 1) != 47)
    objc_msgSend(v9, "appendString:", CFSTR("/"));
  objc_msgSend(v9, "appendString:", _PFUbiquityLocationLocalSentinel);
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  objc_msgSend(v9, "appendString:", a2);
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  objc_msgSend(v9, "appendString:", a4);
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  if (a3)
  {
    v11 = v9;
    v12 = a3;
  }
  else
  {
    v12 = CFSTR("local");
    v11 = v9;
  }
  objc_msgSend(v11, "appendString:", v12);
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  return v9;
}

+ (PFUbiquityLocation)createLocalContainerRootLocationWithLocalPeerID:(const __CFString *)a3 containerID:(uint64_t)a4 storeName:(void *)a5 andStoreURL:
{
  void *v9;
  PFUbiquityLocation *v10;

  objc_opt_self();
  v9 = +[PFUbiquityLocation createLocalBasePathWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, a2, a3, a4, a5);
  objc_msgSend(v9, "appendString:", CFSTR("container"));
  v10 = +[PFUbiquityLocation createUbiquityLocationForRootPath:checkIsUbiquitous:]((uint64_t)PFUbiquityLocation, v9, 0);

  return v10;
}

+ (id)createArrayOfSubLocationsAtLocation:(uint64_t)a3 error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  _BYTE *v17;
  void *v18;
  uint64_t v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = -[PFUbiquityLocation createFullPath](a2);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (objc_msgSend(v6, "fileExistsAtPath:", v5))
  {
    v7 = (void *)objc_msgSend(v6, "subpathsOfDirectoryAtPath:error:", v5, a3);
    if (v7)
    {
      v8 = v7;
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        do
        {
          v12 = v8;
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v12);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
            v15 = +[PFUbiquityLocation createStringByAppendingSubpath:toPath:]((uint64_t)PFUbiquityLocation, v14, (uint64_t)v5);
            if (a2)
            {
              v16 = (_BYTE *)a2;
              if (*(_DWORD *)(a2 + 24) != 1)
                v16 = *(_BYTE **)(a2 + 8);
            }
            else
            {
              v16 = 0;
            }
            v17 = +[PFUbiquityLocation createUbiquityLocationForPath:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v15, v16);
            if (v17)
            {
              v18 = v17;
              objc_msgSend(v21, "addObject:", v17);

            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Got nil location for subpath: %@ of location: %@"), "+[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]", 1678, v14, a2);
            }

            ++v13;
          }
          while (v10 != v13);
          v8 = v12;
          v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v10 = v19;
        }
        while (v19);
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  return v21;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end
