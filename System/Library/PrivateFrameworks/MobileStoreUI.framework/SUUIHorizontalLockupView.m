@implementation SUUIHorizontalLockupView

- (SUUIHorizontalLockupView)initWithFrame:(CGRect)a3
{
  SUUIHorizontalLockupView *v3;
  uint64_t v4;
  NSMapTable *viewElementViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIHorizontalLockupView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    viewElementViews = v3->_viewElementViews;
    v3->_viewElementViews = (NSMapTable *)v4;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8E48], 0);
  -[SUUIPreviewProgressIndicator removeTarget:action:forControlEvents:](self->_previewProgressIndicator, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapGestureRecognizer, "removeTarget:action:", self, 0);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupView;
  -[SUUIViewReuseView dealloc](&v4, sel_dealloc);
}

- (id)preferredBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUILockupViewElement style](self->_lockupElement, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (-[SUUILockupViewElement lockupViewType](self->_lockupElement, "lockupViewType") == 7)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.109803922, 0.72);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double result;

  +[SUUIStackedImageView maximumPerspectiveHeightForSize:](SUUIStackedImageView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SUUIHorizontalLockupView_setPerspectiveTargetView___block_invoke;
  v4[3] = &unk_2511FA1C8;
  objc_copyWeak(&v5, &location);
  -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BCC8, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SUUIHorizontalLockupView_setPerspectiveTargetView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setPerspectiveTargetView:", WeakRetained);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  _QWORD v3[4];
  CGPoint v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__SUUIHorizontalLockupView_setVanishingPoint___block_invoke;
  v3[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v4 = a3;
  -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BCC8, v3);
}

uint64_t __46__SUUIHorizontalLockupView_setVanishingPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVanishingPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SUUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](self, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x25120BCC8, &__block_literal_global_33);
}

uint64_t __70__SUUIHorizontalLockupView_updateForChangedDistanceFromVanishingPoint__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForChangedDistanceFromVanishingPoint");
}

- (void)hidePreviewProgressAnimated:(BOOL)a3
{
  int64_t previewState;
  SUUIPreviewProgressIndicator *v6;
  SUPlayerStatus *lastPlayerStatus;
  SUUIPreviewProgressIndicator *previewProgressIndicator;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  previewState = self->_previewState;
  if (previewState)
  {
    self->_previewState = 3;
    v6 = self->_previewProgressIndicator;
    lastPlayerStatus = self->_lastPlayerStatus;
    self->_lastPlayerStatus = 0;

    previewProgressIndicator = self->_previewProgressIndicator;
    self->_previewProgressIndicator = 0;

    if (previewState == 2)
    {
      -[SUUIHorizontalLockupView _previewFrontView](self, "_previewFrontView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        -[SUUIHorizontalLockupView _addFlipContainerViewWithFrontView:backView:](self, "_addFlipContainerViewWithFrontView:backView:", v6, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", 0);
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke;
        v13[3] = &unk_2511F6980;
        v12 = v10;
        v14 = v12;
        objc_copyWeak(&v15, &location);
        objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v13);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);

      }
      else
      {
        self->_previewState = 0;
        -[SUUIPreviewProgressIndicator removeFromSuperview](v6, "removeFromSuperview");
        -[SUUIHorizontalLockupView addSubview:](self, "addSubview:", v9);
        -[SUUIHorizontalLockupView setNeedsLayout](self, "setNeedsLayout");
      }

    }
  }
}

void __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke_2;
  v3[3] = &unk_2511F6220;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "flipToBackViewWithDuration:options:completionBlock:", 0x100000, v3, 0.5);

  objc_destroyWeak(&v5);
}

void __56__SUUIHorizontalLockupView_hidePreviewProgressAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resolvePreviewStateAfterTransitionForFlipView:", *(_QWORD *)(a1 + 32));

}

- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  int64_t previewState;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  SUUIHorizontalLockupView *v22;
  BOOL v23;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_lastPlayerStatus, a3);
  previewState = self->_previewState;
  if (previewState)
  {
    if (previewState == 2)
    {
      -[SUUIPreviewProgressIndicator setHidden:](self->_previewProgressIndicator, "setHidden:", 0);
      -[SUUIPreviewProgressIndicator reloadWithPlayerStatus:animated:](self->_previewProgressIndicator, "reloadWithPlayerStatus:animated:", v7, v4);
    }
  }
  else
  {
    -[SUUIHorizontalLockupView _previewFrontView](self, "_previewFrontView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SUUIHorizontalLockupView _previewProgressIndicator](self, "_previewProgressIndicator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v4)
      {
        -[SUUIHorizontalLockupView _addFlipContainerViewWithFrontView:backView:](self, "_addFlipContainerViewWithFrontView:backView:", v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        self->_previewState = 1;
        objc_msgSend(v11, "reloadWithPlayerStatus:animated:", v7, 1);
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_2;
        v16[3] = &unk_2511F6980;
        v14 = v12;
        v17 = v14;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v13, "_performBlockAfterCATransactionCommits:", v16);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        self->_previewState = 2;
        objc_msgSend(v10, "setEnabled:", 1);
        -[SUUIHorizontalLockupView addSubview:](self, "addSubview:", v11);
        -[SUUIHorizontalLockupView setNeedsLayout](self, "setNeedsLayout");
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke;
        v20[3] = &unk_2511FA250;
        v21 = v11;
        v22 = self;
        v23 = v4;
        objc_msgSend(v15, "_performBlockAfterCATransactionCommits:", v20);

        v14 = v21;
      }

    }
  }

}

uint64_t __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadWithPlayerStatus:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 496), *(unsigned __int8 *)(a1 + 48));
}

void __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_3;
  v3[3] = &unk_2511F6220;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "flipToBackViewWithDuration:options:completionBlock:", 0x200000, v3, 0.5);

  objc_destroyWeak(&v5);
}

void __67__SUUIHorizontalLockupView_showPreviewProgressWithStatus_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resolvePreviewStateAfterTransitionForFlipView:", *(_QWORD *)(a1 + 32));

}

- (void)togglePreviewPlaybackAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SUUIHorizontalLockupView _previewMediaURL](self, "_previewMediaURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = v4;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC8CD8], "sessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endSessionForURL:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEC8E48], v7);
      objc_msgSend(v7, "stop");
      -[SUUIHorizontalLockupView hidePreviewProgressAnimated:](self, "hidePreviewProgressAnimated:", 1);
    }
    else
    {
      v8 = (id)objc_msgSend(v6, "stopAllAudioPlayerSessions");
      objc_msgSend(v6, "startSessionWithURL:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, *MEMORY[0x24BEC8E48], v9);
      -[SUUIViewElement firstChildForElementType:](self->_lockupElement, "firstChildForElementType:", 90);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStoreItemIdentifier:", objc_msgSend(v10, "itemIdentifier"));
      objc_msgSend(v9, "playerStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIHorizontalLockupView showPreviewProgressWithStatus:animated:](self, "showPreviewProgressWithStatus:animated:", v11, 1);

      objc_msgSend(v9, "play");
    }

    v4 = v12;
  }

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__SUUIHorizontalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_2511F4A28;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __75__SUUIHorizontalLockupView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchResourcesForViewElement:reason:", a2, *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = 1;
  else
    v5 = result;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  SUUIHorizontalLockupLayout *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t *v20;
  id v21;
  double v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a5;
  v10 = -[SUUIHorizontalLockupLayout initWithLockup:context:]([SUUIHorizontalLockupLayout alloc], "initWithLockup:context:", v8, v9);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__48;
  v27 = __Block_byref_object_dispose__48;
  v28 = 0;
  -[SUUIHorizontalLockupLayout columns](v10, "columns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __70__SUUIHorizontalLockupView_requestLayoutForViewElement_width_context___block_invoke;
  v18 = &unk_2511FA278;
  v21 = a1;
  v22 = a4;
  v12 = v9;
  v19 = v12;
  v20 = &v23;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);

  -[SUUIHorizontalLockupLayout sizeColumnsToFitWidth:context:](v10, "sizeColumnsToFitWidth:context:", v12, a4, v15, v16, v17, v18);
  v13 = (void *)v24[5];
  if (v13)
  {
    objc_msgSend(v13, "childViewElements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v24[5], "size");
    objc_msgSend(a1, "_requestLayoutForViewElements:width:context:", v14, v12);

  }
  _Block_object_dispose(&v23, 8);

}

void __70__SUUIHorizontalLockupView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "identifier");
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x57) != 0)
    {
      v4 = *(void **)(a1 + 48);
      objc_msgSend(v8, "childViewElements");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_requestLayoutForViewElements:width:context:", v5, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56));
    }
    else
    {
      if (v3 != 3)
        goto LABEL_5;
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = v8;
      v5 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v7;
    }

  }
LABEL_5:

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  SUUIHorizontalLockupLayout *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[6];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  const char *v23;
  double v24;
  uint64_t v25;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x3010000000;
  v23 = "";
  v24 = a3;
  v25 = 0;
  v9 = -[SUUIHorizontalLockupLayout initWithLockup:context:]([SUUIHorizontalLockupLayout alloc], "initWithLockup:context:", v7, v8);
  -[SUUIHorizontalLockupLayout sizeColumnsToFitWidth:context:](v9, "sizeColumnsToFitWidth:context:", v8, a3);
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[SUUIHorizontalLockupLayout columns](v9, "columns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__SUUIHorizontalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v15[3] = &unk_2511FA2A0;
  v15[4] = &v16;
  v15[5] = &v20;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  v11 = v21[4];
  v12 = v17[3] + v21[5];
  v21[5] = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v20, 8);
  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

