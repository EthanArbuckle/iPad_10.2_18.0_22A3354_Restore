@implementation FCMockURLProtocol

+ (id)URLForData:(id)a3 mimeType:(id)a4 statusCode:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v7 = a4;
  v8 = a3;
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createFileAtPath:contents:attributes:", v12, v8, 0);

  if (qword_1ED0F7F88 == -1)
  {
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_1ED0F7F88, &__block_literal_global_48);
  if (v7)
LABEL_3:
    objc_msgSend((id)_MergedGlobals_156, "setObject:forKey:", v7, v12);
LABEL_4:
  if (qword_1ED0F7F90 != -1)
  {
    dispatch_once(&qword_1ED0F7F90, &__block_literal_global_6);
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a5)
  {
LABEL_6:
    v14 = (void *)qword_1ED0F7F78;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v12);

  }
LABEL_7:
  v16 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v16, "setScheme:", CFSTR("https"));
  objc_msgSend(v16, "setHost:", CFSTR("news-mock-file.local"));
  objc_msgSend(v16, "setPath:", v12);
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __52__FCMockURLProtocol_URLForData_mimeType_statusCode___block_invoke()
{
  FCThreadSafeMutableDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(FCThreadSafeMutableDictionary);
  v1 = (void *)_MergedGlobals_156;
  _MergedGlobals_156 = (uint64_t)v0;

}

void __52__FCMockURLProtocol_URLForData_mimeType_statusCode___block_invoke_2()
{
  FCThreadSafeMutableDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(FCThreadSafeMutableDictionary);
  v1 = (void *)qword_1ED0F7F78;
  qword_1ED0F7F78 = (uint64_t)v0;

}

+ (id)URLForData:(id)a3 mimeType:(id)a4
{
  return (id)objc_msgSend(a1, "URLForData:mimeType:statusCode:", a3, a4, 0);
}

+ (id)URLForError:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = ++qword_1ED0F7F98;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("/%lu"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED0F7FA0 != -1)
    dispatch_once(&qword_1ED0F7FA0, &__block_literal_global_14_1);
  objc_msgSend((id)qword_1ED0F7F80, "setObject:forKey:", v5, v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v7, "setScheme:", CFSTR("https"));
  objc_msgSend(v7, "setHost:", CFSTR("news-mock-error.local"));
  objc_msgSend(v7, "setPath:", v6);
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __33__FCMockURLProtocol_URLForError___block_invoke()
{
  FCThreadSafeMutableDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(FCThreadSafeMutableDictionary);
  v1 = (void *)qword_1ED0F7F80;
  qword_1ED0F7F80 = (uint64_t)v0;

}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (NSClassFromString(CFSTR("XCTest")))
  {
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("news-mock-file.local")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToString:", CFSTR("news-mock-error.local"));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  objc_msgSend(a3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  return v10;
}

- (void)startLoading
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;

  -[NSURLProtocol request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("news-mock-file.local"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    -[NSURLProtocol request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    objc_msgSend(v11, "getResourceValue:forKey:error:", &v43, *MEMORY[0x1E0C99998], 0);
    v12 = (void *)qword_1ED0F7F78;
    v13 = v43;
    -[NSURLProtocol request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)_MergedGlobals_156;
    objc_msgSend(v11, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fc_safelySetObjectAllowingNil:forKey:", v20, CFSTR("Content-Type"));
    v22 = objc_alloc(MEMORY[0x1E0C92C18]);
    -[NSURLProtocol request](self, "request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v25 = objc_msgSend(v17, "unsignedIntegerValue");
    else
      v25 = 200;
    v35 = (void *)objc_msgSend(v22, "initWithURL:statusCode:HTTPVersion:headerFields:", v24, v25, 0, v21);

    -[NSURLProtocol client](self, "client");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v35, 0);

    -[NSURLProtocol client](self, "client");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v11, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dataWithContentsOfFile:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "URLProtocol:didLoadData:", self, v40);

    -[NSURLProtocol client](self, "client");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "URLProtocolDidFinishLoading:", self);

  }
  else
  {
    -[NSURLProtocol request](self, "request");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "host");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("news-mock-error.local"));

    if (v29)
    {
      v30 = (void *)qword_1ED0F7F80;
      -[NSURLProtocol request](self, "request");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "URL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", v33);
      v42 = (id)objc_claimAutoreleasedReturnValue();

      -[NSURLProtocol client](self, "client");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "URLProtocol:didFailWithError:", self, v42);

    }
  }
}

@end
