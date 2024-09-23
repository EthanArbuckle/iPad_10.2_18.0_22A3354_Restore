@implementation DiskImageGraphNodeNative

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DiskImageGraphNodeNative;
  if (objc_msgSendSuper2(&v10, sel_validateWithDictionary_error_, v6, a4))
  {
    v7 = 0;
    if (objc_msgSend(v6, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("FilePath"), objc_opt_class(), 0, a4))
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Validation failed, input contains unexpected data."));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v8, a4);

      }
      else
      {
        v7 = 1;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSURL *v14;
  NSURL *filePath;
  void *v16;
  DiskImageGraphNodeNative *v17;
  DiskImageGraphNodeNative *v18;
  objc_super v20;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (+[DiskImageGraphNodeNative validateWithDictionary:error:](DiskImageGraphNodeNative, "validateWithDictionary:error:", v10, a6))
  {
    v20.receiver = self;
    v20.super_class = (Class)DiskImageGraphNodeNative;
    self = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:](&v20, sel_initWithDictionary_updateChangesToDict_workDir_error_, v10, v8, v11, a6);
    if (!self)
      goto LABEL_4;
    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v10, "objectForKey:", CFSTR("FilePath"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:relativeToURL:", v13, v11);
    v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
    filePath = self->_filePath;
    self->_filePath = v14;

    -[DiskImageGraphNodeNative filePath](self, "filePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v16, "checkResourceIsReachableAndReturnError:", a6);

    if ((v13 & 1) == 0)
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 2, CFSTR("Image referenced in the pstack is unreachable."), a6);
      v17 = (DiskImageGraphNodeNative *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_4:
      v17 = self;
      self = v17;
    }
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  DiskImageGraphNodeNative *v16;
  DiskImageGraphNodeNative *v17;
  objc_super v19;

  v8 = a8;
  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DiskImageGraphNodeNative;
  v16 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:](&v19, sel_initWithTag_UUID_parentNode_metadata_isCache_, a4, a5, a6, a7, v8);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_filePath, a3);

  return v17;
}

- (void)setFilePath:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relativeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("FilePath"));

  }
}

- (BOOL)deleteImage
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageGraphNodeNative filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v16);
  v6 = v16;

  if ((v5 & 1) == 0)
  {
    v7 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      -[DiskImageGraphNodeNative filePath](self, "filePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158466;
      v18 = 39;
      v19 = 2080;
      v20 = "-[DiskImageGraphNodeNative deleteImage]";
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      getDIOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[DiskImageGraphNodeNative filePath](self, "filePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158466;
        v18 = 39;
        v19 = 2080;
        v20 = "-[DiskImageGraphNodeNative deleteImage]";
        v21 = 2112;
        v22 = v13;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_212EB0000, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed to delete %@: %@", buf, 0x26u);

      }
    }
    *__error() = v7;
  }

  return v5;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DiskImageGraphNodeNative;
  -[DiskImageGraphNode toDictionary](&v8, sel_toDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[DiskImageGraphNodeNative filePath](self, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relativePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("FilePath"));

  return v4;
}

- (id)URL
{
  return self->_filePath;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (id)toDIShadowNode
{
  DIShadowNode *v3;
  void *v4;
  DIShadowNode *v5;

  v3 = [DIShadowNode alloc];
  -[DiskImageGraphNodeNative filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DIShadowNode initWithURL:isCache:](v3, "initWithURL:isCache:", v4, -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  char *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DiskImageGraphNodeNative filePath](self, "filePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiskImageGraph getImageInfoDictWithURL:error:](DiskImageGraph, "getImageInfoDictWithURL:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Image Format"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RAW"));

    if (v10)
    {
      v11 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v12 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        v23 = 72;
        v24 = 2080;
        v25 = "-[DiskImageGraphNodeNative(Append) validateAppendedImageWithInfo:error:]";
        v13 = (char *)_os_log_send_and_compose_impl();

        if (v13)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v13);
          free(v13);
        }
      }
      else
      {
        getDIOSLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v23 = 72;
          v24 = 2080;
          v25 = "-[DiskImageGraphNodeNative(Append) validateAppendedImageWithInfo:error:]";
          _os_log_impl(&dword_212EB0000, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Parent image is RAW, skipping shadow UUID validation on append.", buf, 0x12u);
        }

      }
      *__error() = v11;
      goto LABEL_13;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Identity Info"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Parent UUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Identity Info"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
LABEL_13:
      v14 = 1;
      goto LABEL_14;
    }
    v14 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("UUID validation failed for appended image."), a4);
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

@end
