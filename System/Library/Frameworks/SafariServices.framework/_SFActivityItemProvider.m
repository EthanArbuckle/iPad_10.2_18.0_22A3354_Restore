@implementation _SFActivityItemProvider

- (_SFActivityItemProvider)initWithPlaceholderItem:(id)a3
{

  return 0;
}

- (_SFActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  id v11;
  id v12;
  id v13;
  _SFActivityItemProvider *v14;
  _SFActivityItemProvider *v15;
  uint64_t v16;
  NSSet *excludedActivityTypes;
  _SFActivityItemProvider *v18;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_SFActivityItemProvider;
  v14 = -[UIActivityItemProvider initWithPlaceholderItem:](&v20, sel_initWithPlaceholderItem_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a4);
    objc_storeStrong((id *)&v15->_pageTitle, a5);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    excludedActivityTypes = v15->_excludedActivityTypes;
    v15->_excludedActivityTypes = (NSSet *)v16;

    objc_storeWeak((id *)&v15->_webView, v13);
    v18 = v15;
  }

  return v15;
}

- (_SFActivityItemProvider)initWithURL:(id)a3 pageTitle:(id)a4 webView:(id)a5
{
  return -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](self, "initWithPlaceholderItem:URL:pageTitle:webView:", a3, a3, a4, a5);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if (-[NSSet containsObject:](self->_excludedActivityTypes, "containsObject:", a4))
  {
    v5 = 0;
  }
  else
  {
    -[_SFActivityItemProvider item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)item
{
  return self->_url;
}

- (void)main
{
  void *v3;
  void *v4;
  char v5;
  objc_super v6;

  -[_SFActivityItemProvider excludedActivityTypes](self, "excludedActivityTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityItemProvider activityType](self, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFActivityItemProvider;
    -[UIActivityItemProvider main](&v6, sel_main);
  }
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  NSString *v6;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1B0]))
  {
    -[NSURL safari_userVisibleString](self->_url, "safari_userVisibleString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_pageTitle;
  }
  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  void (**thumbnailHandler)(_QWORD, _QWORD, _QWORD, __n128, __n128);

  thumbnailHandler = (void (**)(_QWORD, _QWORD, _QWORD, __n128, __n128))self->_thumbnailHandler;
  if (thumbnailHandler)
  {
    ((void (**)(_QWORD, id, id, __n128, __n128))thumbnailHandler)[2](thumbnailHandler, a4, a3, (__n128)a5, *(__n128 *)&a5.height);
    thumbnailHandler = (void (**)(_QWORD, _QWORD, _QWORD, __n128, __n128))objc_claimAutoreleasedReturnValue();
  }
  return thumbnailHandler;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSSet)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)thumbnailHandler
{
  return self->_thumbnailHandler;
}

- (void)setThumbnailHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong(&self->_thumbnailHandler, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
