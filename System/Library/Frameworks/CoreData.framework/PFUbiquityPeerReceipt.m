@implementation PFUbiquityPeerReceipt

- (PFUbiquityPeerReceipt)init
{
  PFUbiquityPeerReceipt *v2;
  PFUbiquityPeerReceipt *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityPeerReceipt;
  v2 = -[PFUbiquitySafeSaveFile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_kv = 0;
    v2->_writeDate = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 receiptPeerID:(id)a4 storeName:(id)a5 modelVersionHash:(id)a6 andUbiquityRootLocation:(id)a7
{
  void *v9;
  PFUbiquityPeerReceipt *v10;

  v9 = +[PFUbiquityLocation createUbiquityPeerReceiptFileLocationForPeerWithID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
  v10 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andReceiptFileLocation:](self, "initWithLocalPeerID:andReceiptFileLocation:", a3, v9);

  return v10;
}

- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 andKnowledgeVector:(id)a4 forPeerID:(id)a5 storeName:(id)a6 modelVersionHash:(id)a7 andUbiquityRootLocation:(id)a8
{
  PFUbiquityPeerReceipt *v9;

  v9 = -[PFUbiquityPeerReceipt initWithLocalPeerID:receiptPeerID:storeName:modelVersionHash:andUbiquityRootLocation:](self, "initWithLocalPeerID:receiptPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", a3, a5, a6, a7, a8);
  if (v9)
    v9->_kv = (PFUbiquityKnowledgeVector *)a4;
  return v9;
}

- (PFUbiquityPeerReceipt)initWithLocalPeerID:(id)a3 andReceiptFileLocation:(id)a4
{
  void *v7;
  PFUbiquityPeerReceipt *v8;

  v7 = +[PFUbiquityLocation createUbiquityPeerReceiptSafeSaveLocationFromReceiptFileLocation:]((uint64_t)PFUbiquityLocation, a4);
  v8 = -[PFUbiquitySafeSaveFile initWithPermanentLocation:safeSaveLocation:andLocalPeerID:](self, "initWithPermanentLocation:safeSaveLocation:andLocalPeerID:", a4, v7, a3);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_kv = 0;
  self->_writeDate = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerReceipt;
  -[PFUbiquitySafeSaveFile dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityPeerReceipt;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tkv: %@\n"), -[PFUbiquitySafeSaveFile description](&v3, sel_description), self->_kv);
}

- (BOOL)loadFileFromLocation:(id)a3 error:(id *)a4
{
  BOOL v4;
  uint64_t v8;
  PFUbiquityFileCoordinator *v9;
  PFUbiquityKnowledgeVector *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[9];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE buf[24];
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = 1;
  if (!self->_kv)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    v31 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__60;
    v29 = __Block_byref_object_dispose__60;
    v30 = 0;
    if (a3)
      v8 = *((_QWORD *)a3 + 4);
    else
      v8 = 0;
    v9 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a3, v8);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v37 = __Block_byref_object_copy__60;
    v38 = __Block_byref_object_dispose__60;
    v39 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__PFUbiquityPeerReceipt_loadFileFromLocation_error___block_invoke;
    v20[3] = &unk_1E1EE1C18;
    v20[6] = buf;
    v20[7] = &v25;
    v20[8] = &v32;
    v20[4] = self;
    v20[5] = &v21;
    -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v9, (uint64_t)a3, 1, 1, &v31, (uint64_t)v20);
    if (*((_BYTE *)v33 + 24))
    {
      v10 = [PFUbiquityKnowledgeVector alloc];
      self->_kv = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:](v10, "initWithKnowledgeVectorString:", v26[5]);
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Successfully loaded receipt: %@"), "-[PFUbiquityPeerReceipt loadFileFromLocation:error:]", 123, self);
    }
    else
    {
      if (*((_BYTE *)v22 + 24))
        v31 = *(id *)(*(_QWORD *)&buf[8] + 40);
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to load knowledge vector from location: %@. Error (%d): %@\nuserInfo: %@"), "-[PFUbiquityPeerReceipt loadFileFromLocation:error:]", 129, a3, *((unsigned __int8 *)v22 + 24), v31, objc_msgSend(v31, "userInfo"));
    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);

    if (!*((_BYTE *)v33 + 24))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to load receipt file: %@\nuserInfo: %@"), "-[PFUbiquityPeerReceipt loadFileFromLocation:error:]", 134, v31, objc_msgSend(v31, "userInfo"));
      if (v31)
      {
        if (a4)
          *a4 = v31;
      }
      else
      {
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeVector/PFUbiquityPeerReceipt.m");
        v19 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeV"
                               "ector/PFUbiquityPeerReceipt.m";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 135;
          _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
    }

    v26[5] = 0;
    v4 = *((_BYTE *)v33 + 24) != 0;
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v32, 8);
  }
  return v4;
}

