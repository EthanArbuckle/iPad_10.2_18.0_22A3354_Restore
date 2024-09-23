@implementation NSBinaryObjectStoreFile

- (void)dealloc
{
  objc_super v3;

  self->_fullMetadata = 0;
  self->_mapData = 0;

  self->_storeOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBinaryObjectStoreFile;
  -[NSBinaryObjectStoreFile dealloc](&v3, sel_dealloc);
}

- (void)clearCurrentValues
{
  uint64_t v2;

  *(_DWORD *)(a1 + 8) = 0;
  if (*(_QWORD *)(a1 + 16))
  {
    v2 = objc_msgSend(0, "copy");

    *(_QWORD *)(a1 + 16) = v2;
  }
  *(_QWORD *)(a1 + 24) = 0;
  -[NSXPCStoreServerConnectionContext setActiveStore:](a1, 0);
}

- (uint64_t)readFromFile:(_QWORD *)a3 error:
{
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  id v15;
  id v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[NSBinaryObjectStoreFile clearCurrentValues](a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", a2, 1, a3);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    if (v8 <= 0x3F)
    {

      if (a3)
      {
        v9 = objc_alloc(MEMORY[0x1E0C99D80]);
        v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB28A8];
        v13 = 259;
LABEL_11:
        *a3 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v10);

        return 0;
      }
      return 0;
    }
    if (*(_QWORD *)objc_msgSend(v7, "bytes") != 0x6174614465726F43)
    {

      if (a3)
      {
        v15 = objc_alloc(MEMORY[0x1E0C99D80]);
        v10 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB28A8];
        v13 = 134000;
        goto LABEL_11;
      }
      return 0;
    }
    if ((unint64_t)objc_msgSend(v7, "length") > 0x3F)
    {
      v53 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      if (byte_1ECD8DE1E)
      {
        v19 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_NSBinaryStoreInsecureDecodingCompatibilityOption"));
        if (v19)
          v20 = objc_msgSend(v19, "BOOLValue") ^ 1;
        else
          v20 = 1;
      }
      else
      {
        v20 = 0;
      }
      v54 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      *(int8x8_t *)&v21 = SetHostHeaderWithBigHeader((uint64_t)&v57, objc_msgSend(v7, "bytes"));
      v14 = DWORD2(v57) == 1;
      if (DWORD2(v57) == 1)
      {
        *(_DWORD *)(a1 + 8) = HIDWORD(v57);
        v22 = objc_msgSend(v7, "subdataWithRange:", v58, v21);
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v22, &v54);
        if (v54)
        {
          v41 = objc_msgSend(v54, "code");
          v55 = *MEMORY[0x1E0CB3388];
          v56 = v54;
          v42 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v43 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v41, (uint64_t)CFSTR("Keyed archiver failure"), v42);
          objc_exception_throw(v43);
        }
        v24 = (id)+[_PFRoutines plistClassesForSecureCoding]();
        if (v20)
        {
          objc_msgSend(v23, "setRequiresSecureCoding:", 1);
          objc_msgSend(v23, "_allowDecodingCyclesInSecureMode");
          v25 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSBinaryStoreSecureDecodingClasses"));
          if (v25)
          {
            v24 = (id)objc_msgSend(v24, "mutableCopy");
            objc_msgSend(v24, "unionSet:", v25);
          }
        }
        else
        {
          objc_msgSend(v23, "setRequiresSecureCoding:", 0);
        }
        objc_msgSend(v23, "setDecodingFailurePolicy:", 1);
        v30 = (void *)objc_msgSend(v23, "decodeObjectOfClasses:forKey:", v24, CFSTR("metadata"));
        if (objc_msgSend(v23, "error"))
        {
          v54 = (id)objc_msgSend(v23, "error");
          v44 = objc_msgSend(v54, "code");
          v55 = *MEMORY[0x1E0CB3388];
          v56 = v54;
          v45 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v46 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v44, (uint64_t)CFSTR("Keyed archiver failure"), v45);
          objc_exception_throw(v46);
        }
        objc_msgSend(v23, "finishDecoding");

        if (*(void **)(a1 + 16) != v30)
        {
          v31 = objc_msgSend(v30, "copy");

          *(_QWORD *)(a1 + 16) = v31;
        }
        v32 = *((_QWORD *)&v59 + 1);
        *(_QWORD *)(a1 + 24) = v60;
        v33 = objc_msgSend(v7, "subdataWithRange:", (_QWORD)v59, v32);
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v33, &v54);
        if (v54)
        {
          v47 = objc_msgSend(v54, "code");
          v55 = *MEMORY[0x1E0CB3388];
          v56 = v54;
          v48 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v49 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v47, (uint64_t)CFSTR("Keyed archiver failure"), v48);
          objc_exception_throw(v49);
        }
        v35 = (id)+[NSBinaryObjectStore _classesForPropertyValues]();
        if (v20)
        {
          objc_msgSend(v34, "setRequiresSecureCoding:", 1);
          objc_msgSend(v34, "_allowDecodingCyclesInSecureMode");
          v36 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSBinaryStoreSecureDecodingClasses"));
          if (v36)
          {
            v35 = (id)objc_msgSend(v35, "mutableCopy");
            objc_msgSend(v35, "unionSet:", v36);
          }
        }
        else
        {
          objc_msgSend(v34, "setRequiresSecureCoding:", 0);
        }
        objc_msgSend(v34, "setDecodingFailurePolicy:", 1);
        v37 = (void *)objc_msgSend(v34, "decodeObjectOfClasses:forKey:", v35, CFSTR("mapData"));
        if (objc_msgSend(v34, "error"))
        {
          v54 = (id)objc_msgSend(v34, "error");
          v50 = objc_msgSend(v54, "code");
          v55 = *MEMORY[0x1E0CB3388];
          v56 = v54;
          v51 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v52 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v50, (uint64_t)CFSTR("Keyed archiver failure"), v51);
          objc_exception_throw(v52);
        }
        objc_msgSend(v34, "finishDecoding");

        -[NSXPCStoreServerConnectionContext setActiveStore:](a1, v37);
        v29 = 0;
      }
      else if (a3)
      {
        v26 = objc_alloc(MEMORY[0x1E0C99D80]);
        v27 = (void *)objc_msgSend(v26, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v27);

      }
      else
      {
        v29 = 0;
      }
      v38 = v29;

      objc_msgSend(v53, "drain");
      v39 = 0;
      v40 = v29;
      if (a3 && v29)
        *a3 = v29;
    }
    else
    {
      if (a3)
      {
        v17 = objc_alloc(MEMORY[0x1E0C99D80]);
        v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
        *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v18);

      }
      v14 = 0;
    }

  }
  else
  {

    return 1;
  }
  return v14;
}

