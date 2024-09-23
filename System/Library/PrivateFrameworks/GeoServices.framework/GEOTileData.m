@implementation GEOTileData

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decodedRepresentation, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)readDataWithError:(id *)a3
{
  return -[GEOTileData readDataWithOptions:error:](self, "readDataWithOptions:error:", 0, a3);
}

- (unint64_t)length
{
  if (self->_data)
    return -[NSData length](self->_data, "length");
  if (self->_fileURL)
    return self->_cachedFileSize;
  return 0;
}

- (GEOTileData)initWithData:(id)a3
{
  id v5;
  GEOTileData *v6;
  GEOTileData *v7;
  GEOTileData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileData;
  v6 = -[GEOTileData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_sandboxExtension = -1;
    v8 = v7;
  }

  return v7;
}

- (id)decodedRepresentation
{
  return self->_decodedRepresentation;
}

- (void)dealloc
{
  int fileDescriptor;
  objc_super v4;

  if (self->_sandboxExtension != -1)
    sandbox_extension_release();
  fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor >= 1 && !self->_fileHandle)
    close(fileDescriptor);
  v4.receiver = self;
  v4.super_class = (Class)GEOTileData;
  -[GEOTileData dealloc](&v4, sel_dealloc);
}

- (GEOTileData)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEOTileData *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const void *bytes_ptr;
  size_t length;
  NSObject *global_queue;
  dispatch_data_t v14;
  NSData *data;
  GEOTileData *v16;
  int v17;
  NSObject *v18;
  id v20;
  const char *string_ptr;
  void *v22;
  NSURL *v23;
  NSURL *fileURL;
  _QWORD destructor[4];
  id v26;
  objc_super v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOTileData;
  v6 = -[GEOTileData init](&v27, sel_init);
  if (v6 && MEMORY[0x18D765A14](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v5, "fd");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (MEMORY[0x18D765A14](v7) == MEMORY[0x1E0C812E8])
      {
        bytes_ptr = xpc_data_get_bytes_ptr(v7);
        length = xpc_data_get_length(v7);
        global_queue = geo_get_global_queue();
        destructor[0] = MEMORY[0x1E0C809B0];
        destructor[1] = 3221225472;
        destructor[2] = __43__GEOTileData_initWithXPCDictionary_error___block_invoke;
        destructor[3] = &unk_1E1BFF6F8;
        v26 = v7;
        v14 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);
        data = v6->_data;
        v6->_data = (NSData *)v14;

        v6->_sandboxExtension = -1;
LABEL_6:
        v16 = v6;
LABEL_17:

        goto LABEL_18;
      }
    }
    else if (v9)
    {
      if (MEMORY[0x18D765A14](v9) == MEMORY[0x1E0C81318])
      {
        v17 = xpc_fd_dup(v10);
        GEOGetTileLoadingLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v29 = v17;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Got file descriptor %d", buf, 8u);
        }

        if (v17 >= 1)
        {
          v6->_fileDescriptor = v17;
          v6->_cachedFileSize = xpc_dictionary_get_uint64(v5, "fileSize");
          goto LABEL_6;
        }
      }
    }
    else
    {
      if (!v8)
        goto LABEL_6;
      if (MEMORY[0x18D765A14](v8) == MEMORY[0x1E0C81390] && xpc_dictionary_get_string(v5, "sbt"))
      {
        v6->_sandboxExtension = sandbox_extension_consume();
        v20 = objc_alloc(MEMORY[0x1E0CB3940]);
        string_ptr = xpc_string_get_string_ptr(v8);
        v22 = (void *)objc_msgSend(v20, "initWithBytes:length:encoding:", string_ptr, xpc_string_get_length(v8), 4);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v22);
        v23 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (-[NSURL isFileURL](v23, "isFileURL"))
        {
          fileURL = v6->_fileURL;
          v6->_fileURL = v23;

          v6->_cachedFileSize = xpc_dictionary_get_uint64(v5, "fileSize");
          goto LABEL_6;
        }

      }
    }
    v16 = 0;
    goto LABEL_17;
  }
  v16 = 0;
LABEL_18:

  return v16;
}