void __66__SUUIHorizontalLockupView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a2;
  if (objc_msgSend(v3, "identifier") == 6)
  {
    objc_msgSend(v3, "size");
    v5 = v4;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  else
  {
    v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v3, "size");
    v8 = v7;

    if (v6 >= v8)
      v9 = v6;
    else
      v9 = v8;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v9;
  }
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9;
  id v10;
  SUUIBadgeViewElement *badge;
  NSMutableArray *v12;
  NSMutableArray *tappableViews;
  SUUIGradientView *offerConfirmationGradientView;
  SUUIPlayButton *playButton;
  SUUIHorizontalLockupLayout *v16;
  SUUIHorizontalLockupLayout *layout;
  UIView *v18;
  UIView *metadataBackgroundView;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v25;
  UITapGestureRecognizer *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SUUIPlayButton *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  unint64_t v42;
  NSMutableArray *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  uint64_t *v50;
  double v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v9 = a3;
  v10 = a5;
  -[NSHashTable removeAllObjects](self->_artworkRelatedChildViewElementViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_cacheKeyToImageView, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_buyButtonDescriptorToButton, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_offerViews, "removeAllObjects");
  badge = self->_badge;
  self->_badge = 0;

  objc_storeStrong((id *)&self->_lockupElement, a3);
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  tappableViews = self->_tappableViews;
  self->_tappableViews = v12;

  -[NSMapTable removeAllObjects](self->_viewElementViews, "removeAllObjects");
  -[SUUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  self->_offerConfirmationGradientView = 0;

  playButton = self->_playButton;
  self->_playButton = 0;

  v16 = -[SUUIHorizontalLockupLayout initWithLockup:context:]([SUUIHorizontalLockupLayout alloc], "initWithLockup:context:", v9, v10);
  layout = self->_layout;
  self->_layout = v16;

  -[SUUIHorizontalLockupLayout sizeColumnsToFitWidth:context:](self->_layout, "sizeColumnsToFitWidth:context:", v10, a4);
  self->_useClearBackground = -[SUUIHorizontalLockupView _usesBackgroundWithAlpha](self, "_usesBackgroundWithAlpha");
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__48;
  v56 = __Block_byref_object_dispose__48;
  v57 = 0;
  v47 = v9;
  if (objc_msgSend(v9, "lockupViewType") == 7 || objc_msgSend(v9, "lockupViewType") == 6)
  {
    if (!self->_metadataBackgroundView)
    {
      v18 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      metadataBackgroundView = self->_metadataBackgroundView;
      self->_metadataBackgroundView = v18;

      -[SUUIHorizontalLockupView addSubview:](self, "addSubview:", self->_metadataBackgroundView);
    }
    objc_msgSend(v9, "style");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ikBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      if (objc_msgSend(v47, "lockupViewType") == 7)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.109803922, 0.72);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
    -[UIView setBackgroundColor:](self->_metadataBackgroundView, "setBackgroundColor:", v22);
    self->_useClearBackground = 1;
  }
  else
  {
    -[UIView removeFromSuperview](self->_metadataBackgroundView, "removeFromSuperview");
    v22 = self->_metadataBackgroundView;
    self->_metadataBackgroundView = 0;
  }

  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke;
  v48[3] = &unk_2511FA310;
  v48[4] = self;
  v51 = a4;
  v23 = v10;
  v49 = v23;
  v50 = &v52;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v48);
  if (-[NSMutableArray count](self->_tappableViews, "count")
    || -[SUUILockupViewElement isSelectable](self->_lockupElement, "isSelectable"))
  {
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (!tapGestureRecognizer)
    {
      v25 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__tapGestureAction_);
      v26 = self->_tapGestureRecognizer;
      self->_tapGestureRecognizer = v25;

      -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
      -[SUUIHorizontalLockupView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
      tapGestureRecognizer = self->_tapGestureRecognizer;
    }
    -[UITapGestureRecognizer setEnabled:](tapGestureRecognizer, "setEnabled:", 1);
  }
  else
  {
    -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", 1);
    v43 = self->_tappableViews;
    self->_tappableViews = 0;

  }
  -[SUUIHorizontalLockupView sendSubviewToBack:](self, "sendSubviewToBack:", v53[5]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BEC8E48];
  objc_msgSend(v27, "removeObserver:name:object:", self, *MEMORY[0x24BEC8E48], 0);
  -[SUUIHorizontalLockupView _previewMediaURL](self, "_previewMediaURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29
    && (objc_msgSend(MEMORY[0x24BEC8CD8], "sessionManager"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v30, "audioPlayerForURL:", v29),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v30,
        v31))
  {
    objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, v28, v31);
    objc_msgSend(v31, "playerStatus");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIHorizontalLockupView showPreviewProgressWithStatus:animated:](self, "showPreviewProgressWithStatus:animated:", v32, 0);

  }
  else
  {
    -[SUUIHorizontalLockupView hidePreviewProgressAnimated:](self, "hidePreviewProgressAnimated:", 0);
    v31 = 0;
  }
  +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeObserver:", self);

  v34 = self->_playButton;
  if (v34)
  {
    -[SUUIPlayButton playItemIdentifier](v34, "playItemIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "playerForItemWithIdentifier:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIPlayButton playItemIdentifier](self->_playButton, "playItemIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "identifierIsOnDeck:", v39))
      {
        v40 = -[SUUIPlayButtonControl isIndeterminate](self->_playButton, "isIndeterminate");

        if (!v40)
        {
          -[SUUIPlayButtonControl beginIndeterminateAnimation](self->_playButton, "beginIndeterminateAnimation");
          -[SUUIPlayButtonControl showPlayIndicator:](self->_playButton, "showPlayIndicator:", 0);
LABEL_36:
          +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObserver:", self);

          goto LABEL_37;
        }
      }
      else
      {

      }
      if (v38)
      {
        objc_msgSend(v38, "playerItem");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "playState");

        if (-[SUUIPlayButton showOnDemand](self->_playButton, "showOnDemand"))
          -[SUUIPlayButton setHidden:](self->_playButton, "setHidden:", 0);
        if (v42 <= 5 && ((1 << v42) & 0x31) != 0)
        {
          -[SUUIPlayButtonControl hideProgressAnimated:](self->_playButton, "hideProgressAnimated:", 1);
        }
        else
        {
          objc_msgSend(v38, "playerItem", self->_playButton);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "reloadWithItemStatus:animated:", v44, 0);

          -[SUUIPlayButtonControl showPlayIndicator:](self->_playButton, "showPlayIndicator:", v42 == 3);
        }
      }
      else
      {
        -[SUUIPlayButtonControl hideProgressAnimated:](self->_playButton, "hideProgressAnimated:", 1);
        if (-[SUUIPlayButton showOnDemand](self->_playButton, "showOnDemand"))
          -[SUUIPlayButton setHidden:](self->_playButton, "setHidden:", 1);
      }
      goto LABEL_36;
    }
  }
LABEL_37:

  _Block_object_dispose(&v52, 8);
}

void __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke_2;
  v14 = &unk_2511FA2E8;
  v19 = *(_QWORD *)(a1 + 56);
  v10 = v3;
  v15 = v10;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v17 = v6;
  v18 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v11);

  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "lockupViewType");
  v8 = *(_BYTE **)(a1 + 32);
  if (v7 == 5 || v8[584])
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor", v10, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

  }
}

void __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  char v41;
  double v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id obj;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "identifier");
  objc_msgSend(v3, "childViewElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v7 = v6;
  v69 = v4;
  v66 = v3;
  if (v4 <= 6 && ((1 << v4) & 0x76) != 0)
    v7 = *(double *)(a1 + 64);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v8)
  {
    v9 = v8;
    v71 = *(_QWORD *)v73;
    v67 = v4 - 1;
    v68 = (uint64_t)v7;
    v10 = (double)(uint64_t)v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v73 != v71)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        v13 = v12;
        v14 = objc_msgSend(v13, "elementType");
        v15 = v14;
        v16 = 0;
        if (v14 <= 61)
        {
          if (v14 > 28)
          {
            switch(v14)
            {
              case '0':
                objc_msgSend(*(id *)(a1 + 32), "addHeaderViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
                v19 = objc_claimAutoreleasedReturnValue();
                goto LABEL_75;
              case '1':
                goto LABEL_63;
              case '2':
                goto LABEL_32;
              case '3':
                objc_msgSend(*(id *)(a1 + 32), "addImageDeckViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_78;
              default:
                if (v14 != 29)
                {
                  v17 = 0;
                  v18 = 0;
                  if (v14 != 32)
                    goto LABEL_115;
                  v36 = v13;
                  objc_msgSend(*(id *)(a1 + 32), "addDividerWithElement:context:", v36, *(_QWORD *)(a1 + 40));
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    if (objc_msgSend(v36, "dividerType") == 3)
                    {
                      objc_msgSend(*(id *)(a1 + 48), "_dividerHeight:", v36);
                      objc_msgSend(v17, "setDividerSize:");
                      v37 = 1;
                    }
                    else
                    {
                      v37 = 0;
                    }
                    objc_msgSend(v17, "setDividerOrientation:", v37);
                  }
LABEL_96:

                  goto LABEL_97;
                }
LABEL_63:
                objc_msgSend(*(id *)(a1 + 32), "addImageViewWithElement:context:", v13, *(_QWORD *)(a1 + 40));
                v16 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "ancestorElementMatchingPredicate:", &__block_literal_global_37_0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v69;
                if (!v35)
                {
                  if (objc_msgSend(v16, "isUserInteractionEnabled"))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 && v69 != 5)
                    {
                      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 576), "addObject:", v16);
                      v46 = v16;
                      break;
                    }
                  }
                  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 512), "isSelectable"))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v47 = v16;
                      objc_msgSend(v13, "firstChildForElementType:", 12);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v48, "buttonViewType") && objc_msgSend(v48, "buttonViewType") == 12)
                      {
                        objc_msgSend(v48, "itmlID");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v65 = v47;
                        objc_msgSend(v47, "viewForElementIdentifier:", v49);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v50)
                        {
                          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 576), "addObject:", v50);
                          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 592), "setObject:forKey:", v50, v48);
                        }

                        v38 = v69;
                        v47 = v65;
                      }

                    }
                  }
                }
                v39 = v16;
                if (v38 == 5)
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v16);
                break;
            }
