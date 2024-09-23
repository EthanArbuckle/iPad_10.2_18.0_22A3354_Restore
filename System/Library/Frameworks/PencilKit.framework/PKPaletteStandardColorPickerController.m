@implementation PKPaletteStandardColorPickerController

- (PKPaletteStandardColorPickerController)init
{
  PKPaletteStandardColorPickerController *v2;
  UIViewController *v3;
  UIViewController *colorPickerViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteStandardColorPickerController;
  v2 = -[PKPaletteStandardColorPickerController init](&v6, sel_init);
  if (v2)
  {
    v3 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
    colorPickerViewController = v2->_colorPickerViewController;
    v2->_colorPickerViewController = v3;

  }
  return v2;
}

- (id)selectedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (BOOL)supportsAlpha
{
  return 0;
}

- (int64_t)colorUserInterfaceStyle
{
  return 0;
}

- (UIViewController)colorPickerViewController
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
