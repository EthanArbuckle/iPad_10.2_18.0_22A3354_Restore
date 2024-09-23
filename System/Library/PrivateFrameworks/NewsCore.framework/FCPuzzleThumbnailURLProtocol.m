@implementation FCPuzzleThumbnailURLProtocol

+ (BOOL)canHandleURLWithComponents:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("puzzle-thumbnail"));

  return v4;
}

+ (void)setupWithArticleDatabase:(id)a3 cacheDirectory:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  Class v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record field URL protocol requires a non-nil database"));
    v15 = 136315906;
    v16 = "+[FCPuzzleThumbnailURLProtocol setupWithArticleDatabase:cacheDirectory:]";
    v17 = 2080;
    v18 = "FCPuzzleThumbnailURLProtocol.m";
    v19 = 1024;
    v20 = 71;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  WeakRetained = objc_loadWeakRetained(&qword_1ED0F7C70);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = NSClassFromString(CFSTR("XCTest"));

    if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record field URL protocol has already been setup"));
      v15 = 136315906;
      v16 = "+[FCPuzzleThumbnailURLProtocol setupWithArticleDatabase:cacheDirectory:]";
      v17 = 2080;
      v18 = "FCPuzzleThumbnailURLProtocol.m";
      v19 = 1024;
      v20 = 72;
      v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

    }
  }
  objc_storeWeak(&qword_1ED0F7C70, v6);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_1ED0F7C78;
  qword_1ED0F7C78 = v11;

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
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("puzzle-thumbnail"));

  return v4;
}

+ (id)sharedURLRequestScheduler
{
  if (qword_1ED0F7C58 != -1)
    dispatch_once(&qword_1ED0F7C58, &__block_literal_global_20);
  return (id)_MergedGlobals_11;
}

void __57__FCPuzzleThumbnailURLProtocol_sharedURLRequestScheduler__block_invoke()
{
  FCURLRequestScheduler *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [FCURLRequestScheduler alloc];
  +[FCAssetDownloadOperation sharedURLSession](FCAssetDownloadOperation, "sharedURLSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[FCURLRequestScheduler initWithURLSession:](v0, "initWithURLSession:", v3);
  v2 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v1;

}

+ (id)resourceMapSerialQueue
{
  if (qword_1ED0F7C68 != -1)
    dispatch_once(&qword_1ED0F7C68, &__block_literal_global_5);
  return (id)qword_1ED0F7C60;
}

void __54__FCPuzzleThumbnailURLProtocol_resourceMapSerialQueue__block_invoke()
{
  FCAsyncSerialQueue *v0;
  void *v1;

  v0 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
  v1 = (void *)qword_1ED0F7C60;
  qword_1ED0F7C60 = (uint64_t)v0;

}

+ (void)unregister
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained(&qword_1ED0F7C70);

  if (WeakRetained)
  {
    objc_storeWeak(&qword_1ED0F7C70, 0);
    v4 = (void *)qword_1ED0F7C78;
    qword_1ED0F7C78 = 0;

    objc_msgSend(MEMORY[0x1E0C92C78], "unregisterClass:", a1);
  }
}

