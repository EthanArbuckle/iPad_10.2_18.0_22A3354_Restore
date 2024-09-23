@implementation CKDClonedFileCache

- (CKDClonedFileCache)initWithCacheDirectory:(id)a3 limit:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDClonedFileCache *v9;
  uint64_t v10;
  NSURL *cacheDirectory;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *entries;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDClonedFileCache;
  v9 = -[CKDClonedFileCache init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v6, v7, v8);
    cacheDirectory = v9->_cacheDirectory;
    v9->_cacheDirectory = (NSURL *)v10;

    v9->_entryLimit = a4;
    objc_msgSend_cacheEntries(v9, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    entries = v9->_entries;
    v9->_entries = (NSMutableArray *)v14;

  }
  return v9;
}

- (id)cacheEntries
{
  uint64_t v2;
  void *v4;
  NSURL *cacheDirectory;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int ResourceValue_forKey_error;
  const char *v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v47;
  CKDClonedFileCache *v48;
  void *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[2];
  _BYTE v57[128];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKCreateDirectoryAtURL();
  cacheDirectory = self->_cacheDirectory;
  v6 = *MEMORY[0x1E0C998E8];
  v58[0] = *MEMORY[0x1E0C998E8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v58, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v4;
  objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v4, v9, (uint64_t)cacheDirectory, v8, 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v48 = self;
  v49 = (void *)objc_msgSend_initWithCapacity_(v11, v12, self->_entryLimit);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v13 = v10;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v52, v57, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v53;
    v19 = *MEMORY[0x1E0C99A90];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v51 = 0;
        ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v21, v16, (uint64_t)&v51, v19, 0);
        v24 = v51;
        v25 = 0;
        if (ResourceValue_forKey_error)
        {
          v50 = 0;
          v26 = objc_msgSend_getResourceValue_forKey_error_(v21, v23, (uint64_t)&v50, v6, 0);
          v27 = v50;
          v25 = v27;
          if (v26)
          {
            v56[0] = v27;
            v56[1] = v24;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v56, 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v49, v30, (uint64_t)v29);

          }
        }

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v52, v57, 16);
    }
    while (v17);
  }

  objc_msgSend_sortUsingComparator_(v49, v31, (uint64_t)&unk_1E782EBC8);
  v34 = objc_msgSend_count(v49, v32, v33);
  if (v34)
  {
    v35 = v34;
    for (j = 0; j != v35; ++j)
    {
      v37 = (void *)MEMORY[0x1C3B83E24]();
      objc_msgSend_objectAtIndex_(v49, v38, j);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v39, v40, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_replaceObjectAtIndex_withObject_(v49, v42, j, v41);
      objc_msgSend_URLByAppendingPathComponent_(v48->_cacheDirectory, v43, (uint64_t)v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKMarkFilePurgeable_(v44, v45, 0);

      objc_autoreleasePoolPop(v37);
    }
  }

  return v49;
}

- (void)prune
{
  uint64_t v2;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  NSURL *cacheDirectory;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  id v15;

  v4 = objc_msgSend_count(self->_entries, a2, v2);
  if (v4 > self->_entryLimit)
  {
    v7 = v4;
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v5, v6);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      cacheDirectory = self->_cacheDirectory;
      objc_msgSend_objectAtIndex_(self->_entries, v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_(cacheDirectory, v11, (uint64_t)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_removeItemAtURL_error_(v15, v13, (uint64_t)v12, 0);
      objc_msgSend_removeObjectAtIndex_(self->_entries, v14, 0);
      --v7;

    }
    while (v7 > self->_entryLimit);

  }
}

