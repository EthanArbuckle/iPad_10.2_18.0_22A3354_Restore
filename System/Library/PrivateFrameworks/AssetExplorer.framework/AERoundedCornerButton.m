@implementation AERoundedCornerButton

- (void)_commonAERoundedCornerButtonInitializationWithStyle:(int64_t)a3 buttonType:(int64_t)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  -[AERoundedCornerButton _setLayoutStyle:](self, "_setLayoutStyle:");
  self->__buttonType = a4;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AERoundedCornerButton setBackgroundColor:](self, "setBackgroundColor:", v7);

  v8 = objc_alloc(MEMORY[0x24BEBD668]);
  -[AERoundedCornerButton bounds](self, "bounds");
  v26 = (id)objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(v26, "setContentMode:", 1);
  -[AERoundedCornerButton _setImageView:](self, "_setImageView:", v26);
  -[AERoundedCornerButton addSubview:](self, "addSubview:", v26);
  v9 = objc_alloc_init(MEMORY[0x24BEBD708]);
  switch(a3)
  {
    case 0:
      -[AERoundedCornerButton layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 12.5;
      goto LABEL_6;
    case 1:
      -[AERoundedCornerButton layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", 12.5);
      v13 = 15.0;
      goto LABEL_7;
    case 2:
      -[AERoundedCornerButton layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", 12.5);
      v13 = 17.0;
      goto LABEL_7;
    case 3:
      -[AERoundedCornerButton layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 2.0;
LABEL_6:
      objc_msgSend(v10, "setCornerRadius:", v12);
      v13 = 12.0;
LABEL_7:

      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v14);

      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v15);

  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  -[AERoundedCornerButton _setLabel:](self, "_setLabel:", v9);
  -[AERoundedCornerButton addSubview:](self, "addSubview:", v9);
  if (a4 == 1)
  {
    v21 = (void *)MEMORY[0x24BEBD640];
    AssetExplorerBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageNamed:inBundle:", CFSTR("albums"), v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("OPEN_PHOTO_LIBRARY_BUTTON_LABEL");
    goto LABEL_12;
  }
  v16 = 0;
  v17 = 0;
  if (!a4)
  {
    v18 = (void *)MEMORY[0x24BEBD640];
    AssetExplorerBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageNamed:inBundle:", CFSTR("camera"), v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("OPEN_CAMERA_BUTTON_LABEL");
LABEL_12:

    v22 = v20;
    AssetExplorerBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", v22, &stru_24E23C028, CFSTR("AssetExplorer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v26, "setImage:", v16);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v17);
  v25 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v25, "setParagraphSpacingBefore:", 0.0);
  objc_msgSend(v25, "setAlignment:", 1);
  objc_msgSend(v25, "setLineBreakMode:", 0);
  objc_msgSend(v24, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v25, 0, objc_msgSend(v17, "length"));
  objc_msgSend(v9, "setAttributedText:", v24);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)AERoundedCornerButton;
  -[AERoundedCornerButton layoutSubviews](&v31, sel_layoutSubviews);
  -[AERoundedCornerButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[AERoundedCornerButton _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AERoundedCornerButton _label](self, "_label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v8, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rangeOfString:", CFSTR(" "));

  v16 = -[AERoundedCornerButton _layoutStyle](self, "_layoutStyle");
  v17 = v16;
  if (v4 <= v6)
  {
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 1.79769313e308;
    }
    else
    {
      v21 = 0.0;
      if (v16 == 3)
        v21 = v4;
      v20 = 1.79769313e308;
      if (v16 >= 3)
        v4 = v21;
      else
        v4 = v4 + -25.0;
    }
  }
  else
  {
    objc_msgSend(v8, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointSize");
    v20 = v19;

  }
  objc_msgSend(v8, "sizeThatFits:", v4, v20);
  v23 = v22;
  v24 = 0.0;
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v25, v22);
  -[AERoundedCornerButton _interpolatedGlyphHorizontalInset](self, "_interpolatedGlyphHorizontalInset");
  v27 = v26;
  -[AERoundedCornerButton _interpolatedGlyphTopInset](self, "_interpolatedGlyphTopInset");
  v28 = v11 * 0.5 + v27;
  v30 = v13 * 0.5 + v29;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v13);
  objc_msgSend(v7, "setCenter:", v28, v30);
  if (v17 <= 3)
    v24 = dbl_21E25A120[v17];
  objc_msgSend(v8, "setCenter:", v28, v23 * 0.5 + v13 * 0.5 + v30 + v24);

}

- (double)_interpolatedGlyphHorizontalInset
{
  int64_t v3;
  double result;

  -[AERoundedCornerButton bounds](self, "bounds");
  v3 = -[AERoundedCornerButton _layoutStyle](self, "_layoutStyle");
  if ((unint64_t)(v3 - 1) < 2)
    return 34.0;
  if (v3 == 3 || (result = 0.0, !v3))
    UIRoundToViewScale();
  return result;
}

- (double)_interpolatedGlyphTopInset
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[AERoundedCornerButton bounds](self, "bounds");
  v4 = v3;
  -[AERoundedCornerButton _imageView](self, "_imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  -[AERoundedCornerButton _label](self, "_label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  return (v4 - (v8 + v11)) * 0.5;
}

- (int64_t)_layoutStyle
{
  return self->__layoutStyle;
}

- (void)_setLayoutStyle:(int64_t)a3
{
  self->__layoutStyle = a3;
}

- (int64_t)_buttonType
{
  return self->__buttonType;
}

- (UILabel)_label
{
  return self->__label;
}

- (void)_setLabel:(id)a3
{
  objc_storeStrong((id *)&self->__label, a3);
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setImageView:(id)a3
{
  objc_storeStrong((id *)&self->__imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__label, 0);
}

+ (id)roundedCornerButtonWithStyle:(int64_t)a3 buttonType:(int64_t)a4
{
  AERoundedCornerButton *v6;

  v6 = objc_alloc_init(AERoundedCornerButton);
  -[AERoundedCornerButton _commonAERoundedCornerButtonInitializationWithStyle:buttonType:](v6, "_commonAERoundedCornerButtonInitializationWithStyle:buttonType:", a3, a4);
  return v6;
}

@end
