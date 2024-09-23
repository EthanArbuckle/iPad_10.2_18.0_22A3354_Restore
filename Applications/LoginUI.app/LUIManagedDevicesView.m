@implementation LUIManagedDevicesView

- (LUIManagedDevicesView)initWithFrame:(CGRect)a3
{
  LUIManagedDevicesView *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  UITextView *v16;
  UITextView *textView;
  UITextView *v18;
  void *v19;
  void *v20;
  UITextView *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)LUIManagedDevicesView;
  v3 = -[LUIManagedDevicesView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = v3->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedDevicesTextColor"));
    -[UILabel setTextColor:](v10, "setTextColor:", v12);

    v13 = v3->_titleLabel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "managedDevicesTitleFont"));
    -[UILabel setFont:](v13, "setFont:", v15);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    v16 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textView = v3->_textView;
    v3->_textView = v16;

    v18 = v3->_textView;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "managedDevicesTextColor"));
    -[UITextView setTextColor:](v18, "setTextColor:", v20);

    v21 = v3->_textView;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "managedDevicesTextFont"));
    -[UITextView setFont:](v21, "setFont:", v23);

    -[UITextView setEditable:](v3->_textView, "setEditable:", 0);
    -[LUIManagedDevicesView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[LUIManagedDevicesView addSubview:](v3, "addSubview:", v3->_textView);
    -[LUIManagedDevicesView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("LUIManagedDevicesView"));
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[LUIManagedDevicesView layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v4, "managedDevicesEdgeInsets");
  v6 = v5;
  v8 = v7;

  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UITextView sizeToFit](self->_textView, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  v10 = v9;
  v11 = 300.0;
  if (v10 >= 300.0)
    -[UILabel frame](self->_titleLabel, "frame");
  v12 = v8 + v8 + v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v13, "managedDevicesTitleToTextPadding");
  v15 = v6 * 2.0 + 88.0 + v14;
  -[UILabel frame](self->_titleLabel, "frame");
  v17 = v15 + v16;
  -[UITextView frame](self->_textView, "frame");
  v19 = v17 + v18;

  v20 = v12;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
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
  double v17;
  void *v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)LUIManagedDevicesView;
  -[LUIManagedDevicesView layoutSubviews](&v21, "layoutSubviews");
  -[LUIManagedDevicesView frame](self, "frame");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v5, "managedDevicesEdgeInsets");
  v7 = v6;
  v9 = v8;

  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UITextView sizeToFit](self->_textView, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  v11 = v10;
  -[UITextView frame](self->_textView, "frame");
  v12 = v4 + v9 * -2.0;
  -[UILabel frame](self->_titleLabel, "frame");
  if (v12 < v13)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v12 = v14;
  }
  if (v12 < 300.0)
    v12 = 300.0;
  v15 = v7 + 44.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v9, v15, v12, v11);
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v12, 1000.0);
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyStyle sharedStyle](LUIPrivacyStyle, "sharedStyle"));
  objc_msgSend(v18, "managedDevicesTitleToTextPadding");
  v20 = v15 + v11 + v19;

  -[UITextView setFrame:](self->_textView, "setFrame:", v9, v20, v12, v17);
}

- (void)setManagedDevicesText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_managedDevicesText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_managedDevicesText, a3);
    v5 = v6;
    if (v6)
    {
      -[UITextView setText:](self->_textView, "setText:", v6);
      -[LUIManagedDevicesView setNeedsLayout](self, "setNeedsLayout");
      v5 = v6;
    }
  }

}

- (void)setManagedDevicesAttributedText:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;

  v5 = (NSAttributedString *)a3;
  if (self->_managedDevicesAttributedText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_managedDevicesAttributedText, a3);
    v5 = v6;
    if (v6)
    {
      -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v6);
      -[LUIManagedDevicesView setNeedsLayout](self, "setNeedsLayout");
      v5 = v6;
    }
  }

}

- (void)setManagedDevicesTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_managedDevicesTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_managedDevicesTitle, a3);
    v5 = v6;
    if (v6)
    {
      -[UILabel setText:](self->_titleLabel, "setText:", v6);
      -[LUIManagedDevicesView setNeedsLayout](self, "setNeedsLayout");
      v5 = v6;
    }
  }

}

- (NSString)managedDevicesTitle
{
  return self->_managedDevicesTitle;
}

- (NSString)managedDevicesText
{
  return self->_managedDevicesText;
}

- (NSAttributedString)managedDevicesAttributedText
{
  return self->_managedDevicesAttributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedDevicesAttributedText, 0);
  objc_storeStrong((id *)&self->_managedDevicesText, 0);
  objc_storeStrong((id *)&self->_managedDevicesTitle, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
