@implementation SUUICollectionViewCell

- (SUUICollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUICollectionViewCell *v3;
  void *v4;
  double v5;
  CGFloat v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUICollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = 1.0 / v5;

    v3->_separatorWidths.top = v6;
    v3->_separatorWidths.left = v6;
    v3->_separatorWidths.bottom = v6;
    v3->_separatorWidths.right = v6;
    *(_OWORD *)&v3->_separatorInsets.top = xmmword_241EFD200;
    *(_OWORD *)&v3->_separatorInsets.bottom = xmmword_241EFD200;
  }
  return v3;
}

- (void)setSeparatorColor:(id)a3
{
  UIColor *v5;
  UIColor **p_separatorColor;
  UIColor *separatorColor;
  char v8;
  UIView *bottomBorderView;
  void *v10;
  UIView *leftBorderView;
  void *v12;
  UIView *rightBorderView;
  void *v14;
  UIView *topBorderView;
  void *v16;
  UIColor *v17;

  v5 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  separatorColor = self->_separatorColor;
  if (separatorColor != v5)
  {
    v17 = v5;
    v8 = -[UIColor isEqual:](separatorColor, "isEqual:", v5);
    v5 = v17;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_separatorColor, a3);
      bottomBorderView = self->_bottomBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](bottomBorderView, "setBackgroundColor:", v10);

      }
      leftBorderView = self->_leftBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](leftBorderView, "setBackgroundColor:", v12);

      }
      rightBorderView = self->_rightBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](rightBorderView, "setBackgroundColor:", v14);

      }
      topBorderView = self->_topBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:", v16);

      }
      v5 = v17;
    }
  }

}

- (void)setSeparatorStyle:(int64_t)a3
{
  UIView *bottomBorderView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  uint64_t v9;
  void *v10;
  UIView *leftBorderView;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *rightBorderView;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  UIView *topBorderView;
  UIView *v22;
  UIView *v23;
  UIView *v24;
  void *v25;

  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    bottomBorderView = self->_bottomBorderView;
    if (a3)
    {
      if (!bottomBorderView)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        v6 = self->_bottomBorderView;
        self->_bottomBorderView = v5;

        v7 = self->_bottomBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v10);

        }
        -[SUUICollectionViewCell addSubview:](self, "addSubview:", self->_bottomBorderView);
        bottomBorderView = self->_bottomBorderView;
      }
      -[UIView setHidden:](bottomBorderView, "setHidden:", -[SUUICollectionViewCell _showsBottomBorder](self, "_showsBottomBorder") ^ 1);
      leftBorderView = self->_leftBorderView;
      if (!leftBorderView)
      {
        v12 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        v13 = self->_leftBorderView;
        self->_leftBorderView = v12;

        v14 = self->_leftBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

        }
        -[SUUICollectionViewCell addSubview:](self, "addSubview:", self->_leftBorderView);
        leftBorderView = self->_leftBorderView;
      }
      -[UIView setHidden:](leftBorderView, "setHidden:", -[SUUICollectionViewCell _showsLeftBorder](self, "_showsLeftBorder") ^ 1);
      rightBorderView = self->_rightBorderView;
      if (!rightBorderView)
      {
        v17 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        v18 = self->_rightBorderView;
        self->_rightBorderView = v17;

        v19 = self->_rightBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

        }
        -[SUUICollectionViewCell addSubview:](self, "addSubview:", self->_rightBorderView);
        rightBorderView = self->_rightBorderView;
      }
      -[UIView setHidden:](rightBorderView, "setHidden:", -[SUUICollectionViewCell _showsRightBorder](self, "_showsRightBorder") ^ 1);
      topBorderView = self->_topBorderView;
      if (!topBorderView)
      {
        v22 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        v23 = self->_topBorderView;
        self->_topBorderView = v22;

        v24 = self->_topBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_topBorderView, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

        }
        -[SUUICollectionViewCell addSubview:](self, "addSubview:", self->_topBorderView);
        topBorderView = self->_topBorderView;
      }
      v9 = -[SUUICollectionViewCell _showsTopBorder](self, "_showsTopBorder") ^ 1;
      v8 = topBorderView;
    }
    else
    {
      -[UIView setHidden:](self->_bottomBorderView, "setHidden:", 1);
      -[UIView setHidden:](self->_leftBorderView, "setHidden:", 1);
      -[UIView setHidden:](self->_rightBorderView, "setHidden:", 1);
      v8 = self->_topBorderView;
      v9 = 1;
    }
    -[UIView setHidden:](v8, "setHidden:", v9);
  }
}

