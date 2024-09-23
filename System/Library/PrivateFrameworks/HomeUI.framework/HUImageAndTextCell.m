@implementation HUImageAndTextCell

- (HUImageAndTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUImageAndTextCell *v4;
  uint64_t v5;
  UITextView *messageTextView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UILayoutGuide *infoImageViewTrailingMarginLayoutGuide;
  uint64_t v28;
  UIImageView *infoImageView;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HUImageAndTextCell;
  v4 = -[HUImageAndTextCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = (UITextView *)v5;

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEditable:", 0);

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScrollEnabled:", 0);

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v15 = *MEMORY[0x1E0CEB4B0];
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v18 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextContainerInset:", v15, v16, v17, v18);

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1148846080;
    objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 1, v21);

    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1132068864;
    objc_msgSend(v22, "setContentHuggingPriority:forAxis:", 1, v23);

    -[HUImageAndTextCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell messageTextView](v4, "messageTextView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    v26 = objc_opt_new();
    infoImageViewTrailingMarginLayoutGuide = v4->_infoImageViewTrailingMarginLayoutGuide;
    v4->_infoImageViewTrailingMarginLayoutGuide = (UILayoutGuide *)v26;

    v28 = objc_opt_new();
    infoImageView = v4->_infoImageView;
    v4->_infoImageView = (UIImageView *)v28;

    -[HUImageAndTextCell infoImageView](v4, "infoImageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUImageAndTextCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell infoImageView](v4, "infoImageView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v32);

    -[HUImageAndTextCell setImageViewRecommendedSize:](v4, "setImageViewRecommendedSize:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    -[HUImageAndTextCell setBackgroundColor:](v4, "setBackgroundColor:", 0);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUImageAndTextCell;
  -[HUImageAndTextCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUImageAndTextCell setItem:](self, "setItem:", 0);
  -[HUImageAndTextCell setImageViewRecommendedSize:](self, "setImageViewRecommendedSize:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  -[HUImageAndTextCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
}

- (void)setImageViewRecommendedSize:(CGSize)a3
{
  if (a3.width != self->_imageViewRecommendedSize.width || a3.height != self->_imageViewRecommendedSize.height)
  {
    self->_imageViewRecommendedSize = a3;
    -[HUImageAndTextCell _resetContentConstraints](self, "_resetContentConstraints");
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[HUImageAndTextCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    -[HUImageAndTextCell item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "identifier");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      HUImageNamed(v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[HUImageAndTextCell infoImageView](self, "infoImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v10);

    -[HUImageAndTextCell infoImageView](self, "infoImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentMode:", 1);

    -[HUImageAndTextCell item](self, "item");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "prefersDynamicString"))
    {
      -[HUImageAndTextCell messageTextView](self, "messageTextView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v18, "dynamicStringForSize:attributes:", MEMORY[0x1E0C9AA70], v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUImageAndTextCell messageTextView](self, "messageTextView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAttributedText:", v22);

    }
    else
    {
      objc_msgSend(v18, "stringWithAttributes:", MEMORY[0x1E0C9AA70]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUImageAndTextCell messageTextView](self, "messageTextView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAttributedText:", v19);
    }

    -[HUImageAndTextCell _resetContentConstraints](self, "_resetContentConstraints");
    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "invalidateIntrinsicContentSize");

    -[HUImageAndTextCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  else
  {
    -[HUImageAndTextCell infoImageView](self, "infoImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", 0);

    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", 0);

    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", 0);

    -[HUImageAndTextCell _resetContentConstraints](self, "_resetContentConstraints");
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUImageAndTextCell layoutMargins](self, "layoutMargins");
  v11 = v10;
  -[HUImageAndTextCell layoutMargins](self, "layoutMargins");
  v13 = width - (v11 + v12);
  -[HUImageAndTextCell infoImageView](self, "infoImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = MEMORY[0x1E0CEB988];
    -[HUImageAndTextCell imageViewRecommendedSize](self, "imageViewRecommendedSize");
    if (v18 == *(double *)(MEMORY[0x1E0C9D5E0] + 16) && v17 == *(double *)(MEMORY[0x1E0C9D5E0] + 24))
    {
      -[HUImageAndTextCell infoImageView](self, "infoImageView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "image");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "size");
      v21 = v24;

    }
    else
    {
      -[HUImageAndTextCell imageViewRecommendedSize](self, "imageViewRecommendedSize");
      v21 = v20;
    }
    height = *(double *)(v16 + 8);
    v13 = v13 - v21 + -24.0;
  }
  -[HUImageAndTextCell messageTextView](self, "messageTextView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v26 = a4;
  *(float *)&v27 = a5;
  objc_msgSend(v25, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, height, v26, v27);
  v29 = v28;
  v31 = v30;

  v32 = v29;
  v33 = v31;
  result.height = v33;
  result.width = v32;
  return result;
}

- (BOOL)prefersSeparatorsHidden
{
  return 1;
}

- (void)_resetContentConstraints
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[7];
  _QWORD v68[7];

  v68[5] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[HUImageAndTextCell contentConstraints](self, "contentConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  v6 = (void *)objc_opt_new();
  -[HUImageAndTextCell infoImageView](self, "infoImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUImageAndTextCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUImageAndTextCell infoImageViewTrailingMarginLayoutGuide](self, "infoImageViewTrailingMarginLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v9, "addLayoutGuide:", v10);

    -[HUImageAndTextCell imageViewRecommendedSize](self, "imageViewRecommendedSize");
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __46__HUImageAndTextCell__resetContentConstraints__block_invoke;
    v67[3] = &unk_1E6F4DEA0;
    v67[5] = v11;
    v67[6] = v12;
    v67[4] = self;
    __46__HUImageAndTextCell__resetContentConstraints__block_invoke((uint64_t)v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell infoImageView](self, "infoImageView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v61;
    -[HUImageAndTextCell infoImageView](self, "infoImageView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v56;
    -[HUImageAndTextCell infoImageViewTrailingMarginLayoutGuide](self, "infoImageViewTrailingMarginLayoutGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell infoImageView](self, "infoImageView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v50;
    -[HUImageAndTextCell infoImageViewTrailingMarginLayoutGuide](self, "infoImageViewTrailingMarginLayoutGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 24.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v15;
    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell infoImageViewTrailingMarginLayoutGuide](self, "infoImageViewTrailingMarginLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v19;
    v3 = 0x1E0CB3000;

    objc_msgSend(v19, "addObjectsFromArray:", v51);
    objc_msgSend(v19, "addObjectsFromArray:", v66);

  }
  else
  {
    objc_msgSend(v9, "removeLayoutGuide:", v10);

    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v26);
    -[HUImageAndTextCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUImageAndTextCell messageTextView](self, "messageTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v31);

  }
  -[HUImageAndTextCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUImageAndTextCell messageTextView](self, "messageTextView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v36);

  -[HUImageAndTextCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUImageAndTextCell messageTextView](self, "messageTextView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v41);

  -[HUImageAndTextCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layoutMarginsGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUImageAndTextCell messageTextView](self, "messageTextView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v47);

  -[HUImageAndTextCell setContentConstraints:](self, "setContentConstraints:", v6);
  v48 = *(void **)(v3 + 1816);
  -[HUImageAndTextCell contentConstraints](self, "contentConstraints");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v49);

}

id __46__HUImageAndTextCell__resetContentConstraints__block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (*(double *)(MEMORY[0x1E0C9D5E0] + 16) == *(double *)(a1 + 40)
    && *(double *)(MEMORY[0x1E0C9D5E0] + 24) == *(double *)(a1 + 48))
  {
    return MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(*(id *)(a1 + 32), "infoImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "infoImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", *(double *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(*(id *)(a1 + 32), "infoImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UITextView)messageTextView
{
  return self->_messageTextView;
}

- (CGSize)imageViewRecommendedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageViewRecommendedSize.width;
  height = self->_imageViewRecommendedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIImageView)infoImageView
{
  return self->_infoImageView;
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentConstraints, a3);
}

- (UILayoutGuide)infoImageViewTrailingMarginLayoutGuide
{
  return self->_infoImageViewTrailingMarginLayoutGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoImageViewTrailingMarginLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_infoImageView, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
