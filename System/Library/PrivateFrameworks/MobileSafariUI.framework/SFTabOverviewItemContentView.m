@implementation SFTabOverviewItemContentView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Height;
  double titleRevealPercent;
  double v23;
  double v24;
  double Width;
  double v26;
  void (**v27)(void *, BOOL);
  double v28;
  CGFloat v29;
  CGFloat x;
  CGFloat y;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double MinX;
  void *v44;
  double v45;
  double v46;
  double MinY;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  CGFloat v79;
  UIView *attachedView;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  id WeakRetained;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat rect;
  double recta;
  double rect_8;
  double rect_16;
  CGFloat rect_24;
  double v97;
  double v98;
  CGAffineTransform v99;
  CGAffineTransform v100;
  _QWORD aBlock[10];
  objc_super v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v102.receiver = self;
  v102.super_class = (Class)SFTabOverviewItemContentView;
  -[SFTabOverviewItemContentView layoutSubviews](&v102, sel_layoutSubviews);
  -[UIView superview](self->_snapshotClipperView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SFTabOverviewItemContentView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_snapshotClipperView, self->_closeButton);
    -[UIView setAlpha:](self->_snapshotClipperView, "setAlpha:", 1.0);
  }
  -[SFTabOverviewItemContentView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SFTabOverviewItemContentView titlePadding](self, "titlePadding");
  v13 = v12;
  v97 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v103.origin.x = v5;
  v103.origin.y = v7;
  v103.size.width = v9;
  v103.size.height = v11;
  v20 = v13 + CGRectGetMaxY(v103) - self->_titleHeight - v17;
  v104.origin.x = v5;
  v104.origin.y = v7;
  v104.size.width = v9;
  v104.size.height = v11;
  -[TabIconAndTitleView setFrame:](self->_titleView, "setFrame:", v15, v20, CGRectGetWidth(v104) - v15 - v19, self->_titleHeight);
  v105.origin.x = v5;
  v105.origin.y = v7;
  v105.size.width = v9;
  v105.size.height = v11;
  Height = CGRectGetHeight(v105);
  titleRevealPercent = self->_titleRevealPercent;
  -[SFTabOverviewItemContentView titleHeight](self, "titleHeight");
  v24 = Height - titleRevealPercent * (v17 + v97 + v23);
  v98 = 0.0;
  if (self->_minYMatchesTopBarMaxYWhenZoomed)
    v98 = -fmax(self->_visibleTopBackdropHeight, 0.0);
  v106.origin.x = v5;
  v106.origin.y = v7;
  v106.size.width = v9;
  v106.size.height = v11;
  rect_24 = v9;
  Width = CGRectGetWidth(v106);
  rect = v5;
  v26 = v24 + fmax(self->_visibleTopBackdropHeight, 0.0);
  -[UIView setFrame:](self->_snapshotClipperView, "setFrame:", 0.0, v98, Width, v26);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__SFTabOverviewItemContentView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E9CF6630;
  aBlock[4] = self;
  aBlock[5] = 0;
  *(double *)&aBlock[6] = v98;
  *(double *)&aBlock[7] = Width;
  rect_8 = v26;
  rect_16 = Width;
  *(double *)&aBlock[8] = v26;
  *(double *)&aBlock[9] = v24;
  v27 = (void (**)(void *, BOOL))_Block_copy(aBlock);
  v27[2](v27, self->_allowsSnapshotTopBackdropUnderlap);
  -[TabSnapshotImageView setFrame:](self->_snapshotView, "setFrame:");
  v27[2](v27, 0);
  -[UIView setFrame:](self->_placeholderView, "setFrame:");
  -[UIView bounds](self->_borrowedContentView, "bounds");
  v28 = v11;
  v29 = v7;
  x = v107.origin.x;
  y = v107.origin.y;
  v32 = v107.size.width;
  v33 = v107.size.height;
  if (CGRectGetWidth(v107) != 0.0)
  {
    v34 = ((double (*)(void *, BOOL))v27[2])(v27, self->_allowsBorrowedContentTopBackdropUnderlap);
    v91 = v35;
    v88 = v36;
    v89 = x;
    v37 = v28;
    v38 = v35;
    v40 = v39;
    v90 = v39;
    v108.origin.x = rect;
    v108.origin.y = v29;
    v108.size.width = rect_24;
    v108.size.height = v37;
    v41 = CGRectGetWidth(v108);
    v109.origin.x = x;
    v109.origin.y = y;
    v109.size.width = v32;
    v109.size.height = v33;
    v42 = v41 / CGRectGetWidth(v109);
    v110.origin.x = v34;
    v110.origin.y = v38;
    v110.size.width = v88;
    v110.size.height = v40;
    MinX = CGRectGetMinX(v110);
    -[UIView layer](self->_borrowedContentView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "anchorPoint");
    v46 = v45;
    v111.origin.x = v89;
    v111.origin.y = y;
    v111.size.width = v32;
    v111.size.height = v33;
    recta = MinX + v46 * CGRectGetWidth(v111) * v42;
    v112.origin.y = v91;
    v112.origin.x = v34;
    v112.size.width = v88;
    v112.size.height = v90;
    MinY = CGRectGetMinY(v112);
    -[UIView layer](self->_borrowedContentView, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "anchorPoint");
    v50 = v49;
    v113.origin.x = v89;
    v113.origin.y = y;
    v113.size.width = v32;
    v113.size.height = v33;
    v51 = MinY + v50 * CGRectGetHeight(v113) * v42;
    -[UIView layer](self->_borrowedContentView, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setPosition:", recta, v51);

  }
  v114.origin.y = v98;
  v114.origin.x = 0.0;
  v114.size.height = rect_8;
  v114.size.width = rect_16;
  v53 = CGRectGetWidth(v114);
  -[SFTabOverviewItemContentView visibleTopBackdropHeight](self, "visibleTopBackdropHeight");
  -[UIView setFrame:](self->_headerBackgroundView, "setFrame:", 0.0, 0.0, v53, v54);
  -[SFTabOverviewItemContentView _headerBackgroundColor](self, "_headerBackgroundColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_headerBackgroundView, "setBackgroundColor:", v55);

  -[TabSnapshotImageView image](self->_snapshotView, "image");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    objc_msgSend(v56, "capInsets");
    if (v61 == *(double *)(MEMORY[0x1E0DC49E8] + 8)
      && v58 == *MEMORY[0x1E0DC49E8]
      && v60 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
      && v59 == *(double *)(MEMORY[0x1E0DC49E8] + 16))
    {
      objc_msgSend(v57, "size");
      if (v62 > 0.0)
      {
        objc_msgSend(v57, "size");
        objc_msgSend(v57, "scale");
        if (tabSnapshotHasTransparentBorderPadding())
          _SFOnePixel();
        _SFCeilingFloatToPixels();
        -[TabSnapshotImageView setImagePosition:](self->_snapshotView, "setImagePosition:", 0.5, v63);
      }
    }
  }
  -[SFTabOverviewItemContentView window](self, "window", *(_QWORD *)&v88);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bounds");
  v66 = v65;
  v68 = v67;

  if (self->_attachedView && v66 > 0.0 && v68 > 0.0)
  {
    UIRectGetCenter();
    v70 = v69 / v66;
    v72 = v71 / v68;
    v115.origin.x = 0.0;
    v115.origin.y = v98;
    v115.size.width = rect_16;
    v115.size.height = rect_8;
    v73 = CGRectGetWidth(v115) * v70;
    v116.origin.x = 0.0;
    v116.origin.y = v98;
    v116.size.width = rect_16;
    v116.size.height = rect_8;
    v74 = CGRectGetHeight(v116);
    -[SFTabOverviewItemContentView visibleTopBackdropHeight](self, "visibleTopBackdropHeight");
    v76 = -(v75 - (v72 + -1.0 + 1.0) * v74);
    -[UIView superview](self->_attachedView, "superview");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "convertPoint:fromView:", self, v73, v76);
    _SFRoundPointToPixels();
    -[UIView setCenter:](self->_attachedView, "setCenter:");

    -[UIView superview](self->_attachedView, "superview");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabOverviewItemContentView convertRect:toView:](self, "convertRect:toView:", v78, 0.0, v98, rect_16, rect_8);
    v79 = CGRectGetWidth(v117) / v66;

    CGAffineTransformMakeScale(&v100, v79, v79);
    attachedView = self->_attachedView;
    v99 = v100;
    -[UIView setTransform:](attachedView, "setTransform:", &v99);
  }
  -[TabThumbnailCloseButton bounds](self->_closeButton, "bounds");
  v81 = v118.origin.x;
  v82 = v118.origin.y;
  v83 = v118.size.width;
  v84 = v118.size.height;
  v85 = fmin(CGRectGetWidth(v118) + -60.0, 0.0) * 0.5;
  v119.origin.x = v81;
  v119.origin.y = v82;
  v119.size.width = v83;
  v119.size.height = v84;
  v86 = fmin(CGRectGetHeight(v119) + -60.0, 0.0) * 0.5;
  -[TabThumbnailCloseButton _setTouchInsets:](self->_closeButton, "_setTouchInsets:", v86, v85, v86, v85);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_enableDelegateLayoutNotification && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "contentViewDidLayOutSubviews:", self);

}

