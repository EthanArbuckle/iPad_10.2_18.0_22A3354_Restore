@implementation NWURLLoader

- (void)start:(id)a3
{
  void (**v4)(_QWORD);
  NWURLSessionReadRequest *v5;
  NWURLSessionReadRequest *readRequest;
  NWURLSessionTaskConfiguration *v7;
  NWURLSessionTaskConfiguration *v8;
  NSURLCache *cache;
  NWURLLoaderClient *client;
  NWURLLoaderClient *v11;
  void *v12;
  NWURLLoaderClient *v13;
  _QWORD v14[5];
  id v15;

  v4 = (void (**)(_QWORD))a3;
  v5 = objc_alloc_init(NWURLSessionReadRequest);
  if (self)
  {
    readRequest = self->_readRequest;
    self->_readRequest = v5;

    v7 = self->_configuration;
    v8 = v7;
    if (v7)
    {
      -[NSURLSessionConfiguration URLCache](v7->_configuration, "URLCache");
      v7 = (NWURLSessionTaskConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    cache = self->_cache;
    self->_cache = (NSURLCache *)v7;

    client = self->_client;
  }
  else
  {

    client = 0;
  }
  v11 = client;
  -[NWURLLoaderClient loaderDataTask](v11, "loaderDataTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (self && self->_cache && v12)
  {
    v13 = self->_client;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __21__NWURLLoader_start___block_invoke;
    v14[3] = &unk_1E14ACE68;
    v14[4] = self;
    v15 = v12;
    -[NWURLLoaderClient loaderRunDelegateBlock:](v13, "loaderRunDelegateBlock:", v14);

  }
  else
  {
    -[NWURLLoader afterCacheLookup:]((uint64_t)self, 0);
  }
  v4[2](v4);

}

- (void)stop
{
  NWURLError *v3;
  void *v4;
  NWURLLoader *v5;
  id v6;
  uint64_t v7;
  NWURLLoader *v8;
  NWURLLoaderClient *client;
  NWURLLoaderClient *v10;
  _QWORD v11[5];
  objc_super v12;

  if (self)
  {
    v3 = [NWURLError alloc];
    -[NWURLLoaderClient loaderTask](self->_client, "loaderTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self;
    v6 = v4;
    if (v3)
    {
      v7 = *MEMORY[0x1E0CB32E8];
      v12.receiver = v3;
      v12.super_class = (Class)NWURLError;
      v8 = -[NWURLLoader initWithDomain:code:userInfo:](&v12, sel_initWithDomain_code_userInfo_, v7, -999, 0);
      v3 = (NWURLError *)v8;
      if (v8)
        -[NWURLLoader fillErrorForLoader:andTask:](v8, "fillErrorForLoader:andTask:", v5, v6);
    }

    -[NWURLLoader fulfillError:]((uint64_t)v5, v3);
    client = self->_client;
  }
  else
  {
    client = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __19__NWURLLoader_stop__block_invoke;
  v11[3] = &unk_1E14ACFD0;
  v11[4] = self;
  -[NWURLLoaderClient loaderRunDelegateBlock:](client, "loaderRunDelegateBlock:", v11);
  if (self)
  {
    v10 = self->_client;
    self->_client = 0;

  }
}

- (void)updateClient:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
    objc_storeStrong((id *)&self->_client, a3);

}

- (void)readResponse:(id)a3
{
  id v4;
  void *v5;
  NSURLResponse *response;
  id v7;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    v7 = v4;
    if (self->_error)
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
    else
    {
      response = self->_response;
      if (response)
        (*((void (**)(id, NSURLResponse *, _QWORD))v4 + 2))(v4, response, 0);
      else
        objc_setProperty_nonatomic_copy(self, 0, v4, 104);
    }
    v5 = v7;
  }

}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  NWURLSessionReadRequest *readRequest;

  if (self)
  {
    readRequest = self->_readRequest;
    if (readRequest)
    {
      readRequest->_minimumLength = a3;
      readRequest->_maximumLength = a4;
      objc_setProperty_nonatomic_copy(readRequest, a2, a5, 32);
      -[NWURLSessionReadRequest tryFulfillRequest]((uint64_t)readRequest);
    }
  }
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)takeCachedResponse
{
  NSCachedURLResponse *v3;
  NSCachedURLResponse *cachedResponseInternal;

  if (self)
  {
    v3 = self->_cachedResponseInternal;
    cachedResponseInternal = self->_cachedResponseInternal;
    self->_cachedResponseInternal = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  OS_nw_connection *result;

  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__NWURLLoader_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke;
  block[3] = &unk_1E14AAAA0;
  block[4] = self;
  v14 = v8;
  v15 = v7;
  v11 = v7;
  v12 = v9;
  dispatch_async(queue, block);

}

- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NWURLLoader_URLProtocol_cachedResponseIsValid___block_invoke;
  v8[3] = &unk_1E14ACE68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5
{
  id v7;
  NWURLLoaderClient *client;
  void *v9;
  unint64_t v10;
  NSURLCache *cache;
  NSURLCache *v12;
  double v13;
  NSURLCache *v14;
  double v15;
  NSURLCache *v16;
  NSURLCache *v17;
  double v18;
  NSURLCache *v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *queue;
  id v24;
  _QWORD v25[4];
  id v26;
  NWURLLoader *v27;
  unint64_t v28;
  unint64_t v29;

  v7 = a4;
  if (self)
    client = self->_client;
  else
    client = 0;
  -[NWURLLoaderClient loaderDataTask](client, "loaderDataTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = a5;
    if (!a5)
      goto LABEL_11;
    if (a5 == 1)
    {
      if (self)
        cache = self->_cache;
      else
        cache = 0;
      v12 = cache;
      v13 = (double)-[NSURLCache memoryCapacity](v12, "memoryCapacity");
      if (self)
        v14 = self->_cache;
      else
        v14 = 0;
      -[NSURLCache _maxCacheableEntrySizeRatio](v14, "_maxCacheableEntrySizeRatio");
      v10 = (unint64_t)(v15 * v13);

LABEL_11:
      if (self)
        v16 = self->_cache;
      else
        v16 = 0;
      v17 = v16;
      v18 = (double)-[NSURLCache diskCapacity](v17, "diskCapacity");
      if (self)
        v19 = self->_cache;
      else
        v19 = 0;
      -[NSURLCache _maxCacheableEntrySizeRatio](v19, "_maxCacheableEntrySizeRatio");
      v21 = (unint64_t)(v20 * v18);

      if (v10 <= v21)
        v22 = v21;
      else
        v22 = v10;
      if (self)
        goto LABEL_19;
LABEL_22:
      queue = 0;
      goto LABEL_20;
    }
  }
  v22 = 0;
  if (!self)
    goto LABEL_22;
LABEL_19:
  queue = self->_queue;
LABEL_20:
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__NWURLLoader_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke;
  v25[3] = &unk_1E14A4AD8;
  v26 = v7;
  v27 = self;
  v28 = v22;
  v29 = a5;
  v24 = v7;
  dispatch_async(queue, v25);

}

- (void)URLProtocol:(id)a3 didLoadData:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NWURLLoader_URLProtocol_didLoadData___block_invoke;
  v8[3] = &unk_1E14ACE68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)URLProtocolDidFinishLoading:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NWURLLoader_URLProtocolDidFinishLoading___block_invoke;
  block[3] = &unk_1E14ACFD0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)URLProtocol:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__NWURLLoader_URLProtocol_didFailWithError___block_invoke;
  v8[3] = &unk_1E14ACE68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke;
  v8[3] = &unk_1E14ACE68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_readRequest, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_awaitingResponse, 0);
  objc_storeStrong((id *)&self->_cachedResponseInternal, 0);
  objc_storeStrong((id *)&self->_dataToCache, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_protocolClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 32);
  else
    v2 = 0;
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_2;
  v4[3] = &unk_1E14A4B00;
  v4[4] = v1;
  v5 = v3;
  objc_msgSend(v2, "loaderDidReceiveChallenge:completionHandler:", v5, v4);

}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 32);
  else
    v8 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_3;
  v10[3] = &unk_1E14AB278;
  v13 = a2;
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v9 = v6;
  objc_msgSend(v8, "loaderRunDelegateBlock:", v10);

}

