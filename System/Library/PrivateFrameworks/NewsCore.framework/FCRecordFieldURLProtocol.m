@implementation FCRecordFieldURLProtocol

+ (BOOL)canHandleURLWithComponents:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("news-record"));

  return v4;
}

+ (id)URLForRecordID:(id)a3 fieldName:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(&s_database);
  if (WeakRetained)
  {

  }
  else if (!NSClassFromString(CFSTR("XCTest")) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't construct a URL without a database"));
    v14 = 136315906;
    v15 = "+[FCRecordFieldURLProtocol URLForRecordID:fieldName:]";
    v16 = 2080;
    v17 = "FCRecordFieldURLProtocol.m";
    v18 = 1024;
    v19 = 56;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  v8 = objc_loadWeakRetained(&s_database);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v9, "setScheme:", CFSTR("https"));
    objc_msgSend(v9, "setHost:", CFSTR("news-record"));
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPath:", v11);

    objc_msgSend(v9, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
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
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record field URL protocol requires a non-nil database"));
    v10 = 136315906;
    v11 = "+[FCRecordFieldURLProtocol setupWithArticleDatabase:]";
    v12 = 2080;
    v13 = "FCRecordFieldURLProtocol.m";
    v14 = 1024;
    v15 = 36;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  WeakRetained = objc_loadWeakRetained(&s_database);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = NSClassFromString(CFSTR("XCTest"));

    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record field URL protocol has already been setup"));
      v10 = 136315906;
      v11 = "+[FCRecordFieldURLProtocol setupWithArticleDatabase:]";
      v12 = 2080;
      v13 = "FCRecordFieldURLProtocol.m";
      v14 = 1024;
      v15 = 37;
      v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
  }
  objc_storeWeak(&s_database, v4);
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

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("news-record"));

  return v4;
}

+ (void)unregister
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&s_database);

  if (WeakRetained)
  {
    objc_storeWeak(&s_database, 0);
    objc_msgSend(MEMORY[0x1E0C92C78], "unregisterClass:", a1);
  }
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCCKContentFetchOperation *v12;
  id WeakRetained;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  void *v29;
  void *v30;
  _BYTE location[12];
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[FCRecordFieldURLProtocol fetchOperation](self, "fetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't have a fetch operation yet"));
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCRecordFieldURLProtocol startLoading]";
    v32 = 2080;
    v33 = "FCRecordFieldURLProtocol.m";
    v34 = 1024;
    v35 = 99;
    v36 = 2114;
    v37 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

  }
  -[NSURLProtocol request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 2)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke;
    v28[3] = &unk_1E463AB18;
    v28[4] = self;
    __40__FCRecordFieldURLProtocol_startLoading__block_invoke((uint64_t)v28);
  }
  else
  {
    objc_msgSend(v5, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v8);
    objc_msgSend(v5, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(FCCKContentFetchOperation);
    WeakRetained = objc_loadWeakRetained(&s_database);
    -[FCCKContentFetchOperation setDatabase:]((uint64_t)v12, WeakRetained);

    v30 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v14, v15, 384);

    v29 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v16, v17, 400);

    objc_initWeak((id *)location, self);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_2;
    v24 = &unk_1E4643498;
    objc_copyWeak(&v27, (id *)location);
    v18 = v11;
    v25 = v18;
    v26 = v5;
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v19, &v21, 416);
    -[FCRecordFieldURLProtocol setFetchOperation:](self, "setFetchOperation:", v12, v21, v22, v23, v24);
    -[FCOperation start](v12, "start");

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);

  }
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol has invalid path."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[7];

  v30 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(v8, "fetchOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCancelled");

    if ((v10 & 1) != 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    if (v5)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_5;
      v35[3] = &unk_1E463AD10;
      v35[4] = v8;
      v35[5] = v5;
      __40__FCRecordFieldURLProtocol_startLoading__block_invoke_5((uint64_t)v35);
      goto LABEL_26;
    }
    objc_msgSend(v30, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_6;
      v34[3] = &unk_1E463AB18;
      v34[4] = v8;
      __40__FCRecordFieldURLProtocol_startLoading__block_invoke_6((uint64_t)v34);
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_7;
      v33[3] = &unk_1E463AB18;
      v33[4] = v8;
      __40__FCRecordFieldURLProtocol_startLoading__block_invoke_7((uint64_t)v33);
LABEL_24:

      goto LABEL_25;
    }
    v15 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = objc_loadWeakRetained(&s_database);
        v18 = objc_msgSend(v17, "shouldUseSecureConnectionForCKAssetURLs");

        if (v18)
          objc_msgSend(v16, "setScheme:", CFSTR("https"));
        v19 = objc_loadWeakRetained(&s_database);
        objc_msgSend(v19, "updateAssetURLHostIfNeededWithComponents:", v16);

        objc_msgSend(v16, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v20);
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C88]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v20, 0, 0, 0);
          objc_msgSend(v8, "client");
          v29 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "URLProtocol:wasRedirectedToRequest:redirectResponse:", v8, v21, v22);

          v20 = v29;
        }
        else
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_9;
          v31[3] = &unk_1E463AB18;
          v31[4] = v8;
          __40__FCRecordFieldURLProtocol_startLoading__block_invoke_9((uint64_t)v31);
        }

      }
      else
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_8;
        v32[3] = &unk_1E463AB18;
        v32[4] = v8;
        __40__FCRecordFieldURLProtocol_startLoading__block_invoke_8((uint64_t)v32);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_23:

        goto LABEL_24;
      }
      v16 = v15;
      if (objc_msgSend(v16, "fc_isGzipped"))
      {
        objc_msgSend(v16, "fc_gzipInflate");
        v24 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v24;
      }
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C88]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", *(_QWORD *)(a1 + 40), CFSTR("application/octet-stream"), objc_msgSend(v16, "length"), 0);
      objc_msgSend(v8, "client");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", v8, v25, 2);

      objc_msgSend(v8, "client");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLProtocol:didLoadData:", v8, v16);

      objc_msgSend(v8, "client");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLProtocolDidFinishLoading:", v8);

    }
    goto LABEL_23;
  }
LABEL_27:

}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing requested record."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing requested field."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing valid URL components."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_9(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing valid URL."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v3);

}

- (void)stopLoading
{
  void *v3;
  char v4;
  id v5;

  -[FCRecordFieldURLProtocol fetchOperation](self, "fetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished");

  if ((v4 & 1) == 0)
  {
    -[FCRecordFieldURLProtocol fetchOperation](self, "fetchOperation");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
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
