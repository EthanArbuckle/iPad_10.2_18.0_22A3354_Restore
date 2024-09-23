@implementation CKBalloonView

- (char)color
{
  return self->_color;
}

- (CKBalloonView)initWithFrame:(CGRect)a3
{
  CKBalloonView *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  CKManualUpdater *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

    if (v5)
    {
      -[CKBalloonView configureGestureRecognizers](v3, "configureGestureRecognizers");
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_tapGestureRecognized_);
      objc_msgSend(v6, "setDelegate:", v3);
      objc_msgSend(v6, "setCancelsTouchesInView:", 0);
      +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPrinting");

      if ((v8 & 1) == 0)
        -[CKBalloonView addGestureRecognizer:](v3, "addGestureRecognizer:", v6);
      -[CKBalloonView setTapGestureRecognizer:](v3, "setTapGestureRecognizer:", v6);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_doubleTapGestureRecognized_);
      objc_msgSend(v9, "setCancelsTouchesInView:", 0);
      objc_msgSend(v9, "setNumberOfTapsRequired:", 2);
      objc_msgSend(v6, "requireGestureRecognizerToFail:", v9);
      +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPrinting");

      if ((v11 & 1) == 0)
        -[CKBalloonView addGestureRecognizer:](v3, "addGestureRecognizer:", v9);
      -[CKBalloonView setDoubleTapGestureRecognizer:](v3, "setDoubleTapGestureRecognizer:", v9);
      if (CKIsRunningInMessagesNotificationExtension())
        v12 = 1;
      else
        v12 = CKIsRunningInMessagesNotificationViewService() != 0;
      if (!IMEnableTranscriptClickyOrb()
        || (CKIsRunningInMacCatalyst() ? (v13 = 1) : (v13 = v12), v13 == 1))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v3, sel_longPressGestureRecognized_);
        objc_msgSend(v14, "setMinimumPressDuration:", 0.5);
        objc_msgSend(v14, "setDelaysTouchesBegan:", 1);
        objc_msgSend(v14, "_setRequiresQuietImpulse:", 1);
        objc_msgSend(v6, "requireGestureRecognizerToFail:", v14);
        +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isPrinting");

        if ((v16 & 1) == 0)
          -[CKBalloonView addGestureRecognizer:](v3, "addGestureRecognizer:", v14);
        -[CKBalloonView setLongPressGestureRecognizer:](v3, "setLongPressGestureRecognizer:", v14);

      }
      -[CKBalloonView updateGestureEnablement](v3, "updateGestureEnablement");

    }
    v17 = -[CKManualUpdater initWithTarget:action:]([CKManualUpdater alloc], "initWithTarget:action:", v3, sel_prepareForDisplay);
    -[CKBalloonView setDisplayUpdater:](v3, "setDisplayUpdater:", v17);
    -[CKBalloonView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[CKBalloonView setOpaque:](v3, "setOpaque:", 0);
    -[CKBalloonView setBalloonTailShape:](v3, "setBalloonTailShape:", 1);
    -[CKBalloonView setHasTail:](v3, "setHasTail:", 1);
    -[CKBalloonView setCanUseOpaqueMask:](v3, "setCanUseOpaqueMask:", 1);
    -[CKBalloonView setBalloonStyle:](v3, "setBalloonStyle:", 0);
    -[CKBalloonView setBalloonCorners:](v3, "setBalloonCorners:", -1);
    -[CKBalloonView setNeedsPrepareForDisplay](v3, "setNeedsPrepareForDisplay");

  }
  return v3;
}

