@implementation TabBarItemView

uint64_t __56__TabBarItemView__layoutTitleLabelUsingCachedTruncation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
}

- (void)_showOrHideCloseButton
{
  -[TabBarItemView _layoutTitleLabel](self, "_layoutTitleLabel");
  -[TabBarItemView _layoutEdges](self, "_layoutEdges");
  -[TabBarItemView _layoutCloseButton](self, "_layoutCloseButton");
  -[TabBarItemView _updateCloseButtonAlpha](self, "_updateCloseButtonAlpha");
  -[TabBarItemView _updateIconViewVisibility](self, "_updateIconViewVisibility");
}

- (void)_layoutEdges
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int64_t v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  void (**v16)(_QWORD);
  double MinX;
  id WeakRetained;
  char v19;
  _QWORD aBlock[11];
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[TabBarItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[TabBarItemView _physicalEdgeForLogicalEdge:](self, "_physicalEdgeForLogicalEdge:", self->_visibleEdge);
  if (!v11
    || (v12 = v11,
        v21.origin.x = v4,
        v21.origin.y = v6,
        v21.size.width = v8,
        v21.size.height = v10,
        CGRectEqualToRect(v21, *MEMORY[0x1E0C9D648])))
  {
    -[UIVisualEffectView setHidden:](self->_borderEffectsView, "setHidden:", 1);
    return;
  }
  _SFOnePixel();
  v14 = v13;
  v15 = 0.0;
  if (v12 != 1)
  {
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    v15 = CGRectGetMaxX(v22) - v14;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__TabBarItemView__layoutEdges__block_invoke;
  aBlock[3] = &unk_1E9CF7820;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v15;
  *(double *)&aBlock[6] = v14;
  *(CGFloat *)&aBlock[7] = v4;
  *(CGFloat *)&aBlock[8] = v6;
  *(CGFloat *)&aBlock[9] = v8;
  *(CGFloat *)&aBlock[10] = v10;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[UIVisualEffectView frame](self->_borderEffectsView, "frame");
  MinX = CGRectGetMinX(v23);
  if (MinX != 0.0 && v15 != 0.0 && MinX != v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
    if (objc_msgSend(WeakRetained, "isDraggingItem"))
    {

    }
    else
    {
      v19 = -[UIVisualEffectView isHidden](self->_borderEffectsView, "isHidden");

      if ((v19 & 1) == 0)
      {
        v16[2](v16);
        goto LABEL_13;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v16);
LABEL_13:

}

- (void)_layoutCloseButton
{
  double v3;
  double v4;
  CGFloat Height;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  -[TabBarItemView _closeButtonFrame](self, "_closeButtonFrame");
  v7 = CGRectOffset(v6, self->_contentOffset, 0.0);
  -[UIButton setFrame:](self->_closeButton, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  -[UIImageView sizeThatFits:](self->_closeButtonImageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[UIVisualEffectView setBounds:](self->_closeButtonEffectsView, "setBounds:", 0.0, 0.0, v3, v4);
  -[UIButton bounds](self->_closeButton, "bounds");
  Height = CGRectGetHeight(v8);
  -[UIVisualEffectView setCenter:](self->_closeButtonEffectsView, "setCenter:", Height * 0.5, Height * 0.5);
  -[UIVisualEffectView frame](self->_closeButtonEffectsView, "frame");
  _SFRoundRectToPixels();
  -[UIVisualEffectView setFrame:](self->_closeButtonEffectsView, "setFrame:");
  -[UIVisualEffectView bounds](self->_closeButtonEffectsView, "bounds");
  -[UIImageView setFrame:](self->_closeButtonImageView, "setFrame:");
}

- (CGRect)_closeButtonFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TabBarItemView bounds](self, "bounds");
  -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  _SFRoundRectToPixels();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_layoutTitleLabel
{
  NSString *truncatedTitleText;

  truncatedTitleText = self->_truncatedTitleText;
  self->_truncatedTitleText = 0;

  -[TabBarItemView _layoutTitleLabelUsingCachedTruncation](self, "_layoutTitleLabelUsingCachedTruncation");
}

- (void)setHidesTitleText:(BOOL)a3
{
  self->_hidesTitleText = a3;
  -[UILabel setHidden:](self->_titleLabel, "setHidden:");
  -[TabBarItemView _updateIconViewVisibility](self, "_updateIconViewVisibility");
  -[TabBarItemView _showOrHideCloseButton](self, "_showOrHideCloseButton");
}

- (void)_layoutTitleLabelUsingCachedTruncation
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
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  double v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *truncatedTitleText;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  int v39;
  double MinX;
  double v41;
  double MaxX;
  CGFloat v43;
  double v44;
  double v45;
  int v46;
  double MidX;
  double v48;
  double contentOffset;
  int64_t v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  unsigned int v55;
  void *v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  CGFloat x;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  CGFloat rect;
  double rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat rect_24a;
  double v86;
  CGFloat height;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  __int128 v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  -[TabBarItemView _titleBounds](self, "_titleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TabBarItemView _titleBoundingBox](self, "_titleBoundingBox");
  rect_24 = v11;
  v13 = v12;
  v88 = v14;
  v89 = v15;
  v16 = +[TabIconAndTitleView defaultTabIconSize]();
  v18 = v17;
  v19 = -[TabBarItemView _iconPosition](self, "_iconPosition");
  v79 = v16 + 4.0;
  v80 = v18;
  if (v19 == 1)
    v20 = v16 + 4.0;
  else
    v20 = 0.0;
  v91 = v16;
  if (!self->_truncatedTitleText)
  {
    -[UILabel font](self->_titleLabel, "font");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = *MEMORY[0x1E0C9D820];
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
    objc_msgSend(WeakRetained, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safari_mapObjectsUsingBlock:", &__block_literal_global_48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSString truncatedTitleWithFont:desiredWidth:truncatedSize:tabBarItemTitles:](self->_titleText, "truncatedTitleWithFont:desiredWidth:truncatedSize:tabBarItemTitles:", v21, &v92, v24, v88 - v20);
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    truncatedTitleText = self->_truncatedTitleText;
    self->_truncatedTitleText = v25;

    -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_truncatedTitleText, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v21, 4, v88 - v20, v89);
    self->_truncatedTitleTextSize.width = v27;
    self->_truncatedTitleTextSize.height = v28;
    v29 = *(double *)&v92;
    self->_titleWasTruncated = *(double *)&v92 > v88;
    -[UILabel setText:](self->_titleLabel, "setText:", self->_truncatedTitleText, v29);

  }
  _SFCeilingFloatToPixels();
  v31 = v30;
  v76 = v8;
  _SFRoundFloatToPixels();
  v78 = v4;
  v33 = v4 + v32;
  rect = v4 + v32;
  v75 = v10;
  _SFRoundFloatToPixels();
  v77 = v6;
  v34 = v20;
  v36 = v6 + v35;
  v86 = v34;
  _SFCeilingFloatToPixels();
  v38 = v37;
  v39 = -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v93.origin.x = v33;
  v93.origin.y = v36;
  v93.size.width = v38;
  v93.size.height = v31;
  rect_8 = CGRectGetMinX(v93);
  v94.origin.x = rect_24;
  v94.origin.y = v13;
  v94.size.width = v88;
  v94.size.height = v89;
  MinX = CGRectGetMinX(v94);
  v95.origin.x = rect_24;
  v95.origin.y = v13;
  v41 = v38;
  v95.size.width = v88;
  v95.size.height = v89;
  MaxX = CGRectGetMaxX(v95);
  v96.origin.x = rect;
  v90 = v36;
  v96.origin.y = v36;
  v96.size.width = v38;
  v43 = v31;
  v96.size.height = v31;
  v44 = fmax(MinX, fmin(MaxX - CGRectGetWidth(v96), rect_8));
  if (v19 == 3)
  {
    v45 = v91 * 0.5 + 4.0;
    v46 = -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    -[TabBarItemView bounds](self, "bounds");
    MidX = CGRectGetMidX(v97);
    if (v46)
    {
      v44 = v45 + MidX;
    }
    else
    {
      v48 = MidX - v45;
      v98.origin.x = v44;
      v98.origin.y = v36;
      v98.size.width = v41;
      v98.size.height = v31;
      v44 = v48 - CGRectGetWidth(v98);
    }
  }
  contentOffset = self->_contentOffset;
  v50 = -[TabBarItemView _physicalEdgeForLogicalEdge:](self, "_physicalEdgeForLogicalEdge:", self->_titleAnchorEdge);
  if (v50 == 2)
  {
    contentOffset = contentOffset - self->_titleAnchorAdditionalOffset;
  }
  else if (v50 == 1)
  {
    contentOffset = contentOffset + self->_titleAnchorAdditionalOffset;
  }
  v51 = v41 - v86;
  v52 = -0.0;
  if (((v19 == 1) & v39) != 0)
    v52 = v79;
  v53 = v52 + v44 + contentOffset;
  if (v19)
    v54 = !self->_hidesTitleText;
  else
    v54 = 0;
  v55 = v54;
  -[UIImageView setAlpha:](self->_iconView, "setAlpha:", (double)v55);
  -[UIImageView setBounds:](self->_iconView, "setBounds:", 0.0, 0.0, v91, v80);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v56);

  LODWORD(v56) = -[TabBarItemView _hasRoomForIconAndCloseButton](self, "_hasRoomForIconAndCloseButton");
  -[TabBarItemView bounds](self, "bounds");
  v61 = v57;
  v62 = v58;
  v63 = v59;
  v64 = v60;
  if ((_DWORD)v56)
  {
    v99.origin.x = v53;
    v99.origin.y = v90;
    v99.size.height = v43;
    v99.size.width = v51;
    CGRectGetMidY(v99);
    if (v19 != 3)
    {
      v65 = v53;
      v66 = v90;
      v67 = v51;
      v68 = v43;
      if (v39)
        CGRectGetMinX(*(CGRect *)&v65);
      else
        CGRectGetMaxX(*(CGRect *)&v65);
      goto LABEL_32;
    }
LABEL_29:
    v103.origin.x = v61;
    v103.origin.y = v62;
    v103.size.width = v63;
    v103.size.height = v64;
    CGRectGetMidX(v103);
    goto LABEL_32;
  }
  CGRectGetMidY(*(CGRect *)&v57);
  if (v19 == 3)
    goto LABEL_29;
  v100.origin.y = v77;
  v100.origin.x = v78;
  v100.size.height = v75;
  v100.size.width = v76;
  v101 = CGRectOffset(v100, contentOffset, 0.0);
  x = v101.origin.x;
  rect_16 = v101.origin.y;
  rect_24a = v101.size.width;
  height = v101.size.height;
  v70 = v53;
  v71 = v90;
  v72 = v51;
  v73 = v43;
  if (v39)
  {
    CGRectGetMinX(*(CGRect *)&v70);
    v102.size.height = height;
    v102.origin.x = x;
    v102.origin.y = rect_16;
    v102.size.width = rect_24a;
    CGRectGetMinX(v102);
  }
  else
  {
    CGRectGetMaxX(*(CGRect *)&v70);
    v104.size.height = height;
    v104.origin.x = x;
    v104.origin.y = rect_16;
    v104.size.width = rect_24a;
    CGRectGetMaxX(v104);
  }
LABEL_32:
  _SFRoundPointToPixels();
  -[UIImageView setCenter:](self->_iconView, "setCenter:");
  _SFRoundRectToPixels();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v74 = 0.0;
  if (v19 != 3)
    v74 = 1.0;
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v74);
  -[TabBarItemView _updateCloseButtonAlpha](self, "_updateCloseButtonAlpha");
  -[TabBarItemView _updateMediaStateButtonButtonAlpha](self, "_updateMediaStateButtonButtonAlpha");
}

- (int64_t)_physicalEdgeForLogicalEdge:(int64_t)a3
{
  if (a3 == 2)
  {
    if (-[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      return 2;
    else
      return 1;
  }
  else if (a3 == 1)
  {
    if (-[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      return 1;
    else
      return 2;
  }
  else
  {
    return 0;
  }
}

- (CGRect)_titleBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double titleLayoutWidth;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[TabBarItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  titleLayoutWidth = v7;
  v10 = v9;
  if (self->_titleLayoutWidth != 0.0)
  {
    v11 = -[TabBarItemView _physicalEdgeForLogicalEdge:](self, "_physicalEdgeForLogicalEdge:", self->_titleAnchorEdge);
    if (v11 == 2)
    {
      v4 = v4 - (self->_titleLayoutWidth - titleLayoutWidth);
      titleLayoutWidth = self->_titleLayoutWidth;
    }
    else if (v11 == 1)
    {
      titleLayoutWidth = self->_titleLayoutWidth;
    }
  }
  v12 = v4;
  v13 = v6;
  v14 = titleLayoutWidth;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_updateIconViewVisibility
{
  _BOOL8 v3;

  v3 = self->_hidesTitleText || -[TabBarItemView _iconPosition](self, "_iconPosition") == 0;
  -[UIImageView setHidden:](self->_iconView, "setHidden:", v3);
}

- (BOOL)_hasRoomForIconAndCloseButton
{
  double Width;
  id WeakRetained;
  double v5;
  BOOL v6;
  CGRect v8;

  -[TabBarItemView bounds](self, "bounds");
  Width = CGRectGetWidth(v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  objc_msgSend(WeakRetained, "minimumTabWidth");
  v6 = Width > v5 + +[TabIconAndTitleView defaultTabIconSize]() + 4.0;

  return v6;
}

- (void)_updateCloseButtonAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[6];
  CGRect v17;

  -[TabBarItemView bounds](self, "bounds");
  v4 = v3;
  -[UILabel frame](self->_titleLabel, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
  {
    v13 = v6 + 1.0 - v4;
  }
  else
  {
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v12;
    v13 = -1.0 - CGRectGetMaxX(v17);
  }
  v14 = 0.0;
  if (v13 <= 0.0)
    v14 = (double)-[TabBarItemView _showsCloseButton](self, "_showsCloseButton");
  -[UIButton alpha](self->_closeButton, "alpha");
  if (v15 != v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__TabBarItemView__updateCloseButtonAlpha__block_invoke;
    v16[3] = &unk_1E9CF2538;
    v16[4] = self;
    *(double *)&v16[5] = v14;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v16, 0.2);
  }
}

- (void)_updateMediaStateButtonButtonAlpha
{
  double v3;
  double v4;
  _QWORD v5[6];
  CGRect v6;

  -[TabBarItemView bounds](self, "bounds");
  v3 = 0.0;
  if (CGRectGetWidth(v6) >= self->_titleLayoutWidth)
    v3 = (double)(-[TabBarItemView _isPinnedAndNarrow](self, "_isPinnedAndNarrow") ^ 1);
  -[UIButton alpha](self->_mediaStateMuteButton, "alpha");
  if (v4 != v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__TabBarItemView__updateMediaStateButtonButtonAlpha__block_invoke;
    v5[3] = &unk_1E9CF2538;
    v5[4] = self;
    *(double *)&v5[5] = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.2);
  }
}

- (CGRect)_titleBoundingBox
{
  double height;
  double x;
  CGFloat y;
  double width;
  int v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MaxX;
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
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  -[TabBarItemView _titleBounds](self, "_titleBounds");
  height = v32.size.height;
  v33 = CGRectInset(v32, 12.0, 12.0);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  v7 = -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  if (-[TabBarItemView _showsCloseButton](self, "_showsCloseButton") || self->_icon || _SFDeviceIsPad())
  {
    -[TabBarItemView _closeButtonFrame](self, "_closeButtonFrame");
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    if (v7)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v8);
    }
    else
    {
      -[TabBarItemView bounds](self, "bounds");
      v31 = height;
      v17 = y;
      v18 = CGRectGetWidth(v34);
      v35.origin.x = v12;
      v35.origin.y = v13;
      v35.size.width = v14;
      v35.size.height = v15;
      MaxX = v18 - CGRectGetMinX(v35);
      y = v17;
      height = v31;
    }
    v19 = MaxX + -12.0;
    v20 = -0.0;
    if (v7)
      v20 = v19;
    x = x + v20;
    width = width - v19;
  }
  if (self->_mediaStateIcon)
  {
    -[UIButton frame](self->_mediaStateMuteButton, "frame");
    v22 = -0.0;
    if (!v7)
      v22 = v21 + 6.0;
    x = x + v22;
    width = width - (v21 + 6.0);
  }
  if (-[TabBarItemView _showsParticipants](self, "_showsParticipants"))
  {
    -[SFAvatarStackView bounds](self->_participantsView, "bounds");
    v23 = CGRectGetWidth(v36) + 6.0;
    v24 = -0.0;
    if (!v7)
      v24 = v23;
    x = x + v24;
    width = width - v23;
  }
  if (-[TabBarItemView _showsUnreadIndicator](self, "_showsUnreadIndicator"))
  {
    -[SFUnreadIndicator bounds](self->_unreadIndicator, "bounds");
    v25 = CGRectGetWidth(v37) + 6.0;
    v26 = -0.0;
    if (!v7)
      v26 = v25;
    x = x + v26;
    width = width - v25;
  }
  v27 = height + -12.0;
  v28 = x;
  v29 = y;
  v30 = width;
  result.size.height = v27;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)_showsCloseButton
{
  if (self->_pinned && !self->_hidesTitleText)
    return !-[TabBarItemView _isPinnedAndNarrow](self, "_isPinnedAndNarrow");
  if (-[TabBarItemView _isHovering](self, "_isHovering"))
    return 1;
  return self->_active;
}

- (BOOL)_isHovering
{
  CGRect v4;

  if ((unint64_t)(-[UIHoverGestureRecognizer state](self->_hoverRecognizer, "state") - 1) > 1)
    return 0;
  -[TabBarItemView bounds](self, "bounds");
  return CGRectGetWidth(v4) >= self->_titleLayoutWidth;
}

- (BOOL)_showsParticipants
{
  NSUInteger v3;
  double v4;
  double v5;
  double v6;

  if (-[TabBarItemView _isPinnedAndNarrow](self, "_isPinnedAndNarrow"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[NSArray count](self->_shareParticipants, "count");
    if (v3)
    {
      -[TabBarItemView _contentWidthIgnoringCollaborationViews](self, "_contentWidthIgnoringCollaborationViews");
      v5 = v4;
      -[SFAvatarStackView sizeForParticipantCount:](self->_participantsView, "sizeForParticipantCount:", -[NSArray count](self->_shareParticipants, "count"));
      LOBYTE(v3) = self->_titleLayoutWidth >= v5 + v6 + 6.0;
    }
  }
  return v3;
}

- (BOOL)_showsUnreadIndicator
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  if (-[TabBarItemView _isPinnedAndNarrow](self, "_isPinnedAndNarrow") || !self->_unread)
    return 0;
  -[TabBarItemView _contentWidthIgnoringCollaborationViews](self, "_contentWidthIgnoringCollaborationViews");
  v4 = v3;
  -[TabBarItemView shareParticipants](self, "shareParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[SFAvatarStackView sizeForParticipantCount:](self->_participantsView, "sizeForParticipantCount:", -[NSArray count](self->_shareParticipants, "count"));
    v7 = v6 + 6.0;
  }
  else
  {
    v7 = 0.0;
  }
  v9 = v4 + v7;
  -[SFUnreadIndicator intrinsicContentSize](self->_unreadIndicator, "intrinsicContentSize");
  v11 = v9 + v10 + 6.0;

  return self->_titleLayoutWidth >= v11;
}

- (int64_t)_iconPosition
{
  if (-[TabBarItemView _isPinnedAndNarrow](self, "_isPinnedAndNarrow"))
    return 3;
  if (!self->_icon)
    return 0;
  if (-[TabBarItemView _hasRoomForIconAndCloseButton](self, "_hasRoomForIconAndCloseButton"))
    return 1;
  if (self->_icon && !-[TabBarItemView _showsCloseButton](self, "_showsCloseButton"))
    return 2;
  else
    return 0;
}

- (BOOL)_isPinnedAndNarrow
{
  return self->_pinned && self->_titleLayoutWidth < 50.0;
}

uint64_t __52__TabBarItemView__updateMediaStateButtonButtonAlpha__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setVisibleEdge:(int64_t)a3
{
  if (self->_visibleEdge != a3)
  {
    self->_visibleEdge = a3;
    -[TabBarItemView _layoutEdges](self, "_layoutEdges");
    -[TabBarItemView _layoutTitleClipperView](self, "_layoutTitleClipperView");
  }
}

- (void)setTitleLayoutWidth:(double)a3
{
  NSString *truncatedTitleText;

  if (self->_titleLayoutWidth != a3)
  {
    self->_titleLayoutWidth = a3;
    truncatedTitleText = self->_truncatedTitleText;
    self->_truncatedTitleText = 0;

    -[TabBarItemView _updateIconViewVisibility](self, "_updateIconViewVisibility");
  }
}

- (void)setContentOffset:(double)a3
{
  if (self->_contentOffset != a3)
  {
    self->_contentOffset = a3;
    -[TabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TabBarItemView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)TabBarItemView;
  -[TabBarItemView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  -[TabBarItemView bounds](self, "bounds");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    -[TabBarItemView _layoutCloseButton](self, "_layoutCloseButton");
    -[TabBarItemView _layoutEdges](self, "_layoutEdges");
    -[TabBarItemView _layoutTitleClipperView](self, "_layoutTitleClipperView");
    -[TabBarItemView _layoutMediaStateIndicator](self, "_layoutMediaStateIndicator");
    -[TabBarItemView _updateShowsParticipants](self, "_updateShowsParticipants");
    -[TabBarItemView _updateShowsUnreadIndicator](self, "_updateShowsUnreadIndicator");
    if (-[TabBarItemView _canUseCachedTitleTruncationOnBoundsChange](self, "_canUseCachedTitleTruncationOnBoundsChange"))
    {
      -[TabBarItemView _layoutTitleLabelUsingCachedTruncation](self, "_layoutTitleLabelUsingCachedTruncation");
    }
    else
    {
      -[TabBarItemView _layoutTitleLabel](self, "_layoutTitleLabel");
    }
  }
}

- (void)setTitleAnchorAdditionalOffset:(double)a3
{
  if (self->_titleAnchorAdditionalOffset != a3)
  {
    self->_titleAnchorAdditionalOffset = a3;
    -[TabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateShowsUnreadIndicator
{
  _BOOL4 v3;
  char v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];

  v3 = -[TabBarItemView _showsUnreadIndicator](self, "_showsUnreadIndicator");
  v4 = v3 ^ -[SFUnreadIndicator isHidden](self->_unreadIndicator, "isHidden");
  v5 = MEMORY[0x1E0C809B0];
  if (v3 && -[SFUnreadIndicator isHidden](self->_unreadIndicator, "isHidden"))
  {
    -[SFUnreadIndicator setHidden:](self->_unreadIndicator, "setHidden:", 0);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke;
    v10[3] = &unk_1E9CF1900;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
  }
  v7[4] = self;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_2;
  v8[3] = &unk_1E9CF1EE8;
  v8[4] = self;
  v9 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_3;
  v7[3] = &unk_1E9CF16A0;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, v8, v7);
  if ((v4 & 1) == 0)
  {
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_4;
    v6[3] = &unk_1E9CF1900;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
  }
}

- (void)_updateShowsParticipants
{
  int v3;
  NSArray *shareParticipants;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = -[TabBarItemView _showsParticipants](self, "_showsParticipants");
  if (v3)
    shareParticipants = self->_shareParticipants;
  else
    shareParticipants = (NSArray *)MEMORY[0x1E0C9AA60];
  v5 = shareParticipants;
  if (v3 == -[SFAvatarStackView isHidden](self->_participantsView, "isHidden"))
  {
    v8 = 1;
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[SFAvatarStackView shareParticipants](self->_participantsView, "shareParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7 != -[NSArray count](v5, "count");

  if (v3)
LABEL_8:
    -[SFAvatarStackView setHidden:](self->_participantsView, "setHidden:", 0);
LABEL_9:
  -[SFAvatarStackView setShareParticipants:](self->_participantsView, "setShareParticipants:", v5);
  v9 = MEMORY[0x1E0C809B0];
  v11[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__TabBarItemView__updateShowsParticipants__block_invoke;
  v12[3] = &unk_1E9CF1900;
  v12[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__TabBarItemView__updateShowsParticipants__block_invoke_2;
  v11[3] = &unk_1E9CF16A0;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 1, v12, v11);
  if (v8)
  {
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __42__TabBarItemView__updateShowsParticipants__block_invoke_3;
    v10[3] = &unk_1E9CF1900;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
  }

}

- (void)_layoutTitleClipperView
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  -[TabBarItemView bounds](self, "bounds");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  _SFOnePixel();
  v10 = v9;
  v11 = -[TabBarItemView _physicalEdgeForLogicalEdge:](self, "_physicalEdgeForLogicalEdge:", self->_visibleEdge);
  v12 = width - v10;
  v13 = x + v10;
  v14 = MidX + v10 * 0.5;
  if (v11 == 1)
  {
    v15 = width - v10;
  }
  else
  {
    v13 = x;
    v14 = MidX;
    v15 = width;
  }
  if (v11 == 2)
  {
    v16 = MidX + v10 * -0.5;
  }
  else
  {
    x = v13;
    v16 = v14;
  }
  if (v11 == 2)
    v17 = v12;
  else
    v17 = v15;
  -[UIView setBounds:](self->_titleClipperView, "setBounds:", x, y, v17, height, y, v15);
  -[UIView setPosition:](self->_titleClipperView, "setPosition:", v16, MidY);
  -[UIView setBounds:](self->_iconClipperView, "setBounds:", x, y, v17, height);
  -[UIView setPosition:](self->_iconClipperView, "setPosition:", v16, MidY);
}

- (void)_layoutMediaStateIndicator
{
  void *v3;
  void *v4;

  -[UIButton superview](self->_mediaStateMuteButton, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TabBarItemView bounds](self, "bounds");
    -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    -[UIButton imageForState:](self->_mediaStateMuteButton, "imageForState:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");

    _SFRoundRectToPixels();
    -[UIButton setFrame:](self->_mediaStateMuteButton, "setFrame:");
  }
}

- (BOOL)_canUseCachedTitleTruncationOnBoundsChange
{
  return (unint64_t)(self->_titleAnchorEdge - 1) < 2;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "_showsUnreadIndicator") ^ 1);
}

uint64_t __42__TabBarItemView__updateShowsParticipants__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "_showsParticipants") ^ 1);
}

- (TabBarItemView)initWithTabBar:(id)a3
{
  id v4;
  TabBarItemView *v5;
  void *v6;
  UIButton *v7;
  UIButton *closeButton;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *closeButtonImageView;
  UIButton *v13;
  UIButton *mediaStateMuteButton;
  UILabel *v15;
  UILabel *titleLabel;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  UIImageView *iconView;
  SFUnreadIndicator *v22;
  SFUnreadIndicator *unreadIndicator;
  void *v24;
  SFAvatarStackView *v25;
  SFAvatarStackView *participantsView;
  UIView *v27;
  UIView *titleClipperView;
  UIVisualEffectView *v29;
  UIVisualEffectView *borderEffectsView;
  void *v31;
  void *v32;
  UIVisualEffectView *v33;
  UIVisualEffectView *contentEffectsView;
  UIVisualEffectView *v35;
  UIVisualEffectView *closeButtonEffectsView;
  void *v37;
  void *v38;
  UIView *v39;
  UIView *iconClipperView;
  uint64_t v41;
  UIHoverGestureRecognizer *hoverRecognizer;
  id v43;
  uint64_t v44;
  UIView *highlightView;
  void *v46;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id location;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)TabBarItemView;
  v5 = -[TabBarItemView initWithFrame:](&v53, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_initWeak(&location, v5);
    objc_storeWeak((id *)&v5->_tabBar, v4);
    -[TabBarItemView layer](v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    v7 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    closeButton = v5->_closeButton;
    v5->_closeButton = v7;

    -[UIButton setAccessibilityIdentifier:](v5->_closeButton, "setAccessibilityIdentifier:", CFSTR("CloseTabBarItemButton"));
    -[UIButton setAlpha:](v5->_closeButton, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "_sf_staticConfigurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __33__TabBarItemView_initWithTabBar___block_invoke;
    v50[3] = &unk_1E9CF2DC0;
    objc_copyWeak(&v51, &location);
    -[UIButton setPointerStyleProvider:](v5->_closeButton, "setPointerStyleProvider:", v50);
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("xmark.noshape"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    closeButtonImageView = v5->_closeButtonImageView;
    v5->_closeButtonImageView = (UIImageView *)v11;

    -[UIImageView setPreferredSymbolConfiguration:](v5->_closeButtonImageView, "setPreferredSymbolConfiguration:", v48);
    v13 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    mediaStateMuteButton = v5->_mediaStateMuteButton;
    v5->_mediaStateMuteButton = v13;

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v15;

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v17);

    v18 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithImage:", v19);
    iconView = v5->_iconView;
    v5->_iconView = (UIImageView *)v20;

    -[UIImageView setContentMode:](v5->_iconView, "setContentMode:", 1);
    v22 = (SFUnreadIndicator *)objc_alloc_init(MEMORY[0x1E0D4EED0]);
    unreadIndicator = v5->_unreadIndicator;
    v5->_unreadIndicator = v22;

    -[SFUnreadIndicator setHidden:](v5->_unreadIndicator, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnreadIndicator setTintColor:](v5->_unreadIndicator, "setTintColor:", v24);

    v25 = (SFAvatarStackView *)objc_alloc_init(MEMORY[0x1E0D4EBC0]);
    participantsView = v5->_participantsView;
    v5->_participantsView = v25;

    -[SFAvatarStackView setHidden:](v5->_participantsView, "setHidden:", 1);
    v27 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    titleClipperView = v5->_titleClipperView;
    v5->_titleClipperView = v27;

    -[UIView setClipsToBounds:](v5->_titleClipperView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v5->_titleClipperView, "addSubview:", v5->_titleLabel);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TabBarItemView.content.%p"), v4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    borderEffectsView = v5->_borderEffectsView;
    v5->_borderEffectsView = v29;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v5->_borderEffectsView, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v31);

    -[UIVisualEffectView _setGroupName:](v5->_borderEffectsView, "_setGroupName:", v49);
    -[TabBarItemView addSubview:](v5, "addSubview:", v5->_borderEffectsView);
    v33 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    contentEffectsView = v5->_contentEffectsView;
    v5->_contentEffectsView = v33;

    -[TabBarItemView bounds](v5, "bounds");
    -[UIVisualEffectView setFrame:](v5->_contentEffectsView, "setFrame:");
    -[UIVisualEffectView setAutoresizingMask:](v5->_contentEffectsView, "setAutoresizingMask:", 18);
    -[UIVisualEffectView _setGroupName:](v5->_contentEffectsView, "_setGroupName:", v49);
    -[TabBarItemView addSubview:](v5, "addSubview:", v5->_contentEffectsView);
    v35 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    closeButtonEffectsView = v5->_closeButtonEffectsView;
    v5->_closeButtonEffectsView = v35;

    -[UIVisualEffectView _setGroupName:](v5->_closeButtonEffectsView, "_setGroupName:", v49);
    -[UIVisualEffectView setUserInteractionEnabled:](v5->_closeButtonEffectsView, "setUserInteractionEnabled:", 0);
    -[UIVisualEffectView contentView](v5->_closeButtonEffectsView, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v5->_closeButtonImageView);

    -[UIButton addSubview:](v5->_closeButton, "addSubview:", v5->_closeButtonEffectsView);
    -[TabBarItemView addSubview:](v5, "addSubview:", v5->_closeButton);
    -[UIVisualEffectView contentView](v5->_contentEffectsView, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v5->_titleClipperView);

    v39 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    iconClipperView = v5->_iconClipperView;
    v5->_iconClipperView = v39;

    -[UIView setClipsToBounds:](v5->_iconClipperView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v5->_iconClipperView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v5->_iconClipperView, "addSubview:", v5->_iconView);
    -[UIView addSubview:](v5->_iconClipperView, "addSubview:", v5->_unreadIndicator);
    -[UIView addSubview:](v5->_iconClipperView, "addSubview:", v5->_participantsView);
    -[TabBarItemView addSubview:](v5, "addSubview:", v5->_iconClipperView);
    -[TabBarItemView _layoutEdges](v5, "_layoutEdges");
    -[TabBarItemView _layoutTitleClipperView](v5, "_layoutTitleClipperView");
    -[TabBarItemView _layoutTitleLabel](v5, "_layoutTitleLabel");
    -[TabBarItemView updateTabBarStyle](v5, "updateTabBarStyle");
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v5, sel__hover_);
    hoverRecognizer = v5->_hoverRecognizer;
    v5->_hoverRecognizer = (UIHoverGestureRecognizer *)v41;

    -[TabBarItemView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_hoverRecognizer);
    v43 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[TabBarItemView bounds](v5, "bounds");
    v44 = objc_msgSend(v43, "initWithFrame:");
    highlightView = v5->_highlightView;
    v5->_highlightView = (UIView *)v44;

    -[UIView setAutoresizingMask:](v5->_highlightView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_separateTabBarHighlightColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_highlightView, "setBackgroundColor:", v46);

    -[UIView setAlpha:](v5->_highlightView, "setAlpha:", 0.0);
    -[UIView setUserInteractionEnabled:](v5->_highlightView, "setUserInteractionEnabled:", 0);
    -[TabBarItemView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v5->_highlightView, 0);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_updateCloseButtonEffect
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  v4 = objc_msgSend(WeakRetained, "tintStyle");

  if (v4)
  {
    if (self->_pinned)
      v5 = 5;
    else
      v5 = 4;
    objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", v5, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_closeButtonEffectsView, "setEffect:", v6);

  }
}

uint64_t __28__TabBarItemView_setActive___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateHighlightAlpha");
  objc_msgSend(*(id *)(a1 + 32), "_updateCloseButtonImage");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 480));
  v3 = objc_msgSend(WeakRetained, "tintStyle");

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 568))
    v4 = 3;
  else
    v4 = 4;
  objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setEffect:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_showOrHideCloseButton");
  return objc_msgSend(*(id *)(a1 + 32), "_updateMediaStateIndicator");
}

