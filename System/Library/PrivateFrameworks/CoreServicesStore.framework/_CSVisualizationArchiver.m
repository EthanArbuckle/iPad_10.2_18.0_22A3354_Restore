@implementation _CSVisualizationArchiver

- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 allowCompression:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v14;
  _CSVisualizationArchiver *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  CSStore2 *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  CSStore2 *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  gzFile v33;
  gzFile_s *v34;
  FILE *v35;
  int v36;
  uint64_t v37;
  void *v38;
  CSStore2 *v39;
  NSObject *v40;
  char *v41;
  const char *v42;
  uint8_t *v43;
  NSObject *v44;
  uint32_t v45;
  void *v46;
  void *v47;
  CSStore2 *v48;
  NSObject *v49;
  void *v50;
  CSStore2 *v51;
  char v52;
  char *v53;
  BOOL v54;
  BOOL v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  BOOL v60;
  int v62;
  int *v63;
  char *v64;
  int v65;
  int *v66;
  char *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _BYTE buf[18];
  __int16 v78;
  char *v79;
  __int128 v80;
  const __CFString *v81;
  const __CFString *v82;
  char __str[8];
  uint64_t v84;
  uint64_t v85;

  v9 = a5;
  v85 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v74.receiver = self;
  v74.super_class = (Class)_CSVisualizationArchiver;
  v15 = -[_CSVisualizationArchiver init](&v74, sel_init);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("CSVisualizationArchiver.mm"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visualizer != nil"));

  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("CSVisualizationArchiver.mm"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileHandle != NULL"));

  }
  if (!v15)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v75[0] = *MEMORY[0x1E0CB2938];
    v75[1] = CFSTR("Line");
    v76[0] = CFSTR("ENOMEM");
    v76[1] = &unk_1E4E24E90;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_storeStrong((id *)&v15->_visualizer, a3);
  *(_QWORD *)__str = 0;
  v84 = 0;
  v16 = getenv("CS_VISUALIZATION_COMPRESSION_LEVEL");
  if (v16)
  {
    v17 = strtoul(v16, 0, 0);
    v18 = 9;
    if (v17 < 9)
      v18 = v17;
  }
  else
  {
    v18 = 6;
  }
  snprintf(__str, 0x10uLL, "%cb%lu", 119, v18);
  v22 = (CSStore2 *)fileno(a4);
  if ((v22 & 0x80000000) != 0)
  {
    CSStore2::GetLog(v22);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a4;
      _os_log_impl(&dword_1A4E5A000, v30, OS_LOG_TYPE_INFO, "File handle %p passed to _CSVisualization[Un]Archiver is not backed by a file descriptor. Will not compress/decompress.", buf, 0xCu);
    }

    v27 = 0;
    if (a4)
      goto LABEL_48;
LABEL_23:
    v31 = objc_retainAutorelease(v27);
    a4 = 0;
    v27 = v31;
    goto LABEL_49;
  }
  v23 = (int)v22;
  if (a6)
  {
    v23 = dup((int)v22);
    if (v23 < 0)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *__error();
      *(_QWORD *)&v80 = *MEMORY[0x1E0CB2938];
      *((_QWORD *)&v80 + 1) = CFSTR("Line");
      v81 = CFSTR("errno");
      v82 = (const __CFString *)&unk_1E4E24ED8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CSStore2::GetLog(v28);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v62 = *__error();
        v63 = __error();
        v64 = strerror(*v63);
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "writing";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v62;
        v78 = 2080;
        v79 = v64;
        _os_log_error_impl(&dword_1A4E5A000, v29, OS_LOG_TYPE_ERROR, "Error duplicating file descriptor for %{public}s: %i (%s)", buf, 0x1Cu);
      }

      goto LABEL_39;
    }
  }
  else
  {
    CSStore2::GetLog(v22);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a4;
      _os_log_impl(&dword_1A4E5A000, v32, OS_LOG_TYPE_INFO, "Disabling compression for file handle %p passed to _CSVisualization[Un]Archiver. Will not compress/decompress.", buf, 0xCu);
    }

    if (a4)
    {
      v31 = 0;
      v27 = 0;
      goto LABEL_49;
    }
  }
  *__error() = 0;
  v33 = gzdopen(v23, __str);
  v34 = v33;
  if (!v33)
  {
    v36 = *__error();
    v70 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2FE0];
    if (v36)
    {
      *(_QWORD *)&v80 = *MEMORY[0x1E0CB2938];
      *((_QWORD *)&v80 + 1) = CFSTR("Line");
      v81 = CFSTR("errnum");
      v82 = (const __CFString *)&unk_1E4E24F08;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "errorWithDomain:code:userInfo:", v37, v36, v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CSStore2::GetLog(v39);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = strerror(v36);
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "writing";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        v78 = 2080;
        v79 = v41;
        v42 = "Error opening file handle for %{public}s with gzdopen(): %i (%s)";
        v43 = buf;
        v44 = v40;
        v45 = 28;
LABEL_67:
        _os_log_error_impl(&dword_1A4E5A000, v44, OS_LOG_TYPE_ERROR, v42, v43, v45);
      }
    }
    else
    {
      v81 = (const __CFString *)*MEMORY[0x1E0CB2938];
      v82 = CFSTR("Line");
      *(_QWORD *)buf = CFSTR("ENOMEM");
      *(_QWORD *)&buf[8] = &unk_1E4E24F20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v81, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "errorWithDomain:code:userInfo:", v37, 12, v50);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CSStore2::GetLog(v51);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v80) = 136446210;
        *(_QWORD *)((char *)&v80 + 4) = "writing";
        v42 = "Unknown error opening file handle for %{public}s with gzdopen()";
        v43 = (uint8_t *)&v80;
        v44 = v40;
        v45 = 12;
        goto LABEL_67;
      }
    }

    close(v23);
    goto LABEL_39;
  }
  v35 = funopen(v33, (int (__cdecl *)(void *, char *, int))CSStore2::readFromGzipFile, (int (__cdecl *)(void *, const char *, int))CSStore2::writeToGzipFile, 0, (int (__cdecl *)(void *))CSStore2::closeGzipFile);
  if (v35)
  {
    v27 = 0;
    goto LABEL_40;
  }
  v46 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)&v80 = *MEMORY[0x1E0CB2938];
  *((_QWORD *)&v80 + 1) = CFSTR("Line");
  v81 = CFSTR("ENOMEM");
  v82 = (const __CFString *)&unk_1E4E24EF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, v47);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CSStore2::GetLog(v48);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    v65 = *__error();
    v66 = __error();
    v67 = strerror(*v66);
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "writing";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v65;
    v78 = 2080;
    v79 = v67;
    _os_log_error_impl(&dword_1A4E5A000, v49, OS_LOG_TYPE_ERROR, "Error funopening file handle for %{public}s: %i (%s)", buf, 0x1Cu);
  }

  gzclose(v34);
