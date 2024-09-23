@implementation NUCrossFadeTitleView

- (NUCrossFadeTitleView)initWithStyler:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NUCrossFadeTitleView *v10;
  NUCrossFadeTitleView *v11;
  NUCrossFadeViewAnimator *v12;
  NUCrossFadeViewAnimator *animator;
  uint64_t v14;
  UIImageView *titleImageView;
  uint64_t v16;
  UILabel *titleLabel;
  NUTextAndGlyphView *v18;
  NUTextAndGlyphView *textAndGlyphView;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NUCrossFadeTitleView;
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = -[NUCrossFadeTitleView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_styler, a3);
    v11->_displayValueType = 3;
    v12 = objc_alloc_init(NUCrossFadeViewAnimator);
    animator = v11->_animator;
    v11->_animator = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v6, v7, v8, v9);
    titleImageView = v11->_titleImageView;
    v11->_titleImageView = (UIImageView *)v14;

    -[UIImageView setAutoresizingMask:](v11->_titleImageView, "setAutoresizingMask:", 2);
    -[UIImageView setContentMode:](v11->_titleImageView, "setContentMode:", 1);
    -[UIImageView nu_supportViewDebugging](v11->_titleImageView, "nu_supportViewDebugging");
    -[NUCrossFadeTitleView addSubview:](v11, "addSubview:", v11->_titleImageView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v16;

    -[UILabel setAutoresizingMask:](v11->_titleLabel, "setAutoresizingMask:", 2);
    -[UILabel setNumberOfLines:](v11->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setMinimumScaleFactor:](v11->_titleLabel, "setMinimumScaleFactor:", 0.25);
    -[UILabel nu_supportViewDebugging](v11->_titleLabel, "nu_supportViewDebugging");
    -[NUCrossFadeTitleView addSubview:](v11, "addSubview:", v11->_titleLabel);
    v18 = -[NUTextAndGlyphView initWithFrame:]([NUTextAndGlyphView alloc], "initWithFrame:", v6, v7, v8, v9);
    textAndGlyphView = v11->_textAndGlyphView;
    v11->_textAndGlyphView = v18;

    -[UIView nu_supportViewDebugging](v11->_textAndGlyphView, "nu_supportViewDebugging");
    -[NUCrossFadeTitleView addSubview:](v11, "addSubview:", v11->_textAndGlyphView);
  }

  return v11;
}

- (void)setStyler:(id)a3
{
  objc_storeStrong((id *)&self->_styler, a3);
}

- (void)updateTitleViewWithUpdate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = (void (**)(_QWORD))a5;
  -[NUCrossFadeTitleView viewForValueType:](self, "viewForValueType:", -[NUCrossFadeTitleView displayValueType](self, "displayValueType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCrossFadeTitleView viewForValueType:](self, "viewForValueType:", objc_msgSend(v15, "valueType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCrossFadeTitleView setDisplayValueType:](self, "setDisplayValueType:", objc_msgSend(v15, "valueType"));
  -[NUCrossFadeTitleView applyStylesToValueFromTitleViewUpdate:](self, "applyStylesToValueFromTitleViewUpdate:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCrossFadeTitleView animator](self, "animator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a4)
  {
    objc_msgSend(v12, "crossFadeFromView:toView:value:completion:", v9, v10, v11, v8);

  }
  else
  {
    objc_msgSend(v12, "resetView:", v9);

    -[NUCrossFadeTitleView animator](self, "animator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetView:", v10);

    objc_msgSend(v9, "nu_crossFadeViewSetValue:", 0);
    objc_msgSend(v10, "nu_crossFadeViewSetValue:", v11);
    if (v8)
      v8[2](v8);
  }
  -[NUCrossFadeTitleView setUpdate:](self, "setUpdate:", v15);

}