LABEL_66:

          }
          else
          {
            if (v14 != 8)
            {
              if (v14 == 12)
              {
LABEL_32:
                v28 = v13;
                objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v28, *(_QWORD *)(a1 + 40), v10);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 544), v29);
                objc_msgSend(v29, "addTarget:action:forControlEvents:", 0, sel_suuiadvertising_advertSelectionEventShouldBeForwarded_, 64);
                objc_msgSend(v29, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v29, "setDelegate:", *(_QWORD *)(a1 + 48));
                LODWORD(v30) = -0.5;
                objc_msgSend(v29, "setCharge:", v30);
                v31 = v29;
                v17 = v31;
                if (v15 == 50)
                  v16 = v31;
                else
                  v16 = 0;
                if (v15 == 50)
                  v18 = 0;
                else
                  v18 = v31;
                if (objc_msgSend(v28, "isBigHitButton"))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v17, "setBigHitInsets:", -10.0, 5.0, -10.0, -5.0);
                }
                if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 512), "isSelectable"))
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 576), "addObject:", v17);

                v22 = 0;
                if (!v17)
                  goto LABEL_99;
              }
              else
              {
                v17 = 0;
                v18 = 0;
                if (v14 != 13)
                  goto LABEL_115;
LABEL_17:
                objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 0x20000);
                objc_msgSend(v20, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__cancelConfirmationAction_, 0x10000);
                objc_msgSend(v20, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__showConfirmationAction_, 0x40000);
                objc_msgSend(v20, "addTarget:action:forControlEvents:", 0, sel_suuiadvertising_advertSelectionEventShouldBeForwarded_, 64);
                LODWORD(v21) = -1.0;
                objc_msgSend(v20, "setCharge:", v21);
                objc_msgSend(v20, "setItemOfferDelegate:", *(_QWORD *)(a1 + 48));
                v17 = v20;
                v22 = 0;
                v16 = 0;
                v18 = v17;
                if (!v17)
                  goto LABEL_99;
              }
              goto LABEL_98;
            }
            objc_msgSend(*(id *)(a1 + 32), "addBadgeViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "style");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "elementPosition");

            if (v34 == 7)
            {
              objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 440), v12);
              objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setBackgroundColor:", v35);
              goto LABEL_66;
            }
          }
          v22 = 0;
          v18 = 0;
          v17 = v16;
          if (!v16)
            goto LABEL_99;
          goto LABEL_98;
        }
        if (v14 > 134)
        {
          v17 = 0;
          v18 = 0;
          switch(v14)
          {
            case 135:
              objc_msgSend(*(id *)(a1 + 32), "addStarRatingViewWithViewElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_75;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              goto LABEL_115;
            case 138:
              v36 = v13;
              v40 = objc_msgSend(*(id *)(a1 + 40), "maxWidthForElement:withDefaultWidth:", v36, v68);
              v41 = objc_msgSend((id)objc_opt_class(), "_usesEditorialLayoutForLabelViewElement:", v36);
              v42 = (double)v40;
              v43 = *(void **)(a1 + 32);
              v44 = *(_QWORD *)(a1 + 40);
              if ((v41 & 1) != 0)
              {
                objc_msgSend(v43, "addTextViewWithElement:width:context:", v36, v44, v42);
                v17 = (id)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "isUserInteractionEnabled"))
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 576), "addObject:", v17);
              }
              else
              {
                objc_msgSend(v43, "addLabelViewWithElement:width:context:", v36, v44, v42);
                v17 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_96;
            case 141:
              goto LABEL_17;
            case 144:
              objc_msgSend(*(id *)(a1 + 32), "addTomatoRatingViewWithViewElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_75;
            default:
              if (v14 == 152)
              {
                objc_msgSend(*(id *)(a1 + 32), "addImageViewWithVideoElement:context:", v13, *(_QWORD *)(a1 + 40));
                v45 = (id)objc_claimAutoreleasedReturnValue();
                v16 = v45;
                v22 = 0;
                goto LABEL_79;
              }
              v17 = 0;
              v18 = 0;
              if (v14 != 154)
                goto LABEL_115;
              objc_msgSend(*(id *)(a1 + 32), "addImageGridViewWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              break;
          }
LABEL_78:
          v45 = v32;
          v22 = v45;
          v16 = 0;
LABEL_79:
          v18 = 0;
          v17 = v45;
          if (!v45)
            goto LABEL_99;
          goto LABEL_98;
        }
        if (v14 <= 79)
        {
          if (v14 == 62)
          {
            objc_msgSend(*(id *)(a1 + 32), "addHorizontalListWithElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_78;
          }
          v17 = 0;
          v18 = 0;
          if (v14 != 77)
            goto LABEL_115;
          objc_msgSend(*(id *)(a1 + 32), "addOfferViewWithViewElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setDelegate:", *(_QWORD *)(a1 + 48));
          if (v67 <= 1)
            objc_msgSend(v23, "setMetadataPosition:", 0);
          v22 = v23;
          if (v22)
          {
            v24 = *(void **)(*(_QWORD *)(a1 + 48) + 536);
            if (!v24)
            {
              v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 1);
              v26 = *(_QWORD *)(a1 + 48);
              v27 = *(void **)(v26 + 536);
              *(_QWORD *)(v26 + 536) = v25;

              v24 = *(void **)(*(_QWORD *)(a1 + 48) + 536);
            }
            objc_msgSend(v24, "addObject:", v22);
          }

          v16 = 0;
          v18 = 0;
          v17 = v22;
          if (!v22)
            goto LABEL_99;
LABEL_98:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 592), "setObject:forKey:", v17, v13);
          goto LABEL_99;
        }
        if (v14 == 80)
        {
          objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithOrdinalElement:width:context:", v13, *(_QWORD *)(a1 + 40), v10);
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_75:
          v17 = (id)v19;
LABEL_97:
          v22 = 0;
          v16 = 0;
          v18 = 0;
          if (!v17)
            goto LABEL_99;
          goto LABEL_98;
        }
        v17 = 0;
        v18 = 0;
        if (v14 != 90)
          goto LABEL_115;
        objc_msgSend(*(id *)(a1 + 48), "_previewProgressIndicator");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setEnabled:", 0);
        objc_msgSend(*(id *)(a1 + 32), "addView:", v17);
        v22 = 0;
        v16 = 0;
        v18 = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 560) = 2;
        if (v17)
          goto LABEL_98;
LABEL_99:
        if (v18)
        {
          objc_msgSend(v13, "buyButtonDescriptor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51)
          {
            v52 = *(void **)(*(_QWORD *)(a1 + 48) + 448);
            if (!v52)
            {
              v53 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 517, 1);
              v54 = *(_QWORD *)(a1 + 48);
              v55 = *(void **)(v54 + 448);
              *(_QWORD *)(v54 + 448) = v53;

              v52 = *(void **)(*(_QWORD *)(a1 + 48) + 448);
            }
            objc_msgSend(v52, "setObject:forKey:", v18, v51);
          }

        }
        if (v16)
        {
          objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v13);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            v57 = *(void **)(*(_QWORD *)(a1 + 48) + 488);
            if (!v57)
            {
              v58 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 1);
              v59 = *(_QWORD *)(a1 + 48);
              v60 = *(void **)(v59 + 488);
              *(_QWORD *)(v59 + 488) = v58;

              v57 = *(void **)(*(_QWORD *)(a1 + 48) + 488);
            }
            objc_msgSend(v57, "setObject:forKey:", v16, v56);
          }

        }
        if (v22)
        {
          v61 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
          if (!v61)
          {
            v62 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 1);
            v63 = *(_QWORD *)(a1 + 48);
            v64 = *(void **)(v63 + 432);
            *(_QWORD *)(v63 + 432) = v62;

            v61 = *(void **)(*(_QWORD *)(a1 + 48) + 432);
          }
          objc_msgSend(v61, "addObject:", v22);

        }
LABEL_115:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v9);
  }

}

uint64_t __64__SUUIHorizontalLockupView_reloadWithViewElement_width_context___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDynamicContainer");
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[SUUIHorizontalLockupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMapTable *cacheKeyToImageView;
  void *v12;
  void *v13;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  cacheKeyToImageView = self->_cacheKeyToImageView;
  objc_msgSend(v9, "cacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](cacheKeyToImageView, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "imageView");
      v14 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      -[NSHashTable setImage:](v14, "setImage:", v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v13, "setImage:", v8);
        goto LABEL_16;
      }
      objc_msgSend(v9, "cacheKey");
      v14 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:cacheKey:context:", v8, v14, v10);
    }
