@implementation FCLocalArticleHeadline

- (id)contentWithContext:(id)a3
{
  return 0;
}

- (FCLocalArticleHeadline)initWithDictionary:(id)a3 path:(id)a4 channel:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCLocalArticleHeadline *v11;
  uint64_t v12;
  NSDictionary *dictionary;
  uint64_t v14;
  NSString *path;
  uint64_t v16;
  FCChannelProviding *channel;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCLocalArticleHeadline;
  v11 = -[FCHeadline init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    dictionary = v11->_dictionary;
    v11->_dictionary = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    path = v11->_path;
    v11->_path = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    channel = v11->_channel;
    v11->_channel = (FCChannelProviding *)v16;

    v11->_webEmbedsEnabled = 1;
  }

  return v11;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[FCLocalArticleHeadline path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)articleID
{
  void *v2;
  void *v3;

  -[FCLocalArticleHeadline path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)contentType
{
  return 2;
}

- (id)primaryAudience
{
  return 0;
}

- (id)title
{
  void *v2;
  void *v3;

  -[FCLocalArticleHeadline dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)publishDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)sourceName
{
  return CFSTR("Draft");
}

- (BOOL)hasThumbnail
{
  void *v2;
  BOOL v3;

  -[FCLocalArticleHeadline thumbnailAssetHandle](self, "thumbnailAssetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)thumbnail
{
  FCHeadlineThumbnail *thumbnail;
  void *v4;
  FCHeadlineThumbnail *v5;
  FCHeadlineThumbnail *v6;

  thumbnail = self->_thumbnail;
  if (!thumbnail)
  {
    -[FCLocalArticleHeadline thumbnailAssetHandle](self, "thumbnailAssetHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v4, 1.79769313e308, 1.79769313e308);
    v5 = (FCHeadlineThumbnail *)objc_claimAutoreleasedReturnValue();
    v6 = self->_thumbnail;
    self->_thumbnail = v5;

    thumbnail = self->_thumbnail;
  }
  return thumbnail;
}

- (id)thumbnailAssetHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;
  FCRawFileDataProvider *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *, BOOL *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[FCLocalArticleHeadline dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("metadata.thumbnailImageIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    -[FCLocalArticleHeadline dictionary](self, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resources"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6;
    v24 = __Block_byref_object_dispose__6;
    v25 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __46__FCLocalArticleHeadline_thumbnailAssetHandle__block_invoke;
    v17 = &unk_1E463BC50;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v14);
    if (v21[5])
    {
      -[FCLocalArticleHeadline localDraftPath](self, "localDraftPath", v14, v15, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:", v21[5]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[FCRawFileDataProvider initWithFilePath:]([FCRawFileDataProvider alloc], "initWithFilePath:", v11);
      v8 = -[FCAssetHandle initWithDataProvider:]([FCAssetHandle alloc], v12);

    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __46__FCLocalArticleHeadline_thumbnailAssetHandle__block_invoke(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("imageIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8 && objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_opt_class();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

}

- (CGSize)thumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)shortExcerpt
{
  void *v2;
  void *v3;

  -[FCLocalArticleHeadline dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessoryText
{
  return CFSTR("Accessory Text");
}

- (id)contentURL
{
  return 0;
}

- (id)lastModifiedDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)topicIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)videoURL
{
  return 0;
}

- (double)videoDuration
{
  return 0.0;
}

- (BOOL)isFeatureCandidate
{
  return 0;
}

- (BOOL)isSponsored
{
  return 0;
}

- (id)iAdCategories
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)iAdKeywords
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)iAdSectionIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)blockedStorefrontIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)allowedStorefrontIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isDeleted
{
  return 0;
}

- (BOOL)isDraft
{
  return 1;
}

- (BOOL)isLocalDraft
{
  return 1;
}

- (id)surfacedByBinID
{
  return 0;
}

- (BOOL)isPremium
{
  return 0;
}

- (BOOL)useTransparentNavigationBar
{
  return 0;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)path
{
  return self->_path;
}

- (FCChannelProviding)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
}

@end