- (BOOL)writeMetadataToFile:(id *)a3 error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v25 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", a2);
  if (!v7)
  {
    objc_msgSend(v6, "drain");
    if (a3)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99D80]);
      v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v13);

    }
    return 0;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(v7, "readDataOfLength:", 64);
  if (*(_QWORD *)objc_msgSend(v9, "bytes") != 0x6174614465726F43)
  {
    if (a3)
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D80]);
      v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      v25 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v11);

    }
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v27 = 0u;
  v28 = 0u;
  memset(v26, 0, sizeof(v26));
  *(int8x8_t *)&v15 = SetHostHeaderWithBigHeader((uint64_t)v26, objc_msgSend(v9, "bytes"));
  if (DWORD2(v26[0]) != 1)
  {
    if (a3)
    {
      v20 = objc_alloc(MEMORY[0x1E0C99D80]);
      v21 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      v25 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v21);

    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "seekToFileOffset:", (_QWORD)v27, v15);
  v16 = objc_msgSend(v8, "readDataOfLength:", *((_QWORD *)&v27 + 1));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 512);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v17);
  objc_msgSend(v18, "encodeObject:forKey:", a1[2], CFSTR("metadata"));
  objc_msgSend(v18, "finishEncoding");

  v19 = objc_msgSend(a1, "_writeMetadataData:andMapDataData:toFile:error:", v17, v16, a2, &v25);
LABEL_14:
  v14 = v19 != 0;
  v22 = v25;
  objc_msgSend(v8, "closeFile");
  objc_msgSend(v6, "drain");
  v23 = v25;
  if (a3 && v25)
    *a3 = v25;
  return v14;
}

