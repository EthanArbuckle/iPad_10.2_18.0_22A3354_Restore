@implementation _PFExternalReferenceData

- (id)initForUbiquityDictionary:(id)a3 store:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  size_t v26;
  void *v27;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_PFExternalReferenceData;
  v6 = -[_PFExternalReferenceData init](&v30, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("databaseValue"));
    v8 = objc_msgSend(a3, "valueForKey:", CFSTR("UUID"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(v7, "length");
      *((_QWORD *)v6 + 3) = v10;
      v11 = PF_CALLOC_UNSCANNED_BYTES(v10);
      *((_QWORD *)v6 + 2) = v11;
      memcpy(v11, (const void *)objc_msgSend(v7, "bytes"), *((_QWORD *)v6 + 3));
      if (a4)
        v12 = (2 * *((_DWORD *)a4 + 48)) & 0x38;
      else
        v12 = 0;
      *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFFC7 | v12;
      v13 = objc_msgSend(v9, "fileSystemRepresentation");
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v15 = v14;
      if (a4)
      {
        v16 = (void *)objc_msgSend(v14, "length");
        if (v16)
          v16 = (void *)objc_msgSend((id)objc_msgSend(a4, "externalDataReferencesDirectory"), "stringByAppendingPathComponent:", v15);
      }
      else
      {
        v16 = 0;
      }
      *((_QWORD *)v6 + 6) = v16;
      v17 = (void *)-[NSSQLCore safeguardLocationForFileWithUUID:]((uint64_t)a4, v15);
      if (v17)
        v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%p"), v17, v6);
      *((_QWORD *)v6 + 7) = v17;
      *((_QWORD *)v6 + 8) = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, (uint64_t)v15, a4);
      *((_QWORD *)v6 + 5) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("length")), "unsignedIntegerValue");
      *((_DWORD *)v6 + 18) |= 1u;
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", *((_QWORD *)v6 + 6)))
      {
        v29 = 0;
        if (a4)
          v18 = (*((_DWORD *)a4 + 48) >> 2) & 7;
        else
          v18 = 0;
        if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, *((_QWORD *)v6 + 6), *((_QWORD *)v6 + 7), v18, &v29))
        {
          v25 = *((_DWORD *)v6 + 18) | 4;
        }
        else
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to link ubiquity file: %@ error: %@"), v19, v20, v21, v22, v23, v24, *((_QWORD *)v6 + 6));
          v25 = *((_DWORD *)v6 + 18) & 0xFFFFFFFB;
        }
      }
      else
      {
        v25 = *((_DWORD *)v6 + 18) | 0x40;
      }
    }
    else
    {
      *((_QWORD *)v6 + 1) = 0;
      v26 = objc_msgSend(v7, "length");
      *((_QWORD *)v6 + 3) = v26;
      v27 = PF_CALLOC_UNSCANNED_BYTES(v26);
      *((_QWORD *)v6 + 2) = v27;
      memcpy(v27, (const void *)objc_msgSend(v7, "bytes"), *((_QWORD *)v6 + 3));
      *((_QWORD *)v6 + 5) = *((_QWORD *)v6 + 3) - 1;
      *((_QWORD *)v6 + 4) = *((_QWORD *)v6 + 2) + 1;
      v25 = *((_DWORD *)v6 + 18) & 0xFFFFFFFA;
    }
    *((_DWORD *)v6 + 18) = v25;
    *((_DWORD *)v6 + 18) = v25 | 0x80;
  }
  return v6;
}

