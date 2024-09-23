@implementation PKTextAttachmentResizeView

- (id)initAtTop:(BOOL)a3 delegate:(id)a4
{
  double v5;
  double v6;
  id v7;
  PKTextAttachmentResizeView *v8;
  PKDrawingAdjustmentKnob *v9;
  PKDrawingAdjustmentKnob *knobView;
  UIView *v11;
  UIView *separatorView;
  UIView *v13;
  UIView *separatorHighlightedView;
  objc_super v16;

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v16.receiver = self;
  v16.super_class = (Class)PKTextAttachmentResizeView;
  v7 = a4;
  v8 = -[PKTextAttachmentResizeView initWithFrame:](&v16, sel_initWithFrame_, v5, v6, 1024.0, 100.0);
  -[PKTextAttachmentResizeView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0, v16.receiver, v16.super_class);
  objc_storeWeak((id *)&v8->_delegate, v7);

  v9 = objc_alloc_init(PKDrawingAdjustmentKnob);
  knobView = v8->_knobView;
  v8->_knobView = v9;

  v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorView = v8->_separatorView;
  v8->_separatorView = v11;

  v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorHighlightedView = v8->_separatorHighlightedView;
  v8->_separatorHighlightedView = v13;

  v8->_top = a3;
  v8->_enabled = 1;
  -[PKTextAttachmentResizeView addSubview:](v8, "addSubview:", v8->_separatorView);
  -[PKTextAttachmentResizeView addSubview:](v8, "addSubview:", v8->_separatorHighlightedView);
  -[PKTextAttachmentResizeView addSubview:](v8, "addSubview:", v8->_knobView);
  -[UIView _setCornerRadius:](v8->_separatorHighlightedView, "_setCornerRadius:", 0.75);
  -[UIView setAlpha:](v8->_separatorHighlightedView, "setAlpha:", 0.0);
  return v8;
}

+ (double)resizeHitSize
{
  return 100.0;
}

- (void)didMoveToWindow
{
  void *v3;
  id v4;

  -[PKTextAttachmentResizeView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v3);

  -[PKTextAttachmentResizeView tintColor](self, "tintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_separatorHighlightedView, "setBackgroundColor:", v4);

}

- (void)layoutSubviews
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
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[PKTextAttachmentResizeView bounds](self, "bounds");
  v5 = v4;
  if (self->_top)
    v6 = 0.0;
  else
    v6 = v3 + -16.0;
  +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
  v8 = v7;
  v9 = v7 + 7.5;
  v10 = v5 - v7 + -28.0;
  if (-[PKTextAttachmentResizeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v12.size.width = 15.0;
    v12.size.height = 16.0;
    v12.origin.x = v8;
    v12.origin.y = v6;
    v8 = v5 - CGRectGetMaxX(v12);
    v13.size.height = 0.5;
    v13.origin.x = v9;
    v13.origin.y = v6 + 7.75;
    v13.size.width = v10;
    v11 = v5 - CGRectGetMaxX(v13);
    v14.size.height = 1.5;
    v14.origin.x = v9;
    v14.origin.y = v6 + 7.25;
    v14.size.width = v10;
    v9 = v5 - CGRectGetMaxX(v14);
  }
  else
  {
    v11 = v9;
  }
  -[PKDrawingAdjustmentKnob setFrame:](self->_knobView, "setFrame:", v8, v6, 15.0, 16.0);
  -[UIView setFrame:](self->_separatorView, "setFrame:", v11, v6 + 7.75, v10, 0.5);
  -[UIView setFrame:](self->_separatorHighlightedView, "setFrame:", v9, v6 + 7.25, v10, 1.5);
}

- (double)resizeContentInset
{
  double result;

  UIRoundToViewScale();
  return result;
}

- (BOOL)shown
{
  double v2;

  -[PKTextAttachmentResizeView alpha](self, "alpha");
  return v2 > 0.0;
}

- (void)show:(BOOL)a3 enabled:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL4 v7;
  double v9;
  _BOOL4 v10;
  _QWORD v11[5];
  BOOL v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (-[PKTextAttachmentResizeView shown](self, "shown") != a3)
  {
    -[PKTextAttachmentResizeView setEnabled:](self, "setEnabled:", v6);
    if (v5)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52__PKTextAttachmentResizeView_show_enabled_animated___block_invoke;
      v11[3] = &unk_1E777A028;
      v11[4] = self;
      v12 = v7;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v11, 0, 0.2, 0.0);
    }
    else
    {
      v9 = 0.0;
      if (v7)
      {
        v10 = -[PKTextAttachmentResizeView enabled](self, "enabled", 0.0);
        v9 = 0.4;
        if (v10)
          v9 = 1.0;
      }
      -[PKTextAttachmentResizeView setAlpha:](self, "setAlpha:", v9);
    }
  }
}

