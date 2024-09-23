@implementation PKPaletteSystemColorPickerController

- (PKPaletteSystemColorPickerController)init
{
  PKPaletteSystemColorPickerController *v2;
  UIColorPickerViewController *v3;
  UIColorPickerViewController *colorPickerViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteSystemColorPickerController;
  v2 = -[PKPaletteSystemColorPickerController init](&v6, sel_init);
  if (v2)
  {
    v3 = (UIColorPickerViewController *)objc_alloc_init(MEMORY[0x1E0DC3668]);
    colorPickerViewController = v2->_colorPickerViewController;
    v2->_colorPickerViewController = v3;

    -[UIColorPickerViewController _setShouldUseDarkGridInDarkMode:](v2->_colorPickerViewController, "_setShouldUseDarkGridInDarkMode:", 1);
    -[UIColorPickerViewController setDelegate:](v2->_colorPickerViewController, "setDelegate:", v2);
  }
  return v2;
}

- (id)selectedColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPaletteSystemColorPickerController _shouldConvertColorPickerColorFromDarkToLight](self, "_shouldConvertColorPickerColorFromDarkToLight"))
  {
    v5 = (void *)MEMORY[0x1E0DC3658];
    -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pk_convertColorPickerColor:fromUserInterfaceStyle:to:", v7, 2, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

- (void)setSelectedColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = v4;
    if (-[PKPaletteSystemColorPickerController _shouldConvertColorPickerColorFromDarkToLight](self, "_shouldConvertColorPickerColorFromDarkToLight"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_convertColorPickerColor:fromUserInterfaceStyle:to:", v5, 2, 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
    -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedColor:", v5);

  }
  else
  {
    -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedColor:", 0);
  }

}

- (BOOL)supportsAlpha
{
  void *v2;
  char v3;

  -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAlpha");

  return v3;
}

- (void)setSupportsAlpha:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsAlpha:", v3);

}

- (int64_t)colorUserInterfaceStyle
{
  return -[UIColorPickerViewController _userInterfaceStyleForGrid](self->_colorPickerViewController, "_userInterfaceStyleForGrid");
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  -[UIColorPickerViewController _setUserInterfaceStyleForGrid:](self->_colorPickerViewController, "_setUserInterfaceStyleForGrid:", a3);
}

- (BOOL)_shouldConvertColorPickerColorFromDarkToLight
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[PKPaletteSystemColorPickerController colorUserInterfaceStyle](self, "colorUserInterfaceStyle")
    && -[PKPaletteSystemColorPickerController colorUserInterfaceStyle](self, "colorUserInterfaceStyle") != 2)
  {
    return 0;
  }
  -[PKPaletteSystemColorPickerController colorPickerViewController](self, "colorPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle") == 2;

  return v5;
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  -[PKPaletteBaseColorPickerController delegate](self, "delegate", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorPickerControllerDidChangeSelectedColor:isContinuousColorSelection:", self, v5);

}

- (UIColorPickerViewController)colorPickerViewController
{
  return self->_colorPickerViewController;
}

- (void)setColorPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerViewController, 0);
}

@end
