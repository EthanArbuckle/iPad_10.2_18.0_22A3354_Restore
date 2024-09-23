@implementation HUInlineWebContainerView

- (HUInlineWebContainerView)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  HUInlineWebContainerView *v7;
  id v8;
  uint64_t v9;
  WKUserContentController *contentController;
  void *v11;
  uint64_t v12;
  UIFont *font;
  uint64_t v14;
  WKWebView *webView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUInlineWebContainerView;
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = -[HUInlineWebContainerView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v4, v5, v6);
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    objc_msgSend(v8, "setDataDetectorTypes:", 0);
    v9 = objc_opt_new();
    contentController = v7->_contentController;
    v7->_contentController = (WKUserContentController *)v9;

    -[HUInlineWebContainerView contentController](v7, "contentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserContentController:", v11);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v12 = objc_claimAutoreleasedReturnValue();
    font = v7->_font;
    v7->_font = (UIFont *)v12;

    -[HUInlineWebContainerView setUserStyleSheet](v7, "setUserStyleSheet");
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF630]), "initWithFrame:configuration:", v8, v3, v4, v5, v6);
    webView = v7->_webView;
    v7->_webView = (WKWebView *)v14;

    -[HUInlineWebContainerView webView](v7, "webView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUIDelegate:", v7);

    -[HUInlineWebContainerView webView](v7, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNavigationDelegate:", v7);

    -[HUInlineWebContainerView webView](v7, "webView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    -[HUInlineWebContainerView webView](v7, "webView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOpaque:", 0);

    -[HUInlineWebContainerView webView](v7, "webView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAutoresizesSubviews:", 0);

    -[HUInlineWebContainerView webView](v7, "webView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scrollView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setShowsBackgroundShadow:", 0);

    -[HUInlineWebContainerView webView](v7, "webView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBounces:", 0);

    -[HUInlineWebContainerView webView](v7, "webView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setZoomEnabled:", 0);

    -[HUInlineWebContainerView webView](v7, "webView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setScrollEnabled:", 0);

    -[HUInlineWebContainerView setClipsToBounds:](v7, "setClipsToBounds:", 1);
    -[HUInlineWebContainerView webView](v7, "webView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineWebContainerView addSubview:](v7, "addSubview:", v30);

    -[HUInlineWebContainerView setEstimatedHeight:](v7, "setEstimatedHeight:", 0.0);
  }
  return v7;
}

- (void)setUserStyleSheet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[HUInlineWebContainerView font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markupDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tableCellBlueTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "initWithFormat:", CFSTR("var styleTag = document.createElement('style');styleTag.textContent ='   body {       %@;   }   :root {       color-scheme: light dark;   }   a {       text-decoration: none;       color: %@;   }';document.documentElement.appendChild(styleTag);"),
              v5,
              v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF610]), "initWithSource:injectionTime:forMainFrameOnly:", v10, 0, 0);
  -[HUInlineWebContainerView contentController](self, "contentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addUserScript:", v8);

}

- (void)setFont:(id)a3
{
  id v5;
  UIFont *font;
  UIFont *v7;
  char v8;
  void *v9;
  UIFont *v10;

  v5 = a3;
  font = self->_font;
  v10 = (UIFont *)v5;
  v7 = font;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10)
    {
      v8 = -[UIFont isEqual:](v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_font, a3);
    -[HUInlineWebContainerView contentController](self, "contentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllUserScripts");

    -[HUInlineWebContainerView setUserStyleSheet](self, "setUserStyleSheet");
  }
LABEL_8:

}

- (void)setHTMLContent:(id)a3
{
  id v4;
  NSString *HTMLContent;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  id v14;
  id v15;
  NSString *v16;

  v4 = a3;
  HTMLContent = self->_HTMLContent;
  v16 = (NSString *)v4;
  v6 = HTMLContent;
  if (v6 == v16)
  {

    v8 = v16;
LABEL_11:

    goto LABEL_12;
  }
  if (v16)
  {
    v7 = -[NSString isEqual:](v16, "isEqual:", v6);

    if ((v7 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

  }
  v9 = (NSString *)-[NSString copy](v16, "copy");
  v10 = self->_HTMLContent;
  self->_HTMLContent = v9;

  if (self->_HTMLContent)
  {
    v11 = -[HUInlineWebContainerView semanticContentAttribute](self, "semanticContentAttribute");
    -[HUInlineWebContainerView webView](self, "webView");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v11 == 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<div dir='rtl'>%@<div>"), self->_HTMLContent);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)-[NSString loadHTMLString:baseURL:](v8, "loadHTMLString:baseURL:", v13, 0);

    }
    else
    {
      v15 = (id)-[NSString loadHTMLString:baseURL:](v12, "loadHTMLString:baseURL:", self->_HTMLContent, 0);
    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUInlineWebContainerView;
  -[HUInlineWebContainerView layoutSubviews](&v6, sel_layoutSubviews);
  -[HUInlineWebContainerView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInlineWebContainerView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[HUInlineWebContainerView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setLayoutMode:", 0);

  -[HUInlineWebContainerView webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSubviews");

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  v6 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v12, "navigationType"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "openURL:", v10);

    v7 = 0;
  }
  v6[2](v6, v7);

}

- (BOOL)webView:(id)a3 shouldPreviewElement:(id)a4
{
  return 0;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[HUInlineWebContainerView webView](self, "webView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HUInlineWebContainerView_webView_didFinishNavigation___block_invoke;
  v6[3] = &unk_1E6F4C610;
  v6[4] = self;
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", CFSTR("document.body.offsetHeight"), v6);

}

void __56__HUInlineWebContainerView_webView_didFinishNavigation___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  double v4;
  double v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a2, "floatValue");
  if (v3 != 0.0)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "estimatedHeight");
    if (v5 != v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setEstimatedHeight:", v4);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "inlineWebContainerViewDidFinishLoadingContent:", *(_QWORD *)(a1 + 32));

      }
    }
  }
}

- (WKWebView)webView
{
  return self->_webView;
}

- (NSString)HTMLContent
{
  return self->_HTMLContent;
}

- (UIFont)font
{
  return self->_font;
}

- (HUInlineWebContainerViewDelegate)delegate
{
  return (HUInlineWebContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)estimatedHeight
{
  return self->_estimatedHeight;
}

- (void)setEstimatedHeight:(double)a3
{
  self->_estimatedHeight = a3;
}

- (WKUserContentController)contentController
{
  return self->_contentController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_HTMLContent, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
