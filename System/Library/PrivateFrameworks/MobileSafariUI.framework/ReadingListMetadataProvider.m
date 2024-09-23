@implementation ReadingListMetadataProvider

- (ReadingListMetadataProvider)init
{
  ReadingListMetadataProvider *v2;
  ReadingListMetadataProvider *v3;
  ReadingListMetadataProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ReadingListMetadataProvider;
  v2 = -[ReadingListMetadataProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)fetchMetadataForBookmark:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke;
  v20 = &unk_1E9CF4E10;
  v7 = v5;
  v21 = v7;
  v8 = v6;
  v22 = v8;
  v9 = (void (**)(void *, _QWORD))_Block_copy(&v17);
  if (objc_msgSend(MEMORY[0x1E0D4EF88], "hasSharedSiteMetadataManager", v17, v18, v19, v20))
  {
    v10 = objc_alloc(MEMORY[0x1E0D8A9F0]);
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithURL:", v13);

    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "registerOneTimeRequest:priority:responseHandler:", v14, 2, v9);

  }
  else
  {
    v9[2](v9, 0);
  }

}

void __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  objc_msgSend(MEMORY[0x1E0D8A9E8], "unpackMetadataFromResponse:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v5, "platformImage");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "safari_readingListThumbnailImageDataWithCGImage:", objc_msgSend(v8, "CGImage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_2;
    v12[3] = &unk_1E9CF4DE8;
    v15 = *(id *)(a1 + 40);
    v13 = v4;
    v14 = v9;
    v11 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_cold_1(a1, v10);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_16;
    block[3] = &unk_1E9CF1950;
    v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v17;
  }

}

uint64_t __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *, void *, _QWORD))(v2 + 16))(v2, 1, v7, v3, v6, *(_QWORD *)(a1 + 40));

}

void __67__ReadingListMetadataProvider_fetchMetadataForBookmark_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v2, "identifier");
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Error fetching metadata for Reading List item %d", (uint8_t *)v4, 8u);

}

@end
