@implementation DIAttachParams

- (DIAttachParams)initWithCoder:(id)a3
{
  id v4;
  DIAttachParams *v5;
  uint64_t v6;
  DIStatFS *inputStatFS;
  uint64_t v8;
  NSString *inputMountedFrom;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAttachParams;
  v5 = -[DIBaseParams initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_autoMount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoMount"));
    v5->_commandSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("commandSize"));
    v5->_regEntryID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("regEntryID"));
    v5->_handleRefCount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("handleRefCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputStatFS"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputStatFS = v5->_inputStatFS;
    v5->_inputStatFS = (DIStatFS *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputMountedFrom"));
    v8 = objc_claimAutoreleasedReturnValue();
    inputMountedFrom = v5->_inputMountedFrom;
    v5->_inputMountedFrom = (NSString *)v8;

    v5->_fileMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fileMode"));
    v5->_onDiskCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onDiskCache"));
    v5->_uniqueDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("uniqueDevice"));
    v5->_emulateExternalDisk = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emulateExternalDisk"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIAttachParams;
  -[DIBaseParams encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams autoMount](self, "autoMount"), CFSTR("autoMount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams commandSize](self, "commandSize"), CFSTR("commandSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIAttachParams regEntryID](self, "regEntryID"), CFSTR("regEntryID"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams handleRefCount](self, "handleRefCount"), CFSTR("handleRefCount"));
  -[DIAttachParams inputStatFS](self, "inputStatFS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputStatFS"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams fileMode](self, "fileMode"), CFSTR("fileMode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams onDiskCache](self, "onDiskCache"), CFSTR("onDiskCache"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams uniqueDevice](self, "uniqueDevice"), CFSTR("uniqueDevice"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams emulateExternalDisk](self, "emulateExternalDisk"), CFSTR("emulateExternalDisk"));

}

- (void)setupDefaults
{
  NSURL *customCacheURL;

  self->_fileMode = 1;
  self->_autoMount = !-[DIBaseParams RAMdisk](self, "RAMdisk");
  self->_onDiskCache = 0;
  customCacheURL = self->_customCacheURL;
  self->_customCacheURL = 0;

}

- (void)setCustomCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_customCacheURL, a3);
  self->_onDiskCache = a3 != 0;
}

- (void)setOnDiskCache:(BOOL)a3
{
  NSURL *customCacheURL;

  self->_onDiskCache = a3;
  if (!a3)
  {
    customCacheURL = self->_customCacheURL;
    self->_customCacheURL = 0;

  }
}

- (DIAttachParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIAttachParams *v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DIAttachParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v6, v7, a4);

  return v8;
}

- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  DIAttachParams *v10;
  DIAttachParams *v11;
  DIAttachParams *v12;
  void *v13;
  char v14;
  DIAttachParams *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DIAttachParams;
  v10 = -[DIBaseParams initWithURL:error:](&v17, sel_initWithURL_error_, v8, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0, a5))
    goto LABEL_9;
  -[DIAttachParams setupDefaults](v11, "setupDefaults");
  if (!objc_msgSend(v9, "count"))
  {
LABEL_7:
    v12 = v11;
    goto LABEL_8;
  }
  if (!-[DIBaseParams isPstack](v11, "isPstack"))
  {
    -[DIBaseParams shadowChain](v11, "shadowChain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "addShadowURLs:error:", v9, a5);

    if ((v14 & 1) != 0)
      goto LABEL_7;
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Custom cache or shadow is not supported for pstack based images."), a5);
  v12 = (DIAttachParams *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v15 = v12;
LABEL_10:

  return v15;
}

- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIAttachParams *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  DIAttachParams *v14;
  objc_super v16;

  v6 = a3;
  objc_msgSend(v6, "inputURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)DIAttachParams;
  v8 = -[DIBaseParams initWithURL:error:](&v16, sel_initWithURL_error_, v7, a4);

  if (!v8)
    goto LABEL_3;
  objc_msgSend(v6, "diskImageParamsXPC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v9);

  -[DIAttachParams setupDefaults](v8, "setupDefaults");
  -[DIBaseParams shadowChain](v8, "shadowChain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shadowChain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "addShadowNodes:error:", v12, a4);

  if ((v13 & 1) == 0)
    v14 = 0;
  else
LABEL_3:
    v14 = v8;

  return v14;
}

- (BOOL)shouldValidateShadows
{
  void *v2;
  char v3;

  -[DIBaseParams shadowChain](self, "shadowChain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldValidate");

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DIBaseParams shadowChain](self, "shadowChain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldValidate:", v3);

}

- (BOOL)reOpenIfWritableWithError:(id *)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  char v10;
  char v11;
  unint64_t *v12;
  unint64_t v13;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  int64_t v24;
  void *v25;
  char v26;
  PluginBackendXPC *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  int v33;
  NSObject *v34;
  void *v35;
  char *v36;
  char *v37;
  NSObject *v38;
  void *v39;
  char *v40;
  void *v41;
  void *v42;
  uint8_t *v43;
  uint64_t v44;
  uint8_t buf[8];
  _BYTE v46[10];
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[DIBaseParams inputURL](self, "inputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFileURL"))
  {

  }
  else
  {
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return 1;
  }
  -[DIBaseParams shadowChain](self, "shadowChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeShadowURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[DIBaseParams backend](self, "backend");
    v10 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)buf + 48))(*(_QWORD *)buf);
    v11 = v10;
    if (!*(_QWORD *)v46)
      goto LABEL_9;
    v12 = (unint64_t *)(*(_QWORD *)v46 + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v46 + 16))(*(_QWORD *)v46);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v46);
      if ((v11 & 1) != 0)
        return 1;
    }
    else
    {
LABEL_9:
      if ((v10 & 1) != 0)
        return 1;
    }
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isWritableFormat");

    v18 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v19 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      v20 = "NO";
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 44;
      *(_QWORD *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
      *(_WORD *)v46 = 2080;
      if (v17)
        v20 = "YES";
      v47 = 2080;
      v48 = v20;
      LODWORD(v44) = 28;
      v43 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v21);
        free(v21);
      }
    }
    else
    {
      getDIOSLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = "NO";
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 44;
        *(_QWORD *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
        *(_WORD *)v46 = 2080;
        if (v17)
          v23 = "YES";
        v47 = 2080;
        v48 = v23;
        _os_log_impl(&dword_212EB0000, v22, OS_LOG_TYPE_DEFAULT, "%.*s: isWritableFormat: %s", buf, 0x1Cu);
      }

    }
    *__error() = v18;
    v24 = -[DIAttachParams fileMode](self, "fileMode");
    if ((v17 & 1) != 0)
    {
      if (v24 != 2)
      {
        -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) != 0)
        {
          v27 = [PluginBackendXPC alloc];
          -[DIBaseParams inputURL](self, "inputURL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[PluginBackendXPC initWithURL:openMode:](v27, "initWithURL:openMode:", v28, 2);

          v30 = (void *)v29;
        }
        else
        {
          -[DIBaseParams inputURL](self, "inputURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:](BackendXPC, "newFileBackendWithURL:fileOpenFlags:error:", v31, 2, a3);

          v30 = v32;
          if (!v32)
            return 0;
        }
        v33 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v34 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          -[DIBaseParams inputURL](self, "inputURL", v43, v44);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "path");
          v36 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158211;
          *(_DWORD *)&buf[4] = 44;
          *(_WORD *)v46 = 2080;
          *(_QWORD *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
          v47 = 2113;
          v48 = v36;
          v37 = (char *)_os_log_send_and_compose_impl();

          if (v37)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v37);
            free(v37);
          }
        }
        else
        {
          getDIOSLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            -[DIBaseParams inputURL](self, "inputURL");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "path");
            v40 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            *(_DWORD *)&buf[4] = 44;
            *(_WORD *)v46 = 2080;
            *(_QWORD *)&v46[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
            v47 = 2113;
            v48 = v40;
            _os_log_impl(&dword_212EB0000, v38, OS_LOG_TYPE_DEFAULT, "%.*s: Image %{private}@ re-opened with RW permissions", buf, 0x1Cu);

          }
        }
        *__error() = v33;
        -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "backendXPC");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "replaceWithBackendXPC:", v30);

      }
    }
    else if (v24 == 4)
    {
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Image has a read-only format, attach failed due to force RW flag"), a3);
    }
  }
  return 1;
}

