@implementation SUUIMediaComponent

- (SUUIMediaComponent)initWithArtwork:(id)a3
{
  id v4;
  SUUIMediaComponent *v5;
  SUUIMediaComponent *v6;
  SUUIArtworkList *v7;
  SUUIArtworkProviding *thumbnailArtworkProvider;
  SUUIArtworkProviding *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIMediaComponent;
  v5 = -[SUUIMediaComponent init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_mediaType = 0;
    v7 = objc_alloc_init(SUUIArtworkList);
    thumbnailArtworkProvider = v6->_thumbnailArtworkProvider;
    v6->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v7;

    v9 = v6->_thumbnailArtworkProvider;
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkProviding setArtworks:](v9, "setArtworks:", v10);

  }
  return v6;
}

- (SUUIMediaComponent)initWithArtworkProvider:(id)a3
{
  return -[SUUIMediaComponent initWithArtworkProvider:appearance:](self, "initWithArtworkProvider:appearance:", a3, 0);
}

- (SUUIMediaComponent)initWithArtworkProvider:(id)a3 appearance:(int64_t)a4
{
  id v6;
  SUUIMediaComponent *v7;
  SUUIMediaComponent *v8;
  uint64_t v9;
  SUUIArtworkProviding *thumbnailArtworkProvider;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIMediaComponent;
  v7 = -[SUUIMediaComponent init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_mediaAppearance = a4;
    v7->_mediaType = 0;
    v9 = objc_msgSend(v6, "copy");
    thumbnailArtworkProvider = v8->_thumbnailArtworkProvider;
    v8->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v9;

  }
  return v8;
}

- (SUUIMediaComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUIMediaComponent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *accessibilityLabel;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  SUUILink *v15;
  SUUILink *link;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSString *mediaURLString;
  void *v23;
  uint64_t v24;
  SUUIArtworkProviding *thumbnailArtworkProvider;
  void *v26;
  uint64_t v27;
  NSString *title;
  void *v29;
  double v30;
  char v31;
  void *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUUIMediaComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v34, sel_initWithCustomPageContext_, v4);
  if (!v5)
    goto LABEL_32;
  objc_msgSend(v4, "componentDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "copy");
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("align"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5->_alignment = SUUIPageComponentAlignmentForString(v10);
  objc_msgSend(v6, "objectForKey:", CFSTR("duration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    v5->_duration = v12;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("link"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v14, "setComponentDictionary:", v13);
    v15 = -[SUUILink initWithComponentContext:]([SUUILink alloc], "initWithComponentContext:", v14);
    link = v5->_link;
    v5->_link = v15;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("adamId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5->_mediaIdentifier = objc_msgSend(v17, "longLongValue");
  objc_msgSend(v6, "objectForKey:", CFSTR("subType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("audio")) & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      if (!objc_msgSend(v18, "isEqualToString:", CFSTR("video")))
        goto LABEL_18;
      v19 = 2;
    }
    v5->_mediaType = v19;
  }
LABEL_18:
  objc_msgSend(v6, "objectForKey:", CFSTR("url"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("audioUrl"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("videoUrl"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v20, "copy");
    mediaURLString = v5->_mediaURLString;
    v5->_mediaURLString = (NSString *)v21;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("artwork"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  thumbnailArtworkProvider = v5->_thumbnailArtworkProvider;
  v5->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v24;

  objc_msgSend(v6, "objectForKey:", CFSTR("title"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = objc_msgSend(v26, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v27;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("titleSize"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(float *)&v30 = SUUIEditorialTitleSizeForString(v29);
  }
  else
  {
    v31 = objc_opt_respondsToSelector();
    LODWORD(v30) = 17.0;
    if ((v31 & 1) != 0)
      objc_msgSend(v29, "floatValue", v30);
  }
  v5->_titleFontSize = *(float *)&v30;
  objc_msgSend(v6, "objectForKey:", CFSTR("titleWeight"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5->_titleFontWeight = SUUIPageComponentFontWeightForString(v32);

LABEL_32:
  return v5;
}

- (SUUIMediaComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6;
  SUUIMediaComponent *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SUUIArtworkProviding *thumbnailArtworkProvider;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIMediaComponent;
  v7 = -[SUUIPageComponent initWithFeaturedContentContext:kind:](&v13, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "componentDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("artwork"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    thumbnailArtworkProvider = v7->_thumbnailArtworkProvider;
    v7->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v10;

    v7->_mediaType = 0;
  }

  return v7;
}

- (id)bestThumbnailArtwork
{
  void *v3;
  double v4;
  double v5;
  SUUIArtworkProviding *thumbnailArtworkProvider;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  thumbnailArtworkProvider = self->_thumbnailArtworkProvider;
  if (v5 == 2.0)
    -[SUUIArtworkProviding largestArtwork](thumbnailArtworkProvider, "largestArtwork");
  else
    -[SUUIArtworkProviding smallestArtwork](thumbnailArtworkProvider, "smallestArtwork");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestThumbnailForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6 * a3;

  -[SUUIArtworkProviding artworkForSize:](self->_thumbnailArtworkProvider, "artworkForSize:", (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[SUUIMediaComponent bestThumbnailArtwork](self, "bestThumbnailArtwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (int64_t)componentType
{
  return 10;
}

- (id)metricsElementName
{
  return CFSTR("media");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2928]))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2938]) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2940]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[SUUIMediaComponent title](self, "title");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)duration
{
  return self->_duration;
}

- (SUUILink)link
{
  return self->_link;
}

- (int64_t)mediaAppearance
{
  return self->_mediaAppearance;
}

- (int64_t)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (NSString)title
{
  return self->_title;
}

- (float)titleFontSize
{
  return self->_titleFontSize;
}

- (int64_t)titleFontWeight
{
  return self->_titleFontWeight;
}

- (SUUIArtworkProviding)thumbnailArtworkProvider
{
  return self->_thumbnailArtworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailArtworkProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end
