@implementation MRUMarqueeLabel

- (void)mt_applyVisualStyling:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__MRUMarqueeLabel_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E581A098;
  v3[4] = self;
  objc_msgSend(a3, "applyToView:withColorBlock:", self, v3);
}

uint64_t __76__MRUMarqueeLabel_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextColor:", a2);
}

- (void)mru_applyVisualStylingWithColor:(id)a3 alpha:(double)a4 blendMode:(int64_t)a5
{
  id v8;

  v8 = a3;
  -[MRUMarqueeLabel setAlpha:](self, "setAlpha:", a4);
  -[MRUMarqueeLabel _setDrawsAsBackdropOverlayWithBlendMode:](self, "_setDrawsAsBackdropOverlayWithBlendMode:", a5);
  -[MRUMarqueeLabel setTextColor:](self, "setTextColor:", v8);

}

- (MRUMarqueeLabel)initWithFrame:(CGRect)a3
{
  MRUMarqueeLabel *v3;
  BSUIEmojiLabelView *v4;
  BSUIEmojiLabelView *label;
  MPUMarqueeView *v6;
  MPUMarqueeView *marqueeView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRUMarqueeLabel;
  v3 = -[MRUMarqueeLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E0D01920]);
    label = v3->_label;
    v3->_label = v4;

    -[BSUIEmojiLabelView setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
    v6 = (MPUMarqueeView *)objc_alloc_init(MEMORY[0x1E0D4B3B0]);
    marqueeView = v3->_marqueeView;
    v3->_marqueeView = v6;

    -[MPUMarqueeView contentView](v3->_marqueeView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_label);

    -[MPUMarqueeView setViewForContentSize:](v3->_marqueeView, "setViewForContentSize:", v3->_label);
    -[MRUMarqueeLabel addSubview:](v3, "addSubview:", v3->_marqueeView);
  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  double MinY;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v13.receiver = self;
  v13.super_class = (Class)MRUMarqueeLabel;
  -[MRUMarqueeLabel layoutSubviews](&v13, sel_layoutSubviews);
  -[MRUMarqueeLabel bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v7 = CGRectGetMinX(v14) - self->_fadeEdgeInsets.left;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinY = CGRectGetMinY(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetWidth(v16) + self->_fadeEdgeInsets.left;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  -[MPUMarqueeView setFrame:](self->_marqueeView, "setFrame:", v7, MinY, v9, CGRectGetHeight(v17));
  if (self->_textAlignment == 1
    && (v18.origin.x = x,
        v18.origin.y = y,
        v18.size.width = width,
        v18.size.height = height,
        v10 = self->_contentSize.width,
        v10 < CGRectGetWidth(v18)))
  {
    UIRectCenteredXInRect();
  }
  else if ((-[NSString _isNaturallyRTL](self->_text, "_isNaturallyRTL") & 1) != 0
         || (v12 = self->_contentSize.width,
             v19.origin.x = x,
             v19.origin.y = y,
             v19.size.width = width,
             v19.size.height = height,
             v12 < CGRectGetWidth(v19)))
  {
    -[MRUMarqueeLabel bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  }
  else
  {
    v11 = 0.0;
  }
  -[BSUIEmojiLabelView setFrame:](self->_label, "setFrame:", v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[BSUIEmojiLabelView sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *text;
  unsigned int v7;
  uint64_t v8;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  text = self->_text;
  self->_text = v5;

  -[BSUIEmojiLabelView setText:](self->_label, "setText:", v4);
  v7 = objc_msgSend(v4, "_isNaturallyRTL");

  -[MPUMarqueeView setAnimationDirection:](self->_marqueeView, "setAnimationDirection:", v7);
  if (v7)
    v8 = 4;
  else
    v8 = 3;
  -[MPUMarqueeView setSemanticContentAttribute:](self->_marqueeView, "setSemanticContentAttribute:", v8);
  -[MRUMarqueeLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_textColor, a3);
  v5 = a3;
  -[BSUIEmojiLabelView setTextColor:](self->_label, "setTextColor:", v5);

}

- (void)setAnimationReferenceView:(id)a3
{
  UIView **p_animationReferenceView;
  id v5;

  p_animationReferenceView = &self->_animationReferenceView;
  v5 = a3;
  objc_storeWeak((id *)p_animationReferenceView, v5);
  -[MPUMarqueeView setAnimationReferenceView:](self->_marqueeView, "setAnimationReferenceView:", v5);

}

- (void)setFont:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[BSUIEmojiLabelView setFont:](self->_label, "setFont:", v5);

}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
  -[BSUIEmojiLabelView setNumberOfLines:](self->_label, "setNumberOfLines:");
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[BSUIEmojiLabelView setTextAlignment:](self->_label, "setTextAlignment:");
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  self->_marqueeEnabled = a3;
  -[MPUMarqueeView setMarqueeEnabled:](self->_marqueeView, "setMarqueeEnabled:");
  if (!a3)
  {
    -[MPUMarqueeView resetMarqueePosition](self->_marqueeView, "resetMarqueePosition");
    -[MPUMarqueeView _removeAllAnimations:](self->_marqueeView, "_removeAllAnimations:", 1);
  }
}

- (void)setFadeEdgeInsets:(UIEdgeInsets)a3
{
  self->_fadeEdgeInsets = a3;
  -[MPUMarqueeView setFadeEdgeInsets:](self->_marqueeView, "setFadeEdgeInsets:");
  -[MRUMarqueeLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentGap:(double)a3
{
  self->_contentGap = a3;
  -[MPUMarqueeView setContentGap:](self->_marqueeView, "setContentGap:");
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
  -[MPUMarqueeView setContentSize:](self->_marqueeView, "setContentSize:");
  -[MRUMarqueeLabel setNeedsLayout](self, "setNeedsLayout");
}

- (id)viewForFirstBaselineLayout
{
  return (id)-[BSUIEmojiLabelView contentLabel](self->_label, "contentLabel");
}

- (BOOL)wantsContentAwareTypesettingLanguage
{
  void *v2;
  char v3;

  -[BSUIEmojiLabelView contentLabel](self->_label, "contentLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsContentAwareTypesettingLanguage");

  return v3;
}

- (void)setWantsContentAwareTypesettingLanguage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BSUIEmojiLabelView contentLabel](self->_label, "contentLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsContentAwareTypesettingLanguage:", v3);

}

- (int64_t)sizingRule
{
  void *v2;
  int64_t v3;

  -[BSUIEmojiLabelView contentLabel](self->_label, "contentLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sizingRule");

  return v3;
}

- (void)setSizingRule:(int64_t)a3
{
  id v4;

  -[BSUIEmojiLabelView contentLabel](self->_label, "contentLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSizingRule:", a3);

}

- (void)addCoordinatedMarqueeView:(id)a3
{
  MPUMarqueeView *marqueeView;
  id v4;

  marqueeView = self->_marqueeView;
  objc_msgSend(a3, "marqueeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPUMarqueeView addCoordinatedMarqueeView:](marqueeView, "addCoordinatedMarqueeView:", v4);

}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIView)animationReferenceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_animationReferenceView);
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (UIEdgeInsets)fadeEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fadeEdgeInsets.top;
  left = self->_fadeEdgeInsets.left;
  bottom = self->_fadeEdgeInsets.bottom;
  right = self->_fadeEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)contentGap
{
  return self->_contentGap;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BSUIEmojiLabelView)label
{
  return self->_label;
}

- (MPUMarqueeView)marqueeView
{
  return self->_marqueeView;
}

- (void)setMarqueeView:(id)a3
{
  objc_storeStrong((id *)&self->_marqueeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_animationReferenceView);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