- (BOOL)updateStatFSWithError:(id *)a3
{
  void *v5;
  int v6;
  uint64_t fd_from_backend;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  DIStatFS *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;

  -[DIBaseParams inputURL](self, "inputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFileURL");

  if (v6)
  {
    -[DIBaseParams backend](self, "backend");
    get_sink_backend((uint64_t)&v23, &v25);
    fd_from_backend = get_fd_from_backend((uint64_t)&v25);
    v8 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = v24;
    if (!v24)
      goto LABEL_11;
    v12 = (unint64_t *)&v24->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
      if ((fd_from_backend & 0x80000000) == 0)
        goto LABEL_12;
    }
    else
    {
LABEL_11:
      if ((fd_from_backend & 0x80000000) == 0)
      {
LABEL_12:
        v14 = -[DIStatFS initWithFileDescriptor:error:]([DIStatFS alloc], "initWithFileDescriptor:error:", fd_from_backend, a3);
        -[DIAttachParams setInputStatFS:](self, "setInputStatFS:", v14);

        -[DIAttachParams inputStatFS](self, "inputStatFS");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          return 0;
        -[DIAttachParams inputStatFS](self, "inputStatFS");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logWithHeader:", CFSTR("Input underlying FS"));

        goto LABEL_14;
      }
    }
    return +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Unexpected backend type for file"), a3);
  }
LABEL_14:
  -[DIBaseParams shadowChain](self, "shadowChain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEmpty");

  if ((v18 & 1) != 0)
    return 1;
  -[DIBaseParams shadowChain](self, "shadowChain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "statWithError:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v21 != 0;

  return v19;
}

