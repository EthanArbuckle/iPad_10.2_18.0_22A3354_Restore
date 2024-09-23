@implementation LPMediaAssetFetcher

- (LPMediaAssetFetcher)init
{
  LPMediaAssetFetcher *v2;
  LPMediaAssetFetcher *v3;
  LPMediaAssetFetcher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPMediaAssetFetcher;
  v2 = -[LPFetcher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldDownloadIfPossible = 1;
    v4 = v2;
  }

  return v3;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id completionHandler;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  self->_loadingIsNonAppInitiated = objc_msgSend(v6, "loadingIsNonAppInitiated");
  v8 = _Block_copy(v7);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v8;

  self->_fetchIsNotUserInitiated = objc_msgSend(v6, "fetchIsNotUserInitiated");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__LPMediaAssetFetcher_fetchWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__LPMediaAssetFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveVideo");
}

- (void)_resolveVideo
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  LPVideo *v6;
  void *v7;
  LPVideo *v8;
  NSObject *v9;
  LPVideo *v10;
  void *v11;
  void *v12;
  LPVideo *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  AVURLAsset *v18;
  AVURLAsset *asset;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[LPMediaAssetFetcher URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPMediaAssetFetcher URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[LPPresentationSpecializations isYouTubeEmbedURL:](LPPresentationSpecializations, "isYouTubeEmbedURL:", v4);

    if (v5)
    {
      self->_hasAudio = 1;
      v6 = [LPVideo alloc];
      -[LPMediaAssetFetcher URL](self, "URL");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      -[LPMediaAssetFetcher videoProperties](self, "videoProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[LPVideo initWithYouTubeURL:properties:](v6, "initWithYouTubeURL:properties:", v23, v7);
      -[LPMediaAssetFetcher _completedWithVideo:](self, "_completedWithVideo:", v8);

    }
    else if (self->_fetchIsNotUserInitiated)
    {
      v9 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v25 = -[LPFetcher _loggingID](self, "_loggingID");
        _os_log_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_DEFAULT, "LPMediaAssetFetcher<%d>: forcing video to stream instead of downloading", buf, 8u);
      }

      v10 = [LPVideo alloc];
      -[LPMediaAssetFetcher URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMediaAssetFetcher videoProperties](self, "videoProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[LPVideo initWithStreamingURL:properties:](v10, "initWithStreamingURL:properties:", v11, v12);
      -[LPMediaAssetFetcher _completedWithVideo:](self, "_completedWithVideo:", v13);

    }
    else
    {
      -[LPMediaAssetFetcher URL](self, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "overrideURLForMediaURL:", v14);
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v17;
      }
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v14);
      v18 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();
      asset = self->_asset;
      self->_asset = v18;

      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVURLAsset resourceLoader](self->_asset, "resourceLoader");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "installCustomMediaLoader:", v22);

      }
      -[AVURLAsset loadValuesAsynchronouslyForKeys:completionHandler:](self->_asset, "loadValuesAsynchronouslyForKeys:completionHandler:");

    }
  }
  else
  {
    -[LPMediaAssetFetcher _completedWithVideo:](self, "_completedWithVideo:", 0);
  }
}

void __36__LPMediaAssetFetcher__resolveVideo__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__LPMediaAssetFetcher__resolveVideo__block_invoke_2;
  v4[3] = &unk_1E44A7D10;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __36__LPMediaAssetFetcher__resolveVideo__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  char v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  LPVideo *v20;
  void *v21;
  void *v22;
  LPVideo *v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "statusOfValueForKey:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), 0) != 2)
        {
          objc_msgSend(*(id *)(a1 + 40), "_completedWithVideo:", 0);

          return;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v3)
        continue;
      break;
    }
  }

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "isPlayable");
  v7 = *(id **)(a1 + 40);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7[6], "tracksWithMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = objc_msgSend(v8, "count") != 0;

    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    if (v10 && (objc_msgSend(v10, "duration"), v9 = *(_QWORD *)(a1 + 40), (v24 & 0x1D) == 1) && *(_BYTE *)(v9 + 90))
    {
      objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "installCustomURLSessionLoader:", v11);

      }
      objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v11, *(_QWORD *)(a1 + 40), 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(void **)(v15 + 72);
      *(_QWORD *)(v15 + 72) = v14;

      objc_msgSend(*(id *)(a1 + 40), "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_lp_requestWithAttribution:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 88));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "dataTaskWithRequest:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");

    }
    else
    {
      v20 = [LPVideo alloc];
      objc_msgSend(*(id *)(a1 + 40), "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "videoProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[LPVideo initWithStreamingURL:properties:](v20, "initWithStreamingURL:properties:", v21, v22);
      objc_msgSend((id)v9, "_completedWithVideo:", v23);

    }
  }
  else
  {
    objc_msgSend(v7, "_completedWithVideo:", 0);
  }
}

- (void)stopLoading
{
  -[AVURLAsset cancelLoading](self->_asset, "cancelLoading");
  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
}