- (void)updateTabBarStyle
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  v4 = objc_msgSend(WeakRetained, "tintStyle");

  objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_borderEffectsView, "setEffect:", v5);

  if (self->_active)
    v6 = 3;
  else
    v6 = 4;
  objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_contentEffectsView, "setEffect:", v7);

  if (!mediaStateIconColor_colorForLightBars)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.25, 1.0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)mediaStateIconColor_colorForLightBars;
    mediaStateIconColor_colorForLightBars = v8;

  }
  if ((_SFIsDarkTintStyle() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (id)mediaStateIconColor_colorForLightBars;
  }
  v11 = v10;
  -[UIButton setTintColor:](self->_mediaStateMuteButton, "setTintColor:", v10);

  -[TabBarItemView _updateCloseButtonEffect](self, "_updateCloseButtonEffect");
}

- (void)_updateHighlightAlpha
{
  double v3;

  v3 = 0.0;
  if (!self->_active)
    v3 = (double)-[TabBarItemView _isHovering](self, "_isHovering", 0.0);
  -[UIView setAlpha:](self->_highlightView, "setAlpha:", v3);
}

- (void)_updateCloseButtonImage
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  id v6;

  if (self->_pinned)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    v4 = CFSTR("pin.fill");
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    if (!self->_active)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("xmark.noshape"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v4 = CFSTR("xmark.square.fill");
  }
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (id)v5;
  -[UIImageView setImage:](self->_closeButtonImageView, "setImage:", v5);

}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_2(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", (double)*(unint64_t *)&a2);
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 0.5;
  CGAffineTransformMakeScale(&v7, v3, v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  v6 = v7;
  return objc_msgSend(v4, "setTransform:", &v6);
}

uint64_t __41__TabBarItemView__updateCloseButtonAlpha__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setActive:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[5];

  if (self->_active != a3)
  {
    self->_active = a3;
    -[TabBarItemView setClipsToBounds:](self, "setClipsToBounds:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);

    if (WeakRetained)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __28__TabBarItemView_setActive___block_invoke;
      v5[3] = &unk_1E9CF1900;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
      -[UIButton setPointerInteractionEnabled:](self->_closeButton, "setPointerInteractionEnabled:", 0);
      -[UIButton setPointerInteractionEnabled:](self->_closeButton, "setPointerInteractionEnabled:", 1);
      -[TabBarItemView updateEntityAnnotationWithUUID:](self, "updateEntityAnnotationWithUUID:", self->_cachedUUIDForAnnotation);
    }
  }
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    -[TabBarItemView _updateShowsUnreadIndicator](self, "_updateShowsUnreadIndicator");
  }
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *titleText;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_titleText != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      titleText = self->_titleText;
      self->_titleText = v7;

      -[TabBarItemView _layoutTitleLabel](self, "_layoutTitleLabel");
      v5 = v9;
    }
  }

}

