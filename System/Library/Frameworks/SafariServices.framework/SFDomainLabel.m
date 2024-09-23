@implementation SFDomainLabel

- (SFDomainLabel)initWithFrame:(CGRect)a3
{
  SFDomainLabel *v3;
  SFDomainLabel *v4;
  SFDomainLabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDomainLabel;
  v3 = -[SFDomainLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFDomainLabel _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (SFDomainLabel)initWithCoder:(id)a3
{
  SFDomainLabel *v3;
  SFDomainLabel *v4;
  SFDomainLabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDomainLabel;
  v3 = -[SFDomainLabel initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[SFDomainLabel _commonInit](v3, "_commonInit");
    v5 = v4;
  }

  return v4;
}

- (SFDomainLabel)initWithText:(id)a3 isSecure:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  SFDomainLabel *v8;
  SFDomainLabel *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = -[SFDomainLabel initWithFrame:](self, "initWithFrame:");

  if (v8)
  {
    -[SFDomainLabel setText:isSecure:](v8, "setText:isSecure:", v6, v4);
    v9 = v8;
  }

  return v8;
}

- (void)_commonInit
{
  NSString *text;
  UILabel *v4;
  UILabel *label;
  void *v6;
  double v7;
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
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  text = self->_text;
  self->_text = (NSString *)&stru_1E4AC8470;

  v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  label = self->_label;
  self->_label = v4;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v6);

  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 1);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_label, "setContentHuggingPriority:forAxis:", 1, v7);
  -[SFDomainLabel addSubview:](self, "addSubview:", self->_label);
  v18 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel centerXAnchor](self->_label, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDomainLabel centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  -[UILabel leadingAnchor](self->_label, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDomainLabel leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v9, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  -[UILabel topAnchor](self->_label, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDomainLabel topAnchor](self, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  -[SFDomainLabel bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_label, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v15, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (void)setText:(id)a3 isSecure:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  NSString *v7;
  NSString *text;
  void *v9;
  __CFString *v10;

  v4 = a4;
  v6 = &stru_1E4AC8470;
  if (a3)
    v6 = (__CFString *)a3;
  v10 = v6;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:") || self->_secure != v4)
  {
    v7 = (NSString *)-[__CFString copy](v10, "copy");
    text = self->_text;
    self->_text = v7;

    self->_secure = v4;
    -[SFDomainLabel _makeAttributedString](self, "_makeAttributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v9);

  }
}

- (id)_makeAttributedString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (self->_secure)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_secure)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithTintColor:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3888];
    -[UILabel font](self->_label, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationWithFont:scale:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0DC33D0], "textAttachmentWithImage:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedStringWithAttachment:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v3, "appendAttributedString:", v14);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_text);
  objc_msgSend(v3, "appendAttributedString:", v15);

  v18 = *MEMORY[0x1E0DC32A8];
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttributes:range:", v16, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
