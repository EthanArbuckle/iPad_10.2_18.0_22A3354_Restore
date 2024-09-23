@implementation AVMobileContentTagView

- (AVMobileContentTagView)initWithContentTag:(id)a3 withStyleSheet:(id)a4
{
  id v7;
  id v8;
  AVMobileContentTagView *v9;
  AVMobileContentTagView *v10;
  id *p_contentTag;
  UIView *v12;
  UIView *contentView;
  UILabel *v14;
  UILabel *contentTagViewLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AVMobileContentTagView;
  v9 = -[AVMobileContentTagView init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    p_contentTag = (id *)&v9->_contentTag;
    objc_storeStrong((id *)&v9->_contentTag, a3);
    objc_storeStrong((id *)&v10->_styleSheet, a4);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v10->_contentView;
    v10->_contentView = v12;

    -[AVMobileContentTagView addSubview:](v10, "addSubview:", v10->_contentView);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    contentTagViewLabel = v10->_contentTagViewLabel;
    v10->_contentTagViewLabel = v14;

    v16 = v10->_contentTagViewLabel;
    objc_msgSend(*p_contentTag, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v16, "setText:", v17);

    v18 = v10->_contentTagViewLabel;
    objc_msgSend(*p_contentTag, "tintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

    v20 = v10->_contentTagViewLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    -[UILabel setTextAlignment:](v10->_contentTagViewLabel, "setTextAlignment:", 1);
    -[UILabel setAutoresizingMask:](v10->_contentTagViewLabel, "setAutoresizingMask:", 0);
    v22 = v10->_contentTagViewLabel;
    objc_msgSend(*p_contentTag, "layoutMargins");
    -[UILabel setLayoutMargins:](v22, "setLayoutMargins:");
    -[AVMobileContentTagView _updateContentTagLabelFont]((uint64_t)v10);
    -[UIView layer](v10->_contentView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMasksToBounds:", 1);

    -[UIView addSubview:](v10->_contentView, "addSubview:", v10->_contentTagViewLabel);
  }

  return v10;
}

- (void)setContentTag:(id)a3
{
  AVMobileContentTag *v5;
  AVMobileContentTag **p_contentTag;
  UILabel *contentTagViewLabel;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  AVMobileContentTag *v12;

  v5 = (AVMobileContentTag *)a3;
  p_contentTag = &self->_contentTag;
  if (self->_contentTag != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_contentTag, a3);
    contentTagViewLabel = self->_contentTagViewLabel;
    -[AVMobileContentTag title](*p_contentTag, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](contentTagViewLabel, "setText:", v8);

    v9 = self->_contentTagViewLabel;
    -[AVMobileContentTag tintColor](*p_contentTag, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = self->_contentTagViewLabel;
    -[AVMobileContentTag layoutMargins](*p_contentTag, "layoutMargins");
    -[UILabel setLayoutMargins:](v11, "setLayoutMargins:");
    -[AVMobileContentTagView _updateContentTagLabelFont]((uint64_t)self);
    -[AVMobileContentTagView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet *v6;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVMobileContentTagView _updateContentTagLabelFont]((uint64_t)self);
    v5 = v6;
  }

}

- (CGSize)intrinsicContentSize
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
  double v13;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_contentTagViewLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[AVMobileContentTag layoutMargins](self->_contentTag, "layoutMargins");
  v9 = v4 + v7 + v8;
  v12 = v6 + v10 + v11;
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  UIView *contentView;
  UILabel *contentTagViewLabel;
  float v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVMobileContentTagView;
  -[AVMobileContentTagView layoutSubviews](&v10, sel_layoutSubviews);
  contentView = self->_contentView;
  -[AVMobileContentTagView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
  contentTagViewLabel = self->_contentTagViewLabel;
  -[UIView frame](self->_contentView, "frame");
  -[UILabel setFrame:](contentTagViewLabel, "setFrame:");
  -[AVMobileContentTag normalizedCornerRadius](self->_contentTag, "normalizedCornerRadius");
  v6 = v5;
  -[UILabel frame](self->_contentTagViewLabel, "frame");
  v8 = v7 * v6;
  -[UIView layer](self->_contentView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

}

- (AVMobileContentTag)contentTag
{
  return self->_contentTag;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_contentTag, 0);
  objc_storeStrong((id *)&self->_contentTagViewLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_updateContentTagLabelFont
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 432), "placement");
    if (v2 == 1)
    {
      v3 = *(void **)(a1 + 424);
      objc_msgSend(*(id *)(a1 + 440), "prominentContentTagFont");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2)
        return;
      v3 = *(void **)(a1 + 424);
      objc_msgSend(*(id *)(a1 + 440), "contentTagFont");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v4;
    objc_msgSend(v3, "setFont:");

  }
}

@end
