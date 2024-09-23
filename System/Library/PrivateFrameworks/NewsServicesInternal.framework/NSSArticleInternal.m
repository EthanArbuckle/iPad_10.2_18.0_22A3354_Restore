@implementation NSSArticleInternal

+ (void)articleFromNotification:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("news"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  objc_msgSend(v5, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v13)
  {
    v14 = v13;
    v34 = 0;
    v35 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v37;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("thumbnail-attachment"));

        if (v20)
        {
          objc_msgSend(v18, "URL");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v15;
          v15 = (void *)v21;
        }
        else
        {
          objc_msgSend(v18, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("publisherLogo-attachment"));

          if (v24)
          {
            objc_msgSend(v18, "URL");
            v25 = objc_claimAutoreleasedReturnValue();
            v22 = v35;
            v35 = (void *)v25;
          }
          else
          {
            objc_msgSend(v18, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("publisherLogoMask-attachment"));

            if (!v27)
              continue;
            objc_msgSend(v18, "URL");
            v28 = objc_claimAutoreleasedReturnValue();
            v22 = v34;
            v34 = (void *)v28;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v14)
        goto LABEL_17;
    }
  }
  v34 = 0;
  v35 = 0;
  v15 = 0;
LABEL_17:

  objc_msgSend(a1, "articleFromNotificationUserInfo:thumbnailFileURL:publisherLogoFileURL:publisherLogoMaskFileURL:completion:", v29, v15, v35, v34, v32);
}

+ (void)articleFromNotificationUserInfo:(id)a3 thumbnailFileURL:(id)a4 publisherLogoFileURL:(id)a5 publisherLogoMaskFileURL:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, void *);
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  void (**v38)(id, void *);

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ti"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pd"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  if (v21 <= 0.0)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pn"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("td"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v13)
    {
      v34 = 0;
      if (v14)
        goto LABEL_9;
      goto LABEL_11;
    }
    objc_msgSend((id)objc_opt_class(), "imageWithURL:", v13);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v23;
  if (v14)
  {
LABEL_9:
    objc_msgSend((id)objc_opt_class(), "imageWithURL:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_11:
  v24 = 0;
LABEL_12:
  v32 = v15;
  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "imageWithURL:", v15);
    v25 = v18;
    v26 = v17;
    v27 = v16;
    v28 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "imageWithRenderingMode:", 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v28;
    v16 = v27;
    v17 = v26;
    v18 = v25;
  }
  v30 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:", v34, v17, v18, v31, v35, v24, v15);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v16)
      v16[2](v16, v30);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __128__NSSArticleInternal_articleFromNotificationUserInfo_thumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_completion___block_invoke;
    block[3] = &unk_1E9BDCAF0;
    v38 = v16;
    v37 = v30;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __128__NSSArticleInternal_articleFromNotificationUserInfo_thumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (id)imageWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "startAccessingSecurityScopedResource"))
  {
    v5 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)coreSpotlightIdentifierRepresentsArticleIdentifier:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("A"));
}

+ (void)_articleFromCoreSpotlightIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2;
    block[3] = &unk_1E9BDCBB8;
    v13 = &v15;
    v15 = v9;
    v16 = v8;
    v18 = a1;
    v17 = v11;
    dispatch_async(v12, block);

LABEL_6:
    goto LABEL_7;
  }
  if (v10)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke;
    v19[3] = &unk_1E9BDCB18;
    v13 = &v20;
    v20 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v19);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), CFSTR("domainIdentifier"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:attributes:", v2, &unk_1E9BE0C88);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = (void *)v19[5];
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_23;
  v12[3] = &unk_1E9BDCB40;
  v14 = v16;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v15 = v6;
  objc_msgSend(v3, "setFoundItemsHandler:", v12);
  v7 = (void *)v19[5];
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2_27;
  v8[3] = &unk_1E9BDCB90;
  v9 = *(id *)(a1 + 48);
  v10 = v16;
  v11 = &v18;
  objc_msgSend(v7, "setCompletionHandler:", v8);
  objc_msgSend((id)v19[5], "start");

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

}

void __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && objc_msgSend(v3, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "uniqueIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

            if (v12)
            {
              objc_msgSend(v10, "attributeSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "title");
              v14 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "attributeSet");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "contentDescription");
              v16 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "attributeSet");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "contentCreationDate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "attributeSet");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "namedLocation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "attributeSet");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "thumbnailURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              v35 = (void *)v16;
              v36 = (void *)v14;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
                v22 = objc_claimAutoreleasedReturnValue();

                v21 = (void *)v22;
              }
              v23 = (void *)MEMORY[0x1E0CEA638];
              objc_msgSend(v10, "attributeSet");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "thumbnailData");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "imageWithData:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26)
              {
                v28 = v26;
              }
              else
              {
                v29 = (void *)MEMORY[0x1E0CEA638];
                objc_msgSend(v21, "path");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "imageWithContentsOfFile:", v30);
                v28 = (id)objc_claimAutoreleasedReturnValue();

              }
              v31 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:", v28, v36, v35, v34, v19, 0, 0);
              v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v33 = *(void **)(v32 + 40);
              *(_QWORD *)(v32 + 40) = v31;

              goto LABEL_19;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_19:

  }
}