+ (id)URLForResourceMapID:(id)a3 publishDate:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(&qword_1ED0F7C70);
  if (WeakRetained)
  {

  }
  else if (!NSClassFromString(CFSTR("XCTest")) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't construct a URL without a database"));
    *(_DWORD *)buf = 136315906;
    v21 = "+[FCPuzzleThumbnailURLProtocol URLForResourceMapID:publishDate:]";
    v22 = 2080;
    v23 = "FCPuzzleThumbnailURLProtocol.m";
    v24 = 1024;
    v25 = 93;
    v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = objc_loadWeakRetained(&qword_1ED0F7C70);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    v10 = objc_alloc(MEMORY[0x1E0C99D48]);
    v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("EST"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v12);

    v13 = objc_msgSend(v11, "component:fromDate:", 512, v6);
    objc_msgSend(v9, "setScheme:", CFSTR("https"));
    objc_msgSend(v9, "setHost:", CFSTR("puzzle-thumbnail"));
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPath:", v16);

    objc_msgSend(v9, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
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
  void *v12;
  _QWORD v13[5];
  id v14[2];
  _QWORD v15[5];
  _BYTE location[12];
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[FCPuzzleThumbnailURLProtocol fetchOperation](self, "fetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't have a fetch operation yet"));
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCPuzzleThumbnailURLProtocol startLoading]";
    v17 = 2080;
    v18 = "FCPuzzleThumbnailURLProtocol.m";
    v19 = 1024;
    v20 = 143;
    v21 = 2114;
    v22 = v12;
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
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke;
    v15[3] = &unk_1E463AB18;
    v15[4] = self;
    __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke((uint64_t)v15);
  }
  else
  {
    objc_msgSend(v5, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "integerValue");

    objc_initWeak((id *)location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_2;
    v13[3] = &unk_1E463D8F0;
    objc_copyWeak(v14, (id *)location);
    v13[4] = self;
    v14[1] = v11;
    -[FCPuzzleThumbnailURLProtocol _fetchResourceMapWithID:completion:](self, "_fetchResourceMapWithID:completion:", v8, v13);
    objc_destroyWeak(v14);
    objc_destroyWeak((id *)location);

  }
}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol has invalid path."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[7];
  id v22;
  _QWORD v23[6];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = v9;
    if (v6)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_4;
      v23[3] = &unk_1E463AD10;
      v23[4] = v9;
      v23[5] = v6;
      __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_4((uint64_t)v23);
    }
    else
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v22 = 0;
      objc_msgSend(v11, "_imageURLFromResourceMapFileURL:dayOfWeek:error:", v5, v12, &v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;
      if (v13)
      {
        v15 = (objc_class *)MEMORY[0x1E0C92C80];
        v16 = v13;
        v17 = (id)objc_msgSend([v15 alloc], "initWithURL:", v16);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C88]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v16, 0, 0, 0);

        objc_msgSend(v10, "client");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLProtocol:wasRedirectedToRequest:redirectResponse:", v10, v17, v18);

      }
      else
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_5;
        v21[3] = &unk_1E463B228;
        v17 = v10;
        v20 = *(_QWORD *)(a1 + 32);
        v21[4] = v17;
        v21[5] = v20;
        v21[6] = v14;
        __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_5((uint64_t)v21);
      }

    }
  }

}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __44__FCPuzzleThumbnailURLProtocol_startLoading__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)stopLoading
{
  void *v3;
  id v4;

  -[FCPuzzleThumbnailURLProtocol fetchOperation](self, "fetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[FCPuzzleThumbnailURLProtocol assetOperation](self, "assetOperation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)_fetchResourceMapWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FCPuzzleThumbnailURLProtocol *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "resourceMapSerialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke;
  v11[3] = &unk_1E463D990;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v12 = v10;
  objc_copyWeak(&v15, &location);
  v13 = self;
  objc_msgSend(v8, "enqueueBlock:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(void *, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  FCCKContentFetchOperation *v13;
  id WeakRetained;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  void (**v20)(void *, void *, _QWORD);
  uint64_t v21;
  const char *v22;
  id v23;
  _QWORD newValue[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD aBlock[4];
  id v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_2;
  aBlock[3] = &unk_1E463D918;
  v30 = *(id *)(a1 + 48);
  v4 = v3;
  v31 = v4;
  v5 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend((id)qword_1ED0F7C78, "URLByAppendingPathComponent:", CFSTR("puzzle-resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v23 = v6;
    objc_msgSend(v23, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (v11)
    {
      v5[2](v5, v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 1, 0, 0);

      v13 = objc_alloc_init(FCCKContentFetchOperation);
      WeakRetained = objc_loadWeakRetained(&qword_1ED0F7C70);
      -[FCCKContentFetchOperation setDatabase:]((uint64_t)v13, WeakRetained);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", *(_QWORD *)(a1 + 32));
      v33[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_setProperty_nonatomic_copy(v13, v16, v17, 384);

      v32 = CFSTR("asset");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_setProperty_nonatomic_copy(v13, v18, v19, 400);

      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_4;
      newValue[3] = &unk_1E463D968;
      objc_copyWeak(&v27, (id *)(a1 + 56));
      v20 = v5;
      v21 = *(_QWORD *)(a1 + 40);
      v26 = v20;
      newValue[4] = v21;
      v25 = v8;
      if (v13)
        objc_setProperty_nonatomic_copy(v13, v22, newValue, 416);
      objc_msgSend(*(id *)(a1 + 40), "setFetchOperation:", v13);
      -[FCOperation start](v13, "start");

      objc_destroyWeak(&v27);
    }

  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_3;
    v28[3] = &unk_1E463B598;
    v28[4] = v5;
    __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_3((uint64_t)v28);
  }

}

uint64_t __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Puzzle thumbnail URL protocol is missing a cache directory."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  FCAssetDownloadOperation *v23;
  void *v24;
  void *v25;
  FCAssetDownloadOperation *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[6];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(v9, "fetchOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCancelled");

    if (v11)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_6;
      v38[3] = &unk_1E463B598;
      v38[4] = a1[6];
      __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_6((uint64_t)v38);
    }
    else if (v6)
    {
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      objc_msgSend(v5, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v13;
        objc_opt_class();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("asset"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
        }
        else
        {
          v16 = 0;
        }
        v17 = v16;

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v30 = v14;
            v19 = objc_loadWeakRetained(&qword_1ED0F7C70);
            v20 = objc_msgSend(v19, "shouldUseSecureConnectionForCKAssetURLs");

            if (v20)
              objc_msgSend(v18, "setScheme:", CFSTR("https"));
            v21 = objc_loadWeakRetained(&qword_1ED0F7C70);
            objc_msgSend(v21, "updateAssetURLHostIfNeededWithComponents:", v18);

            objc_msgSend(v18, "URL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v29 = v22;
              v23 = [FCAssetDownloadOperation alloc];
              v27 = objc_loadWeakRetained(&qword_1ED0F7C70);
              objc_msgSend(v27, "networkReachability");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "sharedURLRequestScheduler");
              v28 = v18;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:](v23, "initWithNetworkReachability:URLRequestScheduler:", v24, v25);

              v18 = v28;
              -[FCAssetDownloadOperation setURL:](v26, "setURL:", v29);
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_12;
              v31[3] = &unk_1E463D940;
              v33 = a1[6];
              v32 = a1[5];
              -[FCAssetDownloadOperation setFileDownloadCompletionHandler:](v26, "setFileDownloadCompletionHandler:", v31);
              objc_msgSend(v9, "setAssetOperation:", v26);
              -[FCOperation start](v26, "start");

              v22 = v29;
            }
            else
            {
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_11;
              v34[3] = &unk_1E463B598;
              v34[4] = a1[6];
              __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_11((uint64_t)v34);
            }
            v14 = v30;

          }
          else
          {
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_10;
            v35[3] = &unk_1E463B598;
            v35[4] = a1[6];
            __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_10((uint64_t)v35);
          }

        }
        else
        {
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_9;
          v36[3] = &unk_1E463B598;
          v36[4] = a1[6];
          __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_9((uint64_t)v36);
        }

      }
      else
      {
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_8;
        v37[3] = &unk_1E463B598;
        v37[4] = a1[6];
        __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_8((uint64_t)v37);
      }

    }
  }

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_operationCancelledErrorWithAdditionalUserInfo:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing requested record."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing requested field."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing valid URL components."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Record field URL protocol is missing valid URL."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __67__FCPuzzleThumbnailURLProtocol__fetchResourceMapWithID_completion___block_invoke_12(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, uint64_t);
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    v9 = (void (**)(id, _QWORD, uint64_t))*(id *)(a1 + 40);
    v9[2](v9, 0, a4);
  }
  else
  {
    +[FCIdentityAssetTransformer sharedInstance](FCIdentityAssetTransformer, "sharedInstance");
    v9 = (void (**)(id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "responseMIMEType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "fc_isGzippedWithMIMETypeHint:", v10);

    if (v11)
    {
      +[FCGzipAssetTransformer sharedInstance](FCGzipAssetTransformer, "sharedInstance");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void (**)(id, _QWORD, uint64_t))v12;
    }
    objc_msgSend(v7, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v9, "transformAssetDataFromFilePath:toFilePath:error:", v13, v14, &v16);
    v15 = v16;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_imageURLFromResourceMapFileURL:(id)a3 dayOfWeek:(int64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "open");
  objc_msgSend(v7, "streamError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v7;
    objc_msgSend(v9, "streamError");
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v7, 0, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    v9 = v12;
    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smallImages"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("s%ld"), a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("defaultUrl"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 16, CFSTR("Resource map is missing the requested thumbnail."));
        v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v13 = objc_retainAutorelease(v12);
      v10 = 0;
      *a5 = v13;
    }

  }
  return v10;
}

- (FCCKContentFetchOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (FCAssetDownloadOperation)assetOperation
{
  return self->_assetOperation;
}

- (void)setAssetOperation:(id)a3
{
  objc_storeStrong((id *)&self->_assetOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
}

@end
