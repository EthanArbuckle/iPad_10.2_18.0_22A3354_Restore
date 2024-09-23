@implementation GKMoreExistSectionFooterView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (double)defaultHeight
{
  return 63.0;
}

- (GKMoreExistSectionFooterView)initWithFrame:(CGRect)a3
{
  GKMoreExistSectionFooterView *v3;
  GKMoreExistSectionFooterView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  GKLabel *v9;
  GKLabel *label;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GKMoreExistSectionFooterView;
  v3 = -[GKMoreExistSectionFooterView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[GKMoreExistSectionFooterView bounds](v3, "bounds");
    v9 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
    label = v4->_label;
    v4->_label = v9;

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setBackgroundColor:](v4->_label, "setBackgroundColor:", 0);
    -[GKLabel setOpaque:](v4->_label, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
    {
      if (*MEMORY[0x1E0D253F8])
        v13 = *MEMORY[0x1E0D25B68] == 0;
      else
        v13 = 0;
      v14 = v13;
    }
    else
    {
      v14 = 1;
    }
    -[GKLabel setShouldInhibitReplay:](v4->_label, "setShouldInhibitReplay:", v14);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_label, 9, 0, v4, 9, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_label, 10, 0, v4, 10, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMoreExistSectionFooterView addConstraint:](v4, "addConstraint:", v15);
    -[GKMoreExistSectionFooterView addConstraint:](v4, "addConstraint:", v16);
    -[GKMoreExistSectionFooterView addSubview:](v4, "addSubview:", v4->_label);

  }
  return v4;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[GKLabel attributedText](self->_label, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D25B28];
  v5 = a3;
  objc_msgSend(v4, "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableFooterStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_gkAttributedStringByApplyingStyle:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLabel setAttributedText:](self->_label, "setAttributedText:", v7);
}

- (GKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