- (uint64_t)readMetadataFromFile:(int)a3 securely:(_QWORD *)a4 error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  id v37;
  id v38;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  char v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
LABEL_9:
    v18 = 0;
    return v18 & 1;
  }
  -[NSBinaryObjectStoreFile clearCurrentValues](a1);
  v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", a2);
  if (!v9)
  {
    objc_msgSend(v8, "drain");
    if (a4)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D80]);
      v17 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      *a4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v17);

    }
    goto LABEL_9;
  }
  v10 = v9;
  v46 = 0;
  v11 = (void *)objc_msgSend(v9, "readDataOfLength:", 64);
  v12 = objc_msgSend(v11, "length");
  if (!v12)
  {
    v15 = 0;
    v19 = 0;
    v20 = 1;
    v47 = 1;
    goto LABEL_40;
  }
  if (v12 <= 0x3F)
  {
    if (a4)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99D80]);
      v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v14);

    }
    else
    {
      v15 = 0;
    }
    v19 = 0;
    v47 = 0;
LABEL_16:
    v20 = 1;
    goto LABEL_40;
  }
  if (*(_QWORD *)objc_msgSend(v11, "bytes") != 0x6174614465726F43)
  {
    if (a4)
    {
      v21 = objc_alloc(MEMORY[0x1E0C99D80]);
      v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v22);

    }
    else
    {
      v15 = 0;
    }
    v20 = 0;
    v19 = 0;
    goto LABEL_40;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  *(int8x8_t *)&v23 = SetHostHeaderWithBigHeader((uint64_t)&v52, objc_msgSend(v11, "bytes"));
  if (DWORD2(v52) == 1)
  {
    *(_DWORD *)(a1 + 8) = HIDWORD(v52);
    v24 = v53;
    *(_QWORD *)(a1 + 24) = v55;
    objc_msgSend(v10, "seekToFileOffset:", v24, v23);
    v25 = (void *)objc_msgSend(v10, "readDataOfLength:", *((_QWORD *)&v53 + 1));
    v26 = objc_msgSend(v25, "length");
    if (v26 != *((_QWORD *)&v53 + 1))
    {
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0C99D80]);
        v33 = (void *)objc_msgSend(v32, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
        v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v33);

      }
      else
      {
        v15 = 0;
      }
      v47 = 0;
      v19 = 0;
      goto LABEL_16;
    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v25, &v46);
    if (v46)
    {
      v40 = objc_msgSend(v46, "code");
      v50 = *MEMORY[0x1E0CB3388];
      v51 = v46;
      v41 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v42 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v40, (uint64_t)CFSTR("Keyed archiver failure"), v41);
      objc_exception_throw(v42);
    }
    v28 = (id)+[_PFRoutines plistClassesForSecureCoding]();
    if (a3)
    {
      objc_msgSend(v27, "setRequiresSecureCoding:", 1);
      objc_msgSend(v27, "_allowDecodingCyclesInSecureMode");
      v29 = objc_msgSend(*(id *)(a1 + 40), "valueForKey:", CFSTR("NSBinaryStoreSecureDecodingClasses"));
      if (v29)
      {
        v28 = (id)objc_msgSend(v28, "mutableCopy");
        objc_msgSend(v28, "unionSet:", v29);
      }
    }
    else
    {
      objc_msgSend(v27, "setRequiresSecureCoding:", 0);
    }
    objc_msgSend(v27, "setDecodingFailurePolicy:", 1);
    v34 = (void *)objc_msgSend(v27, "decodeObjectOfClasses:forKey:", v28, CFSTR("metadata"));
    if (objc_msgSend(v27, "error"))
    {
      v46 = (id)objc_msgSend(v27, "error");
      v43 = objc_msgSend(v46, "code");
      v48 = *MEMORY[0x1E0CB3388];
      v49 = v46;
      v44 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v45 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C10], v43, (uint64_t)CFSTR("Keyed archiver failure"), v44);
      objc_exception_throw(v45);
    }
    objc_msgSend(v27, "finishDecoding");

    if (*(void **)(a1 + 16) == v34)
    {
      v15 = 0;
    }
    else
    {
      v35 = objc_msgSend(v34, "copy");

      v15 = 0;
      *(_QWORD *)(a1 + 16) = v35;
    }
    v19 = 1;
  }
  else
  {
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0C99D80]);
      v31 = (void *)objc_msgSend(v30, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0CB2AA0], 0);
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v31);

    }
    else
    {
      v15 = 0;
    }
    v19 = 0;
  }
  v20 = 0;
