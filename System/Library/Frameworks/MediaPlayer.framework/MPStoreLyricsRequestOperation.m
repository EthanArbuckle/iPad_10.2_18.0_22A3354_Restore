@implementation MPStoreLyricsRequestOperation

- (MPStoreLyricsRequestOperation)init
{
  MPStoreLyricsRequestOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPStoreLyricsRequestOperation;
  v2 = -[MPAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.LyricsRequest.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)execute
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  if (-[MPStoreLyricsRequestOperation songAdamID](self, "songAdamID"))
  {
    if (!self->_operationQueue)
    {
      v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v3;

      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
      -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreLyricsRequestOperation.operationQueue"));
      v5 = self->_operationQueue;
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));

    }
    v7 = objc_alloc(MEMORY[0x1E0DDC0A0]);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentity:", v8);

    objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__MPStoreLyricsRequestOperation_execute__block_invoke;
    v12[3] = &unk_1E31638C0;
    v12[4] = self;
    objc_msgSend(v10, "getBagForRequestContext:withCompletionHandler:", v9, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3001, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MPStoreLyricsRequestOperation finishWithError:](self, "finishWithError:", v11);

  }
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreLyricsRequestOperation;
  -[MPAsyncOperation finishWithError:](&v7, sel_finishWithError_, v4);
  if (v4)
  {
    -[MPStoreLyricsRequestOperation responseHandler](self, "responseHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MPStoreLyricsRequestOperation responseHandler](self, "responseHandler");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v4);

    }
  }

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPStoreLyricsRequestOperation;
  -[MPAsyncOperation cancel](&v3, sel_cancel);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  -[MPAsyncOperation finish](self, "finish");
}

- (void)_enqueueOperationWithURL:(id)a3 storeURLBag:(id)a4 allowingAuthentication:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  MPStoreLyricsRequestOperation *v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__16651;
  v20[4] = __Block_byref_object_dispose__16652;
  v21 = 0;
  v10 = objc_alloc(MEMORY[0x1E0DDBEE8]);
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke;
  v15[3] = &unk_1E3156FE0;
  v19 = a5;
  v12 = v8;
  v16 = v12;
  v17 = self;
  v18 = v20;
  v13 = (void *)objc_msgSend(v10, "initWithStartHandler:", v15);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_5;
  v14[3] = &unk_1E3163580;
  v14[4] = self;
  v14[5] = v20;
  objc_msgSend(v13, "setCancellationHandler:", v14);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v13);

  _Block_object_dispose(v20, 8);
}

- (int64_t)songAdamID
{
  return self->_songAdamID;
}

- (void)setSongAdamID:(int64_t)a3
{
  self->_songAdamID = a3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  char v21;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_2;
  v20[3] = &__block_descriptor_33_e26_v16__0__ICRequestContext_8l;
  v21 = *(_BYTE *)(a1 + 56);
  v6 = (void *)objc_msgSend(v4, "initWithBlock:", v20);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(NSObject **)(v8 + 280);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_3;
  v14[3] = &unk_1E3156FB8;
  v18 = v3;
  v19 = v9;
  v15 = v7;
  v16 = v6;
  v17 = v8;
  v11 = v3;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, v14);

}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 280);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_6;
  block[3] = &unk_1E31639A0;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_6(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  }
}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DDC100];
  v4 = a2;
  objc_msgSend(v3, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v5);

  v6 = objc_alloc(MEMORY[0x1E0DDC0B0]);
  if (*(_BYTE *)(a1 + 32))
    v7 = 2;
  else
    v7 = 1;
  v8 = (id)objc_msgSend(v6, "initWithUserInteractionLevel:", v7);
  objc_msgSend(v4, "setAuthenticationProvider:", v8);

}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0A8]), "initWithURLRequest:requestContext:", a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_4;
  v8[3] = &unk_1E3163928;
  v7 = (void *)a1[7];
  v8[4] = a1[6];
  v9 = v7;
  objc_msgSend(v5, "enqueueDataRequest:withCompletionHandler:", v6, v8);

}

void __93__MPStoreLyricsRequestOperation__enqueueOperationWithURL_storeURLBag_allowingAuthentication___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) != 0)
  {
    goto LABEL_25;
  }
  v7 = v6;
  objc_msgSend(v5, "urlResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parsedBodyDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && objc_msgSend(v8, "statusCode") != 200)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("HTTPStatusCodeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "statusCode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3003, v19);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -3003;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "ic_intValueForKey:", CFSTR("error")) == 214)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -3005;
LABEL_9:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v7 = (id)v12;
    goto LABEL_21;
  }
  objc_msgSend(v9, "ic_stringValueForKey:", CFSTR("ttml"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_stringValueForKey:", CFSTR("lyricsId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (_NSIsNSString())
    {
      v16 = v15;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v20 = 0;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), objc_msgSend(v15, "longLongValue"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v16;
LABEL_19:
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setLyricsContent:", v14);
    objc_msgSend(v13, "setLyricsID:", v20);
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3004, 0);
  v13 = 0;
  v20 = v7;
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v13, 0);

    }
  }

LABEL_25:
}

void __40__MPStoreLyricsRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t quot;
  uint64_t v17;
  char *v18;
  lldiv_t v19;
  uint64_t v20;
  const UInt8 *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB3388];
    v32 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3002, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v10);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_lyricsURLForURLBag:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v10 = (void *)v11;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v11, 0);
      objc_msgSend(v12, "queryItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      if (!v14)
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v15 = objc_alloc(MEMORY[0x1E0CB39D8]);
      quot = objc_msgSend(*(id *)(a1 + 32), "songAdamID");
      v17 = quot;
      v18 = (char *)&v33 + 1;
      do
      {
        v19 = lldiv(quot, 10);
        quot = v19.quot;
        if (v19.rem >= 0)
          LOBYTE(v20) = v19.rem;
        else
          v20 = -v19.rem;
        *(v18 - 2) = v20 + 48;
        v21 = (const UInt8 *)(v18 - 2);
        --v18;
      }
      while (v19.quot);
      if (v17 < 0)
      {
        *(v18 - 2) = 45;
        v21 = (const UInt8 *)(v18 - 2);
      }
      v22 = (__CFString *)CFStringCreateWithBytes(0, v21, (char *)&v33 - (char *)v21, 0x8000100u, 0);
      v23 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("id"), v22);

      objc_msgSend(v14, "addObject:", v23);
      v24 = objc_alloc(MEMORY[0x1E0CB39D8]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("l"), v26);

      objc_msgSend(v14, "addObject:", v27);
      objc_msgSend(v12, "setQueryItems:", v14);
      objc_msgSend(v12, "URL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(*(id *)(a1 + 32), "_enqueueOperationWithURL:storeURLBag:allowingAuthentication:", v28, v5, 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3000, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v30);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3002, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v29);

      v10 = 0;
    }
  }

}

+ (BOOL)supportsLyricsForURLBag:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_lyricsURLForURLBag:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)_lyricsURLForURLBag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSDictionary())
    goto LABEL_8;
  objc_msgSend(v3, "objectForKey:", CFSTR("ttmlLyrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("lyrics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((_NSIsNSString() & 1) == 0)
  {

LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  if (!v4)
  {
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

@end
