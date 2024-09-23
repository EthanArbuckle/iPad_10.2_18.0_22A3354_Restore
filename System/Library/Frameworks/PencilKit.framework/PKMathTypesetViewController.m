@implementation PKMathTypesetViewController

+ (double)fontSize
{
  void *v0;
  double v1;
  double v2;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pointSize");
  v2 = v1;

  return v2;
}

- (void)loadView
{
  CGSize *p_contentSize;
  double *v4;
  void *v5;
  UIViewController *typesetViewController;
  void *v7;
  UIImageView *typesetImageView;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double *v15;
  UILabel *v16;
  UILabel *footerLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  UILabel *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  UILabel *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
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
  void *v67;
  void *v68;
  UIImageView *v69;

  p_contentSize = &self->_contentSize;
  v4 = (double *)MEMORY[0x1E0C9D820];
  self->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  typesetViewController = self->_typesetViewController;
  if (typesetViewController)
  {
    -[UIViewController view](typesetViewController, "view");
    v69 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v69, "setBackgroundColor:", v7);

LABEL_5:
    -[UIImageView intrinsicContentSize](v69, "intrinsicContentSize");
    v10 = v9;
    v12 = v11;
    p_contentSize->width = v9;
    p_contentSize->height = v11;
    goto LABEL_6;
  }
  typesetImageView = self->_typesetImageView;
  if (typesetImageView)
  {
    v69 = typesetImageView;
    -[UIImageView sizeToFit](v69, "sizeToFit");
    goto LABEL_5;
  }
  v69 = 0;
  v10 = *v4;
  v12 = v4[1];
LABEL_6:
  v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v14 = +[PKMathTypesetViewController fontSize]();
  v15 = (double *)MEMORY[0x1E0C9D538];
  if (self->_footerString)
  {
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v16;

    -[UILabel setText:](self->_footerLabel, "setText:", self->_footerString);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v18, "fontDescriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fontDescriptorWithSymbolicTraits:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointSize");
    objc_msgSend(v19, "fontWithDescriptor:size:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](self->_footerLabel, "setFont:", v22);
    -[UILabel setTextColor:](self->_footerLabel, "setTextColor:", self->_footerColor);
    -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
    v15 = (double *)MEMORY[0x1E0C9D538];
  }
  v23 = *v15;
  v24 = v15[1];
  v25 = self->_footerLabel;
  if (v25)
  {
    v26 = v14 * 0.5;
    -[UILabel setNumberOfLines:](v25, "setNumberOfLines:", 1);
    -[UILabel sizeToFit](self->_footerLabel, "sizeToFit");
    -[UILabel bounds](self->_footerLabel, "bounds");
    v29 = v28 + v26 * 2.0;
    v30 = 0.0;
    if (v12 <= v26 + v26)
      v31 = 0.0;
    else
      v31 = v26;
    p_contentSize->height = p_contentSize->height + v27;
    if (v69)
    {
      v26 = v12 - v31;
      if (v29 <= v10)
      {
        v30 = (v10 - v29) * 0.5;
      }
      else
      {
        v23 = (v29 - v10) * 0.5;
        p_contentSize->width = v29;
        v30 = 0.0;
      }
    }
    else
    {
      p_contentSize->width = v29;
      p_contentSize->height = v27 + v26 * 2.0;
    }
    -[UILabel setFrame:](self->_footerLabel, "setFrame:", v30, v26);
  }
  -[UIImageView setFrame:](v69, "setFrame:", v23, v24, v10, v12);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", p_contentSize->width);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v33);

  objc_msgSend(v13, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", p_contentSize->height);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v35);

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, p_contentSize->width, p_contentSize->height);
  if (v69)
  {
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", v69);
    -[UIImageView widthAnchor](v69, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v37);

    -[UIImageView heightAnchor](v69, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v39);

    objc_msgSend(v13, "safeAreaLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v69, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v43);

    objc_msgSend(v13, "safeAreaLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v69, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -v23);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v47);

  }
  if (self->_typesetViewController)
  {
    -[PKMathTypesetViewController addChildViewController:](self, "addChildViewController:");
    -[UIViewController didMoveToParentViewController:](self->_typesetViewController, "didMoveToParentViewController:", self);
  }
  v48 = self->_footerLabel;
  if (v48)
  {
    -[UILabel bounds](v48, "bounds");
    v50 = v49;
    v52 = v51;
    -[UILabel frame](self->_footerLabel, "frame");
    v54 = v53;
    v56 = v55;
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_footerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", self->_footerLabel);
    -[UILabel widthAnchor](self->_footerLabel, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToConstant:", v50);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v58);

    -[UILabel heightAnchor](self->_footerLabel, "heightAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToConstant:", v52);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v60);

    objc_msgSend(v13, "safeAreaLayoutGuide");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](self->_footerLabel, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, -v56);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v64);

    objc_msgSend(v13, "safeAreaLayoutGuide");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_footerLabel, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, -v54);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v68);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
  -[PKMathTypesetViewController setView:](self, "setView:", v13);

}

- (void)dealloc
{
  PKMathTypesetViewController *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (PKMathTypesetViewController *)self->_typesetViewController;
  -[PKMathTypesetViewController removeFromParentViewController](self, "removeFromParentViewController");
  v3.receiver = v2;
  v3.super_class = (Class)PKMathTypesetViewController;
  -[PKMathTypesetViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)viewTapped
{
  void (**tapAction)(void);

  if (self)
  {
    tapAction = (void (**)(void))self->_tapAction;
    if (tapAction)
      tapAction[2]();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGR, 0);
  objc_storeStrong((id *)&self->_footerString, 0);
  objc_storeStrong((id *)&self->_footerColor, 0);
  objc_storeStrong((id *)&self->_typesetImageView, 0);
  objc_storeStrong((id *)&self->_typesetViewController, 0);
  objc_storeStrong(&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end