- (id)initForExternalLocation:(id)a3 safeguardLocation:(id)a4 data:(id)a5 protectionLevel:(int)a6
{
  char v6;
  _PFExternalReferenceData *v10;
  _PFExternalReferenceData *v11;
  const char *v12;
  size_t v13;
  _BYTE *v14;
  unsigned int externalDataFlags;
  size_t v16;
  _BYTE *v17;
  void *v18;
  objc_super v20;

  v6 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_PFExternalReferenceData;
  v10 = -[_PFExternalReferenceData init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "fileSystemRepresentation");
      v13 = strlen(v12);
      v11->_originalData = (NSData *)a5;
      v11->_bytesLengthForExternalReference = objc_msgSend(a5, "length");
      v11->_bytesLengthForStore = v13 + 2;
      v14 = PF_CALLOC_UNSCANNED_BYTES(v13 + 2);
      v11->_bytesPtrForStore = v14;
      *v14 = 2;
      memcpy((char *)v11->_bytesPtrForStore + 1, v12, v13);
      *((_BYTE *)v11->_bytesPtrForStore + v11->_bytesLengthForStore - 1) = 0;
      v11->_bytesPtrForExternalReference = 0;
      externalDataFlags = *(_DWORD *)&v11->_externalDataFlags | 1;
      v11->_externalDataFlags = (__externalDataFlags)externalDataFlags;
      if (a4)
      {
        a4 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%p"), a4, v11);
        externalDataFlags = v11->_externalDataFlags;
      }
    }
    else
    {
      v10->_originalData = 0;
      v16 = objc_msgSend(a5, "length");
      v11->_bytesLengthForExternalReference = v16++;
      v11->_bytesLengthForStore = v16;
      v17 = PF_CALLOC_UNSCANNED_BYTES(v16);
      v11->_bytesPtrForStore = v17;
      *v17 = 1;
      v18 = (char *)v11->_bytesPtrForStore + 1;
      v11->_bytesPtrForExternalReference = v18;
      memcpy(v18, (const void *)objc_msgSend(a5, "bytes"), v11->_bytesLengthForExternalReference);
      externalDataFlags = *(_DWORD *)&v11->_externalDataFlags & 0xFFFFFFFE;
      v11->_externalDataFlags = (__externalDataFlags)externalDataFlags;
    }
    v11->_externalDataFlags = (__externalDataFlags)(externalDataFlags & 0xFFFFFF43 | (8 * (v6 & 7)));
    v11->_externalReferenceLocation = (NSString *)a3;
    v11->_safeguardLocation = (NSString *)a4;
  }
  return v11;
}

- (_PFExternalReferenceData)initWithStoreBytes:(const void *)a3 length:(unint64_t)a4 externalLocation:(id)a5 safeguardLocation:(id)a6 protectionLevel:(int)a7
{
  char v7;
  _PFExternalReferenceData *v11;
  _PFExternalReferenceData *v12;
  void *v13;
  unsigned int v14;
  const char *v15;
  int v16;
  off_t st_size;
  objc_super v19;
  stat v20;

  v7 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_PFExternalReferenceData;
  v11 = -[_PFExternalReferenceData init](&v19, sel_init, a3, a4, a5, a6);
  v12 = v11;
  if (v11)
  {
    v11->_bytesLengthForStore = a4;
    v13 = PF_CALLOC_UNSCANNED_BYTES(a4);
    v12->_bytesPtrForStore = v13;
    memcpy(v13, a3, v12->_bytesLengthForStore);
    v14 = *(_DWORD *)&v12->_externalDataFlags & 0xFFFFFFC7 | (8 * (v7 & 7));
    v12->_externalDataFlags = (__externalDataFlags)v14;
    if (*(_BYTE *)v12->_bytesPtrForStore == 1)
    {
      v12->_externalDataFlags = (__externalDataFlags)(v14 & 0xFFFFFFFA);
      v12->_bytesPtrForExternalReference = (char *)v12->_bytesPtrForStore + 1;
      v12->_bytesLengthForExternalReference = a4 - 1;
      v12->_externalReferenceLocation = 0;
      v12->_safeguardLocation = 0;
    }
    else
    {
      v15 = (const char *)objc_msgSend(a5, "fileSystemRepresentation");
      objc_opt_self();
      memset(&v20, 0, sizeof(v20));
      v16 = stat(v15, &v20);
      st_size = v20.st_size;
      if (v16)
        st_size = -1;
      if (st_size < 0)
      {

        return 0;
      }
      else
      {
        v12->_bytesLengthForExternalReference = st_size;
        *(_DWORD *)&v12->_externalDataFlags |= 1u;
        v12->_externalReferenceLocation = (NSString *)a5;
      }
    }
  }
  return v12;
}