LABEL_40:
  v36 = v19 != 0;
  v37 = v15;
  objc_msgSend(v10, "closeFile");
  objc_msgSend(v8, "drain");
  v38 = v15;
  if (a4 && v15)
    *a4 = v15;
  v18 = v47;
  if (!v20)
    v18 = v36;
  return v18 & 1;
}

- (BOOL)_writeMetadataData:(id)a3 andMapDataData:(id)a4 toFile:(id)a5 error:(id *)a6
{
  id v11;
  unsigned int databaseVersion;
  unint64_t primaryKeyGeneration;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v37 = 0x6174614465726F43;
  v38 = 0x1000000;
  if (self)
    databaseVersion = self->_databaseVersion;
  else
    databaseVersion = 0;
  v44 = 0u;
  v39 = bswap32(databaseVersion);
  v40 = bswap64(objc_msgSend(a4, "length") + 64);
  v41 = bswap64(objc_msgSend(a3, "length"));
  v42 = 0x4000000000000000;
  v43 = bswap64(objc_msgSend(a4, "length"));
  if (self)
    primaryKeyGeneration = self->_primaryKeyGeneration;
  else
    primaryKeyGeneration = 0;
  v44 = bswap64(primaryKeyGeneration);
  v14 = objc_msgSend(a4, "length");
  v15 = objc_msgSend(a3, "length");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v14 + v15 + 64);
  objc_msgSend(v16, "appendBytes:length:", &v37, 64);
  objc_msgSend(v16, "appendData:", a4);
  objc_msgSend(v16, "appendData:", a3);
  v17 = -[NSDictionary valueForKey:](self->_storeOptions, "valueForKey:", CFSTR("NSPersistentStoreFileProtectionKey"));
  if (v17)
  {
    if ((objc_msgSend((id)*MEMORY[0x1E0CB2AE0], "isEqualToString:", v17) & 1) != 0)
    {
      v18 = 268435457;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AC0], "isEqualToString:", v17) & 1) != 0)
    {
      v18 = 1073741825;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AB8], "isEqualToString:", v17) & 1) != 0)
    {
      v18 = 805306369;
    }
    else if ((objc_msgSend((id)*MEMORY[0x1E0CB2AB0], "isEqualToString:", v17) & 1) != 0)
    {
      v18 = 536870913;
    }
    else
    {
      v18 = 1;
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey"), v19, v20, v21, v22, v23, v24, (uint64_t)v17);
    }
  }
  else if (BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    v18 = 1073741825;
  }
  else
  {
    v18 = 1;
  }
  v25 = objc_msgSend(v16, "writeToFile:options:error:", a5, v18, &v36);
  if ((v25 & 1) == 0)
  {
    v26 = v36;
    objc_msgSend(v36, "userInfo");
    _NSCoreDataLog(1, (uint64_t)CFSTR("Binary store: writeToFile error = %@ and userInfo = %@"), v27, v28, v29, v30, v31, v32, (uint64_t)v26);
  }

  v33 = v36;
  objc_msgSend(v11, "drain");
  if (v36)
  {
    v34 = v36;
    if (a6)
      *a6 = v36;
  }
  return v25;
}

- (_QWORD)writeToFile:(uint64_t)a3 error:
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 512);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v6);
    objc_msgSend(v7, "encodeObject:forKey:", v5[2], CFSTR("metadata"));
    objc_msgSend(v7, "finishEncoding");

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4096);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v8);
    objc_msgSend(v9, "encodeObject:forKey:", v5[4], CFSTR("mapData"));
    objc_msgSend(v9, "finishEncoding");

    v10 = objc_msgSend(v5, "_writeMetadataData:andMapDataData:toFile:error:", v6, v8, a2, a3);
    return (_QWORD *)v10;
  }
  return result;
}

@end
