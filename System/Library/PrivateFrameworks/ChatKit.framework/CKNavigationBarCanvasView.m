@implementation CKNavigationBarCanvasView

- (CKNavigationBarCanvasView)initWithFrame:(CGRect)a3
{
  CKNavigationBarCanvasView *v3;
  CKNavigationBarCanvasView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKNavigationBarCanvasView;
  v3 = -[CKNavigationBarCanvasView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKNavigationBarCanvasView setShouldAnimateAvatarLayoutChanges:](v3, "setShouldAnimateAvatarLayoutChanges:", 0);
    -[CKNavigationBarCanvasView setIsInEditingMode:](v4, "setIsInEditingMode:", 0);
    -[CKNavigationBarCanvasView setIsAnimatingAvatars:](v4, "setIsAnimatingAvatars:", 0);
    -[CKNavigationBarCanvasView setIgnoreNextWidthChange:](v4, "setIgnoreNextWidthChange:", 0);
    -[CKNavigationBarCanvasView setAudioEnabled:](v4, "setAudioEnabled:", 1);
    -[CKNavigationBarCanvasView setVideoEnabled:](v4, "setVideoEnabled:", 1);
    -[CKNavigationBarCanvasView setExpanseEnabled:](v4, "setExpanseEnabled:", 1);
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (setFrame__onceToken != -1)
    dispatch_once(&setFrame__onceToken, &__block_literal_global_201);
  if (setFrame__isPad)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[CKNavigationBarCanvasView frame](self, "frame");
    objc_msgSend(v8, "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (setFrame__isPad)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

    if ((v12 & 1) == 0)
      -[CKNavigationBarCanvasView setIgnoreNextWidthChange:](self, "setIgnoreNextWidthChange:", 1);
  }

}

void __38__CKNavigationBarCanvasView_setFrame___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  setFrame__isPad = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (void)removeFromSuperview
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  CKNavigationBarCanvasView *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKNavigationBarCanvasView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "CKNavigationBarCanvasView instance\n {%@} is being removed from its superview\n {%@}.", buf, 0x16u);

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView removeFromSuperview](&v5, sel_removeFromSuperview);
}

- (void)didMoveToSuperview
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  CKNavigationBarCanvasView *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKNavigationBarCanvasView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "CKNavigationBarCanvasView instance\n {%@} did move to superview\n {%@}.", buf, 0x16u);

    }
  }
}

- (void)setIsInEditingMode:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  self->_isInEditingMode = a3;
  -[CKNavigationBarCanvasView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateLayout");

  }
}