- (id)cloneFileDescriptor:(int)a3 filename:(id)a4 error:(id *)a5
{
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  id v25;
  char v26;
  const char *v27;
  uint64_t v28;
  id *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int *v34;
  char *v35;
  int *v36;
  const char *v37;
  const char *v39;
  id v41;

  v9 = a4;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = -10;
  while (1)
  {
    if (v9)
    {
      v14 = v10;
      v10 = v9;
    }
    else
    {
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v7, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v17;
    }

    objc_msgSend_URLByAppendingPathComponent_(self->_cacheDirectory, v18, (uint64_t)v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (const char *)objc_msgSend_fileSystemRepresentation(v19, v20, v21);
    if (!fclonefileat(a3, -1, v22, 0))
      break;
    if (*__error() != 17)
    {
      v32 = (void *)MEMORY[0x1E0C94FF8];
      v33 = *MEMORY[0x1E0C94B20];
      v34 = __error();
      v35 = strerror(*v34);
      v36 = __error();
      objc_msgSend_errorWithDomain_code_format_(v32, v37, v33, 1017, CFSTR("could not clone file: %s (errno=%d)"), v35, *v36);
      v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v29 = a5;

      v19 = 0;
LABEL_18:
      if (!v29)
        goto LABEL_22;
      goto LABEL_19;
    }
    if (v9)
    {
      unlink(v22);
      v11 = 1;
    }
    v12 = v19;
    if (__CFADD__(v13++, 1))
    {
      v25 = 0;
      goto LABEL_17;
    }
  }
  v41 = 0;
  v26 = objc_msgSend_CKMarkFilePurgeable_(v19, v23, (uint64_t)&v41);
  v25 = v41;
  if ((v26 & 1) != 0)
  {
    v29 = a5;
    if ((v11 & 1) == 0)
    {
      objc_msgSend_addObject_(self->_entries, v27, (uint64_t)v10);
      objc_msgSend_prune(self, v30, v31);
      if (!a5)
        goto LABEL_22;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v39 = (const char *)objc_msgSend_fileSystemRepresentation(v19, v27, v28);
  unlink(v39);

  v19 = 0;
  v29 = a5;
  if (!a5)
    goto LABEL_22;
LABEL_19:
  if (!v19 && v25)
    *v29 = objc_retainAutorelease(v25);
LABEL_22:

  return v19;
}

- (id)filenameForMMCSItem:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;

  v3 = a3;
  objc_msgSend_recordID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordKey(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendString_(v13, v14, (uint64_t)v9);
  objc_msgSend_appendString_(v13, v15, (uint64_t)CFSTR("_"));
  objc_msgSend_appendString_(v13, v16, (uint64_t)v12);
  objc_msgSend_asset(v3, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  if (v19)
  {
    v23 = objc_msgSend_arrayIndex(v19, v20, v21);
    if (v23 != -1)
      objc_msgSend_appendFormat_(v13, v20, (uint64_t)CFSTR("_a:%ld"), v23);
  }
  if (objc_msgSend_isPackageManifest(v3, v20, v21))
    objc_msgSend_appendString_(v13, v24, (uint64_t)CFSTR("_m"));
  v26 = objc_msgSend_packageIndex(v3, v24, v25);
  if (v26 != -1)
    objc_msgSend_appendFormat_(v13, v27, (uint64_t)CFSTR("_p:%ld"), v26);
  v29 = objc_msgSend_length(v13, v27, v28);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v13, v30, (uint64_t)CFSTR("/"), CFSTR("__"), 2, 0, v29);

  return v13;
}

- (id)cloneMMCSItem:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  id v26;

  v6 = a3;
  objc_msgSend_fileHandle(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = v9;
    v13 = 0;
    v14 = objc_msgSend_fileDescriptor(v9, v10, v11);
    goto LABEL_5;
  }
  v26 = 0;
  objc_msgSend_openWithError_(v6, v10, (uint64_t)&v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v26;
  objc_msgSend_fileHandle(v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v14 = objc_msgSend_fileDescriptor(v12, v19, v20);
LABEL_5:
    v21 = v14;
    objc_msgSend_filenameForMMCSItem_(self, v15, (uint64_t)v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloneFileDescriptor_filename_error_(self, v23, v21, v22, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_9;
    goto LABEL_6;
  }
  v24 = 0;
  if (!a4)
    goto LABEL_9;
LABEL_6:
  if (!v24 && v13)
    *a4 = objc_retainAutorelease(v13);
LABEL_9:

  return v24;
}

- (unint64_t)entryCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_entries, a2, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
}

@end
