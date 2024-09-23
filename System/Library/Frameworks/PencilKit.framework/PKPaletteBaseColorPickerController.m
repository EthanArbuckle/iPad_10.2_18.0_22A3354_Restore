@implementation PKPaletteBaseColorPickerController

- (UIViewController)viewController
{
  return self->_viewController;
}

- (PKPaletteColorPickerControllerDelegate)delegate
{
  return (PKPaletteColorPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (void)setSupportsAlpha:(BOOL)a3
{
  self->_supportsAlpha = a3;
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  self->_colorUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
}

@end
