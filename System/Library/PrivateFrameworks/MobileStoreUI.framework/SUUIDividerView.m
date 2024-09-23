@implementation SUUIDividerView

- (void)setDividerColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIDividerView;
  -[SUUIDividerView setBackgroundColor:](&v3, sel_setBackgroundColor_, a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int64_t dividerOrientation;
  double dividerSize;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  dividerOrientation = self->_dividerOrientation;
  dividerSize = self->_dividerSize;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  if (dividerSize >= 0.00000011920929)
    v10 = dividerSize;
  else
    v10 = width;
  if (dividerSize >= 0.00000011920929)
    v11 = dividerSize;
  else
    v11 = height;
  if (dividerOrientation)
    v10 = v9;
  else
    v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)dividerOrientation
{
  return self->_dividerOrientation;
}

- (void)setDividerOrientation:(int64_t)a3
{
  self->_dividerOrientation = a3;
}

- (double)dividerSize
{
  return self->_dividerSize;
}

- (void)setDividerSize:(double)a3
{
  self->_dividerSize = a3;
}

@end