double __46__SFTabOverviewItemContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  CGRectGetWidth(*(CGRect *)(a1 + 40));
  return 0.0;
}

- (UIEdgeInsets)titlePadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 4.0;
  v3 = 0.0;
  v4 = 10.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)titleHeight
{
  return self->_titleHeight;
}

- (double)visibleTopBackdropHeight
{
  return self->_visibleTopBackdropHeight;
}

- (id)_headerBackgroundColor
{
  void *v3;
  void *v4;
  _SFBarTheme *topBarTheme;
  int v6;
  void *v7;
  double v8;
  double v9;
  int v10;

  v3 = -[SFTabOverviewItemContentView effectiveHeaderMode](self, "effectiveHeaderMode");
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (v3 == (void *)1)
  {
    v6 = -[_SFBarTheme backdropIsDark](self->_topBarTheme, "backdropIsDark");
    v7 = (void *)MEMORY[0x1E0DC3658];
    if (v6)
    {
      v8 = 0.2;
      v9 = 0.7;
    }
    else
    {
      v9 = 0.7;
      v8 = 1.0;
    }
    goto LABEL_12;
  }
  if (v3 == (void *)2)
  {
    -[_SFBarTheme preferredBarTintColor](self->_topBarTheme, "preferredBarTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    topBarTheme = self->_topBarTheme;
    if (v4)
    {
      -[_SFBarTheme preferredBarTintColor](topBarTheme, "preferredBarTintColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    v10 = -[_SFBarTheme backdropIsDark](topBarTheme, "backdropIsDark");
    v7 = (void *)MEMORY[0x1E0DC3658];
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    v8 = 0.14;
    v9 = 1.0;
LABEL_12:
    objc_msgSend(v7, "colorWithWhite:alpha:", v8, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)effectiveHeaderMode
{
  int64_t result;
  void *v4;
  uint64_t v5;
  BOOL v6;

  result = (int64_t)self->_topBarTheme;
  if (result)
  {
    if (self->_contentSizeIsAccessibilityCategory)
      return 2;
    objc_msgSend((id)result, "preferredBarTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      return 2;
    }
    else if (-[_SFBarTheme tintStyle](self->_topBarTheme, "tintStyle") == 2 && !self->_preferredHeaderMode)
    {
      return 1;
    }
    else
    {
      v5 = -[_SFBarTheme tintStyle](self->_topBarTheme, "tintStyle");
      if (self->_preferredHeaderMode)
        v6 = 0;
      else
        v6 = v5 == 3;
      if (v6)
        return 1;
      else
        return self->_preferredHeaderMode;
    }
  }
  return result;
}

- (TabSnapshotImageView)snapshotView
{
  return self->_snapshotView;
}

- (void)setUnread:(BOOL)a3
{
  -[TabIconAndTitleView setShowsUnreadIndicator:]((uint64_t)self->_titleView, a3);
}

- (void)setTopBarTheme:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_topBarTheme, a3);
    -[SFTabOverviewItemContentView _headerBackgroundColor](self, "_headerBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_headerBackgroundView, "setBackgroundColor:", v5);

  }
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[TabIconAndTitleView title]((id *)&self->_titleView->super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[TabIconAndTitleView setTitle:]((id *)&self->_titleView->super.super.super.isa, v6);
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setShareParticipants:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[5];

  v4 = a3;
  -[SFTabOverviewItemContentView shareParticipants](self, "shareParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToArray:", v4);

  if ((v6 & 1) == 0)
  {
    -[SFAvatarStackView setShareParticipants:](self->_participantsView, "setShareParticipants:", v4);
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__SFTabOverviewItemContentView_setShareParticipants___block_invoke;
    v7[3] = &unk_1E9CF1900;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v7, 0);
  }

}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  _QWORD v3[6];

  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__SFTabOverviewItemContentView_setMediaStateIcon___block_invoke;
    v3[3] = &unk_1E9CF2538;
    v3[4] = self;
    v3[5] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, 0);
  }
}

