@implementation CKTranscriptPluginBalloonView

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v3 = a3;
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPrinting"))
  {

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canPluginBalloonsUseOpaqueMask");

    if (!v7)
      return;
  }
  if (-[CKTranscriptPluginBalloonView canUseOpaqueMask](self, "canUseOpaqueMask") != v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKTranscriptPluginBalloonView;
    -[CKBalloonView setCanUseOpaqueMask:](&v8, sel_setCanUseOpaqueMask_, v3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKTranscriptPluginBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)canUseOpaqueMask
{
  void *v3;
  void *v4;
  int v5;
  objc_super v7;

  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPrinting"))
  {

LABEL_4:
    v7.receiver = self;
    v7.super_class = (Class)CKTranscriptPluginBalloonView;
    return -[CKBalloonView canUseOpaqueMask](&v7, sel_canUseOpaqueMask);
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPluginBalloonsUseOpaqueMask");

  if (v5)
    goto LABEL_4;
  return 0;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  CKTranscriptPluginBalloonView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKBalloonView prepareForReuse](&v10, sel_prepareForReuse);
  -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (CKTranscriptPluginBalloonView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[CKTranscriptPluginBalloonView pluginViewController](self, "pluginViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willMoveToParentViewController:", 0);

    objc_msgSend(v3, "removeFromSuperview");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setPluginViewDelegate:", 0);
    +[CKTranscriptPluginViewManager sharedInstance](CKTranscriptPluginViewManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueuePluginViewForReuse:", v3);

    -[CKTranscriptPluginBalloonView pluginViewController](self, "pluginViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromParentViewController");

  }
  -[CKTranscriptPluginBalloonView setPluginViewController:](self, "setPluginViewController:", 0);
  -[CKTranscriptPluginBalloonView setPluginView:](self, "setPluginView:", 0);
  -[CKTranscriptPluginBalloonView setPluginSnapshotView:](self, "setPluginSnapshotView:", 0);
  -[CKTranscriptPluginBalloonView pluginSnapshotViewForThrowAnimation](self, "pluginSnapshotViewForThrowAnimation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[CKTranscriptPluginBalloonView setPluginSnapshotViewForThrowAnimation:](self, "setPluginSnapshotViewForThrowAnimation:", 0);
  -[CKTranscriptPluginBalloonView setDataSource:](self, "setDataSource:", 0);
  -[CKTranscriptPluginBalloonView setSuppressMask:](self, "setSuppressMask:", 0);
  -[CKTranscriptPluginBalloonView setScheduled:](self, "setScheduled:", 0);

}

- (CKTranscriptPluginView)pluginView
{
  return self->_pluginView;
}

- (void)setSuppressMask:(BOOL)a3
{
  if (self->_suppressMask != a3)
  {
    self->_suppressMask = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](self, "prepareForDisplayIfNeeded");
  }
}

- (void)setPluginViewController:(id)a3
{
  objc_storeWeak((id *)&self->_pluginViewController, a3);
}

- (void)setPluginView:(id)a3
{
  CKTranscriptPluginView *v4;
  CKTranscriptPluginView *v5;
  CKTranscriptPluginView *pluginView;
  void *v8;
  NSObject *v9;
  void *v10;
  CKTranscriptPluginView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  int v17;
  CKTranscriptPluginBalloonView *v18;
  __int16 v19;
  CKTranscriptPluginView *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (CKTranscriptPluginView *)a3;
  v5 = v4;
  pluginView = self->_pluginView;
  if (pluginView == v4 && pluginView != 0)
  {
    -[CKTranscriptPluginBalloonView _reparentCurrentPluginView](self, "_reparentCurrentPluginView");
    goto LABEL_23;
  }
  if (pluginView == v4)
    goto LABEL_23;
  if (!-[CKTranscriptPluginBalloonView mayReparentPluginViews](self, "mayReparentPluginViews"))
  {
    -[CKTranscriptPluginView superview](v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          -[CKTranscriptPluginView superview](v5, "superview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412802;
          v18 = self;
          v19 = 2112;
          v20 = v5;
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKTranscriptPluginBalloonView: not setting %@'s plugin view to be %@, since that would remove it from its superview %@", (uint8_t *)&v17, 0x20u);

        }
      }
      goto LABEL_23;
    }
  }
  if (IMIsRunningInMessagesTranscriptExtension())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v5;
      -[CKTranscriptPluginView metadata](v11, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "specialization");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

      }
      else
      {
        -[CKTranscriptPluginView metadata](v11, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "specialization");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      -[CKTranscriptPluginView _setUseLowMemoryImageFilters:](v11, "_setUseLowMemoryImageFilters:", 1);
      goto LABEL_19;
    }
  }
