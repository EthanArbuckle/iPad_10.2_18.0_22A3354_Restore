@implementation PKPaletteOptionCellDividerView

- (PKPaletteOptionCellDividerView)initWithFrame:(CGRect)a3
{
  PKPaletteOptionCellDividerView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteOptionCellDividerView;
  v3 = -[PKPaletteOptionCellDividerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteOptionCellDividerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PKPaletteOptionCellDividerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

@end
