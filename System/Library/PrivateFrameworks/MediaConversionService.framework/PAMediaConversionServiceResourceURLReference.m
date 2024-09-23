@implementation PAMediaConversionServiceResourceURLReference

- (void)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4
{
  NSURL *url;
  void *v8;
  void *v10;
  id v11;

  url = self->_url;
  if (!url)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 82, CFSTR("Unexpected nil resource reference URL"));

    url = self->_url;
  }
  -[NSURL path](url, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (a3)
  {
    *a3 = objc_msgSend(v8, "hash");
    v8 = v11;
  }
  if (a4)
  {
    objc_msgSend(v11, "lastPathComponent");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSURL path](self->_url, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)getFileSize:(unint64_t *)a3 error:(id *)a4
{
  NSURL *url;
  _BOOL4 v6;
  BOOL v7;
  id v9;

  url = self->_url;
  v9 = 0;
  v6 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v9, *MEMORY[0x1E0C99998], a4);
  v7 = v6;
  if (a3 && v6)
    *a3 = objc_msgSend(v9, "unsignedLongLongValue");
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSURL *url;
  char v8;
  id v9;
  void *v10;
  objc_super v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_shouldDeleteOnDeallocation)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_url, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        -[NSURL path](self->_url, "path");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Deleting temporary file %@", buf, 0xCu);

      }
      url = self->_url;
      v12 = 0;
      v8 = objc_msgSend(v3, "removeItemAtURL:error:", url, &v12);
      v9 = v12;
      if ((v8 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](self->_url, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v9;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to delete temporary file %@: %@", buf, 0x16u);

      }
    }

  }
  if (self->_mustStopAccessingURL)
    -[NSURL stopAccessingSecurityScopedResource](self->_url, "stopAccessingSecurityScopedResource");
  v11.receiver = self;
  v11.super_class = (Class)PAMediaConversionServiceResourceURLReference;
  -[PAMediaConversionServiceResourceURLReference dealloc](&v11, sel_dealloc);
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[NSURL bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:](self->_url, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0x20000000, 0, 0, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7 = CFSTR("bookmarkData");
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)mustStopAccessingURL
{
  return self->_mustStopAccessingURL;
}

- (void)setMustStopAccessingURL:(BOOL)a3
{
  self->_mustStopAccessingURL = a3;
}

- (BOOL)shouldDeleteOnDeallocation
{
  return self->_shouldDeleteOnDeallocation;
}

- (void)setShouldDeleteOnDeallocation:(BOOL)a3
{
  self->_shouldDeleteOnDeallocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

+ (id)referenceWithURL:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setUrl:", v5);

  return v6;
}

+ (id)referenceWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bookmarkData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmarkData"));

  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v7, 0, 0, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v8)
  {
    objc_msgSend(a1, "referenceWithURL:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Unable to decode URL reference bookmark data: %@", buf, 0xCu);
    }
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v10;
}

+ (BOOL)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4 forDictionaryRepresentation:(id)a5
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("bookmarkData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmarkData"));

  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v9, 256, 0, 0, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v10)
  {
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a3)
      *a3 = objc_msgSend(v12, "hash");
    if (a4)
    {
      objc_msgSend(v13, "lastPathComponent");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to decode bookmark data to get hash/filename: %@", buf, 0xCu);
  }

  return v10 != 0;
}

@end
