@implementation _SFReaderFontOptionsGroupController

- (_SFReaderFontOptionsGroupController)initWithReaderContext:(id)a3
{
  id v5;
  _SFReaderFontOptionsGroupController *v6;
  _SFReaderFontOptionsGroupController *v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSMutableDictionary *fontToItemDictionary;
  uint64_t v12;
  NSMutableDictionary *fontToViewDictionary;
  void *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *fontInstallationStatusQueue;
  _SFReaderFontOptionsGroupController *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFReaderFontOptionsGroupController;
  v6 = -[_SFReaderFontOptionsGroupController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readerContext, a3);
    objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    v7->_fontSize = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    fontToItemDictionary = v7->_fontToItemDictionary;
    v7->_fontToItemDictionary = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    fontToViewDictionary = v7->_fontToViewDictionary;
    v7->_fontToViewDictionary = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__fontDownloadDidBegin_, *MEMORY[0x1E0D8B2F0], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__fontDownloadDidFail_, *MEMORY[0x1E0D8B2F8], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__fontDownloadDidFinish_, *MEMORY[0x1E0D8B300], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__fontDownloadProgressDidChange_, *MEMORY[0x1E0D8B310], 0);
    v15 = dispatch_queue_create("com.apple.SafariServices.ReaderFontInstallationStatusQueue", 0);
    fontInstallationStatusQueue = v7->_fontInstallationStatusQueue;
    v7->_fontInstallationStatusQueue = (OS_dispatch_queue *)v15;

    v17 = v7;
  }

  return v7;
}

- (NSArray)values
{
  void *v2;
  void *v3;

  -[SFReaderContext fontManager](self->_readerContext, "fontManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isSelectedValue:(id)a3
{
  SFReaderContext *readerContext;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  readerContext = self->_readerContext;
  v5 = a3;
  -[SFReaderContext configurationManager](readerContext, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderContext fontManager](self->_readerContext, "fontManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontForLanguageTag:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "familyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v11, "isEqualToString:", v10);
  return (char)v6;
}

- (void)setSelectedValue:(id)a3
{
  -[SFReaderContext setReaderFont:](self->_readerContext, "setReaderFont:", a3);
}

- (BOOL)shouldSelectValue:(id)a3 forItem:(id)a4 groupItem:(id)a5
{
  return 1;
}

- (void)prepareView:(id)a3 forItem:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _SFReaderFontDownloadAccessory *v12;
  uint64_t v13;
  id v14;
  _SFReaderFontDownloadAccessory *v15;
  NSObject *fontInstallationStatusQueue;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = v10;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fontToItemDictionary, "setObject:forKeyedSubscript:", v9, v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fontToViewDictionary, "setObject:forKeyedSubscript:", v8, v11);
  if (objc_msgSend(v11, "isReadyToUse"))
  {
    objc_msgSend(v9, "setEnabled:", 1);
  }
  else
  {
    objc_msgSend(v9, "setEnabled:", 0);
    v12 = [_SFReaderFontDownloadAccessory alloc];
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke;
    v22[3] = &unk_1E4AC3748;
    v14 = v11;
    v23 = v14;
    v15 = -[_SFReaderFontDownloadAccessory initWithTappedDownloadBlock:](v12, "initWithTappedDownloadBlock:", v22);
    objc_msgSend(v8, "setAccessoryView:", v15);
    fontInstallationStatusQueue = self->_fontInstallationStatusQueue;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_2;
    v17[3] = &unk_1E4AC37C0;
    v18 = v14;
    objc_copyWeak(&v21, &location);
    v19 = v9;
    v20 = v8;
    dispatch_async(fontInstallationStatusQueue, v17);

    objc_destroyWeak(&v21);
  }

  objc_destroyWeak(&location);
}

- (id)textStyleForValue:(id)a3
{
  return (id)*MEMORY[0x1E0DC4B60];
}

- (id)_attributedStringForReaderFont:(id)a3
{
  double fontSize;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  fontSize = self->_fontSize;
  v5 = a3;
  objc_msgSend(v5, "fontOfSize:", fontSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", self->_fontSize);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = *MEMORY[0x1E0DC32A8];
  v17[0] = *MEMORY[0x1E0DC32A0];
  v17[1] = v10;
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v5, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);
  return v15;
}

- (id)_fontForFontNotification:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D8B308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemForNotification:(id)a3
{
  NSMutableDictionary *fontToItemDictionary;
  void *v4;
  void *v5;

  fontToItemDictionary = self->_fontToItemDictionary;
  -[_SFReaderFontOptionsGroupController _fontForFontNotification:](self, "_fontForFontNotification:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fontToItemDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_viewForNotification:(id)a3
{
  NSMutableDictionary *fontToViewDictionary;
  void *v4;
  void *v5;

  fontToViewDictionary = self->_fontToViewDictionary;
  -[_SFReaderFontOptionsGroupController _fontForFontNotification:](self, "_fontForFontNotification:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fontToViewDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_downloadAccessoryForNotification:(id)a3
{
  void *v3;
  void *v4;

  -[_SFReaderFontOptionsGroupController _viewForNotification:](self, "_viewForNotification:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_fontDownloadDidBegin:(id)a3
{
  void *v3;
  double v4;
  id v5;

  -[_SFReaderFontOptionsGroupController _downloadAccessoryForNotification:](self, "_downloadAccessoryForNotification:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDownloading:", 1);
  objc_msgSend(v5, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setProgress:", v4);

}

- (void)_fontDownloadDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SFReaderContext *readerContext;
  void *v9;
  id v10;

  v4 = a3;
  -[_SFReaderFontOptionsGroupController _fontForFontNotification:](self, "_fontForFontNotification:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFReaderFontOptionsGroupController _itemForNotification:](self, "_itemForNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFReaderFontOptionsGroupController _attributedStringForReaderFont:](self, "_attributedStringForReaderFont:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedTitle:", v6);

  objc_msgSend(v5, "setEnabled:", 1);
  -[_SFReaderFontOptionsGroupController _viewForNotification:](self, "_viewForNotification:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessoryView:", 0);
  readerContext = self->_readerContext;
  objc_msgSend(v10, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderContext activateFont:](readerContext, "activateFont:", v9);

}

- (void)_fontDownloadDidFail:(id)a3
{
  id v3;

  -[_SFReaderFontOptionsGroupController _downloadAccessoryForNotification:](self, "_downloadAccessoryForNotification:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDownloading:", 0);

}

- (void)_fontDownloadProgressDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0D8AB70];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFReaderFontOptionsGroupController _fontForFontNotification:](self, "_fontForFontNotification:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadProgressForFont:", v7);
  v9 = v8 / 100.0;

  -[_SFReaderFontOptionsGroupController _downloadAccessoryForNotification:](self, "_downloadAccessoryForNotification:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "progressView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = v9;
  LODWORD(v11) = LODWORD(v9);
  objc_msgSend(v10, "setProgress:", v11);

}

- (SFReaderContext)readerContext
{
  return self->_readerContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerContext, 0);
  objc_storeStrong((id *)&self->_fontInstallationStatusQueue, 0);
  objc_storeStrong((id *)&self->_fontToViewDictionary, 0);
  objc_storeStrong((id *)&self->_fontToItemDictionary, 0);
}

@end