void __61__NWURLLoader_URLProtocol_didReceiveAuthenticationChallenge___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      v2 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "sender");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v2)
        objc_msgSend(v3, "useCredential:forAuthenticationChallenge:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      else
        objc_msgSend(v3, "continueWithoutCredentialForAuthenticationChallenge:", *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "sender");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performDefaultHandlingForAuthenticationChallenge:", *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "sender");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cancelAuthenticationChallenge:", *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "sender");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rejectProtectionSpaceAndContinueWithChallenge:", *(_QWORD *)(a1 + 40));
LABEL_7:

      break;
    default:
      return;
  }
}

void __44__NWURLLoader_URLProtocol_didFailWithError___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  NWURLError *v5;
  void *v6;
  id *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  objc_super v12;

  v2 = *(id **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "code");
  if (v2)
  {
    v4 = v3;
    v5 = [NWURLError alloc];
    objc_msgSend(v2[4], "loaderTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v2;
    v8 = v6;
    if (v5
      && (v9 = *MEMORY[0x1E0CB32E8],
          v12.receiver = v5,
          v12.super_class = (Class)NWURLError,
          (v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v9, v4, 0)) != 0))
    {
      v11 = v10;
      objc_msgSend(v10, "fillErrorForLoader:andTask:", v7, v8);
    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(v11, "setUnderlyingError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v11 = 0;
    objc_msgSend(0, "setUnderlyingError:", *(_QWORD *)(a1 + 40));
  }
  -[NWURLLoader fulfillError:](*(_QWORD *)(a1 + 32), v11);

}

- (void)fulfillError:(uint64_t)a1
{
  id v4;
  void *v5;
  void (**v6)(id, _QWORD, id);
  SEL v7;
  id v8;

  v4 = a2;
  if (a1)
  {
    v8 = v4;
    if (!*(_BYTE *)(a1 + 8) && !*(_QWORD *)(a1 + 128))
      objc_storeStrong((id *)(a1 + 128), a2);
    v5 = *(void **)(a1 + 104);
    if (v5)
    {
      v6 = v5;
      objc_setProperty_nonatomic_copy((id)a1, v7, 0, 104);
      v6[2](v6, 0, v8);

    }
    -[NWURLSessionReadRequest putError:](*(_QWORD *)(a1 + 120), v8);
    v4 = v8;
  }

}

void __43__NWURLLoader_URLProtocolDidFinishLoading___block_invoke(uint64_t a1)
{
  -[NWURLLoader fulfillData:complete:](*(_QWORD *)(a1 + 32), 0, 1);
}

- (void)fulfillData:(int)a3 complete:
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_data_t concat;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *data2;

  v5 = a2;
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 80);
    data2 = v5;
    if (v5)
    {
      if (v6)
      {
        v7 = v6;
        concat = dispatch_data_create_concat(v7, data2);
        v9 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = concat;

        v6 = *(NSObject **)(a1 + 80);
        if (dispatch_data_get_size(v6) > *(_QWORD *)(a1 + 96))
        {
          *(_QWORD *)(a1 + 80) = 0;

          v6 = *(NSObject **)(a1 + 80);
        }
      }
    }
    if (v6 && a3)
    {
      v10 = objc_alloc(MEMORY[0x1E0C92BF8]);
      v11 = *(void **)(a1 + 112);
      v12 = *(_QWORD *)(a1 + 72);
      v13 = *(id *)(a1 + 80);
      v14 = v11;
      v15 = objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v14, v13, 0, v12);
      v16 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v15;

      v17 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

    }
    *(_BYTE *)(a1 + 8) = a3;
    -[NWURLSessionReadRequest putData:complete:](*(_QWORD *)(a1 + 120), data2, a3);
    v5 = data2;
  }

}

