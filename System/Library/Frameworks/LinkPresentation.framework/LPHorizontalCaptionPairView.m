@implementation LPHorizontalCaptionPairView

- (LPHorizontalCaptionPairView)initWithHost:(id)a3
{

  return 0;
}

- (LPHorizontalCaptionPairView)initWithHost:(id)a3 leadingText:(id)a4 leadingStyle:(id)a5 trailingText:(id)a6 trailingStyle:(id)a7 button:(id)a8 balancingMode:(int64_t)a9
{
  id v15;
  LPHorizontalCaptionPairView *v16;
  LPHorizontalCaptionPairView *v17;
  LPTextView *v18;
  void *v19;
  LPTextView *v20;
  LPTextView *v21;
  void *v22;
  LPTextView *v23;
  _BOOL4 v24;
  LPTextView *v25;
  LPTextView *v26;
  LPTextView *v27;
  LPTextView *rightView;
  LPTextView *v29;
  LPTextView *v30;
  LPSubtitleButtonView *v31;
  void *v32;
  uint64_t v33;
  LPSubtitleButtonView *button;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  LPTextView *v49;
  LPHorizontalCaptionPairView *v50;
  void *v52;
  void *v53;
  LPTextView *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;
  _QWORD v62[4];

  v62[3] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v60 = a4;
  v58 = a5;
  v59 = a6;
  v56 = a7;
  v57 = a8;
  v61.receiver = self;
  v61.super_class = (Class)LPHorizontalCaptionPairView;
  v55 = v15;
  v16 = -[LPComponentView initWithHost:](&v61, sel_initWithHost_, v15);
  v17 = v16;
  if (v16)
  {
    v16->_balancingMode = a9;
    if (v60)
    {
      v18 = [LPTextView alloc];
      -[LPComponentView host](v17, "host");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[LPTextView initWithHost:text:style:](v18, "initWithHost:text:style:", v19, v60, v58);

    }
    else
    {
      v20 = 0;
    }
    if (v59)
    {
      v21 = [LPTextView alloc];
      -[LPComponentView host](v17, "host");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[LPTextView initWithHost:text:style:](v21, "initWithHost:text:style:", v22, v59, v56);

    }
    else
    {
      v23 = 0;
    }
    v24 = -[UIView _lp_isLTR](v17, "_lp_isLTR");
    if (v24)
      v25 = v20;
    else
      v25 = v23;
    if (v24)
      v26 = v23;
    else
      v26 = v20;
    objc_storeStrong((id *)&v17->_leftView, v25);
    v27 = v26;
    rightView = v17->_rightView;
    v17->_rightView = v27;

    if (v17->_leftView)
      -[LPHorizontalCaptionPairView addSubview:](v17, "addSubview:");
    if (v17->_rightView)
      -[LPHorizontalCaptionPairView addSubview:](v17, "addSubview:");
    if (v23)
      v29 = v23;
    else
      v29 = v20;
    v30 = v29;
    if (v57 && v30)
    {
      v54 = v30;
      objc_storeStrong((id *)&v17->_buttonProperties, a8);
      v31 = [LPSubtitleButtonView alloc];
      -[LPComponentView host](v17, "host");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[LPSubtitleButtonView initWithHost:buttonProperties:style:](v31, "initWithHost:buttonProperties:style:", v32, v17->_buttonProperties, v58);
      button = v17->_button;
      v17->_button = (LPSubtitleButtonView *)v33;

      -[LPSubtitleButtonView setTranslatesAutoresizingMaskIntoConstraints:](v17->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[LPHorizontalCaptionPairView addSubview:](v17, "addSubview:", v17->_button);
      -[LPSubtitleButtonView sizeToFit](v17->_button, "sizeToFit");
      -[LPTextView attributedString](v54, "attributedString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "string");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = objc_msgSend(v36, "isEqualToString:", CFSTR("​"));

      -[LPSubtitleButtonView leadingAnchor](v17->_button, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPTextView trailingAnchor](v54, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v31)
        objc_msgSend(v37, "constraintEqualToAnchor:", v38);
      else
        objc_msgSend(v37, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v38, 1.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setActive:", 1);

      v40 = (void *)MEMORY[0x1E0CB3718];
      -[LPSubtitleButtonView firstBaselineAnchor](v17->_button, "firstBaselineAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPTextView lastBaselineAnchor](v54, "lastBaselineAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v41;
      -[LPSubtitleButtonView widthAnchor](v17->_button, "widthAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPSubtitleButtonView frame](v17->_button, "frame");
      objc_msgSend(v42, "constraintEqualToConstant:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v44;
      -[LPSubtitleButtonView heightAnchor](v17->_button, "heightAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPSubtitleButtonView frame](v17->_button, "frame");
      objc_msgSend(v45, "constraintEqualToConstant:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v62[2] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "activateConstraints:", v48);

      v30 = v54;
    }
    v49 = v30;
    v50 = v17;

  }
  return v17;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  top = a3.top;
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[LPTextView setContentInset:](self->_leftView, "setContentInset:", a3.top);
    -[LPTextView setContentInset:](self->_rightView, "setContentInset:", top, 2.0, bottom, right);
  }
}

- (double)firstLineLeading
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[LPTextView style](self->_leftView, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstLineLeading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;
  -[LPTextView style](self->_rightView, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstLineLeading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = fmax(v6, v9);

  return v10;
}

- (double)lastLineDescent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[LPTextView style](self->_leftView, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLineDescent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;
  -[LPTextView style](self->_rightView, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastLineDescent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = fmax(v6, v9);

  return v10;
}

- (double)ascender
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[LPTextView style](self->_leftView, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ascender");
  v6 = v5;
  -[LPTextView style](self->_rightView, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ascender");
  v10 = fmax(v6, v9);

  return v10;
}

- (double)descender
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[LPTextView style](self->_leftView, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descender");
  v6 = v5;
  -[LPTextView style](self->_rightView, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descender");
  v10 = fmin(v6, v9);

  return v10;
}

- (int64_t)computedNumberOfLines
{
  return (uint64_t)fmax((double)-[LPTextView computedNumberOfLines](self->_leftView, "computedNumberOfLines"), (double)-[LPTextView computedNumberOfLines](self->_rightView, "computedNumberOfLines"));
}

- (void)setOverrideMaximumNumberOfLines:(int64_t)a3
{
  self->_overrideMaximumNumberOfLines = a3;
  -[LPTextView setOverrideMaximumNumberOfLines:](self->_leftView, "setOverrideMaximumNumberOfLines:");
  -[LPTextView setOverrideMaximumNumberOfLines:](self->_rightView, "setOverrideMaximumNumberOfLines:", a3);
}

- (void)layoutComponentView
{
  double v3;
  double v4;

  -[LPHorizontalCaptionPairView bounds](self, "bounds");
  -[LPHorizontalCaptionPairView _layoutCaptionPairForSize:applyingLayout:](self, "_layoutCaptionPairForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[LPHorizontalCaptionPairView _layoutCaptionPairForSize:applyingLayout:](self, "_layoutCaptionPairForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutCaptionPairForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGFloat *v8;
  LPSubtitleButtonView *button;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
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
  double (**v29)(void *, LPTextView *, double, double, double);
  LPTextView *leftView;
  CGFloat v31;
  LPTextView *rightView;
  CGFloat v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double rect;
  CGFloat v54;
  CGFloat v55;
  _QWORD aBlock[6];
  CGSize result;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = (CGFloat *)MEMORY[0x1E0C9D648];
  button = self->_button;
  v10 = *MEMORY[0x1E0C9D820];
  if (button)
    -[LPSubtitleButtonView sizeThatFits:](button, "sizeThatFits:", v10, *(double *)(MEMORY[0x1E0C9D820] + 8));
  v54 = v8[1];
  v55 = *v8;
  v11 = v8[3];
  v52 = v10;
  v12 = width - v10;
  -[LPTextView sizeThatFits:](self->_leftView, "sizeThatFits:", width - v10, height);
  v14 = v13;
  -[LPTextView sizeThatFits:](self->_rightView, "sizeThatFits:", v12, height);
  v16 = v15;
  v17 = v14 + v15;
  if (v17 - v12 <= 0.0)
  {
    if (!-[UIView _lp_isLTR](self, "_lp_isLTR"))
    {
      v60.origin.x = v55;
      v60.origin.y = v54;
      v60.size.width = v16;
      v60.size.height = v11;
      v61.size.width = v12 - CGRectGetWidth(v60);
      v61.origin.x = v55;
      v61.origin.y = v54;
      rect = v61.size.width;
      v61.size.height = v11;
      v14 = fmin(v14, CGRectGetWidth(v61));
      v51 = v16;
      goto LABEL_22;
    }
    v58.origin.x = v55;
    v58.origin.y = v54;
    v58.size.width = v14;
    v58.size.height = v11;
    v59.size.width = v12 - CGRectGetWidth(v58);
    v59.origin.x = v55;
    v59.origin.y = v54;
    v51 = v59.size.width;
    v59.size.height = v11;
    v16 = fmin(v16, CGRectGetWidth(v59));
    goto LABEL_21;
  }
  if (!self->_balancingMode)
  {
    v24 = fmax(v14 / v17, 0.5);
    v14 = v12 * v24;
    v16 = v12 - v12 * v24;
    v51 = v16;
LABEL_21:
    rect = v14;
    goto LABEL_22;
  }
  v18 = -[UIView _lp_isLTR](self, "_lp_isLTR");
  v19 = v12 - v14;
  v20 = v12 - (v12 - v14);
  v21 = v12 - v16;
  v22 = v12 - (v12 - v16);
  if (v18)
    v16 = v12 - (v12 - v16);
  else
    v16 = v12 - v14;
  if (v18)
    v14 = v21;
  else
    v14 = v12 - (v12 - v14);
  if (v18)
    v19 = v22;
  v51 = v19;
  if (v18)
    v23 = v21;
  else
    v23 = v20;
  rect = v23;
LABEL_22:
  -[LPTextView sizeThatFits:](self->_leftView, "sizeThatFits:", v14, height);
  v26 = v25;
  -[LPTextView sizeThatFits:](self->_rightView, "sizeThatFits:", v16, height);
  v28 = v27;
  if (v4)
  {
    v50 = v27;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__LPHorizontalCaptionPairView__layoutCaptionPairForSize_applyingLayout___block_invoke;
    aBlock[3] = &__block_descriptor_48_e41_d40__0__LPComponentView_8d16_CGSize_dd_24l;
    *(double *)&aBlock[4] = width;
    *(double *)&aBlock[5] = height;
    v29 = (double (**)(void *, LPTextView *, double, double, double))_Block_copy(aBlock);
    leftView = self->_leftView;
    v62.origin.y = v54;
    v62.origin.x = v55;
    v62.size.width = rect;
    v62.size.height = v11;
    v31 = CGRectGetWidth(v62);
    v48 = v29[2](v29, leftView, v31, v14, v26);
    rightView = self->_rightView;
    v63.origin.y = v54;
    v63.origin.x = v55;
    v63.size.width = v51;
    v63.size.height = v11;
    v33 = CGRectGetWidth(v63);
    v47 = v29[2](v29, rightView, v33, v16, v50);
    -[LPTextView style](self->_leftView, "style");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "font");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ascender");
    v37 = v36;

    -[LPTextView style](self->_rightView, "style");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "font");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = width;
    objc_msgSend(v39, "ascender");
    v41 = v40;

    v64.origin.y = v54;
    v64.origin.x = v55;
    v64.size.width = rect;
    v64.size.height = v48;
    v42 = CGRectGetWidth(v64);
    v43 = v37 - v41;
    v44 = -v43;
    if (v43 >= 0.0)
      v44 = 0.0;
    -[LPTextView setFrame:](self->_leftView, "setFrame:", 0.0, floor(v44), rect, v48);
    -[LPTextView setFrame:](self->_rightView, "setFrame:", v49 - (v12 - v42), floor(fmax(v43, 0.0)), v51, v47);

    width = v49;
    v28 = v50;
  }
  v45 = fmin(v52 + v16 + v14, width);
  v46 = fmin(fmax(v26, v28), height);
  result.height = v46;
  result.width = v45;
  return result;
}

double __72__LPHorizontalCaptionPairView__layoutCaptionPairForSize_applyingLayout___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  double v11;

  v9 = a2;
  v10 = v9;
  if (a4 != a3)
  {
    objc_msgSend(v9, "sizeThatFits:", a3, *(double *)(a1 + 40));
    a5 = v11;
  }

  return a5;
}

- (void)setEmphasizedTextExpression:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  -[LPTextView setEmphasizedTextExpression:](self->_leftView, "setEmphasizedTextExpression:", v5);
  -[LPTextView setEmphasizedTextExpression:](self->_rightView, "setEmphasizedTextExpression:", v5);

}

- (id)subtitleButton
{
  return self->_button;
}

- (int64_t)overrideMaximumNumberOfLines
{
  return self->_overrideMaximumNumberOfLines;
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonProperties, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end