LABEL_15:

LABEL_16:
    v19 = 1;
    goto LABEL_17;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_artworkRelatedChildViewElementViews;
  v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
LABEL_6:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(v14);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "setImage:forArtworkRequest:context:", v8, v9, v10, (_QWORD)v21) & 1) != 0)goto LABEL_15;
      if (v16 == ++v18)
      {
        v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
          goto LABEL_6;
        break;
      }
    }
  }

  v19 = 0;
LABEL_17:

  return v19;
}

- (void)setContainerBackgroundImageForPlayButton:(id)a3
{
  double v3;
  double v4;
  SUUIPlayButton *playButton;

  playButton = self->_playButton;
  if (playButton)
  {
    LODWORD(v3) = 15.0;
    LODWORD(v4) = 15.0;
    -[SUUIPlayButtonControl setBackgroundImageForBlurring:withOffsetRight:withOffsetBottom:](playButton, "setBackgroundImageForBlurring:withOffsetRight:withOffsetBottom:", a3, v3, v4);
  }
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "clientContext");
  v24 = objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->_buyButtonDescriptorToButton;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v15, "canPersonalizeUsingItemState:", v8) & 1) != 0)
        {
          -[NSMapTable objectForKey:](self->_buyButtonDescriptorToButton, "objectForKey:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)v24;
          objc_msgSend(v22, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v15, v8, v24, v5);

LABEL_20:
          -[SUUIHorizontalLockupView setNeedsLayout](self, "setNeedsLayout");
          v20 = 1;
          goto LABEL_21;
        }
      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
        continue;
      break;
    }
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_offerViews;
  v16 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "updateWithItemState:context:animated:", v8, v9, v5) & 1) != 0)
        {
          v21 = (void *)v24;
          goto LABEL_20;
        }
      }
      v17 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
        continue;
      break;
    }
  }

  v20 = 0;
  v21 = (void *)v24;
LABEL_21:

  return v20;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_viewElementViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "itmlID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  double left;
  double v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  _QWORD v46[4];
  _QWORD v47[15];
  _QWORD v48[4];
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];
  char v60;
  _QWORD v61[4];
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)SUUIHorizontalLockupView;
  -[SUUIHorizontalLockupView layoutSubviews](&v62, sel_layoutSubviews);
  if ((-[SUUIGradientView isDescendantOfView:](self->_offerConfirmationGradientView, "isDescendantOfView:", self) & 1) == 0)
  {
    -[SUUIHorizontalLockupView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SUUILockupViewElement style](self->_lockupElement, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "elementPosition");

    if (!v12)
      v12 = 2 * (-[SUUILockupViewElement lockupViewType](self->_lockupElement, "lockupViewType") == 6);
    v34 = v12;
    -[SUUIHorizontalLockupView _previewFrontView](self, "_previewFrontView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    v15 = (char *)malloc_type_malloc(16 * v14, 0x1000040451B5BE8uLL);
    v61[0] = 0;
    v61[1] = v61;
    left = self->_contentInset.left;
    v17 = v8 - left - self->_contentInset.right;
    v61[2] = 0x2020000000;
    *(double *)&v61[3] = v17;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v60 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0x7FFFFFFFFFFFFFFFLL;
    v51 = 0;
    v52 = (double *)&v51;
    v53 = 0x2020000000;
    v54 = v17;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x4010000000;
    v48[3] = "";
    v18 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v49 = *MEMORY[0x24BDBF090];
    v50 = v18;
    -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke;
    v47[3] = &unk_2511FA338;
    v47[9] = v4;
    v47[10] = v6;
    *(double *)&v47[11] = v8;
    v47[12] = v10;
    v47[4] = self;
    v47[5] = &v55;
    v47[6] = v61;
    v47[7] = &v51;
    v47[13] = v15;
    v47[14] = v14;
    v47[8] = v48;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v47);

    v20 = v13;
    if (v56[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v13, "objectAtIndex:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIHorizontalLockupView _sizeViewsForColumn:toFitWidth:](self, "_sizeViewsForColumn:toFitWidth:", v21, v52[3]);
      v23 = v22;

      v24 = &v15[16 * v56[3]];
      *(double *)v24 = v52[3];
      *((_QWORD *)v24 + 1) = v23;
    }
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    *(double *)&v46[3] = left;
    -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_2;
    v35[3] = &unk_2511FA388;
    v40 = v15;
    v41 = v34;
    v35[4] = self;
    v37 = v48;
    v38 = v46;
    v42 = v4;
    v43 = v6;
    v44 = v8;
    v45 = v10;
    v39 = v59;
    v26 = v33;
    v36 = v26;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v35);

    free(v15);
    if (self->_metadataBackgroundView)
    {
      -[SUUIHorizontalLockupView bounds](self, "bounds");
      -[UIView setFrame:](self->_metadataBackgroundView, "setFrame:", v27 + self->_contentInset.left, v28 + self->_contentInset.top, v29 - (self->_contentInset.left + self->_contentInset.right), v30 - (self->_contentInset.top + self->_contentInset.bottom));
      -[UIView subviews](self->_metadataBackgroundView, "subviews");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self->_metadataBackgroundView, "bounds");
      objc_msgSend(v32, "setFrame:");

      -[SUUIHorizontalLockupView sendSubviewToBack:](self, "sendSubviewToBack:", self->_metadataBackgroundView);
    }

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v48, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);

  }
}

void __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double *v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double *v15;
  double v16;
  id v17;

  v17 = a2;
  v5 = objc_msgSend(v17, "identifier");
  v6 = v5;
  if (v5 == 3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    v7 = v17;
    goto LABEL_11;
  }
  v8 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if ((unint64_t)(v5 - 5) < 2)
    v8 = (double *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "_sizeViewsForColumn:toFitWidth:", v17, *v8);
  v11 = v9;
  v12 = v10;
  if (v6 == 4)
  {
    objc_msgSend(v17, "size");
    if (v11 < v13)
      v11 = v13;
    v14 = *(_QWORD *)(a1 + 104) + 16 * a3;
    *(double *)v14 = v11;
    *(_QWORD *)(v14 + 8) = v12;
    v7 = v17;
  }
  else
  {
    v15 = (double *)(*(_QWORD *)(a1 + 104) + 16 * a3);
    *v15 = v9;
    *((_QWORD *)v15 + 1) = v10;
    v7 = v17;
    if ((unint64_t)(v6 - 7) > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_11;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - v11;
LABEL_11:
  if (*(_QWORD *)(a1 + 112) - 1 > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "columnSpacingForColumnIdentifier:", v6);
    v7 = v17;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24)
                                                                - v16;
  }
  if (v6 == 6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = *(double *)(a1 + 88)
                                                                - (*(double *)(*(_QWORD *)(a1 + 32) + 464)
                                                                 + *(double *)(*(_QWORD *)(a1 + 32) + 480));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 48);
  }

}

void __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double *v14;
  double v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  double v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  double *v47;
  uint64_t v48;
  double v49;

  v5 = a2;
  v6 = (double *)(*(_QWORD *)(a1 + 72) + 16 * a3);
  v7 = *v6;
  v8 = v6[1];
  v9 = objc_msgSend(v5, "identifier");
  v10 = v9;
  v46 = 0;
  v47 = (double *)&v46;
  v48 = 0x2020000000;
  v49 = 0.0;
  v11 = *(_QWORD *)(a1 + 80);
  if (v11 == 3)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v49 = *(double *)(a1 + 112) - *(double *)(v16 + 472) - v8;
    if (v9 != 3)
      goto LABEL_11;
    objc_msgSend(*(id *)(v16 + 504), "metadataColumnEdgeInsets");
    v17 = v47;
    v19 = v47[3] - v18;
LABEL_8:
    v17[3] = v19;
    goto LABEL_11;
  }
  if (v11 != 2)
  {
    v20 = *(double *)(*(_QWORD *)(a1 + 32) + 456);
    UIRoundToViewScale();
    v22 = v20 + v21;
    v17 = v47;
    v47[3] = v22;
    v19 = v22 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
    goto LABEL_8;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(double *)(v12 + 456);
  v49 = v13;
  if (v9 == 3)
  {
    objc_msgSend(*(id *)(v12 + 504), "metadataColumnEdgeInsets");
    v14 = v47 + 3;
    v13 = v15 + v47[3];
    v47[3] = v13;
  }
  else
  {
    v14 = &v49;
  }
  *v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56) + v13;
LABEL_11:
  objc_msgSend(v5, "childViewElements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_3;
  v33[3] = &unk_2511FA360;
  v25 = *(_QWORD *)(a1 + 32);
  v40 = v10;
  v26 = *(_QWORD *)(a1 + 56);
  v33[4] = v25;
  v36 = v26;
  v41 = v7;
  v42 = v8;
  v27 = v23;
  v28 = *(_QWORD *)(a1 + 64);
  v34 = v27;
  v29 = *(_OWORD *)(a1 + 104);
  v43 = *(_OWORD *)(a1 + 88);
  v44 = v29;
  v31 = *(void **)(a1 + 40);
  v30 = *(_QWORD *)(a1 + 48);
  v37 = v28;
  v38 = v30;
  v39 = &v46;
  v45 = v24;
  v35 = v31;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v33);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "columnSpacingForColumnIdentifier:", v10);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7
                                                              + v32
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);

  _Block_object_dispose(&v46, 8);
}

