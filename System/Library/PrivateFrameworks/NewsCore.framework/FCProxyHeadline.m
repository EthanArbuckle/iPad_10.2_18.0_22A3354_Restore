@implementation FCProxyHeadline

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_headline;
}

- (FCColor)thumbnailImageTextColor
{
  void *v2;
  void *v3;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailImageTextColor](self->_headline, "thumbnailImageTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCColor *)v3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (unint64_t)storyType
{
  return self->_overrideStoryType;
}

- (FCHeadlineThumbnail)thumbnailMedium
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mediumQualityImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailMedium](self->_headline, "thumbnailMedium");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnailUltraHQ
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ultraQualityImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailUltraHQ](self->_headline, "thumbnailUltraHQ");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnailLQ
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lowQualityImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailLQ](self->_headline, "thumbnailLQ");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnailHQ
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "highQualityImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailHQ](self->_headline, "thumbnailHQ");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnail
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "defaultQualityImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnail](self->_headline, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCHeadlineThumbnail *)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCHeadlineMetadata title](self->_overrideMetadata, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCHeadlineProviding title](self->_headline, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return -[FCHeadlineProviding conformsToProtocol:](self->_headline, "conformsToProtocol:", a3);
}

- (CGRect)thumbnailFocalFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "focalFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    -[FCHeadlineProviding thumbnailFocalFrame](self->_headline, "thumbnailFocalFrame");
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (NSDate)displayDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCHeadlineMetadata displayDate](self->_overrideMetadata, "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCHeadlineProviding displayDate](self->_headline, "displayDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (FCProxyHeadline)initWithHeadline:(id)a3 overrideMetadata:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCTopStoriesStyleConfiguration *v12;
  FCTopStoriesStyleConfiguration *overrideStoryStyle;
  void *v14;
  FCProxyHeadline *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  FCTopStoriesStyleConfiguration *v33;
  FCTopStoriesStyleConfiguration *v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_storeStrong((id *)&self->_headline, a3);
    objc_storeStrong((id *)&self->_overrideMetadata, a4);
    self->_overrideStoryType = objc_msgSend(v9, "storyType");
    objc_msgSend(v9, "storyStyle");
    v12 = (FCTopStoriesStyleConfiguration *)objc_claimAutoreleasedReturnValue();
    overrideStoryStyle = self->_overrideStoryStyle;
    self->_overrideStoryStyle = v12;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "formatThumbnail");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasOverriddenThumbnail = v14 != 0;

    }
    else
    {
      self->_hasOverriddenThumbnail = 0;
    }
    objc_msgSend(v10, "storyType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v11 && v17)
    {
      objc_msgSend(v10, "displayDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(v9, "publishDate");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v21);
      v24 = v23;
      objc_msgSend(v11, "topStoriesConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (double)objc_msgSend(v25, "storyTypeTimeout");

      if (v24 >= v26)
      {
        self->_overrideStoryType = 0;
        v30 = self->_overrideStoryStyle;
        self->_overrideStoryStyle = 0;
      }
      else
      {
        objc_msgSend(v10, "storyType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = PBArticleStoryTypeFromString(v27) - 1;
        if (v28 < 5)
          v29 = v28 + 1;
        else
          v29 = 0;
        self->_overrideStoryType = v29;

        objc_msgSend(v11, "topStoriesConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "styleConfigurations");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_overrideStoryType);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v32);
        v33 = (FCTopStoriesStyleConfiguration *)objc_claimAutoreleasedReturnValue();
        v34 = self->_overrideStoryStyle;
        self->_overrideStoryStyle = v33;

      }
    }
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)shortExcerpt
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCHeadlineMetadata shortExcerpt](self->_overrideMetadata, "shortExcerpt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCHeadlineProviding shortExcerpt](self->_headline, "shortExcerpt");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (FCHeadlineMetadata)appliedOverrideMetadata
{
  return self->_overrideMetadata;
}

- (NSURL)routeURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCHeadlineMetadata routeURL](self->_overrideMetadata, "routeURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCHeadlineProviding routeURL](self->_headline, "routeURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSURL *)v6;
}

- (FCColor)thumbnailImagePrimaryColor
{
  void *v2;
  void *v3;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailImagePrimaryColor](self->_headline, "thumbnailImagePrimaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCColor *)v3;
}

- (FCColor)thumbnailImageBackgroundColor
{
  void *v2;
  void *v3;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailImageBackgroundColor](self->_headline, "thumbnailImageBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCColor *)v3;
}

- (FCColor)thumbnailImageAccentColor
{
  void *v2;
  void *v3;

  if (self->_hasOverriddenThumbnail)
  {
    -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accentColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCHeadlineProviding thumbnailImageAccentColor](self->_headline, "thumbnailImageAccentColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCColor *)v3;
}

- (BOOL)hasThumbnail
{
  void *v2;
  char v3;

  if (!self->_hasOverriddenThumbnail)
    return -[FCHeadlineProviding hasThumbnail](self->_headline, "hasThumbnail");
  -[FCHeadlineMetadata formatThumbnail](self->_overrideMetadata, "formatThumbnail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasThumbnail");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FCHeadlineProviding identifier](self->_headline, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeadlineProviding title](self->_headline, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("id: %@, title: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDate)publishDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCHeadlineMetadata displayDate](self->_overrideMetadata, "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCHeadlineProviding publishDate](self->_headline, "publishDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (FCTopStoriesStyleConfiguration)storyStyle
{
  return self->_overrideStoryStyle;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[FCHeadlineProviding methodSignatureForSelector:](self->_headline, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_headline);
}

- (FCHeadlineProviding)originalHeadline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideStoryStyle, 0);
  objc_storeStrong((id *)&self->_overrideMetadata, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
