@implementation DDConversionPreviewController

- (DDConversionPreviewController)initWithTitle:(id)a3 subTitle:(id)a4 finance:(BOOL)a5
{
  __CFString *v8;
  __CFString *v9;
  DDConversionPreviewController *v10;
  DDConversionPreviewController *v11;
  __CFString *v12;
  __CFString *v13;
  objc_super v15;

  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)DDConversionPreviewController;
  v10 = -[DDConversionPreviewController init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    if (v8)
      v12 = v8;
    else
      v12 = &stru_1E4259460;
    objc_storeStrong((id *)&v10->_title, v12);
    if (v9)
      v13 = v9;
    else
      v13 = &stru_1E4259460;
    objc_storeStrong((id *)&v11->_subtitle, v13);
    v11->_finance = a5;
  }

  return v11;
}

- (id)view
{
  UIView *mainView;
  UIView *v4;
  UIView *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIView *v33;
  void *v34;
  UIView *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v67;

  mainView = self->_mainView;
  if (!mainView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v5 = self->_mainView;
    self->_mainView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_mainView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_mainView, "setBackgroundColor:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_mainView, "addSubview:", v7);
    v8 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setText:", self->_title);
    objc_msgSend(v8, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v10);

    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v7, "addSubview:", v8);
    v11 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "setTextAlignment:", 1);
    objc_msgSend(v11, "setText:", self->_subtitle);
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v7, "addSubview:", v11);
    if (!self->_finance)
      goto LABEL_5;
    v14 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("YahooFinance"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "imageWithRenderingMode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v17);
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v19);

    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_mainView, "addSubview:", v18);

    if (v18)
    {
      _NSDictionaryOfVariableBindings(CFSTR("title, subtitle, textContainer, attribution"), v8, v11, v7, v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = 0;
    }
    else
    {
LABEL_5:
      _NSDictionaryOfVariableBindings(CFSTR("title, subtitle, textContainer"), v8, v11, v7, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[title]-(>=0)-|"), 0, &unk_1E426C2A8, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v21);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[subtitle]-(>=0)-|"), 0, &unk_1E426C2A8, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v22);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[title][subtitle]|"), 0, &unk_1E426C2A8, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v23);

    objc_msgSend(v7, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    objc_msgSend(v7, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[UIView centerXAnchor](self->_mainView, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    v33 = self->_mainView;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=margin)-[textContainer]-(>=margin)-|"), 0, &unk_1E426C2A8, v20);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v33, "addConstraints:", v34);

    v35 = self->_mainView;
    v36 = (void *)MEMORY[0x1E0CB3718];
    if ((v67 & 1) != 0)
    {
      v37 = CFSTR("V:|-(>=margin)-[textContainer]-(>=margin)-|");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=margin)-[attribution(77)]-(margin)-|"), 0, &unk_1E426C2A8, v20);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraints:](v35, "addConstraints:", v38);

      v35 = self->_mainView;
      v36 = (void *)MEMORY[0x1E0CB3718];
      v37 = CFSTR("V:|-(>=margin)-[textContainer]-(>=margin)-[attribution(11)]-(margin)-|");
    }
    objc_msgSend(v36, "constraintsWithVisualFormat:options:metrics:views:", v37, 0, &unk_1E426C2A8, v20);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v35, "addConstraints:", v39);

    objc_msgSend(v7, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_mainView, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    objc_msgSend(v7, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_mainView, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[DDConversionPreviewController preferredWidth](self, "preferredWidth");
    v47 = v46;
    -[DDConversionPreviewController preferredWidth](self, "preferredWidth");
    if (v48 <= v47)
      v49 = v48;
    else
      v49 = v47;
    v50 = v47 + -20.0;
    objc_msgSend(v8, "setPreferredMaxLayoutWidth:", v50);
    objc_msgSend(v11, "setPreferredMaxLayoutWidth:", v50);
    objc_msgSend(v8, "sizeThatFits:", v49 + -20.0, -1.0);
    v53 = v51;
    v54 = v52;
    if (v51 > v50)
    {
      v54 = v52 * (v50 / v51);
      v53 = v50;
    }
    objc_msgSend(v11, "sizeThatFits:", v49 + -20.0, -1.0);
    if (v55 <= v50)
      v50 = v55;
    else
      v56 = v56 * (v50 / v55);
    v57 = 21.0;
    if (v67)
      v57 = 0.0;
    if (v50 >= v53)
      v58 = v50;
    else
      v58 = v53;
    v59 = v58 + 20.0;
    if (v49 >= v59)
      v60 = v49;
    else
      v60 = v59;
    v61 = v57 + fmax(v54 + v56 + 20.0, 85.0);
    -[UIView widthAnchor](self->_mainView, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToConstant:", v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setActive:", 1);

    -[UIView heightAnchor](self->_mainView, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToConstant:", v61);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    self->_naturalTextSize.width = v60;
    self->_naturalTextSize.height = v61;

    mainView = self->_mainView;
  }
  return mainView;
}

- (double)preferredWidth
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 325.0;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "statusBarOrientation");

  if ((unint64_t)(v5 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
    return 325.0;
  else
    return 270.0;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalTextSize.width;
  height = self->_naturalTextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mainView, 0);
}

@end
