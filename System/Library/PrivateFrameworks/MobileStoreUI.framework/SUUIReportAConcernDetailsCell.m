@implementation SUUIReportAConcernDetailsCell

- (SUUIReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIReportAConcernDetailsCell *v4;
  id v5;
  uint64_t v6;
  UITextView *textView;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIReportAConcernDetailsCell;
  v4 = -[SUUIReportAConcernDetailsCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBDA88]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    -[SUUIReportAConcernDetailsCell textLabel](v4, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_textView, "setFont:", v9);

    -[SUUIReportAConcernDetailsCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_textView);

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
  v38.super_class = (Class)SUUIReportAConcernDetailsCell;
  -[SUUIReportAConcernDetailsCell layoutSubviews](&v38, sel_layoutSubviews);
  -[SUUIReportAConcernDetailsCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readableContentGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SUUIReportAConcernDetailsCell textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineFragmentPadding");
  v37 = v15;

  -[SUUIReportAConcernDetailsCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  rect_8 = v21;
  v24 = v23;

  -[SUUIReportAConcernDetailsCell textView](self, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[SUUIReportAConcernDetailsCell textView](self, "textView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextContainerInset:", v36, v35, v29, v31);

}

- (void)setPlaceholderText:(id)a3
{
  void *v5;

  objc_storeStrong((id *)&self->_placeholderText, a3);
  if (a3)
  {
    -[SUUIReportAConcernDetailsCell textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[SUUIReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 0);
  }
}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[SUUIReportAConcernDetailsCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsCell placeholderText](self, "placeholderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[SUUIReportAConcernDetailsCell textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[SUUIReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 1);
}

- (void)textViewDidEndEditing:(id)a3
{
  -[SUUIReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 0);
}

- (void)updatePlaceholderText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[SUUIReportAConcernDetailsCell textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    -[SUUIReportAConcernDetailsCell placeholderText](self, "placeholderText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      -[SUUIReportAConcernDetailsCell textView](self, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", &stru_2511FF0C8);

      -[SUUIReportAConcernDetailsCell textLabel](self, "textLabel");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIReportAConcernDetailsCell textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", v11);

LABEL_7:
    }
  }
  else
  {
    v13 = objc_msgSend(v6, "length");

    if (!v13)
    {
      -[SUUIReportAConcernDetailsCell placeholderText](self, "placeholderText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIReportAConcernDetailsCell textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

      objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIReportAConcernDetailsCell textView](self, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
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