LABEL_20:
  if (-[CKTranscriptPluginView isDescendantOfView:](self->_pluginView, "isDescendantOfView:", self))
    -[CKTranscriptPluginView removeFromSuperview](self->_pluginView, "removeFromSuperview");
  -[CKTranscriptPluginBalloonView _setAndAddPluginViewAsSubview:](self, "_setAndAddPluginViewAsSubview:", v5);
LABEL_23:

}

- (void)setPluginSnapshotViewForThrowAnimation:(id)a3
{
  UIView *v5;
  id *p_pluginSnapshotViewForThrowAnimation;
  UIView *pluginSnapshotViewForThrowAnimation;
  id v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_pluginSnapshotViewForThrowAnimation = (id *)&self->_pluginSnapshotViewForThrowAnimation;
  pluginSnapshotViewForThrowAnimation = self->_pluginSnapshotViewForThrowAnimation;
  if (pluginSnapshotViewForThrowAnimation != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](pluginSnapshotViewForThrowAnimation, "removeFromSuperview");
    objc_storeStrong((id *)&self->_pluginSnapshotViewForThrowAnimation, a3);
    if (*p_pluginSnapshotViewForThrowAnimation)
    {
      -[CKTranscriptPluginBalloonView setPluginView:](self, "setPluginView:", 0);
      v8 = *p_pluginSnapshotViewForThrowAnimation;
    }
    else
    {
      v8 = 0;
    }
    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(*p_pluginSnapshotViewForThrowAnimation, "setAutoresizingMask:", 18);
    -[CKTranscriptPluginBalloonView addSubview:](self, "addSubview:", *p_pluginSnapshotViewForThrowAnimation);
    -[CKTranscriptPluginBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", *p_pluginSnapshotViewForThrowAnimation);
    v5 = v9;
  }

}

- (void)setPluginSnapshotView:(id)a3
{
  UIView *v5;
  UIView **p_pluginSnapshotView;
  UIView *pluginSnapshotView;
  void *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_pluginSnapshotView = &self->_pluginSnapshotView;
  pluginSnapshotView = self->_pluginSnapshotView;
  v10 = v5;
  if (pluginSnapshotView != v5)
  {
    -[UIView removeFromSuperview](pluginSnapshotView, "removeFromSuperview");
    -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

    objc_storeStrong((id *)&self->_pluginSnapshotView, a3);
    if (*p_pluginSnapshotView)
    {
      -[CKTranscriptPluginBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_pluginSnapshotView, 0);
      -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 0.0);

    }
  }

}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UIView)pluginSnapshotViewForThrowAnimation
{
  return self->_pluginSnapshotViewForThrowAnimation;
}