void __52__PFUbiquityPeerReceipt_loadFileFromLocation_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v3 = (void *)objc_msgSend(a2, "path");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3))
  {
    v7 = (id)-[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], v3, 0, *(_QWORD *)(a1[6] + 8) + 40);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", -[_PFZipFileArchive contentsForEntryName:]((uint64_t)v7, (uint64_t)CFSTR("kv")), 4);
    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
    v4 = (void *)-[_PFZipFileArchive contentsForEntryName:]((uint64_t)v7, (uint64_t)CFSTR("date"));
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(v4, "length"))
      {
        v6 = *(double *)objc_msgSend(v5, "bytes");

        *(_QWORD *)(a1[4] + 96) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v6);
      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
  }
}

- (BOOL)writeFileToLocation:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  PFUbiquityFileCoordinator *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[9];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v31 = 0;
  v32 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__60;
  v30 = __Block_byref_object_dispose__60;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3052000000;
  v21[3] = __Block_byref_object_copy__60;
  v21[4] = __Block_byref_object_dispose__60;
  v21[5] = self->_kv;
  v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)a3);
  if (a3)
    v8 = *((_QWORD *)a3 + 4);
  else
    v8 = 0;
  v9 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)a3, v8);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__PFUbiquityPeerReceipt_writeFileToLocation_error___block_invoke;
  v20[3] = &unk_1E1EE1C18;
  v20[6] = &v33;
  v20[7] = &v26;
  v20[8] = v21;
  v20[4] = self;
  v20[5] = &v22;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v9, "coordinateWritingItemAtURL:options:error:byAccessor:", v7, 8, &v32, v20);
  if (*((_BYTE *)v34 + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@: Successfully wrote to file."), "-[PFUbiquityPeerReceipt writeFileToLocation:error:]", 182, self);
  }
  else
  {
    if (*((_BYTE *)v23 + 24))
      v32 = (id)v27[5];
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@: Unable to write receipt file. Error: %@\nuserInfo: %@"), "-[PFUbiquityPeerReceipt writeFileToLocation:error:]", 188, self, v32, objc_msgSend(v32, "userInfo"));
  }
  if (!*((_BYTE *)v34 + 24))
  {
    if (v32)
    {
      if (a4)
        *a4 = v32;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeVector/PFUbiquityPeerReceipt.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/KnowledgeVector/PFUbiquityPeerReceipt.m";
        v39 = 1024;
        v40 = 192;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v10 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v33, 8);
  return v10;
}

void __51__PFUbiquityPeerReceipt_writeFileToLocation_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v4 = (void *)objc_msgSend(a2, "URLByDeletingLastPathComponent");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v4, "path")) & 1) == 0)*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, *(_QWORD *)(a1[7] + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    if (v5)
      v6 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](v5);
    else
      v6 = objc_alloc_init(MEMORY[0x1E0CB3940]);
    v7 = v6;
    v8 = objc_msgSend(v6, "dataUsingEncoding:", 4);
    objc_msgSend(*(id *)(a1[4] + 96), "timeIntervalSince1970");
    v13 = v9;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v13, 8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("kv"), v10, CFSTR("date"), 0);
    v12 = (void *)-[_PFZipFileArchive initWithEntryNames:contents:properties:options:]((uint64_t)[_PFZipFileArchive alloc], (void *)objc_msgSend(v11, "allKeys"), v11, 0);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = -[_PFZipFileArchive writeToFile:options:error:]((uint64_t)v12, (void *)objc_msgSend(a2, "path"), 1, *(_QWORD *)(a1[7] + 8) + 40);

  }
}

@end
