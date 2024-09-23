@implementation ICAttachmentBrickView

+ (CGSize)defaultBrickSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 327.0;
  v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)usesSmallSizeForAttachment:(id)a3 withMetadata:(id)a4 type:(unint64_t)a5 insideSystemPaper:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  char v11;
  int v13;
  char v14;
  BOOL v15;
  void *v16;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  if (!v10
    || objc_msgSend(v9, "attachmentType") == 6
    || objc_msgSend(v9, "attachmentType") == 4
    || objc_msgSend(v9, "attachmentType") == 2)
  {
    v11 = 1;
  }
  else
  {
    v13 = objc_msgSend(v9, "preferredViewSize");
    v14 = 1;
    if (objc_msgSend(v9, "isURL") && !v13)
      v14 = a5 != 2 || v6;
    v15 = 1;
    if (objc_msgSend(v9, "hasSynapseLink") && v6)
    {
      objc_msgSend(v10, "selectedText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16 == 0;

    }
    v11 = v14 & v15;
  }

  return v11;
}

+ (CGSize)sizeForAttachment:(id)a3 usesSmallSize:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  v6 = v5;
  if (a4 || objc_msgSend(v5, "alwaysUsesSmallSize"))
  {
    objc_msgSend((id)objc_opt_class(), "defaultBrickSize");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v10 = 0x406B800000000000;
    v8 = 0x4074700000000000;
  }

  v11 = *(double *)&v8;
  v12 = *(double *)&v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (UIColor)standardBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
}

- (ICAttachmentBrickView)initWithType:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  ICAttachmentBrickView *v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  LPLinkView *linkView;
  void *v14;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend((id)objc_opt_class(), "defaultBrickSize");
  v6 = v5;
  v8 = v7;
  v16.receiver = self;
  v16.super_class = (Class)ICAttachmentBrickView;
  v9 = -[ICAttachmentBrickView initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, v5, v7);
  if (v9)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)getLPLinkViewClass_softClass;
    v21 = getLPLinkViewClass_softClass;
    if (!getLPLinkViewClass_softClass)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getLPLinkViewClass_block_invoke;
      v17[3] = &unk_1E5C1DE18;
      v17[4] = &v18;
      __getLPLinkViewClass_block_invoke((uint64_t)v17);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    v12 = objc_msgSend([v11 alloc], "initWithFrame:", 0.0, 0.0, v6, v8);
    linkView = v9->_linkView;
    v9->_linkView = (LPLinkView *)v12;

    v9->_type = a3;
    -[LPLinkView _setPreferredSizeClass:](v9->_linkView, "_setPreferredSizeClass:", 8);
    -[LPLinkView setDelegate:](v9->_linkView, "setDelegate:", v9);
    -[LPLinkView _setDisableTapGesture:](v9->_linkView, "_setDisableTapGesture:", 1);
    -[LPLinkView _setDisableHighlightGesture:](v9->_linkView, "_setDisableHighlightGesture:", 0);
    if (a3 != 2)
    {
      -[LPLinkView _setDisableAnimations:](v9->_linkView, "_setDisableAnimations:", 1);
      -[LPLinkView _setDisableHighlightGesture:](v9->_linkView, "_setDisableHighlightGesture:", 1);
      -[LPLinkView _setDisableAutoPlay:](v9->_linkView, "_setDisableAutoPlay:", 1);
    }
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") && (a3 > 4 || ((1 << a3) & 0x1A) == 0))
    {
      -[LPLinkView setOverrideUserInterfaceStyle:](v9->_linkView, "setOverrideUserInterfaceStyle:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkView _setOverrideBackgroundColor:](v9->_linkView, "_setOverrideBackgroundColor:", v14);

    }
    -[ICAttachmentBrickView updateSearchResultBackgroundColorIfNecessary](v9, "updateSearchResultBackgroundColorIfNecessary");
    -[ICAttachmentBrickView registerForTraitChanges](v9, "registerForTraitChanges");
    -[ICAttachmentBrickView updateAttachmentBackgroundColorIfNecessary](v9, "updateAttachmentBackgroundColorIfNecessary");
    -[ICAttachmentBrickView addSubview:](v9, "addSubview:", v9->_linkView);
    -[ICAttachmentBrickView constrainViews](v9, "constrainViews");
  }
  return v9;
}

