@implementation EKUILocationEditItemCell

- (EKUILocationEditItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUILocationEditItemCell *v4;
  EKUILocationEditItemCell *v5;
  void *v6;
  EKUIClearButton *v7;
  void *v8;
  uint64_t v9;
  UIButton *clearButton;
  UILabel *v11;
  UILabel *title;
  void *v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *image;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  UIActivityIndicatorView *spinner;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIButton *v42;
  double v43;
  void *v44;
  void *v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)EKUILocationEditItemCell;
  v4 = -[EKUILocationEditItemCell initWithStyle:reuseIdentifier:](&v47, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[EKUILocationEditItemCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [EKUIClearButton alloc];
    ClearButtonImageColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EKUIClearButton initWithColor:](v7, "initWithColor:", v8);
    clearButton = v5->_clearButton;
    v5->_clearButton = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_clearButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v5->_clearButton);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    title = v5->_title;
    v5->_title = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_title, "setFont:", v13);

    -[EKUILocationEditItemCell textLabel](v5, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_title, "setTextColor:", v15);

    objc_msgSend(v6, "addSubview:", v5->_title);
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    image = v5->_image;
    v5->_image = v16;

    v18 = (void *)MEMORY[0x1E0DC3888];
    -[UILabel font](v5->_title, "font");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configurationWithFont:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v5->_image, "setPreferredSymbolConfiguration:", v20);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_image, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_image, "setContentHuggingPriority:forAxis:", 0, v21);
    LODWORD(v22) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_image, "setContentHuggingPriority:forAxis:", 1, v22);
    LODWORD(v23) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_image, "setContentCompressionResistancePriority:forAxis:", 0, v23);
    LODWORD(v24) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_image, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    objc_msgSend(v6, "addSubview:", v5->_image);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v25;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v27) = 1148846080;
    -[UIActivityIndicatorView setContentHuggingPriority:forAxis:](v5->_spinner, "setContentHuggingPriority:forAxis:", 0, v27);
    LODWORD(v28) = 1148846080;
    -[UIActivityIndicatorView setContentHuggingPriority:forAxis:](v5->_spinner, "setContentHuggingPriority:forAxis:", 1, v28);
    LODWORD(v29) = 1148846080;
    -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](v5->_spinner, "setContentCompressionResistancePriority:forAxis:", 0, v29);
    LODWORD(v30) = 1148846080;
    -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](v5->_spinner, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    objc_msgSend(v6, "addSubview:", v5->_spinner);
    _NSDictionaryOfVariableBindings(CFSTR("_title"), v5->_title, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(textPadding)-[_title]-(textPadding)-|"), 0, &unk_1E606FB60, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObjectsFromArray:", v33);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_image, 5, 0, v6, 5, 1.0, 16.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v34);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_image, 10, 0, v6, 10, 1.0, 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v35);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_spinner, 5, 0, v6, 5, 1.0, 16.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v36);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_spinner, 10, 0, v6, 10, 1.0, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v37);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_title, 5, 0, v6, 5, 1.0, 46.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v38);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_clearButton, 5, 0, v5->_title, 6, 1.0, 8.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v39);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_clearButton, 10, 0, v6, 10, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v40);

    v41 = (void *)MEMORY[0x1E0CB3718];
    v42 = v5->_clearButton;
    +[EKUIClearButton trailingOffsetToMarginForTextFieldClearButtonAlignment](EKUIClearButton, "trailingOffsetToMarginForTextFieldClearButtonAlignment");
    objc_msgSend(v41, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 18, 0, v42, 6, 1.0, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v44);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 8, 1, 0, 0, 1.0, 44.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v45);

    objc_msgSend(v6, "addConstraints:", v32);
  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v8.receiver = self;
  v8.super_class = (Class)EKUILocationEditItemCell;
  -[EKUILocationEditItemCell description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withObject:", CFSTR("_title"), self->_title);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_spinner"), self->_spinner);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_clearButton"), self->_clearButton);
  objc_msgSend(v5, "setKey:withObject:", CFSTR("_image"), self->_image);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateWithName:(id)a3 sourceSupportsAvailability:(BOOL)a4 availabilityRequestInProgress:(BOOL)a5 availabilityType:(int64_t)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  int v10;
  void *v11;
  UIImageView **p_image;
  void *v13;
  uint64_t v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v15 = a3;
  v10 = -[UIActivityIndicatorView isHidden](self->_spinner, "isHidden");
  if (!v8 || !v7)
  {
    if ((v10 & 1) == 0)
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
      -[UIImageView setHidden:](self->_image, "setHidden:", 0);
    }
    if (v8)
    {
      ImageForAvailabilityType(a6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      p_image = &self->_image;
      -[UIImageView setImage:](self->_image, "setImage:", v11);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](self->_image, "setTintColor:", v13);

      v14 = 0;
LABEL_10:
      -[UIImageView setHidden:](*p_image, "setHidden:", v14);
      goto LABEL_11;
    }
LABEL_9:
    p_image = &self->_image;
    v14 = 1;
    goto LABEL_10;
  }
  if (v10)
  {
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 0);
    goto LABEL_9;
  }
LABEL_11:
  -[UILabel setText:](self->_title, "setText:", v15);

}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