- (void)setIsBusinessChat:(BOOL)a3
{
  if (self->_isBusinessChat != a3)
  {
    self->_isBusinessChat = a3;
    -[CKNavigationBarCanvasView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMultiwayAudioButtonHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_multiwayAudioButtonHidden != a3)
  {
    self->_multiwayAudioButtonHidden = a3;
    if (-[CKNavigationBarCanvasView multiwayAudioButtonHidden](self, "multiwayAudioButtonHidden"))
    {
      -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[CKNavigationBarCanvasView buttonsToDisplay](self, "buttonsToDisplay");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObject:", v6);

        -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeFromSuperview");

        -[CKNavigationBarCanvasView setButtonViewFaceTimeAudio:](self, "setButtonViewFaceTimeAudio:", 0);
      }
    }
    -[CKNavigationBarCanvasView setNeedsLayout](self, "setNeedsLayout");
    -[CKNavigationBarCanvasView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setJoinButtonStyle:(int64_t)a3
{
  if (self->_joinButtonStyle != a3)
  {
    self->_joinButtonStyle = a3;
    -[CKNavigationBarCanvasView _updateJoinButtonStyle](self, "_updateJoinButtonStyle");
  }
}

- (void)setAudioEnabled:(BOOL)a3
{
  if (self->_audioEnabled != a3)
  {
    self->_audioEnabled = a3;
    -[CKNavigationButtonView setEnabled:](self->_buttonViewFaceTimeAudio, "setEnabled:");
  }
}

- (void)setVideoEnabled:(BOOL)a3
{
  if (self->_videoEnabled != a3)
  {
    self->_videoEnabled = a3;
    -[CKNavigationButtonView setEnabled:](self->_buttonViewFaceTimeVideo, "setEnabled:");
  }
}

- (void)_updateJoinButtonStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  switch(self->_joinButtonStyle)
  {
    case 0:
      -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 0;
      goto LABEL_9;
    case 1:
      -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 4;
      goto LABEL_9;
    case 3:
      -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setJoinButtonStyle:", 0);

      if (CKJoinPillTextMetrics() <= 70.0)
        v7 = 1;
      else
        v7 = 2;
      -[CKNavigationBarCanvasView buttonViewFaceTimeVideo](self, "buttonViewFaceTimeVideo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setJoinButtonStyle:", v7);

      -[CKNavigationBarCanvasView buttonViewFaceTimeVideo](self, "buttonViewFaceTimeVideo");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWantsVibrancy:", 1);
      goto LABEL_12;
    case 4:
      -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 5;
LABEL_9:
      objc_msgSend(v3, "setJoinButtonStyle:", v5);

      -[CKNavigationBarCanvasView buttonViewFaceTimeVideo](self, "buttonViewFaceTimeVideo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v10 = 0;
      goto LABEL_11;
    case 6:
      -[CKNavigationBarCanvasView buttonViewFaceTimeAudio](self, "buttonViewFaceTimeAudio");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setJoinButtonStyle:", 0);

      -[CKNavigationBarCanvasView buttonViewFaceTimeVideo](self, "buttonViewFaceTimeVideo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v10 = 3;
LABEL_11:
      objc_msgSend(v9, "setJoinButtonStyle:", v10);
LABEL_12:

      break;
    default:
      return;
  }
}

- (void)removeButtonViewsIfNeeded
{
  -[CKNavigationButtonView removeFromSuperview](self->_buttonViewFaceTimeAudio, "removeFromSuperview");
  -[CKNavigationButtonView removeFromSuperview](self->_buttonViewFaceTimeVideo, "removeFromSuperview");
  -[CKNavigationButtonView removeFromSuperview](self->_buttonViewInfo, "removeFromSuperview");
  -[CKNavigationBarCanvasView setButtonViewFaceTimeAudio:](self, "setButtonViewFaceTimeAudio:", 0);
  -[CKNavigationBarCanvasView setButtonViewFaceTimeVideo:](self, "setButtonViewFaceTimeVideo:", 0);
  -[CKNavigationBarCanvasView setButtonViewInfo:](self, "setButtonViewInfo:", 0);
}

+ (double)preferredLandscapeHeightForCompactWidth
{
  return 32.0;
}

+ (double)preferredLandscapeHeightForRegularWidth
{
  return 44.0;
}

- (void)setTitleView:(id)a3
{
  UIView *v5;
  UIView *v6;
  UIView **p_titleView;
  int v8;
  void *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  v6 = v5;
  p_titleView = &self->_titleView;
  if (self->_titleView != v5)
  {
    v11 = v5;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 0);
    -[UIView removeFromSuperview](*p_titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    v6 = v11;
    if (*p_titleView)
    {
      -[UIView sizeToFit](*p_titleView, "sizeToFit");
      -[CKNavigationBarCanvasView addSubview:](self, "addSubview:", *p_titleView);
      v8 = CKIsRunningInMacCatalyst();
      v6 = v11;
      if (v8)
      {
        -[CKNavigationBarCanvasView titleView](self, "titleView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavigationBarCanvasView setTitleDefaultBackgroundColor:](self, "setTitleDefaultBackgroundColor:", v10);

        v6 = v11;
      }
    }
  }

}

- (void)setSubtitleView:(id)a3
{
  UIView *v5;
  UIView **p_subtitleView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_subtitleView = &self->_subtitleView;
  if (self->_subtitleView != v5)
  {
    v7 = v5;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 0);
    -[UIView removeFromSuperview](*p_subtitleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_subtitleView, a3);
    if (*p_subtitleView)
    {
      -[UIView sizeToFit](*p_subtitleView, "sizeToFit");
      -[CKNavigationBarCanvasView addSubview:](self, "addSubview:", *p_subtitleView);
    }
    -[CKNavigationBarCanvasView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setTitleViewContextMenu:(id)a3
{
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
  id v16;

  v16 = a3;
  objc_storeStrong((id *)&self->_titleViewContextMenu, a3);
  -[CKNavigationBarCanvasView invisibleContextMenuButton](self, "invisibleContextMenuButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationBarCanvasView setInvisibleContextMenuButton:](self, "setInvisibleContextMenuButton:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationBarCanvasView invisibleContextMenuButton](self, "invisibleContextMenuButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  -[CKNavigationBarCanvasView invisibleContextMenuButton](self, "invisibleContextMenuButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMenu:", v16);

  -[CKNavigationBarCanvasView invisibleContextMenuButton](self, "invisibleContextMenuButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContextMenuIsPrimary:", 1);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4B8]), "initWithDelegate:", self);
  -[CKNavigationBarCanvasView setSecondaryTitleInteraction:](self, "setSecondaryTitleInteraction:", v11);

  -[CKNavigationBarCanvasView invisibleContextMenuButton](self, "invisibleContextMenuButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationBarCanvasView secondaryTitleInteraction](self, "secondaryTitleInteraction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addInteraction:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", self, sel_didHoverOverTitleView_);
  -[CKNavigationBarCanvasView invisibleContextMenuButton](self, "invisibleContextMenuButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addGestureRecognizer:", v14);

  -[CKNavigationBarCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[CKNavigationBarCanvasView secondaryTitleInteraction](self, "secondaryTitleInteraction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v7)
  {
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pointInside:withEvent:", 0, x, y);

    v9 = 0;
    if (v11)
    {
      location = 0;
      objc_initWeak(&location, self);
      v12 = (void *)MEMORY[0x1E0CEA4B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __83__CKNavigationBarCanvasView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v14[3] = &unk_1E2758208;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v12, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

id __83__CKNavigationBarCanvasView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "titleViewContextMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didHoverOverTitleView:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 3)
  {
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CKNavigationBarCanvasView titleDefaultBackgroundColor](self, "titleDefaultBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v7);
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) != 0)
    {
      -[CKNavigationBarCanvasView titleView](self, "titleView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "theme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "conversationListSelectedCellColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v10);

LABEL_7:
    }
  }
}

- (void)setLeftItemView:(id)a3
{
  UIView *v5;
  UIView **p_leftItemView;
  UIView *leftItemView;
  char isKindOfClass;
  UIView *v9;

  v5 = (UIView *)a3;
  p_leftItemView = &self->_leftItemView;
  leftItemView = self->_leftItemView;
  if (leftItemView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](leftItemView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leftItemView, a3);
    v5 = v9;
    if (v9)
    {
      -[UIView sizeToFit](*p_leftItemView, "sizeToFit");
      -[CKNavigationBarCanvasView addSubview:](self, "addSubview:", *p_leftItemView);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = v9;
      if ((isKindOfClass & 1) != 0)
      {
        -[CKNavigationBarCanvasView _addLaserEffectToButton:](self, "_addLaserEffectToButton:", *p_leftItemView);
        v5 = v9;
      }
    }
  }

}

- (void)setRightItemView:(id)a3
{
  UIView *v5;
  UIView **p_rightItemView;
  UIView *rightItemView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_rightItemView = &self->_rightItemView;
  rightItemView = self->_rightItemView;
  v8 = v5;
  if (rightItemView != v5)
  {
    -[UIView removeFromSuperview](rightItemView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_rightItemView, a3);
    if (*p_rightItemView)
    {
      -[UIView sizeToFit](*p_rightItemView, "sizeToFit");
      -[CKNavigationBarCanvasView addSubview:](self, "addSubview:", *p_rightItemView);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[CKNavigationBarCanvasView _addLaserEffectToButton:](self, "_addLaserEffectToButton:", *p_rightItemView);
    }
  }

}

- (void)setStatusIndicatorType:(int64_t)a3
{
  uint64_t v5;
  void (**v6)(void *, uint64_t, _QWORD);
  id *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD aBlock[5];

  if (setStatusIndicatorType__onceToken != -1)
    dispatch_once(&setStatusIndicatorType__onceToken, &__block_literal_global_105_1);
  if (self->_statusIndicatorType != a3)
  {
    self->_statusIndicatorType = a3;
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_2;
    aBlock[3] = &unk_1E2758258;
    aBlock[4] = self;
    v6 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
    if (self->_statusIndicatorType
      || (-[CKNavigationBarCanvasView statusIndicatorImageView](self, "statusIndicatorImageView"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      v7 = (id *)&setStatusIndicatorType__expanseIndicatorImage;
      v8 = &setStatusIndicatorType__videoIndicatorImage;
      if (a3 != 2)
        v8 = &setStatusIndicatorType__audioIndicatorImage;
      if (a3 != 3)
        v7 = (id *)v8;
      v9 = *v7;
      -[CKNavigationBarCanvasView statusIndicatorImageView](self, "statusIndicatorImageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CKNavigationBarCanvasView statusIndicatorImageView](self, "statusIndicatorImageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setImage:", v9);
      }
      else
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v9);
        -[CKNavigationBarCanvasView setStatusIndicatorImageView:](self, "setStatusIndicatorImageView:", v13);

        -[CKNavigationBarCanvasView statusIndicatorImageView](self, "statusIndicatorImageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNavigationBarCanvasView addSubview:](self, "addSubview:", v11);
      }

      -[CKNavigationBarCanvasView statusIndicatorImageView](self, "statusIndicatorImageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContentMode:", 1);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "theme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "navBarGrayColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNavigationBarCanvasView statusIndicatorImageView](self, "statusIndicatorImageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTintColor:", v17);

      -[CKNavigationBarCanvasView setNeedsLayout](self, "setNeedsLayout");
      -[CKNavigationBarCanvasView layoutIfNeeded](self, "layoutIfNeeded");
      v6[2](v6, 1, 0);

    }
    else
    {
      v19[0] = v5;
      v19[1] = 3221225472;
      v19[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_5;
      v19[3] = &unk_1E274A208;
      v19[4] = self;
      ((void (**)(void *, uint64_t, _QWORD *))v6)[2](v6, 0, v19);
    }

  }
}

void __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "navBarHeaderVideoImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navBarGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_flatImageWithColor:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)setStatusIndicatorType__videoIndicatorImage;
  setStatusIndicatorType__videoIndicatorImage = v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navBarHeaderAudioImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navBarGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_flatImageWithColor:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)setStatusIndicatorType__audioIndicatorImage;
  setStatusIndicatorType__audioIndicatorImage = v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "navBarHeaderExpanseImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "theme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navBarGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_flatImageWithColor:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)setStatusIndicatorType__expanseIndicatorImage;
  setStatusIndicatorType__expanseIndicatorImage = v18;

}

void __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double height;
  double width;
  double y;
  double x;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  CGRect v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[9];
  CGRect v30;
  char v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  v15 = CGRectGetWidth(v32) * -0.33;
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  v34 = CGRectOffset(v33, v15, 0.0);
  v26 = v34;
  v16 = 1.0;
  if (a2)
  {
    v16 = 0.0;
    height = v34.size.height;
  }
  else
  {
    height = v14;
  }
  if (a2)
    width = v34.size.width;
  else
    width = v12;
  if (a2)
    y = v34.origin.y;
  else
    y = v10;
  if (a2)
    x = v34.origin.x;
  else
    x = v8;
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView", *(_QWORD *)&v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", x, y, width, height);

  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", v25);

  v23 = (void *)MEMORY[0x1E0CEABB0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_3;
  v29[3] = &unk_1E2758230;
  v29[4] = *(_QWORD *)(a1 + 32);
  v31 = a2;
  *(CGFloat *)&v29[5] = v8;
  *(CGFloat *)&v29[6] = v10;
  *(CGFloat *)&v29[7] = v12;
  *(CGFloat *)&v29[8] = v14;
  v30 = v26;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_4;
  v27[3] = &unk_1E274C308;
  v28 = v5;
  v24 = v5;
  objc_msgSend(v23, "animateWithDuration:animations:completion:", v29, v27, 0.3);

}

void __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_3(uint64_t a1)
{
  double *v2;
  double *v3;
  double *v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  if (*(_BYTE *)(a1 + 104))
    v2 = (double *)(a1 + 40);
  else
    v2 = (double *)(a1 + 72);
  if (*(_BYTE *)(a1 + 104))
    v3 = (double *)(a1 + 48);
  else
    v3 = (double *)(a1 + 80);
  if (*(_BYTE *)(a1 + 104))
    v4 = (double *)(a1 + 56);
  else
    v4 = (double *)(a1 + 88);
  if (*(_BYTE *)(a1 + 104))
    v5 = (double *)(a1 + 64);
  else
    v5 = (double *)(a1 + 96);
  v6 = *v5;
  v7 = *v4;
  v8 = *v3;
  v9 = *v2;
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v9, v8, v7, v6);

  if (*(_BYTE *)(a1 + 104))
    v11 = 1.0;
  else
    v11 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

}

uint64_t __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__CKNavigationBarCanvasView_setStatusIndicatorType___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setStatusIndicatorImageView:", 0);
}

- (void)clearAllItemViews
{
  -[CKNavigationBarCanvasView setLeftItemView:](self, "setLeftItemView:", 0);
  -[CKNavigationBarCanvasView setRightItemView:](self, "setRightItemView:", 0);
  -[CKNavigationBarCanvasView setTitleView:](self, "setTitleView:", 0);
}

- (void)_addLaserEffectToButton:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v3, "setPointerStyleProvider:", &__block_literal_global_111_2);

}

id __53__CKNavigationBarCanvasView__addLaserEffectToButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "bounds");
  v7 = v6;
  objc_msgSend(v4, "frame");
  v9 = v8;
  objc_msgSend(v4, "frame");
  v11 = v10;
  if (CKMainScreenScale_once_83 != -1)
    dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
  v12 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
  objc_msgSend(v4, "frame");
  v14 = v13;
  objc_msgSend(v4, "frame");
  v16 = v15;
  if (CKMainScreenScale_once_83 != -1)
    dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
  v17 = 1.0;
  if (v12 == 0.0)
    v18 = 1.0;
  else
    v18 = v12;
  v19 = round((v9 + v11 * 0.5 - (v7 + 16.0) * 0.5) * v18) / v18;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_83 != 0.0)
    v17 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:", v19, round((v14 + v16 * 0.5 + -18.5) * v17) / v17, v7 + 16.0, 37.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v5, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CKNavigationBarCanvasView *v4;
  CKNavigationBarCanvasView *v5;
  void *v6;
  char isKindOfClass;
  CKNavigationBarCanvasView *v8;
  objc_super v10;

  v4 = self;
  v10.receiver = self;
  v10.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKNavigationBarCanvasView *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[CKNavigationBarCanvasView superview](v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        v4 = v5;
    }
  }
  v8 = v4;

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  v9.receiver = self;
  v9.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView sizeThatFits:](&v9, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  -[CKNavigationBarCanvasView _updatedPreferredHeight](self, "_updatedPreferredHeight");
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_updatedPreferredHeight
{
  void *v3;
  char v4;
  double result;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldConfigureForJunkModal");

  if ((v4 & 1) != 0)
    return 85.0;
  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKNavigationBarCanvasView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredHeightOverride");
    v9 = v8;

    if (v9 > 0.0)
    {
      -[CKNavigationBarCanvasView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredHeightOverride");
      v12 = v11;

      return v12;
    }
  }
  else
  {

  }
  -[CKNavigationBarCanvasView _preferredHeightFromSubviewMetrics](self, "_preferredHeightFromSubviewMetrics");
  return result;
}

- (double)_preferredHeightFromSubviewMetrics
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CKNavigationBarCanvasView window](self, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = (void *)v5;
  -[CKNavigationBarCanvasView frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v8 == v11 && v10 == v12)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v15 = v17;

  }
  else
  {
    -[CKNavigationBarCanvasView frame](self, "frame");
    v15 = v14;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "navigationBarDefaultHeight");
  v20 = v19;

  -[CKNavigationBarCanvasView _subviewLayoutWithBounds:](self, "_subviewLayoutWithBounds:", v3, v4, v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationBarCanvasView _preferredHeightWithSubviewLayout:](self, "_preferredHeightWithSubviewLayout:", v21);
  v23 = v22;

  return v23;
}

- (double)_preferredHeightWithSubviewLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;

  v4 = a3;
  objc_msgSend(v4, "titleFrame");
  v6 = v5;
  objc_msgSend(v4, "subtitleFrame");
  v8 = v7;
  objc_msgSend(v4, "leftItemFrame");
  v10 = v9;
  objc_msgSend(v4, "rightItemFrame");
  v12 = v11;

  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldConfigureForJunkModal");

  v15 = v10 + 17.0;
  if (!v14)
    v15 = v10;
  v16 = v6 + v8;
  if (v15 >= v12)
    v17 = v15;
  else
    v17 = v12;
  if (-[CKNavigationBarCanvasView _canShowAvatarView](self, "_canShowAvatarView"))
  {
    -[CKNavigationBarCanvasView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldUseMinimumSafeAreas");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:", v19);
    v22 = v16 + v21;

  }
  else
  {
    if (v17 >= v16 + 8.0)
      v23 = v16;
    else
      v23 = v16 + 8.0;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultNavigationBarNoContactPhotoCollapsedHeightValue");
    v22 = v25;

    if (v23 >= v22)
      v22 = v23;
  }
  if (v17 >= v22)
    return v17;
  else
    return v22;
}

- (BOOL)_canShowAvatarView
{
  void *v2;
  char v3;

  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowAvatarView");

  return v3;
}