- (CKTranscriptPluginBalloonView)initWithFrame:(CGRect)a3
{
  CKTranscriptPluginBalloonView *v3;
  void *v4;
  int v5;
  CKBalloonImageView *v6;
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
  CKBalloonImageView *v19;
  void *v20;
  void *v21;
  void *v22;
  CKBalloonShapeView *v23;
  CKBalloonShapeView *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, __int16 *);
  void *v29;
  id v30;
  _BYTE v31[80];
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CKTranscriptPluginBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isScheduledMessagesCoreEnabled");

    if (v5)
    {
      v6 = [CKBalloonImageView alloc];
      -[CKTranscriptPluginBalloonView bounds](v3, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[CKTranscriptPluginBalloonView pluginInsets](v3, "pluginInsets");
      v19 = -[CKBalloonImageView initWithFrame:](v6, "initWithFrame:", v8 + v18, v10 + v15, v12 - (v18 + v16), v14 - (v15 + v17));
      -[CKTranscriptPluginBalloonView setPluginInsetMask:](v3, "setPluginInsetMask:", v19);

    }
    -[CKTranscriptPluginBalloonView setMayReparentPluginViews:](v3, "setMayReparentPluginViews:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "theme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unfilledBalloonColorForColorType:", 0xFFFFFFFFLL);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ckColor");
    -[CKBalloonView setStrokeColor:](v3, "setStrokeColor:");

    location = 0;
    objc_initWeak(&location, v3);
    v23 = [CKBalloonShapeView alloc];
    -[CKBalloonView balloonDescriptor](v3, "balloonDescriptor");
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke;
    v29 = &unk_1E2756FA8;
    objc_copyWeak(&v30, &location);
    v24 = -[CKBalloonShapeView initWithDescriptor:imageGenerator:](v23, "initWithDescriptor:imageGenerator:", v31, &v26);
    -[CKTranscriptPluginBalloonView setTailMask:](v3, "setTailMask:", v24, v26, v27, v28, v29);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setTailMask:(id)a3
{
  objc_storeStrong((id *)&self->_tailMask, a3);
}

- (void)setMayReparentPluginViews:(BOOL)a3
{
  self->_mayReparentPluginViews = a3;
}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKBalloonView configureForComposition:](&v14, sel_configureForComposition_, v4);
  objc_msgSend(v4, "shelfPluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "pluginDisplayContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "pluginPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v4, "firstEmbeddedPluginPayload");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v5, "setIsFromMe:", 1);
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balloonPluginForBundleID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataSourceClass")), "initWithPluginPayload:", v5);
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "bubbleClass")), "initWithDataSource:isFromMe:", v11, 1);
  objc_msgSend(v12, "pluginContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView setPluginView:](self, "setPluginView:", v13);

  -[CKTranscriptPluginBalloonView setDataSource:](self, "setDataSource:", v11);
}

id __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke(uint64_t a1, __int16 *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int16 v10;
  void *v11;
  _BYTE v13[7];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  _BYTE v20[64];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke_cold_1(v6);

    v7 = *((_OWORD *)a2 + 2);
    v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)&v20[32] = *((_OWORD *)a2 + 3);
    *(_OWORD *)&v20[48] = v8;
    v9 = *(_OWORD *)a2;
    *(_OWORD *)v20 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&v20[16] = v7;
    v19 = v9;
    goto LABEL_10;
  }
  if (!objc_msgSend(WeakRetained, "canUseOpaqueMask"))
  {
    v10 = *a2;
    *(_QWORD *)((char *)&v19 + 3) = *(_QWORD *)((char *)a2 + 3);
    *((_QWORD *)&v19 + 1) = *((_QWORD *)a2 + 1);
    *(_OWORD *)&v20[1] = *(_OWORD *)((char *)a2 + 17);
    *(_OWORD *)&v20[17] = *(_OWORD *)((char *)a2 + 33);
    *(_OWORD *)&v20[33] = *(_OWORD *)((char *)a2 + 49);
    *(_QWORD *)&v20[48] = *((_QWORD *)a2 + 8);
    *(_DWORD *)&v20[57] = *(_DWORD *)((char *)a2 + 73);
    *(_DWORD *)&v20[60] = *((_DWORD *)a2 + 19);
    LOWORD(v19) = v10;
    BYTE2(v19) = 0;
    v20[0] = -1;
    v20[56] = 0;
    CKResizableBalloonMask(&v19);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v16 = *((_OWORD *)a2 + 2);
  v17 = *((_OWORD *)a2 + 3);
  v18 = *((_QWORD *)a2 + 8);
  v14 = *(_OWORD *)a2;
  v15 = *((_OWORD *)a2 + 1);
  *(_DWORD *)v13 = *(_DWORD *)((char *)a2 + 73);
  *(_DWORD *)&v13[3] = *((_DWORD *)a2 + 19);
  if (!objc_msgSend(v4, "isSyndicationOnboarding"))
  {
    *(_OWORD *)&v20[32] = v17;
    *(_QWORD *)&v20[48] = v18;
    *(_OWORD *)v20 = v15;
    *(_OWORD *)&v20[16] = v16;
    v19 = v14;
    v20[56] = 1;
    *(_DWORD *)&v20[57] = *(_DWORD *)v13;
    *(_DWORD *)&v20[60] = *(_DWORD *)&v13[3];
LABEL_10:
    CKResizableBalloonPunchout(&v19);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  *(_OWORD *)&v20[32] = v17;
  *(_QWORD *)&v20[48] = v18;
  *(_OWORD *)v20 = v15;
  *(_OWORD *)&v20[16] = v16;
  v19 = v14;
  v20[56] = 1;
  *(_DWORD *)&v20[57] = *(_DWORD *)v13;
  *(_DWORD *)&v20[60] = *(_DWORD *)&v13[3];
  CKResizableOnboardingBalloonPunchout(&v19);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v11 = (void *)v5;

  return v11;
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKTranscriptPluginBalloonView willRemoveSubview:](&v3, sel_willRemoveSubview_, a3);
}

