@implementation NTKDZIPArchivist

- (NTKDZIPArchivist)init
{
  NTKDZIPArchivist *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *unzipQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKDZIPArchivist;
  v2 = -[NTKDZIPArchivist init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ntkd.zip-archivist", 0);
    unzipQueue = v2->_unzipQueue;
    v2->_unzipQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)unzipData:(id)a3 toPath:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void (**v17)(id, _QWORD);
  id v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;

  v8 = (void (**)(id, _QWORD))a5;
  v9 = a4;
  v10 = a3;
  NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(v10, "writeToFile:options:error:", v14, 0x10000000, &v23);

  v15 = v23;
  if (v15)
  {
    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NTKDZIPArchivist unzipData:toPath:completionHandler:].cold.1();

    v8[2](v8, 0);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__NTKDZIPArchivist_unzipData_toPath_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6BCE0F8;
  v21 = v14;
  v22 = v8;
  v17 = v8;
  v18 = v14;
  v19 = _Block_copy(aBlock);
  -[NTKDZIPArchivist unzipFile:toPath:completionHandler:](self, "unzipFile:toPath:completionHandler:", v18, v9, v19);

}

uint64_t __55__NTKDZIPArchivist_unzipData_toPath_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)unzipFile:(id)a3 toPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *unzipQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  unzipQueue = self->_unzipQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke;
  block[3] = &unk_1E6BCD820;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(unzipQueue, block);

}

uint64_t __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char __s1[1025];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v34);
  v6 = v34;
  if (v6)
  {
    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_4();
LABEL_4:

    goto LABEL_5;
  }
  v9 = objc_msgSend(objc_retainAutorelease(v3), "cStringUsingEncoding:", 4);
  if (!v9)
  {
    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_1(v7, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_4;
  }
  v10 = v9;
  v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 4);
  if (!v11)
  {
    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_2(v7, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_4;
  }
  v12 = (uint64_t)v11;
  __s1[1024] = 0;
  if (realpath_DARWIN_EXTSN(v11, __s1) == __s1)
  {
    extract_zip(v10, __s1);
  }
  else
  {
    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);

  }
LABEL_5:

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)zippedDataForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v4 = a3;
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[NTKDZIPArchivist zippedDataForPath:toZipFile:](self, "zippedDataForPath:toZipFile:", v4, v8);
  if ((_DWORD)self)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v8, 8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v10)
    {
      _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[NTKDZIPArchivist zippedDataForPath:].cold.1();

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeItemAtPath:error:", v8, 0);

  return v9;
}

- (BOOL)zippedDataForPath:(id)a3 toZipFile:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
    return _createArchive(a3, a4);
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NTKDZIPArchivist zippedDataForPath:toZipFile:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unzipQueue, 0);
}

- (void)unzipData:toPath:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B72A3000, v0, v1, "%s: cannot write data to temp file %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a1, a3, "%s: source zip archive cannot be nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a1, a3, "%s: destination directory cannot be nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B72A3000, a2, a3, "%s: cannot compute realpath() for %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_4()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1_4();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_ERROR, "%s: cannot create new directory %@ for unzipping archive %@", (uint8_t *)v3, 0x20u);
}

- (void)zippedDataForPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B72A3000, v0, v1, "%s: cannot read data from temp file %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)zippedDataForPath:(uint64_t)a3 toZipFile:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a1, a3, "%s: source path to zip up is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