- (void)setNeedsPrepareForDisplay
{
  id v2;

  -[CKBalloonView displayUpdater](self, "displayUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (CKManualUpdater)displayUpdater
{
  return self->_displayUpdater;
}

- (void)updateGestureEnablement
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableTranscriptInteractions") ^ 1;
  -[CKBalloonView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disableTranscriptInteractions") ^ 1;
  -[CKBalloonView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "disableTranscriptInteractions") ^ 1;
  -[CKBalloonView tapGestureRecognizer](self, "tapGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v9);

}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (void)setDisplayUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_displayUpdater, a3);
}

- (void)setBalloonTailShape:(char)a3
{
  self->_balloonTailShape = a3;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBalloonView;
  -[CKBalloonImageView prepareForReuse](&v8, sel_prepareForReuse);
  -[CKBalloonView setDelegate:](self, "setDelegate:", 0);
  -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", 0);
  -[CKBalloonView setCanUseOpaqueMask:](self, "setCanUseOpaqueMask:", 1);
  -[CKBalloonView setSelected:withSelectionState:](self, "setSelected:withSelectionState:", 0, 0);
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", -1);
  -[CKBalloonView setAlpha:](self, "setAlpha:", 1.0);
  -[CKBalloonView setHidden:](self, "setHidden:", 0);
  -[CKBalloonView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[CKBalloonView setInvisibleInkEffectEnabled:](self, "setInvisibleInkEffectEnabled:", 0);
  -[CKBalloonView setInvisibleInkEffectPaused:](self, "setInvisibleInkEffectPaused:", 0);
  -[CKBalloonView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.5);

  -[CKBalloonView filters](self, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[CKBalloonView clearFilters](self, "clearFilters");
  -[CKBalloonView setInteractions:](self, "setInteractions:", MEMORY[0x1E0C9AA60]);
  -[CKBalloonView setDragInteraction:](self, "setDragInteraction:", 0);
  -[CKBalloonView stickerEffectView](self, "stickerEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CKBalloonView setEffectView:](self, "setEffectView:", 0);
  -[CKBalloonView dropDownMenuButton](self, "dropDownMenuButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[CKBalloonView setDropDownMenuButton:](self, "setDropDownMenuButton:", 0);
}

- (void)setBalloonStyle:(char)a3
{
  if (self->_balloonStyle != a3)
  {
    self->_balloonStyle = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setBalloonCorners:(unint64_t)a3
{
  if (self->_balloonCorners != a3)
  {
    self->_balloonCorners = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (BOOL)canUseOpaqueMask
{
  return self->_canUseOpaqueMask;
}

- (void)setInvisibleInkEffectPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_invisibleInkEffectPaused != a3)
  {
    v3 = a3;
    self->_invisibleInkEffectPaused = a3;
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaused:", v3);

    -[CKBalloonView updateRasterizationForInvisibleInkEffect](self, "updateRasterizationForInvisibleInkEffect");
  }
}

- (void)setInvisibleInkEffectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CKInvisibleInkEffectController *v6;
  id v7;

  v3 = a3;
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {
    v6 = -[CKInvisibleInkEffectController initWithHostView:]([CKInvisibleInkEffectController alloc], "initWithHostView:", self);
    -[CKInvisibleInkEffectController setPaused:](v6, "setPaused:", -[CKBalloonView invisibleInkEffectPaused](self, "invisibleInkEffectPaused"));
    -[CKBalloonView setInvisibleInkEffectController:](self, "setInvisibleInkEffectController:", v6);
    v5 = v6;
  }
  v7 = v5;
  if (objc_msgSend(v5, "isEnabled") != v3)
  {
    objc_msgSend(v7, "setEnabled:", v3);
    -[CKBalloonView updateRasterizationForInvisibleInkEffect](self, "updateRasterizationForInvisibleInkEffect");
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](self, "prepareForDisplayIfNeeded");
  }

}

- (void)setEffectView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CKBalloonView stickerEffectView](self, "stickerEffectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    -[CKBalloonView stickerEffectView](self, "stickerEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[CKBalloonView setStickerEffectView:](self, "setStickerEffectView:", v10);
    -[CKBalloonView stickerEffectView](self, "stickerEffectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKBalloonImageView invisibleInkEffectImage](self, "invisibleInkEffectImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKBalloonView stickerEffectView](self, "stickerEffectView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[CKBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);
      else
        -[CKBalloonView addSubview:](self, "addSubview:", v9);

    }
    -[CKBalloonImageView setImageHidden:](self, "setImageHidden:", v7 != 0);
    -[CKBalloonView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (VKCStickerEffectView)stickerEffectView
{
  return self->_stickerEffectView;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKInvisibleInkEffectController)invisibleInkEffectController
{
  return self->_invisibleInkEffectController;
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  self->_canUseOpaqueMask = a3;
}

- (void)setHasOverlay:(BOOL)a3
{
  -[CKBalloonView setHasOverlay:autoDismiss:](self, "setHasOverlay:autoDismiss:", a3, 0);
}

- (void)setHasOverlay:(BOOL)a3 autoDismiss:(BOOL)a4
{
  _BOOL4 v5;
  UIImageView *v6;
  UIImageView *overlay;
  void *v8;

  if (self->_hasOverlay != a3)
  {
    self->_hasOverlay = a3;
    if (a3)
    {
      v5 = a4;
      -[CKBalloonView createOverlayImageView](self, "createOverlayImageView");
      v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      overlay = self->_overlay;
      self->_overlay = v6;

      -[CKBalloonView overlay](self, "overlay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonView addOverlaySubview:](self, "addOverlaySubview:", v8);

      -[CKBalloonView _showOverlayAnimated](self, "_showOverlayAnimated");
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__dismissOverlay, 0);
        -[CKBalloonView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dismissOverlay, 0, 2.0);
      }
    }
    else
    {
      -[CKBalloonView _hideOverlayAnimated](self, "_hideOverlayAnimated", a3, a4);
    }
    -[CKBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHasTail:(BOOL)a3
{
  self->_hasTail = a3;
}

- (BOOL)hasTail
{
  return self->_hasTail;
}

- (void)setColor:(char)a3
{
  self->_color = a3;
}

- (void)setStrokeColor:(CKColor_t)a3
{
  self->_strokeColor = a3;
}

- (char)orientation
{
  return self->_orientation;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[UIImageView removeFromSuperview](self->_overlay, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)CKBalloonView;
  -[CKBalloonView dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  char v11[80];

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  NSStringFromBalloonDescriptor(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonImageView image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CKBalloonView;
  -[CKBalloonView description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKBalloonView balloon:%@ delegate:%@ [UIImageView image:%@ [%@]]]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)configureGestureRecognizers
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableTranscriptInteractions");

  if ((v4 & 1) == 0)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_doubleTapGestureRecognized_);
    objc_msgSend(v9, "setCancelsTouchesInView:", 0);
    objc_msgSend(v9, "setNumberOfTapsRequired:", 2);
    -[CKBalloonView setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v9);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel_longPressGestureRecognized_);
    objc_msgSend(v5, "setMinimumPressDuration:", 0.5);
    objc_msgSend(v5, "setDelaysTouchesBegan:", 1);
    objc_msgSend(v5, "_setRequiresQuietImpulse:", 1);
    objc_msgSend(v5, "setEnabled:", -[CKBalloonView shouldEnableLongPress](self, "shouldEnableLongPress"));
    -[CKBalloonView setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_tapGestureRecognized_);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setCancelsTouchesInView:", 0);
    objc_msgSend(v6, "requireGestureRecognizerToFail:", v9);
    objc_msgSend(v6, "requireGestureRecognizerToFail:", v5);
    -[CKBalloonView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v6);
    +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPrinting");

    if ((v8 & 1) == 0)
    {
      -[CKBalloonView addGestureRecognizer:](self, "addGestureRecognizer:", v6);
      -[CKBalloonView addGestureRecognizer:](self, "addGestureRecognizer:", v9);
      -[CKBalloonView addGestureRecognizer:](self, "addGestureRecognizer:", v5);
    }

  }
}

- (BOOL)shouldEnableLongPress
{
  return CKIsRunningInMacCatalyst()
      || !IMEnableTranscriptClickyOrb()
      || CKIsRunningInMessagesNotificationExtension()
      || CKIsRunningInMessagesNotificationViewService() != 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  CGSize result;

  v4 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  v11 = *MEMORY[0x1E0CEB4B0];
  v12 = v4;
  -[CKBalloonView sizeThatFits:textAlignmentInsets:](self, "sizeThatFits:textAlignmentInsets:", &v11, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:", v11, v12);
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
  -[CKBalloonView addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:](self, "addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:", a3, 0);
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3 backgroundStyle:(int64_t)a4
{
  CKChatBotActionButton *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    v6 = -[CKChatBotActionButton initWithActions:delegate:backgroundStyle:showTitle:]([CKChatBotActionButton alloc], "initWithActions:delegate:backgroundStyle:showTitle:", v8, self, a4, 1);
    -[CKBalloonView setDropDownMenuButton:](self, "setDropDownMenuButton:", v6);

    -[CKBalloonView dropDownMenuButton](self, "dropDownMenuButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView addSubview:](self, "addSubview:", v7);

  }
}

- (BOOL)hasSuggestedActionsMenu
{
  void *v2;
  BOOL v3;

  -[CKBalloonView dropDownMenuButton](self, "dropDownMenuButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  VKCStickerEffectView *stickerEffectView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBalloonView;
  -[CKBalloonImageView layoutSubviews](&v5, sel_layoutSubviews);
  -[CKBalloonView layoutDropDownMenuIfNeeded](self, "layoutDropDownMenuIfNeeded");
  -[CKBalloonView overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  stickerEffectView = self->_stickerEffectView;
  if (stickerEffectView)
  {
    -[CKBalloonView bounds](self, "bounds");
    -[VKCStickerEffectView setFrame:](stickerEffectView, "setFrame:");
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBalloonView;
  -[CKBalloonView layoutSublayersOfLayer:](&v5, sel_layoutSublayersOfLayer_, a3);
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostViewDidLayoutSubviews");

}

- (double)suggestedActionsMenuAdditionalHeightForBalloonSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 v6;
  double result;
  double v8;

  height = a3.height;
  width = a3.width;
  v6 = -[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu");
  result = 0.0;
  if (v6)
  {
    -[CKBalloonView suggestedActionsMenuHeightForSize:](self, "suggestedActionsMenuHeightForSize:", width, height);
    return v8 + 5.0 + 13.0;
  }
  return result;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBalloonView;
  -[CKBalloonImageView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)suggestedActionsMenuAdditionalHeight
{
  double v3;
  double v4;
  double result;

  -[CKBalloonView bounds](self, "bounds");
  -[CKBalloonView suggestedActionsMenuAdditionalHeightForBalloonSize:](self, "suggestedActionsMenuAdditionalHeightForBalloonSize:", v3, v4);
  return result;
}

- (double)suggestedActionsMenuHeight
{
  double v3;
  double v4;
  double result;

  -[CKBalloonView bounds](self, "bounds");
  -[CKBalloonView suggestedActionsMenuHeightForSize:](self, "suggestedActionsMenuHeightForSize:", v3, v4);
  return result;
}

- (double)suggestedActionsMenuHeightForSize:(CGSize)a3
{
  CGFloat v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3.width + -32.0;
  -[CKBalloonView dropDownMenuButton](self, "dropDownMenuButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", v3, 1.79769313e308);
  v6 = fmax(v5, 34.0);

  return v6;
}

- (void)layoutDropDownMenuIfNeeded
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    -[CKBalloonView frame](self, "frame");
    -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", v3, v4);
    v6 = v5;
    -[CKBalloonView bounds](self, "bounds");
    if (v6 == v7)
    {
      if (-[CKBalloonView orientation](self, "orientation"))
        v8 = 13.0;
      else
        v8 = 19.0;
      if (-[CKBalloonView orientation](self, "orientation") == 1)
        v9 = 19.0;
      else
        v9 = 13.0;
    }
    else
    {
      v9 = 0.0;
      v8 = 0.0;
    }
    -[CKBalloonImageView alignmentRectInsets](self, "alignmentRectInsets");
    v11 = v8 + v10;
    -[CKBalloonView bounds](self, "bounds");
    v13 = v12;
    -[CKBalloonView suggestedActionsMenuHeight](self, "suggestedActionsMenuHeight");
    v15 = v13 - v14 + -13.0;
    v16 = v6 - (v9 + v8);
    -[CKBalloonView suggestedActionsMenuHeight](self, "suggestedActionsMenuHeight");
    v18 = v17;
    -[CKBalloonView dropDownMenuButton](self, "dropDownMenuButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v11, v15, v16, v18);

    -[CKBalloonView dropDownMenuButton](self, "dropDownMenuButton");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v20);

  }
}

- (void)configureForEffectViewWithMediaObject:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v15;
    if ((objc_msgSend(v6, "needsAnimation") & 1) == 0)
    {
      objc_msgSend(v6, "stickerEffectType");
      if ((objc_msgSend(v6, "needsAnimation") & 1) == 0 && (IMStickerEffectTypeShouldAvoidEffectView() & 1) == 0)
      {
        -[CKBalloonView stickerEffectView](self, "stickerEffectView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          v8 = MTLCreateSystemDefaultDevice();
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DF0]), "initWithDevice:", v8);
          objc_msgSend(v7, "setContentMode:", 1);
          -[CKBalloonView frame](self, "frame");
          objc_msgSend(v7, "setFrame:");
          objc_msgSend(v6, "imageData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "UTIType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("heics"));

          if (v11)
          {
            objc_msgSend(v6, "imageData");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "data");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setVideoData:", v13);

          }
          else
          {
            -[CKBalloonImageView image](self, "image");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setImage:", v12);
          }

          objc_msgSend(MEMORY[0x1E0DC6DE8], "effectWithType:", objc_msgSend(v6, "stickerEffectType"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setEffect:", v14);

          -[CKBalloonView setEffectView:](self, "setEffectView:", v7);
        }

      }
    }

    v5 = v15;
  }

}

- (void)setOrientation:(char)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setTextAlignmentInsets:(UIEdgeInsets)a3
{
  if (self->_textAlignmentInsets.left != a3.left
    || self->_textAlignmentInsets.top != a3.top
    || self->_textAlignmentInsets.right != a3.right
    || self->_textAlignmentInsets.bottom != a3.bottom)
  {
    self->_textAlignmentInsets = a3;
    -[CKBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)CKBalloonView;
  -[CKBalloonImageView sizeThatFits:](&v6, sel_sizeThatFits_, a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)prepareForDisplayIfNeeded
{
  id v2;

  -[CKBalloonView displayUpdater](self, "displayUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)prepareForDisplay
{
  id v2;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForDisplay");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKBalloonView;
  v4 = a3;
  -[CKBalloonView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[CKBalloonView traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView setUserInterfaceStyle:](self, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  -[CKBalloonView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;
  objc_msgSend(v4, "displayScale");
  v10 = v9;

  if (v8 != v10)
  {
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](self, "prepareForDisplayIfNeeded");
  }
}

- (void)updateBalloonForTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = CKBackgroundLevelForTraitCollection();
  v6 = objc_msgSend(v4, "userInterfaceStyle");

  -[CKBalloonView setUserInterfaceStyle:](self, "setUserInterfaceStyle:", v6);
  -[CKBalloonView setUserInterfaceLevel:](self, "setUserInterfaceLevel:", v5);
}

- (UIColor)overlayColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
}

- (id)overlayImage
{
  void *v2;
  void *v3;
  __int128 v5[5];

  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  CKResizableBalloonMask(v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_dismissOverlay
{
  -[CKBalloonView setHasOverlay:](self, "setHasOverlay:", 0);
}

- (id)createOverlayImageView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[CKBalloonView overlayImage](self, "overlayImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  -[CKBalloonView overlayColor](self, "overlayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v6);

  return v4;
}

- (void)showOverlay:(BOOL)a3
{
  if (self->_hasOverlay != a3)
    -[CKBalloonView setHasOverlay:](self, "setHasOverlay:");
}

- (void)_showOverlayAnimated
{
  void *v3;
  _QWORD v4[5];

  -[CKBalloonView overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[CKBalloonView layoutIfNeeded](self, "layoutIfNeeded");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__CKBalloonView__showOverlayAnimated__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.25, 0.0);
}

void __37__CKBalloonView__showOverlayAnimated__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_hideOverlayAnimated
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CKBalloonView__hideOverlayAnimated__block_invoke;
  v3[3] = &unk_1E274A208;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__CKBalloonView__hideOverlayAnimated__block_invoke_2;
  v2[3] = &unk_1E274A1B8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v3, v2, 0.25, 0.0);
}

void __37__CKBalloonView__hideOverlayAnimated__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __37__CKBalloonView__hideOverlayAnimated__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setOverlay:", 0);
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "balloonAlpha");
  -[CKBalloonView setAlpha:](self, "setAlpha:");
  -[CKBalloonView filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView setFilters:](self, "setFilters:", v6);

  }
  -[CKBalloonView filters](self, "filters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)clearFilters
{
  void *v3;

  -[CKBalloonView setAlpha:](self, "setAlpha:", 1.0);
  -[CKBalloonView filters](self, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CKBalloonView setFilters:](self, "setFilters:", 0);
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
}

- (void)setDragInteraction:(id)a3
{
  UIDragInteraction *v5;
  UIDragInteraction *dragInteraction;
  UIDragInteraction *v7;

  v5 = (UIDragInteraction *)a3;
  dragInteraction = self->_dragInteraction;
  if (dragInteraction != v5)
  {
    v7 = v5;
    if (dragInteraction)
    {
      -[CKBalloonView removeInteraction:](self, "removeInteraction:");
      v5 = v7;
    }
    if (v5)
      -[CKBalloonView addInteraction:](self, "addInteraction:", v7);
    objc_storeStrong((id *)&self->_dragInteraction, a3);
    v5 = v7;
  }

}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  if (self->_userInterfaceLevel != a3)
  {
    self->_userInterfaceLevel = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setWantsSkinnyMask:(BOOL)a3
{
  if (self->_wantsSkinnyMask != a3)
  {
    self->_wantsSkinnyMask = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setWantsMultilineMask:(BOOL)a3
{
  if (self->_wantsMultilineMask != a3)
  {
    self->_wantsMultilineMask = a3;
    if (a3)
      -[CKBalloonView setWantsSkinnyMask:](self, "setWantsSkinnyMask:", 0);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (BOOL)needsGroupOpacity
{
  return 0;
}

- (void)tapGestureRecognized:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "modifierFlags") == 0x80000)
  {
    -[CKBalloonView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "balloonViewLongTouched:", self);
  }
  else
  {
    v5 = objc_msgSend(v7, "modifierFlags");
    -[CKBalloonView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (v5 == 655360)
      objc_msgSend(v6, "balloonViewShowInlineReply:", self);
    else
      objc_msgSend(v6, "balloonViewTapped:withModifierFlags:selectedText:", self, objc_msgSend(v7, "modifierFlags"), 0);
  }

}

- (BOOL)invisibleInkEffectEnabled
{
  void *v2;
  char v3;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setBackdropFilterLayer:(id)a3
{
  CABackdropLayer *v5;
  CABackdropLayer *v6;

  v5 = (CABackdropLayer *)a3;
  if (self->_backdropFilterLayer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backdropFilterLayer, a3);
    -[CKBalloonView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (BOOL)isAudioMessage
{
  return 0;
}

- (Class)invisibleInkEffectViewClass
{
  return 0;
}

- (UIImage)imageForInvisibleInkEffectView
{
  return 0;
}

- (void)doubleTapGestureRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  CKBalloonView *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKBalloonView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CKBalloonView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      v15 = 2048;
      v16 = v9;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Balloon view %p was double tapped delegate=<%@:%p>", (uint8_t *)&v11, 0x20u);

    }
  }
  -[CKBalloonView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "balloonViewDoubleTapped:", self);

}

- (void)longPressGestureRecognized:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[CKBalloonView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "balloonViewLongTouched:", self);

  }
}

- (char)balloonShape
{
  _BOOL4 v3;
  int balloonShape;
  char v5;

  v3 = -[CKBalloonView wantsSkinnyMask](self, "wantsSkinnyMask");
  balloonShape = self->_balloonShape;
  if (balloonShape == 3)
    v5 = 4;
  else
    v5 = 1;
  if (v3)
    LOBYTE(balloonShape) = v5;
  return balloonShape;
}

- (void)setBalloonDescriptor:(CKBalloonDescriptor_t *)a3
{
  -[CKBalloonView setBalloonShape:](self, "setBalloonShape:", a3->var0);
  -[CKBalloonView setBalloonTailShape:](self, "setBalloonTailShape:", a3->var1);
  -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", a3->var2);
  -[CKBalloonView setOrientation:](self, "setOrientation:", a3->var3);
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", a3->var4);
  -[CKBalloonView setCanUseOpaqueMask:](self, "setCanUseOpaqueMask:", a3->var9);
  -[CKBalloonView setHasTail:](self, "setHasTail:", a3->var10);
  -[CKBalloonView setWantsSkinnyMask:](self, "setWantsSkinnyMask:", a3->var0 == 1);
  -[CKBalloonView setUseLargeAsset:](self, "setUseLargeAsset:", a3->var11);
  -[CKBalloonView setUserInterfaceStyle:](self, "setUserInterfaceStyle:", a3->var7);
  -[CKBalloonView setUserInterfaceLevel:](self, "setUserInterfaceLevel:", a3->var8);
  -[CKBalloonView setWantsMultilineMask:](self, "setWantsMultilineMask:", a3->var12);
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  -[CKBalloonView setNeedsLayout](self, "setNeedsLayout");
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  double v5;
  double v6;
  double v7;
  double v8;
  CKBalloonDescriptor_t *result;

  *retstr = *(CKBalloonDescriptor_t *)CKBalloonDescriptorZero;
  retstr->var0 = -[CKBalloonView balloonShape](self, "balloonShape");
  retstr->var1 = -[CKBalloonView balloonTailShape](self, "balloonTailShape");
  retstr->var2 = -[CKBalloonView balloonStyle](self, "balloonStyle");
  retstr->var3 = -[CKBalloonView orientation](self, "orientation");
  retstr->var4 = -[CKBalloonView balloonCorners](self, "balloonCorners");
  retstr->var9 = -[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask");
  retstr->var10 = -[CKBalloonView hasTail](self, "hasTail");
  retstr->var12 = -[CKBalloonView wantsMultilineMask](self, "wantsMultilineMask");
  retstr->var11 = -[CKBalloonView useLargeAsset](self, "useLargeAsset");
  retstr->var5 = -[CKBalloonView color](self, "color");
  -[CKBalloonView strokeColor](self, "strokeColor");
  retstr->var6.red = v5;
  retstr->var6.green = v6;
  retstr->var6.blue = v7;
  retstr->var6.alpha = v8;
  retstr->var7 = -[CKBalloonView userInterfaceStyle](self, "userInterfaceStyle");
  result = -[CKBalloonView userInterfaceLevel](self, "userInterfaceLevel");
  retstr->var8 = (int64_t)result;
  return result;
}

- (void)updateRasterizationForInvisibleInkEffect
{
  _BOOL8 v3;

  if (-[CKBalloonView invisibleInkEffectEnabled](self, "invisibleInkEffectEnabled"))
    v3 = -[CKBalloonView invisibleInkEffectPaused](self, "invisibleInkEffectPaused");
  else
    v3 = 0;
  -[CKBalloonView _setShouldRasterize:](self, "_setShouldRasterize:", v3);
}

- (BOOL)isSelected
{
  return self->_hasOverlay;
}

- (void)performTranscriptInsertionAnimation:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)performTranscriptReloadAnimation:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)performTranscriptRemovalAnimation:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)performTranscriptHideAnimation:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)performTranscriptRevealAnimation:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKBalloonView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonView:selectedChipAction:", self, v5);

}

- (void)openAppFromNotificationExtensionWith:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapChipListFromNotificationExtensionWithBalloonView:", self);

}

- (CKBalloonViewDelegate)delegate
{
  return (CKBalloonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (char)balloonStyle
{
  return self->_balloonStyle;
}

- (CKColor_t)strokeColor
{
  double red;
  double green;
  double blue;
  double alpha;
  CKColor_t result;

  red = self->_strokeColor.red;
  green = self->_strokeColor.green;
  blue = self->_strokeColor.blue;
  alpha = self->_strokeColor.alpha;
  result.alpha = alpha;
  result.blue = blue;
  result.green = green;
  result.red = red;
  return result;
}

- (UIEdgeInsets)textAlignmentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textAlignmentInsets.top;
  left = self->_textAlignmentInsets.left;
  bottom = self->_textAlignmentInsets.bottom;
  right = self->_textAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (BOOL)isShowingMenu
{
  return self->_showingMenu;
}

- (BOOL)hasOverlay
{
  return self->_hasOverlay;
}

- (BOOL)wantsSkinnyMask
{
  return self->_wantsSkinnyMask;
}

- (BOOL)wantsMultilineMask
{
  return self->_wantsMultilineMask;
}

- (BOOL)useLargeAsset
{
  return self->_useLargeAsset;
}

- (void)setUseLargeAsset:(BOOL)a3
{
  self->_useLargeAsset = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (BOOL)isBeingShownAsPreview
{
  return self->_isBeingShownAsPreview;
}

- (void)setIsBeingShownAsPreview:(BOOL)a3
{
  self->_isBeingShownAsPreview = a3;
}

- (void)setStickerEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_stickerEffectView, a3);
}

- (void)setBalloonShape:(char)a3
{
  self->_balloonShape = a3;
}

- (char)balloonTailShape
{
  return self->_balloonTailShape;
}

- (unint64_t)balloonCorners
{
  return self->_balloonCorners;
}

- (CABackdropLayer)backdropFilterLayer
{
  return self->_backdropFilterLayer;
}

- (void)setInvisibleInkEffectController:(id)a3
{
  objc_storeStrong((id *)&self->_invisibleInkEffectController, a3);
}

- (BOOL)invisibleInkEffectPaused
{
  return self->_invisibleInkEffectPaused;
}

- (BOOL)animationPaused
{
  return self->_animationPaused;
}

- (void)setAnimationPaused:(BOOL)a3
{
  self->_animationPaused = a3;
}

- (UIImageView)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (UIButton)dropDownMenuButton
{
  return self->_dropDownMenuButton;
}

- (void)setDropDownMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_dropDownMenuButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropDownMenuButton, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_displayUpdater, 0);
  objc_storeStrong((id *)&self->_invisibleInkEffectController, 0);
  objc_storeStrong((id *)&self->_backdropFilterLayer, 0);
  objc_storeStrong((id *)&self->_stickerEffectView, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CKTextBalloonView)asTextBalloonView
{
  CKBalloonView *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (CKTextBalloonView *)v3;
}

- (void)configureForComposition:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CKBalloonView setOrientation:](self, "setOrientation:", 1);
  -[CKBalloonView setHasTail:](self, "setHasTail:", 1);
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", -1);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScheduledMessagesCoreEnabled");

  if (v5)
  {
    objc_msgSend(v10, "sendLaterPluginInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "theme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unfilledBalloonColorForColorType:", 15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ckColor");
      -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");

      -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", 3);
    }
  }

}

