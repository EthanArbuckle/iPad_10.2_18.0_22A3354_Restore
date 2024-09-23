@implementation CKDefaultPluginEntryViewController

- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4
{

  return 0;
}

- (void)payloadWillClear
{
  void *v3;
  char v4;
  id v5;

  -[CKDefaultPluginEntryViewController pluginBubbleViewController](self, "pluginBubbleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKDefaultPluginEntryViewController pluginBubbleViewController](self, "pluginBubbleViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearShelfPayload");

  }
}

- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4 andPlugin:(id)a5
{
  return -[CKDefaultPluginEntryViewController initWithDataSource:entryViewDelegate:andPlugin:customizationPickerDelegate:](self, "initWithDataSource:entryViewDelegate:andPlugin:customizationPickerDelegate:", a3, a4, a5, 0);
}

- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4 andPlugin:(id)a5 customizationPickerDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  CKDefaultPluginEntryViewController *v12;
  CKDefaultPluginEntryViewController *v13;
  uint64_t v14;
  UIContextMenuInteraction *contextMenuInteraction;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKDefaultPluginEntryViewController;
  v12 = -[CKDefaultPluginEntryViewController init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    -[CKDefaultPluginEntryViewController setDatasource:](v12, "setDatasource:", v9);
    -[CKDefaultPluginEntryViewController setPlugin:](v13, "setPlugin:", v10);
    if (CKIsRunningInMacCatalyst())
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4B8]), "initWithDelegate:", v13);
      contextMenuInteraction = v13->_contextMenuInteraction;
      v13->_contextMenuInteraction = (UIContextMenuInteraction *)v14;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[CKDefaultPluginEntryViewController plugin](v13, "plugin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc((Class)objc_msgSend(v16, "bubbleClass"));
      -[CKDefaultPluginEntryViewController datasource](v13, "datasource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithDataSource:isFromMe:", v18, 1);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "setCustomizationPickerDelegate:", v11);
      -[CKDefaultPluginEntryViewController setPluginBubbleViewController:](v13, "setPluginBubbleViewController:", v19);

    }
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKDefaultPluginEntryViewController;
  -[CKDefaultPluginEntryViewController dealloc](&v4, sel_dealloc);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  objc_msgSend(a3, "view", a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {

LABEL_10:
    v14 = 0;
    return v14;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKDefaultPluginEntryViewController _copyActionForImageBalloonView](self, "_copyActionForImageBalloonView");
  -[CKDefaultPluginEntryViewController _saveActionForImageBalloonView](self, "_saveActionForImageBalloonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  if (v10)
    objc_msgSend(v8, "addObject:", v10);
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)MEMORY[0x1E0CEA4B0];
    -[CKDefaultPluginEntryViewController plugin](self, "plugin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__CKDefaultPluginEntryViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_1E274B290;
    v17 = v8;
    objc_msgSend(v11, "configurationWithIdentifier:previewProvider:actionProvider:", v13, 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __92__CKDefaultPluginEntryViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, *(_QWORD *)(a1 + 32));
}

- (id)_copyActionForImageBalloonView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("COPY"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CKDefaultPluginEntryViewController__copyActionForImageBalloonView__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __68__CKDefaultPluginEntryViewController__copyActionForImageBalloonView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "datasource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pasteboardItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItemProviders:", v6);

  }
}

- (id)_saveActionForImageBalloonView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;

  -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        location = 0;
        objc_initWeak(&location, self);
        v7 = (void *)MEMORY[0x1E0CEA2A8];
        CKFrameworkBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SEARCH_ADD_TO_PHOTOS_LIBRARY"), &stru_1E276D870, CFSTR("ChatKit"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __68__CKDefaultPluginEntryViewController__saveActionForImageBalloonView__block_invoke;
        v12[3] = &unk_1E274A4C0;
        objc_copyWeak(&v13, &location);
        objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        return v10;
      }
    }
    else
    {

    }
    v3 = 0;
  }
  return v3;
}

void __68__CKDefaultPluginEntryViewController__saveActionForImageBalloonView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  UIImage *v4;
  UIImage *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "balloonView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "animatedImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v8, "animatedImage");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    -[UIImage image](v4, "image");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImageWriteToSavedPhotosAlbum(v5, 0, 0, 0);

LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  objc_msgSend(v8, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    objc_msgSend(v8, "image");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImageWriteToSavedPhotosAlbum(v4, 0, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKDefaultPluginEntryViewController setView:](self, "setView:", v4);

}

- (void)updateConversationIDAndRecipientsForViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKConversation *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CKDefaultPluginEntryViewController datasource](self, "datasource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  IMBalloonExtensionIDWithSuffix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v5)
  {
    -[CKDefaultPluginEntryViewController datasource](self, "datasource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CKConversation recipientStrings](v10, "recipientStrings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "performSelector:withObject:", sel_setRecipients_, v11);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CKConversation chat](v10, "chat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "performSelector:withObject:", sel_setConversationID_, v13);
      }

    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDefaultPluginEntryViewController;
  -[CKDefaultPluginEntryViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[CKDefaultPluginEntryViewController _loadBalloonView](self, "_loadBalloonView");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKTranscriptBalloonPluginController pluginContentViewController](self->_pluginBubbleViewController, "pluginContentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[CKDefaultPluginEntryViewController updateConversationIDAndRecipientsForViewController:](self, "updateConversationIDAndRecipientsForViewController:", v3);
      -[CKDefaultPluginEntryViewController addChildViewController:](self, "addChildViewController:", v3);
      objc_msgSend(v3, "didMoveToParentViewController:", self);
    }

  }
  -[CKDefaultPluginEntryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[CKDefaultPluginEntryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDefaultPluginEntryViewController;
  -[CKDefaultPluginEntryViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[CKDefaultPluginEntryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDefaultPluginEntryViewController;
  -[CKDefaultPluginEntryViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKTranscriptBalloonPluginController pluginContentViewWillDisappear](self->_pluginBubbleViewController, "pluginContentViewWillDisappear");
}

- (void)performHostAppResume
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKTranscriptBalloonPluginController performHostAppResume](self->_pluginBubbleViewController, "performHostAppResume");
}

- (void)performHostAppSuspend
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKTranscriptBalloonPluginController performHostAppSuspend](self->_pluginBubbleViewController, "performHostAppSuspend");
}

- (void)didFinishAnimatedBoundsChange
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKTranscriptBalloonPluginController didFinishAnimatedBoundsChange](self->_pluginBubbleViewController, "didFinishAnimatedBoundsChange");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKDefaultPluginEntryViewController plugin](self, "plugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375C0]);

  if (v8)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryViewMaxHandWritingPluginShelfHeight");
    v11 = v10;

    v12 = v11 * 2.5;
  }
  else
  {
    -[CKDefaultPluginEntryViewController datasource](self, "datasource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeThatFits:", width, height);
    v12 = v14;
    v11 = v15;

  }
  v16 = v12;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 0;
}

- (void)payloadWillSend
{
  void *v3;
  id v4;

  -[CKDefaultPluginEntryViewController datasource](self, "datasource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStagingContext:", 0);

  -[CKDefaultPluginEntryViewController datasource](self, "datasource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPayloadInShelf:", 0);

}

- (BOOL)wantsClearButton
{
  return 1;
}

- (BOOL)loadedContentView
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CKTranscriptBalloonPluginController hasSizingInfo](self->_pluginBubbleViewController, "hasSizingInfo");
  else
    return 1;
}

- (void)setShowsBalloonTail:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_showsBalloonTail != a3)
  {
    v3 = a3;
    self->_showsBalloonTail = a3;
    -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasTail:", v3);

    -[CKDefaultPluginEntryViewController balloonView](self, "balloonView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareForDisplay");

  }
}

- (void)_loadBalloonView
{
  CKBalloonView *v3;
  CKBalloonView *balloonView;
  void *v5;
  CKBalloonView *v6;
  CKBalloonView *v7;
  CKBalloonView *v8;
  uint64_t v9;

  if (!self->_balloonView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKDefaultPluginEntryViewController _imageBalloon](self, "_imageBalloon");
      v3 = (CKBalloonView *)objc_claimAutoreleasedReturnValue();
      balloonView = self->_balloonView;
      self->_balloonView = v3;

      if (!CKIsRunningInMacCatalyst())
        return;
      -[CKDefaultPluginEntryViewController contextMenuInteraction](self, "contextMenuInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return;
      v6 = self->_balloonView;
      -[CKDefaultPluginEntryViewController contextMenuInteraction](self, "contextMenuInteraction");
      v9 = objc_claimAutoreleasedReturnValue();
      -[CKBalloonView addInteraction:](v6, "addInteraction:", v9);
      v7 = (CKBalloonView *)v9;
    }
    else
    {
      -[CKDefaultPluginEntryViewController _transcriptPluginBalloon](self, "_transcriptPluginBalloon");
      v8 = (CKBalloonView *)objc_claimAutoreleasedReturnValue();
      v7 = self->_balloonView;
      self->_balloonView = v8;
    }

  }
}

- (id)_imageBalloon
{
  return (id)-[IMBalloonPluginDataSource imageBalloon](self->_datasource, "imageBalloon");
}

- (id)_transcriptPluginBalloon
{
  objc_class *v3;
  void *v4;
  void *v5;

  if (self->_pluginBubbleViewController)
  {
    v3 = (objc_class *)objc_opt_class();
    CKBalloonViewForClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v4, "setOrientation:", 1);
    objc_msgSend(v4, "setHasTail:", -[CKDefaultPluginEntryViewController showsBalloonTail](self, "showsBalloonTail"));
    objc_msgSend(v4, "setTextAlignmentInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[CKTranscriptBalloonPluginController pluginContentView](self->_pluginBubbleViewController, "pluginContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPluginView:", v5);

    objc_msgSend(v4, "prepareForDisplay");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)showsBalloonTail
{
  return self->_showsBalloonTail;
}

- (CKTranscriptBalloonPluginController)pluginBubbleViewController
{
  return self->_pluginBubbleViewController;
}

- (void)setPluginBubbleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pluginBubbleViewController, a3);
}

- (IMBalloonPluginDataSource)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
  objc_storeStrong((id *)&self->_datasource, a3);
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_plugin, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_datasource, 0);
  objc_storeStrong((id *)&self->_pluginBubbleViewController, 0);
}

@end
