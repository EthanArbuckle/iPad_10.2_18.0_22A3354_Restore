@implementation MPStoreLyricsMusicKitRequestOperation

- (MPStoreLyricsMusicKitRequestOperation)init
{
  MPStoreLyricsMusicKitRequestOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPStoreLyricsMusicKitRequestOperation;
  v2 = -[MPAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.LyricsMusicKitRequest.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)execute
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  if (-[MPStoreLyricsMusicKitRequestOperation songAdamID](self, "songAdamID"))
  {
    if (!self->_operationQueue)
    {
      v3 = (NSOperationQueue *)objc_opt_new();
      operationQueue = self->_operationQueue;
      self->_operationQueue = v3;

      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
      -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreLyricsMusicKitRequestOperation.operationQueue"));
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", objc_msgSend(v5, "qualityOfService"));

    }
    v6 = objc_alloc(MEMORY[0x1E0DDC0A0]);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithIdentity:", v7);

    objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__MPStoreLyricsMusicKitRequestOperation_execute__block_invoke;
    v11[3] = &unk_1E31638C0;
    v11[4] = self;
    objc_msgSend(v9, "getBagForRequestContext:withCompletionHandler:", v8, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3001, CFSTR("No adam ID provided"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[MPStoreLyricsMusicKitRequestOperation finishWithError:](self, "finishWithError:", v10);

  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MPStoreLyricsMusicKitRequestOperation;
  -[MPAsyncOperation cancel](&v13, sel_cancel);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3008, CFSTR("Operation was cancelled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSOperationQueue operations](self->_operationQueue, "operations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "finishWithError:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[MPStoreLyricsMusicKitRequestOperation finishWithError:](self, "finishWithError:", v3);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreLyricsMusicKitRequestOperation;
  -[MPAsyncOperation finishWithError:](&v7, sel_finishWithError_, v4);
  if (v4)
  {
    -[MPStoreLyricsMusicKitRequestOperation responseHandler](self, "responseHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MPStoreLyricsMusicKitRequestOperation responseHandler](self, "responseHandler");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v4);

    }
  }

}

- (void)_enqueueOperationWithURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  id v15[2];
  id location;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__50429;
  v17[4] = __Block_byref_object_dispose__50430;
  v18 = 0;
  v5 = -[NSOperationQueue qualityOfService](self->_operationQueue, "qualityOfService");
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0DDBEE8]);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke;
  v12[3] = &unk_1E3163978;
  objc_copyWeak(v15, &location);
  v8 = v4;
  v13 = v8;
  v14 = v17;
  v15[1] = v5;
  v9 = (void *)objc_msgSend(v6, "initWithStartHandler:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_5;
  v10[3] = &unk_1E31639C8;
  objc_copyWeak(&v11, &location);
  v10[4] = v17;
  objc_msgSend(v9, "setCancellationHandler:", v10);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);

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

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v3, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFA8]), "initWithBlock:", &__block_literal_global_50435);
    objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WeakRetained[35];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_3;
    v12[3] = &unk_1E3163950;
    v8 = *(_QWORD *)(a1 + 40);
    v13 = v6;
    v14 = v5;
    v9 = *(_QWORD *)(a1 + 56);
    v17 = v8;
    v18 = v9;
    v15 = WeakRetained;
    v16 = v3;
    v10 = v5;
    v11 = v6;
    dispatch_async(v7, v12);

  }
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_5(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained[35];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_6;
  block[3] = &unk_1E31639A0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_6(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  }
}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFB0]), "initWithURLRequest:requestContext:", a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0DDC0F0], "sharedSessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionWithQualityOfService:", a1[9]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_4;
  v9[3] = &unk_1E3163928;
  v8 = (void *)a1[7];
  v9[4] = a1[6];
  v10 = v8;
  objc_msgSend(v6, "enqueueDataRequest:withCompletionHandler:", v7, v9);

}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3007, CFSTR("Data request error"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7);
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v5, "urlResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parsedBodyDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "statusCode") == 200)
    {
      if (v8)
      {
        objc_msgSend(v8, "ic_arrayValueForKey:", CFSTR("data"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ic_dictionaryValueForKey:", CFSTR("attributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ic_stringValueForKey:", CFSTR("ttml"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ic_dictionaryValueForKey:", CFSTR("playParams"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ic_stringValueForKey:", CFSTR("id"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v21 = v9;
          v14 = (void *)objc_opt_new();
          objc_msgSend(v14, "setLyricsContent:", v11);
          objc_msgSend(v14, "setLyricsID:", v13);
          objc_msgSend(*(id *)(a1 + 32), "responseHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(*(id *)(a1 + 32), "responseHandler");
            v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v14, 0);

          }
          objc_msgSend(*(id *)(a1 + 32), "finish");
          v9 = v21;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3004, CFSTR("Couldn't find ttml property in received response dictionary"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v14);
          objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v14);
        }

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3003, CFSTR("Invalid response dictionary received"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v23 = CFSTR("HTTPStatusCodeKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "statusCode"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3003, v19, CFSTR("Invalid response status code received"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v20);
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v20);

LABEL_16:
    goto LABEL_17;
  }
LABEL_18:

}

void __66__MPStoreLyricsMusicKitRequestOperation__enqueueOperationWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  ICBundleIdentifierForSystemApplicationType();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDBEF8], "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:", v6, CFSTR("1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientInfo:", v3);
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentityStore:", v4);

  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentity:", v5);

}

void __48__MPStoreLyricsMusicKitRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3002, CFSTR("Failed to load bag for activeAccount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "finishWithError:", v7);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_lyricsURLForURLBag:identifier:", v11, objc_msgSend(*(id *)(a1 + 32), "songAdamID"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 32);
      if (v8)
      {
        v7 = (void *)v8;
        objc_msgSend(v9, "_enqueueOperationWithURL:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPStoreLyricsRequestErrorDomain"), -3002, CFSTR("Failed to generate Lyrics URL from bag values and identifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "finishWithError:", v10);

        v7 = 0;
      }
    }

  }
}

+ (BOOL)supportsLyricsForURLBag:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_lyricsURLForURLBag:identifier:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)_lyricsURLForURLBag:(id)a3 identifier:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  int64_t quot;
  lldiv_t v10;
  uint64_t v11;
  const UInt8 *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "stringForBagKey:", *MEMORY[0x1E0DDBE78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (char *)&v25 + 1;
    quot = a4;
    do
    {
      v10 = lldiv(quot, 10);
      quot = v10.quot;
      if (v10.rem >= 0)
        LOBYTE(v11) = v10.rem;
      else
        v11 = -v10.rem;
      *(v8 - 2) = v11 + 48;
      v12 = (const UInt8 *)(v8 - 2);
      --v8;
    }
    while (v10.quot);
    if (a4 < 0)
    {
      *(v8 - 2) = 45;
      v12 = (const UInt8 *)(v8 - 2);
    }
    v13 = (__CFString *)CFStringCreateWithBytes(0, v12, (char *)&v25 - (char *)v12, 0x8000100u, 0);
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@%@/%@%@"), CFSTR("/v1/catalog"), v6, CFSTR("/songs"), v13, CFSTR("/syllable-lyrics"));
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3998];
    MusicURLWithPathUsingURLBag(v14, v5, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsWithURL:resolvingAgainstBaseURL:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    MusicURLQueryItemLanguageWithURLBag(v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v17, "queryItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19)
        v19 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v19, "arrayByAddingObject:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setQueryItems:", v21);

    }
    objc_msgSend(v17, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "countryCode not found in bag", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

@end
