@implementation LPStocksMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 4096;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  LPStocksMetadata *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[LPPresentationSpecializations isStockSymbolURL:](LPPresentationSpecializations, "isStockSymbolURL:", v9);

  if (v10)
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    v12 = objc_alloc_init(LPStocksMetadata);
    objc_msgSend(v7, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setCombinedTitle:](v12, "setCombinedTitle:", v13);

    objc_msgSend(v7, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "rangeOfString:options:", CFSTR(" · "), 4);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || v16 + v15 == objc_msgSend(v14, "length"))
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v14, "substringFromIndex:");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringToIndex:", v16);
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
      v17 = (void *)v18;
    }
    -[LPStocksMetadata setTitle:](v12, "setTitle:", v14);
    -[LPStocksMetadata setSubtitle:](v12, "setSubtitle:", v17);
    objc_msgSend(v7, "icon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setIcon:](v12, "setIcon:", v20);

    LPLocalizedString(CFSTR("Stocks"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setFootnote:](v12, "setFootnote:", v21);

    objc_msgSend(v11, "setSpecialization:", v12);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __119__LPStocksMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke;
    v24[3] = &unk_1E44A7E78;
    v25 = v11;
    v26 = v8;
    v22 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v24);

  }
  return v10;
}

uint64_t __119__LPStocksMetadataProviderSpecialization_generateSpecializedMetadataForCompleteMetadata_withContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
