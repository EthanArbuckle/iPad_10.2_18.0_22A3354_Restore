@implementation LPLinkHTMLGenerator

- (LPLinkHTMLGenerator)init
{

  return 0;
}

- (LPLinkHTMLGenerator)initWithMetadataLoadedFromURL:(id)a3 document:(id)a4
{
  id v6;
  id v7;
  LPLinkHTMLGenerator *v8;
  LPLinkHTMLGenerator *v9;
  LPLinkHTMLGenerator *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[LPLinkHTMLGenerator initWithURL:document:](self, "initWithURL:document:", v6, v7);
  v9 = v8;
  if (v8)
  {
    -[LPLinkHTMLGenerator _fetchMetadata](v8, "_fetchMetadata");
    v10 = v9;
  }

  return v9;
}

- (LPLinkHTMLGenerator)initWithURL:(id)a3 document:(id)a4
{
  id v7;
  id v8;
  LPLinkHTMLGenerator *v9;
  LPLinkHTMLGenerator *v10;
  uint64_t v11;
  uint64_t v12;
  LPLinkHTMLGenerator *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPLinkHTMLGenerator;
  v9 = -[LPLinkHTMLGenerator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    v10->_usesComputedPresentationProperties = 1;
    v10->_applyCornerRadiusToLink = 1;
    LPWebLock(v11, v12);
    objc_storeStrong((id *)&v10->_parentDocument, a4);
    v13 = v10;
  }

  return v10;
}

- (LPLinkHTMLGenerator)initWithPresentationProperties:(id)a3 document:(id)a4
{
  LPLinkHTMLGenerator *v4;
  LPLinkHTMLGenerator *v5;
  LPLinkHTMLGenerator *v6;

  v4 = -[LPLinkHTMLGenerator initWithPresentationProperties:URL:document:](self, "initWithPresentationProperties:URL:document:", a3, 0, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (LPLinkHTMLGenerator)initWithPresentationProperties:(id)a3 URL:(id)a4 document:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPLinkHTMLGenerator *v11;
  LPLinkHTMLGenerator *v12;
  uint64_t v13;
  uint64_t v14;
  LPLinkHTMLGenerator *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPLinkHTMLGenerator;
  v11 = -[LPLinkHTMLGenerator init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_URL, a4);
    v12->_applyCornerRadiusToLink = 1;
    LPWebLock(v13, v14);
    objc_storeStrong((id *)&v12->_parentDocument, a5);
    -[LPLinkHTMLGenerator _setPresentationProperties:](v12, "_setPresentationProperties:", v8);
    v15 = v12;
  }

  return v12;
}

- (id)_createRootElement
{
  return -[DOMDocument createElement:](self->_parentDocument, "createElement:", CFSTR("div"));
}

- (void)_fetchMetadata
{
  NSURL *URL;
  void *v4;
  _QWORD v5[5];

  *(_WORD *)&self->_mayReceiveAdditionalMetadata = 257;
  URL = self->_URL;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke;
  v5[3] = &unk_1E44A7FD0;
  v5[4] = self;
  +[LPMetadataProvider requestMetadataForURL:completionHandler:](LPMetadataProvider, "requestMetadataForURL:completionHandler:", URL, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_pendingMetadataProvider, v4);

}

void __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke_2;
  v5[3] = &unk_1E44A7D10;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke_2(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), 0);
  objc_msgSend(*(id *)(a1 + 32), "_setMetadata:isFinal:", *(_QWORD *)(a1 + 40), 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(v4, "linkHTMLGenerator:didFetchMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

  }
}