- (void)setTitleAnchorEdge:(int64_t)a3
{
  self->_titleAnchorEdge = a3;
}

- (void)setShareParticipants:(id)a3
{
  void *v4;
  char v5;
  NSArray *v6;
  NSArray *shareParticipants;
  id v8;

  v8 = a3;
  -[TabBarItemView shareParticipants](self, "shareParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToArray:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v6;

    -[TabBarItemView _updateShowsUnreadIndicator](self, "_updateShowsUnreadIndicator");
    -[TabBarItemView _updateShowsParticipants](self, "_updateShowsParticipants");
  }

}

- (void)setReordering:(BOOL)a3
{
  self->_reordering = a3;
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    self->_pinned = a3;
    -[UIButton setEnabled:](self->_closeButton, "setEnabled:", !a3);
    -[TabBarItemView _updateCloseButtonImage](self, "_updateCloseButtonImage");
    -[TabBarItemView _updateCloseButtonEffect](self, "_updateCloseButtonEffect");
    -[TabBarItemView _updateCloseButtonAlpha](self, "_updateCloseButtonAlpha");
    -[TabBarItemView _layoutCloseButton](self, "_layoutCloseButton");
    -[TabBarItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    -[TabBarItemView _updateMediaStateIndicator](self, "_updateMediaStateIndicator");
    -[TabBarItemView _updateShowsParticipants](self, "_updateShowsParticipants");
    -[TabBarItemView _updateShowsUnreadIndicator](self, "_updateShowsUnreadIndicator");
    -[TabBarItemView _layoutTitleLabel](self, "_layoutTitleLabel");
  }
}

