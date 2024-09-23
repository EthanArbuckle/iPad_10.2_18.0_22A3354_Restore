@implementation ARQuickLookWebKitItem

- (ARQuickLookWebKitItem)initWithDataProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 previewItem:(id)a6
{
  id v11;
  ARQuickLookWebKitItem *v12;
  ARQuickLookWebKitItem *v13;
  NSDictionary *additionalParameters;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ARQuickLookWebKitItem;
  v12 = -[ARQuickLookWebKitItem initWithDataProvider:contentType:previewTitle:](&v16, sel_initWithDataProvider_contentType_previewTitle_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewItem, a6);
    additionalParameters = v13->_additionalParameters;
    v13->_additionalParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v13;
}

- (ARQuickLookWebKitItem)initWithPreviewItemProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 fileSize:(id)a6 previewItem:(id)a7
{
  id v13;
  ARQuickLookWebKitItem *v14;
  ARQuickLookWebKitItem *v15;
  NSDictionary *additionalParameters;
  objc_super v18;

  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)ARQuickLookWebKitItem;
  v14 = -[ARQuickLookWebKitItem initWithPreviewItemProvider:contentType:previewTitle:fileSize:](&v18, sel_initWithPreviewItemProvider_contentType_previewTitle_fileSize_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_previewItem, a7);
    additionalParameters = v15->_additionalParameters;
    v15->_additionalParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v15;
}

- (id)previewOptions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v14;

  -[ARQuickLookWebKitItem additionalParameters](self, "additionalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ARQLPrivateSourceAppKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ARQuickLookWebKitItem additionalParameters](self, "additionalParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("WebKit"), CFSTR("ARQLPrivateSourceAppKey"));
  -[ARQuickLookWebKitItem urlFragment](self, "urlFragment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ARQLPrivateURLFragment"));

  -[ARQuickLookWebKitItem previewItem](self, "previewItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ARQuickLookWebKitItem previewItem](self, "previewItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend((id)objc_msgSend(v11, "performSelector:", sel_previewOptions), "mutableCopy");

    objc_msgSend(v12, "addEntriesFromDictionary:", v7);
  }
  else
  {
    v12 = v7;
  }

  return v12;
}

- (void)handleMessageFromCustomExtension:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  NSLog(CFSTR("@@@ ARQLWebKitItem handleMessageFromCustomExtension called, message: %@"), v6);
  -[ARQuickLookWebKitItem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "previewItem:didReceiveMessage:", self, v6);

}

- (ARQuickLookWebKitItemDelegate)delegate
{
  return (ARQuickLookWebKitItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)urlFragment
{
  return self->_urlFragment;
}

- (void)setUrlFragment:(id)a3
{
  objc_storeStrong((id *)&self->_urlFragment, a3);
}

- (NSDictionary)additionalParameters
{
  return self->_additionalParameters;
}

- (void)setAdditionalParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (ARQuickLookPreviewItem)previewItem
{
  return self->_previewItem;
}

- (void)setPreviewItem:(id)a3
{
  objc_storeStrong((id *)&self->_previewItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_urlFragment, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
