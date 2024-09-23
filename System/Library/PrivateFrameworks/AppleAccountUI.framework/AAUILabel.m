@implementation AAUILabel

- (AAUILabel)initWithFrame:(CGRect)a3
{
  AAUILabel *result;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUILabel;
  result = -[AAUILabel initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&result->_edgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&result->_edgeInsets.bottom = v4;
  }
  return result;
}

- (AAUILabel)initWithCoder:(id)a3
{
  AAUILabel *result;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUILabel;
  result = -[AAUILabel initWithCoder:](&v5, sel_initWithCoder_, a3);
  if (result)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&result->_edgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&result->_edgeInsets.bottom = v4;
  }
  return result;
}

- (AAUILabel)initWithEdgeInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  AAUILabel *result;
  objc_super v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)AAUILabel;
  result = -[AAUILabel initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
  {
    result->_edgeInsets.top = top;
    result->_edgeInsets.left = left;
    result->_edgeInsets.bottom = bottom;
    result->_edgeInsets.right = right;
  }
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  float64x2_t v3;
  float64x2_t v4;
  objc_super v5;
  objc_super v6;

  v3 = *(float64x2_t *)&self->_edgeInsets.top;
  v4 = *(float64x2_t *)&self->_edgeInsets.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v3, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(v4, *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) != 0)-[AAUILabel drawTextInRect:](&v6, sel_drawTextInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v5.receiver, v5.super_class, self, AAUILabel);
  else
    -[AAUILabel drawTextInRect:](&v5, sel_drawTextInRect_, a3.origin.x + v3.f64[1], a3.origin.y + v3.f64[0], a3.size.width - (v3.f64[1] + v4.f64[1]), a3.size.height - (v3.f64[0] + v4.f64[0]), self, AAUILabel, v6.receiver, v6.super_class);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)AAUILabel;
  -[AAUILabel intrinsicContentSize](&v7, sel_intrinsicContentSize);
  v4 = v3 + self->_edgeInsets.left + self->_edgeInsets.right;
  v6 = v5 + self->_edgeInsets.top + self->_edgeInsets.bottom;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  -[AAUILabel bounds](self, "bounds");
  -[AAUILabel setPreferredMaxLayoutWidth:](self, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v4));
  v3.receiver = self;
  v3.super_class = (Class)AAUILabel;
  -[AAUILabel layoutSubviews](&v3, sel_layoutSubviews);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

@end
