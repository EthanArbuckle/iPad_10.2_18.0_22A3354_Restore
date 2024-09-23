@implementation NSDictionary(JsonUtils)

- (id)initWithJSON:()JsonUtils
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    a1 = (id)objc_msgSend(a1, "initWithDictionary:", v3);
    v5 = a1;
  }

  return v5;
}

- (void)toJsonInDocumentDirectoryWith:()JsonUtils
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD *exception;
  id v20;
  id v21;
  _QWORD v22[3];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLsForDirectory:inDomains:", 9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    QRLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[NSDictionary(JsonUtils) toJsonInDocumentDirectoryWith:]";
      _os_log_error_impl(&dword_1C281A000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Cannot get an URL for Document directory", buf, 0xCu);
    }

    exception = __cxa_allocate_exception(0x30uLL);
    std::string::basic_string[abi:ne180100]<0>(buf, "Error creating directory");
    std::string::basic_string[abi:ne180100]<0>(v22, "QueryRewrite");
    ConfigLoadingError::ConfigLoadingError(exception, (uint64_t)buf, (uint64_t)v22, "/Library/Caches/com.apple.xbs/Sources/Marrs/Common/NSDictionary+JsonUtils.mm", 35);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v21);
  v10 = v21;

  if (v10)
  {
    QRLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[NSDictionary(JsonUtils) toJsonInDocumentDirectoryWith:]";
      v25 = 2112;
      v26 = v16;
      _os_log_error_impl(&dword_1C281A000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);

    }
    v17 = __cxa_allocate_exception(0x30uLL);
    std::string::basic_string[abi:ne180100]<0>(buf, "Error creating directory");
    std::string::basic_string[abi:ne180100]<0>(v22, "QueryRewrite");
    ConfigLoadingError::ConfigLoadingError(v17, (uint64_t)buf, (uint64_t)v22, "/Library/Caches/com.apple.xbs/Sources/Marrs/Common/NSDictionary+JsonUtils.mm", 44);
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "open");
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "writeJSONObject:toStream:options:error:", a1, v13, 1, &v20);
  v14 = v20;
  objc_msgSend(v13, "close");

}

@end
