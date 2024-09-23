@implementation HUCollectionTextViewCell

- (HUCollectionTextViewCell)initWithFrame:(CGRect)a3
{
  HUCollectionTextViewCell *v3;
  HUTappableTextView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)HUCollectionTextViewCell;
  v3 = -[HUCollectionTextViewCell initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HUTappableTextView);
    -[HUCollectionTextViewCell setMessageTextView:](v3, "setMessageTextView:", v4);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditable:", 0);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScrollEnabled:", 0);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    v13 = *MEMORY[0x1E0CEB4B0];
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextContainerInset:", v13, v14, v15, v16);

    -[HUCollectionTextViewCell contentView](v3, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    -[HUCollectionTextViewCell setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell contentView](v3, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v27);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell contentView](v3, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v33);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell contentView](v3, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v39);

    -[HUCollectionTextViewCell messageTextView](v3, "messageTextView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell contentView](v3, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCollectionTextViewCell;
  -[HUCollectionTextViewCell prepareForReuse](&v8, sel_prepareForReuse);
  -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTappableTextViewDelegate:", 0);

  -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

}

- (void)setContentConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a3;
  objc_opt_class();
  v19 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v19;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttributedText:", v7);
    }
    else
    {
      objc_msgSend(v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

    }
    objc_msgSend(v6, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    objc_msgSend(v6, "textProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    objc_msgSend(v6, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "adjustsFontForContentSizeCategory");
    -[HUCollectionTextViewCell messageTextView](self, "messageTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", v17);

  }
}

- (HUTappableTextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
  objc_storeStrong((id *)&self->_messageTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTextView, 0);
}

@end