- (void)setIsPlaceholder:(BOOL)a3
{
  if (self->_isPlaceholder != a3)
  {
    self->_isPlaceholder = a3;
    -[UIHoverGestureRecognizer setEnabled:](self->_hoverRecognizer, "setEnabled:", !a3);
  }
}

- (UIButton)mediaStateMuteButton
{
  return self->_mediaStateMuteButton;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)hidesTitleText
{
  return self->_hidesTitleText;
}

- (void)setIcon:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    if (self->_icon)
    {
      -[UIImageView setImage:](self->_iconView, "setImage:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_iconView, "setImage:", v6);

    }
    -[TabBarItemView _layoutTitleLabel](self, "_layoutTitleLabel");
    -[TabBarItemView _updateIconViewVisibility](self, "_updateIconViewVisibility");
    v5 = v7;
  }

}

uint64_t __42__TabBarItemView__updateShowsParticipants__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layOutParticipantsView");
  objc_msgSend(*(id *)(a1 + 32), "_layOutUnreadIndicator");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "layoutIfNeeded");
}

- (void)_layOutUnreadIndicator
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  double v12;
  void *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[TabBarItemView _titleBounds](self, "_titleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFUnreadIndicator intrinsicContentSize](self->_unreadIndicator, "intrinsicContentSize");
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGRectGetHeight(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  Width = CGRectGetWidth(v15);
  if (self->_mediaStateIcon)
  {
    -[UIButton bounds](self->_mediaStateMuteButton, "bounds", Width);
    Width = CGRectGetWidth(v16);
    v12 = 6.0;
  }
  -[TabBarItemView shareParticipants](self, "shareParticipants", Width, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[SFAvatarStackView bounds](self->_participantsView, "bounds");
    CGRectGetWidth(v17);
  }

  -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  _SFFlipRectInCoordinateSpace();
  _SFRoundRectToPixels();
  -[SFUnreadIndicator ss_setUntransformedFrame:](self->_unreadIndicator, "ss_setUntransformedFrame:");
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (void)_layOutParticipantsView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[TabBarItemView _titleBounds](self, "_titleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFAvatarStackView intrinsicContentSize](self->_participantsView, "intrinsicContentSize");
  v11.origin.x = v4;
  v11.origin.y = v6;
  v11.size.width = v8;
  v11.size.height = v10;
  CGRectGetHeight(v11);
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  CGRectGetWidth(v12);
  if (self->_mediaStateIcon)
  {
    -[UIButton bounds](self->_mediaStateMuteButton, "bounds");
    CGRectGetWidth(v13);
  }
  -[TabBarItemView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  _SFFlipRectInCoordinateSpace();
  _SFRoundRectToPixels();
  -[SFAvatarStackView setFrame:](self->_participantsView, "setFrame:");
}

- (void)_updateMediaStateIndicator
{
  unint64_t mediaStateIcon;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  mediaStateIcon = self->_mediaStateIcon;
  if (mediaStateIcon)
  {
    v5 = mediaStateIcon != 4 || self->_active;
    -[UIButton setUserInteractionEnabled:](self->_mediaStateMuteButton, "setUserInteractionEnabled:", v5);
    _SFImageForMediaStateIcon();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](self->_mediaStateMuteButton, "setImage:forState:", v9, 0);
    -[UIButton superview](self->_mediaStateMuteButton, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIVisualEffectView contentView](self->_contentEffectsView, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_mediaStateMuteButton);

    }
    -[TabBarItemView _layoutMediaStateIndicator](self, "_layoutMediaStateIndicator");

  }
  else
  {
    -[UIButton removeFromSuperview](self->_mediaStateMuteButton, "removeFromSuperview");
  }
}

uint64_t __30__TabBarItemView__layoutEdges__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setHidden:", 0);
  CGRectGetHeight(*(CGRect *)(a1 + 56));
  _SFRoundRectToPixels();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:");
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v5, 0.5, 0.5);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "_layOutUnreadIndicator");
}