- (id)newAttachWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  DIShadowNode *v11;
  void *v12;
  DIShadowNode *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  DIClient2Controller_XPCHandler *v19;
  int v20;
  NSObject *v21;
  char *v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  BOOL v26;
  void *v27;
  char v28;
  uint64_t v29;
  QuarantineFileHandler *v30;
  void *v31;
  QuarantineFileHandler *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t *v37;
  uint64_t v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  DIAttachParams *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  if (!-[DIBaseParams isPstack](self, "isPstack"))
  {
    -[DIBaseParams shadowChain](self, "shadowChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasBaseImageCache");

    if (v6)
    {
      -[DIBaseParams shadowChain](self, "shadowChain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

    }
  }
  if (!-[DIBaseParams isPstack](self, "isPstack") || !-[DIAttachParams onDiskCache](self, "onDiskCache"))
  {
    -[DIAttachParams customCacheURL](self, "customCacheURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [DIShadowNode alloc];
      -[DIAttachParams customCacheURL](self, "customCacheURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[DIShadowNode initWithURL:isCache:](v11, "initWithURL:isCache:", v12, 1);

      -[DIBaseParams shadowChain](self, "shadowChain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "verifyNodes:error:", v15, a3);

      if ((v16 & 1) == 0)
      {

        return 0;
      }
      -[DIBaseParams shadowChain](self, "shadowChain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "nodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertObject:atIndex:", v13, 0);

    }
    v19 = objc_alloc_init(DIClient2Controller_XPCHandler);
    v20 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      v40 = 37;
      v41 = 2080;
      v42 = "-[DIAttachParams newAttachWithError:]";
      v43 = 2114;
      v44 = self;
      LODWORD(v38) = 28;
      v37 = buf;
      v22 = (char *)_os_log_send_and_compose_impl();

      if (v22)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v22);
        free(v22);
      }
    }
    else
    {
      getDIOSLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v40 = 37;
        v41 = 2080;
        v42 = "-[DIAttachParams newAttachWithError:]";
        v43 = 2114;
        v44 = self;
        _os_log_impl(&dword_212EB0000, v23, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v20;
    if (-[DIBaseParams RAMdisk](self, "RAMdisk") && -[DIAttachParams fileMode](self, "fileMode") == 2)
    {
      v24 = CFSTR("Cannot attach RAM disk as a read-only device");
    }
    else
    {
      -[DIBaseParams shadowChain](self, "shadowChain", v37, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isEmpty") & 1) != 0)
      {

      }
      else
      {
        v26 = -[DIBaseParams rawBlockSize](self, "rawBlockSize") == 512;

        if (!v26)
        {
          v24 = CFSTR("The image has a 4KB block size, shadow and cache files are not supported");
          goto LABEL_41;
        }
      }
      if (!-[DIBaseParams RAMdisk](self, "RAMdisk")
        || (-[DIBaseParams shadowChain](self, "shadowChain"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "isEmpty"),
            v27,
            (v28 & 1) != 0))
      {
        if (!-[DIBaseParams requiresRootDaemon](self, "requiresRootDaemon"))
        {
          if (-[DIClient2Controller_XPCHandler connectWithError:](v19, "connectWithError:", a3)
            && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v19, -[DIAttachParams fileMode](self, "fileMode"), a3)&& -[DIAttachParams reOpenIfWritableWithError:](self, "reOpenIfWritableWithError:", a3)&& -[DIAttachParams updateStatFSWithError:](self, "updateStatFSWithError:", a3))
          {
            v30 = [QuarantineFileHandler alloc];
            -[DIBaseParams inputURL](self, "inputURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[QuarantineFileHandler initWithURL:error:](v30, "initWithURL:error:", v31, a3);

            if (v32)
            {
              if (-[DIAttachParams handleRefCount](self, "handleRefCount")
                && -[DIAttachParams uniqueDevice](self, "uniqueDevice"))
              {
                objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setInstanceID:", v33);

              }
              v9 = -[DIClient2Controller_XPCHandler newAttachWithParams:error:](v19, "newAttachWithParams:error:", self, a3);
              if (v9 && -[QuarantineFileHandler isQuarantined](v32, "isQuarantined"))
              {
                objc_msgSend(v9, "BSDName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[QuarantineFileHandler applyMountPointsWithBSDName:error:](v32, "applyMountPointsWithBSDName:error:", v35, 0);

              }
            }
            else
            {
              v9 = 0;
            }

          }
          else
          {
            v9 = 0;
          }
          goto LABEL_43;
        }
        +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Sparsebundles on SMB mounts are not supported on this system"), a3);
        v29 = objc_claimAutoreleasedReturnValue();
LABEL_42:
        v9 = (id)v29;
LABEL_43:

        return v9;
      }
      v24 = CFSTR("Cannot attach RAM disk with a shadow or a cache file");
    }
LABEL_41:
    +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, v24, a3, v37);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Cache is not supported when using pstack."), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  BOOL v12;
  BOOL v13;

  v9 = a3;
  objc_msgSend(v9, "description");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  if (!v11 || !*v11)
  {
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Failed converting URL to UTF8"), a6);
LABEL_7:
    v12 = v13;
    goto LABEL_8;
  }
  if (strlcpy(a4, v11, a5) >= a5)
  {
    v13 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Disk image URL is too long"), a6);
    goto LABEL_7;
  }
  v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)autoMount
{
  return self->_autoMount;
}

- (void)setAutoMount:(BOOL)a3
{
  self->_autoMount = a3;
}

- (int64_t)fileMode
{
  return self->_fileMode;
}

- (void)setFileMode:(int64_t)a3
{
  self->_fileMode = a3;
}

- (BOOL)onDiskCache
{
  return self->_onDiskCache;
}

- (NSURL)customCacheURL
{
  return self->_customCacheURL;
}

- (BOOL)uniqueDevice
{
  return self->_uniqueDevice;
}

- (void)setUniqueDevice:(BOOL)a3
{
  self->_uniqueDevice = a3;
}

- (unint64_t)commandSize
{
  return self->_commandSize;
}

- (void)setCommandSize:(unint64_t)a3
{
  self->_commandSize = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (void)setRegEntryID:(unint64_t)a3
{
  self->_regEntryID = a3;
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIStatFS)inputStatFS
{
  return self->_inputStatFS;
}

- (void)setInputStatFS:(id)a3
{
  objc_storeStrong((id *)&self->_inputStatFS, a3);
}

- (NSString)inputMountedFrom
{
  return self->_inputMountedFrom;
}

- (void)setInputMountedFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)emulateExternalDisk
{
  return self->_emulateExternalDisk;
}

- (void)setEmulateExternalDisk:(BOOL)a3
{
  self->_emulateExternalDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMountedFrom, 0);
  objc_storeStrong((id *)&self->_inputStatFS, 0);
  objc_storeStrong((id *)&self->_customCacheURL, 0);
}

- (id)toDI1ParamsWithError:(id *)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
