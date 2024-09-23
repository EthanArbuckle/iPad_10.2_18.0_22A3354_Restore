@implementation GKBaseComposeHeaderField

- (GKBaseComposeHeaderField)initWithFrame:(CGRect)a3
{
  GKBaseComposeHeaderField *v3;
  GKBaseComposeHeaderField *v4;
  GKLabel *v5;
  GKLabel *nameLabel;
  double v7;
  double v8;
  uint64_t v9;
  GKHairlineView *separatorView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GKBaseComposeHeaderField;
  v3 = -[GKBaseComposeHeaderField initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[GKBaseComposeHeaderField setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_maxLineCount = 1;
    -[GKBaseComposeHeaderField setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    v5 = objc_alloc_init(GKLabel);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v5;

    -[GKLabel setOpaque:](v4->_nameLabel, "setOpaque:", 0);
    -[GKLabel setBackgroundColor:](v4->_nameLabel, "setBackgroundColor:", 0);
    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setUserInteractionEnabled:](v4->_nameLabel, "setUserInteractionEnabled:", 0);
    LODWORD(v7) = 1144750080;
    -[GKLabel setContentHuggingPriority:forAxis:](v4->_nameLabel, "setContentHuggingPriority:forAxis:", 0, v7);
    LODWORD(v8) = 1148846080;
    -[GKLabel setContentCompressionResistancePriority:forAxis:](v4->_nameLabel, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    +[GKHairlineView hairlineViewForAlignment:](GKHairlineView, "hairlineViewForAlignment:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    separatorView = v4->_separatorView;
    v4->_separatorView = (GKHairlineView *)v9;

    -[GKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKBaseComposeHeaderField addSubview:](v4, "addSubview:", v4->_nameLabel);
    -[GKBaseComposeHeaderField addSubview:](v4, "addSubview:", v4->_separatorView);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_nameLabel, 5, 0, v4, 5, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_nameLabel, 12, 0, v4, 3, 1.0, 27.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_separatorView, 4, 0, v4, 4, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_separatorView, 1, 0, v4, 1, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_separatorView, 2, 0, v4, 2, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKBaseComposeHeaderField addConstraint:](v4, "addConstraint:", v11);
    -[GKBaseComposeHeaderField addConstraint:](v4, "addConstraint:", v12);
    -[GKBaseComposeHeaderField addConstraint:](v4, "addConstraint:", v13);
    -[GKBaseComposeHeaderField addConstraint:](v4, "addConstraint:", v14);
    -[GKBaseComposeHeaderField addConstraint:](v4, "addConstraint:", v15);

  }
  return v4;
}

- (void)addConstraintsForValueView:(id)a3
{
  void *v4;
  GKLabel *nameLabel;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3718];
  nameLabel = self->_nameLabel;
  v6 = a3;
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 12, 0, nameLabel, 12, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v6, 11, 1.0, 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, self->_nameLabel, 6, 1.0, 6.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, self, 18, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 8, 1, self->_nameLabel, 8, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v13[3] = v10;
  v13[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseComposeHeaderField addConstraints:](self, "addConstraints:", v12);

}

- (NSString)nameText
{
  void *v2;
  void *v3;
  void *v4;

  -[GKBaseComposeHeaderField nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setNameText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  GKLabel *nameLabel;
  id v11;

  v4 = (void *)MEMORY[0x1E0D25B28];
  v5 = a3;
  objc_msgSend(v4, "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composeFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "alignment:lineBreakMode:", 4, 4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_gkAttributedStringByApplyingStyle:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  nameLabel = self->_nameLabel;
  if (v9)
    -[GKLabel setAttributedText:](nameLabel, "setAttributedText:", v8);
  else
    -[GKLabel setText:](nameLabel, "setText:", 0);
  -[GKBaseComposeHeaderField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (NSString)valueText
{
  return (NSString *)&stru_1E59EB978;
}

- (CGRect)valueFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)viewForBaselineLayout
{
  return self->_nameLabel;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_actionWhenTouched != 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  if (self->_actionWhenTouched)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_gkSendAction:viaResponder:withObject:", self->_actionWhenTouched, self, self);

  }
}

- (GKLabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (GKHairlineView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (unint64_t)maxLineCount
{
  return self->_maxLineCount;
}

- (SEL)actionWhenTouched
{
  return self->_actionWhenTouched;
}

- (void)setActionWhenTouched:(SEL)a3
{
  self->_actionWhenTouched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
