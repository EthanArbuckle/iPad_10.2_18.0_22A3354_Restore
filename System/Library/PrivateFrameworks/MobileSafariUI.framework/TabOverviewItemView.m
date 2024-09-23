@implementation TabOverviewItemView

- (UIView)snapshotView
{
  return (UIView *)-[SFTabOverviewItemContentView snapshotView](self->_contentView, "snapshotView");
}

- (void)setUnread:(BOOL)a3
{
  -[SFTabOverviewItemContentView setUnread:](self->_contentView, "setUnread:", a3);
}

- (void)setTopBarTheme:(id)a3
{
  -[SFTabOverviewItemContentView setTopBarTheme:](self->_contentView, "setTopBarTheme:", a3);
}

- (void)setTitle:(id)a3
{
  -[SFTabOverviewItemContentView setTitle:](self->_contentView, "setTitle:", a3);
}

- (void)setShareParticipants:(id)a3
{
  -[SFTabOverviewItemContentView setShareParticipants:](self->_contentView, "setShareParticipants:", a3);
}

- (void)setRecording:(BOOL)a3
{
  -[SFTabOverviewItemContentView setRecording:](self->_contentView, "setRecording:", a3);
}

- (void)setPinned:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (self->_pinned != a3)
  {
    -[TabOverviewItemView previewView](self, "previewView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    -[TabOverviewItemView previewView](self, "previewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    self->_pinned = a3;
    -[TabOverviewItemView previewView](self, "previewView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v6);

    -[TabOverviewItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  -[SFTabOverviewItemContentView setMediaStateIcon:](self->_contentView, "setMediaStateIcon:", a3);
}

- (void)setIcon:(id)a3
{
  -[SFTabOverviewItemContentView setIcon:](self->_contentView, "setIcon:", a3);
}

- (void)setAttachedViewReferenceRect:(CGRect)a3
{
  -[SFTabOverviewItemContentView setAttachedViewReferenceRect:](self->_contentView, "setAttachedViewReferenceRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAttachedView:(id)a3
{
  -[SFTabOverviewItemContentView setAttachedView:](self->_contentView, "setAttachedView:", a3);
}

- (UIView)dimmingView
{
  return -[SFTabOverviewItemContentView dimmingView](self->_contentView, "dimmingView");
}

- (void)setWindowSize:(CGSize)a3
{
  if (a3.width != self->_windowSize.width || a3.height != self->_windowSize.height)
  {
    self->_windowSize = a3;
    -[TabOverviewItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTransitionProgress:(double)a3
{
  if (self->_transitionProgress != a3)
  {
    self->_transitionProgress = a3;
    -[TabOverviewItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTopBackdropHeight:(double)a3
{
  if (self->_topBackdropHeight != a3)
  {
    self->_topBackdropHeight = a3;
    -[TabOverviewItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTabLayout:(int64_t)a3
{
  if (self->_tabLayout != a3)
  {
    self->_tabLayout = a3;
    -[TabOverviewItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShadowOpacity:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[UIView layer](self->_shadowView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setShadowOpacity:", v4);

}

- (void)setPreviewViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TabOverviewItemView previewView](self, "previewView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHidden") != v3)
    objc_msgSend(v4, "setHidden:", v3);

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[SFTabOverviewItemContentView setCornerRadius:](self->_contentView, "setCornerRadius:");
    -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", self->_cornerRadius);
  }
}

- (void)setAdditionalTopBackdropHeight:(double)a3
{
  self->_additionalTopBackdropHeight = a3;
}

- (UIView)previewView
{
  _BOOL4 pinned;
  SFTabOverviewItemContentView *contentView;

  pinned = self->_pinned;
  contentView = self->_contentView;
  if (pinned)
    return (UIView *)contentView;
  -[SFTabOverviewItemContentView snapshotClipperView](contentView, "snapshotClipperView");
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_layOutSubviewsDependentOnContentView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  long double v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  double MaxX;
  void *v19;
  double MinX;
  CGFloat v21;
  CGFloat v22;
  double v23;
  const __CFString *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[TabOverviewItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TabOverviewItemView _effectiveTransitionProgress](self, "_effectiveTransitionProgress");
  v12 = v11;
  -[SFTabOverviewItemContentView snapshotClipperView](self->_contentView, "snapshotClipperView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v13, "convertRect:toView:", self);
  -[UIView setFrame:](self->_shadowView, "setFrame:");
  -[SFTabOverviewItemContentView titleView](self->_contentView, "titleView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabIconAndTitleView setAlignment:](v14, (const char *)(2 * self->_pinned));
  objc_msgSend(v14, "setAlpha:", (double)pow(v12, 3.0));
  -[SFTabOverviewItemContentView closeButton](self->_contentView, "closeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SFTabOverviewItemContentView mediaStateIcon](self->_contentView, "mediaStateIcon");
  if (self->_pinned)
  {
    if (-[TabOverviewItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
    {
      if (v16)
      {
        -[SFTabOverviewItemContentView recordingIndicatorView](self->_contentView, "recordingIndicatorView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        CGRectGetMaxX(v39);

      }
      objc_msgSend(v15, "frame");
      MinX = CGRectGetMinX(v42);
      v43.origin.x = v4;
      v43.origin.y = v6;
      v43.size.width = v8;
      v43.size.height = v10;
      v21 = v10;
      v22 = CGRectGetWidth(v43) - *MEMORY[0x1E0D4F2A8];
      +[TabThumbnailCloseButton defaultButtonSize](TabThumbnailCloseButton, "defaultButtonSize");
      if (MinX >= v22 - v23)
      {
        v45.origin.x = v4;
        v45.origin.y = v6;
        v45.size.width = v8;
        v45.size.height = v21;
        CGRectGetWidth(v45);
        +[TabThumbnailCloseButton defaultButtonSize](TabThumbnailCloseButton, "defaultButtonSize");
      }
      else
      {
        objc_msgSend(v15, "frame");
        CGRectGetMinX(v44);
      }
    }
    else
    {
      objc_msgSend(v15, "frame");
      MaxX = CGRectGetMaxX(v40);
      if (v16)
      {
        -[SFTabOverviewItemContentView recordingIndicatorView](self->_contentView, "recordingIndicatorView", MaxX);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        CGRectGetMinX(v41);

      }
      else
      {
        v46.origin.x = v4;
        v46.origin.y = v6;
        v46.size.width = v8;
        v46.size.height = v10;
        CGRectGetWidth(v46);
      }
    }
    -[SFTabOverviewItemContentView titleHeight](self->_contentView, "titleHeight");
    -[SFTabOverviewItemContentView titleHeight](self->_contentView, "titleHeight");
    _SFRoundRectToPixels();
    objc_msgSend(v14, "setFrame:");
  }
  objc_msgSend(v13, "bounds");
  -[UIView setFrame:](self->_pinnedFillView, "setFrame:");
  -[UIView setHidden:](self->_pinnedFillView, "setHidden:", !self->_pinned);
  -[UIView setAlpha:](self->_pinnedFillView, "setAlpha:", (double)v12);
  if (self->_pinned)
    v24 = CFSTR("pin.fill");
  else
    v24 = CFSTR("xmark");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v25);

  if (self->_showsCloseButton || self->_pinned)
    v26 = v12;
  else
    v26 = 0.0;
  objc_msgSend(v15, "setAlpha:", v26);
  objc_msgSend(v15, "setEnabled:", !self->_pinned);
  CGAffineTransformMakeScale(&v38, v12, v12);
  v37 = v38;
  objc_msgSend(v15, "setTransform:", &v37);
  v27 = 0.0;
  if (!self->_pinned)
  {
    -[SFTabOverviewItemContentView shareParticipants](self->_contentView, "shareParticipants");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
      v27 = v12;
    else
      v27 = 0.0;
  }
  -[SFTabOverviewItemContentView participantsBackgroundView](self->_contentView, "participantsBackgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlpha:", v27);

  _SFClampPercent();
  v32 = v31;
  -[SFTabOverviewItemContentView placeholderView](self->_contentView, "placeholderView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAlpha:", v32);

  if (v16)
    v34 = v12;
  else
    v34 = 0.0;
  -[SFTabOverviewItemContentView recordingIndicatorView](self->_contentView, "recordingIndicatorView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v34);

  -[SFTabOverviewItemContentView attachedView](self->_contentView, "attachedView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAlpha:", fmax(v12 * -2.0 + 1.0, 0.0));

}

- (double)_effectiveTransitionProgress
{
  double result;

  if (self->_tabLayout == 1)
    return 0.0;
  -[TabOverviewItemView transitionProgress](self, "transitionProgress");
  _SFClamp();
  return result;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;

  -[SFTabOverviewItemContentView setEnableDelegateLayoutNotification:](self->_contentView, "setEnableDelegateLayoutNotification:", 0);
  -[TabOverviewItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TabOverviewItemView _effectiveTransitionProgress](self, "_effectiveTransitionProgress");
  v12 = v11;
  if (self->_windowSize.width > 0.0)
  {
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    CGRectGetWidth(v15);
  }
  _SFRoundFloatToPixels();
  -[SFTabOverviewItemContentView setVisibleTopBackdropHeight:](self->_contentView, "setVisibleTopBackdropHeight:");
  v13 = 0.0;
  if (!self->_pinned)
    v13 = v12;
  -[SFTabOverviewItemContentView setTitleRevealPercent:](self->_contentView, "setTitleRevealPercent:", v13);
  v14.receiver = self;
  v14.super_class = (Class)TabOverviewItemView;
  -[TabOverviewItemView layoutSubviews](&v14, sel_layoutSubviews);
  -[SFTabOverviewItemContentView layoutIfNeeded](self->_contentView, "layoutIfNeeded");
  -[TabOverviewItemView _layOutSubviewsDependentOnContentView](self, "_layOutSubviewsDependentOnContentView");
  -[SFTabOverviewItemContentView setEnableDelegateLayoutNotification:](self->_contentView, "setEnableDelegateLayoutNotification:", 1);
}

- (void)updateSnapshotWithImage:(id)a3
{
  -[SFTabOverviewItemContentView setSnapshotImage:](self->_contentView, "setSnapshotImage:", a3);
}

- (void)setAllowsSnapshotTopBackdropUnderlap:(BOOL)a3
{
  -[SFTabOverviewItemContentView setAllowsSnapshotTopBackdropUnderlap:](self->_contentView, "setAllowsSnapshotTopBackdropUnderlap:", a3);
}

- (UIButton)closeButton
{
  return -[SFTabOverviewItemContentView closeButton](self->_contentView, "closeButton");
}

- (void)setShowsCloseButton:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43__TabOverviewItemView_setShowsCloseButton___block_invoke;
    v3[3] = &unk_1E9CF1900;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, 0);
  }
}

- (TabOverviewItemView)initWithFrame:(CGRect)a3
{
  TabOverviewItemView *v3;
  TabOverviewItemView *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *shadowView;
  void *v9;
  SFTabOverviewItemContentView *v10;
  uint64_t v11;
  SFTabOverviewItemContentView *contentView;
  UIView *v13;
  UIView *pinnedFillView;
  void *v15;
  void *v16;
  UIView *v17;
  void *v18;
  TabOverviewItemView *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TabOverviewItemView;
  v3 = -[TabOverviewItemView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TabOverviewItemView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "setRasterizationScale:");

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    shadowView = v4->_shadowView;
    v4->_shadowView = v7;

    -[TabOverviewItemView addSubview:](v4, "addSubview:", v4->_shadowView);
    -[UIView layer](v4->_shadowView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(v9, "setShadowRadius:", 8.0);
    objc_msgSend(v9, "setShadowPathIsBounds:", 1);
    v10 = [SFTabOverviewItemContentView alloc];
    -[TabOverviewItemView bounds](v4, "bounds");
    v11 = -[SFTabOverviewItemContentView initWithFrame:](v10, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (SFTabOverviewItemContentView *)v11;

    -[SFTabOverviewItemContentView setAutoresizingMask:](v4->_contentView, "setAutoresizingMask:", 18);
    -[SFTabOverviewItemContentView setMinYMatchesTopBarMaxYWhenZoomed:](v4->_contentView, "setMinYMatchesTopBarMaxYWhenZoomed:", 1);
    -[SFTabOverviewItemContentView setDelegate:](v4->_contentView, "setDelegate:", v4);
    -[TabOverviewItemView addSubview:](v4, "addSubview:", v4->_contentView);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    pinnedFillView = v4->_pinnedFillView;
    v4->_pinnedFillView = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_pinnedFillView, "setBackgroundColor:", v15);

    -[UIView setUserInteractionEnabled:](v4->_pinnedFillView, "setUserInteractionEnabled:", 0);
    -[SFTabOverviewItemContentView snapshotClipperView](v4->_contentView, "snapshotClipperView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v4->_pinnedFillView;
    -[SFTabOverviewItemContentView headerBackgroundView](v4->_contentView, "headerBackgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSubview:aboveSubview:", v17, v18);

    v19 = v4;
  }

  return v4;
}

- (double)shadowOpacity
{
  void *v2;
  float v3;
  double v4;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOpacity");
  v4 = v3;

  return v4;
}

- (BOOL)previewViewIsHidden
{
  void *v2;
  char v3;

  -[TabOverviewItemView previewView](self, "previewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC10A8];
}

- (id)accessibilityLabel
{
  id *v2;
  void *v3;

  -[SFTabOverviewItemContentView titleView](self->_contentView, "titleView");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[TabIconAndTitleView title](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityIdentifier
{
  _BOOL4 pinned;
  const __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  pinned = self->_pinned;
  v7 = CFSTR("IsPinned");
  if (pinned)
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIView)attachedView
{
  return -[SFTabOverviewItemContentView attachedView](self->_contentView, "attachedView");
}

- (NSString)title
{
  return -[SFTabOverviewItemContentView title](self->_contentView, "title");
}

- (UIImage)icon
{
  return -[SFTabOverviewItemContentView icon](self->_contentView, "icon");
}

- (BOOL)isRecording
{
  return -[SFTabOverviewItemContentView isRecording](self->_contentView, "isRecording");
}

- (unint64_t)mediaStateIcon
{
  return -[SFTabOverviewItemContentView mediaStateIcon](self->_contentView, "mediaStateIcon");
}

- (CGRect)attachedViewReferenceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SFTabOverviewItemContentView attachedViewReferenceRect](self->_contentView, "attachedViewReferenceRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_SFBarTheme)topBarTheme
{
  return -[SFTabOverviewItemContentView topBarTheme](self->_contentView, "topBarTheme");
}

- (BOOL)allowsSnapshotTopBackdropUnderlap
{
  return -[SFTabOverviewItemContentView allowsSnapshotTopBackdropUnderlap](self->_contentView, "allowsSnapshotTopBackdropUnderlap");
}

- (BOOL)allowsBorrowedContentTopBackdropUnderlap
{
  return -[SFTabOverviewItemContentView allowsBorrowedContentTopBackdropUnderlap](self->_contentView, "allowsBorrowedContentTopBackdropUnderlap");
}

- (void)setAllowsBorrowedContentTopBackdropUnderlap:(BOOL)a3
{
  -[SFTabOverviewItemContentView setAllowsBorrowedContentTopBackdropUnderlap:](self->_contentView, "setAllowsBorrowedContentTopBackdropUnderlap:", a3);
}

- (BOOL)isUnread
{
  return -[SFTabOverviewItemContentView isUnread](self->_contentView, "isUnread");
}

- (NSArray)shareParticipants
{
  return -[SFTabOverviewItemContentView shareParticipants](self->_contentView, "shareParticipants");
}

void __43__TabOverviewItemView_setShowsCloseButton___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  double v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  LOBYTE(a2) = *(_BYTE *)(v2 + 448);
  v3 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(v2 + 424), "closeButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)insertBorrowedContentView:(id)a3 headerHeight:(double)a4
{
  -[SFTabOverviewItemContentView setBorrowedContentView:](self->_contentView, "setBorrowedContentView:", a3);
  self->_borrowedContentHeaderHeight = a4;
}

- (void)removeBorrowedContentView:(id)a3
{
  -[SFTabOverviewItemContentView setBorrowedContentView:](self->_contentView, "setBorrowedContentView:", 0);
}

- (BOOL)containsBorrowedContentView:(id)a3
{
  return objc_msgSend(a3, "isDescendantOfView:", self);
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (int64_t)tabLayout
{
  return self->_tabLayout;
}

- (BOOL)wasUsedForPreviewing
{
  return self->_wasUsedForPreviewing;
}

- (void)setWasUsedForPreviewing:(BOOL)a3
{
  self->_wasUsedForPreviewing = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)topBackdropHeight
{
  return self->_topBackdropHeight;
}

- (double)additionalTopBackdropHeight
{
  return self->_additionalTopBackdropHeight;
}

- (CGSize)windowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowSize.width;
  height = self->_windowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_pinnedFillView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