void __39__NWURLLoader_URLProtocol_didLoadData___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "_createDispatchData");
  -[NWURLLoader fulfillData:complete:](v1, v2, 0);

}

void __65__NWURLLoader_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "expectedContentLength") <= *(_QWORD *)(a1 + 48))
    {
      v2 = *(_QWORD *)(a1 + 40);
      if (v2)
      {
        *(_QWORD *)(v2 + 72) = *(_QWORD *)(a1 + 56);
        v3 = *(_QWORD *)(a1 + 40);
        if (v3)
        {
          objc_storeStrong((id *)(v3 + 80), MEMORY[0x1E0C80D00]);
          v4 = *(_QWORD *)(a1 + 40);
          if (v4)
            *(_QWORD *)(v4 + 96) = *(_QWORD *)(a1 + 48);
        }
      }
    }
  }
  -[NWURLLoader fulfillResponse:](*(_QWORD **)(a1 + 40), *(void **)(a1 + 32));
}

- (void)fulfillResponse:(_QWORD *)a1
{
  void *v3;
  void (**v4)(id, id, _QWORD);
  SEL v5;
  id v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    v3 = (void *)a1[13];
    if (v3)
    {
      v4 = v3;
      objc_setProperty_nonatomic_copy(a1, v5, 0, 104);
      v4[2](v4, v7, 0);
    }
    else
    {
      v6 = v7;
      v4 = (void (**)(id, id, _QWORD))a1[14];
      a1[14] = v6;
    }

  }
}