uint64_t __52__PKTextAttachmentResizeView_show_enabled_animated___block_invoke(uint64_t a1)
{
  int v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "enabled");
    v3 = 0.4;
    if (v2)
      v3 = 1.0;
  }
  else
  {
    v3 = 0.0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__PKTextAttachmentResizeView_setHighlighted___block_invoke;
    v3[3] = &unk_1E7778020;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.2);
  }
}

uint64_t __45__PKTextAttachmentResizeView_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (!*(_BYTE *)(v1 + 417))
    v2 = 0.0;
  return objc_msgSend(*(id *)(v1 + 440), "setAlpha:", v2);
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __41__PKTextAttachmentResizeView_setEnabled___block_invoke;
    v3[3] = &unk_1E7778020;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v3, 0, 0.2, 0.0);
  }
}

uint64_t __41__PKTextAttachmentResizeView_setEnabled___block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  int v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shown");
  v3 = 0.0;
  if (v2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "enabled", 0.0);
    v3 = 0.4;
    if (v4)
      v3 = 1.0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

- (void)layoutInsideSuperview
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
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
  CGRect v22;
  CGRect v23;

  -[PKTextAttachmentResizeView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[PKTextAttachmentResizeView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;
  v12 = v11;

  v13 = 28.0;
  v14 = 28.0;
  if (-[PKTextAttachmentResizeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 1)
  {
    +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
    v14 = v15;
  }
  if (-[PKTextAttachmentResizeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
    v13 = v16;
  }
  v17 = 0.0;
  if (!-[PKTextAttachmentResizeView top](self, "top"))
  {
    -[PKTextAttachmentResizeView bounds](self, "bounds");
    v17 = v7 - CGRectGetHeight(v22) + 0.0;
  }
  if (v12 >= v13)
    v18 = v12;
  else
    v18 = v13;
  v19 = v18 - v13;
  if (v10 >= v14)
    v20 = v10;
  else
    v20 = v14;
  v21 = v20 - v14;
  -[PKTextAttachmentResizeView bounds](self, "bounds");
  -[PKTextAttachmentResizeView setFrame:](self, "setFrame:", v21 + 0.0, v17, v5 - (v21 + v19), CGRectGetHeight(v23));
}

- (void)handleGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double height;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  id v36;
  void *v37;
  _BOOL4 v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double top;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  _QWORD v69[4];
  id v70;
  id v71;
  PKTextAttachmentResizeView *v72;
  CGPoint origin;
  CGFloat width;
  double v75;
  CGRect v76;

  v4 = a3;
  -[PKTextAttachmentResizeView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resizeViewTextView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextAttachmentResizeView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resizeViewDrawingBounds:", self);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = objc_msgSend(v4, "state");
  if ((unint64_t)(v16 - 2) < 2)
  {
    objc_msgSend(v4, "translationInView:", self);
    v18 = v17;
    v19 = -[PKTextAttachmentResizeView top](self, "top");
    v20 = fmin(v18, 20.0);
    v21 = -20.0;
    if (v18 >= -20.0)
      v21 = v18;
    if (v19)
      v22 = v20;
    else
      v22 = v21;
    v76.origin.x = v9;
    v76.origin.y = v11;
    v76.size.width = v13;
    v76.size.height = v15;
    if (CGRectIsEmpty(v76)
      && (-[PKTextAttachmentResizeView top](self, "top") && v22 >= 20.0
       || !-[PKTextAttachmentResizeView top](self, "top") && v22 <= -20.0))
    {
      if (objc_msgSend(v4, "state") == 3)
      {
        -[PKTextAttachmentResizeView delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "resizeViewRemoveAttachment:", self);
      }
      else
      {
        -[PKTextAttachmentResizeView frame](self, "frame");
        -[PKTextAttachmentResizeView setFrame:](self, "setFrame:");
        -[PKTextAttachmentResizeView delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "resizeViewLayoutAttachment:", self);
      }
    }
    else
    {
      -[PKTextAttachmentResizeView delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PKTextAttachmentResizeView top](self, "top");
      v39 = fabs(v22);
      v40 = 0.0;
      if (v22 >= 0.0)
        v40 = v22;
      if (v38)
        v41 = v39;
      else
        v41 = v40;
      objc_msgSend(v37, "resizeView:setDrawingHeight:originalHeight:growFromTop:", self, -[PKTextAttachmentResizeView top](self, "top"), v41, self->_originalViewBounds.size.height);

      if (objc_msgSend(v4, "state") != 3)
        goto LABEL_28;
      -[PKTextAttachmentResizeView delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "resizeView:finishedWithOriginalDrawingBounds:originalViewBounds:", self, self->_originalDrawingBounds.origin.x, self->_originalDrawingBounds.origin.y, self->_originalDrawingBounds.size.width, self->_originalDrawingBounds.size.height, self->_originalViewBounds.origin.x, self->_originalViewBounds.origin.y, self->_originalViewBounds.size.width, self->_originalViewBounds.size.height);
    }

LABEL_28:
    -[PKTextAttachmentResizeView delegate](self, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "resizeViewDidUpdate:", self);

    goto LABEL_29;
  }
  if (v16 == 1)
  {
    self->_originalDrawingBounds.origin.x = v9;
    self->_originalDrawingBounds.origin.y = v11;
    self->_originalDrawingBounds.size.width = v13;
    self->_originalDrawingBounds.size.height = v15;
    -[PKTextAttachmentResizeView superview](self, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    self->_originalViewBounds.origin.x = v25;
    self->_originalViewBounds.origin.y = v26;
    self->_originalViewBounds.size.width = v27;
    self->_originalViewBounds.size.height = v28;

    origin = self->_originalViewBounds.origin;
    width = self->_originalViewBounds.size.width;
    height = self->_originalViewBounds.size.height;
    if (-[PKTextAttachmentResizeView top](self, "top"))
      v30 = -height;
    else
      v30 = height;
    objc_msgSend(v4, "setTranslation:inView:", self, 0.0, v30);
    objc_msgSend(v6, "contentInset");
    self->_originalContentInset.top = v31;
    self->_originalContentInset.left = v32;
    self->_originalContentInset.bottom = v33;
    self->_originalContentInset.right = v34;
    -[PKTextAttachmentResizeView top](self, "top");
    UIEdgeInsetsAdd();
    objc_msgSend(v6, "setContentInset:");
    v35 = (void *)MEMORY[0x1E0C99E88];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __44__PKTextAttachmentResizeView_handleGesture___block_invoke;
    v69[3] = &unk_1E777A050;
    v70 = v4;
    v75 = height;
    v71 = v6;
    v72 = self;
    v36 = (id)objc_msgSend(v35, "scheduledTimerWithTimeInterval:repeats:block:", 1, v69, 0.0166666667);

  }
LABEL_29:
  if (objc_msgSend(v4, "state") >= 3)
  {
    if (-[PKTextAttachmentResizeView top](self, "top")
      && (objc_msgSend(v6, "contentOffset"),
          v44 = v43,
          v45 = self->_originalContentInset.top,
          objc_msgSend(v6, "_contentScrollInset"),
          v44 < -(v45 + v46)))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObserver:selector:name:object:", self, sel_drawingScrollViewDidScroll_, CFSTR("_UIScrollViewAnimationEndedNotification"), 0);

      top = self->_originalContentInset.top;
      v49 = -self->_originalContentInset.left;
      objc_msgSend(v6, "_contentScrollInset");
      v51 = -(top + v50);
    }
    else
    {
      if (-[PKTextAttachmentResizeView top](self, "top")
        || (objc_msgSend(v6, "contentOffset"),
            v53 = v52,
            objc_msgSend(v6, "bounds"),
            v55 = v53 + v54,
            objc_msgSend(v6, "contentSize"),
            v57 = v56 + self->_originalContentInset.bottom,
            objc_msgSend(v6, "_contentScrollInset"),
            v55 <= v57 + v58))
      {
        objc_msgSend(v6, "setContentInset:", self->_originalContentInset.top, self->_originalContentInset.left, self->_originalContentInset.bottom, self->_originalContentInset.right);
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObserver:selector:name:object:", self, sel_drawingScrollViewDidScroll_, CFSTR("_UIScrollViewAnimationEndedNotification"), 0);

      v49 = -self->_originalContentInset.left;
      objc_msgSend(v6, "contentSize");
      v61 = v60 + self->_originalContentInset.bottom;
      objc_msgSend(v6, "_contentScrollInset");
      v63 = v61 + v62;
      objc_msgSend(v6, "bounds");
      v65 = v63 - v64;
      v66 = self->_originalContentInset.top;
      objc_msgSend(v6, "_contentScrollInset");
      v68 = -(v66 + v67);
      if (v65 >= v68)
        v51 = v65;
      else
        v51 = v68;
    }
    objc_msgSend(v6, "setContentOffset:animated:", 1, v49, v51);
  }
LABEL_40:

}

void __44__PKTextAttachmentResizeView_handleGesture___block_invoke(uint64_t a1, void *a2)
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
  void *v29;
  double v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 1 && objc_msgSend(*(id *)(a1 + 32), "state") != 2)
  {
    objc_msgSend(v31, "invalidate");
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", *(_QWORD *)(a1 + 40));
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  if (-(*(double *)(a1 + 80) - v13 * 0.75) >= 0.0)
    v14 = -(*(double *)(a1 + 80) - v13 * 0.75);
  else
    v14 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 48), "top")
    && (v32.origin.x = v4,
        v32.origin.y = v6,
        v32.size.width = v8,
        v32.size.height = v10,
        v12 <= CGRectGetMinY(v32) + 40.0))
  {
    v16 = 6.0;
    if (v14 <= 6.0)
      v16 = v14;
    v14 = -v16;
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "top") & 1) != 0)
      goto LABEL_18;
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    if (v12 < CGRectGetMaxY(v33) + -40.0)
      goto LABEL_18;
    v15 = 6.0;
    if (v14 > 6.0)
      goto LABEL_17;
  }
  v15 = v14;
  if (v14 != 0.0)
  {
LABEL_17:
    objc_msgSend(*(id *)(a1 + 40), "contentOffset");
    v18 = v17;
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 32), "translationInView:", *(_QWORD *)(a1 + 48));
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", v18, v15 + v20);
    objc_msgSend(*(id *)(a1 + 40), "contentOffset");
    v26 = v25;
    v27 = v25 - v20;
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(void **)(a1 + 48);
    objc_msgSend(v29, "frame");
    objc_msgSend(v28, "resizeView:setDrawingHeight:originalHeight:growFromTop:", v29, objc_msgSend(*(id *)(a1 + 48), "top"), vabdd_f64(v26, v20) + v30, *(double *)(*(_QWORD *)(a1 + 48) + 512));

    objc_msgSend(*(id *)(a1 + 32), "setTranslation:inView:", *(_QWORD *)(a1 + 48), v22, v24 + v27);
  }