void __42__SUUIHorizontalLockupView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  CGFloat *v32;
  int v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v38;
  char v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  float v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  float v62;
  double MaxY;
  double v64;
  double v65;
  CGFloat Width;
  double v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  id v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v77 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  switch(*(_QWORD *)(a1 + 88))
  {
    case 0:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "columns");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v20 > 1)
        goto LABEL_19;
      objc_msgSend(*(id *)(a1 + 32), "bounds");
      CGRectGetWidth(v78);
      goto LABEL_13;
    case 1:
    case 2:
      objc_msgSend(v77, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "elementPosition");

      if (v15 == 7 || v15 == 1)
      {
        objc_msgSend(v77, "style");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "elementPadding");
        v18 = v17;

      }
      else
      {
        v18 = *(double *)(MEMORY[0x24BEBE158] + 24);
      }
      v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + *(double *)(a1 + 96) - v11 - v18;
      goto LABEL_19;
    case 3:
      v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "metadataColumnEdgeInsets");
      v7 = v21 + v22;
      if (!a3)
        goto LABEL_21;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "frame");
        v7 = v7 + CGRectGetWidth(v79) + 5.0;
        objc_msgSend(v24, "frame");
        v25 = CGRectGetWidth(v80) + 5.0;
        v81.origin.x = v7;
        v81.origin.y = v9;
        v81.size.width = v11;
        v81.size.height = v13;
        v26 = v25 + CGRectGetWidth(v81);
        v27 = *(double *)(a1 + 96);
        v28 = v26 - v27;
        v29 = v26 <= v27;
        v30 = 0.0;
        if (!v29)
          v30 = v28;
        v11 = v11 - v30;

      }
      goto LABEL_20;
    case 4:
LABEL_13:
      UIRoundToViewScale();
      v7 = v31;
      goto LABEL_19;
    case 5:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        goto LABEL_57;
      v7 = *(double *)(*(_QWORD *)(a1 + 32) + 464);
LABEL_19:
      if (a3)
      {
LABEL_20:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "topPaddingForViewElement:", v77);
        v33 = 0;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v34
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                + 24);
      }
      else
      {
LABEL_21:
        v33 = 1;
      }
      if (*(_QWORD *)(a1 + 88) != 3 || *(_QWORD *)(a1 + 144) - 1 != a3)
        goto LABEL_33;
      objc_msgSend(v77, "style");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "elementPosition");

      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "lockupViewType") != 6 || v36 != 0)
      {
        if (v36 != 3)
          goto LABEL_33;
        goto LABEL_32;
      }
      objc_msgSend(v77, "elementName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("description"));

      if (a3 > 2 || (v39 & 1) != 0)
      {
LABEL_32:
        v40 = *(_QWORD *)(a1 + 32);
        v41 = *(double *)(a1 + 136) - *(double *)(v40 + 472);
        objc_msgSend(*(id *)(v40 + 504), "metadataColumnEdgeInsets");
        v43 = v41 - v42;
        v82.origin.x = v7;
        v82.origin.y = v9;
        v82.size.width = v11;
        v82.size.height = v13;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v43 - CGRectGetHeight(v82);
      }
LABEL_33:
      objc_msgSend(v77, "style");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "elementPosition");

      v46 = *(_QWORD *)(a1 + 88);
      if (v46 == 1 && v45)
      {
        if (*(_QWORD *)(a1 + 144) == 1)
        {
          UIRoundToViewScale();
          v48 = v47;
          goto LABEL_47;
        }
      }
      else if (v46 != 1)
      {
        goto LABEL_46;
      }
      if (v45 > 9)
        goto LABEL_46;
      if (((1 << v45) & 0xC4) != 0)
      {
        if (!v33)
          goto LABEL_46;
        objc_msgSend(v77, "style");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "elementPadding");
        v56 = v55;

        v53 = v56 + CGRectGetMinY(*(CGRect *)(a1 + 112)) + *(double *)(*(_QWORD *)(a1 + 32) + 456);
        goto LABEL_45;
      }
      if (((1 << v45) & 0x308) != 0 && a3 + 1 == *(_QWORD *)(a1 + 144))
      {
        objc_msgSend(v77, "style");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "elementPadding");
        v51 = v50;

        v52 = CGRectGetMaxY(*(CGRect *)(a1 + 112)) - *(double *)(*(_QWORD *)(a1 + 32) + 472);
        v83.origin.x = v7;
        v83.origin.y = v9;
        v83.size.width = v11;
        v83.size.height = v13;
        v53 = v52 - CGRectGetHeight(v83) - v51;
LABEL_45:
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v53;
      }
LABEL_46:
      v48 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
LABEL_47:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v45 == 7)
      {
        v84.origin.x = v7;
        v84.origin.y = v48;
        v84.size.width = v11;
        v84.size.height = v13;
        v57 = CGRectGetHeight(v84) * 0.5;
        v48 = (float)-floorf(v57);
        objc_msgSend(v77, "style");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "elementPadding");
        v60 = v59;

        v61 = *(double *)(a1 + 128);
        v85.origin.x = v7;
        v85.origin.y = v48;
        v85.size.width = v11;
        v85.size.height = v13;
        v62 = v60 + CGRectGetWidth(v85);
        v7 = v61 - floorf(v62);
      }
      objc_msgSend(v5, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v7, v48, v11, v13, *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136)));
      if (*(_QWORD *)(a1 + 88) != 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v86.origin.x = v7;
        v86.origin.y = v48;
        v86.size.width = v11;
        v86.size.height = v13;
        MaxY = CGRectGetMaxY(v86);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "bottomPaddingForViewElement:", v77);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = MaxY + v64;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v87.origin.x = v7;
        v87.origin.y = v48;
        v87.size.width = v11;
        v87.size.height = v13;
        v65 = -CGRectGetMinY(v87);
        v88.origin.x = v7;
        v88.origin.y = v48;
        v88.size.width = v11;
        v88.size.height = v13;
        Width = CGRectGetWidth(v88);
        v67 = 0.0;
        if (Width < 44.0)
        {
          v89.origin.x = v7;
          v89.origin.y = v48;
          v89.size.width = v11;
          v89.size.height = v13;
          v67 = (CGRectGetWidth(v89) + -44.0) * 0.5;
        }
        objc_msgSend(v5, "setHitRectInsets:", v65, v67, v65, v67);
      }
LABEL_57:
      if (v5 == *(void **)(a1 + 48))
      {
        v68 = *(_QWORD *)(a1 + 32);
        v69 = *(_QWORD *)(v68 + 552);
        if (v69)
        {
          objc_msgSend(*(id *)(v68 + 552), "frame");
          v71 = v70;
          v73 = v72;
          UIRoundToViewScale();
          v75 = v74;
          UIRoundToViewScale();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v75, v76, v71, v73, *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136)));
        }
        objc_msgSend(v5, "setHidden:", v69 != 0);
      }

      return;
    case 6:
      v32 = *(CGFloat **)(*(_QWORD *)(a1 + 72) + 8);
      objc_msgSend(v5, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v32[4], v32[5], v32[6], v32[7], *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128), *(CGFloat *)(a1 + 136)));
      goto LABEL_57;
    default:
      goto LABEL_19;
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SUUIHorizontalLockupView;
  -[SUUIHorizontalLockupView setSemanticContentAttribute:](&v14, sel_setSemanticContentAttribute_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SUUIHorizontalLockupView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSemanticContentAttribute:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIPlayButton *playButton;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (-[SUUILockupViewElement lockupViewType](self->_lockupElement, "lockupViewType") == 5 || self->_useClearBackground)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)SUUIHorizontalLockupView;
    -[SUUIViewReuseView setBackgroundColor:](&v10, sel_setBackgroundColor_, v5);