- (void)setAttachment:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_attachment, obj);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D63608];
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D63608], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D63660];
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0D63660], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D63768];
    objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D63768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("ICAttachmentDidFailFetchingMetadataNotification"), 0);

    v5 = obj;
    if (obj)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_attachmentDidLoadNotification_, v7, v14);

      if (objc_msgSend(obj, "attachmentType") == 6
        || objc_msgSend(obj, "attachmentType") == 4
        || objc_msgSend(obj, "attachmentType") == 2)
      {
        v15 = 1;
      }
      else
      {
        v15 = objc_msgSend(obj, "hasFallbackPDF");
      }
      if (objc_msgSend(obj, "attachmentType") == 8
        || objc_msgSend(obj, "attachmentType") == 15
        || (objc_msgSend(obj, "attachmentType") == 11 ? (v16 = 1) : (v16 = v15), v16 == 1))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_attachmentPreviewImagesDidUpdateNotification_, v9, v18);

      }
      if (objc_msgSend(obj, "attachmentType") == 8
        || objc_msgSend(obj, "attachmentType") == 7)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_initialAttachmentPreviewDidLoad_, CFSTR("ICAttachmentInitialPreviewDidLoadNotification"), v20);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_didFailFetchingMetadataNotification_, CFSTR("ICAttachmentDidFailFetchingMetadataNotification"), obj);
      }
      else
      {
        if (!v15)
          goto LABEL_18;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "media");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_mediaDidLoadNotification_, v11, v24);

      }
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive, *MEMORY[0x1E0DC4750], 0);

      -[ICAttachmentBrickView reloadData](self, "reloadData");
      v5 = obj;
    }
  }

}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  v5 = a3;
  objc_msgSend(v5, "normalRegex");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentBrickView linkView](self, "linkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setEmphasizedTextExpression:", v7);

}

- (void)setShareExtensionAttachmentInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_storeWeak((id *)&self->_shareExtensionAttachmentInfo, v4);
  objc_msgSend(v4, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentBrickView setAttachment:](self, "setAttachment:", v6);
  }
  else
  {
    objc_msgSend(v4, "mediaURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)getLPMetadataProviderClass_softClass_2;
    v19 = getLPMetadataProviderClass_softClass_2;
    v8 = MEMORY[0x1E0C809B0];
    if (!getLPMetadataProviderClass_softClass_2)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getLPMetadataProviderClass_block_invoke_2;
      v15[3] = &unk_1E5C1DE18;
      v15[4] = &v16;
      __getLPMetadataProviderClass_block_invoke_2((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    v10 = objc_alloc_init(v9);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __57__ICAttachmentBrickView_setShareExtensionAttachmentInfo___block_invoke;
    v12[3] = &unk_1E5C23E00;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v10, "startFetchingMetadataForURL:completionHandler:", v6, v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }

  -[ICAttachmentBrickView linkView](self, "linkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setDisablePlayback:", 1);

}

void __57__ICAttachmentBrickView_setShareExtensionAttachmentInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v5;
  performBlockOnMainThread();

  objc_destroyWeak(&v8);
}

void __57__ICAttachmentBrickView_setShareExtensionAttachmentInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetadata:", v2);

  objc_msgSend(WeakRetained, "notifyClientsAboutSizeChangesIfNecessary");
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
  -[ICAttachmentBrickView adjustSizeIfNecessary](self, "adjustSizeIfNecessary");
}

