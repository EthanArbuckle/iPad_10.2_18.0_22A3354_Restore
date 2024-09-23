@implementation CRUMultilineLinkCell

- (CRUMultilineLinkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CRUMultilineLinkCell *v4;
  CRUMultilineLinkCell *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRUMultilineLinkCell;
  v4 = -[CRUMultilineLinkCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PSTableCell titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](v5, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    v9 = objc_alloc(MEMORY[0x24BDD1688]);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithString:", v11);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBB388], CFSTR("http://www.apple.com"), 0, v15);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttributedText:", v12);

  }
  return v5;
}

@end
