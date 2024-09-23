@implementation MFMessageContentURLProtocol

+ (NSString)scheme
{
  return (NSString *)CFSTR("x-apple-msg-load-wk2");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x1E0CB39D0], "registerClass:", a1);
}

+ (_MFMessageContentURLProtocolRegistry)registry
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sPreferredRegistry;
  if (!sPreferredRegistry)
  {
    +[_MFMessageContentURLProtocolRegistry sharedRegistry](_MFMessageContentURLProtocolRegistry, "sharedRegistry");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sPreferredRegistry;
    sPreferredRegistry = v3;

    v2 = (void *)sPreferredRegistry;
  }
  return (_MFMessageContentURLProtocolRegistry *)v2;
}

+ (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&sPreferredRegistry, a3);
}

+ (id)URLForLoadingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "registry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForLoadingContext:scheme:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadingContextForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "registry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadingContextForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "caseInsensitiveCompare:", v7))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(a1, "loadingContextForURL:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 != 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_token, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MFMessageContentURLProtocol;
  -[NSURLProtocol dealloc](&v3, sel_dealloc);
}

- (MFMessageContentURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  MFMessageContentURLProtocol *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MFMessageLoadingContext *loadingContext;
  EFCancelationToken *v16;
  EFCancelationToken *token;
  EFPromise *v18;
  EFPromise *promise;
  void *v20;
  uint64_t v21;
  EFCancelationToken *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)MFMessageContentURLProtocol;
  v11 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v32, sel_initWithRequest_cachedResponse_client_, v8, v9, v10);
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend(v8, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadingContextForURL:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    loadingContext = v11->_loadingContext;
    v11->_loadingContext = (MFMessageLoadingContext *)v14;

    v16 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    token = v11->_token;
    v11->_token = v16;

    v18 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
    promise = v11->_promise;
    v11->_promise = v18;

    -[EFPromise future](v11->_promise, "future");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v21 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69__MFMessageContentURLProtocol_initWithRequest_cachedResponse_client___block_invoke;
    v29[3] = &unk_1E9A033D8;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v20, "addSuccessBlock:", v29);
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __69__MFMessageContentURLProtocol_initWithRequest_cachedResponse_client___block_invoke_2;
    v27[3] = &unk_1E9A03400;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v20, "addFailureBlock:", v27);
    v22 = v11->_token;
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __69__MFMessageContentURLProtocol_initWithRequest_cachedResponse_client___block_invoke_3;
    v25[3] = &unk_1E9A02D88;
    v23 = v20;
    v26 = v23;
    -[EFCancelationToken addCancelationBlock:](v22, "addCancelationBlock:", v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __69__MFMessageContentURLProtocol_initWithRequest_cachedResponse_client___block_invoke(uint64_t a1, void *a2)
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

void __69__MFMessageContentURLProtocol_initWithRequest_cachedResponse_client___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __69__MFMessageContentURLProtocol_initWithRequest_cachedResponse_client___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)_cachedResponseWithData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB39E8]);
    -[NSURLProtocol request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "length");
    MFCharsetForEncoding();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v9, CFSTR("text/html"), v10, v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34F0]), "initWithResponse:data:userInfo:storagePolicy:", v12, v6, 0, 2);
    v14 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB32F0];
  -[NSURLProtocol request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1008, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v14);
LABEL_6:

  return v13;
}

- (void)startLoading
{
  EFCancelationToken *token;
  MFMessageLoadingContext *loadingContext;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  token = self->_token;
  loadingContext = self->_loadingContext;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __43__MFMessageContentURLProtocol_startLoading__block_invoke;
  v9 = &unk_1E9A03428;
  objc_copyWeak(&v10, &location);
  -[MFMessageLoadingContext addLoadObserver:](loadingContext, "addLoadObserver:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](token, "addCancelable:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__MFMessageContentURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_didLoadContentEvent:error:", v6, v5);

}

- (void)stopLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[MFMessageContentURLProtocol promise](self, "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB32F0];
  -[NSURLProtocol request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithError:", v8);

  -[EFCancelationToken cancel](self->_token, "cancel");
}

- (void)_didLoadContentEvent:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v40;
  id v41;
  id v42;
  void (**v43)(void *, void *);
  void *v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD aBlock[4];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v40 = a4;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0D46068]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MFMessageContentURLProtocol__didLoadContentEvent_error___block_invoke;
  aBlock[3] = &unk_1E9A03450;
  v41 = v5;
  v52 = v41;
  v53 = &v54;
  v43 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v42, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v40, "mf_messageFragment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    EMLogCategoryMessageLoading();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MFMessageContentURLProtocol loadingContext](self, "loadingContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "message");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "messageID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "domain");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v40, "code");
      *(_DWORD *)buf = 138544130;
      v60 = v36;
      v61 = 2114;
      v62 = v37;
      v63 = 2048;
      v64 = v38;
      v65 = 2114;
      v66 = v8;
      _os_log_error_impl(&dword_1D56AF000, v9, OS_LOG_TYPE_ERROR, "loading message %{public}@ had error (%{public}@/%ld): fragment %{public}@", buf, 0x2Au);

    }
    if (v8)
    {
      objc_msgSend(v8, "markupString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2](v43, v10);

    }
    v7 = 0;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1D8276BC8]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v44, "attachmentForTextAttachment:error:", v14, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "fetchLocalData");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "markupStringForDisplayWithData:allowAttachmentElement:", v18, 1);
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("ShowAttachmentMarkup"));

            if (v21)
            {
              _MFShowAttachmentMarkup();
              v22 = objc_claimAutoreleasedReturnValue();

              v19 = (id)v22;
            }

            if (v19)
              v43[2](v43, v19);
          }
          else
          {
            v19 = 0;
          }
LABEL_29:

          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v14;
          objc_msgSend(v19, "htmlData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v19, "preferredCharacterSet");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = MFEncodingForCharset();
            *(_DWORD *)buf = -1;
            v25 = (void *)MFCreateStringWithData();
            if (!v25 && v24 != -1)
              v25 = (void *)MFCreateStringWithData();
            if (v25)
              v43[2](v43, v25);

          }
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v43[2](v43, v14);
LABEL_30:
        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v11);
  }

  if (!*((_BYTE *)v55 + 24))
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("NO_BODY"), &stru_1E9A04480, CFSTR("Main"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mf_stringByEscapingHTMLCodes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", CFSTR("<html dir=auto><body><i><font color=#888>%@</font></i></body></html>"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v43[2](v43, v30);
  }
  objc_msgSend(v41, "done");
  objc_msgSend(v41, "data");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  -[MFMessageContentURLProtocol _cachedResponseWithData:error:](self, "_cachedResponseWithData:error:", v31, &v46);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v46;
  -[EFPromise finishWithResult:error:](self->_promise, "finishWithResult:error:", v32, v33);

  _Block_object_dispose(&v54, 8);
}

void __58__MFMessageContentURLProtocol__didLoadContentEvent_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (EFCancelationToken)token
{
  return (EFCancelationToken *)objc_getProperty(self, a2, 32, 1);
}

- (MFMessageLoadingContext)loadingContext
{
  return (MFMessageLoadingContext *)objc_getProperty(self, a2, 40, 1);
}

- (EFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
