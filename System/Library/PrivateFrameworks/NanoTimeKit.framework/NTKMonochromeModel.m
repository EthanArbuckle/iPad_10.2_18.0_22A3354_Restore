@implementation NTKMonochromeModel

- (NTKMonochromeModel)initWithDevice:(id)a3
{
  id v5;
  NTKMonochromeModel *v6;
  NTKMonochromeModel *v7;
  uint64_t v8;
  UIColor *accentColor;
  uint64_t v10;
  UIColor *nonAccentColor;
  UIColor *backgroundColor;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKMonochromeModel;
  v6 = -[NTKMonochromeModel init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
    v8 = objc_claimAutoreleasedReturnValue();
    accentColor = v7->_accentColor;
    v7->_accentColor = (UIColor *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    nonAccentColor = v7->_nonAccentColor;
    v7->_nonAccentColor = (UIColor *)v10;

    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = 0;

  }
  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  return (id)CLKUIMonochromeFiltersForStyleWithTintedBackground();
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  return -[NTKMonochromeModel filtersForView:style:fraction:](self, "filtersForView:style:fraction:", a3, a4, 1.0);
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  uint64_t v4;

  v4 = 16;
  if (a4)
    v4 = 8;
  return *(id *)((char *)&self->super.isa + v4);
}

- (id)backgroundColorForView:(id)a3
{
  return self->_backgroundColor;
}

- (id)interpolatedColorForView:(id)a3
{
  return self->_accentColor;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_accentColor, a3);
}

- (UIColor)nonAccentColor
{
  return self->_nonAccentColor;
}

- (void)setNonAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_nonAccentColor, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_nonAccentColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
}

@end