LABEL_39:
  v35 = 0;
LABEL_40:
  v52 = v35 != a4 || v9;
  if (v35 == a4 || !v9)
  {
    LOBYTE(v9) = v52;
  }
  else
  {
    fclose(a4);
    LOBYTE(v9) = 1;
  }
  a4 = v35;
  if (!v35)
    goto LABEL_23;
LABEL_48:
  v31 = 0;
LABEL_49:

  v21 = v31;
  v15->_fileHandle = a4;
  v15->_closeWhenDone = v9;
  if (a4)
  {
    v53 = getenv("CS_VISUALIZATION_OUTPUT_XML");
    if (v53)
      v54 = strtol(v53, 0, 0) != 0;
    else
      v54 = 0;
    v15->_outputAsXML = v54;
    v15->_dictWriteLock._os_unfair_lock_opaque = 0;
    v73 = v21;
    v55 = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:](v15, "fwrite:size:numberOfItems:error:", "csviz0jg", 8, 1, &v73);
    v56 = v73;

    if (!v55)
    {

      goto LABEL_61;
    }
    v57 = -[_CSVisualizer store](v15->_visualizer, "store");
    v58 = 4294929780;
    if (!v57)
      v58 = 0;
    *(_QWORD *)buf = v58;
    v72 = v56;
    v59 = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:](v15, "fwrite:size:numberOfItems:error:", buf, 8, 1, &v72);
    v21 = v72;

    if (v59)
    {
      fflush(v15->_fileHandle);
      v71 = v21;
      v60 = -[_CSVisualizationArchiver writeMetadata:forStore:error:](v15, "writeMetadata:forStore:error:", 0, objc_msgSend(v14, "store"), &v71);
      v56 = v71;

      if (v60)
      {
        v21 = v56;
        goto LABEL_63;
      }

LABEL_61:
      v21 = v56;
      if (!a7)
        goto LABEL_62;
      goto LABEL_12;
    }

  }
  else
  {

  }
LABEL_11:
  if (!a7)
  {
LABEL_62:
    v15 = 0;
    goto LABEL_63;
  }
LABEL_12:
  v21 = objc_retainAutorelease(v21);
  v15 = 0;
  *a7 = v21;
LABEL_63:

  return v15;
}

- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 error:(id *)a6
{
  return -[_CSVisualizationArchiver initWithVisualizer:fileHandle:closeWhenDone:allowCompression:error:](self, "initWithVisualizer:fileHandle:closeWhenDone:allowCompression:error:", a3, a4, a5, 1, a6);
}

- (void)dealloc
{
  FILE *fileHandle;
  objc_super v4;

  fileHandle = self->_fileHandle;
  if (fileHandle && self->_closeWhenDone)
    fclose(fileHandle);
  v4.receiver = self;
  v4.super_class = (Class)_CSVisualizationArchiver;
  -[_CSVisualizationArchiver dealloc](&v4, sel_dealloc);
}

- (BOOL)writeMetadata:(id)a3 forStore:(__CSStore *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  __CFBundle *BundleWithIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  char v23;
  id v25;

  v8 = a3;
  v9 = (void *)MEMORY[0x1A85AA4B4]();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("metadata"));
  if (v8)
  {
    objc_msgSend(v10, "addEntriesFromDictionary:", v8);
  }
  else
  {
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CSStore"));
    if (BundleWithIdentifier)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, (CFStringRef)*MEMORY[0x1E0C9AE90]), CFSTR("framework-version"));
    v12 = (void *)_CFCopySystemVersionDictionary();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB98]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("os"));

      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C9ABB0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("os-version"));

      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("os-build"));

    }
    if (a4)
      v17 = -37516;
    else
      v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CSStoreGetUnitCount((uint64_t)a4, v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("tableCount"));

    -[_CSVisualizationArchiver visualizer](self, "visualizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "breakDownUsage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("breakdown"));

  }
  v25 = 0;
  v21 = -[_CSVisualizationArchiver writeDictionary:error:](self, "writeDictionary:error:", v10, &v25);
  v22 = v25;

  objc_autoreleasePoolPop(v9);
  if (a5)
    v23 = v21;
  else
    v23 = 1;
  if ((v23 & 1) == 0)
    *a5 = objc_retainAutorelease(v22);

  return v21;
}

- (BOOL)writeDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSStore2 *v12;
  NSObject *v13;
  os_unfair_lock_s *p_dictWriteLock;
  _BOOL4 v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v21;
  id v22;
  CSStore2 *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  CSStore2 *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = (void *)MEMORY[0x1A85AA4B4]();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  v10 = v9;
  if (self->_outputAsXML)
    objc_msgSend(v9, "setOutputFormat:", 100);
  objc_msgSend(v10, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v10, "finishEncoding");
  objc_msgSend(v10, "encodedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  if (!v11)
  {
    v16 = 0;
    v19 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v12 = (CSStore2 *)objc_msgSend(v11, "length");
  v23 = v12;
  CSStore2::GetLog(v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v25 = 8;
    v26 = 2048;
    v27 = v12;
    _os_log_debug_impl(&dword_1A4E5A000, v13, OS_LOG_TYPE_DEBUG, "Writing %llu+%llu bytes to gzip stream", buf, 0x16u);
  }

  p_dictWriteLock = &self->_dictWriteLock;
  os_unfair_lock_lock(&self->_dictWriteLock);
  v22 = 0;
  v15 = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:](self, "fwrite:size:numberOfItems:error:", &v23, 8, 1, &v22);
  v16 = v22;
  if (v15)
  {
    v17 = objc_retainAutorelease(v11);
    v21 = v16;
    LODWORD(v17) = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:](self, "fwrite:size:numberOfItems:error:", objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), 1, &v21);
    v18 = v21;

    if ((_DWORD)v17)
    {
      fflush(self->_fileHandle);
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    v16 = v18;
  }
  else
  {
    v19 = 0;
  }
  os_unfair_lock_unlock(p_dictWriteLock);
  if (a4)
  {
LABEL_15:
    if (!v19)
      *a4 = objc_retainAutorelease(v16);
  }
LABEL_17:

  return v19;
}