- (UIEdgeInsets)safeAreaInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  -[CKNavigationBarCanvasView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (v8 > 0.0 || v12 > 0.0)
  {
    -[CKNavigationBarCanvasView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (unint64_t)(objc_msgSend(v14, "interfaceOrientation") - 3) <= 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "landscapeKeyboardInsets");
      v17 = v16;
      v19 = v18;

      if (v8 > 0.0)
        v8 = v17;
      if (v12 > 0.0)
        v12 = v19;
    }

  }
  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (UIEdgeInsets)systemMinimumLayoutMarginsFromDelegate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKNavigationBarCanvasView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemMinimumLayoutMarginsForView:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[CKNavigationBarCanvasView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (v13)
      v14 = v12;
    else
      v14 = v8;
    if (!v13)
      v8 = v12;

  }
  else
  {
    v6 = *MEMORY[0x1E0CEB4B0];
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v15 = v6;
  v16 = v14;
  v17 = v10;
  v18 = v8;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)layoutTitleViewIfNeeded:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  int isKindOfClass;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _QWORD v27[9];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKNavigationBarCanvasView titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v11 = !-[CKNavigationBarCanvasView shouldAnimateAvatarLayoutChanges](self, "shouldAnimateAvatarLayoutChanges");
    else
      v11 = 1;
    v12 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke;
    v31[3] = &unk_1E27582A0;
    v31[4] = self;
    *(double *)&v31[5] = x;
    *(double *)&v31[6] = y;
    *(double *)&v31[7] = width;
    *(double *)&v31[8] = height;
    __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke((uint64_t)v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CKNavigationBarCollectionViewShouldAdustForEditingModeNotification, 0, v13);

    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && -[CKNavigationBarCanvasView ignoreNextWidthChange](self, "ignoreNextWidthChange"))
    {
      v18 = !-[CKNavigationBarCanvasView isInEditingMode](self, "isInEditingMode");
    }
    else
    {
      v18 = 0;
    }
    if (((v11 | v18) & 1) != 0)
    {
      if ((-[CKNavigationBarCanvasView isInEditingMode](self, "isInEditingMode") & isKindOfClass) == 1
        && !-[CKNavigationBarCanvasView isAnimatingAvatars](self, "isAnimatingAvatars"))
      {
        objc_msgSend(v15, "collectionViewLayout");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "invalidateLayout");

        if (CKMainScreenScale_once_83 != -1)
          dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
        v21 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
          v21 = 1.0;
        v22 = round(x * v21) / v21;
        v23 = round(y * v21) / v21;
        v24 = round(width * v21) / v21;
        v25 = round(height * v21) / v21;
        -[CKNavigationBarCanvasView titleView](self, "titleView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFrame:", v22, v23, v24, v25);

        if (!v18)
          goto LABEL_18;
        goto LABEL_17;
      }
      if (!-[CKNavigationBarCanvasView isAnimatingAvatars](self, "isAnimatingAvatars"))
      {
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_4;
        v27[3] = &unk_1E274B8B8;
        v27[4] = self;
        *(double *)&v27[5] = x;
        *(double *)&v27[6] = y;
        *(double *)&v27[7] = width;
        *(double *)&v27[8] = height;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v27);
        if (!v18)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else
    {
      -[CKNavigationBarCanvasView setIsAnimatingAvatars:](self, "setIsAnimatingAvatars:", 1);
      v19 = (void *)MEMORY[0x1E0CEABB0];
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_2;
      v29[3] = &unk_1E274A208;
      v30 = v15;
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_3;
      v28[3] = &unk_1E274A1B8;
      v28[4] = self;
      objc_msgSend(v19, "animateWithDuration:animations:completion:", v29, v28, 0.3);

    }
    if (!v18)
    {
LABEL_18:

      return;
    }
LABEL_17:
    -[CKNavigationBarCanvasView setIgnoreNextWidthChange:](self, "setIgnoreNextWidthChange:", 0);
    goto LABEL_18;
  }
}

id __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  _OWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isInEditingMode"))
  {
    v10[0] = kCKNavigationBarCollectionViewKey;
    objc_msgSend(*(id *)(a1 + 32), "titleView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v2;
    v10[1] = kCKNavigationBarEditFrameKey;
    v3 = *(_OWORD *)(a1 + 56);
    v7[0] = *(_OWORD *)(a1 + 40);
    v7[1] = v3;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = kCKNavigationBarIsInEditingModeKey;
    v11[1] = v4;
    v11[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8[0] = kCKNavigationBarCollectionViewKey;
    objc_msgSend(*(id *)(a1 + 32), "titleView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = kCKNavigationBarIsInEditingModeKey;
    v9[0] = v2;
    v9[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

uint64_t __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShouldAnimateAvatarLayoutChanges:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingAvatars:", 0);
}

void __53__CKNavigationBarCanvasView_layoutTitleViewIfNeeded___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_83 != -1)
    dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
    v6 = 1.0;
  v7 = round(v2 * v6) / v6;
  v8 = round(v3 * v6) / v6;
  v9 = round(v4 * v6) / v6;
  v10 = round(v5 * v6) / v6;
  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CKNavigationBarCanvasView *v17;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKNavigationBarCanvasView;
  -[CKNavigationBarCanvasView layoutSubviews](&v19, sel_layoutSubviews);
  -[CKNavigationBarCanvasView bounds](self, "bounds");
  -[CKNavigationBarCanvasView _subviewLayoutWithBounds:](self, "_subviewLayoutWithBounds:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __43__CKNavigationBarCanvasView_layoutSubviews__block_invoke;
  v16 = &unk_1E274A108;
  v17 = self;
  v5 = v3;
  v18 = v5;
  objc_msgSend(v4, "performWithoutAnimation:", &v13);
  if (self->_statusIndicatorImageView)
  {
    objc_msgSend(v5, "statusIndicatorFrame", v13, v14, v15, v16, v17);
    -[UIImageView setFrame:](self->_statusIndicatorImageView, "setFrame:");
  }
  -[CKNavigationBarCanvasView _preferredHeightWithSubviewLayout:](self, "_preferredHeightWithSubviewLayout:", v5, v13, v14, v15, v16, v17);
  v7 = v6;
  -[CKNavigationBarCanvasView lastLayoutPreferredHeight](self, "lastLayoutPreferredHeight");
  v9 = vabdd_f64(v8, v7);
  objc_msgSend(v5, "titleFrame");
  -[CKNavigationBarCanvasView layoutTitleViewIfNeeded:](self, "layoutTitleViewIfNeeded:");
  if (v9 >= 0.00000999999975)
  {
    -[CKNavigationBarCanvasView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CKNavigationBarCanvasView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "canvasViewPreferredHeightChanged");

    }
  }
  -[CKNavigationBarCanvasView setLastLayoutPreferredHeight:](self, "setLastLayoutPreferredHeight:", v7);

}

void __43__CKNavigationBarCanvasView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 40), "leftItemFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "leftItemView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 40), "rightItemFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "rightItemView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  objc_msgSend(*(id *)(a1 + 32), "subtitleView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subtitleFrame");
  objc_msgSend(v20, "setFrame:");

}

