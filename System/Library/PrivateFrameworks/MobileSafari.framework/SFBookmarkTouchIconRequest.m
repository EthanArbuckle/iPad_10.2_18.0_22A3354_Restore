@implementation SFBookmarkTouchIconRequest

- (BOOL)isEqual:(id)a3
{
  id v4;
  WebBookmark *bookmark;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFBookmarkTouchIconRequest;
  if (-[WBSTouchIconRequest isEqual:](&v9, sel_isEqual_, v4))
  {
    bookmark = self->_bookmark;
    objc_msgSend(v4, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WebBookmark isEqual:](bookmark, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
}

+ (id)requestWithBookmark:(id)a3 iconGenerationEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:iconGenerationEnabled:", v6, v4);

  return v7;
}

- (SFBookmarkTouchIconRequest)initWithBookmark:(id)a3 iconGenerationEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SFBookmarkTouchIconRequest *v18;
  SFBookmarkTouchIconRequest *v19;
  objc_super v21;

  v4 = a4;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_URLWithUserTypedString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFSiteIcon minimumAcceptableSizeForDownloadedIcon](_SFSiteIcon, "minimumAcceptableSizeForDownloadedIcon");
  v13 = v12;
  v15 = v14;
  +[_SFSiteIcon defaultSize](_SFSiteIcon, "defaultSize");
  v21.receiver = self;
  v21.super_class = (Class)SFBookmarkTouchIconRequest;
  v18 = -[WBSTouchIconRequest initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:](&v21, sel_initWithTitle_url_minimumIconSize_maximumIconSize_monogramConfiguration_options_, v11, v10, 0, v4 | 2, v13, v15, v16, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_bookmark, a3);
    v19 = v18;
  }

  return v18;
}

@end