- (_PFExternalReferenceData)initWithStoreBytes:(const void *)a3 length:(unint64_t)a4 externalLocation:(id)a5 safeguardLocation:(id)a6 protectionLevel:(int)a7 ubiquitousLocation:(id)a8
{
  char v9;
  _PFExternalReferenceData *v14;
  _PFExternalReferenceData *v15;
  void *v16;
  void *v17;
  const char *v18;
  off_t st_size;
  objc_super v21;
  stat v22;

  v9 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_PFExternalReferenceData;
  v14 = -[_PFExternalReferenceData init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_bytesLengthForStore = a4;
    v16 = PF_CALLOC_UNSCANNED_BYTES(a4);
    v15->_bytesPtrForStore = v16;
    memcpy(v16, a3, v15->_bytesLengthForStore);
    v15->_externalDataFlags = (__externalDataFlags)(*(_DWORD *)&v15->_externalDataFlags & 0xFFFFFFC7 | (8 * (v9 & 7)));
    v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)a8);
    v18 = (const char *)objc_msgSend((id)objc_msgSend(v17, "path"), "fileSystemRepresentation");
    objc_opt_self();
    memset(&v22, 0, sizeof(v22));
    if (stat(v18, &v22))
      st_size = -1;
    else
      st_size = v22.st_size;

    if (st_size < 0)
    {

      return 0;
    }
    else
    {
      v15->_bytesLengthForExternalReference = st_size;
      *(_DWORD *)&v15->_externalDataFlags |= 1u;
      v15->_externalReferenceLocation = (NSString *)a5;
      v15->_safeguardLocation = (NSString *)a6;
      v15->_ubiquitousLocation = a8;
      *(_DWORD *)&v15->_externalDataFlags |= 0x40u;
    }
  }
  return v15;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  void **p_bytesPtrForExternalReference;
  void *bytesPtrForStore;
  NSString *safeguardLocation;
  const char *v6;
  objc_super v7;

  if (!self)
    goto LABEL_8;
  p_bytesPtrForExternalReference = &self->_bytesPtrForExternalReference;
  if (!self->_originalData)
  {
    if (!*p_bytesPtrForExternalReference || (*(_BYTE *)&self->_externalDataFlags & 1) == 0)
      goto LABEL_4;
    PF_FREE_OBJECT_ARRAY(*p_bytesPtrForExternalReference);
    p_bytesPtrForExternalReference = &self->_bytesPtrForExternalReference;
  }
  *p_bytesPtrForExternalReference = 0;
LABEL_4:
  bytesPtrForStore = self->_bytesPtrForStore;
  if (bytesPtrForStore)
  {
    PF_FREE_OBJECT_ARRAY(bytesPtrForStore);
    self->_bytesPtrForStore = 0;
  }
  safeguardLocation = self->_safeguardLocation;
  if (safeguardLocation)
  {
    v6 = -[NSString fileSystemRepresentation](safeguardLocation, "fileSystemRepresentation");
    objc_opt_self();
    unlink(v6);
  }
LABEL_8:

  v7.receiver = self;
  v7.super_class = (Class)_PFExternalReferenceData;
  -[_PFExternalReferenceData dealloc](&v7, sel_dealloc);
}

- (id)mutableCopy
{
  const void *v3;

  v3 = -[_PFExternalReferenceData _bytesPtrForExternalReference](self, "_bytesPtrForExternalReference");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", v3, self->_bytesLengthForExternalReference);
}

- (id)_originalData
{
  return self->_originalData;
}

