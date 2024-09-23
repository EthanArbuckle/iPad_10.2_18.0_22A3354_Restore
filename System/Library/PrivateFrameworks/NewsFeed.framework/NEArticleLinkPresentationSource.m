@implementation NEArticleLinkPresentationSource

- (NEArticleLinkPresentationSource)initWithHeadline:(id)a3 articleURL:(id)a4 selectedText:(id)a5
{
  id v9;
  id v10;
  id v11;
  NEArticleLinkPresentationSource *v12;
  NEArticleLinkPresentationSource *v13;
  uint64_t v14;
  NSString *selectedText;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEArticleLinkPresentationSource;
  v12 = -[NEArticleLinkPresentationSource init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_headline, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    v14 = objc_msgSend(v11, "copy");
    selectedText = v13->_selectedText;
    v13->_selectedText = (NSString *)v14;

  }
  return v13;
}

- (LPLinkMetadata)linkMetadata
{
  void *v3;
  void *v4;
  NELinkMetadataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NELinkMetadataSource *v10;
  void *v11;

  -[NEArticleLinkPresentationSource headline](self, "headline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEArticleLinkPresentationSource thumbnailImageProviderFromHeadline:](self, "thumbnailImageProviderFromHeadline:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [NELinkMetadataSource alloc];
  -[NEArticleLinkPresentationSource headline](self, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEArticleLinkPresentationSource titleFromHeadline:](self, "titleFromHeadline:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEArticleLinkPresentationSource url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEArticleLinkPresentationSource selectedText](self, "selectedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NELinkMetadataSource initWithTitle:url:imageProvider:iconProvider:selectedText:](v5, "initWithTitle:url:imageProvider:iconProvider:selectedText:", v7, v8, v4, v4, v9);

  -[NELinkMetadataSource linkMetadata](v10, "linkMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v11;
}

- (id)titleFromHeadline:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "sourceName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - %@"), v8, v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "title");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "sourceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v10 = &stru_1E734D990;
        goto LABEL_9;
      }
      objc_msgSend(v3, "sourceName");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (__CFString *)v12;
  }
LABEL_9:

  return v10;
}

- (id)thumbnailImageProviderFromHeadline:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke;
  v8[3] = &unk_1E724B778;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v5, v8);

  return v4;
}

void __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;

  v2 = a2;
  +[NEArticleLinkPresentationSource deviceScreenScaleFromPotentialBackgroundThread](NEArticleLinkPresentationSource, "deviceScreenScaleFromPotentialBackgroundThread");
  v5 = v2;
  v3 = v2;
  v4 = (id)FCFetchThumbnailForHeadlineWithMinimumSize();

}

void __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke_3;
  v7[3] = &unk_1E724B728;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__NEArticleLinkPresentationSource_thumbnailImageProviderFromHeadline___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  UIImage *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithContentsOfFile:", v3);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (double)deviceScreenScaleFromPotentialBackgroundThread
{
  void *v2;
  double v3;
  double v4;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scale");
    v4 = v3;

    return v4;
  }
  else
  {
    if (deviceScreenScaleFromPotentialBackgroundThread_onceToken[0] != -1)
      dispatch_once(deviceScreenScaleFromPotentialBackgroundThread_onceToken, &__block_literal_global);
    return *(double *)&deviceScreenScaleFromPotentialBackgroundThread_screenScale;
  }
}

void __81__NEArticleLinkPresentationSource_deviceScreenScaleFromPotentialBackgroundThread__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  deviceScreenScaleFromPotentialBackgroundThread_screenScale = v0;

}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
