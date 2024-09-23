@implementation AXElementNamesItemView

- (AXElementNamesItemView)initWithName:(id)a3 elementFrame:(CGRect)a4 availableBounds:(CGRect)a5 styleProvider:(id)a6 isSpacer:(BOOL)a7
{
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v18;
  id v19;
  AXElementNamesItemView *v20;
  void *v21;
  void (**v22)(void);
  uint64_t v23;
  id v24;
  UIView *backgroundView;
  uint64_t v26;
  UIImageView *backgroundMaskView;
  UILabel *v28;
  UILabel *label;
  void *v30;
  void *v31;
  uint64_t v32;
  objc_super v34;

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4.size.height;
  v14 = a4.size.width;
  v15 = a4.origin.y;
  v16 = a4.origin.x;
  v18 = a3;
  v19 = a6;
  v34.receiver = self;
  v34.super_class = (Class)AXElementNamesItemView;
  v20 = -[AXElementNamesItemView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v20)
  {
    objc_msgSend(v19, "itemBackgroundViewCreationHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v19, "itemBackgroundViewCreationHandler");
      v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v22[2]();
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0DC3F58]);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
      v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "initWithEffect:", v22);
    }
    backgroundView = v20->_backgroundView;
    v20->_backgroundView = (UIView *)v23;

    -[AXElementNamesItemView addSubview:](v20, "addSubview:", v20->_backgroundView);
    v26 = objc_opt_new();
    backgroundMaskView = v20->_backgroundMaskView;
    v20->_backgroundMaskView = (UIImageView *)v26;

    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v20->_label;
    v20->_label = v28;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20->_label, "setFont:", v30);

    -[UILabel setAdjustsFontForContentSizeCategory:](v20->_label, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20->_label, "setTextColor:", v31);

    -[UILabel setTextAlignment:](v20->_label, "setTextAlignment:", 1);
    -[AXElementNamesItemView addSubview:](v20, "addSubview:", v20->_label);
    v32 = 4;
    if (!v7)
      v32 = 0;
    v20->_labelPosition = v32;
    -[UILabel setText:](v20->_label, "setText:", v18);
    v20->_elementFrame.origin.x = v16;
    v20->_elementFrame.origin.y = v15;
    v20->_elementFrame.size.width = v14;
    v20->_elementFrame.size.height = v13;
    v20->_availableBounds.origin.x = x;
    v20->_availableBounds.origin.y = y;
    v20->_availableBounds.size.width = width;
    v20->_availableBounds.size.height = height;
    v20->_isSpacer = v7;
    -[AXElementNamesItemView _updateLabelContainerSize](v20, "_updateLabelContainerSize");
    -[AXElementNamesItemView _updateFromMainProperties](v20, "_updateFromMainProperties");
  }

  return v20;
}

- (NSString)name
{
  return -[UILabel text](self->_label, "text");
}

- (void)setLabelPosition:(int64_t)a3
{
  if (self->_labelPosition != a3)
  {
    self->_labelPosition = a3;
    -[AXElementNamesItemView _updateFromMainProperties](self, "_updateFromMainProperties");
  }
}

- (void)setForcedLabelContainerSize:(CGSize)a3
{
  if (self->_forcedLabelContainerSize.width != a3.width || self->_forcedLabelContainerSize.height != a3.height)
  {
    self->_forcedLabelContainerSize = a3;
    -[AXElementNamesItemView _updateLabelContainerSize](self, "_updateLabelContainerSize");
    -[AXElementNamesItemView _updateFromMainProperties](self, "_updateFromMainProperties");
  }
}

- (void)setLabelContainerFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_labelContainerFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_labelContainerFrame = &self->_labelContainerFrame;
  if (!CGRectEqualToRect(self->_labelContainerFrame, a3))
  {
    p_labelContainerFrame->origin.x = x;
    p_labelContainerFrame->origin.y = y;
    p_labelContainerFrame->size.width = width;
    p_labelContainerFrame->size.height = height;
    -[AXElementNamesItemView _updateFromLabelContainerFrame](self, "_updateFromLabelContainerFrame");
  }
}