- (void)_setBytesForExternalReference:(const void *)a3
{
  self->_bytesPtrForExternalReference = (void *)a3;
}

- (uint64_t)_attemptToMapData:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v6;
  PFUbiquityFileCoordinator *v7;
  PFUbiquityFileCoordinator *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 8))
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", *(_QWORD *)(a1 + 48)) & 1) != 0|| (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", *(_QWORD *)(a1 + 56)) & 1) != 0)
    {
      *(_DWORD *)(a1 + 72) &= ~0x40u;
LABEL_7:
      v3 = 1;
      *(_QWORD *)(a1 + 8) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", +[_PFRoutines readExternalReferenceDataFromFile:]((uint64_t)_PFRoutines, (void *)a1), objc_msgSend((id)a1, "_bytesLengthForExternalReference"), 1);
      return v3;
    }
    v6 = *(_QWORD *)(a1 + 64);
    if (!v6 || (*(_BYTE *)(a1 + 72) & 0x40) == 0)
    {
      if (a2)
      {
        v3 = 0;
        *a2 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 120, 0);
        return v3;
      }
      return 0;
    }
    v7 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, v6);
    v20 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)(a1 + 64);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46___PFExternalReferenceData__attemptToMapData___block_invoke;
      v15[3] = &unk_1E1EE09B8;
      v15[4] = a1;
      v15[5] = &v16;
      -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v7, v9, 1, 1, &v20, (uint64_t)v15);

      if (*((_BYTE *)v17 + 24))
      {
        v14 = 0;
        v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v14);
        v11 = v14;
        if (v14)
          v12 = 0;
        else
          v12 = v10;
        if ((v12 & 1) != 0)
        {
          *(_DWORD *)(a1 + 72) &= ~0x40u;
          _Block_object_dispose(&v16, 8);
          goto LABEL_7;
        }
        if (!a2)
          goto LABEL_29;
        goto LABEL_28;
      }
    }
    else
    {
      if (a2)
      {
        *a2 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 119, 0);
        v13 = v17;
      }
      else
      {
        v13 = &v16;
      }
      *((_BYTE *)v13 + 24) = 0;
    }
    if (!a2)
    {
LABEL_29:
      _Block_object_dispose(&v16, 8);
      return 0;
    }
    v11 = v20;
LABEL_28:
    *a2 = v11;
    goto LABEL_29;
  }
  return 1;
}

- (uint64_t)_exceptionForReadError:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(a2, "code");
    if (v3 == 119)
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *(_QWORD *)(v2 + 48);
      v6 = *MEMORY[0x1E0C99768];
      v12[0] = CFSTR("File URL");
      v12[1] = CFSTR("com.apple.coredata.ubiquity.eat");
      v13[0] = v9;
      v13[1] = MEMORY[0x1E0C9AAB0];
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v8 = CFSTR("External data reference; unknown problem.");
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *(_QWORD *)(v2 + 48);
      v6 = *MEMORY[0x1E0C99768];
      if (v3 == 120)
      {
        v14[0] = CFSTR("File URL");
        v14[1] = CFSTR("com.apple.coredata.ubiquity.eat");
        v15[0] = v5;
        v15[1] = MEMORY[0x1E0C9AAB0];
        v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
        v8 = CFSTR("External data reference can't find underlying file.");
      }
      else
      {
        v10[0] = CFSTR("File URL");
        v10[1] = CFSTR("com.apple.coredata.ubiquity.eat");
        v11[0] = v5;
        v11[1] = MEMORY[0x1E0C9AAB0];
        v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
        v8 = CFSTR("External data reference can't load ubiquitous file.");
      }
    }
    return objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v6, v8, v7);
  }
  return result;
}