LABEL_18:

}

- (void)drawingScrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PKTextAttachmentResizeView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resizeViewTextView:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIScrollViewAnimationEndedNotification"), 0);

  objc_msgSend(v6, "setContentInset:", self->_originalContentInset.top, self->_originalContentInset.left, self->_originalContentInset.bottom, self->_originalContentInset.right);
}

- (BOOL)top
{
  return self->_top;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CGRect)originalDrawingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalDrawingBounds.origin.x;
  y = self->_originalDrawingBounds.origin.y;
  width = self->_originalDrawingBounds.size.width;
  height = self->_originalDrawingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalDrawingBounds:(CGRect)a3
{
  self->_originalDrawingBounds = a3;
}

- (PKDrawingAdjustmentKnob)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
  objc_storeStrong((id *)&self->_knobView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIView)separatorHighlightedView
{
  return self->_separatorHighlightedView;
}

- (void)setSeparatorHighlightedView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorHighlightedView, a3);
}

- (PKTextAttachmentResizeViewDelegate)delegate
{
  return (PKTextAttachmentResizeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)originalViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalViewBounds.origin.x;
  y = self->_originalViewBounds.origin.y;
  width = self->_originalViewBounds.size.width;
  height = self->_originalViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalViewBounds:(CGRect)a3
{
  self->_originalViewBounds = a3;
}

- (UIEdgeInsets)originalContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_originalContentInset.top;
  left = self->_originalContentInset.left;
  bottom = self->_originalContentInset.bottom;
  right = self->_originalContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOriginalContentInset:(UIEdgeInsets)a3
{
  self->_originalContentInset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_separatorHighlightedView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
}

@end