- (BOOL)collidesWithView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v4 = a3;
  -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "labelContainerFrame");
  v51.origin.x = v13;
  v51.origin.y = v14;
  v51.size.width = v15;
  v51.size.height = v16;
  v43.origin.x = v6;
  v43.origin.y = v8;
  v43.size.width = v10;
  v43.size.height = v12;
  if (CGRectIntersectsRect(v43, v51))
    goto LABEL_2;
  -[AXElementNamesItemView _collisionFrameForArrow](self, "_collisionFrameForArrow");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v4, "_collisionFrameForArrow");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v44.origin.x = v20;
  v44.origin.y = v22;
  v44.size.width = v24;
  v44.size.height = v26;
  if (!CGRectIsNull(v44))
  {
    v45.origin.x = v28;
    v45.origin.y = v30;
    v45.size.width = v32;
    v45.size.height = v34;
    if (!CGRectIsNull(v45))
    {
      v46.origin.x = v20;
      v46.origin.y = v22;
      v46.size.width = v24;
      v46.size.height = v26;
      v52.origin.x = v28;
      v52.origin.y = v30;
      v52.size.width = v32;
      v52.size.height = v34;
      if (CGRectIntersectsRect(v46, v52))
        goto LABEL_2;
    }
  }
  v47.origin.x = v20;
  v47.origin.y = v22;
  v47.size.width = v24;
  v47.size.height = v26;
  if (CGRectIsNull(v47))
    goto LABEL_9;
  objc_msgSend(v4, "labelContainerFrame");
  v53.origin.x = v35;
  v53.origin.y = v36;
  v53.size.width = v37;
  v53.size.height = v38;
  v48.origin.x = v20;
  v48.origin.y = v22;
  v48.size.width = v24;
  v48.size.height = v26;
  if (CGRectIntersectsRect(v48, v53))
  {
LABEL_2:
    v17 = 1;
  }
  else
  {
LABEL_9:
    v49.origin.x = v28;
    v49.origin.y = v30;
    v49.size.width = v32;
    v49.size.height = v34;
    if (CGRectIsNull(v49))
    {
      v17 = 0;
    }
    else
    {
      -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
      v54.origin.x = v39;
      v54.origin.y = v40;
      v54.size.width = v41;
      v54.size.height = v42;
      v50.origin.x = v28;
      v50.origin.y = v30;
      v50.size.width = v32;
      v50.size.height = v34;
      v17 = CGRectIntersectsRect(v50, v54);
    }
  }

  return v17;
}

- (CGRect)_collisionFrameForArrow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (-[AXElementNamesItemView _usesArrow](self, "_usesArrow"))
  {
    -[AXElementNamesItemView arrowTipLocation](self, "arrowTipLocation");
    v4 = v3;
    v6 = v5 + -15.0;
    if (-[AXElementNamesItemView _arrowPointsDown](self, "_arrowPointsDown"))
      v7 = v4 + -9.0;
    else
      v7 = v4;
    v8 = 15.0;
    v9 = 9.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v10 = v6;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v10;
  return result;
}