- (void)setIcon:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[TabIconAndTitleView icon]((id *)&self->_titleView->super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[TabIconAndTitleView setIcon:]((id *)&self->_titleView->super.super.super.isa, v6);
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAttachedViewReferenceRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_attachedViewReferenceRect;
  UIView *attachedView;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_attachedViewReferenceRect = &self->_attachedViewReferenceRect;
  if (!CGRectEqualToRect(a3, self->_attachedViewReferenceRect))
  {
    p_attachedViewReferenceRect->origin.x = x;
    p_attachedViewReferenceRect->origin.y = y;
    p_attachedViewReferenceRect->size.width = width;
    p_attachedViewReferenceRect->size.height = height;
    attachedView = self->_attachedView;
    if (attachedView)
    {
      -[UIView ss_setUntransformedFrame:](attachedView, "ss_setUntransformedFrame:", x, y, width, height);
      -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setAttachedView:(id)a3
{
  UIView *v5;
  UIView **p_attachedView;
  UIView *attachedView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_attachedView = &self->_attachedView;
  attachedView = self->_attachedView;
  v8 = v5;
  if (attachedView != v5)
  {
    if (-[UIView isDescendantOfView:](attachedView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_attachedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_attachedView, a3);
    if (*p_attachedView)
    {
      if (!-[UIView translatesAutoresizingMaskIntoConstraints](*p_attachedView, "translatesAutoresizingMaskIntoConstraints"))
      {
        -[UIView removeFromSuperview](*p_attachedView, "removeFromSuperview");
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_attachedView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      }
      if (-[UIView isHidden](*p_attachedView, "isHidden"))
      {
        -[UIView setHidden:](*p_attachedView, "setHidden:", 0);
        -[SFTabOverviewItemContentView addSubview:](self, "addSubview:", *p_attachedView);
      }
      -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[SFTabOverviewItemContentView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
    -[UIView _setContinuousCornerRadius:](self->_snapshotClipperView, "_setContinuousCornerRadius:", self->_cornerRadius);
  }
}

- (SFTabOverviewItemContentView)initWithFrame:(CGRect)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  TabSnapshotImageView *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  TabThumbnailRecordingIndicator *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  TabThumbnailCloseButton *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;
  uint64_t v72;
  _QWORD v73[12];

  v73[10] = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)SFTabOverviewItemContentView;
  v3 = -[SFTabOverviewItemContentView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = (void *)*((_QWORD *)v3 + 61);
    *((_QWORD *)v3 + 61) = v4;

    objc_msgSend(*((id *)v3 + 61), "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 61), "setBackgroundColor:", v6);

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 61));
    v7 = -[TabSnapshotImageView initWithImage:]([TabSnapshotImageView alloc], "initWithImage:", 0);
    v8 = (void *)*((_QWORD *)v3 + 67);
    *((_QWORD *)v3 + 67) = v7;

    if (tabSnapshotHasTransparentBorderPadding())
    {
      objc_msgSend(*((id *)v3 + 67), "setCropInsets:", 0.0, 1.0, 0.0, 1.0);
      objc_msgSend(*((id *)v3 + 67), "setImagePosition:", 0.5, 0.0);
    }
    objc_msgSend(*((id *)v3 + 61), "addSubview:", *((_QWORD *)v3 + 67));
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    v10 = (void *)placeholderImage_image;
    if (!placeholderImage_image)
    {
      v11 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AE8], 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemImageNamed:withConfiguration:", CFSTR("safari"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)placeholderImage_image;
      placeholderImage_image = v13;

      v10 = (void *)placeholderImage_image;
    }
    v15 = v10;
    v16 = objc_msgSend(v9, "initWithImage:", v15);
    v17 = (void *)*((_QWORD *)v3 + 58);
    *((_QWORD *)v3 + 58) = v16;

    objc_msgSend(*((id *)v3 + 58), "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 58), "setTintColor:", v18);

    objc_msgSend(*((id *)v3 + 61), "addSubview:", *((_QWORD *)v3 + 58));
    v19 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v20 = (void *)*((_QWORD *)v3 + 55);
    *((_QWORD *)v3 + 55) = v19;

    objc_msgSend(*((id *)v3 + 61), "addSubview:", *((_QWORD *)v3 + 55));
    v21 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v22 = (void *)*((_QWORD *)v3 + 57);
    *((_QWORD *)v3 + 57) = v21;

    +[TabThumbnailCloseButton backgroundColor](TabThumbnailCloseButton, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 57), "setBackgroundColor:", v23);

    objc_msgSend(*((id *)v3 + 57), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v3 + 61), "addSubview:", *((_QWORD *)v3 + 57));
    v24 = objc_alloc_init(MEMORY[0x1E0D4EBC0]);
    v25 = (void *)*((_QWORD *)v3 + 56);
    *((_QWORD *)v3 + 56) = v24;

    objc_msgSend(*((id *)v3 + 56), "setAlignment:", 0);
    objc_msgSend(*((id *)v3 + 56), "setAvatarDiameter:", 30.0);
    objc_msgSend(*((id *)v3 + 56), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v3 + 57), "addSubview:", *((_QWORD *)v3 + 56));
    v26 = objc_alloc_init(TabThumbnailRecordingIndicator);
    v27 = (void *)*((_QWORD *)v3 + 60);
    *((_QWORD *)v3 + 60) = v26;

    objc_msgSend(*((id *)v3 + 60), "setAlpha:", 0.0);
    objc_msgSend(*((id *)v3 + 60), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v3 + 61), "addSubview:", *((_QWORD *)v3 + 60));
    v28 = -[TabIconAndTitleView initWithAlignment:]([TabIconAndTitleView alloc], 0);
    v29 = (void *)*((_QWORD *)v3 + 62);
    *((_QWORD *)v3 + 62) = v28;

    -[TabIconAndTitleView setNumberOfLines:](*((_QWORD *)v3 + 62), 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabIconAndTitleView setTextColor:](*((_QWORD *)v3 + 62), (uint64_t)v30);

    objc_msgSend(*((id *)v3 + 62), "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 62));
    v31 = objc_alloc_init(TabThumbnailCloseButton);
    v32 = (void *)*((_QWORD *)v3 + 53);
    *((_QWORD *)v3 + 53) = v31;

    objc_msgSend(*((id *)v3 + 53), "setAlpha:", 0.0);
    objc_msgSend(*((id *)v3 + 53), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 53), "setImage:", v33);

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 53));
    v58 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(*((id *)v3 + 53), "centerXAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0D4F2A8];
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, -*MEMORY[0x1E0D4F2A8]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v68;
    objc_msgSend(*((id *)v3 + 53), "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, v34);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v65;
    objc_msgSend(*((id *)v3 + 60), "centerXAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, v34);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v62;
    objc_msgSend(*((id *)v3 + 60), "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, v34);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v59;
    objc_msgSend(*((id *)v3 + 57), "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 61), "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v73[4] = v55;
    objc_msgSend(*((id *)v3 + 57), "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 61), "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v73[5] = v52;
    objc_msgSend(*((id *)v3 + 57), "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 61), "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v73[6] = v49;
    objc_msgSend(*((id *)v3 + 56), "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 57), "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v73[7] = v36;
    objc_msgSend(*((id *)v3 + 56), "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 57), "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 5.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v73[8] = v39;
    objc_msgSend(*((id *)v3 + 56), "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 57), "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -7.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v73[9] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v43);

    v72 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (id)objc_msgSend(v3, "registerForTraitChanges:withTarget:action:", v44, v3, sel__updateContentSizeCategory);

    objc_msgSend(v3, "_updateContentSizeCategory");
    v46 = v3;
  }

  return (SFTabOverviewItemContentView *)v3;
}

- (NSArray)shareParticipants
{
  return (NSArray *)-[SFAvatarStackView shareParticipants](self->_participantsView, "shareParticipants");
}

- (UIView)snapshotClipperView
{
  return self->_snapshotClipperView;
}

- (UIButton)closeButton
{
  return &self->_closeButton->super;
}

- (TabIconAndTitleView)titleView
{
  return self->_titleView;
}

- (UIView)recordingIndicatorView
{
  return &self->_recordingIndicatorView->super;
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (UIView)participantsBackgroundView
{
  return self->_participantsBackgroundView;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (UIView)attachedView
{
  return self->_attachedView;
}

- (void)_updateContentSizeCategory
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  uint64_t v14;
  id v15;

  -[SFTabOverviewItemContentView traitCollection](self, "traitCollection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = cachedTitleFont;
  if (!cachedTitleFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A98], v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v4, "symbolicTraits") | 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)cachedTitleFont;
    cachedTitleFont = v6;

    v3 = cachedTitleFont;
  }
  -[TabIconAndTitleView setTitleFont:]((uint64_t)self->_titleView, v3);
  objc_msgSend(v15, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_contentSizeIsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (self->_contentSizeIsAccessibilityCategory)
    v9 = 2;
  else
    v9 = 1;
  -[TabIconAndTitleView titleFont]((id *)&self->_titleView->super.super.super.isa);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!titleHeightForFont_sizingLabel)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v12 = (void *)titleHeightForFont_sizingLabel;
    titleHeightForFont_sizingLabel = (uint64_t)v11;

    objc_msgSend((id)titleHeightForFont_sizingLabel, "setText:", CFSTR("x\nx"));
  }
  v13 = *(double *)&cachedTitleViewHeight;
  if (*(double *)&cachedTitleViewHeight == 0.0)
  {
    objc_msgSend((id)titleHeightForFont_sizingLabel, "setFont:", v10);
    objc_msgSend((id)titleHeightForFont_sizingLabel, "setNumberOfLines:", v9);
    objc_msgSend((id)titleHeightForFont_sizingLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v13 = *(double *)&v14;
    cachedTitleViewHeight = v14;
  }

  self->_titleHeight = v13;
  -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __53__SFTabOverviewItemContentView_setShareParticipants___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setEnableDelegateLayoutNotification:(BOOL)a3
{
  self->_enableDelegateLayoutNotification = a3;
}

- (void)setVisibleTopBackdropHeight:(double)a3
{
  if (self->_visibleTopBackdropHeight != a3)
  {
    self->_visibleTopBackdropHeight = a3;
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleRevealPercent:(double)a3
{
  if (self->_titleRevealPercent != a3)
  {
    self->_titleRevealPercent = a3;
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSnapshotImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int64_t v7;
  id v8;

  v8 = a3;
  -[TabSnapshotImageView image](self->_snapshotView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  v6 = v8;
  if ((v5 & 1) == 0)
  {
    -[TabSnapshotImageView setImage:](self->_snapshotView, "setImage:", v8);
    -[UIView setHidden:](self->_placeholderView, "setHidden:", v8 != 0);
    if (v8)
      v7 = objc_msgSend(v8, "sf_tabSnapshotEffectsVersion") != 1;
    else
      v7 = 2;
    self->_preferredHeaderMode = v7;
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v8;
  }

}

- (void)setAllowsSnapshotTopBackdropUnderlap:(BOOL)a3
{
  self->_allowsSnapshotTopBackdropUnderlap = a3;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *MEMORY[0x1E0DC48E8];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v2, 0, v3, &__block_literal_global_38);

  }
}

- (void)setMinYMatchesTopBarMaxYWhenZoomed:(BOOL)a3
{
  self->_minYMatchesTopBarMaxYWhenZoomed = a3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_enableDelegateLayoutNotification = objc_opt_respondsToSelector() & 1;
  }

}

- (UIView)headerBackgroundView
{
  return self->_headerBackgroundView;
}

void __42__SFTabOverviewItemContentView_initialize__block_invoke()
{
  void *v0;

  v0 = (void *)cachedTitleFont;
  cachedTitleFont = 0;

  cachedTitleViewHeight = 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  TabThumbnailCloseButton *closeButton;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFTabOverviewItemContentView;
  if (-[SFTabOverviewItemContentView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    closeButton = self->_closeButton;
    -[SFTabOverviewItemContentView convertPoint:toView:](self, "convertPoint:toView:", closeButton, x, y);
    v8 = -[TabThumbnailCloseButton pointInside:withEvent:](closeButton, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (NSString)title
{
  return (NSString *)-[TabIconAndTitleView title]((id *)&self->_titleView->super.super.super.isa);
}

- (UIImage)icon
{
  return (UIImage *)-[TabIconAndTitleView icon]((id *)&self->_titleView->super.super.super.isa);
}

uint64_t __50__SFTabOverviewItemContentView_setMediaStateIcon___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setMediaStateIcon:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.0;
  if (*(_QWORD *)(v2 + 528))
    v3 = 1.0;
  return objc_msgSend(*(id *)(v2 + 480), "setAlpha:", v3);
}

- (BOOL)isUnread
{
  return -[TabIconAndTitleView showsUnreadIndicator]((_BOOL8)self->_titleView);
}

- (void)setBorrowedContentView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v6 = (UIView *)a3;
  v5 = self->_borrowedContentView;
  if (self->_borrowedContentView != v6
    || ((-[UIView isDescendantOfView:](v6, "isDescendantOfView:", self) ^ (self->_borrowedContentView == 0)) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_borrowedContentView, a3);
    if (-[UIView isDescendantOfView:](v5, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](v5, "removeFromSuperview");
    if (v6)
      -[UIView insertSubview:aboveSubview:](self->_snapshotClipperView, "insertSubview:aboveSubview:", v6, self->_headerBackgroundView);
    -[SFTabOverviewItemContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIView)borrowedContentView
{
  UIView *borrowedContentView;

  if (-[UIView isDescendantOfView:](self->_borrowedContentView, "isDescendantOfView:", self) != (self->_borrowedContentView == 0))
    borrowedContentView = self->_borrowedContentView;
  else
    borrowedContentView = 0;
  return borrowedContentView;
}

- (UIImage)snapshotImage
{
  return (UIImage *)-[TabSnapshotImageView image](self->_snapshotView, "image");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)focusEffect
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[TabSnapshotImageView frame](self->_snapshotView, "frame");
  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68]);
}

- (CGRect)attachedViewReferenceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_attachedViewReferenceRect.origin.x;
  y = self->_attachedViewReferenceRect.origin.y;
  width = self->_attachedViewReferenceRect.size.width;
  height = self->_attachedViewReferenceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (SFTabOverviewItemContentViewDelegate)delegate
{
  return (SFTabOverviewItemContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)enableDelegateLayoutNotification
{
  return self->_enableDelegateLayoutNotification;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (_SFBarTheme)topBarTheme
{
  return self->_topBarTheme;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)minYMatchesTopBarMaxYWhenZoomed
{
  return self->_minYMatchesTopBarMaxYWhenZoomed;
}

- (double)titleRevealPercent
{
  return self->_titleRevealPercent;
}

- (BOOL)allowsSnapshotTopBackdropUnderlap
{
  return self->_allowsSnapshotTopBackdropUnderlap;
}

- (BOOL)allowsBorrowedContentTopBackdropUnderlap
{
  return self->_allowsBorrowedContentTopBackdropUnderlap;
}

- (void)setAllowsBorrowedContentTopBackdropUnderlap:(BOOL)a3
{
  self->_allowsBorrowedContentTopBackdropUnderlap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_topBarTheme, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_attachedView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_snapshotClipperView, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_participantsBackgroundView, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_borrowedContentView, 0);
}

@end
