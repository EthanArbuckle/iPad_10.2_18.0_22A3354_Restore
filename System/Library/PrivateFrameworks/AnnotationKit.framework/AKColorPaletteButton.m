@implementation AKColorPaletteButton

- (void)setColor:(id)a3
{
  UIColor *v5;
  UIColor *color;
  BOOL v7;
  void *v8;
  UIColor *v9;

  v5 = (UIColor *)a3;
  color = self->_color;
  if (color != v5)
  {
    v9 = v5;
    v7 = -[UIColor akIsEqualToColor:](color, "akIsEqualToColor:", v5);
    v5 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_color, a3);
      objc_msgSend(MEMORY[0x24BDF6AC8], "ak_colorSwatchToolbarButtonImageWithColor:size:selected:", v9, 1, 19.0, 19.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKColorPaletteButton setImage:forState:](self, "setImage:forState:", v8, 0);

      v5 = v9;
    }
  }

}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