- (DOMDocumentFragment)documentFragment
{
  void *v3;
  void *v4;
  id v5;

  LPWebLock(self, a2);
  if (!self->_everBuiltView)
    -[LPLinkHTMLGenerator _rebuildView](self, "_rebuildView");
  -[DOMElement ownerDocument](self->_rootElement, "ownerDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDocumentFragment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "appendChild:", self->_rootElement);
  return (DOMDocumentFragment *)v4;
}

- (BOOL)_allowsTapToLoad
{
  return 0;
}

- (BOOL)generateEmailCompatibleMarkup
{
  return 1;
}

- (BOOL)useInlineStyles
{
  return 1;
}

- (BOOL)_useVariablesWhenUsingInlineStyles
{
  return 0;
}

- (BOOL)_includeClassNamesWhenUsingInlineStyles
{
  return 1;
}

- (BOOL)_includeDarkInterfaceInlineStyles
{
  return 1;
}

- (void)setApplyCornerRadiusToLink:(BOOL)a3
{
  if (self->_applyCornerRadiusToLink != a3)
  {
    self->_applyCornerRadiusToLink = a3;
    if (self->_everBuiltView)
      -[LPLinkHTMLGenerator _rebuildView](self, "_rebuildView");
  }
}

- (id)_URLForResource:(id)a3 withMIMEType:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "linkHTMLGenerator:URLForResource:withMIMEType:", self, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_URLForImage:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(void);
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "_alternateHTMLImageGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "_alternateHTMLImageGenerator");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v9 = WeakRetained,
        v10 = objc_loadWeakRetained((id *)&self->_delegate),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MIMEType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "linkHTMLGenerator:URLForResource:withMIMEType:", self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "MIMEType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("data:%@;base64,%@"), v14, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)clearCurrentLayout
{
  DOMElement *rootElement;
  void *v4;
  void *v5;
  id v6;

  LPWebLock(self, a2);
  while (-[DOMElement childElementCount](self->_rootElement, "childElementCount"))
  {
    rootElement = self->_rootElement;
    -[DOMElement childNodes](rootElement, "childNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "item:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[DOMElement removeChild:](rootElement, "removeChild:", v5);

  }
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
  -[LPLinkHTMLGenerator _computePresentationPropertiesFromMetadata](self, "_computePresentationPropertiesFromMetadata");
  if (self->_everBuiltView)
    -[LPLinkHTMLGenerator _rebuildView](self, "_rebuildView");
}

- (void)_setMetadata:(id)a3 isFinal:(BOOL)a4
{
  self->_mayReceiveAdditionalMetadata = !a4;
  -[LPLinkHTMLGenerator setMetadata:](self, "setMetadata:", a3);
}

- (void)_computePresentationPropertiesFromMetadata
{
  void *v3;
  LPLinkMetadataPresentationTransformer *v4;

  if (self->_usesComputedPresentationProperties)
  {
    v4 = objc_alloc_init(LPLinkMetadataPresentationTransformer);
    -[LPLinkMetadataPresentationTransformer setMetadata:](v4, "setMetadata:", self->_metadata);
    -[LPLinkMetadataPresentationTransformer setURL:](v4, "setURL:", self->_URL);
    -[LPLinkMetadataPresentationTransformer setComplete:](v4, "setComplete:", !self->_mayReceiveAdditionalMetadata);
    -[LPLinkMetadataPresentationTransformer setAllowsTapToLoad:](v4, "setAllowsTapToLoad:", 0);
    -[LPLinkMetadataPresentationTransformer presentationProperties](v4, "presentationProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkHTMLGenerator _setPresentationProperties:](self, "_setPresentationProperties:", v3);

  }
}

- (void)_setPresentationProperties:(id)a3
{
  char v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LPCaptionBarPresentationProperties *v10;
  void *v11;
  LPCaptionBarPresentationProperties *v12;
  LPCaptionBarPresentationProperties *captionBar;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  LPCaptionBarPresentationProperties *v24;
  LPCaptionBarPresentationProperties *mediaBottomCaptionBar;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  LPCaptionBarPresentationProperties *v30;
  LPCaptionBarPresentationProperties *v31;
  LPCaptionBarPresentationProperties *mediaTopCaptionBar;
  NSString *v33;
  NSString *quotedText;
  LPImage *v35;
  LPImage *image;
  LPImagePresentationProperties *v37;
  LPImagePresentationProperties *imageProperties;
  int64_t style;
  void *v40;
  void *v41;
  LPTheme *v42;
  LPTheme *theme;
  void *v44;
  void *v45;
  UIColor *v46;
  UIColor *backgroundColor;
  UIColor *v48;
  UIColor *dominantImageBackgroundColor;
  void *v50;
  void *v51;
  id v52;

  v52 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v52, "isPreliminary");
  else
    v4 = 0;
  self->_isPreliminary = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v52, "style");
  else
    v5 = 0;
  self->_style = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "topCaption");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v51 = (void *)v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "bottomCaption");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v50 = (void *)v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "trailingTopCaption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "trailingBottomCaption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_25;
  }
  else
  {
    v9 = 0;
    if (v6)
    {
LABEL_25:
      v12 = objc_alloc_init(LPCaptionBarPresentationProperties);
      captionBar = self->_captionBar;
      self->_captionBar = v12;

      -[LPCaptionBarPresentationProperties top](self->_captionBar, "top");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leading");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v6);

      -[LPCaptionBarPresentationProperties bottom](self->_captionBar, "bottom");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "leading");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v7);

      -[LPCaptionBarPresentationProperties top](self->_captionBar, "top");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trailing");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v8);

      -[LPCaptionBarPresentationProperties bottom](self->_captionBar, "bottom");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v9);

      goto LABEL_27;
    }
  }
  if (v7 || v8 || v9)
    goto LABEL_25;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "captionBar");
    v10 = (LPCaptionBarPresentationProperties *)objc_claimAutoreleasedReturnValue();
    v11 = self->_captionBar;
    self->_captionBar = v10;
  }
  else
  {
    v11 = self->_captionBar;
    self->_captionBar = 0;
  }