uint64_t __45__TabBarItemView__updateShowsUnreadIndicator__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTitleLabel");
}

uint64_t __42__TabBarItemView__updateShowsParticipants__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTitleLabel");
}

- (double)_contentWidthIgnoringCollaborationViews
{
  double Width;
  double v4;
  double v5;
  CGRect v7;
  CGRect v8;

  -[TabBarItemView _closeButtonFrame](self, "_closeButtonFrame");
  Width = CGRectGetWidth(v7);
  if (minimumTitleWidth_onceToken != -1)
    dispatch_once(&minimumTitleWidth_onceToken, &__block_literal_global_209);
  v4 = *(double *)&minimumTitleWidth_minimumTitleWidth;
  if (self->_mediaStateIcon)
  {
    -[UIButton bounds](self->_mediaStateMuteButton, "bounds");
    v5 = CGRectGetWidth(v8) + 6.0;
  }
  else
  {
    v5 = 0.0;
  }
  return Width + 4.0 + v4 + v5;
}

id __33__TabBarItemView_initWithTabBar___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v6 = a3;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[54];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v10);
    if (objc_msgSend(v9, "isActive"))
    {
      objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0DC3B30];
      objc_msgSend(v10, "frame");
      objc_msgSend(v13, "shapeWithRoundedRect:");
    }
    else
    {
      objc_msgSend(v10, "frame");
      x = v29.origin.x;
      y = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      v19 = CGRectGetWidth(v29) + 8.0;
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v20 = fmax(fmax(v19, CGRectGetHeight(v30) + 8.0), 16.0);
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v21 = fmin((CGRectGetWidth(v31) - v20) * 0.5, 0.0);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v22 = fmin((CGRectGetHeight(v32) - v20) * 0.5, 0.0);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34 = CGRectInset(v33, v21, v22);
      v23 = v34.origin.x;
      v24 = v34.origin.y;
      v25 = v34.size.width;
      v26 = v34.size.height;
      objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v23, v24, v25, v26, 3.0);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v12, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  TabBarItemView *v8;
  TabBarItemView *v9;
  TabBarItemView *v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TabBarItemView bounds](self, "bounds");
  v13.x = x;
  v13.y = y;
  if (CGRectContainsPoint(v14, v13))
  {
    v12.receiver = self;
    v12.super_class = (Class)TabBarItemView;
    -[TabBarItemView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    v8 = (TabBarItemView *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 == self)
      v10 = 0;
    else
      v10 = v8;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TabBarItemView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)TabBarItemView;
  -[TabBarItemView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  -[TabBarItemView bounds](self, "bounds");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    -[TabBarItemView _layoutCloseButton](self, "_layoutCloseButton");
    -[TabBarItemView _layoutEdges](self, "_layoutEdges");
    -[TabBarItemView _layoutTitleClipperView](self, "_layoutTitleClipperView");
    -[TabBarItemView _layoutMediaStateIndicator](self, "_layoutMediaStateIndicator");
    -[TabBarItemView _updateShowsParticipants](self, "_updateShowsParticipants");
    -[TabBarItemView _updateShowsUnreadIndicator](self, "_updateShowsUnreadIndicator");
    if (-[TabBarItemView _canUseCachedTitleTruncationOnBoundsChange](self, "_canUseCachedTitleTruncationOnBoundsChange"))
    {
      -[TabBarItemView _layoutTitleLabelUsingCachedTruncation](self, "_layoutTitleLabelUsingCachedTruncation");
    }
    else
    {
      -[TabBarItemView _layoutTitleLabel](self, "_layoutTitleLabel");
    }
  }
}

