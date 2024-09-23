@implementation ARArchive

- (ARArchive)init
{
  ARArchive *v2;
  uint64_t v3;
  NSMutableDictionary *dataByPath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARArchive;
  v2 = -[ARArchive init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataByPath = v2->_dataByPath;
    v2->_dataByPath = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (ARArchive)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  ARArchive *v7;
  ARArchive *v8;
  ARArchive *v9;

  v6 = a3;
  v7 = -[ARArchive init](self, "init");
  v8 = v7;
  if (v7 && !-[ARArchive _loadArchiveFromURL:error:](v7, "_loadArchiveFromURL:error:", v6, a4))
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (ARArchive)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  ARArchive *v7;
  ARArchive *v8;
  ARArchive *v9;

  v6 = a3;
  v7 = -[ARArchive init](self, "init");
  v8 = v7;
  if (v7 && !-[ARArchive _loadArchiveFromMemory:error:](v7, "_loadArchiveFromMemory:error:", v6, a4))
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (NSArray)filePaths
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_dataByPath, "allKeys");
}

- (void)addData:(id)a3 withFilename:(id)a4 extension:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a4, "stringByAppendingPathExtension:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ARArchive addData:withPath:](self, "addData:withPath:", v8, v9);

}

- (void)addData:(id)a3 withPath:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataByPath, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)dataForResource:(id)a3 withExtension:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingPathExtension:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARArchive dataForResourceAtPath:](self, "dataForResourceAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataForResourceAtPath:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dataByPath, "objectForKeyedSubscript:", a3);
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  ARArchive *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = archive_write_new();
  if (v7)
  {
    v8 = v7;
    archive_write_set_format_zip();
    v9 = objc_retainAutorelease(v6);
    objc_msgSend(v9, "fileSystemRepresentation");
    if (archive_write_open_filename())
    {
      archive_write_free();
    }
    else
    {
      v17 = -[ARArchive _writeToArchive:](self, "_writeToArchive:", v8);
      archive_write_free();
      if (v17)
      {
        LOBYTE(a4) = 1;
        goto LABEL_15;
      }
    }
    _ARLogGeneral_29();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v28 = v20;
      v29 = 2048;
      v30 = self;
      v31 = 2113;
      v32 = v21;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to write to archive at path: %{private}@.", buf, 0x20u);

    }
    if (a4)
    {
      v23 = *MEMORY[0x1E0CB3308];
      v24 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else
  {
    _ARLogGeneral_29();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v28 = v12;
      v29 = 2048;
      v30 = self;
      v31 = 2113;
      v32 = v13;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create archive at path: %{private}@.", buf, 0x20u);

    }
    if (a4)
    {
      v25 = *MEMORY[0x1E0CB2D68];
      ARKitCoreBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Unable to create archive."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      ARErrorWithCodeAndUserInfo(500, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
LABEL_15:

  return (char)a4;
}

- (id)dataRepresentation
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  objc_class *v10;
  NSObject *v11;
  int v13;
  NSObject *v14;
  __int16 v15;
  ARArchive *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = archive_write_new();
  if (!v3)
  {
    _ARLogGeneral_29();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create archive.", (uint8_t *)&v13, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  v4 = v3;
  v5 = objc_opt_new();
  archive_write_set_format_zip();
  if (archive_write_open())
  {
    archive_write_free();
    goto LABEL_8;
  }
  v8 = -[ARArchive _writeToArchive:](self, "_writeToArchive:", v4);
  archive_write_free();
  if (!v8)
  {
LABEL_8:
    _ARLogGeneral_29();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to write archive to memory", (uint8_t *)&v13, 0x16u);

    }
    goto LABEL_10;
  }
  v5 = v5;
  v9 = v5;
LABEL_12:

  return v9;
}

- (BOOL)_loadArchiveFromMemory:(id)a3 error:(id *)a4
{
  id v6;
  archive *v7;
  archive *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  ARArchive *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (!a4)
    {
LABEL_15:
      v22 = 0;
      goto LABEL_16;
    }
    v40 = *MEMORY[0x1E0CB2D68];
    ARKitCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Unable to read archive from memory."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (void **)v41;
    v17 = &v40;
LABEL_14:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    ARErrorWithCodeAndUserInfo(500, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v7 = -[ARArchive _createArchiveForReading](self, "_createArchiveForReading");
  if (!v7)
  {
    _ARLogGeneral_29();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from memory", buf, 0x16u);

    }
    if (!a4)
      goto LABEL_15;
    v34 = *MEMORY[0x1E0CB2D68];
    ARKitCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Unable to read archive from memory."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v35;
    v17 = &v34;
    goto LABEL_14;
  }
  v8 = v7;
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (archive_read_open_memory())
  {
    archive_read_free();
    _ARLogGeneral_29();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v12;
      v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from memory", buf, 0x16u);

    }
    if (!a4)
      goto LABEL_15;
    v32 = *MEMORY[0x1E0CB2D68];
    ARKitCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Unable to read archive from memory."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v33;
    v17 = &v32;
    goto LABEL_14;
  }
  v22 = -[ARArchive _readDataFromArchive:](self, "_readDataFromArchive:", v8);
  if (!v22)
  {
    _ARLogGeneral_29();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from memory", buf, 0x16u);

    }
    if (a4)
    {
      v30 = *MEMORY[0x1E0CB2D68];
      ARKitCoreBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Unable to read archive from memory."), &stru_1E6676798, CFSTR("Localizable_iOS"), v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(500, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  archive_read_free();
LABEL_16:

  return v22;
}

- (BOOL)_loadArchiveFromURL:(id)a3 error:(id *)a4
{
  id v6;
  archive *v7;
  archive *v8;
  id v9;
  int open_filename;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  uint64_t *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  ARArchive *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _ARLogGeneral_29();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      v42 = 2048;
      v43 = self;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from nil URL", buf, 0x16u);

    }
    if (!a4)
      goto LABEL_17;
    v46 = *MEMORY[0x1E0CB3308];
    v47[0] = CFSTR("NULL");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (id *)v47;
    v17 = &v46;
    goto LABEL_16;
  }
  v7 = -[ARArchive _createArchiveForReading](self, "_createArchiveForReading");
  if (!v7)
  {
    _ARLogGeneral_29();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v41 = v23;
      v42 = 2048;
      v43 = self;
      v44 = 2113;
      v45 = v24;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to read archive at path: %{private}@.", buf, 0x20u);

    }
    if (!a4)
      goto LABEL_17;
    v38 = *MEMORY[0x1E0CB3308];
    v39 = v6;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v39;
    v17 = &v38;
    goto LABEL_16;
  }
  v8 = v7;
  objc_msgSend(v6, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");
  open_filename = archive_read_open_filename();

  if (open_filename)
  {
    archive_read_free();
    _ARLogGeneral_29();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v41 = v13;
      v42 = 2048;
      v43 = self;
      v44 = 2113;
      v45 = v14;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to read archive at path: %{private}@.", buf, 0x20u);

    }
    if (!a4)
      goto LABEL_17;
    v36 = *MEMORY[0x1E0CB3308];
    v37 = v6;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v37;
    v17 = &v36;
LABEL_16:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(500, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v26 = 0;
    goto LABEL_18;
  }
  v26 = -[ARArchive _readDataFromArchive:](self, "_readDataFromArchive:", v8);
  if (!v26)
  {
    _ARLogGeneral_29();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v41 = v30;
      v42 = 2048;
      v43 = self;
      v44 = 2113;
      v45 = v31;
      _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to read archive at path: %{private}@.", buf, 0x20u);

    }
    if (a4)
    {
      v34[0] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), archive_error_string());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = *MEMORY[0x1E0CB3308];
      v35[0] = v32;
      v35[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(500, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  archive_read_free();
LABEL_18:

  return v26;
}

- (BOOL)_writeToArchive:(archive *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  NSMutableDictionary *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_dataByPath;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataByPath, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        archive_entry_new();
        objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
        archive_entry_set_pathname();
        objc_msgSend(v9, "length");
        archive_entry_set_size();
        archive_entry_set_filetype();
        archive_entry_set_perm();
        time(0);
        archive_entry_set_birthtime();
        archive_entry_set_ctime();
        archive_entry_set_mtime();
        archive_entry_set_atime();
        if (archive_write_header())
        {
          archive_entry_free();
LABEL_13:

          v13 = 0;
          goto LABEL_14;
        }
        v10 = objc_retainAutorelease(v9);
        objc_msgSend(v10, "bytes");
        objc_msgSend(v10, "length");
        v11 = archive_write_data();
        v12 = objc_msgSend(v10, "length");
        archive_entry_free();
        if (v11 != v12)
          goto LABEL_13;

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v13 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1;
  }
LABEL_14:

  return v13;
}

