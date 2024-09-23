@implementation _SFFaviconProvider

+ (UIImage)favoritesFavicon
{
  return (UIImage *)objc_msgSend(a1, "_faviconWithSystemImageNamed:", CFSTR("star.fill"));
}

+ (UIImage)fallbackFavicon
{
  return (UIImage *)objc_msgSend(a1, "_faviconWithSystemImageNamed:", CFSTR("globe"));
}

+ (id)_faviconWithSystemImageNamed:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = a3;
  objc_msgSend(v3, "configurationWithTextStyle:scale:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_SFFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 isReadOnly:(BOOL)a8 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a9
{
  _SFFaviconProvider *v9;
  NSCache *v10;
  NSCache *monogramTitleToImageCache;
  _SFFaviconProvider *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_SFFaviconProvider;
  v9 = -[WBSFaviconProvider initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:](&v14, sel_initWithPersistenceBaseURL_persistenceName_preferredIconSize_atScale_allScales_isReadOnly_shouldCheckIntegrityWhenOpeningDatabaseBlock_, a3, a4, a7, a8, a9, a5.width, a5.height, a6);
  if (v9)
  {
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    monogramTitleToImageCache = v9->_monogramTitleToImageCache;
    v9->_monogramTitleToImageCache = v10;

    v12 = v9;
  }

  return v9;
}

+ (UIImage)bookmarksFavicon
{
  return (UIImage *)objc_msgSend(a1, "_faviconWithSystemImageNamed:", CFSTR("book.fill"));
}

+ (UIImage)historyFavicon
{
  return (UIImage *)objc_msgSend(a1, "_faviconWithSystemImageNamed:", CFSTR("clock.fill"));
}

+ (UIImage)readingListFavicon
{
  return (UIImage *)objc_msgSend(a1, "_faviconWithSystemImageNamed:", CFSTR("eyeglasses"));
}

+ (UIImage)sharedWithYouFavicon
{
  return (UIImage *)objc_msgSend(a1, "_faviconWithSystemImageNamed:", CFSTR("shared.with.you"));
}

- (id)fallbackIconForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "fallbackType");
  if (v5 == 2)
  {
    v7 = (void *)MEMORY[0x1E0D8AD28];
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "monogramStringForURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache objectForKey:](self->_monogramTitleToImageCache, "objectForKey:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = (void *)MEMORY[0x1E0D8AD28];
      objc_msgSend(v4, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "monogramWithTitle:url:backgroundColor:", 0, v11, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v6, "sf_setIsMonogram:", 1);
        -[NSCache setObject:forKey:](self->_monogramTitleToImageCache, "setObject:forKey:", v6, v9);
      }
      else
      {
        +[_SFFaviconProvider fallbackFavicon](_SFFaviconProvider, "fallbackFavicon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else if (v5 == 1)
  {
    +[_SFFaviconProvider fallbackFavicon](_SFFaviconProvider, "fallbackFavicon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramTitleToImageCache, 0);
}

@end