- (CGRect)_elementFrameAdjustedForBounds
{
  CGFloat v3;
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
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;
  CGRect result;
  CGRect v21;

  if (-[AXElementNamesItemView isSpacer](self, "isSpacer"))
  {
    -[AXElementNamesItemView elementFrame](self, "elementFrame");
  }
  else
  {
    -[AXElementNamesItemView availableBounds](self, "availableBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[AXElementNamesItemView elementFrame](self, "elementFrame");
    v21.origin.x = v15;
    v21.origin.y = v16;
    v21.size.width = v17;
    v21.size.height = v18;
    v19.origin.x = v8;
    v19.origin.y = v10;
    v19.size.width = v12;
    v19.size.height = v14;
    *(CGRect *)&v3 = CGRectIntersection(v19, v21);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_updateLabelContainerSize
{
  double v3;
  UILabel *label;
  double v5;
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
  CGRect v17;
  CGRect v18;

  -[AXElementNamesItemView forcedLabelContainerSize](self, "forcedLabelContainerSize");
  label = self->_label;
  if (v5 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UILabel sizeToFit](label, "sizeToFit");
    -[UILabel frame](self->_label, "frame");
    v16 = CGRectGetWidth(v17) + 10.0;
    -[UILabel frame](self->_label, "frame");
    v14 = CGRectGetHeight(v18) + 6.0;
  }
  else
  {
    -[UILabel frame](label, "frame");
    v8 = v7;
    v10 = v9;
    -[AXElementNamesItemView forcedLabelContainerSize](self, "forcedLabelContainerSize");
    v12 = v11 + -10.0;
    -[AXElementNamesItemView forcedLabelContainerSize](self, "forcedLabelContainerSize");
    -[UILabel setFrame:](self->_label, "setFrame:", v8, v10, v12, v13 + -6.0);
    -[AXElementNamesItemView forcedLabelContainerSize](self, "forcedLabelContainerSize");
    v16 = v15;
  }
  -[AXElementNamesItemView setLabelContainerSize:](self, "setLabelContainerSize:", v16, v14);
}

- (BOOL)_shouldAllowLongArrows
{
  return 1;
}

- (CGRect)_validateLabelContainerFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MinY;
  double MaxY;
  CGFloat v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double MinX;
  double MaxX;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat rect;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect result;
  CGRect v63;
  CGRect v64;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[AXElementNamesItemView isSpacer](self, "isSpacer"))
    goto LABEL_28;
  if (!-[AXElementNamesItemView _shouldAllowLongArrows](self, "_shouldAllowLongArrows")
    && -[AXElementNamesItemView _usesExtendedArrow](self, "_usesExtendedArrow"))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_28;
  }
  -[AXElementNamesItemView availableBounds](self, "availableBounds");
  v9 = v8;
  v11 = v10;
  v12 = width;
  v14 = v13;
  v16 = v15;
  v42.origin.x = x;
  v42.origin.y = y;
  v38 = v12;
  v42.size.width = v12;
  v42.size.height = height;
  MinY = CGRectGetMinY(v42);
  v40 = v9;
  rect = v14;
  v43.origin.x = v9;
  v43.origin.y = v11;
  v43.size.width = v14;
  v43.size.height = v16;
  if (MinY >= CGRectGetMinY(v43))
    goto LABEL_8;
  if (-[AXElementNamesItemView labelPosition](self, "labelPosition") == 4)
  {
    v44.origin.x = v9;
    v44.size.width = v14;
    v44.origin.y = v11;
    v44.size.height = v16;
    y = CGRectGetMinY(v44);
LABEL_8:
    width = v38;
    goto LABEL_10;
  }
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_10:
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MaxY = CGRectGetMaxY(v45);
  v46.origin.x = v9;
  v46.size.width = rect;
  v46.origin.y = v11;
  v46.size.height = v16;
  v36 = v11;
  v37 = v16;
  if (MaxY <= CGRectGetMaxY(v46))
  {
LABEL_13:
    v19 = height;
    goto LABEL_15;
  }
  if (-[AXElementNamesItemView labelPosition](self, "labelPosition") == 4)
  {
    v47.origin.x = v9;
    v47.size.width = rect;
    v47.origin.y = v11;
    v47.size.height = v16;
    y = CGRectGetMaxY(v47) - height;
    goto LABEL_13;
  }
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_15:
  v20 = *MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = v19;
  v63.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v63.origin.y = v21;
  v63.size.width = v23;
  v63.size.height = v22;
  if (CGRectEqualToRect(v48, v63))
  {
    height = v19;
  }
  else
  {
    v33 = v22;
    v39 = v23;
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = v19;
    v24 = CGRectGetHeight(v49);
    v50.size.width = rect;
    v25 = v24;
    v50.origin.x = v40;
    v50.origin.y = v36;
    v50.size.height = v37;
    if (v25 > CGRectGetHeight(v50))
    {
      v51.origin.x = v40;
      v51.origin.y = v36;
      v51.size.width = rect;
      v51.size.height = v37;
      v19 = CGRectGetHeight(v51);
    }
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = v19;
    v26 = CGRectGetWidth(v52);
    v53.origin.x = v40;
    v53.origin.y = v36;
    v53.size.width = rect;
    v53.size.height = v37;
    if (v26 > CGRectGetWidth(v53))
    {
      v54.origin.x = v40;
      v54.origin.y = v36;
      v54.size.width = rect;
      v54.size.height = v37;
      width = CGRectGetWidth(v54);
    }
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = v19;
    MinX = CGRectGetMinX(v55);
    v56.origin.x = v40;
    v56.origin.y = v36;
    v56.size.width = rect;
    v56.size.height = v37;
    if (MinX < CGRectGetMinX(v56))
    {
      v57.origin.x = v40;
      v57.origin.y = v36;
      v57.size.width = rect;
      v57.size.height = v37;
      x = CGRectGetMinX(v57);
    }
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    height = v19;
    v58.size.height = v19;
    MaxX = CGRectGetMaxX(v58);
    v59.size.height = v37;
    v59.origin.x = v40;
    v59.origin.y = v36;
    v59.size.width = rect;
    if (MaxX > CGRectGetMaxX(v59))
    {
      v60.origin.x = v40;
      v60.origin.y = v36;
      v60.size.width = rect;
      v60.size.height = v37;
      x = CGRectGetMaxX(v60) - width;
    }
    if (-[AXElementNamesItemView labelPosition](self, "labelPosition", *(_QWORD *)&v33, v20) == 5)
    {
      -[AXElementNamesItemView elementFrame](self, "elementFrame");
      v64.origin.x = x;
      v64.origin.y = y;
      v64.size.width = width;
      v64.size.height = v19;
      if (!CGRectContainsRect(v61, v64))
      {
        height = v34;
        x = v35;
        width = v39;
        y = v21;
      }
    }
  }
