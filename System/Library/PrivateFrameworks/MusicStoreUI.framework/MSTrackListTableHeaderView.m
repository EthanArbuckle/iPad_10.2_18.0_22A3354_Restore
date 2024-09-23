@implementation MSTrackListTableHeaderView

- (void)dealloc
{
  objc_super v3;

  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)MSTrackListTableHeaderView;
  -[MSTrackListTableHeaderView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double width;
  double height;
  CGFloat v12;
  double v13;
  CGRect v14;

  -[MSTrackListTableHeaderView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  if (self->_title)
  {
    v8 = objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0);
    width = self->_titleSize.width;
    height = self->_titleSize.height;
    if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[NSString _legacy_sizeWithFont:](self->_title, "_legacy_sizeWithFont:", v8);
      height = v12;
      self->_titleSize.width = width;
      self->_titleSize.height = v12;
    }
    if (width >= v5 + -16.0)
      v13 = v5 + -16.0;
    else
      v13 = width;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.462745098, 1.0), "set");
    -[NSString _legacy_drawInRect:withFont:](self->_title, "_legacy_drawInRect:withFont:", v8, floor((v5 - v13) * 0.5), 13.0, v13, height);
  }
  objc_msgSend((id)MSGetTrackListBorderColor(), "set");
  v14.origin.y = v7 + -1.0;
  v14.origin.x = 0.0;
  v14.size.height = 1.0;
  v14.size.width = v5;
  UIRectFill(v14);
}

- (void)sizeToFit
{
  -[MSTrackListTableHeaderView frame](self, "frame");
  -[MSTrackListTableHeaderView setFrame:](self, "setFrame:");
}

- (void)setTitle:(id)a3
{
  NSString *title;

  title = self->_title;
  if (title != a3)
  {

    self->_title = (NSString *)a3;
    self->_titleSize = (CGSize)*MEMORY[0x24BDBF148];
    -[MSTrackListTableHeaderView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (NSString)title
{
  return self->_title;
}

@end