- (void)reloadData
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentBrickView attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSynapseLink");

    if (v5)
    {
      -[ICAttachmentBrickView displaySynapseAttachmentPreview](self, "displaySynapseAttachmentPreview");
LABEL_15:
      -[ICAttachmentBrickView adjustSizeIfNecessary](self, "adjustSizeIfNecessary");
      -[ICAttachmentBrickView updateAttachmentBackgroundColorIfNecessary](self, "updateAttachmentBackgroundColorIfNecessary");
      return;
    }
    -[ICAttachmentBrickView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ic_isWebURL");

    if (v8)
    {
      -[ICAttachmentBrickView displayRemoteAttachmentPreview](self, "displayRemoteAttachmentPreview");
      goto LABEL_15;
    }
    -[ICAttachmentBrickView attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[ICAttachmentBrickView attachment](self, "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "ic_isWebURL");

      if ((v14 & 1) == 0)
      {
        -[ICAttachmentBrickView displayGenericURLPreview](self, "displayGenericURLPreview");
        goto LABEL_15;
      }
    }
    else
    {

    }
    -[ICAttachmentBrickView attachment](self, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "attachmentType") == 11)
    {

LABEL_14:
      -[ICAttachmentBrickView displayScannedDocumentsPreview](self, "displayScannedDocumentsPreview");
      goto LABEL_15;
    }
    -[ICAttachmentBrickView attachment](self, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "attachmentType");

    if (v17 == 15)
      goto LABEL_14;
    -[ICAttachmentBrickView attachment](self, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isPasswordProtected"))
    {

    }
    else
    {
      -[ICAttachmentBrickView attachment](self, "attachment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasFallbackPDF");

      if (v20)
        goto LABEL_23;
    }
    -[ICAttachmentBrickView attachment](self, "attachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "attachmentType");

    if (v22 == 1)
    {
      -[ICAttachmentBrickView displayUnsupportedAttachmentPreview](self, "displayUnsupportedAttachmentPreview");
      goto LABEL_15;
    }
    -[ICAttachmentBrickView attachment](self, "attachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isLoadingFromCloud");

    if (v24)
    {
      -[ICAttachmentBrickView linkView](self, "linkView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentBrickView attachment](self, "attachment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "loadingAttachmentsMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_setMetadata:isFinal:", v27, 0);

      goto LABEL_15;
    }
LABEL_23:
    -[ICAttachmentBrickView displayFilePreview](self, "displayFilePreview");
    goto LABEL_15;
  }
}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentBrickView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    -[ICAttachmentBrickView attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__ICAttachmentBrickView_updateTitle__block_invoke;
    v9[3] = &unk_1E5C23E28;
    objc_copyWeak(&v12, &location);
    v10 = v4;
    v11 = v5;
    objc_msgSend(v8, "performBlock:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __36__ICAttachmentBrickView_updateTitle__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[5], "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTitle:", v2);

  objc_opt_class();
  objc_msgSend(a1[4], "specialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1[5], "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

    objc_msgSend(a1[4], "setSpecialization:", v4);
  }
  objc_msgSend(WeakRetained, "updateUIWithMetadata:", a1[4]);

}

- (void)prepareForReuse
{
  -[ICAttachmentBrickView setSelected:](self, "setSelected:", 0);
  -[ICAttachmentBrickView setHighlightColor:](self, "setHighlightColor:", 0);
  -[ICAttachmentBrickView setHighlightPatternRegexFinder:](self, "setHighlightPatternRegexFinder:", 0);
  -[ICAttachmentBrickView setAttachment:](self, "setAttachment:", 0);
}

- (void)setHighlightColor:(id)a3
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)&self->_highlightColor, a3);
  v5 = a3;
  if (v5)
    v6 = 2.0;
  else
    v6 = 0.0;
  -[ICAttachmentBrickView linkView](self, "linkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", v6);

  v9 = objc_retainAutorelease(v5);
  v10 = objc_msgSend(v9, "CGColor");

  -[ICAttachmentBrickView linkView](self, "linkView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v10);

}

- (double)effectiveLayoutCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cornerRadius");
  v4 = v3;

  return v4;
}