- (UIEdgeInsets)pluginInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  if (-[CKTranscriptPluginBalloonView isScheduled](self, "isScheduled"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "linkPreviewSendLaterInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v4 = *MEMORY[0x1E0CEB4B0];
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  CKTranscriptPluginView *pluginView;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _OWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKBalloonView layoutSubviews](&v64, sel_layoutSubviews);
  v3 = -[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu");
  -[CKTranscriptPluginBalloonView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKTranscriptPluginBalloonView pluginInsets](self, "pluginInsets");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);
  if (v3)
  {
    -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
    v19 = v19 - v20;
  }
  -[CKTranscriptPluginView setFrame:](self->_pluginView, "setFrame:", v13, v15, v17, v19);
  -[CKTranscriptPluginBalloonView maskFrame](self, "maskFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[CKTranscriptPluginBalloonView tailMask](self, "tailMask");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isScheduledMessagesCoreEnabled");

  if (v31)
  {
    -[CKBalloonImageView setFrame:](self->_pluginInsetMask, "setFrame:", v13, v15, v17, v19);
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "effectView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v13, v15, v17, v19);

    v34 = -[CKTranscriptPluginBalloonView isScheduled](self, "isScheduled");
    pluginView = self->_pluginView;
    if (v34)
    {
      -[CKTranscriptPluginView setAlpha:](pluginView, "setAlpha:", 0.5);
      -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "effectView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "superview");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKTranscriptPluginBalloonView pluginInsetMask](self, "pluginInsetMask");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "effectView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTranscriptPluginBalloonView insertSubview:above:](self, "insertSubview:above:", v39, v41);

      }
      else
      {
        -[CKTranscriptPluginBalloonView insertSubview:above:](self, "insertSubview:above:", v39, self->_pluginView);
      }
    }
    else
    {
      -[CKTranscriptPluginView setAlpha:](pluginView, "setAlpha:", 1.0);
      -[CKTranscriptPluginBalloonView pluginInsetMask](self, "pluginInsetMask");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeFromSuperview");
    }

  }
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
    v43 = v42;
    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    v45 = v44 - v43;
    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    v47 = v46;
    -[CKTranscriptPluginBalloonView suggestedActionsBackgroundView](self, "suggestedActionsBackgroundView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFrame:", 0.0, v45, v47, v43);

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  BYTE8(v63) = 0;
  if (!-[CKTranscriptPluginBalloonView canUseOpaqueMask](self, "canUseOpaqueMask"))
    BYTE2(v59) = 0;
  v56 = v61;
  v57 = v62;
  v58 = v63;
  v54 = v59;
  v55 = v60;
  -[CKTranscriptPluginBalloonView tailMask](self, "tailMask");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v56;
  v53[3] = v57;
  v53[4] = v58;
  v53[0] = v54;
  v53[1] = v55;
  objc_msgSend(v49, "setDescriptor:", v53);

  -[CKTranscriptPluginBalloonView outlineMask](self, "outlineMask");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v22, v24, v26, v28);

  -[CKTranscriptPluginBalloonView tailMask](self, "tailMask");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v51);

  -[CKTranscriptPluginBalloonView outlineMask](self, "outlineMask");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v52);

}

- (void)prepareForDisplay
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKBalloonView prepareForDisplay](&v13, sel_prepareForDisplay);
  -[CKTranscriptPluginBalloonView updateBalloonMasks](self, "updateBalloonMasks");
  v3 = 0.0;
  v4 = 0.0;
  if (-[CKBalloonView hasTail](self, "hasTail"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonMaskTailSizeForTailShape:", 1);
    v4 = v6;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonMaskTailSizeForTailShape:", 1);
    v3 = v8;

  }
  v9 = *MEMORY[0x1E0CEB4B0];
  v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (!-[CKBalloonView orientation](self, "orientation"))
  {
    v10 = v4;
    v4 = v11;
  }
  -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutMargins:", v9, v10, v3, v4);
  objc_msgSend(v12, "layoutMarginsDidChange");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "setPluginViewDelegate:", self);

}