LABEL_27:

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "icon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      -[LPCaptionBarPresentationProperties setTrailingIcon:](self->_captionBar, "setTrailingIcon:", v21);
  }
  else
  {
    v21 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "mediaTopCaption");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "mediaBottomCaption");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  if (v22 | v23)
  {
    v24 = objc_alloc_init(LPCaptionBarPresentationProperties);
    mediaBottomCaptionBar = self->_mediaBottomCaptionBar;
    self->_mediaBottomCaptionBar = v24;

    -[LPCaptionBarPresentationProperties top](self->_mediaBottomCaptionBar, "top");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leading");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v22);

    -[LPCaptionBarPresentationProperties bottom](self->_mediaBottomCaptionBar, "bottom");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leading");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v23);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "mediaBottomCaptionBar");
    v30 = (LPCaptionBarPresentationProperties *)objc_claimAutoreleasedReturnValue();
    v28 = self->_mediaBottomCaptionBar;
    self->_mediaBottomCaptionBar = v30;
  }
  else
  {
    v28 = self->_mediaBottomCaptionBar;
    self->_mediaBottomCaptionBar = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "mediaTopCaptionBar");
    v31 = (LPCaptionBarPresentationProperties *)objc_claimAutoreleasedReturnValue();
    mediaTopCaptionBar = self->_mediaTopCaptionBar;
    self->_mediaTopCaptionBar = v31;
  }
  else
  {
    mediaTopCaptionBar = self->_mediaTopCaptionBar;
    self->_mediaTopCaptionBar = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "quotedText");
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    quotedText = self->_quotedText;
    self->_quotedText = v33;
  }
  else
  {
    quotedText = self->_quotedText;
    self->_quotedText = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "image");
    v35 = (LPImage *)objc_claimAutoreleasedReturnValue();
    image = self->_image;
    self->_image = v35;
  }
  else
  {
    image = self->_image;
    self->_image = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "imageProperties");
    v37 = (LPImagePresentationProperties *)objc_claimAutoreleasedReturnValue();
    imageProperties = self->_imageProperties;
    self->_imageProperties = v37;
  }
  else
  {
    imageProperties = self->_imageProperties;
    self->_imageProperties = 0;
  }

  style = self->_style;
  -[LPCaptionBarPresentationProperties trailingIcon](self->_captionBar, "trailingIcon");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
  {
    -[LPCaptionBarPresentationProperties leadingIcon](self->_captionBar, "leadingIcon");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[LPTheme themeWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:](LPTheme, "themeWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:", style, v41, 3, 0, 0, 0, *MEMORY[0x1E0DC4918]);
  v42 = (LPTheme *)objc_claimAutoreleasedReturnValue();
  theme = self->_theme;
  self->_theme = v42;

  if (!v40)
  -[LPLinkHTMLGenerator _presentationOverrideBackgroundColorForProperties:](self, "_presentationOverrideBackgroundColorForProperties:", v52);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    v46 = v44;
  }
  else
  {
    -[LPTheme backgroundColor](self->_theme, "backgroundColor");
    v46 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v46;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v52, "dominantImageBackgroundColor");
    v48 = (UIColor *)objc_claimAutoreleasedReturnValue();
    dominantImageBackgroundColor = self->_dominantImageBackgroundColor;
    self->_dominantImageBackgroundColor = v48;
  }
  else
  {
    dominantImageBackgroundColor = self->_dominantImageBackgroundColor;
    self->_dominantImageBackgroundColor = 0;
  }

}

- (id)_presentationOverrideBackgroundColorForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LPTheme mediaImage](self->_theme, "mediaImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "darkeningAmount");
  presentationOverrideBackgroundColorForProperties(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (LPPointUnit)rootWidth
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v3 = shouldUseSkinnyWidth(self->_style, self->_quotedText, self->_image, 0, 0);
  -[LPLinkHTMLGenerator theme](self, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = v7;

  -[LPLinkHTMLGenerator theme](self, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaTopCaptionBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimumWidth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v13 = v12;

  -[LPLinkHTMLGenerator theme](self, "theme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaBottomCaptionBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minimumWidth");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v18 = 300.0;
  if (v3)
    v18 = 228.0;
  v19 = fmax(fmax(fmax(v18, v8), v13), v17);

  return -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v19);
}

- (id)_createCaptionBar
{
  LPEmailCompatibleHTMLCaptionBarComponent *v3;
  void *v4;
  LPEmailCompatibleHTMLCaptionBarComponent *v5;

  v3 = [LPEmailCompatibleHTMLCaptionBarComponent alloc];
  -[LPTheme captionBar](self->_theme, "captionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LPEmailCompatibleHTMLCaptionBarComponent initWithStyle:presentationProperties:themePath:generator:](v3, "initWithStyle:presentationProperties:themePath:generator:", v4, self->_captionBar, CFSTR("captionBar"), self);

  return v5;
}

- (id)_createMediaTopCaptionBar
{
  LPEmailCompatibleHTMLCaptionBarComponent *v3;
  void *v4;
  LPEmailCompatibleHTMLCaptionBarComponent *v5;

  v3 = [LPEmailCompatibleHTMLCaptionBarComponent alloc];
  -[LPTheme mediaTopCaptionBar](self->_theme, "mediaTopCaptionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LPEmailCompatibleHTMLCaptionBarComponent initWithStyle:presentationProperties:themePath:generator:](v3, "initWithStyle:presentationProperties:themePath:generator:", v4, self->_mediaTopCaptionBar, CFSTR("mediaTopCaptionBar"), self);

  return v5;
}

- (id)_createMediaBottomCaptionBar
{
  LPEmailCompatibleHTMLCaptionBarComponent *v3;
  void *v4;
  LPEmailCompatibleHTMLCaptionBarComponent *v5;

  v3 = [LPEmailCompatibleHTMLCaptionBarComponent alloc];
  -[LPTheme mediaBottomCaptionBar](self->_theme, "mediaBottomCaptionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LPEmailCompatibleHTMLCaptionBarComponent initWithStyle:presentationProperties:themePath:generator:](v3, "initWithStyle:presentationProperties:themePath:generator:", v4, self->_mediaBottomCaptionBar, CFSTR("mediaBottomCaptionBar"), self);

  return v5;
}

- (id)_createMediaComponent
{
  LPEmailCompatibleHTMLImageComponent *v3;
  LPImage *image;
  void *v5;
  LPEmailCompatibleHTMLImageComponent *v6;

  if (self->_image)
  {
    v3 = [LPEmailCompatibleHTMLImageComponent alloc];
    image = self->_image;
    -[LPTheme mediaImage](self->_theme, "mediaImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LPEmailCompatibleHTMLImageComponent initWithImage:style:themePath:generator:](v3, "initWithImage:style:themePath:generator:", image, v5, CFSTR("mediaImage"), self);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_createQuoteComponent
{
  LPEmailCompatibleHTMLQuoteComponent *v3;
  NSString *quotedText;
  void *v5;
  LPEmailCompatibleHTMLQuoteComponent *v6;

  v3 = [LPEmailCompatibleHTMLQuoteComponent alloc];
  quotedText = self->_quotedText;
  -[LPTheme quotedText](self->_theme, "quotedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPEmailCompatibleHTMLQuoteComponent initWithText:style:themePath:generator:](v3, "initWithText:style:themePath:generator:", quotedText, v5, CFSTR("quotedText"), self);

  return v6;
}

- (void)_rebuildView
{
  DOMElement *v3;
  DOMElement *rootElement;
  LPCSSResolver *v5;
  LPCSSResolver *cssResolver;
  _BOOL4 v7;
  LPImage *image;
  NSString *quotedText;
  LPEmailCompatibleHTMLLinkComponent *v10;
  LPHTMLComponent *linkComponent;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DOMElement *v17;
  void *v18;
  id v19;
  LPEmailCompatibleHTMLTableComponent *v20;

  LPWebLock(self, a2);
  if (!self->_rootElement)
  {
    -[LPLinkHTMLGenerator _createRootElement](self, "_createRootElement");
    v3 = (DOMElement *)objc_claimAutoreleasedReturnValue();
    rootElement = self->_rootElement;
    self->_rootElement = v3;

  }
  v5 = -[LPCSSResolver initWithTheme:]([LPCSSResolver alloc], "initWithTheme:", self->_theme);
  cssResolver = self->_cssResolver;
  self->_cssResolver = v5;

  -[LPLinkHTMLGenerator clearCurrentLayout](self, "clearCurrentLayout");
  v7 = -[LPCaptionBarPresentationProperties hasAnyContent](self->_captionBar, "hasAnyContent");
  quotedText = self->_quotedText;
  image = self->_image;
  v10 = -[LPEmailCompatibleHTMLLinkComponent initWithURL:generator:]([LPEmailCompatibleHTMLLinkComponent alloc], "initWithURL:generator:", self->_URL, self);
  linkComponent = self->_linkComponent;
  self->_linkComponent = &v10->super;

  v20 = -[LPEmailCompatibleHTMLTableComponent initWithThemePath:generator:]([LPEmailCompatibleHTMLTableComponent alloc], "initWithThemePath:generator:", CFSTR("emailBaseTable"), self);
  if (image)
  {
    -[LPLinkHTMLGenerator _createMediaComponent](self, "_createMediaComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[LPEmailCompatibleHTMLTableComponent addChildAsRow:](v20, "addChildAsRow:", v12);

  }
  if (quotedText)
  {
    -[LPLinkHTMLGenerator _createQuoteComponent](self, "_createQuoteComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[LPEmailCompatibleHTMLTableComponent addChildAsRow:](v20, "addChildAsRow:", v13);

  }
  if (v7)
  {
    if (-[LPCaptionBarPresentationProperties hasAnyContent](self->_mediaTopCaptionBar, "hasAnyContent"))
    {
      -[LPLinkHTMLGenerator _createMediaTopCaptionBar](self, "_createMediaTopCaptionBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPEmailCompatibleHTMLTableComponent addChildAsRow:](v20, "addChildAsRow:", v14);

    }
    if (-[LPCaptionBarPresentationProperties hasAnyContent](self->_mediaBottomCaptionBar, "hasAnyContent"))
    {
      -[LPLinkHTMLGenerator _createMediaBottomCaptionBar](self, "_createMediaBottomCaptionBar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPEmailCompatibleHTMLTableComponent addChildAsRow:](v20, "addChildAsRow:", v15);

    }
    -[LPLinkHTMLGenerator _createCaptionBar](self, "_createCaptionBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPEmailCompatibleHTMLTableComponent addChildAsRow:](v20, "addChildAsRow:", v16);

  }
  -[LPHTMLComponent addChild:](self->_linkComponent, "addChild:", v20);
  v17 = self->_rootElement;
  -[LPHTMLComponent element](self->_linkComponent, "element");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)-[DOMElement appendChild:](v17, "appendChild:", v18);

  self->_everBuiltView = 1;
}

- (BOOL)_canTapToLoad
{
  return 0;
}

- (LPLinkHTMLGeneratorDelegate)delegate
{
  return (LPLinkHTMLGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)applyCornerRadiusToLink
{
  return self->_applyCornerRadiusToLink;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)URL
{
  return self->_URL;
}

- (DOMDocument)parentDocument
{
  return self->_parentDocument;
}

- (LPCSSResolver)cssResolver
{
  return self->_cssResolver;
}

- (int64_t)style
{
  return self->_style;
}

- (LPTheme)theme
{
  return self->_theme;
}

- (BOOL)isPreliminary
{
  return self->_isPreliminary;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)dominantImageBackgroundColor
{
  return self->_dominantImageBackgroundColor;
}

- (BOOL)_disableAutoPlay
{
  return self->__disableAutoPlay;
}

- (void)_setDisableAutoPlay:(BOOL)a3
{
  self->__disableAutoPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_cssResolver, 0);
  objc_storeStrong((id *)&self->_parentDocument, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkComponent, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_quotedText, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_captionBar, 0);
  objc_destroyWeak((id *)&self->_pendingMetadataProvider);
}

@end