void __49__NWURLLoader_URLProtocol_cachedResponseIsValid___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLLoader fulfillResponse:](v2, v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 32);
  else
    v5 = 0;
  objc_msgSend(v5, "loaderDataTask");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v10 = (id)v6;
  if (v6 && v7)
  {
    objc_storeStrong((id *)(v7 + 88), *(id *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "_createDispatchData");
  -[NWURLLoader fulfillData:complete:](v7, v9, 1);

}

uint64_t __67__NWURLLoader_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[4];
  return objc_msgSend(v1, "loaderWillPerformHTTPRedirection:newRequest:", a1[5], a1[6]);
}

void __19__NWURLLoader_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 64);
  else
    v3 = 0;
  objc_msgSend(v3, "stopLoading");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;

  }
}

uint64_t __21__NWURLLoader_start___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 56);
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__NWURLLoader_start___block_invoke_2;
  v6[3] = &unk_1E14A9808;
  v6[4] = v2;
  return objc_msgSend(v3, "getCachedResponseForDataTask:completionHandler:", v4, v6);
}

- (void)afterCacheLookup:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1 && !*(_QWORD *)(a1 + 128))
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__NWURLLoader_afterCacheLookup___block_invoke;
    v6[3] = &unk_1E14ACE68;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v5, "loaderRunDelegateBlock:", v6);

  }
}

void __32__NWURLLoader_afterCacheLookup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(objc_class **)(v2 + 48);
  else
    v3 = 0;
  v4 = [v3 alloc];
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[4];
  v6 = v5;
  objc_msgSend(v6, "loaderTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithTask:cachedResponse:client:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    objc_storeStrong((id *)(v9 + 64), v8);

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 64);
  else
    v11 = 0;
  objc_msgSend(v11, "startLoading");
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    if (*(_QWORD *)(v12 + 64))
      return;
    v13 = *(NSObject **)(v12 + 40);
  }
  else
  {
    v13 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NWURLLoader_afterCacheLookup___block_invoke_2;
  block[3] = &unk_1E14ACFD0;
  block[4] = v12;
  dispatch_async(v13, block);
}

void __32__NWURLLoader_afterCacheLookup___block_invoke_2(uint64_t a1)
{
  id *v1;
  NWURLError *v2;
  void *v3;
  id *v4;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    v2 = [NWURLError alloc];
    objc_msgSend(v1[4], "loaderTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v1;
    v5 = v3;
    if (v2
      && (v6 = *MEMORY[0x1E0CB32E8],
          v8.receiver = v2,
          v8.super_class = (Class)NWURLError,
          (v7 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v6, -999, 0)) != 0))
    {
      objc_msgSend(v7, "fillErrorForLoader:andTask:", v4, v5);
    }
    else
    {
      v7 = 0;
    }

    -[NWURLLoader fulfillError:]((uint64_t)v4, v7);
  }
  else
  {

  }
}

void __21__NWURLLoader_start___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 40);
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__NWURLLoader_start___block_invoke_3;
  v7[3] = &unk_1E14ACE68;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __21__NWURLLoader_start___block_invoke_3(uint64_t a1)
{
  -[NWURLLoader afterCacheLookup:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (id)initWithRequest:(void *)a3 configuration:(void *)a4 queue:(void *)a5 client:(void *)a6 protocolClass:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)NWURLLoader;
    a1 = (id *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      objc_msgSend(a6, "canonicalRequestForRequest:", v11);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = a1[2];
      a1[2] = (id)v15;

      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a4);
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

void __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke(id *a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id *v11;
  NSObject *v12;
  id v13;
  id *v14;
  _QWORD v15[4];
  id *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (id *)a1[4];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a1[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(a1[6], "loaderTask");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "canInitWithTask:", v9);

        if (v10)
        {
          v11 = -[NWURLLoader initWithRequest:configuration:queue:client:protocolClass:]((id *)[NWURLLoader alloc], a1[7], a1[8], a1[9], a1[6], v8);

          v2 = v11;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke_2;
  v15[3] = &unk_1E14ACE18;
  v12 = a1[9];
  v13 = a1[10];
  v16 = v2;
  v17 = v13;
  v14 = v2;
  dispatch_async(v12, v15);

}

uint64_t __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