void __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_2_27(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_3;
    v7[3] = &unk_1E9BDCB68;
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = v3;
    v9 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

uint64_t __76__NSSArticleInternal__articleFromCoreSpotlightIdentifier_domain_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

+ (void)articleFromCoreSpotlightIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__NSSArticleInternal_articleFromCoreSpotlightIdentifier_completion___block_invoke;
  v10[3] = &unk_1E9BDCBE0;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_articleFromCoreSpotlightIdentifier:domain:completion:", v9, CFSTR("com.apple.news.article.history"), v10);

}

void __68__NSSArticleInternal_articleFromCoreSpotlightIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (!v3)
  {
    v5 = 0;
    objc_msgSend(*(id *)(a1 + 48), "_articleFromCoreSpotlightIdentifier:domain:completion:", *(_QWORD *)(a1 + 32), CFSTR("NSSSpotlightArticleDomainIdentifier"), *(_QWORD *)(a1 + 40));
    goto LABEL_5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
LABEL_5:
    v3 = v5;
  }

}

- (NSSArticleInternal)init
{
  return -[NSSArticleInternal initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:](self, "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:", 0, 0, 0, 0, 0, 0, 0);
}

- (NSSArticleInternal)initWithThumbnailImage:(id)a3 title:(id)a4 shortExcerpt:(id)a5 publishDate:(id)a6 publisherName:(id)a7 publisherLogoImage:(id)a8 publisherLogoMaskImage:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSSArticleInternal *v22;
  NSSArticleInternal *v23;
  uint64_t v24;
  NSString *title;
  uint64_t v26;
  NSString *shortExcerpt;
  uint64_t v28;
  NSDate *publishDate;
  uint64_t v30;
  NSString *publisherName;
  id v33;
  objc_super v34;

  v33 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)NSSArticleInternal;
  v22 = -[NSSArticleInternal init](&v34, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_thumbnailImage, a3);
    v24 = objc_msgSend(v16, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    shortExcerpt = v23->_shortExcerpt;
    v23->_shortExcerpt = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    publishDate = v23->_publishDate;
    v23->_publishDate = (NSDate *)v28;

    v30 = objc_msgSend(v19, "copy");
    publisherName = v23->_publisherName;
    v23->_publisherName = (NSString *)v30;

    objc_storeStrong((id *)&v23->_publisherLogoImage, a8);
    objc_storeStrong((id *)&v23->_publisherLogoMaskImage, a9);
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[NSSArticleInternal thumbnailImage](self, "thumbnailImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSSArticleInternal thumbnailImage](self, "thumbnailImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("thumbnailImage"));

  }
  -[NSSArticleInternal title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSSArticleInternal title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("title"));

  }
  -[NSSArticleInternal shortExcerpt](self, "shortExcerpt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSSArticleInternal shortExcerpt](self, "shortExcerpt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("shortExcerpt"));

  }
  -[NSSArticleInternal publishDate](self, "publishDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSSArticleInternal publishDate](self, "publishDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("publishDate"));

  }
  -[NSSArticleInternal publisherName](self, "publisherName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSSArticleInternal publisherName](self, "publisherName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("publisherName"));

  }
  -[NSSArticleInternal publisherLogoImage](self, "publisherLogoImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSSArticleInternal publisherLogoImage](self, "publisherLogoImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("publisherLogoImage"));

  }
  -[NSSArticleInternal publisherLogoMaskImage](self, "publisherLogoMaskImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NSSArticleInternal publisherLogoMaskImage](self, "publisherLogoMaskImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("publisherLogoMaskImage"));

  }
}

- (NSSArticleInternal)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSArticleInternal *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("thumbnailImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("shortExcerpt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("publishDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("publisherName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("publisherLogoImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("publisherLogoMaskImage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NSSArticleInternal initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:](self, "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (UIImage)publisherLogoImage
{
  return self->_publisherLogoImage;
}

- (UIImage)publisherLogoMaskImage
{
  return self->_publisherLogoMaskImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publisherLogoMaskImage, 0);
  objc_storeStrong((id *)&self->_publisherLogoImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end
