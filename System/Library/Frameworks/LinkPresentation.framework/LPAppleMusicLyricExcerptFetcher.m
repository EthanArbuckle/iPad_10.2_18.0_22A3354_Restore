@implementation LPAppleMusicLyricExcerptFetcher

- (LPAppleMusicLyricExcerptFetcher)init
{
  LPAppleMusicLyricExcerptFetcher *v2;
  LPAppleMusicLyricExcerptFetcher *v3;
  LPAppleMusicLyricExcerptFetcher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPAppleMusicLyricExcerptFetcher;
  v2 = -[LPFetcher init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id completionHandler;
  _QWORD block[5];

  v5 = _Block_copy(a4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)getMPStoreLyricsSnippetRequestClass_softClass;
  v14 = getMPStoreLyricsSnippetRequestClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getMPStoreLyricsSnippetRequestClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getMPStoreLyricsSnippetRequestClass_block_invoke;
    v10[3] = &unk_1E44A7DB0;
    v10[4] = &v11;
    __getMPStoreLyricsSnippetRequestClass_block_invoke((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "init");
  objc_msgSend(v5, "setSnippetURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke_2;
  v9[3] = &unk_1E44A8B50;
  v9[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v5, "newOperationWithResponseHandler:", v9);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "start");
}

void __76__LPAppleMusicLyricExcerptFetcher_fetchWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  LPLyricExcerptMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v12)
  {
    v6 = objc_alloc_init(LPLyricExcerptMetadata);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "startTime");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setStartTime:](v6, "setStartTime:", v8);

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "endTime");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setEndTime:](v6, "setEndTime:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "language");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLyricExcerptMetadata setLanguage:](v6, "setLanguage:", v11);

    -[LPLyricExcerptMetadata setLyrics:](v6, "setLyrics:", v12);
    objc_msgSend(*(id *)(a1 + 32), "completedWithLyrics:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithLyrics:", 0);
  }

}

- (void)cancel
{
  id completionHandler;

  -[NSOperation cancel](self->_operation, "cancel");
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)completedWithLyrics:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__LPAppleMusicLyricExcerptFetcher_completedWithLyrics___block_invoke;
  v6[3] = &unk_1E44A7D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__LPAppleMusicLyricExcerptFetcher_completedWithLyrics___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void *, LPFetcherLyricsResponse *);
  uint64_t v5;
  LPFetcherLyricsResponse *v6;
  void *v7;
  LPFetcherErrorResponse *v8;
  LPFetcherLyricsResponse *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v4 = (void (**)(void *, LPFetcherLyricsResponse *))_Block_copy(v3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = -[LPFetcherLyricsResponse initWithLyrics:fetcher:]([LPFetcherLyricsResponse alloc], "initWithLyrics:fetcher:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
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
    v3 = *(void **)(v2 + 40);
  }
  *(_QWORD *)(v2 + 40) = 0;

}

- (MPStoreLyricsSnippetURLComponents)lyricComponents
{
  return self->_lyricComponents;
}

- (void)setLyricComponents:(id)a3
{
  objc_storeStrong((id *)&self->_lyricComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricComponents, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