- (void)_hover:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__TabBarItemView__hover___block_invoke;
  v6[3] = &unk_1E9CF1900;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __25__TabBarItemView__hover___block_invoke_2;
  v5[3] = &unk_1E9CF1900;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, 0.2, 0.0);
}

uint64_t __25__TabBarItemView__hover___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutCloseButton");
}

uint64_t __25__TabBarItemView__hover___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateHighlightAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_showOrHideCloseButton");
}

- (BOOL)_isHoveringOverCloseButton
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGPoint v15;
  CGRect v16;

  v3 = -[TabBarItemView _isHovering](self, "_isHovering");
  if (v3)
  {
    -[UIButton bounds](self->_closeButton, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIHoverGestureRecognizer locationInView:](self->_hoverRecognizer, "locationInView:", self->_closeButton);
    v15.x = v12;
    v15.y = v13;
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    LOBYTE(v3) = CGRectContainsPoint(v16, v15);
  }
  return v3;
}

- (void)updateEntityAnnotationWithUUID:(id)a3
{
  NSUUID *cachedUUIDForAnnotation;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_cachedUUIDForAnnotation, a3);
  cachedUUIDForAnnotation = self->_cachedUUIDForAnnotation;
  if (cachedUUIDForAnnotation)
    -[TabBarItemView safari_annotateWithTabUUID:isActive:](self, "safari_annotateWithTabUUID:isActive:", cachedUUIDForAnnotation, self->_active);

}