- (id)_subviewLayoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
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
  void *v28;
  char isKindOfClass;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  char v35;
  double v36;
  double v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  void *v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  char v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  double v97;
  uint64_t v98;
  double v99;
  double v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  CGRect *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double MidX;
  void *v122;
  int v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  char v131;
  double v132;
  void *v133;
  double v134;
  CGFloat x;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  double MaxX;
  double MinX;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  double v151;
  UIImageView *statusIndicatorImageView;
  void *v153;
  unint64_t v154;
  double v155;
  double v156;
  double v157;
  UIView *v158;
  UIView *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  CGRect *v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  CGFloat v171;
  CGFloat v172;
  double v173;
  CGFloat v174;
  CGFloat v175;
  void *v176;
  char v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  double v189;
  double v190;
  double v191;
  double v192;
  CGFloat v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  CGFloat y;
  double v204;
  double rect2;
  double rect2a;
  double rect;
  double recta;
  _QWORD v209[8];
  CGSize v210;
  char v211;
  CGSize size;
  _QWORD v213[10];
  BOOL v214;
  _QWORD v215[10];
  BOOL v216;
  uint64_t v217;
  CGRect *v218;
  uint64_t v219;
  void *v220;
  double v221;
  uint64_t v222;
  double v223;
  double v224;
  uint64_t v225;
  CGRect *v226;
  uint64_t v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  rect2 = a3.origin.x;
  v6 = -[CKNavigationBarCanvasView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v7 = -[CKNavigationBarCanvasView _canShowAvatarView](self, "_canShowAvatarView");
  -[CKNavigationBarCanvasView leftItemView](self, "leftItemView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v11 = v10;
  v13 = v12;
  rect = height;
  objc_msgSend(v9, "sizeThatFits:", width, height);
  v15 = fmax(v13, v14);
  v198 = v16;
  if (CKMainScreenScale_once_83 != -1)
    dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
  v17 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
    v17 = 1.0;
  v18 = round(v15 * v17) / v17;
  v19 = fmax(v11, 44.0);
  -[CKNavigationBarCanvasView safeAreaInsets](self, "safeAreaInsets");
  v21 = v20;
  v23 = v22;
  -[CKNavigationBarCanvasView systemMinimumLayoutMarginsFromDelegate](self, "systemMinimumLayoutMarginsFromDelegate");
  v25 = v24;
  v27 = v26;
  -[CKNavigationBarCanvasView leftItemView](self, "leftItemView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v201 = width;
  v191 = v27;
  v192 = v23;
  v30 = -0.0;
  if ((v6 & 1) != 0)
  {
    if ((isKindOfClass & 1) == 0)
      v30 = v27;
    v31 = v23 + v30;
    v233.origin.y = y;
    v233.origin.x = rect2;
    v233.size.width = width;
    v233.size.height = rect;
    v32 = CGRectGetWidth(v233) - (v19 + v31);
  }
  else
  {
    if ((isKindOfClass & 1) == 0)
      v30 = v25;
    v32 = v21 + v30;
  }
  v194 = v32;
  v33 = fmax(v18, 44.0);
  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "shouldConfigureForJunkModal");

  v36 = 17.0;
  if ((v35 & 1) == 0)
  {
    -[CKNavigationBarCanvasView _calculateYOriginForButtonWithHeight:](self, "_calculateYOriginForButtonWithHeight:", v33);
    v36 = v37;
  }
  -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v39 = objc_opt_isKindOfClass();

  if ((v39 & 1) != 0)
  {
    -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "buttonStyle") != 0;

  }
  else
  {
    v41 = 0;
  }
  v189 = v21;
  v190 = v25;
  -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = objc_opt_isKindOfClass();

  v44 = v33;
  if ((v39 & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "tuConversationBalloonJoinButtonHeight");
    v44 = v46;

  }
  v47 = 0.0;
  if (((v39 & ~v41 | v43) & 1) != 0)
  {
    -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "frame");
    v49 = CGRectGetWidth(v234);
    objc_msgSend(v48, "imageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "frame");
    v47 = (v49 - CGRectGetWidth(v235)) * 0.5;

  }
  v51 = fmax(v198, 44.0);
  if ((v6 & 1) != 0)
  {
    v52 = v21 + v25 - v47;
  }
  else
  {
    v236.origin.y = y;
    v236.origin.x = rect2;
    v236.size.width = v201;
    v236.size.height = rect;
    v52 = CGRectGetWidth(v236) - (v192 + v51 + v191 - v47);
  }
  -[CKNavigationBarCanvasView _calculateYOriginForButtonWithHeight:](self, "_calculateYOriginForButtonWithHeight:", v44);
  v225 = 0;
  v226 = (CGRect *)&v225;
  v227 = 0x4010000000;
  v228 = &unk_18E8EEE6F;
  v229 = v194;
  v230 = v36;
  v231 = v19;
  v232 = v33;
  v217 = 0;
  v218 = (CGRect *)&v217;
  v219 = 0x4010000000;
  v220 = &unk_18E8EEE6F;
  v221 = v52;
  v222 = v53;
  v223 = v51;
  v224 = v44;
  -[CKNavigationBarCanvasView subtitleView](self, "subtitleView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sizeThatFits:", v201, rect);
  v199 = v56;
  v200 = v55;

  -[CKNavigationBarCanvasView subtitleView](self, "subtitleView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "frame");
  v59 = v58;
  v61 = v60;

  -[CKNavigationBarCanvasView titleView](self, "titleView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "frame");
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;

  if (v7)
  {
    -[CKNavigationBarCanvasView delegate](self, "delegate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "shouldUseMinimumSafeAreas");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:", v72);
    v75 = v74;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationBarCanvasView delegate](self, "delegate");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "defaultNavigationBarHeightValueWantsMinimumSafeAreas:", objc_msgSend(v77, "shouldUseMinimumSafeAreas"));
    v79 = v78;

  }
  else
  {
    v237.origin.x = v64;
    v237.origin.y = v66;
    v237.size.width = v68;
    v237.size.height = v70;
    v80 = CGRectGetHeight(v237);
    v238.origin.x = v59;
    v238.origin.y = v61;
    v238.size.height = v199;
    v238.size.width = v200;
    v81 = CGRectGetHeight(v238);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "defaultNavigationBarNoContactPhotoCollapsedHeightValue");
    v79 = v82;
    v75 = (rect - v80 - v81) * 0.5;
  }

  if (!-[CKNavigationBarCanvasView keepTitleViewCentered](self, "keepTitleViewCentered"))
  {
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = objc_opt_isKindOfClass();

    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v88 & 1) != 0)
    {
      objc_msgSend(v89, "collectionViewLayout");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "collectionViewContentSize");
      v92 = v91;
      v94 = v93;

    }
    else
    {
      objc_msgSend(v89, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v92 = v109;
      v94 = v110;
    }

    if (v94 > 0.0)
      v79 = v94;
    -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    if (v111)
    {
      v112 = v218;
    }
    else
    {
      -[CKNavigationBarCanvasView leftItemView](self, "leftItemView");
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      v128 = y;
      v129 = rect;
      if (!v127)
        goto LABEL_60;
      v112 = v226;
    }
    v128 = v112[1].origin.y;
    v129 = v112[1].size.height;
LABEL_60:
    -[CKNavigationBarCanvasView titleView](self, "titleView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v131 = objc_opt_isKindOfClass();
    v126 = v128 + floor((v129 - v79) * 0.5);

    if ((v131 & 1) != 0)
    {
      -[CKNavigationBarCanvasView titleView](self, "titleView");
      v132 = v201;
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "_baselineOffsetFromBottom");
      v126 = v126 + v134 * 0.5;

    }
    else
    {
      v132 = v201;
    }
    v125 = rect2 + floor((v132 - v92) * 0.5);
    v240.origin.x = v125;
    v240.origin.y = v126;
    v240.size.width = v92;
    v240.size.height = v79;
    if (CGRectIntersectsRect(v240, v218[1]))
    {
      x = v218[1].origin.x;
      v136 = v218[1].origin.y;
      v137 = v218[1].size.width;
      v138 = v218[1].size.height;
      if (v6)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&x);
LABEL_69:
        v141 = -14.0;
LABEL_70:
        v243.origin.x = MaxX + v141;
        v196 = v126;
        v243.origin.y = v126;
        v243.size.width = v92;
        v243.size.height = v79;
        v142 = CGRectGetWidth(v243);
        v143 = v79;
        v244.origin.y = y;
        v244.origin.x = rect2;
        v244.size.width = v132;
        v244.size.height = rect;
        v144 = CGRectGetWidth(v244);
        if ((v6 & 1) != 0)
        {
          v145 = CGRectGetMaxX(v218[1]);
          v245.origin.y = y;
          v245.origin.x = rect2;
          v245.size.width = v132;
          v245.size.height = rect;
          v146 = CGRectGetWidth(v245);
          v147 = v226[1].origin.x;
          v148 = v226[1].origin.y;
          v149 = v226[1].size.width;
          v150 = v226[1].size.height;
        }
        else
        {
          v145 = CGRectGetMaxX(v226[1]);
          v246.origin.y = y;
          v246.origin.x = rect2;
          v246.size.width = v132;
          v246.size.height = rect;
          v146 = CGRectGetWidth(v246);
          v147 = v218[1].origin.x;
          v148 = v218[1].origin.y;
          v149 = v218[1].size.width;
          v150 = v218[1].size.height;
        }
        v151 = v144 - (v145 + v146 - CGRectGetMinX(*(CGRect *)&v147)) + -16.0;
        if (v151 >= v142)
          v92 = v142;
        else
          v92 = v151;
        v125 = rect2 + floor((v132 - v92) * 0.5);
        v79 = v143;
        v126 = v196;
        goto LABEL_77;
      }
    }
    else
    {
      v241.origin.x = v125;
      v241.origin.y = v126;
      v241.size.width = v92;
      v241.size.height = v79;
      if (!CGRectIntersectsRect(v241, v226[1]))
        goto LABEL_77;
      x = v226[1].origin.x;
      v136 = v226[1].origin.y;
      v137 = v226[1].size.width;
      v138 = v226[1].size.height;
      if (!v6)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&x);
        v141 = 14.0;
        goto LABEL_70;
      }
    }
    MinX = CGRectGetMinX(*(CGRect *)&x);
    v242.origin.x = v125;
    v242.origin.y = v126;
    v242.size.width = v92;
    v242.size.height = v79;
    MaxX = MinX - CGRectGetWidth(v242);
    goto LABEL_69;
  }
  v195 = v75;
  if ((v6 & 1) != 0)
  {
    v83 = CGRectGetWidth(v218[1]);
    v84 = CGRectGetWidth(v226[1]);
    v85 = v192 + v190;
    v86 = v192 + v191 + v83;
  }
  else
  {
    v95 = CGRectGetWidth(v226[1]);
    v96 = CGRectGetWidth(v218[1]);
    v86 = v189 + v190 + v95;
    v84 = v191 + v96;
    v85 = v192;
  }
  v97 = v85 + v84;
  v98 = MEMORY[0x1E0C809B0];
  if (v86 >= v97)
    v97 = v86;
  v99 = v97 + v97;
  v215[0] = MEMORY[0x1E0C809B0];
  v215[1] = 3221225472;
  v215[2] = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke;
  v215[3] = &unk_1E27582C8;
  v216 = v7;
  *(double *)&v215[5] = rect2;
  *(CGFloat *)&v215[6] = y;
  *(double *)&v215[7] = v201;
  *(double *)&v215[8] = rect;
  *(double *)&v215[9] = v97 + v97;
  v215[4] = self;
  v100 = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke((uint64_t)v215);
  -[CKNavigationBarCanvasView titleView](self, "titleView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v102 = objc_opt_isKindOfClass();

  -[CKNavigationBarCanvasView titleView](self, "titleView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v102 & 1) != 0)
  {
    objc_msgSend(v103, "collectionViewLayout");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "collectionViewContentSize");
    v106 = v105;
    v108 = v107;

  }
  else
  {
    objc_msgSend(v103, "intrinsicContentSize");
    v106 = v113;
    v108 = v114;
  }

  v115 = *MEMORY[0x1E0C9D820];
  if (v106 == *MEMORY[0x1E0C9D820])
  {
    v116 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v108 == v116)
    {
      -[CKNavigationBarCanvasView titleView](self, "titleView");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "sizeThatFits:", v115, v116);
      v108 = v118;

    }
  }
  if (v108 <= 0.0)
    v119 = v79;
  else
    v119 = v108;
  if (CKMainScreenScale_once_83 != -1)
    dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
    v120 = 1.0;
  else
    v120 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
  v239.origin.y = y;
  v239.origin.x = rect2;
  v239.size.width = v201;
  v239.size.height = rect;
  MidX = CGRectGetMidX(v239);
  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v122, "shouldConfigureForJunkModal");

  v213[0] = v98;
  v213[1] = 3221225472;
  v213[2] = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_2;
  v213[3] = &unk_1E27582C8;
  v214 = v7;
  *(double *)&v213[5] = rect2;
  *(CGFloat *)&v213[6] = y;
  *(double *)&v213[7] = v201;
  *(double *)&v213[8] = rect;
  *(double *)&v213[9] = v99;
  v213[4] = self;
  __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_2((uint64_t)v213);
  v200 = v124;
  v92 = ceil(v100 * v120) / v120;
  v79 = ceil(v119 * v120) / v120;
  v125 = MidX + v92 * -0.5;
  if (v123)
    v126 = 8.0;
  else
    v126 = v195;