- (id)viewForValueType:(unint64_t)a3
{
  void *v4;

  v4 = 0;
  switch(a3)
  {
    case 0uLL:
      -[NUCrossFadeTitleView titleImageView](self, "titleImageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
    case 4uLL:
      -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[NUCrossFadeTitleView textAndGlyphView](self, "textAndGlyphView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (NUCrossFadeViewAnimator)animator
{
  return self->_animator;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)NUCrossFadeTitleView;
  -[NUCrossFadeTitleView layoutSubviews](&v33, sel_layoutSubviews);
  -[NUCrossFadeTitleView bounds](self, "bounds");
  v4 = v3;
  -[NUCrossFadeTitleView bounds](self, "bounds");
  v6 = v5 * 0.5;
  -[NUCrossFadeTitleView titleImageView](self, "titleImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[NUCrossFadeTitleView center](self, "center");
  v9 = v8;
  v11 = v10;
  -[NUCrossFadeTitleView titleImageView](self, "titleImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

  -[NUCrossFadeTitleView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[NUCrossFadeTitleView bounds](self, "bounds");
  v20 = v19;
  -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v20, v18);

  -[NUCrossFadeTitleView center](self, "center");
  v23 = v22;
  v25 = v24;
  -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v23, v25);

  -[NUCrossFadeTitleView textAndGlyphView](self, "textAndGlyphView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v14, v16, v20, v18);

  -[NUCrossFadeTitleView center](self, "center");
  v29 = v28;
  v31 = v30;
  -[NUCrossFadeTitleView textAndGlyphView](self, "textAndGlyphView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v29, v31);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)titleImageView
{
  return self->_titleImageView;
}

- (NUTextAndGlyphView)textAndGlyphView
{
  return self->_textAndGlyphView;
}

- (void)setUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_update, a3);
}

- (void)setDisplayValueType:(unint64_t)a3
{
  self->_displayValueType = a3;
}

- (unint64_t)displayValueType
{
  return self->_displayValueType;
}

- (id)applyStylesToValueFromTitleViewUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NUCrossFadeTitleView *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  switch(objc_msgSend(v4, "valueType"))
  {
    case 0:
    case 3:
      goto LABEL_6;
    case 1:
      v5 = objc_msgSend(v4, "textAlignment");
      -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextAlignment:", v5);

      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUCrossFadeTitleView _applyStylesToText:styleType:](self, "_applyStylesToText:styleType:", v7, objc_msgSend(v4, "styleType"));
      v8 = (NUCrossFadeTitleView *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 2:
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUCrossFadeTitleView _applyStylesToTextAndGlyph:styleType:](self, "_applyStylesToTextAndGlyph:styleType:", v7, objc_msgSend(v4, "styleType"));
      v8 = (NUCrossFadeTitleView *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      self = v8;

      break;
    case 4:
      -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNumberOfLines:", 0);

      v10 = objc_msgSend(v4, "textAlignment");
      -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextAlignment:", v10);

LABEL_6:
      objc_msgSend(v4, "value");
      self = (NUCrossFadeTitleView *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return self;
}

- (void)relayoutWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NUCrossFadeTitleView update](self, "update");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NUCrossFadeTitleView updateTitleViewWithUpdate:animated:completion:](self, "updateTitleViewWithUpdate:animated:completion:", v5, v3, 0);

}

- (NUTitleViewUpdate)update
{
  return self->_update;
}

- (NUCrossFadeTitleView)initWithFrame:(CGRect)a3
{
  return -[NUCrossFadeTitleView initWithStyler:](self, "initWithStyler:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUCrossFadeTitleView)initWithCoder:(id)a3
{
  return -[NUCrossFadeTitleView initWithStyler:](self, "initWithStyler:", 0);
}

- (CGRect)visibleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  switch(-[NUCrossFadeTitleView displayValueType](self, "displayValueType"))
  {
    case 0uLL:
      -[NUCrossFadeTitleView titleImageView](self, "titleImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1uLL:
    case 4uLL:
      -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2uLL:
      -[NUCrossFadeTitleView textAndGlyphView](self, "textAndGlyphView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v8 = v7;
      objc_msgSend(v7, "frame");
      v2 = v9;
      v3 = v10;
      v4 = v11;
      v5 = v12;

      break;
    case 3uLL:
      v2 = *MEMORY[0x24BDBF090];
      v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
      break;
    default:
      break;
  }
  v13 = v2;
  v14 = v3;
  v15 = v4;
  v16 = v5;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_applyStylesToText:(id)a3 styleType:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v6 = a3;
  -[NUCrossFadeTitleView styler](self, "styler");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[NUCrossFadeTitleView styler](self, "styler"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "count");
      if (v13 >= 2)
        v14 = 2;
      else
        v14 = v13;
      -[NUCrossFadeTitleView titleLabel](self, "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNumberOfLines:", v14);

      -[NUCrossFadeTitleView styler](self, "styler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUCrossFadeTitleView bounds](self, "bounds");
      objc_msgSend(v16, "styleTitleText:styleType:boundingSize:", v6, a4, v17, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = v6;
  }

  return v19;
}

- (id)_applyStylesToTextAndGlyph:(id)a3 styleType:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NUTextAndGlyph *v12;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  NUTextAndGlyph *v19;
  void *v20;

  v6 = a3;
  -[NUCrossFadeTitleView styler](self, "styler");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NUCrossFadeTitleView styler](self, "styler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      if (!v6)
      {
        v12 = 0;
        goto LABEL_6;
      }
      objc_msgSend(v6, "attributedText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[NUCrossFadeTitleView styler](self, "styler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUCrossFadeTitleView bounds](self, "bounds");
        objc_msgSend(v14, "styleTitleText:styleType:boundingSize:", v15, a4, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = [NUTextAndGlyph alloc];
        objc_msgSend(v6, "glyph");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NUTextAndGlyph initWithAttributedText:glyph:](v19, "initWithAttributedText:glyph:", v18, v20);

        -[NUTextAndGlyph setAlignment:](v12, "setAlignment:", objc_msgSend(v6, "alignment"));
        goto LABEL_6;
      }
    }
  }
  v12 = (NUTextAndGlyph *)v6;
LABEL_6:

  return v12;
}

- (NUTitleViewStyler)styler
{
  return self->_styler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_textAndGlyphView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_styler, 0);
}

@end