- (BOOL)fwrite:(const void *)a3 size:(unint64_t)a4 numberOfItems:(unint64_t)a5 error:(id *)a6
{
  __CFString *v7;
  size_t v9;
  __sFILE *fileHandle;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  int errnum;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;

  v7 = (__CFString *)a5;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = fwrite(a3, a4, a5, self->_fileHandle);
  fileHandle = self->_fileHandle;
  if ((__CFString *)v9 == v7 && !ferror(self->_fileHandle))
    return 1;
  v11 = (_QWORD *)MEMORY[0x1E0CB2FE0];
  if ((int (__cdecl *)(gzFile))fileHandle->_close == CSStore2::closeGzipFile)
  {
    errnum = 0;
    v16 = gzerror((gzFile)fileHandle->_cookie, &errnum);
    v17 = errnum;
    if (errnum == -1)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *__error();
      v27 = *MEMORY[0x1E0CB2938];
      v28 = CFSTR("Line");
      v29 = CFSTR("errno");
      v30 = &unk_1E4E24EA8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v27, 2);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *v11, v23, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (errnum < 2)
      {
        v15 = 0;
        goto LABEL_16;
      }
      v18 = v16;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      if (v16)
      {
        v27 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v27, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("Z"), v17, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_16;

    }
    goto LABEL_16;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *__error();
  v27 = *MEMORY[0x1E0CB2938];
  v28 = CFSTR("Line");
  v29 = CFSTR("errno");
  v30 = &unk_1E4E24EC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", *v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  if (a6)
    *a6 = objc_retainAutorelease(v15);
  if (objc_msgSend(v15, "code") == 32)
  {
    objc_msgSend(v15, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", *v11);

    if (v25)
      atomic_store(1u, (unsigned __int8 *)&self->_hadEPIPE);
  }

  return 0;
}

- (void)getWriteUnitState:(_CSWriteUnitState *)a3 forTable:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  id var3;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id var1;
  id v16;
  void *v17;
  id var2;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = *(_QWORD *)&a4;
  -[_CSVisualizationArchiver visualizer](self, "visualizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&a3->var0, v7);
  -[_CSVisualizationArchiver unitDescriptionPredicate](self, "unitDescriptionPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  var3 = a3->var3;
  a3->var3 = v8;

  objc_msgSend(v7, "functionsForTable:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke;
  v21[3] = &unk_1E4E221C0;
  v13 = v11;
  v22 = v13;
  v14 = (void *)MEMORY[0x1A85AA61C](v21);
  var1 = a3->var1;
  a3->var1 = v14;

  objc_msgSend(v10, "getDescription");
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke_2;
  v19[3] = &unk_1E4E221E8;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  v17 = (void *)MEMORY[0x1A85AA61C](v19);
  var2 = a3->var2;
  a3->var2 = v17;

}

- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4 state:(const _CSWriteUnitState *)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  id var3;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  CSStore2 *v17;
  CSStore2 *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  CSStore2 *v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1A85AA4B4](self, a2);
  (*((void (**)(void))a5->var2 + 2))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (var3 = a5->var3) == 0 || objc_msgSend(var3, "evaluateWithObject:", v10))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("u"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("t"));

    (*((void (**)(void))a5->var1 + 2))();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("s"));

    if (v10)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("d"));
    v20 = 0;
    v16 = -[_CSVisualizationArchiver writeDictionary:error:](self, "writeDictionary:error:", v12, &v20);
    v17 = (CSStore2 *)v20;
    v18 = v17;
    if (!v16)
    {
      CSStore2::GetLog(v17);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v22 = v7;
        v23 = 2048;
        v24 = v6;
        v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A4E5A000, v19, OS_LOG_TYPE_ERROR, "Failed to convert description of unit %llu in table %llu to data: %{public}@", buf, 0x20u);
      }

    }
  }

  objc_autoreleasePoolPop(v9);
}

- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = 0u;
  v8 = 0u;
  -[_CSVisualizationArchiver getWriteUnitState:forTable:](self, "getWriteUnitState:forTable:", &v7);
  -[_CSVisualizationArchiver writeUnit:inTable:state:](self, "writeUnit:inTable:state:", v5, v4, &v7);

}

- (void)writeAllUnitsInTable:(unsigned int)a3 block:(id)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  void *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD block[10];
  char v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  id v27;
  unsigned int v28;
  _CSVisualizationArchiver *v29;

  v4 = *(_QWORD *)&a3;
  v29 = self;
  v28 = a3;
  v27 = a4;
  -[_CSVisualizationArchiver visualizer](self, "visualizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "store");

  if (v8)
  {
    v9 = 4294929780;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSVisualizationArchiver.mm"), 444, CFSTR("Missing CSStore"));

    v9 = 0;
  }
  -[_CSVisualizationArchiver writeUnit:inTable:](self, "writeUnit:inTable:", v4, v9);
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3321888768;
  v23[2] = __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke;
  v23[3] = &__block_descriptor_40_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__0_e19_v32__0I8r_v12I20_24l;
  v23[4] = &v24;
  _CSStoreEnumerateUnits(v8, v4, v23);
  v21 = 0u;
  v22 = 0u;
  -[_CSVisualizationArchiver getWriteUnitState:forTable:](self, "getWriteUnitState:forTable:", &v21, v4);
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (__CFString *)_CSStoreCopyTableName(v8, v4);
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("_CSVisualizationArchiver queue for table %@"), v12);

  v14 = objc_retainAutorelease(v13);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create(v15, v16);

  v20 = 0;
  block[0] = v10;
  block[1] = 3321888768;
  block[2] = __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke_60;
  block[3] = &__block_descriptor_80_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__1_e8_v16__0Q8l;
  block[4] = &v20;
  block[5] = &v24;
  block[6] = &v29;
  block[7] = &v28;
  block[8] = &v21;
  block[9] = &v27;
  dispatch_apply((v25 - v24) >> 2, v17, block);

  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }

}