LABEL_4:

    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalLockupView;
  -[SUUIViewReuseView setBackgroundColor:](&v9, sel_setBackgroundColor_, v4);
  playButton = self->_playButton;
  if (playButton && -[SUUIPlayButtonControl backgroundType](playButton, "backgroundType") == 2)
  {
    +[SUUIPlayButtonControl blurColorForColor:](SUUIPlayButton, "blurColorForColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[SUUIPlayButtonControl setControlColor:](self->_playButton, "setControlColor:", v5);
    goto LABEL_4;
  }
LABEL_5:
  if (self->_badge)
  {
    -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v7);

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[5];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  const char *v12;
  CGFloat width;
  uint64_t v14;
  CGSize result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v12 = "";
  width = a3.width;
  v14 = 0;
  -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SUUIHorizontalLockupView_sizeThatFits___block_invoke;
  v8[3] = &unk_2511FA3B0;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

uint64_t __41__SUUIHorizontalLockupView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;
  double v6;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  result = objc_msgSend(a2, "size");
  if (v3 >= v5)
    v6 = v3;
  else
    v6 = v5;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v6;
  return result;
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  SUUIGradientView *offerConfirmationGradientView;

  if ((objc_msgSend(a3, "isShowingConfirmation") & 1) == 0)
  {
    -[SUUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;

  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v4;

  v4 = a3;
  -[SUUIHorizontalLockupView _animateButton:](self, "_animateButton:");
  if (-[SUUIHorizontalLockupView updateLayoutOnButtonConfirmation](self, "updateLayoutOnButtonConfirmation"))
    -[SUUIHorizontalLockupView _resizeMetadataRelativeToItemOfferView:](self, "_resizeMetadataRelativeToItemOfferView:", v4);
  else
    -[SUUIHorizontalLockupView _layoutConfirmationGradientRelativeToItemOfferView:alpha:](self, "_layoutConfirmationGradientRelativeToItemOfferView:alpha:", v4, (double)objc_msgSend(v4, "isShowingConfirmation"));

}

- (void)offerViewDidAnimateTransition:(id)a3
{
  SUUIGradientView *offerConfirmationGradientView;

  if ((objc_msgSend(a3, "isShowingConfirmation") & 1) == 0)
  {
    -[SUUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;

  }
}

- (BOOL)offerViewAnimateTransition:(id)a3
{
  id v4;
  double x;
  double y;
  double MaxX;
  double v8;
  double v9;
  double v10;
  double v11;
  int ShouldReverseLayoutDirection;
  double v13;
  CGRect v15;

  if (self->_offerConfirmationGradientView)
  {
    v4 = a3;
    objc_msgSend(v4, "frame");
    x = v15.origin.x;
    y = v15.origin.y;
    MaxX = CGRectGetMaxX(v15);
    objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
    v9 = v8;
    v11 = v10;
    ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    v13 = MaxX - v9;
    if (ShouldReverseLayoutDirection)
      v13 = x;
    objc_msgSend(v4, "setFrame:", v13, y, v9, v11);
    -[SUUIHorizontalLockupView _layoutConfirmationGradientRelativeToItemOfferView:alpha:](self, "_layoutConfirmationGradientRelativeToItemOfferView:alpha:", v4, 1.0);

  }
  return 0;
}

- (void)offerViewWillAnimateTransition:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SUUIHorizontalLockupView updateLayoutOnButtonConfirmation](self, "updateLayoutOnButtonConfirmation")
    && !objc_msgSend(v4, "metadataPosition"))
  {
    -[SUUIHorizontalLockupView _addConfirmationGradientForView:](self, "_addConfirmationGradientForView:", v4);
  }

}

- (void)mediaPlayer:(id)a3 itemStateChanged:(id)a4
{
  id v6;
  id v7;
  SUUIPlayButton *playButton;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  SUUIHorizontalLockupView *v15;
  _QWORD block[5];
  id v17;

  v6 = a3;
  v7 = a4;
  playButton = self->_playButton;
  if (playButton)
  {
    -[SUUIPlayButton playItemIdentifier](playButton, "playItemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SUUIMediaPlayerInterface identifierMatches:item:](SUUIMediaPlayerInterface, "identifierMatches:item:", v9, v7);

    if (v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke;
      block[3] = &unk_2511F46D0;
      block[4] = self;
      v17 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v11 = v17;
LABEL_7:

      goto LABEL_8;
    }
    if (-[SUUIPlayButtonControl isIndeterminate](self->_playButton, "isIndeterminate")
      || -[SUUIPlayButtonControl showingProgress](self->_playButton, "showingProgress"))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_2;
      v13[3] = &unk_2511F46D0;
      v14 = v7;
      v15 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v13);
      v11 = v14;
      goto LABEL_7;
    }
    if (-[SUUIPlayButton showOnDemand](self->_playButton, "showOnDemand"))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_3;
      v12[3] = &unk_2511F47C0;
      v12[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v12);
    }
  }
LABEL_8:

}

uint64_t __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "showOnDemand"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setHidden:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 40), "playState");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  if ((unint64_t)(v2 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    return objc_msgSend(v3, "hideProgressAnimated:", 1);
  objc_msgSend(v3, "reloadWithItemStatus:animated:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "showPlayIndicator:", v2 == 3);
}

uint64_t __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "playState");
  if (result != 5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "hideProgressAnimated:", 0);
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "showOnDemand");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "setHidden:", 1);
  }
  return result;
}

uint64_t __57__SUUIHorizontalLockupView_mediaPlayer_itemStateChanged___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setHidden:", 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *tappableViews;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(v7, "locationInView:", self);
  tappableViews = self->_tappableViews;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__SUUIHorizontalLockupView_gestureRecognizer_shouldReceiveTouch___block_invoke;
  v13[3] = &unk_2511FA3D8;
  v13[4] = &v14;
  v13[5] = v9;
  v13[6] = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](tappableViews, "enumerateObjectsUsingBlock:", v13);
  if (-[SUUILockupViewElement isSelectable](self->_lockupElement, "isSelectable"))
  {
    v11 = 1;
    *((_BYTE *)v15 + 24) = 1;
  }
  else
  {
    v11 = *((_BYTE *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

BOOL __65__SUUIHorizontalLockupView_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;
  CGRect v7;

  objc_msgSend(a2, "frame");
  result = CGRectContainsPoint(v7, *(CGPoint *)(a1 + 40));
  *a4 = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_buttonAction:(id)a3
{
  SUUIPlayButton *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SUUIPlayButton *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v4 = (SUUIPlayButton *)a3;
  -[SUUIHorizontalLockupView _viewElementForView:](self, "_viewElementForView:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_playButton == v4)
  {
    -[SUUIHorizontalLockupView _handlePlayButtonTap:element:](self, "_handlePlayButtonTap:element:", v4, v5);
  }
  else if (v5)
  {
    SUUICollectionViewCellForView(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SUUICollectionViewForView(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v8, "indexPathForCell:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v8, v6, 0, v18);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v4;
        v11 = (void *)MEMORY[0x24BDBCED8];
        v19[0] = CFSTR("toggled");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUUIPlayButton isToggled](v10, "isToggled"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v12;
        v20[1] = v6;
        v19[1] = CFSTR("target");
        v19[2] = CFSTR("count");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUUIPlayButton count](v10, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dictionaryWithDictionary:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUUIPlayButton toggleItemIdentifier](v10, "toggleItemIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[SUUIPlayButton toggleItemIdentifier](v10, "toggleItemIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("toggleId"));

        }
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v15, 0);

    }
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SUUIHorizontalLockupView bringSubviewToFront:](self, "bringSubviewToFront:", v4);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 0, 1);

}

- (void)_previewIndicatorAction:(id)a3
{
  -[SUUIHorizontalLockupView togglePreviewPlaybackAnimated:](self, "togglePreviewPlaybackAnimated:", 1);
}

- (void)_showConfirmationAction:(id)a3
{
  id v4;

  v4 = a3;
  -[SUUIHorizontalLockupView _addConfirmationGradientForView:](self, "_addConfirmationGradientForView:", v4);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);

}

- (void)_tapGestureAction:(id)a3
{
  id v4;
  NSMutableArray *tappableViews;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__48;
  v15 = __Block_byref_object_dispose__48;
  v16 = 0;
  tappableViews = self->_tappableViews;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__SUUIHorizontalLockupView__tapGestureAction___block_invoke;
  v10[3] = &unk_2511FA3D8;
  v10[5] = v6;
  v10[6] = v7;
  v10[4] = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](tappableViews, "enumerateObjectsUsingBlock:", v10);
  if (v12[5])
  {
    -[SUUIHorizontalLockupView _viewElementForView:](self, "_viewElementForView:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "elementType");
    if (v9 > 49)
    {
      if (v9 != 50)
      {
        if (v9 == 138)
          -[SUUIHorizontalLockupView _expandEditorialForLabel:](self, "_expandEditorialForLabel:", v8);
        goto LABEL_14;
      }
    }
    else if (v9 != 12)
    {
      if (v9 == 49)
        -[SUUIHorizontalLockupView _performDefaultActionForImage:](self, "_performDefaultActionForImage:", v8);
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUIHorizontalLockupView _handlePlayButtonTap:element:](self, "_handlePlayButtonTap:element:", v12[5], v8);
    else
      objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
LABEL_14:

    goto LABEL_15;
  }
  if (-[SUUILockupViewElement isSelectable](self->_lockupElement, "isSelectable"))
    -[SUUILockupViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_lockupElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
LABEL_15:
  _Block_object_dispose(&v11, 8);

}

void __46__SUUIHorizontalLockupView__tapGestureAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;

  v19 = a2;
  objc_msgSend(v19, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v19, "bigHitInsets");
    v8 = v8 + v15;
    v10 = v10 + v16;
    v12 = v12 - (v15 + v17);
    v14 = v14 - (v16 + v18);
  }
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (CGRectContainsPoint(v20, *(CGPoint *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SUUIHorizontalLockupView _previewMediaURL](self, "_previewMediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v5, "playerStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "playerState");

    if ((unint64_t)(v9 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, v11, v12);

      -[SUUIHorizontalLockupView hidePreviewProgressAnimated:](self, "hidePreviewProgressAnimated:", 1);
    }
    else
    {
      objc_msgSend(v5, "playerStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIHorizontalLockupView showPreviewProgressWithStatus:animated:](self, "showPreviewProgressWithStatus:animated:", v10, 1);
    }

  }
}

- (void)_animateButton:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat MaxX;
  CGRect *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  CGFloat v19;
  uint64_t v20;
  CGRect *v21;
  uint64_t v22;
  const char *v23;
  __int128 v24;
  __int128 v25;

  v4 = a3;
  v20 = 0;
  v21 = (CGRect *)&v20;
  v22 = 0x4010000000;
  v23 = "";
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "frame");
  *(_QWORD *)&v24 = v5;
  *((_QWORD *)&v24 + 1) = v6;
  *(_QWORD *)&v25 = v7;
  *((_QWORD *)&v25 + 1) = v8;
  MaxX = CGRectGetMaxX(v21[1]);
  objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v10 = v21;
  v21[1].size.width = v11;
  v10[1].size.height = v12;
  -[SUUIHorizontalLockupView _viewElementForView:](self, "_viewElementForView:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __43__SUUIHorizontalLockupView__animateButton___block_invoke;
  v16[3] = &unk_2511FA400;
  v15 = v13;
  v17 = v15;
  v18 = &v20;
  v19 = MaxX;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

  objc_msgSend(v4, "setFrame:", v21[1].origin.x, v21[1].origin.y, v21[1].size.width, v21[1].size.height);
  _Block_object_dispose(&v20, 8);

}