- (void)configureForDragPreview
{
  void *v3;
  void *v4;

  -[TabBarItemView _updateIconViewVisibility](self, "_updateIconViewVisibility");
  -[UIVisualEffectView setEffect:](self->_contentEffectsView, "setEffect:", 0);
  if (self->_active)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](self->_titleLabel, "setColor:", v3);

  -[UIVisualEffectView setEffect:](self->_closeButtonEffectsView, "setEffect:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_closeButton, "setTintColor:", v4);

  -[TabBarItemView _showOrHideCloseButton](self, "_showOrHideCloseButton");
  self->_titleAnchorEdge = 0;
  -[TabBarItemView setNeedsLayout](self, "setNeedsLayout");
  -[TabBarItemView layoutIfNeeded](self, "layoutIfNeeded");
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isReordering
{
  return self->_reordering;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (int64_t)visibleEdge
{
  return self->_visibleEdge;
}

- (double)titleLayoutWidth
{
  return self->_titleLayoutWidth;
}

- (int64_t)titleAnchorEdge
{
  return self->_titleAnchorEdge;
}

- (double)titleAnchorAdditionalOffset
{
  return self->_titleAnchorAdditionalOffset;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_mediaStateMuteButton, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_cachedUUIDForAnnotation, 0);
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_participantsView, 0);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_closeButtonImageView, 0);
  objc_storeStrong((id *)&self->_truncatedTitleText, 0);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_titleClipperView, 0);
  objc_storeStrong((id *)&self->_iconClipperView, 0);
  objc_storeStrong((id *)&self->_closeButtonEffectsView, 0);
  objc_storeStrong((id *)&self->_borderEffectsView, 0);
  objc_storeStrong((id *)&self->_contentEffectsView, 0);
}

@end