- (void)updateBalloonMasks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKBalloonShapeView *v10;
  CKBalloonShapeView *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  -[CKTranscriptPluginBalloonView tailMask](self, "tailMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKTranscriptPluginBalloonView outlineMask](self, "outlineMask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[CKTranscriptPluginBalloonView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMask:", 0);

  -[CKTranscriptPluginBalloonView tailMask](self, "tailMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  v31[2] = v34;
  v31[3] = v35;
  v31[4] = v36;
  v31[0] = v32;
  v31[1] = v33;
  objc_msgSend(v6, "setDescriptor:", v31);
  if (-[CKTranscriptPluginBalloonView canUseOpaqueMask](self, "canUseOpaqueMask"))
  {
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsHitTesting:", 0);

    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!-[CKTranscriptPluginBalloonView suppressMask](self, "suppressMask"))
        -[CKTranscriptPluginBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v9);
    }
    else if (-[CKTranscriptPluginBalloonView shouldMaskWhenOpaque](self, "shouldMaskWhenOpaque")
           && !-[CKTranscriptPluginBalloonView suppressMask](self, "suppressMask"))
    {
      -[CKTranscriptPluginBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0);
    }
    goto LABEL_16;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  if (-[CKBalloonView balloonStyle](self, "balloonStyle") - 1 <= 3)
  {
    BYTE8(v30) = 0;
    LOBYTE(v27) = -1;
    -[CKTranscriptPluginBalloonView outlineMask](self, "outlineMask");
    v10 = (CKBalloonShapeView *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = [CKBalloonShapeView alloc];
      v23 = v28;
      v24 = v29;
      v25 = v30;
      v21 = v26;
      v22 = v27;
      v10 = -[CKBalloonShapeView initWithDescriptor:imageGenerator:](v11, "initWithDescriptor:imageGenerator:", &v21, &__block_literal_global_164);
      -[CKBalloonShapeView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
      -[CKTranscriptPluginBalloonView setOutlineMask:](self, "setOutlineMask:", v10);
    }
    v20[2] = v28;
    v20[3] = v29;
    v20[4] = v30;
    v20[0] = v26;
    v20[1] = v27;
    -[CKBalloonShapeView setDescriptor:](v10, "setDescriptor:", v20);
    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    -[CKBalloonShapeView setFrame:](v10, "setFrame:");
    if (!-[CKTranscriptPluginBalloonView suppressMask](self, "suppressMask"))
      -[CKTranscriptPluginBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10, 0);

  }
  if (!-[CKTranscriptPluginBalloonView suppressMask](self, "suppressMask"))
  {
    -[CKTranscriptPluginBalloonView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMask:", v12);

LABEL_16:
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isScheduledMessagesCoreEnabled");

  if (v14)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
    BYTE2(v26) = 0;
    WORD4(v30) = 1;
    -[CKTranscriptPluginBalloonView pluginInsetMask](self, "pluginInsetMask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v28;
    v24 = v29;
    v25 = v30;
    v21 = v26;
    v22 = v27;
    CKResizableBalloonPunchout(&v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v16);

    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "effectView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPluginBalloonView pluginInsetMask](self, "pluginInsetMask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaskView:", v19);

  }
}

id __51__CKTranscriptPluginBalloonView_updateBalloonMasks__block_invoke(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = a2[3];
  v5[2] = a2[2];
  v5[3] = v2;
  v5[4] = a2[4];
  v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  CKResizableBalloonImage((uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setIsSyndicationOnboarding:(BOOL)a3
{
  self->_isSyndicationOnboarding = a3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[CKTranscriptPluginBalloonView updateBalloonMasks](self, "updateBalloonMasks");
  }
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  if (self->_userInterfaceLevel != a3)
  {
    self->_userInterfaceLevel = a3;
    -[CKTranscriptPluginBalloonView updateBalloonMasks](self, "updateBalloonMasks");
  }
}

- (void)setHasTail:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CKBalloonView hasTail](self, "hasTail") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTranscriptPluginBalloonView;
    -[CKBalloonView setHasTail:](&v5, sel_setHasTail_, v3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  -[CKTranscriptPluginBalloonView dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKTranscriptPluginBalloonView pluginInsets](self, "pluginInsets");
    v11 = width - (v9 + v10);
    v14 = height - (v12 + v13);
    -[CKTranscriptPluginBalloonView dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeThatFits:", v11, v14);
    v17 = v16;
    v19 = v18;

    -[CKTranscriptPluginBalloonView pluginInsets](self, "pluginInsets");
    v21 = v20;
    v24 = v17 + v22 + v23;
    v26 = v19 + v21 + v25;
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D820];
    v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v26;
  result.width = v24;
  return result;
}

- (id)overlayColor
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginBalloonSelectionOverlayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKTranscriptPluginBalloonView hitTest:withEvent:](&v32, sel_hitTest_withEvent_, v7, x, y);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CKBalloonView invisibleInkEffectEnabled](self, "invisibleInkEffectEnabled")
    && -[CKTranscriptPluginBalloonView isInteractive](self, "isInteractive"))
  {
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "coverageTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (objc_msgSend(v11, "isUncovered") & 1) == 0)
    {

      goto LABEL_21;
    }

  }
  if (-[CKTranscriptPluginBalloonView isInteractive](self, "isInteractive"))
  {
    -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "interactiveViews");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        -[CKTranscriptPluginBalloonView pluginView](self, "pluginView", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "interactiveViews");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v24, "convertPoint:fromView:", self, x, y);
              objc_msgSend(v24, "hitTest:withEvent:", v7);
              v25 = objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                v26 = (void *)v25;

                v8 = v26;
                goto LABEL_19;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (v21)
              continue;
            break;
          }
        }