- (void)cancel
{
  AVURLAsset *asset;
  id completionHandler;

  -[LPMediaAssetFetcher stopLoading](self, "stopLoading");
  asset = self->_asset;
  self->_asset = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)_completedWithVideo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[LPMediaAssetFetcher stopLoading](self, "stopLoading");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__LPMediaAssetFetcher__completedWithVideo___block_invoke;
  v6[3] = &unk_1E44A7D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __43__LPMediaAssetFetcher__completedWithVideo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void (**v4)(void *, LPFetcherVideoResponse *);
  uint64_t v5;
  LPFetcherVideoResponse *v6;
  void *v7;
  LPFetcherErrorResponse *v8;
  LPFetcherVideoResponse *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 40);
  if (v3)
  {
    v4 = (void (**)(void *, LPFetcherVideoResponse *))_Block_copy(v3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = -[LPFetcherVideoResponse initWithVideo:fetcher:]([LPFetcherVideoResponse alloc], "initWithVideo:fetcher:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v7 = v6;
    }
    else
    {
      v8 = [LPFetcherErrorResponse alloc];
      makeLPError(2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[LPFetcherErrorResponse initWithError:fetcher:](v8, "initWithError:fetcher:", v7, *(_QWORD *)(a1 + 32));
    }
    v9 = v6;
    v4[2](v4, v6);
    if (!v5)

    v2 = *(_QWORD *)(a1 + 32);
  }
  v10 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

- (void)_completedWithAudio:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[LPMediaAssetFetcher stopLoading](self, "stopLoading");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__LPMediaAssetFetcher__completedWithAudio___block_invoke;
  v6[3] = &unk_1E44A7D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __43__LPMediaAssetFetcher__completedWithAudio___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  LPFetcherAudioResponse *v4;
  void *v5;
  LPFetcherErrorResponse *v6;
  LPFetcherAudioResponse *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = -[LPFetcherAudioResponse initWithAudio:fetcher:]([LPFetcherAudioResponse alloc], "initWithAudio:fetcher:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v5 = v4;
    }
    else
    {
      v6 = [LPFetcherErrorResponse alloc];
      makeLPError(2, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[LPFetcherErrorResponse initWithError:fetcher:](v6, "initWithError:fetcher:", v5, *(_QWORD *)(a1 + 32));
    }
    v7 = v4;
    (*(void (**)(uint64_t, LPFetcherAudioResponse *))(v2 + 16))(v2, v4);
    if (!v3)

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (id)videoProperties
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "videoPropertiesForFetcher:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasAudio:", self->_hasAudio);
  return v3;
}

- (id)audioProperties
{
  return (id)objc_msgSend((id)objc_opt_class(), "audioPropertiesForFetcher:", self);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  NSMutableData *v12;
  NSMutableData *receivedData;
  NSString *v14;
  NSString *MIMEType;
  id v16;

  v16 = a4;
  v9 = a5;
  v10 = (void (**)(id, uint64_t))a6;
  if (objc_msgSend(v16, "countOfBytesExpectedToReceive") <= 10485760
    && objc_msgSend(v16, "countOfBytesReceived") <= 10485760)
  {
    v12 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    receivedData = self->_receivedData;
    self->_receivedData = v12;

    objc_msgSend(v9, "MIMEType");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    MIMEType = self->_MIMEType;
    self->_MIMEType = v14;

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v10[2](v10, v11);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (objc_msgSend(v8, "countOfBytesExpectedToReceive") <= 10485760
    && objc_msgSend(v8, "countOfBytesReceived") <= 10485760)
  {
    -[NSMutableData appendData:](self->_receivedData, "appendData:", v7);
  }
  else
  {
    objc_msgSend(v8, "cancel");
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__LPMediaAssetFetcher_URLSession_task_didCompleteWithError___block_invoke;
  v8[3] = &unk_1E44A7D10;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __60__LPMediaAssetFetcher_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  LPVideo *v8;
  void *v9;
  LPVideo *v10;
  _BYTE *v11;
  LPAudio *v12;
  void *v13;
  LPVideo *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  LPVideo *v18;
  id v19;
  id v20;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 40)
      || !objc_msgSend(*(id *)(v1 + 80), "length")
      || (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length") > 0xA00000;
    v4 = +[LPMIMETypeRegistry isHLSType:](LPMIMETypeRegistry, "isHLSType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      *(_BYTE *)(v5 + 56) = 1;
LABEL_9:
      v7 = *(void **)(a1 + 32);
      v8 = [LPVideo alloc];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "videoProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[LPVideo initWithStreamingURL:properties:](v8, "initWithStreamingURL:properties:", v20, v9);
      objc_msgSend(v7, "_completedWithVideo:", v10);
LABEL_10:

LABEL_11:
      return;
    }
    objc_msgSend(*(id *)(v5 + 48), "tracksWithMediaCharacteristic:", *MEMORY[0x1E0C8A788]);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v19, "count");

    if (v6)
    {
      if (!v3)
      {
        v13 = *(void **)(a1 + 32);
        v14 = [LPVideo alloc];
        v15 = *(_QWORD **)(a1 + 32);
        v16 = v15[10];
        v17 = v15[8];
        objc_msgSend(v15, "videoProperties");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v18 = -[LPVideo initWithData:MIMEType:properties:](v14, "initWithData:MIMEType:properties:", v16, v17);
        objc_msgSend(v13, "_completedWithVideo:", v18);

        goto LABEL_11;
      }
      goto LABEL_9;
    }
    v11 = *(_BYTE **)(a1 + 32);
    if (v11[56])
    {
      v12 = [LPAudio alloc];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "audioProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[LPAudio initWithStreamingURL:properties:](v12, "initWithStreamingURL:properties:", v20, v9);
      objc_msgSend(v11, "_completedWithAudio:", v10);
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "_completedWithVideo:", 0);
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (BOOL)shouldDownloadIfPossible
{
  return self->_shouldDownloadIfPossible;
}

- (void)setShouldDownloadIfPossible:(BOOL)a3
{
  self->_shouldDownloadIfPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
