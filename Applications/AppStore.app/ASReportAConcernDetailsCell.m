@implementation ASReportAConcernDetailsCell

- (ASReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ASReportAConcernDetailsCell *v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASReportAConcernDetailsCell;
  v4 = -[ASReportAConcernDetailsCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textView = v4->_textView;
    v4->_textView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textLabel](v4, "textLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));
    -[UITextView setFont:](v4->_textView, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell contentView](v4, "contentView"));
    objc_msgSend(v9, "addSubview:", v4->_textView);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double MinY;
  double MinX;
  double MaxY;
  double v29;
  double MaxX;
  double v31;
  void *v32;
  CGFloat rect_8;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v38.receiver = self;
  v38.super_class = (Class)ASReportAConcernDetailsCell;
  -[ASReportAConcernDetailsCell layoutSubviews](&v38, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readableContentGuide"));
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textContainer"));
  objc_msgSend(v14, "lineFragmentPadding");
  v37 = v15;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell contentView](self, "contentView"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  rect_8 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  v34 = v6;
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v10;
  v39.size.height = v12;
  MinY = CGRectGetMinY(v39);
  v40.origin.x = v18;
  v40.origin.y = v20;
  v40.size.width = rect_8;
  v40.size.height = v24;
  v36 = MinY - CGRectGetMinY(v40);
  v41.origin.x = v6;
  v41.origin.y = v8;
  v41.size.width = v10;
  v41.size.height = v12;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = v18;
  v42.origin.y = v20;
  v42.size.width = rect_8;
  v42.size.height = v24;
  v35 = MinX - CGRectGetMinX(v42) - v37;
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = rect_8;
  v43.size.height = v24;
  MaxY = CGRectGetMaxY(v43);
  v44.origin.x = v34;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  v29 = MaxY - CGRectGetMaxY(v44);
  v45.origin.x = v18;
  v45.origin.y = v20;
  v45.size.width = rect_8;
  v45.size.height = v24;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = v34;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  v31 = MaxX - CGRectGetMaxX(v46) - v37;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
  objc_msgSend(v32, "setTextContainerInset:", v36, v35, v29, v31);

}

- (void)setPlaceholderText:(id)a3
{
  void *v5;

  objc_storeStrong((id *)&self->_placeholderText, a3);
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
    objc_msgSend(v5, "setDelegate:", self);

    -[ASReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 0);
  }
}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell placeholderText](self, "placeholderText"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

  }
  return (NSString *)v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[ASReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 1);
}

- (void)textViewDidEndEditing:(id)a3
{
  -[ASReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 0);
}

- (void)updatePlaceholderText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v7 = v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell placeholderText](self, "placeholderText"));
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
      objc_msgSend(v10, "setText:", &stru_100784D38);

      v16 = (id)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textLabel](self, "textLabel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
      objc_msgSend(v12, "setTextColor:", v11);

LABEL_7:
    }
  }
  else
  {
    v13 = objc_msgSend(v6, "length");

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell placeholderText](self, "placeholderText"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
      objc_msgSend(v15, "setText:", v14);

      v16 = (id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASReportAConcernDetailsCell textView](self, "textView"));
      objc_msgSend(v11, "setTextColor:", v16);
      goto LABEL_7;
    }
  }
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

@end