LABEL_19:

      }
    }
  }
  v8 = v8;
  v10 = v8;
LABEL_21:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  void *v20;
  uint64_t v22;
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
    goto LABEL_18;
  -[CKBalloonView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "liveBalloonTouched:", self);

  if (-[CKTranscriptPluginBalloonView isInteractive](self, "isInteractive"))
  {
    -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "interactiveViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "containsObject:", v8))
      {

LABEL_18:
        v19 = 0;
        goto LABEL_19;
      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v15);
            if (objc_msgSend(v8, "isDescendantOfView:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i))
              && !CKIsRunningInMessagesNotificationExtension())
            {
              location = 0;
              objc_initWeak(&location, self);
              v22 = MEMORY[0x1E0C809B0];
              objc_copyWeak(&v23, &location);
              -[CKTranscriptPluginBalloonView dataSource](self, "dataSource", v22, 3221225472, __70__CKTranscriptPluginBalloonView_gestureRecognizer_shouldReceiveTouch___block_invoke, &unk_1E274B548);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setWillOpenHandler:", &v22);

              objc_destroyWeak(&v23);
              objc_destroyWeak(&location);

              goto LABEL_18;
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v16)
            continue;
          break;
        }
      }

    }
  }
  v19 = 1;
LABEL_19:

  return v19;
}

void __70__CKTranscriptPluginBalloonView_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "interactionStartedWithPluginBalloonView:", v3);

    WeakRetained = v3;
  }

}

- (void)pluginViewRequestsPresentationAction:(id)a3
{
  -[CKBalloonView tapGestureRecognized:](self, "tapGestureRecognized:", 0);
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)attachInvisibleInkEffectView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[CKTranscriptPluginBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v4);
  else
    -[CKTranscriptPluginBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0);

}

- (void)detachInvisibleInkEffectView
{
  void *v2;
  id v3;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeFromSuperview");
}

- (id)imageForInvisibleInkEffectView
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGContext *CurrentContext;
  id v8;
  void *v9;
  void *v10;
  CGSize v12;
  CGRect v13;

  -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "layoutSubviews");
    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    v12.width = v5;
    v12.height = v6;
    UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v8, "CGColor"));

    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    CGContextFillRect(CurrentContext, v13);
    objc_msgSend(v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "renderInContext:", CurrentContext);

    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)invisibleInkEffectViewWasUncovered
{
  id v2;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendForTimeInterval:", 5.0);

}

- (void)_pluginViewReadyForSnapshot:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CGSize v22;
  CGRect v23;

  v21 = a3;
  v4 = -[CKBalloonView invisibleInkEffectEnabled](self, "invisibleInkEffectEnabled");
  v5 = v21;
  if (v4)
  {
    objc_msgSend(v21, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CKTranscriptPluginViewSnapshotUserInfoKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "size");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v7, "size");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v7, "scale");
      v17 = v16;
      v22.width = v13;
      v22.height = v15;
      UIGraphicsBeginImageContextWithOptions(v22, 1, v17);
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "set");

      v23.size.width = ceil(v9);
      v23.size.height = ceil(v11);
      v23.origin.x = 0.0;
      v23.origin.y = 0.0;
      UIRectFill(v23);
      objc_msgSend(v7, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      UIGraphicsGetImageFromCurrentImageContext();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
    }
    else
    {
      -[CKTranscriptPluginBalloonView imageForInvisibleInkEffectView](self, "imageForInvisibleInkEffectView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hostViewDidUpdateSnapshot:", v19);

    v5 = v21;
  }

}

