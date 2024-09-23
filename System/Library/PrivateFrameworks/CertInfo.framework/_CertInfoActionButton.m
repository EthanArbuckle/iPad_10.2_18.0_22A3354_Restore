@implementation _CertInfoActionButton

- (_CertInfoActionButton)initWithTitle:(id)a3 isDestructive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _CertInfoActionButton *v7;
  _CertInfoActionButton *v8;
  _CertInfoActionButton *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  _CertInfoActionButton *v15;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CertInfoActionButton;
  v7 = -[_CertInfoActionButton initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53___CertInfoActionButton_initWithTitle_isDestructive___block_invoke;
    block[3] = &unk_24C8135A8;
    v9 = v7;
    v15 = v9;
    if (initWithTitle_isDestructive__onceToken != -1)
      dispatch_once(&initWithTitle_isDestructive__onceToken, block);
    -[_CertInfoActionButton titleLabel](v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(v10, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.300000012, 0.300000012, 0.300000012, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowColor:", v12);

    objc_msgSend(v10, "setShadowOffset:", 0.0, -1.0);
    objc_msgSend(v10, "setClipsToBounds:", 0);
    -[_CertInfoActionButton setContentEdgeInsets:](v9, "setContentEdgeInsets:", 4.0, 17.0, 4.0, 17.0);
    -[_CertInfoActionButton setTitle:destructive:](v9, "setTitle:destructive:", v6, v4);
    -[_CertInfoActionButton sizeToFit](v9, "sizeToFit");

  }
  return v8;
}

- (void)setTitle:(id)a3 destructive:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t *v6;
  uint64_t *v7;

  v4 = a4;
  -[_CertInfoActionButton setTitle:forState:](self, "setTitle:forState:", a3, 0);
  v6 = &_removeButtonImage;
  if (v4)
  {
    v7 = &_removeButtonPressedImage;
  }
  else
  {
    v6 = &_installButtonImage;
    v7 = &_installButtonPressedImage;
  }
  -[_CertInfoActionButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", *v6, 0);
  -[_CertInfoActionButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", *v7, 1);
}

@end
