@implementation TSSIMUnlockCalloutLabel

- (TSSIMUnlockCalloutLabel)initWithFrame:(CGRect)a3
{
  TSSIMUnlockCalloutLabel *v3;
  UILabel *v4;
  UILabel *textlabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *calloutImageView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSSIMUnlockCalloutLabel;
  v3 = -[TSSIMUnlockCalloutLabel initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    textlabel = v3->_textlabel;
    v3->_textlabel = v4;

    v6 = v3->_textlabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_textlabel, "setNumberOfLines:", 0);
    v8 = v3->_textlabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[TSSIMUnlockCalloutLabel addSubview:](v3, "addSubview:", v3->_textlabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("callout")));
    v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v10);
    calloutImageView = v3->_calloutImageView;
    v3->_calloutImageView = v11;

    -[TSSIMUnlockCalloutLabel addSubview:](v3, "addSubview:", v3->_calloutImageView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
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
  CGSize result;

  -[UILabel sizeThatFits:](self->_textlabel, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_calloutImageView, "image"));
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = v5 + v10 + 5.0;
  if (v7 >= v12)
    v14 = v7;
  else
    v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double x;
  double y;
  double width;
  double height;
  CGFloat v17;
  CGFloat v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20.receiver = self;
  v20.super_class = (Class)TSSIMUnlockCalloutLabel;
  -[TSSIMUnlockCalloutLabel layoutSubviews](&v20, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_calloutImageView, "image"));
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = -[TSSIMUnlockCalloutLabel bounds](self, "bounds");
  v21.origin.x = UIRectCenteredYInRect(v8, 0.0, 0.0, v5, v7, v9, v10, v11, v12);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  v17 = CGRectGetMaxX(v21) + 5.0;
  -[TSSIMUnlockCalloutLabel bounds](self, "bounds");
  v18 = CGRectGetWidth(v22) - v17;
  -[TSSIMUnlockCalloutLabel bounds](self, "bounds");
  v19 = CGRectGetHeight(v23);
  -[UIImageView setFrame:](self->_calloutImageView, "setFrame:", x, y, width, height);
  -[UILabel setFrame:](self->_textlabel, "setFrame:", v17, 0.0, v18, v19);
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_textlabel, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->_textlabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutImageView, 0);
  objc_storeStrong((id *)&self->_textlabel, 0);
}

@end
