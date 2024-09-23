@implementation MFMessageURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x1E0CB39D0], "registerClass:", a1);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MFMessageURLProtocol_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (OS_os_log *)(id)log_log_8;
}

void __27__MFMessageURLProtocol_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

+ (_MFMessageURLProtocolRegistry)registry
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sPreferredRegistry;
  if (!sPreferredRegistry)
  {
    +[_MFMessageURLProtocolRegistry sharedRegistry](_MFMessageURLProtocolRegistry, "sharedRegistry");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sPreferredRegistry;
    sPreferredRegistry = v3;

    v2 = (void *)sPreferredRegistry;
  }
  return (_MFMessageURLProtocolRegistry *)v2;
}

+ (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&sPreferredRegistry, a3);
}

+ (void)registerContentRepresentation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "registry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerContentRepresentation:", v5);

}

+ (id)contentRepresentationForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "registry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentRepresentationForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)*MEMORY[0x1E0D4D488], "caseInsensitiveCompare:", v5) == 0;
  objc_msgSend(v3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    +[MFMessageURLProtocol log](MFMessageURLProtocol, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MFMessageURLProtocol canInitWithRequest:].cold.1((uint64_t)v3, v10, v11);

    v6 = 0;
  }

  return v6;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQuery:", 0);
    v7 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setURL:", v8);

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MFMessageURLProtocol stopLoading](self, "stopLoading");
  v3.receiver = self;
  v3.super_class = (Class)MFMessageURLProtocol;
  -[NSURLProtocol dealloc](&v3, sel_dealloc);
}

- (MFMessageURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  MFMessageURLProtocol *v11;
  EFPromise *v12;
  EFPromise *promise;
  void *v14;
  void *v15;
  uint64_t v16;
  EMContentRepresentation *contentRepresentation;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MFMessageURLProtocol;
  v11 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v27, sel_initWithRequest_cachedResponse_client_, v8, v9, v10);
  if (v11)
  {
    v12 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
    promise = v11->_promise;
    v11->_promise = v12;

    v14 = (void *)objc_opt_class();
    objc_msgSend(v8, "mainDocumentURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentRepresentationForURL:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    contentRepresentation = v11->_contentRepresentation;
    v11->_contentRepresentation = (EMContentRepresentation *)v16;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    -[EFPromise future](v11->_promise, "future");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke;
    v24[3] = &unk_1E5A69688;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v18, "addSuccessBlock:", v24);

    -[EFPromise future](v11->_promise, "future");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke_2;
    v22[3] = &unk_1E5A68E70;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v20, "addFailureBlock:", v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", WeakRetained, v5, 2);

  objc_msgSend(WeakRetained, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLProtocol:didLoadData:", WeakRetained, v7);

  objc_msgSend(WeakRetained, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLProtocolDidFinishLoading:", WeakRetained);

}

void __62__MFMessageURLProtocol_initWithRequest_cachedResponse_client___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLProtocol:didFailWithError:", WeakRetained, v5);

}

- (id)_cachedResponseWithData:(id)a3 mimeType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB32F0];
    -[NSURLProtocol request](self, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1008, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    if (!a5)
      goto LABEL_9;
LABEL_8:
    *a5 = objc_retainAutorelease(v17);
    goto LABEL_9;
  }
  v10 = objc_msgSend(v8, "length");
  if (v10)
    v11 = v10;
  else
    v11 = -1;
  v12 = objc_alloc(MEMORY[0x1E0CB39E8]);
  -[NSURLProtocol request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v14, v9, v11, 0);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34F0]), "initWithResponse:data:userInfo:storagePolicy:", v15, v8, 0, 2);
  v17 = 0;
  if (a5)
    goto LABEL_8;
LABEL_9:

  return v16;
}

- (void)startLoading
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  BOOL v29;
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
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id location;
  _QWORD v45[4];
  id v46;
  MFMessageURLProtocol *v47;
  _QWORD v48[4];
  id v49;
  MFMessageURLProtocol *v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  -[NSURLProtocol request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "path");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMContentRepresentation relatedContentItems](self->_contentRepresentation, "relatedContentItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __36__MFMessageURLProtocol_startLoading__block_invoke;
  v51[3] = &unk_1E5A696B0;
  v8 = v38;
  v52 = v8;
  objc_msgSend(v6, "ef_firstObjectPassingTest:", v51);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "mailDropMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0D1E130], "optionsWithRequestedRepresentationType:networkUsage:", *MEMORY[0x1E0D1DBF0], 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "completionHandlerAdapter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestRepresentationWithOptions:completionHandler:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageURLProtocol setCancelable:](self, "setCancelable:", v14);

      objc_msgSend(v12, "future");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v7;
      v48[1] = 3221225472;
      v48[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_2;
      v48[3] = &unk_1E5A69700;
      v49 = v9;
      v50 = self;
      objc_msgSend(v15, "then:", v48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMessageURLProtocol promise](self, "promise");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "finishWithFuture:", v16);

      goto LABEL_8;
    }
