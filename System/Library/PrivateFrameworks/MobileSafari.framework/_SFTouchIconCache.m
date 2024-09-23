@implementation _SFTouchIconCache

+ (id)defaultBackgroundColor
{
  return +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
}

- (void)_didLoadTouchIcon:(id)a3 withCacheSettingsEntry:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SFTouchIconCache;
    -[WBSTouchIconCache _didLoadTouchIcon:withCacheSettingsEntry:](&v10, sel__didLoadTouchIcon_withCacheSettingsEntry_, v6, v7);
    v8 = objc_msgSend(v6, "safari_transparencyAnalysisResult");
    if (v8 != objc_msgSend(v7, "transparencyAnalysisResult"))
    {
      objc_msgSend(v7, "entryWithTransparencyAnalysisResult:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSTouchIconCache saveTouchIconSettings:touchIcon:](self, "saveTouchIconSettings:touchIcon:", v9, v6);

    }
  }

}

- (BOOL)canHandleRequest:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SFTouchIconCache;
  if (-[WBSTouchIconCache canHandleRequest:](&v7, sel_canHandleRequest_, v4))
  {
    objc_opt_class();
    v5 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _SFTouchIconFetchOperation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WBSTouchIconFetchOperation initWithRequest:completionHandler:]([_SFTouchIconFetchOperation alloc], "initWithRequest:completionHandler:", v6, v5);

  return v7;
}

+ (id)_generateDefaultFavoritesIcon
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  +[_SFSiteIcon defaultSize](_SFSiteIcon, "defaultSize");
  v3 = v2;
  v5 = v4;
  +[_SFSiteIcon defaultGlyph](_SFSiteIcon, "defaultGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v3 - v7;
  objc_msgSend(v6, "size");
  v10 = v5 - v9;
  v11 = _SFRoundFloatToPixels(v10 * 0.5);
  v12 = _SFRoundFloatToPixels(v8 * 0.5);
  objc_msgSend(v6, "_imagePaddedByInsets:", v11, v12, v10 - v11, v8 - v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_monogramConfiguration
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D8AD20];
  +[_SFSiteIcon defaultSize](_SFSiteIcon, "defaultSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(a1, "defaultBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", 0, 0, v8, v5, v7, 44.0, 20.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