- (id)readDataWithOptions:(unint64_t)a3 error:(id *)a4
{
  NSData *data;
  id *p_data;
  int fileDescriptor;
  off_t v10;
  NSURL *fileURL;
  NSData *v12;
  NSObject *v14;
  int v15;
  const char *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  ssize_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  unint64_t v27;
  int v28;
  NSObject *v29;
  unint64_t cachedFileSize;
  int v31;
  NSFileHandle *fileHandle;
  NSFileHandle *v33;
  int v34;
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  p_data = (id *)&self->_data;
  data = self->_data;
  if (data)
  {
    if (a4)
    {
      *a4 = 0;
      data = (NSData *)*p_data;
    }
LABEL_38:
    v12 = data;
    return v12;
  }
  fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor >= 1)
  {
    if (!self->_cachedFileSize)
    {
      v10 = lseek(fileDescriptor, 0, 2);
      if (v10 < 1)
      {
        if (!self->_cachedFileSize)
        {
          GEOGetTileLoadingLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v34 = self->_fileDescriptor;
          *(_DWORD *)buf = 67109120;
          v37 = v34;
          v16 = "Unable to determine size of tile file descriptor %d";
          goto LABEL_16;
        }
      }
      else
      {
        self->_cachedFileSize = v10;
      }
    }
    if (lseek(self->_fileDescriptor, 0, 0))
    {
      GEOGetTileLoadingLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

LABEL_34:
        fileHandle = self->_fileHandle;
        if (fileHandle)
        {
          -[NSFileHandle closeAndReturnError:](fileHandle, "closeAndReturnError:", 0);
          v33 = self->_fileHandle;
          self->_fileHandle = 0;

        }
        else
        {
          close(self->_fileDescriptor);
        }
        self->_fileDescriptor = 0;
        data = self->_data;
        goto LABEL_38;
      }
      v15 = self->_fileDescriptor;
      *(_DWORD *)buf = 67109120;
      v37 = v15;
      v16 = "Unable to seek to begninng of file descriptor %d";
LABEL_16:
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, v16, buf, 8u);
      goto LABEL_17;
    }
    if ((a3 & 9) != 0)
    {
      v17 = self->_fileDescriptor;
      v35 = 0;
      GEODispatchDataForMemoryMappedFileFromFileDescriptor(v17, &v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35;
      v20 = v19;
      if (v18)
      {
        objc_storeStrong(p_data, v18);
LABEL_21:

        goto LABEL_34;
      }
      if ((a3 & 8) != 0)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v19);
        goto LABEL_21;
      }

    }
    v21 = malloc_type_calloc(1uLL, self->_cachedFileSize, 0xAB2BA2C5uLL);
    if (v21)
    {
      v22 = v21;
      v23 = read(self->_fileDescriptor, v21, self->_cachedFileSize);
      if (v23 == self->_cachedFileSize)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v22, v23, 1);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *p_data;
        *p_data = (id)v24;

      }
      else
      {
        GEOGetTileLoadingLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          cachedFileSize = self->_cachedFileSize;
          v31 = self->_fileDescriptor;
          *(_DWORD *)buf = 67109632;
          v37 = cachedFileSize;
          v38 = 1024;
          v39 = v23;
          v40 = 1024;
          v41 = v31;
          _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "Expected to read %u bytes, got %u instead from file descriptor %d", buf, 0x14u);
        }

        free(v22);
      }
      goto LABEL_34;
    }
    GEOGetTileLoadingLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = self->_cachedFileSize;
      v28 = self->_fileDescriptor;
      *(_DWORD *)buf = 67109376;
      v37 = v27;
      v38 = 1024;
      v39 = v28;
      _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Unable to allocate %u bytes for file descriptor %d", buf, 0xEu);
    }

    return 0;
  }
  fileURL = self->_fileURL;
  if (!fileURL)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", fileURL, a3, a4);
  v12 = (NSData *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSData *data;
  id v6;
  NSURL *fileURL;
  id v8;
  xpc_object_t v9;
  const char *v10;
  char *v11;
  int fileDescriptor;
  NSObject *v13;
  NSURL *v14;
  int v15;
  NSURL *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  data = self->_data;
  if (data)
  {
    v6 = -[NSData _geo_newXPCData](data, "_geo_newXPCData");
    xpc_dictionary_set_value(v4, "data", v6);

  }
  else
  {
    fileURL = self->_fileURL;
    if (fileURL)
    {
      -[NSURL path](fileURL, "path");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = xpc_string_create((const char *)objc_msgSend(v8, "UTF8String"));

      xpc_dictionary_set_value(v4, "fileURL", v9);
      xpc_dictionary_set_uint64(v4, "fileSize", self->_cachedFileSize);
      -[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation");
      v10 = (const char *)sandbox_extension_issue_file();
      if (v10)
      {
        v11 = (char *)v10;
        xpc_dictionary_set_string(v4, "sbt", v10);
        free(v11);
      }
      else
      {
        GEOGetTileLoadingLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          v14 = self->_fileURL;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_FAULT, "Failed to issue sandbox extension for file: %@", (uint8_t *)&v15, 0xCu);
        }

      }
    }
    else if (self->_fileHandle)
    {
      fileDescriptor = self->_fileDescriptor;
      if (fileDescriptor <= 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _fileDescriptor > 0", (uint8_t *)&v15, 2u);
        fileDescriptor = self->_fileDescriptor;
      }
      xpc_dictionary_set_fd(v4, "fd", fileDescriptor);
    }
    else if (self->_decodedRepresentation && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _decodedRepresentation == nil", (uint8_t *)&v15, 2u);
    }
  }

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (GEOTileData)init
{
  GEOTileData *result;

  result = (GEOTileData *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOTileData)initWithFileURL:(id)a3
{
  id v4;
  GEOTileData *v5;
  uint64_t v6;
  NSURL *fileURL;
  NSURL *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOTileData *v15;
  id v17;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOTileData;
  v5 = -[GEOTileData init](&v18, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("fileURL must be a file URL"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v6 = objc_msgSend(v4, "copy");
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v8 = v5->_fileURL;
    v10 = *MEMORY[0x1E0C999D0];
    v19[0] = *MEMORY[0x1E0C99998];
    v9 = v19[0];
    v19[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL resourceValuesForKeys:error:](v8, "resourceValuesForKeys:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cachedFileSize = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDir = objc_msgSend(v14, "BOOLValue");

    v5->_sandboxExtension = -1;
    v15 = v5;

  }
  return v5;
}

- (GEOTileData)initWithFileHandle:(id)a3
{
  id v5;
  GEOTileData *v6;
  GEOTileData *v7;
  GEOTileData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileData;
  v6 = -[GEOTileData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileHandle, a3);
    v7->_fileDescriptor = -[NSFileHandle fileDescriptor](v7->_fileHandle, "fileDescriptor");
    v7->_sandboxExtension = -1;
    v8 = v7;
  }

  return v7;
}

- (GEOTileData)initWithDecodedRepresentation:(id)a3
{
  id v5;
  GEOTileData *v6;
  GEOTileData *v7;
  GEOTileData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileData;
  v6 = -[GEOTileData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_decodedRepresentation, a3);
    v7->_sandboxExtension = -1;
    v8 = v7;
  }

  return v7;
}

- (void)_replaceFileURL:(id)a3
{
  NSURL *v4;
  NSURL *fileURL;
  id v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("fileURL must be a file URL"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v4 = (NSURL *)objc_msgSend(v7, "copy");
  fileURL = self->_fileURL;
  self->_fileURL = v4;

}

- (NSData)data
{
  NSData *data;
  id v4;

  data = self->_data;
  if (!data)
  {
    if (self->_fileDescriptor < 1)
    {
      data = 0;
    }
    else
    {
      v4 = -[GEOTileData readDataWithError:](self, "readDataWithError:", 0);
      data = self->_data;
    }
  }
  return data;
}

- (BOOL)hasFileDescriptor
{
  return self->_fileDescriptor > 0;
}

- (int)consumeFileDescriptor
{
  int fileDescriptor;

  fileDescriptor = self->_fileDescriptor;
  self->_fileDescriptor = 0;
  return fileDescriptor;
}

- (unint64_t)hash
{
  void *data;
  objc_super v4;

  data = self->_data;
  if (data)
    return objc_msgSend(data, "hash");
  data = self->_fileURL;
  if (data)
    return objc_msgSend(data, "hash");
  data = self->_decodedRepresentation;
  if (data)
    return objc_msgSend(data, "hash");
  v4.receiver = self;
  v4.super_class = (Class)GEOTileData;
  return -[GEOTileData hash](&v4, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSData *data;
  char v7;
  BOOL v8;
  void *fileURL;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    data = self->_data;
    if (data)
    {
      if (v5[1])
      {
        v7 = -[NSData isEqualToData:](data, "isEqualToData:");
LABEL_12:
        v8 = v7;
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
    fileURL = self->_fileURL;
    if (fileURL)
    {
      if (!v5[4])
        goto LABEL_14;
    }
    else
    {
      fileURL = self->_decodedRepresentation;
      if (!fileURL)
      {
        if (!v5[1])
        {
          v8 = v5[8] == 0;
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      if (!v5[8])
      {
LABEL_14:
        v8 = 0;
        goto LABEL_15;
      }
    }
    v7 = objc_msgSend(fileURL, "isEqual:");
    goto LABEL_12;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

@end
