@implementation PKPaletteTextOptionsViewController

- (void)loadView
{
  void *v3;
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
  void *v17;
  void *v18;
  PKPaletteTextOptionsView *v19;

  v19 = objc_alloc_init(PKPaletteTextOptionsView);
  -[PKPaletteTextOptionsView textButton](v19, "textButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, 8.0, 0.0, 0.0);

  -[PKPaletteTextOptionsView textButton](v19, "textButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleEdgeInsets:", 0.0, 16.0, 0.0, 0.0);

  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("text"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteTextOptionsView textButton](v19, "textButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forState:", v8, 0);

  -[PKPaletteTextOptionsView textButton](v19, "textButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__textButtonTouchUpInsideHandler_, 64);

  -[PKPaletteTextOptionsView signatureButton](v19, "signatureButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImageEdgeInsets:", 0.0, 8.0, 0.0, 0.0);

  -[PKPaletteTextOptionsView signatureButton](v19, "signatureButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleEdgeInsets:", 0.0, 16.0, 0.0, 0.0);

  v13 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("signature"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "imageWithRenderingMode:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteTextOptionsView signatureButton](v19, "signatureButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:forState:", v16, 0);

  -[PKPaletteTextOptionsView signatureButton](v19, "signatureButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__signatureButtonTouchUpInsideHandler_, 64);

  -[PKPaletteTextOptionsViewController setView:](self, "setView:", v19);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 200.0;
  v3 = 120.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_textButtonTouchUpInsideHandler:(id)a3
{
  id v4;

  -[PKPaletteTextOptionsViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textOptionsViewController:didSelectTextWithType:", self, 10);

}

- (void)_signatureButtonTouchUpInsideHandler:(id)a3
{
  id v4;

  -[PKPaletteTextOptionsViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textOptionsViewController:didSelectTextWithType:", self, 11);

}

- (PKPaletteTextOptionsViewControllerDelegate)delegate
{
  return (PKPaletteTextOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
