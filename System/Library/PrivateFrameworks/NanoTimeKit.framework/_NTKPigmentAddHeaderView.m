@implementation _NTKPigmentAddHeaderView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_NTKPigmentAddHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _NTKPigmentAddHeaderView *v7;
  uint64_t v8;
  UILabel *label;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_NTKPigmentAddHeaderView;
  v7 = -[_NTKPigmentAddHeaderView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    label = v7->_label;
    v7->_label = (UILabel *)v8;

    BPSTextColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_label, "setTextColor:", v10);

    -[_NTKPigmentAddHeaderView addSubview:](v7, "addSubview:", v7->_label);
    v21 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v7->_label, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKPigmentAddHeaderView leadingAnchor](v7, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    -[UILabel trailingAnchor](v7->_label, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKPigmentAddHeaderView trailingAnchor](v7, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v11;
    -[UILabel topAnchor](v7->_label, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKPigmentAddHeaderView topAnchor](v7, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v14;
    -[UILabel bottomAnchor](v7->_label, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKPigmentAddHeaderView bottomAnchor](v7, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v18);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel__fontSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[_NTKPigmentAddHeaderView _fontSizeDidChange](v7, "_fontSizeDidChange");
  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddHeaderView;
  -[_NTKPigmentAddHeaderView dealloc](&v4, sel_dealloc);
}

- (void)setName:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
  -[_NTKPigmentAddHeaderView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)_font
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)*MEMORY[0x1E0DC48D0];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending)
  {
    v6 = v5;

    v4 = v6;
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_fontSizeDidChange
{
  UILabel *label;
  void *v4;

  label = self->_label;
  objc_msgSend((id)objc_opt_class(), "_font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](label, "setFont:", v4);

  -[_NTKPigmentAddHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