- (CGSize)computedSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView frame](self, "frame");
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(v13), 800.0);
  v5 = v4;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v8 = v7;

  if (v5 >= v8)
    v9 = v5;
  else
    v9 = v8;
  v10 = 72.0;
  if (v9 >= 72.0)
    v10 = v9;
  v11 = 327.0;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)updateAttachmentBackgroundColorIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E5C71B20);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachmentBrickView attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithShort:", objc_msgSend(v4, "attachmentType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "containsObject:", v5);

    if ((v6 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "standardBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkView _setOverrideBackgroundColor:](self->_linkView, "_setOverrideBackgroundColor:", v7);

    }
    else
    {
      -[LPLinkView _setOverrideBackgroundColor:](self->_linkView, "_setOverrideBackgroundColor:", 0);
    }

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_selected = a3;
  -[ICAttachmentBrickView updateSearchResultBackgroundColorIfNecessary](self, "updateSearchResultBackgroundColorIfNecessary");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICSelectedAttachmentBrickHighlightColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[ICAttachmentBrickView linkView](self, "linkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  if (v3)
}

- (id)quickLookTransitionView
{
  void *v2;
  void *v3;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_primaryMediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentBrickView;
  -[ICAttachmentBrickView layoutSubviews](&v3, sel_layoutSubviews);
  -[ICAttachmentBrickView setHasPerformedInitialLayout:](self, "setHasPerformedInitialLayout:", 1);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[ICAttachmentBrickView typeDescriptionForAccessibility](self, "typeDescriptionForAccessibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView linkView](self, "linkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)typeDescriptionForAccessibility
{
  void *v3;
  int v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "attachmentType");

  switch(v4)
  {
    case 0:
    case 1:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("attachment");
      goto LABEL_14;
    case 2:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("file attachment");
      goto LABEL_14;
    case 3:
    case 5:
    case 9:
    case 10:
    case 12:
    case 13:
      v5 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICAttachmentBrickView typeDescriptionForAccessibility].cold.1(v5);

      v6 = &stru_1E5C2F8C0;
      return v6;
    case 4:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("audio attachment");
      goto LABEL_14;
    case 6:
    case 14:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("PDF attachment");
      goto LABEL_14;
    case 7:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("map attachment");
      goto LABEL_14;
    case 8:
      -[ICAttachmentBrickView attachment](self, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isAppStore");

      if (v10)
      {
        v7 = (void *)MEMORY[0x1E0D64218];
        v8 = CFSTR("app attachment");
LABEL_14:
        objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      -[ICAttachmentBrickView attachment](self, "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isiTunes");

      if (!v13)
      {
        -[ICAttachmentBrickView attachment](self, "attachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isNews");

        v7 = (void *)MEMORY[0x1E0D64218];
        if (v19)
          v8 = CFSTR("news article attachment");
        else
          v8 = CFSTR("website attachment");
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("iTunes media attachment"), CFSTR("iTunes media attachment"), 0, 1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentBrickView attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D63618]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("book attachment"), CFSTR("book attachment"), 0, 1);
          v17 = objc_claimAutoreleasedReturnValue();

          v6 = (__CFString *)v17;
        }
      }

      return v6;
    case 11:
    case 15:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("scanned document attachment");
      goto LABEL_14;
    default:
      v6 = 0;
      return v6;
  }
}

- (id)_linkView:(id)a3 contextMenuConfigurationForSuggestedConfiguration:(id)a4
{
  return 0;
}

- (void)linkViewNeedsResize:(id)a3
{
  if (-[ICAttachmentBrickView type](self, "type", a3) == 2)
    -[ICAttachmentBrickView notifyClientsAboutSizeChangesIfNecessary](self, "notifyClientsAboutSizeChangesIfNecessary");
}

- (void)linkView:(id)a3 didFetchMetadata:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[ICAttachmentBrickView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistLinkMetadata:", v5);

  if (-[ICAttachmentBrickView type](self, "type") == 2)
    -[ICAttachmentBrickView notifyClientsAboutSizeChangesIfNecessary](self, "notifyClientsAboutSizeChangesIfNecessary");
}

- (void)attachmentDidLoadNotification:(id)a3
{
  if (!-[ICAttachmentBrickView isMetadataComplete](self, "isMetadataComplete", a3))
    -[ICAttachmentBrickView reloadData](self, "reloadData");
}