void __43__SUUIHorizontalLockupView__animateButton___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "childViewElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  v8 = v9;
  if (v7)
  {
    if (objc_msgSend(v9, "identifier") == 1)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(double *)(a1 + 48)
                                                                  - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 48);
    *a4 = 1;
    v8 = v9;
  }

}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  +[SUUIHorizontalLockupLayout fontForButtonViewElement:context:](SUUIHorizontalLockupLayout, "fontForButtonViewElement:context:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonTitleStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v5, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v11)
  {
    v12 = objc_msgSend(v6, "containerViewElementType") == 118;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, dbl_241EFC380[v12]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:style:", v7, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  unint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  +[SUUIHorizontalLockupLayout fontForLabelViewElement:context:](SUUIHorizontalLockupLayout, "fontForLabelViewElement:context:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v6, "aggregateValueForKey:", CFSTR("SUUIPreviewOverlayBackgroundStyleKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "integerValue") == 0;
    else
      v13 = 1;
    v14 = objc_msgSend(v5, "labelViewStyle");
    if (v14 > 5)
    {
      v10 = 0;
LABEL_19:

      goto LABEL_20;
    }
    if (((1 << v14) & 0x1B) == 0)
    {
      if (v13)
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v6, "containerViewElementType") == 118)
    {
      v15 = 0.8;
      if (v13)
      {
LABEL_9:
        v16 = 0.0;
LABEL_15:
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v16, v15);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v10 = (void *)v17;
        goto LABEL_19;
      }
    }
    else
    {
      v15 = 0.6;
      if (v13)
        goto LABEL_9;
    }
    v16 = 1.0;
    goto LABEL_15;
  }
LABEL_20:
  objc_msgSend(v5, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "attributedStringWithDefaultFont:foregroundColor:style:", v7, v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_attributedStringForOrdinal:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  +[SUUIHorizontalLockupLayout fontForOrdinalViewElement:context:](SUUIHorizontalLockupLayout, "fontForOrdinalViewElement:context:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithStyle(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_handlePlayButtonTap:(id)a3 element:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  +[SUUIMediaPlayerInterface sharedInstance](SUUIMediaPlayerInterface, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isItemWithIdentifierActive:", v7);

  if (v8)
  {
    objc_msgSend(v11, "playItemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "togglePlayStateForItemWithIdentifier:", v9);

  }
  else if (v5)
  {
    objc_msgSend(v11, "playItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyWillChangeToItemWithItemIdentifer:", v10);

    if ((objc_msgSend(v11, "isIndeterminate") & 1) == 0)
      objc_msgSend(v11, "beginIndeterminateAnimation");
    objc_msgSend(v5, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }

}

+ (void)_requestLayoutForViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __objc2_class *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v23 = a1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "elementType");
        if (v17 > 79)
        {
          switch(v17)
          {
            case 135:
              v18 = SUUIStarRatingViewElementView;
              goto LABEL_32;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              continue;
            case 138:
              v20 = v16;
              v21 = objc_msgSend(v9, "maxWidthForElement:withDefaultWidth:", v20, (uint64_t)a4);
              if (objc_msgSend(a1, "_usesEditorialLayoutForLabelViewElement:", v20))
              {
                objc_msgSend(v9, "editorialLayoutForLabelElement:width:", v20, (double)v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "enqueueLayoutRequests");
              }
              else
              {
                objc_msgSend(a1, "_attributedStringForLabel:context:", v20, v9);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "requestLayoutForLabel:attributedString:width:", v20, v22, v21);
              }

              a1 = v23;
              continue;
            case 141:
              goto LABEL_24;
            case 144:
              v18 = SUUITomatoRatingView;
              goto LABEL_32;
            default:
              if (v17 == 80)
              {
                objc_msgSend(a1, "_attributedStringForOrdinal:context:", v16, v9);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "requestLayoutForOrdinal:attributedString:width:", v16, v19, (uint64_t)a4);
                goto LABEL_34;
              }
              if (v17 != 154)
                continue;
              v18 = SUUIImageGridView;
              break;
          }
          goto LABEL_32;
        }
        if (v17 <= 48)
        {
          if (v17 == 8)
          {
            objc_msgSend(v10, "requestLayoutForBadge:width:", v16, (uint64_t)a4);
            continue;
          }
          if (v17 != 12)
          {
            if (v17 != 48)
              continue;
            v18 = SUUISectionHeaderView;
            goto LABEL_32;
          }
LABEL_24:
          objc_msgSend(a1, "_attributedStringForButton:context:", v16, v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "requestLayoutForButton:attributedString:width:", v16, v19, (uint64_t)a4);
LABEL_34:

        }
        else
        {
          if (v17 > 61)
          {
            if (v17 == 62)
            {
              v18 = SUUIHorizontalListView;
            }
            else
            {
              if (v17 != 77)
                continue;
              v18 = SUUIOfferView;
            }
            goto LABEL_32;
          }
          if (v17 == 49)
          {
            +[SUUIAdornedImageView requestLayoutForViewElement:width:context:](SUUIAdornedImageView, "requestLayoutForViewElement:width:context:", v16, v9, a4);
LABEL_29:
            v18 = SUUIImageDeckView;
LABEL_32:
            -[__objc2_class requestLayoutForViewElement:width:context:](v18, "requestLayoutForViewElement:width:context:", v16, v9, a4);
            continue;
          }
          if (v17 == 51)
            goto LABEL_29;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

}

+ (BOOL)_usesEditorialLayoutForLabelViewElement:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfLines") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "moreButtonTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (void)_addConfirmationGradientForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  SUUIGradientView *offerConfirmationGradientView;
  SUUIGradientView *v11;
  SUUIGradientView *v12;
  SUUIGradientView *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__48;
  v25 = __Block_byref_object_dispose__48;
  v26 = 0;
  -[SUUIHorizontalLockupView _columnForView:](self, "_columnForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childViewElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__SUUIHorizontalLockupView__addConfirmationGradientForView___block_invoke;
  v18[3] = &unk_2511FA428;
  v18[4] = self;
  v20 = &v21;
  v8 = v5;
  v19 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);

  -[SUUIHorizontalLockupView gradientColor](self, "gradientColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[UIView suui_apparentBackgroundColor](self, "suui_apparentBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  if (!offerConfirmationGradientView)
  {
    v11 = [SUUIGradientView alloc];
    v12 = -[SUUIGradientView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v13 = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = v12;

    -[SUUIGradientView layer](self->_offerConfirmationGradientView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[0] = objc_msgSend(v15, "CGColor");
    v16 = objc_retainAutorelease(v9);
    v27[1] = objc_msgSend(v16, "CGColor");
    v27[2] = objc_msgSend(objc_retainAutorelease(v16), "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColors:", v17);

    objc_msgSend(v14, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v14, "setStartPoint:", 0.0, 0.5);

    offerConfirmationGradientView = self->_offerConfirmationGradientView;
  }
  objc_msgSend(v8, "insertSubview:belowSubview:", offerConfirmationGradientView, v22[5]);
  -[SUUIHorizontalLockupView _layoutConfirmationGradientRelativeToItemOfferView:alpha:](self, "_layoutConfirmationGradientRelativeToItemOfferView:alpha:", v4, 0.0);

  _Block_object_dispose(&v21, 8);
}

void __60__SUUIHorizontalLockupView__addConfirmationGradientForView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v7 = v3;
  if (!v6)
  {
    objc_storeStrong(v5, v3);
    v3 = v7;
  }
  objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:", v3);

}

- (id)_addFlipContainerViewWithFrontView:(id)a3 backView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SUUIInlineFlipContainerView *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v12 = -[SUUIInlineFlipContainerView initWithFrontView:backView:]([SUUIInlineFlipContainerView alloc], "initWithFrontView:backView:", v7, v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIInlineFlipContainerView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  objc_msgSend(v7, "frame");
  v15 = v14;
  v17 = v16;

  -[SUUIInlineFlipContainerView frame](v12, "frame");
  -[SUUIInlineFlipContainerView setFrame:](v12, "setFrame:", v9 - v15, v11 - v17);
  -[SUUIHorizontalLockupView addSubview:](self, "addSubview:", v12);
  return v12;
}

- (id)_columnForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__48;
  v17 = __Block_byref_object_dispose__48;
  v18 = 0;
  -[SUUIHorizontalLockupView _viewElementForView:](self, "_viewElementForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__SUUIHorizontalLockupView__columnForView___block_invoke;
  v10[3] = &unk_2511FA450;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __43__SUUIHorizontalLockupView__columnForView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "childViewElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (double)_dividerHeight:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  objc_msgSend(a3, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 10.0;
  }

  return v6;
}

- (void)_expandEditorialForLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  SUUICollectionViewCellForView(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUICollectionViewForView(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "indexPathForCell:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView:expandEditorialForLabelElement:indexPath:", v5, v8, v7);

  }
}