LABEL_7:
    -[MFMessageURLProtocol promise](self, "promise");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v53 = *MEMORY[0x1E0CB32F0];
    -[NSURLProtocol request](self, "request");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1008, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "finishWithError:", v25);

    v11 = v21;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "attachmentForContentID:preferredSchemes:", v8, &unk_1E5A9FFC8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_7;
  objc_msgSend(v11, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scheme");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("x-attach-compose"), "caseInsensitiveCompare:", v20))
  {

  }
  else
  {
    v26 = objc_msgSend(v11, "isDisplayableInline");

    if ((v26 & 1) == 0)
    {
      v45[0] = v7;
      v45[1] = 3221225472;
      v45[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_4;
      v45[3] = &unk_1E5A65430;
      v11 = v11;
      v46 = v11;
      v47 = self;
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "performBlock:", v45);

      v12 = v46;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v11, "isDisplayableInline"))
  {
    objc_msgSend(v11, "mimeType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v40[0] = v7;
    v40[1] = 3221225472;
    v40[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_5;
    v40[3] = &unk_1E5A69728;
    objc_copyWeak(&v43, &location);
    v41 = v5;
    v12 = v27;
    v42 = v12;
    objc_msgSend(v11, "setFetchCompletionBlock:", v40);
    objc_msgSend(v11, "setWantsCompletionBlockOffMainThread:", 1);
    -[MFMessageURLProtocol cancelable](self, "cancelable");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageURLProtocol.m"), 280, CFSTR("should only get here once"));

    }
    objc_msgSend(v11, "fetchData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageURLProtocol setCancelable:](self, "setCancelable:", v30);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MFMessageURLProtocol promise](self, "promise");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB32F0];
    -[NSURLProtocol request](self, "request");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "URL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1103, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v35);

  }
LABEL_8:

}

uint64_t __36__MFMessageURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __36__MFMessageURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1EEC0];
  objc_msgSend(MEMORY[0x1E0D1F070], "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__MFMessageURLProtocol_startLoading__block_invoke_3;
  v11[3] = &unk_1E5A696D8;
  v6 = v3;
  v12 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  objc_msgSend(v4, "onScheduler:futureWithBlock:", v5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __36__MFMessageURLProtocol_startLoading__block_invoke_3(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a1[4], "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v5, 8, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[5], "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredMIMEType");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = CFSTR("application/octet-stream");
    objc_msgSend(a1[6], "_cachedResponseWithData:mimeType:error:", v6, v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __36__MFMessageURLProtocol_startLoading__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[MFAttachmentImageGenerator pngDataForAttachment:](MFAttachmentImageGenerator, "pngDataForAttachment:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v7 = 0;
  objc_msgSend(v3, "_cachedResponseWithData:mimeType:error:", v2, CFSTR("image/png"), &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  objc_msgSend(*(id *)(a1 + 40), "promise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:error:", v4, v5);

}

void __36__MFMessageURLProtocol_startLoading__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (v6)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v19 = 0;
    objc_msgSend(WeakRetained, "_cachedResponseWithData:mimeType:error:", v6, v10, &v19);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v19;
    v13 = (void *)v11;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *MEMORY[0x1E0CB3388];
    v20[0] = *MEMORY[0x1E0CB32F0];
    v20[1] = v16;
    v21[0] = v15;
    v21[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1008, v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
  objc_msgSend(v9, "promise");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finishWithResult:error:", v13, v12);

}

- (void)stopLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MFMessageURLProtocol promise](self, "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB32F0];
  -[NSURLProtocol request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithError:", v8);

  -[MFMessageURLProtocol cancelable](self, "cancelable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

}

- (EFCancelable)cancelable
{
  return self->_cancelable;
}

- (void)setCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_cancelable, a3);
}

- (EFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (EMContentRepresentation)contentRepresentation
{
  return self->_contentRepresentation;
}

- (void)setContentRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_contentRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRepresentation, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
}

+ (void)canInitWithRequest:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a2, a3, "Attempting to load a request via CID without a resource specifier: %@", (uint8_t *)&v3);
}

@end
