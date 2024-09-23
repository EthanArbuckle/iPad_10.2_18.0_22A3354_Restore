@implementation TwoPartTextLabel

- (TwoPartTextLabel)init
{
  TwoPartTextLabel *v2;
  TwoPartTextLabel *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TwoPartTextLabel;
  v2 = -[TwoPartTextLabel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TwoPartTextLabel layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v4, "setNeedsDisplay");

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TwoPartTextLabel;
  -[TwoPartTextLabel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TwoPartTextLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\t'%@'\t'%@'"), v4, v5, self->_secondTextPart);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTextPart1:(id)a3 part2:(id)a4
{
  NSString *v7;

  v7 = (NSString *)a4;
  -[TwoPartTextLabel setTextPart1:](self, "setTextPart1:", a3);
  if (self->_secondTextPart != v7)
  {
    objc_storeStrong((id *)&self->_secondTextPart, a4);
    self->_part2Size = (CGSize)*MEMORY[0x1E0C9D820];
    -[TwoPartTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setTextPart1:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TwoPartTextLabel;
  -[TwoPartTextLabel setText:](&v3, sel_setText_, a3);
}

- (void)setStrikethroughPart1:(BOOL)a3
{
  if (self->_strikethroughPart1 != a3)
  {
    self->_strikethroughPart1 = a3;
    -[TwoPartTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setStrikethroughPart2:(BOOL)a3
{
  if (self->_strikethroughPart2 != a3)
  {
    self->_strikethroughPart2 = a3;
    -[TwoPartTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (CGSize)textPart2Size
{
  CGSize *p_part2Size;
  NSString *secondTextPart;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  double width;
  double height;
  CGSize result;

  p_part2Size = &self->_part2Size;
  if (self->_part2Size.width == 0.0
    && self->_part2Size.height == 0.0
    && -[NSString length](self->_secondTextPart, "length"))
  {
    secondTextPart = self->_secondTextPart;
    -[TwoPartTextLabel font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString _legacy_sizeWithFont:](secondTextPart, "_legacy_sizeWithFont:", v5);
    p_part2Size->width = v6;
    p_part2Size->height = v7;

  }
  width = p_part2Size->width;
  height = p_part2Size->height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)hasTwoParts
{
  double v3;
  double v4;
  objc_super v6;

  -[TwoPartTextLabel textPart2Size](self, "textPart2Size");
  if (v3 <= 0.0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TwoPartTextLabel;
  -[TwoPartTextLabel textSize](&v6, sel_textSize);
  return v4 > 0.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[TwoPartTextLabel idealSize](self, "idealSize", a3.width, a3.height);
  if (width < v4)
    v4 = width;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)idealSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[TwoPartTextLabel textPart2Size](self, "textPart2Size");
  v4 = v3;
  v6 = v5;
  -[TwoPartTextLabel text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TwoPartTextLabel font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_legacy_sizeWithFont:", v8);
  v10 = v9;
  v12 = v11;

  if (v4 > 0.0 && v10 > 0.0)
  {
    v13 = self->_minPart2Width - v4;
    if (v13 <= 0.0)
      v14 = 18.0;
    else
      v14 = v13 + 18.0;
    v10 = v10 + v14;
  }
  v15 = v4 + v10;
  if (v12 >= v6)
    v16 = v12;
  else
    v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)rightmostDisplayedPartWidth
{
  double result;
  objc_super v4;

  -[TwoPartTextLabel textPart2Size](self, "textPart2Size");
  if (result == 0.0)
  {
    v4.receiver = self;
    v4.super_class = (Class)TwoPartTextLabel;
    -[TwoPartTextLabel textSize](&v4, sel_textSize);
  }
  return result;
}

- (void)setMinimumPart2Width:(double)a3
{
  if (self->_minPart2Width != a3)
  {
    self->_minPart2Width = a3;
    -[TwoPartTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat MaxX;
  double v20;
  double v21;
  void *v22;
  NSString *secondTextPart;
  CGFloat v24;
  void *v25;
  CGContext *CurrentContext;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  CGFloat v37;
  id v38;
  objc_super v39;
  uint64_t v40;
  _QWORD v41[2];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41[1] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)TwoPartTextLabel;
  -[TwoPartTextLabel drawRect:](&v39, sel_drawRect_);
  -[TwoPartTextLabel textPart2Size](self, "textPart2Size");
  if (v8 <= 0.0)
  {
    v18 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    v9 = v8;
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[TwoPartTextLabel text](self, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x1E0DC1138];
    -[TwoPartTextLabel font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeWithAttributes:", v13);
    v15 = v14;

    if (CalInterfaceIsLeftToRight())
    {
      v16 = x + v15;
      CalRoundToScreenScale(v16 + 18.0 + fmax(self->_minPart2Width - v9, 0.0));
      v18 = v17;
      if (v9 + v17 > width)
      {
        if (v16 + 4.0 >= width - v9)
          v18 = v16 + 4.0;
        else
          v18 = width - v9;
      }
    }
    else
    {
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      MaxX = CGRectGetMaxX(v42);
      CalRoundToScreenScale(MaxX - v15 + -18.0 - fmax(self->_minPart2Width - v9, 0.0) - v9);
      v18 = v20;
      if (v20 < 0.0)
      {
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        v18 = fmin(CGRectGetMaxX(v43) - v15 + -4.0 - v9, 0.0);
      }
    }
    v21 = v10 + CalFloorToScreenScale(0.4);
    -[TwoPartTextLabel currentTextColor](self, "currentTextColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "set");

    secondTextPart = self->_secondTextPart;
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v24 = CGRectGetMaxX(v44) - v18;
    -[TwoPartTextLabel font](self, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](secondTextPart, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v25, -[TwoPartTextLabel lineBreakMode](self, "lineBreakMode"), v18, v21, v24);

  }
  if (-[TwoPartTextLabel strikethroughPart1](self, "strikethroughPart1")
    || -[TwoPartTextLabel strikethroughPart2](self, "strikethroughPart2"))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[TwoPartTextLabel font](self, "font");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lineHeight");
    v29 = v28;

    if (-[TwoPartTextLabel strikethroughPart1](self, "strikethroughPart1"))
      v30 = 0.0;
    else
      v30 = v18;
    -[TwoPartTextLabel bounds](self, "bounds");
    v31 = CGRectGetMaxX(v45) - v30 + -2.0;
    CalRoundToScreenScale(0.5);
    v33 = v32;
    -[TwoPartTextLabel font](self, "font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "xHeight");
    CalRoundToScreenScale(y + v29 - v33 - v35);
    v37 = v36;

    CGContextSaveGState(CurrentContext);
    -[TwoPartTextLabel textColor](self, "textColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v38, "CGColor"));

    v46.origin.x = v30;
    v46.origin.y = v37;
    v46.size.width = v31;
    v46.size.height = v33;
    CGContextFillRect(CurrentContext, v46);
    CGContextRestoreGState(CurrentContext);
  }
}

- (BOOL)strikethroughPart1
{
  return self->_strikethroughPart1;
}

- (BOOL)strikethroughPart2
{
  return self->_strikethroughPart2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondTextPart, 0);
}

@end