- (void)_reparentCurrentPluginView
{
  void *v3;
  CKTranscriptPluginBalloonView *v4;
  CKTranscriptPluginBalloonView *v5;

  if (-[CKTranscriptPluginBalloonView mayReparentPluginViews](self, "mayReparentPluginViews")
    || (-[CKTranscriptPluginView superview](self->_pluginView, "superview"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[CKTranscriptPluginView superview](self->_pluginView, "superview");
    v4 = (CKTranscriptPluginBalloonView *)objc_claimAutoreleasedReturnValue();

    if (v4 != self)
      -[CKTranscriptPluginView removeFromSuperview](self->_pluginView, "removeFromSuperview");
    -[CKTranscriptPluginView superview](self->_pluginView, "superview");
    v5 = (CKTranscriptPluginBalloonView *)objc_claimAutoreleasedReturnValue();

    if (v5 != self)
      -[CKTranscriptPluginBalloonView _setAndAddPluginViewAsSubview:](self, "_setAndAddPluginViewAsSubview:", self->_pluginView);
  }
}

- (void)_setAndAddPluginViewAsSubview:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  CKTranscriptPluginView **p_pluginView;
  void *v9;
  void *v10;
  CKTranscriptPluginView *pluginView;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  -[CKBalloonView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKBalloonView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonView:willInsertPluginViewAsSubview:", self, v15);

  }
  p_pluginView = &self->_pluginView;
  objc_storeStrong((id *)&self->_pluginView, a3);
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pluginView = self->_pluginView;
  if (v10)
    -[CKTranscriptPluginBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", pluginView, v10);
  else
    -[CKTranscriptPluginBalloonView addSubview:](self, "addSubview:", pluginView);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isScheduledMessagesCoreEnabled");

  if ((v13 & 1) == 0)
    -[CKTranscriptPluginView setAlpha:](*p_pluginView, "setAlpha:", 1.0);
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObserver:name:object:", self, CFSTR("CKTranscriptPluginViewReadyForSnapshotNotification"), 0);
  if (*p_pluginView)
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__pluginViewReadyForSnapshot_, CFSTR("CKTranscriptPluginViewReadyForSnapshotNotification"));

}

- (BOOL)shouldMaskWhenOpaque
{
  return 1;
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "balloonBackdropFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Cannot have two backdrop filter layers", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _CKAssert(v8 == 0);

    }
    -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperlayer");

      -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
    }
    -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[CKTranscriptPluginBalloonView setSuppressMask:](self, "setSuppressMask:", 1);
    -[CKTranscriptPluginBalloonView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupBlending:", 0);

    v13 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    objc_msgSend(v13, "setGroupName:", CFSTR("FSMBackdropGroup"));
    objc_msgSend(v4, "balloonBackdropFilters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v14);

    objc_msgSend(v13, "setScale:", 0.25);
    -[CKTranscriptPluginBalloonView tailMask](self, "tailMask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMask:", v16);

    -[CKTranscriptPluginBalloonView bounds](self, "bounds");
    objc_msgSend(v13, "setFrame:");
    -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", v13);
    -[CKTranscriptPluginBalloonView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v13);

  }
  -[CKTranscriptPluginBalloonView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonFilters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFilters:", v19);

  -[CKTranscriptPluginBalloonView layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonCompositingFilter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCompositingFilter:", v21);

  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKBalloonView addFilter:](&v22, sel_addFilter_, v4);

}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[CKTranscriptPluginBalloonView pluginView](self, "pluginView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKTranscriptPluginBalloonView setSuppressMask:](self, "setSuppressMask:", 0);
  -[CKTranscriptPluginBalloonView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", 1);

  -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
  -[CKTranscriptPluginBalloonView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", 0);

  -[CKTranscriptPluginBalloonView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", 0);

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKBalloonView clearFilters](&v8, sel_clearFilters);
}

- (void)setSuggestedActionsBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKTranscriptPluginBalloonView suggestedActionsBackgroundView](self, "suggestedActionsBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[CKTranscriptPluginBalloonView setSuggestedActionsBackgroundView:](self, "setSuggestedActionsBackgroundView:", v6);

    -[CKTranscriptPluginBalloonView suggestedActionsBackgroundView](self, "suggestedActionsBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPluginBalloonView addSubview:](self, "addSubview:", v7);

  }
  -[CKTranscriptPluginBalloonView suggestedActionsBackgroundView](self, "suggestedActionsBackgroundView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v4);

}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (UIViewController)pluginViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_pluginViewController);
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (BOOL)mayReparentPluginViews
{
  return self->_mayReparentPluginViews;
}

- (BOOL)isScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (CKBalloonShapeView)tailMask
{
  return self->_tailMask;
}

- (CKBalloonShapeView)outlineMask
{
  return self->_outlineMask;
}

- (void)setOutlineMask:(id)a3
{
  objc_storeStrong((id *)&self->_outlineMask, a3);
}

- (CKBalloonImageView)pluginInsetMask
{
  return self->_pluginInsetMask;
}

- (void)setPluginInsetMask:(id)a3
{
  objc_storeStrong((id *)&self->_pluginInsetMask, a3);
}

- (UIView)pluginSnapshotView
{
  return self->_pluginSnapshotView;
}

- (BOOL)isSyndicationOnboarding
{
  return self->_isSyndicationOnboarding;
}

- (BOOL)suppressMask
{
  return self->_suppressMask;
}

- (UIView)suggestedActionsBackgroundView
{
  return self->_suggestedActionsBackgroundView;
}

- (void)setSuggestedActionsBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedActionsBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActionsBackgroundView, 0);
  objc_storeStrong((id *)&self->_pluginSnapshotView, 0);
  objc_storeStrong((id *)&self->_pluginInsetMask, 0);
  objc_storeStrong((id *)&self->_outlineMask, 0);
  objc_storeStrong((id *)&self->_tailMask, 0);
  objc_storeStrong((id *)&self->_pluginSnapshotViewForThrowAnimation, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_pluginView, 0);
  objc_destroyWeak((id *)&self->_pluginViewController);
}