- (void)setSeparatorWidths:(UIEdgeInsets)a3
{
  if (self->_separatorWidths.left != a3.left
    || self->_separatorWidths.top != a3.top
    || self->_separatorWidths.right != a3.right
    || self->_separatorWidths.bottom != a3.bottom)
  {
    self->_separatorWidths = a3;
    -[SUUICollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsCellSeparators:(BOOL)a3
{
  -[SUUICollectionViewCell setSeparatorStyle:](self, "setSeparatorStyle:", a3);
}

- (BOOL)showsCellSeparators
{
  return self->_separatorStyle != 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUICollectionViewCell;
  v4 = a3;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SUUICollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v7, sel_setBackgroundColor_, v5);

  v6 = objc_msgSend(v4, "position");
  -[SUUICollectionViewCell _setPosition:](self, "_setPosition:", v6);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUICollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SUUICollectionViewCell _updateBorderVisibility](self, "_updateBorderVisibility");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUICollectionViewCell;
  -[SUUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SUUICollectionViewCell _updateBorderVisibility](self, "_updateBorderVisibility");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  UIView *bottomBorderView;
  double v13;
  double MinX;
  CGFloat v15;
  CGFloat Width;
  UIView *leftBorderView;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat MinY;
  CGFloat v28;
  CGFloat v29;
  UIView *rightBorderView;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat Height;
  UIView *topBorderView;
  double top;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double right;
  double left;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v55.receiver = self;
  v55.super_class = (Class)SUUICollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v55, sel_layoutSubviews);
  right = *(double *)(MEMORY[0x24BEBE158] + 24);
  left = *(double *)(MEMORY[0x24BEBE158] + 8);
  if (self->_separatorStyle != 4)
  {
    if ((self->_position & 1) != 0)
      left = self->_separatorInsets.left;
    if ((self->_position & 5) == 4)
      right = self->_separatorInsets.right;
  }
  v51 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v52 = *MEMORY[0x24BEBE158];
  -[SUUICollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUICollectionViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  bottomBorderView = self->_bottomBorderView;
  v13 = v10;
  if (bottomBorderView)
  {
    v13 = v10;
    if (!-[UIView isHidden](bottomBorderView, "isHidden"))
    {
      v13 = v10 - self->_separatorWidths.bottom;
      v56.origin.x = v4;
      v56.origin.y = v6;
      v56.size.width = v8;
      v56.size.height = v10;
      MinX = CGRectGetMinX(v56);
      v57.origin.x = v4;
      v57.origin.y = v6;
      v57.size.width = v8;
      v57.size.height = v10;
      v15 = CGRectGetMaxY(v57) - self->_separatorWidths.bottom;
      v58.origin.x = v4;
      v58.origin.y = v6;
      v58.size.width = v8;
      v58.size.height = v10;
      Width = CGRectGetWidth(v58);
      -[UIView setFrame:](self->_bottomBorderView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(left + MinX, v52 + v15, Width - (right + left), self->_separatorWidths.bottom - (v52 + v51), v4, v6, v8, v10));
    }
  }
  leftBorderView = self->_leftBorderView;
  v18 = v8;
  v19 = v4;
  if (leftBorderView)
  {
    v18 = v8;
    v19 = v4;
    if (!-[UIView isHidden](leftBorderView, "isHidden"))
    {
      v48 = v13;
      v20 = self->_separatorWidths.left;
      v21 = 0.0;
      if (v20 > 0.00000011920929)
      {
        v22 = v20 * 0.5;
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "scale");
        v25 = 1.0 / v24;

        if (v22 >= v25)
          v21 = v22;
        else
          v21 = v25;
      }
      v47 = v8 - v21;
      v59.origin.x = v4;
      v59.origin.y = v6;
      v59.size.width = v8;
      v59.size.height = v10;
      v26 = CGRectGetMinX(v59);
      v60.origin.x = v4;
      v60.origin.y = v6;
      v60.size.width = v8;
      v60.size.height = v10;
      MinY = CGRectGetMinY(v60);
      v61.origin.x = v4;
      v61.origin.y = v6;
      v61.size.width = v8;
      v61.size.height = v10;
      v28 = CGRectGetHeight(v61) - self->_separatorWidths.bottom;
      v29 = v26;
      v19 = v4 + v21;
      v18 = v8 - v21;
      -[UIView setFrame:](self->_leftBorderView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v29, MinY, v21, v28, v4, v6, v8, v10));
      v13 = v48;
    }
  }
  rightBorderView = self->_rightBorderView;
  if (rightBorderView && !-[UIView isHidden](rightBorderView, "isHidden"))
  {
    v47 = v19;
    v49 = v13;
    v31 = self->_separatorWidths.right;
    v32 = 0.0;
    if (v31 > 0.00000011920929)
    {
      v33 = v31 * 0.5;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scale");
      v36 = 1.0 / v35;

      if (v33 >= v36)
        v32 = v33;
      else
        v32 = v36;
    }
    v18 = v18 - v32;
    v62.origin.x = v4;
    v62.origin.y = v6;
    v62.size.width = v8;
    v62.size.height = v10;
    v37 = CGRectGetMaxX(v62) - v32;
    v63.origin.x = v4;
    v63.origin.y = v6;
    v63.size.width = v8;
    v63.size.height = v10;
    v38 = CGRectGetMinY(v63);
    v64.origin.x = v4;
    v64.origin.y = v6;
    v64.size.width = v8;
    v64.size.height = v10;
    Height = CGRectGetHeight(v64);
    -[UIView setFrame:](self->_rightBorderView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v37, v38, v32, Height - self->_separatorWidths.bottom, v4, v6, v8, v10));
    v19 = v47;
    v13 = v49;
  }
  topBorderView = self->_topBorderView;
  if (topBorderView && !-[UIView isHidden](topBorderView, "isHidden"))
  {
    top = self->_separatorWidths.top;
    v50 = v6 + top;
    v13 = v13 - top;
    v65.origin.x = v4;
    v65.origin.y = v6;
    v65.size.width = v8;
    v65.size.height = v10;
    v47 = v18;
    v42 = v19;
    v43 = CGRectGetMinX(v65);
    v66.origin.x = v4;
    v66.origin.y = v6;
    v66.size.width = v8;
    v66.size.height = v10;
    v44 = CGRectGetMinY(v66);
    v67.origin.x = v4;
    v67.origin.y = v6;
    v67.size.width = v8;
    v67.size.height = v10;
    v45 = CGRectGetWidth(v67);
    v46 = left + v43;
    v19 = v42;
    v18 = v47;
    -[UIView setFrame:](self->_topBorderView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v46, v52 + v44, v45 - (right + left), self->_separatorWidths.top - (v52 + v51), v4, v6, v8, v10));
    v6 = v50;
  }
  objc_msgSend(v11, "setFrame:", v19, v6, v18, v13, *(_QWORD *)&v47);

}