LABEL_77:
  statusIndicatorImageView = self->_statusIndicatorImageView;
  v202 = v79;
  if (statusIndicatorImageView)
  {
    -[UIImageView image](statusIndicatorImageView, "image");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "size");

    v154 = self->_statusIndicatorType & 0xFFFFFFFFFFFFFFFELL;
    v155 = 17.0;
    if (v154 == 2)
      v156 = 12.0;
    else
      v156 = 17.0;
    if (v154 == 2)
      v155 = 19.0;
    rect2a = v155;
    recta = v156;
    objc_opt_class();
    v157 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v158 = self->_titleView;
      v159 = v158;
      if (v158)
      {
        -[UIView _firstLineBaseline](v158, "_firstLineBaseline");
        v157 = v160;
      }
    }
    else
    {
      v159 = 0;
    }
    v166 = recta;
    v167 = v126 + 0.5 - recta + v157;
    v204 = v167;
    v197 = v126;
    if ((v6 & 1) != 0)
    {
      v247.origin.x = v125;
      v163 = v125;
      v247.origin.y = v126;
      v247.size.width = v92;
      v247.size.height = v79;
      v161 = CGRectGetMaxX(v247) + 2.0;
      v168 = v92;
    }
    else
    {
      v169 = rect2a;
      v170 = v125 + -2.0 - rect2a;
      v248.origin.x = v226[1].origin.x;
      v171 = v226[1].origin.y;
      v172 = v226[1].size.height;
      v173 = v226[1].size.width + 2.0;
      v193 = v248.origin.x;
      v248.origin.y = v171;
      v248.size.width = v173;
      v248.size.height = v172;
      v161 = v170;
      v163 = v125;
      v168 = v92;
      if (CGRectIntersectsRect(v248, *(CGRect *)(&v167 - 1)))
      {
        v249.origin.x = v193;
        v249.origin.y = v171;
        v249.size.width = v173;
        v249.size.height = v172;
        v250.origin.x = CGRectGetMaxX(v249);
        v161 = v250.origin.x;
        v250.origin.y = v204;
        v250.size.width = rect2a;
        v250.size.height = recta;
        v174 = CGRectGetMaxX(v250) + 2.0 - v125;
        v163 = v125 + v174;
        v168 = v92 - v174;
      }
    }

    v162 = v168;
    v126 = v197;
    if (v6)
      goto LABEL_94;
  }
  else
  {
    v161 = *MEMORY[0x1E0C9D648];
    v204 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    rect2a = *(double *)(MEMORY[0x1E0C9D648] + 16);
    recta = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v162 = v92;
    v163 = v125;
    if (v6)
    {
LABEL_94:
      -[CKNavigationBarCanvasView leftItemView](self, "leftItemView");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = v226;
      goto LABEL_95;
    }
  }
  -[CKNavigationBarCanvasView rightItemView](self, "rightItemView");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v218;
