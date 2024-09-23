@implementation AAURLProtocol

- (AAURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAURLProtocol *v12;
  AAURLProtocol *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLProtocol.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v16.receiver = self;
  v16.super_class = (Class)AAURLProtocol;
  v12 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v16, sel_initWithRequest_cachedResponse_client_, v9, v10, v11);
  v13 = v12;
  if (v12)
    v12->_state = 0;

  return v13;
}

- (id)_normalizedRequestForURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLProtocol.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  -[NSURLProtocol request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setURL:", v5);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AAURLProtocol.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:options:", CFSTR("x-appleaccount"), 1) == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AAURLProtocol;
  return objc_msgSendSuper2(&v5, sel_requestIsCacheEquivalent_toRequest_, a3, a4);
}

- (void)startLoading
{
  void *v3;
  void *v5;
  _QWORD v6[5];

  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLProtocol.m"), 74, CFSTR("%s Called with an active request!"), "-[AAURLProtocol startLoading]");

  }
  self->_state = 1;
  +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AAURLProtocol_startLoading__block_invoke;
  v6[3] = &unk_1E416FF60;
  v6[4] = self;
  objc_msgSend(v3, "_configurationAndResponseWithCompletion:", v6);

}

void __29__AAURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  if (v19)
  {
    objc_msgSend(v9, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_endpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "urlForEndpoint:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 32);
    if (v13)
    {
      objc_msgSend(v14, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v16, "setURL:", v13);
      objc_msgSend(*(id *)(a1 + 32), "client");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLProtocol:wasRedirectedToRequest:redirectResponse:", *(_QWORD *)(a1 + 32), v16, v7);
    }
    else
    {
      objc_msgSend(v14, "client");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4401);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLProtocol:didFailWithError:", v18, v17);
    }

  }
  else
  {
    objc_msgSend(v9, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v8);
  }

}

- (void)stopLoading
{
  void *v4;

  if (self->_state != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLProtocol.m"), 96, CFSTR("%s Called without an active request!"), "-[AAURLProtocol stopLoading]");

  }
  self->_state = 2;
}

@end