LABEL_28:
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_updateFromMainProperties
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  unint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MidX;
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
  double v32;
  double MidY;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[AXElementNamesItemView _elementFrameAdjustedForBounds](self, "_elementFrameAdjustedForBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[AXElementNamesItemView labelPosition](self, "labelPosition");
  if (v11 <= 5)
  {
    if (((1 << v11) & 3) != 0)
    {
      v40.origin.x = v4;
      v40.origin.y = v6;
      v40.size.width = v8;
      v40.size.height = v10;
      v16 = CGRectGetMinY(v40) + 15.0;
      v41.origin.x = v4;
      v41.origin.y = v6;
      v41.size.width = v8;
      v41.size.height = v10;
      MidX = CGRectGetMidX(v41);
      -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
      v38 = MidX + v22 * -0.5;
      -[AXElementNamesItemView _arrowHeight](self, "_arrowHeight");
      v24 = v16 - v23;
      -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
      v20 = v24 - v25;
    }
    else
    {
      v12 = v4;
      v13 = v6;
      v14 = v8;
      v15 = v10;
      if (((1 << v11) & 0xC) == 0)
      {
        v31 = CGRectGetMidX(*(CGRect *)&v12);
        -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
        v38 = v31 - v32 * 0.5;
        v43.origin.x = v4;
        v43.origin.y = v6;
        v43.size.width = v8;
        v43.size.height = v10;
        MidY = CGRectGetMidY(v43);
        -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
        v20 = MidY - v34 * 0.5;
        -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
        v27 = v35;
        -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
        v29 = v36;
        v30 = *MEMORY[0x1E0C9D538];
        v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        goto LABEL_8;
      }
      v16 = CGRectGetMaxY(*(CGRect *)&v12) + -15.0;
      v39.origin.x = v4;
      v39.origin.y = v6;
      v39.size.width = v8;
      v39.size.height = v10;
      v17 = CGRectGetMidX(v39);
      -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
      v38 = v17 + v18 * -0.5;
      -[AXElementNamesItemView _arrowHeight](self, "_arrowHeight");
      v20 = v16 + v19;
    }
    -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
    v27 = v26;
    -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize");
    v29 = v28;
    v42.origin.x = v4;
    v42.origin.y = v6;
    v42.size.width = v8;
    v42.size.height = v10;
    v30 = CGRectGetMidX(v42);
LABEL_8:
    -[AXElementNamesItemView setArrowTipLocation:](self, "setArrowTipLocation:", v30, v16);
    v37 = v38;
    goto LABEL_9;
  }
  v29 = 0.0;
  v27 = 0.0;
  v20 = 0.0;
  v37 = 0.0;
LABEL_9:
  -[AXElementNamesItemView _validateLabelContainerFrame:](self, "_validateLabelContainerFrame:", v37, v20, v27, v29);
  -[AXElementNamesItemView setLabelContainerFrame:](self, "setLabelContainerFrame:");
  -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
  if (!CGRectEqualToRect(v44, *MEMORY[0x1E0C9D648]))
    -[AXElementNamesItemView _updateFromLabelContainerFrame](self, "_updateFromLabelContainerFrame");
}

