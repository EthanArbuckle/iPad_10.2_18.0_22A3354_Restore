@implementation MRURoutingSubtitleView

- (MRURoutingSubtitleView)initWithFrame:(CGRect)a3
{
  MRURoutingSubtitleView *v3;
  MRUEqualizerView *v4;
  MRUEqualizerView *equalizerView;
  UIImageView *v6;
  UIImageView *iconImageView;
  UILabel *v8;
  UILabel *textLabel;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRURoutingSubtitleView;
  v3 = -[MRURoutingSubtitleView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[MRUEqualizerView initWithNumberOfBars:width:spacing:]([MRUEqualizerView alloc], "initWithNumberOfBars:width:spacing:", 4, 2.0, 1.0);
    equalizerView = v3->_equalizerView;
    v3->_equalizerView = v4;

    -[MRURoutingSubtitleView addSubview:](v3, "addSubview:", v3->_equalizerView);
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v6;

    -[MRURoutingSubtitleView addSubview:](v3, "addSubview:", v3->_iconImageView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v8;

    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 1);
    -[MRURoutingSubtitleView addSubview:](v3, "addSubview:", v3->_textLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRURoutingSubtitleView updateContentSizeCategory](v3, "updateContentSizeCategory");
    -[MRURoutingSubtitleView updateVisibility](v3, "updateVisibility");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat MinX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  int64_t state;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v44.receiver = self;
  v44.super_class = (Class)MRURoutingSubtitleView;
  -[MRURoutingSubtitleView layoutSubviews](&v44, sel_layoutSubviews);
  -[MRURoutingSubtitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel font](self->_textLabel, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descender");
  UIRoundToViewScale();
  v13 = v12;

  -[UILabel font](self->_textLabel, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "capHeight");
  UIRoundToViewScale();
  v16 = v15;

  -[MRUEqualizerView sizeThatFits:](self->_equalizerView, "sizeThatFits:", v8, v10);
  v18 = v17;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  MinX = CGRectGetMinX(v45);
  v46.origin.x = v4;
  v46.origin.y = v6;
  v46.size.width = v8;
  v46.size.height = v10;
  v20 = v13 + CGRectGetMaxY(v46) - v16;
  -[MRURoutingSubtitleView bounds](self, "bounds");
  v40 = v20;
  v41 = MinX;
  v42 = v18;
  v43 = v16;
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUEqualizerView setFrame:](self->_equalizerView, "setFrame:");
  if (-[UIImage isSymbolImage](self->_icon, "isSymbolImage"))
  {
    -[UIImageView sizeThatFits:](self->_iconImageView, "sizeThatFits:", v8, v10);
    v22 = v21;
    v24 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingSubtitleFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pointSize");
    v22 = v26;
    objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingSubtitleFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pointSize");
    v24 = v28;

  }
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  v29 = CGRectGetMinX(v47);
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  v30 = (CGRectGetMaxY(v48) - v24) * 0.5;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v29, v30, v22, v24);
  state = self->_state;
  if ((unint64_t)(state - 1) < 2)
  {
    v33 = v40;
    v32 = v41;
    v34 = v42;
    v35 = v43;
LABEL_8:
    CGRectGetWidth(*(CGRect *)&v32);
    UIRectInset();
    v4 = v36;
    v6 = v37;
    v8 = v38;
    v10 = v39;
    goto LABEL_9;
  }
  if (state == 3)
  {
    v32 = v29;
    v33 = v30;
    v34 = v22;
    v35 = v24;
    goto LABEL_8;
  }
LABEL_9:
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v8, v10, *(_QWORD *)&v40, *(_QWORD *)&v41, *(_QWORD *)&v42, *(_QWORD *)&v43);
  MRUSizeCeilToViewScale(self);
  v49.origin.x = v4;
  v49.origin.y = v6;
  v49.size.width = v8;
  v49.size.height = v10;
  CGRectGetMinX(v49);
  v50.origin.x = v4;
  v50.origin.y = v6;
  v50.size.width = v8;
  v50.size.height = v10;
  CGRectGetMinY(v50);
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  CGRectGetWidth(v51);
  -[MRURoutingSubtitleView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_textLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[UILabel font](self->_textLabel, "font", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  UIRoundToViewScale();
  v6 = v5;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_text, a3);
  v5 = a3;
  -[UILabel setText:](self->_textLabel, "setText:", v5);

  -[MRURoutingSubtitleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIcon:(id)a3
{
  UIImage **p_icon;
  id v6;
  uint64_t v7;

  p_icon = &self->_icon;
  objc_storeStrong((id *)&self->_icon, a3);
  v6 = a3;
  -[UIImageView setImage:](self->_iconImageView, "setImage:", *p_icon);
  if (-[UIImage isSymbolImage](*p_icon, "isSymbolImage"))
    v7 = 4;
  else
    v7 = 1;
  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", v7);

  -[MRURoutingSubtitleView updateVisualStyling](self, "updateVisualStyling");
  -[MRURoutingSubtitleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[MRURoutingSubtitleView updateVisibility](self, "updateVisibility");
    -[MRURoutingSubtitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRURoutingSubtitleView updateVisualStyling](self, "updateVisualStyling");
    -[MRUEqualizerView setStylingProvider:](self->_equalizerView, "setStylingProvider:", v7);
  }

}

- (void)prepareForReuse
{
  -[UILabel setText:](self->_textLabel, "setText:", 0);
  -[MRURoutingSubtitleView setState:](self, "setState:", 0);
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_textLabel);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", -[UIImage isSymbolImage](self->_icon, "isSymbolImage"), self->_iconImageView);
}

- (void)updateContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingSubtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_textLabel, "setFont:", v3);

  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingSubtitleFont");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:scale:", v6, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_iconImageView, "setPreferredSymbolConfiguration:", v5);

}

- (void)updateVisibility
{
  uint64_t v3;
  uint64_t v4;
  double v5;

  v3 = 0;
  v4 = 1;
  v5 = 0.0;
  switch(self->_state)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v3 = 0;
      goto LABEL_4;
    case 2:
      v3 = 1;
LABEL_4:
      v5 = 1.0;
      goto LABEL_6;
    case 3:
      v3 = 0;
      v4 = 0;
LABEL_6:
      -[MRUEqualizerView setAlpha:](self->_equalizerView, "setAlpha:", v5);
      -[MRUEqualizerView setAnimating:](self->_equalizerView, "setAnimating:", v3);
      -[UIImageView setHidden:](self->_iconImageView, "setHidden:", v4);
      break;
    default:
      return;
  }
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)icon
{
  return self->_icon;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (MRUEqualizerView)equalizerView
{
  return self->_equalizerView;
}

- (void)setEqualizerView:(id)a3
{
  objc_storeStrong((id *)&self->_equalizerView, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_equalizerView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
