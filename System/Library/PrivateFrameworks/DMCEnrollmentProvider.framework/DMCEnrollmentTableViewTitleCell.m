@implementation DMCEnrollmentTableViewTitleCell

- (DMCEnrollmentTableViewTitleCell)initWithTitle:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  DMCEnrollmentTableViewTitleCell *v7;
  void *v8;
  void *v9;
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
  void *v20;
  uint64_t v21;
  NSString *title;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)DMCEnrollmentTableViewTitleCell;
  v7 = -[DMCEnrollmentTableViewTitleCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, 0, v6);

  if (v7)
  {
    -[DMCEnrollmentTableViewTitleCell setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewTitleCell setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[DMCEnrollmentTableViewTitleCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setNumberOfLines:", 0);
    -[DMCEnrollmentTableViewTitleCell _fontForTitle](v7, "_fontForTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(v9, "setText:", v4);
    objc_msgSend(v9, "sizeToFit");
    -[DMCEnrollmentTableViewTitleCell contentView](v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v9);

    v31 = CFSTR("label");
    v32[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("|-%f-[label]-%f-|"), 0x4014000000000000, 0x4014000000000000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", v14, 0, 0, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("V:|-%f-[label]-%f-|"), 0x4014000000000000, 0x4014000000000000);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintsWithVisualFormat:options:metrics:views:", v17, 0, 0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMCEnrollmentTableViewTitleCell contentView](v7, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addConstraints:", v15);

    -[DMCEnrollmentTableViewTitleCell contentView](v7, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addConstraints:", v18);

    v21 = objc_msgSend(v4, "copy");
    title = v7->_title;
    v7->_title = (NSString *)v21;

    objc_storeStrong((id *)&v7->_label, v9);
    objc_initWeak(&location, v7);
    v30 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __49__DMCEnrollmentTableViewTitleCell_initWithTitle___block_invoke;
    v26[3] = &unk_24D52E2D0;
    objc_copyWeak(&v27, &location);
    v24 = (id)-[DMCEnrollmentTableViewTitleCell registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v23, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __49__DMCEnrollmentTableViewTitleCell_initWithTitle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fontForTitle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v1);

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentTableViewTitleCell;
  -[DMCEnrollmentTableViewTitleCell layoutSubviews](&v3, sel_layoutSubviews);
  -[DMCEnrollmentTableViewTitleCell bounds](self, "bounds");
  -[DMCEnrollmentTableViewTitleCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v4), 0.0, 0.0);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    -[DMCEnrollmentTableViewTitleCell label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[DMCEnrollmentTableViewTitleCell setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (double)cellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)estimatedCellHeight
{
  return 50.0;
}

- (id)_fontForTitle
{
  int v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = MGGetSInt32Answer();
  v3 = (_QWORD *)MEMORY[0x24BDF7800];
  if (v2 == 5)
    v3 = (_QWORD *)MEMORY[0x24BDF7848];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)label
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
  objc_storeStrong((id *)&self->_title, 0);
}

@end