- (void)_updateFromLabelContainerFrame
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[AXElementNamesItemView _usesArrow](self, "_usesArrow"))
  {
    -[AXElementNamesItemView _outlineWidth](self, "_outlineWidth");
    v12 = v11 + v11;
    v13 = -[AXElementNamesItemView _arrowPointsDown](self, "_arrowPointsDown");
    -[AXElementNamesItemView arrowTipLocation](self, "arrowTipLocation");
    v15 = v14;
    if (v13)
    {
      -[AXElementNamesItemView arrowTipLocation](self, "arrowTipLocation");
      v17 = v16;
    }
    else
    {
      v15 = v14 - v12;
      -[AXElementNamesItemView arrowTipLocation](self, "arrowTipLocation");
      v17 = v18 - v12;
    }
    -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
    v21.origin.x = v15;
    v21.origin.y = v17;
    v21.size.width = v12;
    v21.size.height = v12;
    v20 = CGRectUnion(v19, v21);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
  }
  -[AXElementNamesItemView setFrame:](self, "setFrame:", x, y, width, height);
  -[AXElementNamesItemView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_arrowPointsDown
{
  return !-[AXElementNamesItemView labelPosition](self, "labelPosition")
      || -[AXElementNamesItemView labelPosition](self, "labelPosition") == 1;
}

- (BOOL)_usesArrow
{
  return -[AXElementNamesItemView labelPosition](self, "labelPosition") != 5
      && -[AXElementNamesItemView labelPosition](self, "labelPosition") != 4;
}

- (BOOL)_usesExtendedArrow
{
  int64_t v3;

  v3 = -[AXElementNamesItemView labelPosition](self, "labelPosition");
  if (v3 != 1)
    LOBYTE(v3) = -[AXElementNamesItemView labelPosition](self, "labelPosition") == 3;
  return v3;
}

- (double)_arrowHeight
{
  _BOOL4 v3;
  double result;
  double v5;

  v3 = -[AXElementNamesItemView _usesExtendedArrow](self, "_usesExtendedArrow");
  result = 9.0;
  if (v3)
  {
    -[AXElementNamesItemView labelContainerSize](self, "labelContainerSize", 9.0);
    return v5 + 5.0 + 9.0;
  }
  return result;
}

- (double)_cornerRadius
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValueForValue:", 5.0);
  v4 = v3;

  return v4;
}

- (double)_outlineWidth
{
  return 0.0;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  id v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)AXElementNamesItemView;
  -[AXElementNamesItemView layoutSubviews](&v11, sel_layoutSubviews);
  -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
  v13 = CGRectInset(v12, 5.0, 3.0);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  -[AXElementNamesItemView frame](self, "frame");
  v8 = x - v7;
  -[AXElementNamesItemView frame](self, "frame");
  -[UILabel setFrame:](self->_label, "setFrame:", v8, y - v9, width, height);
  -[AXElementNamesItemView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v10 = -[AXElementNamesItemView _newBackgroundImage](self, "_newBackgroundImage");
  -[UIImageView setImage:](self->_backgroundMaskView, "setImage:", v10);

  -[AXElementNamesItemView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_backgroundMaskView, "setFrame:");
  -[UIView setMaskView:](self->_backgroundView, "setMaskView:", self->_backgroundMaskView);
}

