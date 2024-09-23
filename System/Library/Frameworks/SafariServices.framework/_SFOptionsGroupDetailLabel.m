@implementation _SFOptionsGroupDetailLabel

- (_SFOptionsGroupDetailLabel)initWithFrame:(CGRect)a3
{
  _SFOptionsGroupDetailLabel *v3;
  void *v4;
  id v5;
  _SFOptionsGroupDetailLabel *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_SFOptionsGroupDetailLabel;
  v3 = -[_SFOptionsGroupDetailLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)-[_SFOptionsGroupDetailLabel registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v4, v3, sel_setNeedsLayout);

    v6 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFOptionsGroupDetailLabel;
  -[_SFOptionsGroupDetailLabel layoutSubviews](&v4, sel_layoutSubviews);
  -[_SFOptionsGroupDetailLabel attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFOptionsGroupDetailLabel setAttributedText:](self, "setAttributedText:", v3);

}

- (void)setAttributedText:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "removeAttribute:range:", *MEMORY[0x1E0DC32A8], 0, objc_msgSend(v4, "length"));
  v14 = 0;
  v15 = 0;
  v5 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC32A0], 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    v9 = v8;

    objc_msgSend(v6, "fontWithSize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAttribute:value:range:", v5, v10, v14, v15);

  }
  -[_SFOptionsGroupDetailLabel attributedText](self, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToAttributedString:", v4);

  if ((v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFOptionsGroupDetailLabel;
    -[_SFOptionsGroupDetailLabel setAttributedText:](&v13, sel_setAttributedText_, v4);
  }

}

@end