LABEL_95:
  v175 = v165[1].origin.x;
  size = v165[1].size;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[CKNavigationBarCanvasView titleView](self, "titleView");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v177 = objc_opt_isKindOfClass();

      if ((v177 & 1) != 0)
      {
        -[CKNavigationBarCanvasView titleView](self, "titleView");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "titleLabel");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setNeedsLayout");
        objc_msgSend(v164, "layoutIfNeeded");
        objc_msgSend(v179, "text");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = objc_msgSend(v180, "length");

        if (v181)
        {
          objc_msgSend(v178, "_firstLineBaseline");
          v183 = v182;
          objc_msgSend(v179, "_lastLineBaselineFrameOriginY");
          v185 = v126 + v183;
        }
        else
        {
          objc_msgSend(v164, "bounds");
          v185 = v202 * 0.5 + v126;
          v184 = v186 * 0.5;
        }
        v209[0] = MEMORY[0x1E0C809B0];
        v209[1] = 3221225472;
        v209[2] = __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_3;
        v209[3] = &unk_1E27582F0;
        v211 = v6;
        *(CGFloat *)&v209[6] = v175;
        *(double *)&v209[7] = v185 - v184;
        v210 = size;
        v209[4] = &v225;
        v209[5] = &v217;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v209);

      }
    }
  }
  +[CKNavBarCanvasSubviewLayout layoutWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:](CKNavBarCanvasSubviewLayout, "layoutWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:", v163, v126, v162, v202, v92 * 0.5 + v125 - v200 * 0.5, v202 + v126, v200, v199, *(_QWORD *)&v226[1].origin.x, *(_QWORD *)&v226[1].origin.y, *(_QWORD *)&v226[1].size.width, *(_QWORD *)&v226[1].size.height, *(_QWORD *)&v218[1].origin.x, *(_QWORD *)&v218[1].origin.y, *(_QWORD *)&v218[1].size.width, *(_QWORD *)&v218[1].size.height, *(_QWORD *)&v161,
    *(_QWORD *)&v204,
    *(_QWORD *)&rect2a,
    *(_QWORD *)&recta);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v217, 8);
  _Block_object_dispose(&v225, 8);

  return v187;
}

double __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke(uint64_t a1)
{
  int v2;
  double Width;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  v2 = *(unsigned __int8 *)(a1 + 80);
  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  v4 = *(double *)(a1 + 72);
  if (v2)
    return Width - v4;
  v6 = Width - (v4 + 14.0 + 14.0);
  objc_msgSend(*(id *)(a1 + 32), "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v6, v6);
  v5 = v8;

  return v5;
}

void __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_2(uint64_t a1)
{
  int v2;
  double Width;
  double v4;
  void *v5;

  v2 = *(unsigned __int8 *)(a1 + 80);
  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  if (!v2)
  {
    v4 = Width - (*(double *)(a1 + 72) + 14.0 + 14.0);
    objc_msgSend(*(id *)(a1 + 32), "subtitleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeThatFits:", v4, v4);

  }
}

float64x2_t __54__CKNavigationBarCanvasView__subviewLayoutWithBounds___block_invoke_3(uint64_t a1)
{
  float64x2_t v2;
  float64x2_t v3;
  uint64_t v4;
  uint64_t v5;
  float64x2_t v6;
  float64x2_t *v7;
  float64x2_t result;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;

  v3 = *(float64x2_t *)(a1 + 48);
  v2 = *(float64x2_t *)(a1 + 64);
  if (*(_BYTE *)(a1 + 80))
  {
    if (CKMainScreenScale_once_83 != -1)
    {
      v9 = *(float64x2_t *)(a1 + 48);
      v11 = *(float64x2_t *)(a1 + 64);
      dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
      v3 = v9;
      v2 = v11;
    }
    *(double *)&v4 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_83 != 0.0)
      v4 = CKMainScreenScale_sMainScreenScale_83;
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    if (CKMainScreenScale_once_83 != -1)
    {
      v10 = *(float64x2_t *)(a1 + 48);
      v12 = *(float64x2_t *)(a1 + 64);
      dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
      v3 = v10;
      v2 = v12;
    }
    *(double *)&v4 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_83 != 0.0)
      v4 = CKMainScreenScale_sMainScreenScale_83;
    v5 = *(_QWORD *)(a1 + 40);
  }
  v6 = (float64x2_t)vdupq_lane_s64(v4, 0);
  v7 = *(float64x2_t **)(v5 + 8);
  v7[2] = vdivq_f64(vrndaq_f64(vmulq_n_f64(v3, *(double *)&v4)), v6);
  result = vdivq_f64(vrndaq_f64(vmulq_f64(v2, v6)), v6);
  v7[3] = result;
  return result;
}