- (void)configureForTranscriptPlugin:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  char v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKTranscriptPluginBalloonView;
  v7 = a4;
  -[CKBalloonView configureForMessagePart:](&v26, sel_configureForMessagePart_, v6);
  -[CKBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v6, "balloonOrientation", v26.receiver, v26.super_class));
  objc_msgSend(v6, "extensibleViewControllerForContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView setPluginViewController:](self, "setPluginViewController:", v8);

  objc_msgSend(v6, "extensibleViewForContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView setPluginView:](self, "setPluginView:", v9);

  objc_msgSend(v6, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

  objc_msgSend(v6, "IMChatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginBalloonView setDataSource:](self, "setDataSource:", v12);

  objc_msgSend(v6, "balloonControllerForContext:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v13, "isInteractive");
  else
    v14 = 0;
  -[CKTranscriptPluginBalloonView setIsInteractive:](self, "setIsInteractive:", v14);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isScheduledMessagesCoreEnabled");

  if (v16)
    -[CKTranscriptPluginBalloonView setScheduled:](self, "setScheduled:", objc_msgSend(v6, "wantsPendingMessageStyle"));
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isDashedBalloonsEnabled");

  v19 = objc_msgSend(v6, "wantsPendingMessageStyle");
  if (v18)
    v20 = 3;
  else
    v20 = 1;
  if ((v19 & 1) == 0)
    v20 = objc_msgSend(v6, "balloonStyle", v20);
  -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", v20);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isScheduledMessagesCoreEnabled");

  if (v22 && objc_msgSend(v6, "wantsPendingMessageStyle") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "balloonOutlineColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "colorWithAlphaComponent:", 0.5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "ckColor");
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "wantsOutline"))
    -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", 1);
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "balloonOutlineColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPluginBalloonView setSuggestedActionsBackgroundColor:](self, "setSuggestedActionsBackgroundColor:", v25);

  }
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
  -[CKBalloonView addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:](self, "addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:", a3, 1);
}

void __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Requested imageGenerator lost reference to self, returning back a normal punchout.", v1, 2u);
}

@end
