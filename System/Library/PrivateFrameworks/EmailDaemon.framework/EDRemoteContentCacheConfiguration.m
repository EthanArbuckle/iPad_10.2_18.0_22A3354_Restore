@implementation EDRemoteContentCacheConfiguration

- (unint64_t)diskCapacity
{
  return self->_diskCapacity;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (EDRemoteContentCacheConfiguration)initWithBaseURL:(id)a3 diskCapacity:(unint64_t)a4
{
  id v6;
  EDRemoteContentCacheConfiguration *v7;
  EDRemoteContentCacheConfiguration *v8;
  uint64_t v9;
  NSURL *cacheURL;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EDRemoteContentCacheConfiguration;
  v7 = -[EDRemoteContentCacheConfiguration init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EDRemoteContentCacheConfiguration _cacheURLWithBaseURL:](v7, "_cacheURLWithBaseURL:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    cacheURL = v8->_cacheURL;
    v8->_cacheURL = (NSURL *)v9;

    v8->_diskCapacity = a4;
  }

  return v8;
}

- (id)_cacheURLWithBaseURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[24];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("RemoteContentURLCache"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2AD8];
  v18[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, v5, &v15);
  v7 = v15;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == (void *)*MEMORY[0x1E0CB28A8])
    {
      v11 = objc_msgSend(v8, "code") == 516;

      if (v11)
        goto LABEL_8;
    }
    else
    {

    }
    _ef_log_EDRemoteContentCacheConfiguration();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDRemoteContentCacheConfiguration _cacheURLWithBaseURL:].cold.1(v13, buf, v12);
    }

  }
LABEL_8:

  return v3;
}

void ___ef_log_EDRemoteContentCacheConfiguration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDRemoteContentCacheConfiguration");
  v1 = (void *)_ef_log_EDRemoteContentCacheConfiguration_log;
  _ef_log_EDRemoteContentCacheConfiguration_log = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

- (void)_cacheURLWithBaseURL:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to create URL Cache directory:\n%{public}@", buf, 0xCu);

}

@end