- (void)writeAllUnitsWithBlock:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  -[_CSVisualizationArchiver visualizer](self, "visualizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "store");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSVisualizationArchiver.mm"), 489, CFSTR("Missing CSStore"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51___CSVisualizationArchiver_writeAllUnitsWithBlock___block_invoke;
  v10[3] = &unk_1E4E216D0;
  v10[4] = self;
  v9 = v5;
  v11 = v9;
  _CSStoreEnumerateTables(v7, v10);

}

- (void)finishWriting
{
  FILE *fileHandle;

  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    fflush(fileHandle);
    if (self->_closeWhenDone)
      fclose(self->_fileHandle);
    self->_fileHandle = 0;
  }
}

- (void)setUnitDescriptionPredicate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_unitDescriptionPredicate, a3);
  if (v5)
  {
    v9 = CFSTR("predicate");
    objc_msgSend(v5, "predicateFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSVisualizationArchiver visualizer](self, "visualizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSVisualizationArchiver writeMetadata:forStore:error:](self, "writeMetadata:forStore:error:", v7, objc_msgSend(v8, "store"), 0);

  }
}

- (_CSVisualizer)visualizer
{
  return (_CSVisualizer *)objc_getProperty(self, a2, 40, 1);
}

- (NSPredicate)unitDescriptionPredicate
{
  return self->_unitDescriptionPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitDescriptionPredicate, 0);
  objc_storeStrong((id *)&self->_visualizer, 0);
}

+ (void)processCommandFromConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5
{
  id v8;
  uint64_t v9;
  CSStore2 *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t __ptr;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  __ptr = -1;
  if (fread(&__ptr, 8uLL, 1uLL, a4) == 1)
  {
    v9 = __ptr;
    v10 = (CSStore2 *)MEMORY[0x1A85AA4B4]();
    CSStore2::GetLog(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v15 = v9;
        _os_log_error_impl(&dword_1A4E5A000, v12, OS_LOG_TYPE_ERROR, "Unrecognized reserved value %llu received from the Mac, ignoring and closing.", buf, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E5A000, v12, OS_LOG_TYPE_DEFAULT, "Mac commanded we send a store archive", buf, 2u);
      }

      objc_msgSend(a1, "provideVisualizerToConnection:fileHandle:providerBlock:", a3, a4, v8);
    }
    objc_autoreleasePoolPop(v10);
  }

}

+ (void)provideVisualizerToConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(void);
  _QWORD block[4];
  id v11;
  void *v12;
  __sFILE *v13;

  v7 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106___CSVisualizationArchiver_CSRemoteVisualization__provideVisualizerToConnection_fileHandle_providerBlock___block_invoke;
  block[3] = &unk_1E4E216F8;
  v11 = v7;
  v12 = a3;
  v13 = a4;
  v8 = v7;
  v9 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  v9[2]();

}

+ (void)beginProvidingVisualizationArchivesWithMachServiceName:(id)a3 queue:(id)a4 creatingVisualizersWithBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CSStore2 *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CSVisualizationArchiver.mm"), 1091, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CSVisualizationArchiver.mm"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

LABEL_3:
  if (lockdownLibrary(void)::sOnce != -1)
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  if (lockdownLibrary(void)::sLib)
  {
    v13 = (CSStore2 *)dlsym((void *)lockdownLibrary(void)::sLib, "soft_lockdown_checkin_xpc");
    if (v13)
    {
      CSStore2::GetLog(v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v9;
        _os_log_debug_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_DEBUG, "Beginning remote visualization service '%{public}@'", buf, 0xCu);
      }

      v15 = objc_retainAutorelease(v9);
      v16 = objc_msgSend(v15, "UTF8String");
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __141___CSVisualizationArchiver_CSRemoteVisualization__beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock___block_invoke;
      v19[3] = &unk_1E4E21720;
      v20 = v15;
      v22 = a1;
      v21 = v12;
      softLinklockdown_checkin_xpc(v16, 0, v10, v19);

    }
  }

}

@end