- (void)attachmentPreviewImagesDidUpdateNotification:(id)a3
{
  void *v3;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v5 = -[ICAttachmentBrickView isMetadataComplete](self, "isMetadataComplete", a3);
  if (!v5)
  {
    -[ICAttachmentBrickView attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "hasSynapseLink"))
    {
LABEL_5:

LABEL_9:
      -[ICAttachmentBrickView linkView](self, "linkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

        -[ICAttachmentBrickView reloadData](self, "reloadData");
      }
      else
      {
        -[ICAttachmentBrickView attachment](self, "attachment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "metadataExists");

        -[ICAttachmentBrickView reloadData](self, "reloadData");
        if (v13)
        {
          if (-[ICAttachmentBrickView type](self, "type") == 2)
            -[ICAttachmentBrickView notifyClientsAboutSizeChangesIfNecessary](self, "notifyClientsAboutSizeChangesIfNecessary");
        }
      }
      return;
    }
  }
  -[ICAttachmentBrickView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "attachmentType") == 11)
  {

    if (v5)
      goto LABEL_9;
    goto LABEL_5;
  }
  -[ICAttachmentBrickView attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "attachmentType");

  if (!v5)
  if (v8 == 15)
    goto LABEL_9;
}

- (void)initialAttachmentPreviewDidLoad:(id)a3
{
  -[ICAttachmentBrickView reloadData](self, "reloadData", a3);
  if (-[ICAttachmentBrickView type](self, "type") == 2)
    -[ICAttachmentBrickView notifyClientsAboutSizeChangesIfNecessary](self, "notifyClientsAboutSizeChangesIfNecessary");
}

- (void)mediaDidLoadNotification:(id)a3
{
  dispatchMainAfterDelay();
}

uint64_t __50__ICAttachmentBrickView_mediaDidLoadNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)didFailFetchingMetadataNotification:(id)a3
{
  id v4;
  id v5;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  performBlockOnMainThread();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __61__ICAttachmentBrickView_didFailFetchingMetadataNotification___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "linkView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setWaitingForMetadata:", 0);
  objc_msgSend(WeakRetained, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setMetadata:isFinal:", v2, 1);

}

- (void)applicationDidBecomeActive
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredViewSize");

  -[ICAttachmentBrickView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ic_isBooksURL");

  if (v7)
  {
    if (!v4)
      -[ICAttachmentBrickView reloadData](self, "reloadData");
  }
}

- (void)play
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudio");

  if (v4)
  {
    +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentBrickView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
      objc_msgSend(v8, "stop");
    -[ICAttachmentBrickView attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "play:", v7);

  }
}

- (void)pause
{
  void *v2;
  int v3;
  id v4;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAudio");

  if (v3)
  {
    +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

  }
}

- (void)reset
{
  void *v2;
  int v3;
  id v4;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAudio");

  if (v3)
  {
    +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

  }
}

- (void)addClient:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudio");

  if (v5)
  {
    -[ICAttachmentBrickView audioPlayerClients](self, "audioPlayerClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentBrickView setAudioPlayerClients:](self, "setAudioPlayerClients:", v7);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentBrickView attachment](self, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_progressChangedNotification_, CFSTR("ICAudioPlaybackTimeChangedNotification"), v9);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_playbackStartedNotification_, CFSTR("ICAudioPlaybackPlayNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentBrickView attachment](self, "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_playbackPausedNotification_, CFSTR("ICAudioPlaybackPauseNotification"), v12);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentBrickView attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_playbackStoppedNotification_, CFSTR("ICAudioPlaybackStopNotification"), v14);

    }
    -[ICAttachmentBrickView audioPlayerClients](self, "audioPlayerClients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
}

- (void)removeClient:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudio");

  if (v5)
  {
    -[ICAttachmentBrickView audioPlayerClients](self, "audioPlayerClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

  }
}

- (id)_linkView:(id)a3 playerForAudio:(id)a4
{
  void *v5;
  int v6;
  ICAttachmentBrickView *v7;

  -[ICAttachmentBrickView attachment](self, "attachment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudio");

  if (v6)
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (void)playbackStartedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
    v6 = 2;
  else
    v6 = 4;

  -[ICAttachmentBrickView updateAudioClientsState:](self, "updateAudioClientsState:", v6);
}

- (void)playbackPausedNotification:(id)a3
{
  -[ICAttachmentBrickView updateAudioClientsState:](self, "updateAudioClientsState:", 3);
}

- (void)progressChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ICAudioPlaybackNotificationTimeKey"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICAudioPlaybackNotificationDurationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "floatValue");
  v9 = v8;
  objc_msgSend(v7, "floatValue");
  if ((float)(v9 / v10) >= 1.0)
    -[ICAttachmentBrickView resetPlaybackProgressAndState](self, "resetPlaybackProgressAndState");
  else
    -[ICAttachmentBrickView updateAudioClientsProgress:](self, "updateAudioClientsProgress:");

}