- (void)_retrieveExternalData
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  if (!a1)
    return 0;
  objc_sync_enter(a1);
  if (a1[4])
  {
    objc_sync_exit(a1);
    return (void *)a1[4];
  }
  else
  {
    v7 = 0;
    if ((-[_PFExternalReferenceData _attemptToMapData:]((uint64_t)a1, &v7) & 1) == 0)
    {
      v6 = (void *)-[_PFExternalReferenceData _exceptionForReadError:]((uint64_t)a1, v7);
      objc_exception_throw(v6);
    }
    v3 = (void *)a1[1];
    if (v3)
      v4 = (void *)objc_msgSend(v3, "bytes");
    else
      v4 = +[_PFRoutines readExternalReferenceDataFromFile:]((uint64_t)_PFRoutines, a1);
    v2 = v4;
    a1[4] = v4;
    objc_sync_exit(a1);
  }
  return v2;
}

- (void)_writeExternalReferenceToInterimLocation
{
  if ((*(_DWORD *)&self->_externalDataFlags & 0x41) == 1)
    +[_PFRoutines writePFExternalReferenceDataToInterimFile:]((uint64_t)_PFRoutines, self);
}

- (void)_moveExternalReferenceToPermanentLocation
{
  if ((*(_DWORD *)&self->_externalDataFlags & 0x41) == 1)
  {
    +[_PFRoutines moveInterimFileToPermanentLocation:]((uint64_t)_PFRoutines, self);
    objc_sync_enter(self);
    if ((*(_BYTE *)&self->_externalDataFlags & 2) == 0 && !self->_bytesPtrForExternalReference)
    {

      self->_originalData = 0;
    }
    objc_sync_exit(self);
  }
}

- (void)_deleteExternalReferenceFromPermanentLocation
{
  if ((*(_BYTE *)&self->_externalDataFlags & 1) != 0)
    +[_PFRoutines deleteFileForPFExternalReferenceData:]((uint64_t)_PFRoutines, self);
}

- (BOOL)hasExternalReferenceContent
{
  return *(_DWORD *)&self->_externalDataFlags & 1;
}

- (id)description
{
  uint64_t v3;

  if ((*(_BYTE *)&self->_externalDataFlags & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("External Data Reference: <self = %p ; path = %s ; length = %qu>"),
                 self,
                 self->_bytesPtrForStore,
                 self->_bytesLengthForExternalReference);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("External Data Reference: <self = %p ; path = nil ; length = %qu>"),
                 self,
                 self->_bytesLengthForExternalReference,
                 v3);
}

- (const)_bytesPtrForStore
{
  return self->_bytesPtrForStore;
}

- (unint64_t)_bytesLengthForStore
{
  return self->_bytesLengthForStore;
}

- (unint64_t)_bytesLengthForExternalReference
{
  return self->_bytesLengthForExternalReference;
}

- (const)_externalReferenceLocation
{
  return -[NSString fileSystemRepresentation](self->_externalReferenceLocation, "fileSystemRepresentation");
}

- (const)_safeguardLocation
{
  return -[NSString fileSystemRepresentation](self->_safeguardLocation, "fileSystemRepresentation");
}

- (id)_safeguardLocationString
{
  return self->_safeguardLocation;
}

- (int)preferredProtectionLevel
{
  return (*(_DWORD *)&self->_externalDataFlags >> 3) & 7;
}

- (id)externalReferenceLocationString
{
  return self->_externalReferenceLocation;
}

- (id)databaseValue
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_bytesPtrForStore, self->_bytesLengthForStore);
}

- (id)UUID
{
  return -[NSString lastPathComponent](self->_externalReferenceLocation, "lastPathComponent");
}

