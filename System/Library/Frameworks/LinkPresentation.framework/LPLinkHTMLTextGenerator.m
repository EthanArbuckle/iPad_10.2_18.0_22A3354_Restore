@implementation LPLinkHTMLTextGenerator

- (LPLinkHTMLTextGenerator)init
{

  return 0;
}

- (LPLinkHTMLTextGenerator)initWithURL:(id)a3
{
  id v4;
  LPLinkHTMLTextGenerator *v5;
  LPLinkHTMLTextGenerator *v6;
  LPLinkHTMLTextGenerator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPLinkHTMLTextGenerator;
  v5 = -[LPLinkHTMLTextGenerator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[LPLinkHTMLTextGenerator _commonInitWithPresentationProperties:URL:](v5, "_commonInitWithPresentationProperties:URL:", 0, v4);
    v7 = v6;
  }

  return v6;
}

- (LPLinkHTMLTextGenerator)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  LPLinkHTMLTextGenerator *v8;
  LPLinkHTMLTextGenerator *v9;
  LPLinkHTMLTextGenerator *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPLinkHTMLTextGenerator;
  v8 = -[LPLinkHTMLTextGenerator init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[LPLinkHTMLTextGenerator _commonInitWithPresentationProperties:URL:](v8, "_commonInitWithPresentationProperties:URL:", v6, v7);
    v10 = v9;
  }

  return v9;
}

- (void)_commonInitWithPresentationProperties:(id)a3 URL:(id)a4
{
  id v6;
  uint64_t v7;
  WebView *v8;
  WebView *webView;
  void *v10;
  LPLinkHTMLGenerator *v11;
  void *v12;
  void *v13;
  LPLinkHTMLGenerator *v14;
  LPLinkHTMLGenerator *DOMGenerator;
  id v16;

  v16 = a3;
  v6 = a4;
  LPWebLock(v6, v7);
  v8 = (WebView *)objc_alloc_init(MEMORY[0x1E0CEF680]);
  webView = self->_webView;
  self->_webView = v8;

  -[WebView mainFrame](self->_webView, "mainFrame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadHTMLString:baseURL:", &stru_1E44AB1C8, 0);

  v11 = [LPLinkHTMLGenerator alloc];
  -[WebView mainFrame](self->_webView, "mainFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "DOMDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v14 = -[LPLinkHTMLGenerator initWithPresentationProperties:URL:document:](v11, "initWithPresentationProperties:URL:document:", v16, v6, v13);
  else
    v14 = -[LPLinkHTMLGenerator initWithURL:document:](v11, "initWithURL:document:", v6, v13);
  DOMGenerator = self->_DOMGenerator;
  self->_DOMGenerator = v14;

  -[LPLinkHTMLGenerator setDelegate:](self->_DOMGenerator, "setDelegate:", self);
}

- (BOOL)generateEmailCompatibleMarkup
{
  return 1;
}

- (void)setMetadata:(id)a3
{
  NSString *generatedFragmentText;

  -[LPLinkHTMLGenerator setMetadata:](self->_DOMGenerator, "setMetadata:", a3);
  generatedFragmentText = self->_generatedFragmentText;
  self->_generatedFragmentText = 0;

}

- (LPLinkMetadata)metadata
{
  return -[LPLinkHTMLGenerator metadata](self->_DOMGenerator, "metadata");
}

- (NSURL)URL
{
  return -[LPLinkHTMLGenerator URL](self->_DOMGenerator, "URL");
}

- (void)_generateDOMDocumentBody
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *layoutDirection;
  uint64_t v7;
  const __CFString *v8;
  NSString *htmlPrefix;
  WebView *webView;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  LPWebLock(self, a2);
  -[LPLinkHTMLGenerator documentFragment](self->_DOMGenerator, "documentFragment");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[WebView mainFrame](self->_webView, "mainFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DOMDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  layoutDirection = self->_layoutDirection;
  if (layoutDirection)
  {
    v7 = -[NSNumber unsignedIntegerValue](layoutDirection, "unsignedIntegerValue");
    if (v7)
    {
      if (v7 != 1)
        goto LABEL_7;
      v8 = CFSTR("rtl");
    }
    else
    {
      v8 = CFSTR("ltr");
    }
    objc_msgSend(v5, "setDir:", v8);
  }
LABEL_7:
  htmlPrefix = self->_htmlPrefix;
  if (htmlPrefix)
  {
    webView = self->_webView;
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[NSString stringByReplacingOccurrencesOfString:withString:](htmlPrefix, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("\\'"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("(function () { const parser = new DOMParser(); const doc = parser.parseFromString('%@', 'text/html'); Array.from(doc.body.childNodes).forEach((child)=>{document.body.appendChild(child)}) })()"),
      v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WebView stringByEvaluatingJavaScriptFromString:](webView, "stringByEvaluatingJavaScriptFromString:", v13);

  }
  v15 = (id)objc_msgSend(v5, "appendChild:", v16);

}

- (void)_cleanUpDOMDocumentBody
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[WebView mainFrame](self->_webView, "mainFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DOMDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  while (1)
  {

    if (!objc_msgSend(v5, "hasChildNodes"))
      break;
    objc_msgSend(v5, "lastChild");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "removeChild:", v2);
  }

}

- (NSString)HTMLFragmentString
{
  NSString *generatedFragmentText;
  NSString **p_generatedFragmentText;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;

  p_generatedFragmentText = &self->_generatedFragmentText;
  generatedFragmentText = self->_generatedFragmentText;
  if (!generatedFragmentText)
  {
    -[LPLinkHTMLTextGenerator _generateDOMDocumentBody](self, "_generateDOMDocumentBody");
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[WebView mainFrame](self->_webView, "mainFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DOMDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i < objc_msgSend(v9, "length"); i = (i + 1))
    {
      objc_msgSend(v9, "item:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "markupString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v12);

    }
    objc_storeStrong((id *)p_generatedFragmentText, v5);
    -[LPLinkHTMLTextGenerator _cleanUpDOMDocumentBody](self, "_cleanUpDOMDocumentBody");

    generatedFragmentText = *p_generatedFragmentText;
  }
  return (NSString *)(id)-[NSString copy](generatedFragmentText, "copy");
}

- (void)generateHTMLFragmentString:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__LPLinkHTMLTextGenerator_generateHTMLFragmentString___block_invoke;
  v6[3] = &unk_1E44A7E78;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __54__LPLinkHTMLTextGenerator_generateHTMLFragmentString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "HTMLFragmentString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)generateWebArchiveData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__LPLinkHTMLTextGenerator_generateWebArchiveData___block_invoke;
  v6[3] = &unk_1E44A7F60;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __50__LPLinkHTMLTextGenerator_generateWebArchiveData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_generateDOMDocumentBody");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mainFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DOMDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webArchive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_cleanUpDOMDocumentBody");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)linkHTMLGenerator:(id)a3 URLForResource:(id)a4 withMIMEType:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v10 = WeakRetained,
        v11 = objc_loadWeakRetained((id *)&self->_delegate),
        v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "linkHTMLTextGenerator:URLForResource:withMIMEType:", self, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C99E98];
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("data:%@;base64,%@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLWithString:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (LPLinkHTMLTextGeneratorDelegate)delegate
{
  return (LPLinkHTMLTextGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)htmlPrefix
{
  return self->_htmlPrefix;
}

- (void)setHtmlPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDirection, 0);
  objc_storeStrong((id *)&self->_htmlPrefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatedFragmentText, 0);
  objc_storeStrong((id *)&self->_DOMGenerator, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