- (archive)_createArchiveForReading
{
  archive *v2;

  v2 = (archive *)archive_read_new();
  if (v2)
  {
    archive_read_support_format_zip();
    archive_read_support_filter_compress();
  }
  return v2;
}

- (BOOL)_readDataFromArchive:(archive *)a3
{
  unsigned int next_header;

  while (1)
  {
    next_header = archive_read_next_header();
    if (next_header)
      break;
    if (archive_entry_filetype() == 0x8000
      && -[ARArchive _readDataForEntry:archive:](self, "_readDataForEntry:archive:", 0, a3))
    {
      next_header = 1;
      return next_header < 2;
    }
  }
  return next_header < 2;
}

- (BOOL)_readDataForEntry:(archive_entry *)a3 archive:(archive *)a4
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t data;
  objc_class *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v4 = ((uint64_t (*)(ARArchive *, SEL, archive_entry *, archive *))MEMORY[0x1E0C80A78])(self, a2, a3, a4);
  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _ARLogGeneral_29();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2048;
    v20 = v4;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to construct path", buf, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  data = archive_read_data();
  if (data >= 1)
  {
    do
    {
      -[NSObject appendBytes:length:](v6, "appendBytes:length:", buf, data);
      data = archive_read_data();
    }
    while (data > 0);
  }
  if (data < 0)
  {
    _ARLogGeneral_29();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v4;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not read data to buffer.", (uint8_t *)&v13, 0x16u);

    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(v4 + 8), "setObject:forKeyedSubscript:", v6, v5);
LABEL_11:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataByPath, 0);
}

@end
