@implementation EKEventAttachmentCell

- (EKEventAttachmentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKEventAttachmentCell *v4;
  EKEventAttachmentCell *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EKEventAttachmentCell;
  v4 = -[EKEventAttachmentCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EKEventAttachmentCell traitCollection](v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUIUsesLargeTextLayout(v6))
      v7 = 2;
    else
      v7 = 1;
    -[EKEventAttachmentCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", v7);

  }
  return v5;
}

- (id)_iconForDocumentProxy:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v3, 6),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v3, 4),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v3, 7),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;

  }
  else
  {
LABEL_7:
    v5 = 0;
  }

  return v5;
}

- (void)setAttachment:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  -[EKEventAttachmentCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

  -[EKEventAttachmentCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", 0);

  -[EKEventAttachmentCell imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", 0);

  -[EKEventAttachmentCell setAccessoryType:](self, "setAccessoryType:", 0);
  v8 = v28;
  if (v28)
  {
    objc_msgSend(v28, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Untitled Attachment"), &stru_1E601DFA8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[EKEventAttachmentCell textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    if (!v9)
    {

    }
    objc_msgSend(v28, "fileSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v12, "longLongValue"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventAttachmentCell detailTextLabel](self, "detailTextLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

    }
    objc_msgSend(v28, "fileName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v28, "fileName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pathExtension");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "typeWithFilenameExtension:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    v23 = (void *)MEMORY[0x1E0CA58C8];
    objc_msgSend(v28, "fileName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "documentProxyForName:type:MIMEType:", v24, v22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventAttachmentCell _iconForDocumentProxy:](self, "_iconForDocumentProxy:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[EKEventAttachmentCell imageView](self, "imageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setImage:", v26);

    }
    v8 = v28;
  }

}

- (void)showSpinner:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;

  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    if (!activityIndicator)
    {
      v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v6 = self->_activityIndicator;
      self->_activityIndicator = v5;

      activityIndicator = self->_activityIndicator;
    }
    -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
    -[EKEventAttachmentCell setAccessoryView:](self, "setAccessoryView:", self->_activityIndicator);
  }
  else if (activityIndicator)
  {
    -[EKEventAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
    v7 = self->_activityIndicator;
    self->_activityIndicator = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
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
  double MaxX;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;

  v30.receiver = self;
  v30.super_class = (Class)EKEventAttachmentCell;
  -[EKEventAttachmentCell layoutSubviews](&v30, sel_layoutSubviews);
  -[EKEventAttachmentCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUIUsesLargeTextLayout(v3))
  {
    -[EKEventAttachmentCell imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[EKEventAttachmentCell imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v10 = v9;

      if (v10 <= 0.0)
        return;
      -[EKEventAttachmentCell imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;

      -[EKEventAttachmentCell imageView](self, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "image");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "size");
      v17 = v16;
      v19 = v18;

      if (v13 < v19)
        v13 = v19;
      v20 = v17 / v19 * v13;
      if (CalInterfaceIsLeftToRight())
      {
        -[EKEventAttachmentCell textLabel](self, "textLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frame");
        v23 = (v22 - v20) * 0.5;

      }
      else
      {
        -[EKEventAttachmentCell bounds](self, "bounds");
        v25 = v24;
        -[EKEventAttachmentCell textLabel](self, "textLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "frame");
        MaxX = CGRectGetMaxX(v31);

        v23 = MaxX + (v25 - MaxX - v20) * 0.5;
      }
      -[EKEventAttachmentCell frame](self, "frame");
      v29 = (v28 - v13) * 0.5;
      -[EKEventAttachmentCell imageView](self, "imageView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFrame:", v23, v29, v20, v13);
    }
    else
    {

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)EKEventAttachmentCell;
  -[EKEventAttachmentCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 54.0)
    v4 = 54.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
