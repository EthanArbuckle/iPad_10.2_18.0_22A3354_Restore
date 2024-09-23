@implementation NUBundledArticleDataProvider

- (NUBundledArticleDataProvider)initWithArticle:(id)a3 embedDataManager:(id)a4 linkedContentManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  NUBundledArticleDataProvider *v12;
  NUBundledArticleDataProvider *v13;
  uint64_t v14;
  NSArray *linkedContentProviders;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NUBundledArticleDataProvider;
  v12 = -[NUBundledArticleDataProvider init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_article, a3);
    objc_storeStrong((id *)&v13->_embedDataManager, a4);
    objc_storeStrong((id *)&v13->_linkedContentManager, a5);
    objc_msgSend(v11, "linkedContentProviders");
    v14 = objc_claimAutoreleasedReturnValue();
    linkedContentProviders = v13->_linkedContentProviders;
    v13->_linkedContentProviders = (NSArray *)v14;

  }
  return v13;
}

- (void)performBlockForFontsInBundle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  NUBundledArticleDataProvider *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  -[NUBundledArticleDataProvider article](self, "article");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localDraftPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "pathExtension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ttf")) & 1) != 0
          || objc_msgSend(v15, "isEqualToString:", CFSTR("otf")))
        {
          v16 = (void *)MEMORY[0x24BDBCF48];
          -[NUBundledArticleDataProvider article](v23, "article");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "headline");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localDraftPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "fileURLWithPath:isDirectory:", v20, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v4[2](v4, v21);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

}

- (void)loadContextWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NUBundledArticleDataProvider embedDataManager](self, "embedDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke;
  v7[3] = &unk_24D5A2158;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadEmbedDataWithCompletion:", v7);

}

void __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  dispatch_get_global_queue(-2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_24D5A2158;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v2 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(*(id *)(a1 + 32), "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localDraftPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("article.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v2, "dataWithContentsOfFile:options:error:", v6, 0, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_3;
  v12[3] = &unk_24D5A1A28;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v7;
  v14 = v9;
  v15 = v10;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(*(id *)(a1 + 40), "article");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "headline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "articleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nss_NewsURLForArticleID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x24BE906C8]);
    objc_msgSend(*(id *)(a1 + 40), "article");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "articleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithIdentifier:shareURL:JSONData:resourceDataSource:host:error:", v9, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_4;
    v21[3] = &unk_24D5A3BA8;
    v24 = *(id *)(a1 + 48);
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 40);
    v22 = v11;
    v23 = v12;
    v13 = (void *)MEMORY[0x2199FC190](v21);
    objc_msgSend(*(id *)(a1 + 40), "linkedContentManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(a1 + 40), "linkedContentManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "article");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "headline");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 & 1) != 0)
      v19 = (id)objc_msgSend(v16, "loadLinkedContentForHeadline:withContext:priority:completion:", v18, v11, 0, v13);
    else
      v20 = (id)objc_msgSend(v16, "loadLinkedContentForHeadline:withContext:completion:", v18, v11, v13);

  }
}

uint64_t __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (NSString)articleID
{
  void *v2;
  void *v3;

  -[NUBundledArticleDataProvider article](self, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)registerFontsWithCompletion:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[NUBundledArticleDataProvider performBlockForFontsInBundle:](self, "performBlockForFontsInBundle:", &__block_literal_global_15);
  v4[2]();

}

BOOL __60__NUBundledArticleDataProvider_registerFontsWithCompletion___block_invoke(int a1, CFURLRef fontURL)
{
  return CTFontManagerRegisterFontsForURL(fontURL, kCTFontManagerScopeProcess, 0);
}

- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    dispatch_get_global_queue(-32768, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke;
    block[3] = &unk_24D5A1A28;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(v6, "loadingBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "loadingBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0);

    }
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

  return 0;
}

void __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLForBundleURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "size");
  +[NUANFImageResolver imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:](NUANFImageResolver, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", v4, 0, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke_2;
  block[3] = &unk_24D5A1A28;
  v8 = *(id *)(a1 + 40);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "loadingBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadingBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v6[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NUBundledArticleDataProvider_fileURLForURL_onCompletion_onError___block_invoke;
  block[3] = &unk_24D5A3BA8;
  v12 = v7;
  v13 = v8;
  block[4] = self;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __67__NUBundledArticleDataProvider_fileURLForURL_onCompletion_onError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "fileURLForBundleURL:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)embedForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUBundledArticleDataProvider embedDataManager](self, "embedDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "embedForType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fileURLForBundleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NUBundledArticleDataProvider article](self, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localDraftPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (FCArticle)article
{
  return self->_article;
}

- (NSArray)linkedContentProviders
{
  return self->_linkedContentProviders;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
}

- (NUEmbedDataManager)embedDataManager
{
  return self->_embedDataManager;
}

- (NULinkedContentManager)linkedContentManager
{
  return self->_linkedContentManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentManager, 0);
  objc_storeStrong((id *)&self->_embedDataManager, 0);
  objc_storeStrong((id *)&self->_linkedContentProviders, 0);
  objc_storeStrong((id *)&self->_article, 0);
}

@end
