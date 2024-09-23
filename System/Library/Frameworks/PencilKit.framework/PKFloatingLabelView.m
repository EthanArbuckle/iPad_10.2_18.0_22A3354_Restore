@implementation PKFloatingLabelView

+ (id)defaultFloatingLabelFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v0, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "fontWithDescriptor:size:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)attributedStringFromString:(void *)a3 font:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (objc_msgSend(v4, "length"))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v7 = *MEMORY[0x1E0DC1140];
    v12[0] = *MEMORY[0x1E0DC1138];
    v12[1] = v7;
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithString:attributes:", v4, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)floatingLabelViewWithString:(uint64_t)a3 font:(void *)a4 location:(void *)a5 traitCollection:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_opt_self();
  if (!v11)
  {
    +[PKFloatingLabelView defaultFloatingLabelFont]();
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[PKFloatingLabelView attributedStringFromString:font:](v13, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKFloatingLabelView floatingLabelViewWithAttributedString:font:location:traitCollection:](a1, a2, v13, v14, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (PKFloatingLabelView)floatingLabelViewWithAttributedString:(uint64_t)a3 font:(void *)a4 location:(void *)a5 traitCollection:(void *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  PKFloatingLabelView *v29;
  id v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  double v51;
  double v52;
  CGRect v54;
  CGRect v55;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_opt_self();
  v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v11, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  objc_msgSend(v12, "setNumberOfLines:", v16);
  objc_msgSend(v12, "setAttributedText:", v11);

  v51 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v52 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v12, "sizeThatFits:");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v10, "pointSize");
  v22 = fmax((v21 + 16.0) * 0.5, 16.0);
  objc_msgSend(v10, "descender");
  v24 = v23;

  v25 = v9;
  v26 = v12;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v27);
  objc_msgSend(v28, "_setContinuousCornerRadius:", v22);
  objc_msgSend(v28, "setClipsToBounds:", 1);
  v29 = objc_alloc_init(PKFloatingLabelView);
  -[PKFloatingLabelView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  -[PKFloatingLabelView layer](v29, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBorderColor:", v31);

  objc_msgSend(v25, "displayScale");
  if (v33 <= 1.0)
    v34 = 1.0;
  else
    v34 = 1.0 / v33;
  -[PKFloatingLabelView layer](v29, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBorderWidth:", v34);

  -[PKFloatingLabelView _setContinuousCornerRadius:](v29, "_setContinuousCornerRadius:", v22);
  v54.origin.x = a1 - v18 * 0.5;
  v54.origin.y = a2 - v20 * 0.5;
  v54.size.width = v18;
  v54.size.height = v20;
  v55 = CGRectInset(v54, -16.0, 0.0);
  v36 = v55.size.height + 16.0;
  v37 = -(v55.size.height + 16.0);
  if (v55.origin.y <= v36)
    v37 = v36;
  -[PKFloatingLabelView setFrame:](v29, "setFrame:", v55.origin.x, v55.origin.y + v37, v55.size.width, v36);
  objc_msgSend(v26, "setFrame:", 16.0, v36 - (v20 + 12.0 + v24), v18, v20);
  -[PKFloatingLabelView bounds](v29, "bounds");
  objc_msgSend(v28, "setFrame:");
  -[PKFloatingLabelView addSubview:](v29, "addSubview:", v28);
  -[PKFloatingLabelView addSubview:](v29, "addSubview:", v26);

  v38 = objc_msgSend(v25, "userInterfaceStyle");
  if (v38 != 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = objc_msgSend(v39, "CGColor");
    -[PKFloatingLabelView layer](v29, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setShadowColor:", v40);

    -[PKFloatingLabelView layer](v29, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setShadowRadius:", 20.0);

    -[PKFloatingLabelView layer](v29, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = 1041865114;
    objc_msgSend(v43, "setShadowOpacity:", v44);

    -[PKFloatingLabelView layer](v29, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setShadowOffset:", v52, v51);

    v46 = (void *)MEMORY[0x1E0DC3508];
    -[PKFloatingLabelView bounds](v29, "bounds");
    objc_msgSend(v46, "bezierPathWithRoundedRect:cornerRadius:");
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v48 = objc_msgSend(v47, "CGPath");
    -[PKFloatingLabelView layer](v29, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setShadowPath:", v48);

  }
  return v29;
}

@end
