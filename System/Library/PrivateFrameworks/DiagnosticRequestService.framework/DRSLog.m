@implementation DRSLog

- (id)_initWithLogMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "transferOwnership");
  v7 = objc_msgSend(v4, "size");

  v8 = -[DRSLog _initWithLogPath:transferOwnership:size:](self, "_initWithLogPath:transferOwnership:size:", v5, v6, v7);
  return v8;
}

- (void)_configureLogMO:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DRSLog path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPath:", v4);

  objc_msgSend(v5, "setSize:", -[DRSLog size](self, "size"));
  objc_msgSend(v5, "setTransferOwnership:", -[DRSLog transferOwnership](self, "transferOwnership"));

}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return CFSTR("DRSLogMO");
}

- (id)_initWithLogPath:(id)a3 transferOwnership:(BOOL)a4 size:(unint64_t)a5
{
  id v9;
  DRSLog *v10;
  DRSLog *v11;
  DRSLog *v12;
  objc_super v14;

  v9 = a3;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)DRSLog;
    v10 = -[DRSLog init](&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_path, a3);
      v11->_transferOwnership = a4;
      v11->_size = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_initWithLogPath:(id)a3 transferOwnership:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  DRSLog *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  if (v8)
  {
    v10 = objc_msgSend(v8, "fileSize");
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    DPLogHandle_RequestError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v9, "localizedDescription");
      v16 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v16;
      v15 = CFSTR("Unknown");
      if (v16)
        v15 = (const __CFString *)v16;
LABEL_11:
      *(_DWORD *)buf = 138543618;
      v21 = v6;
      v22 = 2114;
      v23 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogSizeError", "Failed to get size of file for %{public}@ due to error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    DPLogHandle_RequestError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v9, "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      goto LABEL_11;
    }
  }

  v11 = 0;
LABEL_13:

  if (v11)
  {
    self = (DRSLog *)-[DRSLog _initWithLogPath:transferOwnership:size:](self, "_initWithLogPath:transferOwnership:size:", v6, v4, objc_msgSend(v11, "unsignedLongLongValue"));
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isAvailableOnDisk
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSLog path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)_getSizeFromPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[DRSLog path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSLog path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v5, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;

    if (v6)
    {
      v8 = objc_msgSend(v6, "fileSize");
      if (v8)
      {
        self->_size = v8;
        v9 = 1;
LABEL_15:

        return v9;
      }
      DPLogHandle_RequestError();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        -[DRSLog path](self, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        v15 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v15;
        v14 = CFSTR("Unknown");
        if (v15)
          v14 = (const __CFString *)v15;
LABEL_13:
        *(_DWORD *)buf = 138543618;
        v19 = v11;
        v20 = 2114;
        v21 = v14;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogSizeError", "Failed to get size of file for %{public}@ due to error: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      DPLogHandle_RequestError();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        -[DRSLog path](self, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v14 = CFSTR("Unknown");
        if (v12)
          v14 = (const __CFString *)v12;
        goto LABEL_13;
      }
    }

    v9 = 0;
    goto LABEL_15;
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  DRSLog *v4;
  DRSLog *v5;
  DRSLog *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v4 = (DRSLog *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[DRSLog size](self, "size");
    if (v7 == -[DRSLog size](v6, "size"))
    {
      -[DRSLog path](self, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSLog path](v6, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = -[DRSLog transferOwnership](self, "transferOwnership");
        v11 = v10 ^ -[DRSLog transferOwnership](v6, "transferOwnership") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  unint64_t v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DRSLog path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DRSLog size](self, "size");
  v6 = -[DRSLog transferOwnership](self, "transferOwnership");
  v7 = CFSTR("Copied");
  if (v6)
    v7 = CFSTR("Transferred");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (%zuB) %@"), v4, v5, v7);

  return v8;
}

- (BOOL)_deleteOnDiskLog
{
  void *v2;
  char v3;

  -[DRSLog path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _deleteFileWithPath(v2);

  return v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[DRSLog path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)transferOwnership
{
  return self->_transferOwnership;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)fileDescription
{
  DRSProtoFileDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(DRSProtoFileDescription);
  -[DRSLog path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoFileDescription setFileName:](v3, "setFileName:", v5);

  -[DRSProtoFileDescription setLogSize:](v3, "setLogSize:", -[DRSLog size](self, "size"));
  -[DRSLog path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoFileDescription setLogType:](v3, "setLogType:", v7);

  return v3;
}

@end