- (void)_setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    -[SUUICollectionViewCell _updateBorderVisibility](self, "_updateBorderVisibility");
  }
}

- (BOOL)_showsBottomBorder
{
  BOOL v2;

  v2 = 1;
  switch(self->_separatorStyle)
  {
    case 2:
    case 4:
    case 7:
      return v2;
    case 3:
      v2 = (self->_position & 0x20) == 0;
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

- (BOOL)_showsLeftBorder
{
  int64_t separatorStyle;
  int64_t v3;
  BOOL v4;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  separatorStyle = self->_separatorStyle;
  v3 = self->_position & 1;
  v4 = v3 == 0;
  v6 = separatorStyle != 5 && separatorStyle != 0;
  if (separatorStyle == 6)
  {
    v7 = 0;
  }
  else
  {
    v4 = 0;
    v7 = v3 == 0;
  }
  if (v7)
    v8 = v6;
  else
    v8 = v4;
  if (separatorStyle == 7)
    return (self->_position & 1) == 0;
  else
    return v8;
}

- (BOOL)_showsRightBorder
{
  int64_t separatorStyle;
  int64_t v3;
  BOOL v4;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  separatorStyle = self->_separatorStyle;
  v3 = self->_position & 4;
  v4 = v3 == 0;
  v6 = separatorStyle != 5 && separatorStyle != 0;
  if (separatorStyle == 6)
  {
    v7 = 0;
  }
  else
  {
    v4 = 0;
    v7 = v3 == 0;
  }
  if (v7)
    v8 = v6;
  else
    v8 = v4;
  if (separatorStyle == 7)
    return (self->_position & 4) == 0;
  else
    return v8;
}

- (BOOL)_showsTopBorder
{
  SUUICollectionViewCell *v2;
  unint64_t separatorStyle;

  v2 = self;
  LOBYTE(self) = 0;
  separatorStyle = v2->_separatorStyle;
  if (separatorStyle <= 7)
  {
    if (((1 << separatorStyle) & 0x9C) != 0)
    {
      LODWORD(self) = (LOBYTE(v2->_position) >> 3) & 1;
    }
    else if (((1 << separatorStyle) & 0x22) != 0)
    {
      LOBYTE(self) = (v2->_position & 8) == 0;
    }
  }
  return (char)self;
}

- (void)_updateBorderVisibility
{
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v3 = -[SUUICollectionViewCell _showsBottomBorder](self, "_showsBottomBorder");
  v4 = v3 ^ -[UIView isHidden](self->_bottomBorderView, "isHidden");
  if ((v4 & 1) == 0)
    -[UIView setHidden:](self->_bottomBorderView, "setHidden:", !v3);
  v5 = -[SUUICollectionViewCell _showsLeftBorder](self, "_showsLeftBorder");
  if (v5 == -[UIView isHidden](self->_leftBorderView, "isHidden"))
  {
    -[UIView setHidden:](self->_leftBorderView, "setHidden:", !v5);
    v6 = 1;
  }
  else
  {
    v6 = v4 ^ 1;
  }
  v7 = -[SUUICollectionViewCell _showsRightBorder](self, "_showsRightBorder");
  if (v7 == -[UIView isHidden](self->_rightBorderView, "isHidden"))
  {
    -[UIView setHidden:](self->_rightBorderView, "setHidden:", !v7);
    v6 = 1;
  }
  v8 = -[SUUICollectionViewCell _showsTopBorder](self, "_showsTopBorder");
  if (v8 == -[UIView isHidden](self->_topBorderView, "isHidden"))
  {
    -[UIView setHidden:](self->_topBorderView, "setHidden:", !v8);
    goto LABEL_12;
  }
  if (v6)
LABEL_12:
    -[SUUICollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIEdgeInsets)separatorWidths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorWidths.top;
  left = self->_separatorWidths.left;
  bottom = self->_separatorWidths.bottom;
  right = self->_separatorWidths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_rightBorderView, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end
