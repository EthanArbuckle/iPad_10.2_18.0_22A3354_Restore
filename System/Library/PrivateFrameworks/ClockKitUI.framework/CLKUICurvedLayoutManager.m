@implementation CLKUICurvedLayoutManager

- (CLKUICurvedLayoutManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUICurvedLayoutManager;
  return -[CLKUICurvedLayoutManager init](&v3, sel_init);
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  id v15;
  id v16;
  __int128 v17;
  _OWORD v18[3];
  objc_super v19;

  v15 = a8;
  v16 = a6;
  CGContextSetShouldSubpixelQuantizeFonts(a9, 0);
  v19.receiver = self;
  v19.super_class = (Class)CLKUICurvedLayoutManager;
  v17 = *(_OWORD *)&a7->c;
  v18[0] = *(_OWORD *)&a7->a;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a7->tx;
  -[CLKUICurvedLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v19, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, a3, a4, a5, v16, v18, v15, a9);

}

@end