- (id)_newBackgroundImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  double v36;
  double v37;
  _BOOL4 v38;
  double v39;
  void *v40;
  _BOOL4 v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGSize v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  -[AXElementNamesItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  v73.width = v4;
  v73.height = v6;
  UIGraphicsBeginImageContextWithOptions(v73, 0, v9);

  -[AXElementNamesItemView labelContainerFrame](self, "labelContainerFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[AXElementNamesItemView frame](self, "frame");
  v19 = v11 - v18;
  -[AXElementNamesItemView frame](self, "frame");
  v21 = v13 - v20;
  -[AXElementNamesItemView arrowTipLocation](self, "arrowTipLocation");
  v67 = v22;
  v69 = v23;
  -[AXElementNamesItemView frame](self, "frame");
  v66 = v24;
  -[AXElementNamesItemView frame](self, "frame");
  v26 = v25;
  -[AXElementNamesItemView _cornerRadius](self, "_cornerRadius");
  v28 = v27;
  -[AXElementNamesItemView _outlineWidth](self, "_outlineWidth");
  v30 = v29;
  v31 = v29 + v29;
  v32 = (void *)MEMORY[0x1E0DC3508];
  v71 = v19;
  v72 = v15;
  v74.origin.x = v19;
  v33 = v21;
  v74.origin.y = v21;
  v74.size.width = v15;
  v34 = v17;
  v74.size.height = v17;
  v75 = CGRectInset(v74, v30, v30);
  objc_msgSend(v32, "bezierPathWithRoundedRect:cornerRadius:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height, v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLineWidth:", v31);
  if (-[AXElementNamesItemView _usesArrow](self, "_usesArrow"))
  {
    v65 = v28;
    v36 = v67 - v66;
    v37 = v69 - v26;
    v38 = -[AXElementNamesItemView _usesExtendedArrow](self, "_usesExtendedArrow");
    if (v38)
      v39 = 6.0;
    else
      v39 = 15.0;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLineWidth:", v31);
    v41 = -[AXElementNamesItemView _arrowPointsDown](self, "_arrowPointsDown");
    v42 = v41;
    v43 = 9.0;
    if (v41)
      v43 = -9.0;
    v70 = v37 + v43;
    v44 = 4.0 / fabs((v37 + v43 - v37) / (v36 + 7.5 - v36));
    v45 = -4.0;
    if (!v41)
      v45 = 4.0;
    v46 = v37 + v45;
    v47 = v36 - v44;
    objc_msgSend(v40, "moveToPoint:", v36 + v44, v37 + v45);
    objc_msgSend(v40, "addQuadCurveToPoint:controlPoint:", v47, v46, v36, v37);
    v48 = v71;
    v49 = v33;
    v50 = v72;
    v51 = v34;
    if (v42)
      v52 = CGRectGetMaxY(*(CGRect *)&v48) - v30;
    else
      v52 = v30 + CGRectGetMinY(*(CGRect *)&v48);
    v68 = v52;
    v76.origin.x = v71;
    v76.origin.y = v33;
    v76.size.width = v72;
    v76.size.height = v34;
    v53 = v30 + v65 + CGRectGetMinX(v76);
    v54 = v34;
    if (v36 + v39 * -0.5 >= v53)
      v55 = v36 + v39 * -0.5;
    else
      v55 = v53;
    v56 = v39 + v55;
    v57 = v71;
    v58 = v33;
    v59 = v72;
    v60 = CGRectGetMaxX(*(CGRect *)(&v54 - 3)) - v65 - v30;
    if (v39 + v55 >= v60)
      v56 = v60;
    if (v38)
    {
      objc_msgSend(v40, "addLineToPoint:", v36 + -7.5, v70);
      objc_msgSend(v40, "addLineToPoint:", v55, v70);
    }
    objc_msgSend(v40, "addLineToPoint:", v55, v68);
    objc_msgSend(v40, "addLineToPoint:", v56, v68);
    if (v38)
    {
      objc_msgSend(v40, "addLineToPoint:", v56, v70);
      objc_msgSend(v40, "addLineToPoint:", v36 + 7.5, v70);
    }
    objc_msgSend(v40, "closePath");
  }
  else
  {
    v40 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "set");

  objc_msgSend(v35, "stroke");
  objc_msgSend(v40, "stroke");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "set");

  objc_msgSend(v35, "fill");
  objc_msgSend(v40, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v63;
}

- (CGRect)elementFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_elementFrame.origin.x;
  y = self->_elementFrame.origin.y;
  width = self->_elementFrame.size.width;
  height = self->_elementFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)availableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_availableBounds.origin.x;
  y = self->_availableBounds.origin.y;
  width = self->_availableBounds.size.width;
  height = self->_availableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)labelPosition
{
  return self->_labelPosition;
}

- (BOOL)isSpacer
{
  return self->_isSpacer;
}

- (void)setIsSpacer:(BOOL)a3
{
  self->_isSpacer = a3;
}

- (CGRect)labelContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_labelContainerFrame.origin.x;
  y = self->_labelContainerFrame.origin.y;
  width = self->_labelContainerFrame.size.width;
  height = self->_labelContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)forcedLabelContainerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_forcedLabelContainerSize.width;
  height = self->_forcedLabelContainerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)labelContainerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_labelContainerSize.width;
  height = self->_labelContainerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLabelContainerSize:(CGSize)a3
{
  self->_labelContainerSize = a3;
}

- (CGPoint)arrowTipLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_arrowTipLocation.x;
  y = self->_arrowTipLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setArrowTipLocation:(CGPoint)a3
{
  self->_arrowTipLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