- (void)configureForMessagePart:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "transcriptTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView setUserInterfaceStyle:](self, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  -[CKBalloonView setUserInterfaceLevel:](self, "setUserInterfaceLevel:", CKBackgroundLevelForTraitCollection(v4));
  -[CKBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v13, "balloonOrientation"));
  -[CKBalloonView setHasTail:](self, "setHasTail:", objc_msgSend(v13, "hasTail"));
  objc_msgSend(v13, "textAlignmentInsets");
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", objc_msgSend(v13, "balloonCorners"));
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScheduledMessagesCoreEnabled");

  if (v6)
  {
    objc_msgSend(v13, "strokeColor");
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");
    -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", objc_msgSend(v13, "balloonStyle"));
  }
  if ((objc_msgSend(v13, "isCommSafetySensitive") & 1) == 0)
  {
    objc_msgSend(v13, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expressiveSendStyleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView setInvisibleInkEffectEnabled:](self, "setInvisibleInkEffectEnabled:", objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")));

  }
  objc_msgSend(v13, "suggestedActionsList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
    goto LABEL_9;
  objc_msgSend(v13, "IMChatItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "IMChatItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "supportsSuggestedActionsMenu"))
    {
      objc_msgSend(v13, "suggestedActionsList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonView addSuggestedActionsMenuWithSuggestedActionsList:](self, "addSuggestedActionsMenuWithSuggestedActionsList:", v12);

    }
LABEL_9:

  }
}

@end