- (void)resetPlaybackProgressAndState
{
  double v3;

  -[ICAttachmentBrickView updateAudioClientsState:](self, "updateAudioClientsState:", 0);
  LODWORD(v3) = 0;
  -[ICAttachmentBrickView updateAudioClientsProgress:](self, "updateAudioClientsProgress:", v3);
}

- (void)updateAudioClientsState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICAttachmentBrickView audioPlayerClients](self, "audioPlayerClients", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "audioPlayer:didTransitionToState:", self, a3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[ICAttachmentBrickView setPlayerState:](self, "setPlayerState:", a3);
}

- (void)updateAudioClientsProgress:(float)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICAttachmentBrickView audioPlayerClients](self, "audioPlayerClients", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        *(float *)&v9 = a3;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "audioPlayer:didChangeProgress:", self, v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  *(float *)&v13 = a3;
  -[ICAttachmentBrickView setPlaybackProgress:](self, "setPlaybackProgress:", v13);
}

- (void)displaySynapseAttachmentPreview
{
  void *v3;
  id v4;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synapseBasedMetadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentBrickView updateUIWithMetadata:](self, "updateUIWithMetadata:", v4);
}

- (void)displayRemoteAttachmentPreview
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveLinkMetadata");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ICAttachmentBrickView setWaitingForMetadata:](self, "setWaitingForMetadata:", 0);
    goto LABEL_9;
  }
  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wasCreatedByCurrentUser");

  if ((v5 & 1) == 0)
  {
    -[ICAttachmentBrickView attachment](self, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentBrickView linkView](self, "linkView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setURL:", v15);

    -[ICAttachmentBrickView linkView](self, "linkView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setAllowsTapToLoad:", 1);

    v13 = 0;
    goto LABEL_15;
  }
  -[ICAttachmentBrickView shareExtensionAttachmentInfo](self, "shareExtensionAttachmentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_7;
  if (!-[ICAttachmentBrickView waitingForMetadata](self, "waitingForMetadata"))
  {
    -[ICAttachmentBrickView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestRemoteMetadata");
LABEL_7:

  }
  -[ICAttachmentBrickView setWaitingForMetadata:](self, "setWaitingForMetadata:", 1);
  -[ICAttachmentBrickView attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fallbackRemoteAttachmentMetadata");
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  -[ICAttachmentBrickView attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPreviewImageToMetadata:", v18);

  if (-[ICAttachmentBrickView waitingForMetadata](self, "waitingForMetadata"))
  {
    -[ICAttachmentBrickView attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "urlExpired");

    -[ICAttachmentBrickView linkView](self, "linkView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setMetadata:isFinal:", v18, v10);

    if ((v10 & 1) == 0)
      goto LABEL_14;
  }
  else
  {
    -[ICAttachmentBrickView linkView](self, "linkView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setMetadata:isFinal:", v18, 1);

  }
  -[ICAttachmentBrickView notifyClientsAboutSizeChangesIfNecessary](self, "notifyClientsAboutSizeChangesIfNecessary");
LABEL_14:
  v13 = v18;
LABEL_15:

}

- (void)displayGenericURLPreview
{
  void *v3;
  id v4;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plainURLMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView updateUIWithMetadata:](self, "updateUIWithMetadata:", v3);

}

- (void)displayFilePreview
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "attachmentType") == 4)
  {

LABEL_5:
    -[ICAttachmentBrickView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "metadataExists");

  if (!v5)
    goto LABEL_5;
  -[ICAttachmentBrickView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveLinkMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (id)v7;

  -[ICAttachmentBrickView updateUIWithMetadata:](self, "updateUIWithMetadata:", v9);
  -[ICAttachmentBrickView attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestFileMetadataIfNecessary");

}

- (void)displayScannedDocumentsPreview
{
  void *v3;
  id v4;

  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scannedDocumentsMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView updateUIWithMetadata:](self, "updateUIWithMetadata:", v3);

}

- (void)displayUnsupportedAttachmentPreview
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v3 = (void *)getLPLinkMetadataClass_softClass_1;
  v18 = getLPLinkMetadataClass_softClass_1;
  if (!getLPLinkMetadataClass_softClass_1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getLPLinkMetadataClass_block_invoke_1;
    v14[3] = &unk_1E5C1DE18;
    v14[4] = &v15;
    __getLPLinkMetadataClass_block_invoke_1((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v15, 8);
  v5 = objc_alloc_init(v4);
  -[ICAttachmentBrickView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsupportedAttachmentTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[ICAttachmentBrickView attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unsupportedAttachmentSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSummary:", v9);

  -[ICAttachmentBrickView attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPreviewImageToMetadata:", v5);

  objc_msgSend(v5, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("paperclip"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v12);
    objc_msgSend(v5, "setImage:", v13);

  }
  -[ICAttachmentBrickView updateUIWithMetadata:](self, "updateUIWithMetadata:", v5);

}

- (void)updateUIWithMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (ICInternalSettingsIsPDFsInNotesEnabled())
  {
    -[ICAttachmentBrickView attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "attachmentType") != 6)
    {
      -[ICAttachmentBrickView attachment](self, "attachment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "attachmentType") != 14)
      {
        -[ICAttachmentBrickView attachment](self, "attachment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "attachmentType");

        if (v12 != 15)
        {
          -[ICAttachmentBrickView attachment](self, "attachment");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "attachmentType");

          if (v14 != 11)
            goto LABEL_8;
          objc_msgSend(v4, "title");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "ic_truncatedStringWithMaxLength:truncated:", 30, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setTitle:", v9);
          goto LABEL_7;
        }
LABEL_6:
        objc_opt_class();
        objc_msgSend(v4, "specialization");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_truncatedStringWithMaxLength:truncated:", 30, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setName:", v10);

LABEL_7:
        goto LABEL_8;
      }

    }
    goto LABEL_6;
  }
LABEL_8:
  objc_initWeak(&location, self);
  objc_copyWeak(&v16, &location);
  v15 = v4;
  performBlockOnMainThread();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __46__ICAttachmentBrickView_updateUIWithMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetadata:", v2);

}

- (void)adjustSizeIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v3 = (void *)objc_opt_class();
  -[ICAttachmentBrickView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView linkView](self, "linkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "usesSmallSizeForAttachment:withMetadata:type:insideSystemPaper:", v4, v6, -[ICAttachmentBrickView type](self, "type"), -[ICAttachmentBrickView isInsideSystemPaper](self, "isInsideSystemPaper"));

  if ((_DWORD)v3)
    v7 = 8;
  else
    v7 = 9;
  -[ICAttachmentBrickView linkView](self, "linkView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setPreferredSizeClass:", v7);

  -[ICAttachmentBrickView effectiveLayoutCornerRadius](self, "effectiveLayoutCornerRadius");
  v10 = v9;
  -[ICAttachmentBrickView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

  -[ICAttachmentBrickView effectiveLayoutCornerRadius](self, "effectiveLayoutCornerRadius");
  v13 = v12;
  -[ICAttachmentBrickView linkView](self, "linkView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v13);

}

- (void)notifyClientsAboutSizeChangesIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double Height;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;

  -[ICAttachmentBrickView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentBrickView linkView](self, "linkView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeThatFits:", 327.0, 800.0);
    v6 = v5;

    if (-[ICAttachmentBrickView hasPerformedInitialLayout](self, "hasPerformedInitialLayout"))
    {
      if (v6 > 72.0)
      {
        -[ICAttachmentBrickView linkView](self, "linkView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "frame");
        Height = CGRectGetHeight(v13);

        if (v6 != Height)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v9 = *MEMORY[0x1E0D635F0];
          -[ICAttachmentBrickView attachment](self, "attachment");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "postNotificationName:object:", v9, v11);

        }
      }
    }
  }
}

- (void)constrainViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[ICAttachmentBrickView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICAttachmentBrickView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICAttachmentBrickView linkView](self, "linkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentBrickView linkView](self, "linkView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentBrickView linkView](self, "linkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView leadingAnchor](self, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentBrickView linkView](self, "linkView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentBrickView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3718];
  v27[0] = v7;
  v27[1] = v11;
  v27[2] = v15;
  v27[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v21);

  if (-[ICAttachmentBrickView type](self, "type")
    && -[ICAttachmentBrickView type](self, "type") != 1
    && !-[ICAttachmentBrickView isInsideSystemPaper](self, "isInsideSystemPaper"))
  {
    if (-[ICAttachmentBrickView type](self, "type") == 3)
    {
      v22 = -1;
    }
    else if (-[ICAttachmentBrickView type](self, "type") == 4)
    {
      v22 = -1;
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, v22, 0, 0, 1.0, 327.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentBrickView setWidthConstraint:](self, "setWidthConstraint:", v23);

    -[ICAttachmentBrickView widthConstraint](self, "widthConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

  }
  if (-[ICAttachmentBrickView type](self, "type") == 4 || -[ICAttachmentBrickView type](self, "type") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 1, 0, 0, 1.0, 72.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentBrickView setHeightConstraint:](self, "setHeightConstraint:", v25);

    -[ICAttachmentBrickView heightConstraint](self, "heightConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

  }
}

- (void)updateSearchResultBackgroundColorIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[ICAttachmentBrickView type](self, "type") != 1)
  {
    -[ICAttachmentBrickView updateAttachmentBackgroundColorIfNecessary](self, "updateAttachmentBackgroundColorIfNecessary");
    return;
  }
  -[ICAttachmentBrickView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (-[ICAttachmentBrickView selected](self, "selected"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v5;
LABEL_9:
  -[ICAttachmentBrickView linkView](self, "linkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setOverrideBackgroundColor:", v7);

}

- (void)registerForTraitChanges
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)-[ICAttachmentBrickView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_updateSearchResultBackgroundColorIfNecessary);

}

- (BOOL)isMetadataComplete
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICAttachmentBrickView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    -[ICAttachmentBrickView linkView](self, "linkView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 != 0;

  }
  return v6;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (ICAddAttachmentsManagerAttachmentInfo)shareExtensionAttachmentInfo
{
  return (ICAddAttachmentsManagerAttachmentInfo *)objc_loadWeakRetained((id *)&self->_shareExtensionAttachmentInfo);
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)isInsideSystemPaper
{
  return self->_insideSystemPaper;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSHashTable)audioPlayerClients
{
  return self->_audioPlayerClients;
}

- (void)setAudioPlayerClients:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayerClients, a3);
}

- (unint64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(unint64_t)a3
{
  self->_playerState = a3;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (void)setPlaybackProgress:(float)a3
{
  self->_playbackProgress = a3;
}

- (BOOL)waitingForMetadata
{
  return self->_waitingForMetadata;
}

- (void)setWaitingForMetadata:(BOOL)a3
{
  self->_waitingForMetadata = a3;
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_hasPerformedInitialLayout;
}

- (void)setHasPerformedInitialLayout:(BOOL)a3
{
  self->_hasPerformedInitialLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayerClients, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_destroyWeak((id *)&self->_shareExtensionAttachmentInfo);
  objc_destroyWeak((id *)&self->_attachment);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
}

- (void)typeDescriptionForAccessibility
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Wrong attachment type used for brick attachments", v1, 2u);
}

@end
