@implementation DMCProfileTitleTextCell

+ (id)cellIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (DMCProfileTitleTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DMCProfileTitleTextCell *v4;
  uint64_t v5;
  UILabel *label;
  void *v7;
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
  objc_super v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)DMCProfileTitleTextCell;
  v4 = -[DMCProfileTitleTextCell initWithStyle:reuseIdentifier:](&v22, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7840]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontWithDescriptor:size:", v9, 34.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v4->_label, "setFont:", v10);
    -[DMCProfileTitleTextCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_label);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfileTitleTextCell setBackgroundColor:](v4, "setBackgroundColor:", v12);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfileTitleTextCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v23 = CFSTR("label");
    v24[0] = v4->_label;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("|-%f-[label]-%f-|"), 0x4030000000000000, 0x4030000000000000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v16, 0, 0, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[label]-0-|"), 0, 0, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfileTitleTextCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addConstraints:", v17);

    -[DMCProfileTitleTextCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addConstraints:", v18);

  }
  return v4;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCProfileTitleTextCell label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[DMCProfileTitleTextCell label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
}

@end
