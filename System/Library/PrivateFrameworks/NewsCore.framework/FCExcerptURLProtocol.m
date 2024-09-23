@implementation FCExcerptURLProtocol

+ (BOOL)canHandleURLWithComponents:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("news-excerpt"));

  return v4;
}

+ (void)setupWithArticleDatabase:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  Class v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("excerpt URL protocol requires a non-nil database"));
    v10 = 136315906;
    v11 = "+[FCExcerptURLProtocol setupWithArticleDatabase:]";
    v12 = 2080;
    v13 = "FCExcerptURLProtocol.m";
    v14 = 1024;
    v15 = 41;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  WeakRetained = objc_loadWeakRetained(&s_database_0);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = NSClassFromString(CFSTR("XCTest"));

    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("excerpt URL protocol has already been setup"));
      v10 = 136315906;
      v11 = "+[FCExcerptURLProtocol setupWithArticleDatabase:]";
      v12 = 2080;
      v13 = "FCExcerptURLProtocol.m";
      v14 = 1024;
      v15 = 42;
      v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
  }
  objc_storeWeak(&s_database_0, v4);
  objc_msgSend(MEMORY[0x1E0C92C78], "registerClass:", a1);

}

+ (BOOL)canInitWithRequest:(id)a3
{
  void *v4;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "canHandleURL:", v4);

  return (char)a1;
}

+ (BOOL)canHandleURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("news-excerpt"));

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x1E0C92C78], "registerClass:", a1);
}

+ (void)unregister
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&s_database_0);

  if (WeakRetained)
  {
    objc_storeWeak(&s_database_0, 0);
    objc_msgSend(MEMORY[0x1E0C92C78], "unregisterClass:", a1);
  }
}

+ (id)excerptURLForArticleID:(id)a3 changeTag:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&s_database_0);

  if (!WeakRetained && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't construct a URL without a database"));
    *(_DWORD *)buf = 136315906;
    v19 = "+[FCExcerptURLProtocol excerptURLForArticleID:changeTag:]";
    v20 = 2080;
    v21 = "FCExcerptURLProtocol.m";
    v22 = 1024;
    v23 = 61;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v8, "setScheme:", CFSTR("news-excerpt"));
  v9 = objc_loadWeakRetained(&s_database_0);
  objc_msgSend(v9, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHost:", v10);

  objc_msgSend(CFSTR("/"), "stringByAppendingString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPath:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("changetag"), v5);

  v17 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v13);

  objc_msgSend(v8, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v7);
  return (char)v5;
}

- (void)startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FCCKContentFetchOperation *v8;
  id WeakRetained;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;
  _BYTE location[12];
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[FCExcerptURLProtocol fetchOperation](self, "fetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't have a fetch operation yet"));
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCExcerptURLProtocol startLoading]";
    v27 = 2080;
    v28 = "FCExcerptURLProtocol.m";
    v29 = 1024;
    v30 = 102;
    v31 = 2114;
    v32 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

  }
  -[NSURLProtocol request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v6);
  v8 = objc_alloc_init(FCCKContentFetchOperation);
  WeakRetained = objc_loadWeakRetained(&s_database_0);
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v8, WeakRetained);

  v25 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v10, v11, 384);

  v24 = CFSTR("excerpt");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v12, v13, 400);

  objc_initWeak((id *)location, self);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __36__FCExcerptURLProtocol_startLoading__block_invoke;
  v21 = &unk_1E4647D10;
  objc_copyWeak(&v23, (id *)location);
  v15 = v5;
  v22 = v15;
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v14, &v18, 416);
  -[FCExcerptURLProtocol setFetchOperation:](self, "setFetchOperation:", v8, v18, v19, v20, v21);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v8);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);

}

void __36__FCExcerptURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__FCExcerptURLProtocol_startLoading__block_invoke_2;
  v10[3] = &unk_1E4647CE8;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v8 = v6;
  v9 = v5;
  FCPerformIfNonNil(WeakRetained, v10);

}

void __36__FCExcerptURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "fetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCancelled");

  if ((v4 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "allValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("excerpt"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fc_gzipDeflate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C88]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", *(_QWORD *)(a1 + 40), CFSTR("application/gzip"), objc_msgSend(v9, "length"), 0);
      objc_msgSend(v14, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", v14, v10, 2);

      objc_msgSend(v14, "client");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLProtocol:didLoadData:", v14, v9);

      objc_msgSend(v14, "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLProtocolDidFinishLoading:", v14);

    }
    else
    {
      objc_msgSend(v14, "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLProtocol:didFailWithError:", v14, *(_QWORD *)(a1 + 48));
    }

  }
}

- (void)stopLoading
{
  id v2;

  -[FCExcerptURLProtocol fetchOperation](self, "fetchOperation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (FCCKContentFetchOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperation, 0);
}

@end