- (CGRect)_calculateFrameForButton:(id)a3 shouldOffset:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  double MidX;
  double v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unsigned __int8 v43;
  double v44;
  double x;
  double y;
  double width;
  double height;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldUseMinimumSafeAreas");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:", v8);
  v11 = v10 + 2.0;

  if (-[CKNavigationBarCanvasView _canShowAvatarView](self, "_canShowAvatarView"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "avatarSize");
    v14 = v11 + v13 + 16.0;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationBarHeaderButtonVerticalOffset");
    v17 = v14 + v16;

  }
  else
  {
    v17 = v11 + 24.0 + 22.0;
  }
  if (CKPixelWidth_once_15 != -1)
    dispatch_once(&CKPixelWidth_once_15, &__block_literal_global_389_0);
  v18 = *(double *)&CKPixelWidth_sPixel_15;
  v19 = *(double *)&CKPixelWidth_sPixel_15;
  v20 = *(double *)&CKPixelWidth_sPixel_15;
  -[CKNavigationBarCanvasView buttonsToDisplay](self, "buttonsToDisplay");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  -[CKNavigationBarCanvasView bounds](self, "bounds");
  MidX = CGRectGetMidX(v54);
  if (CKMainScreenScale_once_83 != -1)
    dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
  v24 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
  -[CKNavigationBarCanvasView buttonsToDisplay](self, "buttonsToDisplay");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", v6);

  if (v26)
  {
    v27 = v19 + 22.0 + 16.0 + 20.0;
    v28 = 1.0;
    if (v24 != 0.0)
      v28 = v24;
    v29 = round((MidX + (v20 + 72.0) * (double)v22 * -0.5) * v28) / v28;
    v30 = round(v17 * v28) / v28;
    v31 = v18 + 72.0;
    -[CKNavigationBarCanvasView buttonsToDisplay](self, "buttonsToDisplay");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "indexOfObject:", v6);

    v34 = v29 + (double)v33 * v31;
    if (CKMainScreenScale_once_83 != -1)
      dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
    v35 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
      v35 = 1.0;
    v36 = round(v34 * v35) / v35;
    v37 = round(v30 * v35) / v35;
    v38 = round(v31 * v35) / v35;
    v39 = round(v27 * v35) / v35;
    if (v4)
    {
      -[CKNavigationBarCanvasView buttonsToDisplay](self, "buttonsToDisplay");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      -[CKNavigationBarCanvasView buttonsToDisplay](self, "buttonsToDisplay");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      v44 = 10.0;
      if (v33 >= v41 >> 1)
      {
        if ((v43 & (v33 == v41 >> 1)) != 0)
          v44 = 0.0;
        else
          v44 = -10.0;
      }
      v55.origin.x = v36;
      v55.origin.y = v37;
      v55.size.width = v38;
      v55.size.height = v39;
      v56 = CGRectOffset(v55, v44, -10.0);
      x = v56.origin.x;
      y = v56.origin.y;
      width = v56.size.width;
      height = v56.size.height;
      if (CKMainScreenScale_once_83 != -1)
        dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
      v49 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
        v49 = 1.0;
      v36 = round(x * v49) / v49;
      v37 = round(y * v49) / v49;
      v38 = round(width * v49) / v49;
      v39 = round(height * v49) / v49;
    }
  }
  else
  {
    v36 = *MEMORY[0x1E0C9D648];
    v37 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v50 = v36;
  v51 = v37;
  v52 = v38;
  v53 = v39;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (double)_calculateYOriginForButtonWithHeight:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  -[CKNavigationBarCanvasView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBarFrame");
  v9 = v8;

  v10 = v9 > 0.0 && -[CKNavigationBarCanvasView _canShowAvatarView](self, "_canShowAvatarView");
  v11 = a3 * 0.5;
  -[CKNavigationBarCanvasView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldUseMinimumSafeAreas");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBarTitleViewVerticalOffsetWantsMinimumSafeAreas:", v13);
  v16 = v15;

  if (v10
    && !-[CKNavigationBarCanvasView enforceLeftItemViewsAlignmentToCenter](self, "enforceLeftItemViewsAlignmentToCenter"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationBarLeftItemVerticalCenterOffset");
    v21 = v20 - v11;
    if (CKMainScreenScale_once_83 != -1)
      dispatch_once(&CKMainScreenScale_once_83, &__block_literal_global_387_0);
    v22 = *(double *)&CKMainScreenScale_sMainScreenScale_83;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_83 == 0.0)
      v22 = 1.0;
    v18 = round(v21 * v22) / v22;

  }
  else
  {
    -[CKNavigationBarCanvasView bounds](self, "bounds");
    v18 = v17 * 0.5 - v11;
  }
  return v16 + v18;
}

- (CKNavigationBarCanvasViewDelegate)delegate
{
  return (CKNavigationBarCanvasViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)titleView
{
  return self->_titleView;
}

- (UIView)subtitleView
{
  return self->_subtitleView;
}

- (UIView)leftItemView
{
  return self->_leftItemView;
}

- (UIView)rightItemView
{
  return self->_rightItemView;
}

- (BOOL)enforceLeftItemViewsAlignmentToCenter
{
  return self->_enforceLeftItemViewsAlignmentToCenter;
}

- (void)setEnforceLeftItemViewsAlignmentToCenter:(BOOL)a3
{
  self->_enforceLeftItemViewsAlignmentToCenter = a3;
}

- (BOOL)keepTitleViewCentered
{
  return self->_keepTitleViewCentered;
}

- (void)setKeepTitleViewCentered:(BOOL)a3
{
  self->_keepTitleViewCentered = a3;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (BOOL)expanseEnabled
{
  return self->_expanseEnabled;
}

- (void)setExpanseEnabled:(BOOL)a3
{
  self->_expanseEnabled = a3;
}

- (BOOL)shouldAnimateAvatarLayoutChanges
{
  return self->_shouldAnimateAvatarLayoutChanges;
}

- (void)setShouldAnimateAvatarLayoutChanges:(BOOL)a3
{
  self->_shouldAnimateAvatarLayoutChanges = a3;
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (BOOL)multiwayAudioButtonHidden
{
  return self->_multiwayAudioButtonHidden;
}

- (int64_t)statusIndicatorType
{
  return self->_statusIndicatorType;
}

- (int64_t)joinButtonStyle
{
  return self->_joinButtonStyle;
}

- (CKNavigationButtonView)buttonViewFaceTimeAudio
{
  return self->_buttonViewFaceTimeAudio;
}

- (void)setButtonViewFaceTimeAudio:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewFaceTimeAudio, a3);
}

- (CKNavigationButtonView)buttonViewFaceTimeVideo
{
  return self->_buttonViewFaceTimeVideo;
}

- (void)setButtonViewFaceTimeVideo:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewFaceTimeVideo, a3);
}

- (CKNavigationButtonView)buttonViewInfo
{
  return self->_buttonViewInfo;
}

- (void)setButtonViewInfo:(id)a3
{
  objc_storeStrong((id *)&self->_buttonViewInfo, a3);
}

- (UIMenu)titleViewContextMenu
{
  return self->_titleViewContextMenu;
}

- (NSMutableArray)buttonsToDisplay
{
  return self->_buttonsToDisplay;
}

- (void)setButtonsToDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsToDisplay, a3);
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, a3);
}

- (BOOL)isAnimatingAvatars
{
  return self->_isAnimatingAvatars;
}

- (void)setIsAnimatingAvatars:(BOOL)a3
{
  self->_isAnimatingAvatars = a3;
}

- (BOOL)ignoreNextWidthChange
{
  return self->_ignoreNextWidthChange;
}

- (void)setIgnoreNextWidthChange:(BOOL)a3
{
  self->_ignoreNextWidthChange = a3;
}

- (UIButton)invisibleContextMenuButton
{
  return self->_invisibleContextMenuButton;
}

- (void)setInvisibleContextMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_invisibleContextMenuButton, a3);
}

- (UIContextMenuInteraction)secondaryTitleInteraction
{
  return self->_secondaryTitleInteraction;
}

- (void)setSecondaryTitleInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleInteraction, a3);
}

- (UIColor)titleDefaultBackgroundColor
{
  return self->_titleDefaultBackgroundColor;
}

- (void)setTitleDefaultBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleDefaultBackgroundColor, a3);
}

- (double)lastLayoutPreferredHeight
{
  return self->_lastLayoutPreferredHeight;
}

- (void)setLastLayoutPreferredHeight:(double)a3
{
  self->_lastLayoutPreferredHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDefaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_secondaryTitleInteraction, 0);
  objc_storeStrong((id *)&self->_invisibleContextMenuButton, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_buttonsToDisplay, 0);
  objc_storeStrong((id *)&self->_titleViewContextMenu, 0);
  objc_storeStrong((id *)&self->_buttonViewInfo, 0);
  objc_storeStrong((id *)&self->_buttonViewFaceTimeVideo, 0);
  objc_storeStrong((id *)&self->_buttonViewFaceTimeAudio, 0);
  objc_storeStrong((id *)&self->_rightItemView, 0);
  objc_storeStrong((id *)&self->_leftItemView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
