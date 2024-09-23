@implementation PFUbiquityLocationStatus

- (PFUbiquityLocationStatus)init
{
  PFUbiquityLocationStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocationStatus;
  result = -[PFUbiquityLocationStatus init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_isExported = 0;
    *(_DWORD *)&result->_isLive = 0;
    *(_DWORD *)&result->_isDownloading = 0;
    result->_error = 0;
    result->_hash = 0;
    result->_location = 0;
    *(_OWORD *)&result->_numBytes = xmmword_18A509E80;
  }
  return result;
}

- (PFUbiquityLocationStatus)initWithLocation:(id)a3
{
  PFUbiquityLocationStatus *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = -[PFUbiquityLocationStatus init](self, "init");
  if (v4)
  {
    v4->_location = (PFUbiquityLocation *)a3;
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (a3 && *((_DWORD *)a3 + 6) == 1)
    {
      while (*((_DWORD *)a3 + 6) != 1)
      {
        a3 = (id)*((_QWORD *)a3 + 1);
        if (!a3)
        {
          v6 = 0;
          goto LABEL_9;
        }
      }
      v6 = (void *)*((_QWORD *)a3 + 2);
LABEL_9:
      objc_msgSend(v5, "appendString:", +[PFUbiquityLocation pathByTruncatingBeforeLibraryMobileDocuments:]((uint64_t)PFUbiquityLocation, v6));
    }
    else
    {
      v7 = -[PFUbiquityLocation createRelativePath]((uint64_t)a3);
      objc_msgSend(v5, "appendString:", v7);

    }
    v4->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v5);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_error = 0;
  self->_location = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityLocationStatus;
  -[PFUbiquityLocationStatus dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (id)description
{
  void *v3;
  void *v4;
  PFUbiquityLocation *location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityLocationStatus;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[PFUbiquityLocationStatus description](&v7, sel_description));
  v4 = v3;
  location = self->_location;
  if (location)
    location = (PFUbiquityLocation *)location->_isRootUbiquitous;
  objc_msgSend(v3, "appendFormat:", CFSTR(" - %d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%ld"), location, self->_isLive, self->_isDeleted, self->_isFailed, self->_isDownloaded, self->_isDownloading, self->_isUploaded, self->_isUploading, self->_isExported, self->_isScheduled, self->_isImported, self->_numNotifications);
  if (self->_error)
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), self->_error);
  return v4;
}

- (uint64_t)checkFileURLState
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  char v14;
  void *v15;
  uint64_t v16;
  stat v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    ++*(_QWORD *)(result + 56);
    v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v3 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(v1 + 24));
    memset(&v17, 0, sizeof(v17));
    if (stat((const char *)objc_msgSend((id)objc_msgSend(v3, "path"), "fileSystemRepresentation"), &v17))
    {
      v4 = *__error();
      if ((_DWORD)v4 == 2)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Tried to stat missing file: %@"), "-[PFUbiquityLocationStatus checkFileURLState]", 126, v3);
        goto LABEL_18;
      }
      if ((_DWORD)v4 == 20)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Tried to stat a file but part of the directory structure has gone missing: %@"), "-[PFUbiquityLocationStatus checkFileURLState]", 122, v3);
LABEL_18:
        if (*(_BYTE *)(v1 + 8))
          *(_BYTE *)(v1 + 9) = 1;
        *(_BYTE *)(v1 + 8) = 0;
        goto LABEL_36;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error trying to read file (%d): %@"), "-[PFUbiquityLocationStatus checkFileURLState]", 130, v4, v3);
      if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))goto LABEL_18;
    }
    else
    {
      *(_QWORD *)(v1 + 48) = v17.st_size;
    }
    *(_BYTE *)(v1 + 8) = 1;
    v5 = *(_QWORD *)(v1 + 24);
    if (!v5 || !*(_BYTE *)(v5 + 88))
    {
      *(_DWORD *)(v1 + 10) = 0;
      goto LABEL_36;
    }
    objc_opt_self();
    if (_usesCloudDocs == 1)
    {
      *(_DWORD *)(v1 + 10) = 65537;
LABEL_36:

      return objc_msgSend(v2, "drain");
    }
    v16 = 0;
    v6 = *MEMORY[0x1E0C99B38];
    v7 = *MEMORY[0x1E0C99B00];
    v18[0] = *MEMORY[0x1E0C99B38];
    v18[1] = v7;
    v8 = *MEMORY[0x1E0C99B40];
    v9 = *MEMORY[0x1E0C99B20];
    v18[2] = *MEMORY[0x1E0C99B40];
    v18[3] = v9;
    v10 = (void *)objc_msgSend(v3, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4), &v16);
    v11 = v10;
    if (!v10)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error reading resource values for URL: %@\n%@"), "-[PFUbiquityLocationStatus checkFileURLState]", 169, v3, v16);
      goto LABEL_36;
    }
    if (*(_BYTE *)(v1 + 12))
    {
      v12 = 1;
    }
    else
    {
      v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", v6), "BOOLValue");
      *(_BYTE *)(v1 + 12) = v12;
    }
    if (*(_BYTE *)(v1 + 10))
    {
      v13 = 1;
      if (v12)
        goto LABEL_30;
    }
    else
    {
      v15 = (void *)objc_msgSend(v11, "objectForKey:", v7);
      v13 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C99AF0]);
      *(_BYTE *)(v1 + 10) = v13;
      if (*(_BYTE *)(v1 + 12))
      {
LABEL_30:
        *(_BYTE *)(v1 + 13) = 0;
        if (v13)
        {
LABEL_31:
          v14 = 0;
LABEL_32:
          *(_BYTE *)(v1 + 11) = v14;
          goto LABEL_36;
        }
LABEL_35:
        if (*(_BYTE *)(v1 + 11))
          goto LABEL_36;
        v14 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v9), "BOOLValue");
        goto LABEL_32;
      }
    }
    *(_BYTE *)(v1 + 13) = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v8), "BOOLValue");
    if (*(_BYTE *)(v1 + 10))
      goto LABEL_31;
    goto LABEL_35;
  }
  return result;
}

@end
