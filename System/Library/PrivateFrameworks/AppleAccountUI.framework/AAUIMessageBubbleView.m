@implementation AAUIMessageBubbleView

- (AAUIMessageBubbleView)initWithText:(id)a3
{
  id v5;
  AAUIMessageBubbleView *v6;
  AAUIMessageBubbleView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIMessageBubbleView;
  v6 = -[AAUIMessageBubbleView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bubbleText, a3);
    -[AAUIMessageBubbleView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AAUIMessageBubbleView _setupContentViewWithBubbleText:](v7, "_setupContentViewWithBubbleText:", v5);
  }

  return v7;
}

- (void)_setupContentViewWithBubbleText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  AAUIProfilePictureStore *v31;
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = objc_alloc_init(AAUIProfilePictureStore);
  -[AAUIProfilePictureStore setPictureDiameter:](v31, "setPictureDiameter:", 40.0);
  -[AAUIProfilePictureStore profilePictureForAccountOwner](v31, "profilePictureForAccountOwner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithAlignmentRectInsets:", 0.0, 0.0, 10.0, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v30);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setContentMode:", 2);
  -[AAUIMessageBubbleView _memoBalloonViewWithText:](self, "_memoBalloonViewWithText:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AAUIMessageBubbleView _horizontalStackView](self, "_horizontalStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  objc_msgSend(v8, "addArrangedSubview:", v6);
  objc_msgSend(v8, "addArrangedSubview:", v7);
  -[AAUIMessageBubbleView addSubview:](self, "addSubview:", v8);
  objc_msgSend(v7, "prepareForDisplay");
  objc_msgSend(v7, "sizeThatFits:", 200.0, 1.79769313e308);
  v10 = v9;
  v12 = v11;
  v22 = (void *)MEMORY[0x1E0CB3718];
  -[AAUIMessageBubbleView heightAnchor](self, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v27;
  objc_msgSend(v6, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 40.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  objc_msgSend(v7, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  objc_msgSend(v7, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v14;
  objc_msgSend(v7, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v12 * 0.899999976);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v16;
  objc_msgSend(v8, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMessageBubbleView centerXAnchor](self, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v20);

}

- (id)_memoBalloonViewWithText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D0D5D8], "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  CKBalloonViewForClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasTail:", 1);
  objc_msgSend(v5, "setBalloonCorners:", -1);
  objc_msgSend(v5, "setColor:", 0xFFFFFFFFLL);
  objc_msgSend(v5, "setCanUseOpaqueMask:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v3);
  if (objc_msgSend(v4, "hyphenatesTextContent"))
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    LODWORD(v9) = 1.0;
    objc_msgSend(v8, "setHyphenationFactor:", v9);
    objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v8, 0, objc_msgSend(v6, "length"));

  }
  v10 = objc_msgSend(v6, "length");
  if ((objc_msgSend(v3, "__ck_shouldUseBigEmoji") & 1) != 0)
    objc_msgSend(v4, "bigEmojiFont");
  else
    objc_msgSend(v4, "balloonTextFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v11, 0, v10);
  v12 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0D0D5D8], "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "theme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v12, v15, 0, v10);

  objc_msgSend(v5, "setAttributedText:", v6);
  objc_msgSend(v5, "setOrientation:", 0);

  return v5;
}

- (id)_horizontalStackView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAxis:", 0);
  objc_msgSend(v2, "setAlignment:", 4);
  objc_msgSend(v2, "setDistribution:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setSpacing:", 20.0);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleText, 0);
}

@end
