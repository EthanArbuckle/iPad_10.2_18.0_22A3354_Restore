@implementation _MFSecureMIMEPersonHeaderLabel

- (_MFSecureMIMEPersonHeaderLabel)initWithImage:(id)a3 text:(id)a4 textColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _MFSecureMIMEPersonHeaderLabel *v15;
  _MFSecureMIMEPersonHeaderLabel *v16;
  void *v17;
  uint64_t v18;
  UIImageView *imageView;
  void *v20;
  uint64_t v21;
  UILabel *label;
  void *v23;
  void *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_MFSecureMIMEPersonHeaderLabel;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[_MFSecureMIMEPersonHeaderLabel initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    -[_MFSecureMIMEPersonHeaderLabel setAutoresizesSubviews:](v15, "setAutoresizesSubviews:", 1);
    -[_MFSecureMIMEPersonHeaderLabel setAutoresizingMask:](v16, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFSecureMIMEPersonHeaderLabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    imageView = v16->_imageView;
    v16->_imageView = (UIImageView *)v18;

    -[_MFSecureMIMEPersonHeaderLabel addSubview:](v16, "addSubview:", v16->_imageView);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    label = v16->_label;
    v16->_label = (UILabel *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v16->_label, "setBackgroundColor:", v23);

    -[UILabel setText:](v16->_label, "setText:", v9);
    -[UILabel setTextColor:](v16->_label, "setTextColor:", v10);
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v20, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16->_label, "setFont:", v24);

    -[_MFSecureMIMEPersonHeaderLabel addSubview:](v16, "addSubview:", v16->_label);
  }

  return v16;
}

- (void)setText:(id)a3
{
  id v4;

  v4 = a3;
  -[UILabel setText:](self->_label, "setText:");
  -[_MFSecureMIMEPersonHeaderLabel setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  UIImageView *imageView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  imageView = self->_imageView;
  -[UIImageView bounds](imageView, "bounds", a3.width, a3.height);
  -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", v6, v7);
  v9 = v8;
  -[UILabel text](self->_label, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_label, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_legacy_sizeWithFont:", v11);
  v13 = v12;

  if (v9 >= v13)
    v14 = v9;
  else
    v14 = v13;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double v3;
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

  -[_MFSecureMIMEPersonHeaderLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
  -[UIImageView frame](self->_imageView, "frame");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, (v6 - v7) * 0.5);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel frame](self->_label, "frame");
  -[_MFSecureMIMEPersonHeaderLabel bounds](self, "bounds");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  UIRectCenteredYInRectScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (v14 <= v4 - v10)
    v17 = v14;
  else
    v17 = v4 - v10;
  -[UILabel setFrame:](self->_label, "setFrame:", v10, v12, v17, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