- (void)doCleanupOnDealloc
{
  *(_DWORD *)&self->_externalDataFlags |= 4u;
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  -[_PFExternalReferenceData getBytes:range:](self, "getBytes:range:", a3, 0, a4);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  size_t length;
  off_t location;
  unint64_t bytesLengthForExternalReference;
  NSData *originalData;
  void *v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  bytesLengthForExternalReference = self->_bytesLengthForExternalReference;
  if (a4.location + a4.length > bytesLengthForExternalReference)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("range {%lu, %lu} exceeds data length %lu"), a4.length, a4.location, bytesLengthForExternalReference), 0));
  if ((*(_BYTE *)&self->_externalDataFlags & 1) != 0)
  {
    objc_sync_enter(self);
    v11 = 0;
    if ((-[_PFExternalReferenceData _attemptToMapData:]((uint64_t)self, &v11) & 1) == 0)
    {
      v10 = (void *)-[_PFExternalReferenceData _exceptionForReadError:]((uint64_t)self, v11);
      objc_exception_throw(v10);
    }
    originalData = self->_originalData;
    if (originalData)
    {
      -[NSData getBytes:range:](originalData, "getBytes:range:", a3, location, length);
      objc_sync_exit(self);
    }
    else
    {
      objc_sync_exit(self);
      +[_PFRoutines readBytesForExternalReferenceData:intoBuffer:range:]((uint64_t)_PFRoutines, self, a3, location, length);
    }
  }
  else
  {
    memcpy(a3, (char *)self->_bytesPtrForExternalReference + a4.location, a4.length);
  }
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t bytesLengthForExternalReference;
  void *v7;

  length = a3.length;
  location = a3.location;
  bytesLengthForExternalReference = self->_bytesLengthForExternalReference;
  if (a3.location + a3.length > bytesLengthForExternalReference)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("range {%lu, %lu} exceeds data length %lu"), a3.length, a3.location, bytesLengthForExternalReference), 0));
  v7 = malloc_type_malloc(a3.length, 0x100004077774924uLL);
  -[_PFExternalReferenceData getBytes:range:](self, "getBytes:range:", v7, location, length);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v7, length);
}

- (BOOL)_isEqualHelper:(_QWORD *)a1
{
  int64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;

  if (!a1)
    return 0;
  v4 = a1[5];
  v5 = malloc_type_malloc(0x40000uLL, 0x100004077774924uLL);
  v6 = malloc_type_malloc(0x40000uLL, 0x100004077774924uLL);
  if (a1[5])
  {
    v7 = 0;
    v8 = v4 - 0x40000;
    if (v4 >= 0x40000)
      v4 = 0x40000;
    do
    {
      objc_msgSend(a1, "getBytes:range:", v5, v7, v4);
      objc_msgSend(a2, "getBytes:range:", v6, v7, v4);
      v9 = memcmp(v5, v6, v4);
      v10 = v9 == 0;
      if (v9)
        break;
      v7 += 0x40000;
      v4 = v8 >= 0x40000 ? 0x40000 : v8;
      v8 -= 0x40000;
    }
    while (v7 < a1[5]);
  }
  else
  {
    v10 = 1;
  }
  free(v5);
  free(v6);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isNSData");
    if (v5)
      LOBYTE(v5) = -[_PFExternalReferenceData isEqualToData:](self, "isEqualToData:", a3);
  }
  return v5;
}

- (BOOL)isEqualToData:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  size_t bytesLengthForStore;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    bytesLengthForStore = self->_bytesLengthForStore;
    if (bytesLengthForStore == *((_QWORD *)a3 + 3)
      && !memcmp(self->_bytesPtrForStore, *((const void **)a3 + 2), bytesLengthForStore))
    {
      return 1;
    }
    v6 = -[_PFExternalReferenceData _bytesLengthForExternalReference](self, "_bytesLengthForExternalReference");
    v7 = objc_msgSend(a3, "_bytesLengthForExternalReference");
  }
  else
  {
    v6 = -[_PFExternalReferenceData _bytesLengthForExternalReference](self, "_bytesLengthForExternalReference");
    v7 = objc_msgSend(a3, "length");
  }
  return v6 == v7 && -[_PFExternalReferenceData _isEqualHelper:](self, a3);
}

- (BOOL)_createdByUbiquityImport
{
  return *(_BYTE *)&self->_externalDataFlags >> 7;
}

@end
