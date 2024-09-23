@implementation AAUICustodianHelpCodeView

- (AAUICustodianHelpCodeView)initWithFrame:(CGRect)a3
{
  AAUICustodianHelpCodeView *v3;
  AAUICustodianHelpCodeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUICustodianHelpCodeView;
  v3 = -[AAUICustodianHelpCodeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AAUICustodianHelpCodeView setTextAlignment:](v3, "setTextAlignment:", 1);
    -[AAUICustodianHelpCodeView setContentMode:](v4, "setContentMode:", 4);
  }
  return v4;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
  if (objc_msgSend(v4, "length") != 1)
  {
    v6 = 0;
    v7 = *MEMORY[0x1E0DC1150];
    do
      objc_msgSend(v5, "addAttribute:value:range:", v7, &unk_1EA31E9D0, v6++, 1);
    while (objc_msgSend(v4, "length") - 1 > v6);
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v8, 0, 6);
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianHelpCodeView;
  -[AAUICustodianHelpCodeView setAttributedText:](&v9, sel_setAttributedText_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorLabels, 0);
}

@end