- (void)_layoutConfirmationGradientRelativeToItemOfferView:(id)a3 alpha:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  if (self->_offerConfirmationGradientView)
  {
    objc_msgSend(a3, "frame");
    v7 = v6;
    v9 = v8;
    -[SUUIGradientView frame](self->_offerConfirmationGradientView, "frame");
    v11 = v10;
    -[SUUIGradientView superview](self->_offerConfirmationGradientView, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;

    v15 = v9 + 30.0;
    -[SUUIGradientView setAlpha:](self->_offerConfirmationGradientView, "setAlpha:", a4);
    -[SUUIGradientView setFrame:](self->_offerConfirmationGradientView, "setFrame:", v7 + -30.0, v11, v15, v14);
    -[SUUIGradientView layer](self->_offerConfirmationGradientView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 30.0 / v15, &unk_2512EEB98);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v17;
    v19[2] = &unk_2512EEBB0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLocations:", v18);

  }
}

- (void)_performDefaultActionForImage:(id)a3
{
  id v4;
  SUUILockupViewElement *v5;
  id v6;
  SUUILockupViewElement *v7;
  _QWORD v8[4];
  SUUILockupViewElement *v9;
  SUUIHorizontalLockupView *v10;
  id v11;

  v4 = a3;
  v5 = self->_lockupElement;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke;
  v8[3] = &unk_2511FA478;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v8);

}

void __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke(uint64_t a1, int a2, char a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  if (!a2 || (a3 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke_2;
    block[3] = &unk_2511F4798;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __58__SUUIHorizontalLockupView__performDefaultActionForImage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  if (v2 == *(void **)(*(_QWORD *)(a1 + 40) + 512))
  {
    objc_msgSend(v2, "firstChildForElementType:", 90);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v7 = v3;
      v5 = objc_msgSend(v3, "isEnabled");
      v4 = v7;
      if (v5)
      {
        v6 = objc_msgSend(*(id *)(a1 + 48), "isDescendentFromViewElement:", v7);
        v4 = v7;
        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 40), "togglePreviewPlaybackAnimated:", 1);
          v4 = v7;
        }
      }
    }

  }
}

- (id)_previewFrontView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUUIViewElement firstChildForElementType:](self->_lockupElement, "firstChildForElementType:", 90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flattenedChildren");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_previewMediaURL
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIViewElement firstChildForElementType:](self->_lockupElement, "firstChildForElementType:", 90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_previewProgressIndicator
{
  SUUIPreviewProgressIndicator *v3;
  SUUIPreviewProgressIndicator *previewProgressIndicator;
  SUUIPreviewProgressIndicator *v5;
  void *v6;
  void *v7;
  SUUIPreviewProgressIndicator *v8;
  void *v9;
  void *v10;
  SUUIPreviewProgressIndicator *v11;

  if (!self->_previewProgressIndicator)
  {
    v3 = -[SUUIPreviewProgressIndicator initWithFrame:]([SUUIPreviewProgressIndicator alloc], "initWithFrame:", 0.0, 0.0, 29.0, 29.0);
    previewProgressIndicator = self->_previewProgressIndicator;
    self->_previewProgressIndicator = v3;

    -[SUUIPreviewProgressIndicator addTarget:action:forControlEvents:](self->_previewProgressIndicator, "addTarget:action:forControlEvents:", self, sel__previewIndicatorAction_, 64);
    v5 = self->_previewProgressIndicator;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPreviewProgressIndicator setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  -[SUUIViewElement firstChildForElementType:](self->_lockupElement, "firstChildForElementType:", 90);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_previewProgressIndicator;
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPreviewProgressIndicator setTintColor:](v8, "setTintColor:", v10);

  v11 = self->_previewProgressIndicator;
  return v11;
}

- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3
{
  id v4;
  int64_t previewState;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  previewState = self->_previewState;
  if (previewState == 3)
  {
    v25 = v4;
    objc_msgSend(v4, "removeFromSuperview");
    -[SUUIHorizontalLockupView _previewFrontView](self, "_previewFrontView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIHorizontalLockupView addSubview:](self, "addSubview:", v23);
    -[SUUIHorizontalLockupView setNeedsLayout](self, "setNeedsLayout");
    self->_previewState = 0;

    v4 = v25;
  }
  else if (previewState == 1)
  {
    v24 = v4;
    -[SUUIPreviewProgressIndicator frame](self->_previewProgressIndicator, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SUUIPreviewProgressIndicator superview](self->_previewProgressIndicator, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIHorizontalLockupView convertRect:fromView:](self, "convertRect:fromView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[SUUIPreviewProgressIndicator setFrame:](self->_previewProgressIndicator, "setFrame:", v16, v18, v20, v22);
    -[SUUIHorizontalLockupView addSubview:](self, "addSubview:", self->_previewProgressIndicator);
    objc_msgSend(v24, "removeFromSuperview");
    -[SUUIPreviewProgressIndicator reloadWithPlayerStatus:animated:](self->_previewProgressIndicator, "reloadWithPlayerStatus:animated:", self->_lastPlayerStatus, 0);
    -[SUUIPreviewProgressIndicator setEnabled:](self->_previewProgressIndicator, "setEnabled:", 1);
    v4 = v24;
    self->_previewState = 2;
  }

}

- (void)_resizeMetadataRelativeToItemOfferView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIHorizontalLockupView _columnForView:](self, "_columnForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[SUUIHorizontalLockupLayout columns](self->_layout, "columns");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v7)
  {
LABEL_22:

    goto LABEL_23;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v36;
  while (2)
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
      if ((objc_msgSend(v13, "isEqual:", v5) & 1) != 0)
      {
        v9 = v12;
        goto LABEL_11;
      }
      objc_msgSend(v13, "childViewElements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
      continue;
    break;
  }
LABEL_11:

  if (v9)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = v9;
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v6);
          -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), (_QWORD)v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "frame");
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend(v4, "frame");
          v44.origin.x = v27;
          v44.origin.y = v28;
          v44.size.width = v29;
          v44.size.height = v30;
          v42.origin.x = v20;
          v42.origin.y = v22;
          v42.size.width = v24;
          v42.size.height = v26;
          v43 = CGRectIntersection(v42, v44);
          if (!CGRectIsNull(v43))
          {
            objc_msgSend(v18, "frame");
            objc_msgSend(v18, "setFrame:");
          }

        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v15);
    }

    goto LABEL_22;
  }
LABEL_23:

}

- (CGSize)_sizeViewsForColumn:(id)a3 toFitWidth:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  const char *v22;
  __int128 v23;
  CGSize result;

  v6 = a3;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x3010000000;
  v22 = "";
  v23 = *MEMORY[0x24BDBF148];
  objc_msgSend(v6, "childViewElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__SUUIHorizontalLockupView__sizeViewsForColumn_toFitWidth___block_invoke;
  v14[3] = &unk_2511FA4A0;
  v14[4] = self;
  v17 = a4;
  v9 = v6;
  v15 = v9;
  v16 = &v19;
  v18 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v10 = v20[4];
  v11 = v20[5];

  _Block_object_dispose(&v19, 8);
  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __59__SUUIHorizontalLockupView__sizeViewsForColumn_toFitWidth___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double width;
  double height;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  id v20;
  CGRect v21;

  v20 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(_QWORD *)(MEMORY[0x24BDBF090] + 8);
  objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  v10 = v9;
  if (v8 >= *(double *)(a1 + 56))
    v11 = *(double *)(a1 + 56);
  else
    v11 = v8;
  v12 = v6;
  v13 = v7;
  v21 = CGRectIntegral(*(CGRect *)(&v10 - 3));
  width = v21.size.width;
  height = v21.size.height;
  objc_msgSend(v5, "setFrame:", v21.origin.x, v21.origin.y);
  if (objc_msgSend(*(id *)(a1 + 40), "identifier") != 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = height
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
    if (*(_QWORD *)(a1 + 64) - 1 > a3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "bottomPaddingForViewElement:", v20);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v16
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
    }
    if (a3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "topPaddingForViewElement:", v20);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v17
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
    }
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(double *)(v18 + 32);
  if (v19 < width)
    v19 = width;
  *(double *)(v18 + 32) = v19;

}

- (BOOL)_usesBackgroundWithAlpha
{
  void *v2;
  int v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v5 = 0.0;
  v6 = 0;
  -[SUUIHorizontalLockupView backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5);

  return v3 && v5 < 1.0 && v5 != 0.0;
}

- (id)_viewElementForView:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_viewElementViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v10, (_QWORD)v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (UIView)metadataBackgroundView
{
  return self->_metadataBackgroundView;
}

- (void)setMetadataBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataBackgroundView, a3);
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (void)setGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColor, a3);
}

- (BOOL)updateLayoutOnButtonConfirmation
{
  return self->_updateLayoutOnButtonConfirmation;
}

- (void)setUpdateLayoutOnButtonConfirmation:(BOOL)a3
{
  self->_updateLayoutOnButtonConfirmation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColor, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_tappableViews, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewProgressIndicator, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_offerViews, 0);
  objc_storeStrong((id *)&self->_offerConfirmationGradientView, 0);
  objc_storeStrong((id *)&self->_metadataBackgroundView, 0);
  objc_storeStrong((id *)&self->_lockupElement, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_lastPlayerStatus, 0);
  objc_storeStrong((id *)&self->_cacheKeyToImageView, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
}

@end
