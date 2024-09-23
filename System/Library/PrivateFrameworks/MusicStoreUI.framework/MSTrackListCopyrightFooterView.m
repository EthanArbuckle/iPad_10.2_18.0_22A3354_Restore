@implementation MSTrackListCopyrightFooterView

- (void)dealloc
{
  objc_super v3;

  self->_text = 0;
  v3.receiver = self;
  v3.super_class = (Class)MSTrackListCopyrightFooterView;
  -[MSTrackListCopyrightFooterView dealloc](&v3, sel_dealloc);
}

- (void)setText:(id)a3
{
  NSString *text;

  text = self->_text;
  if (text != a3)
  {

    self->_text = (NSString *)a3;
    self->_textSize = (CGSize)*MEMORY[0x24BDBF148];
    -[MSTrackListCopyrightFooterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[MSTrackListCopyrightFooterView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[MSTrackListCopyrightFooterView _textSize](self, "_textSize");
  v7 = v6;
  v9 = v8;
  v10 = floor((v5 - v8) * 0.5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.603921569, 0.603921569, 0.603921569, 1.0), "set");
  -[NSString _legacy_drawInRect:withFont:](self->_text, "_legacy_drawInRect:withFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0), 10.0, v10, v7, v9);
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[MSTrackListCopyrightFooterView frame](self, "frame");
  if (self->_text)
  {
    v6 = v3;
    v7 = v4;
    v8 = v5;
    -[MSTrackListCopyrightFooterView _textSize](self, "_textSize");
    -[MSTrackListCopyrightFooterView setFrame:](self, "setFrame:", v6, v7, v8, fmax(v9 + 16.0, 44.0));
  }
}

- (CGSize)_textSize
{
  CGSize *p_textSize;
  double width;
  double height;
  double v7;
  CGSize result;

  p_textSize = &self->_textSize;
  width = self->_textSize.width;
  if (self->_text)
  {
    height = self->_textSize.height;
    if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[MSTrackListCopyrightFooterView bounds](self, "bounds");
      -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_text, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0), 4, v7 + -20.0, 1.79769313e308);
      p_textSize->width = width;
      p_textSize->height = height;
    }
  }
  else
  {
    height = self->_textSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)text
{
  return self->_text;
}

@end
