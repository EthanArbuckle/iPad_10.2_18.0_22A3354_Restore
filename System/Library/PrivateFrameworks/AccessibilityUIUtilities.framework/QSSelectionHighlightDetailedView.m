@implementation QSSelectionHighlightDetailedView

- (void)setDisplayRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_displayRect;
  BOOL v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_displayRect = &self->_displayRect;
  v9 = CGRectEqualToRect(self->_displayRect, a3);
  p_displayRect->origin.x = x;
  p_displayRect->origin.y = y;
  p_displayRect->size.width = width;
  p_displayRect->size.height = height;
  -[QSSelectionHighlightDetailedView setFrame:](self, "setFrame:", x, y, width, height);
  if (!v9)
    -[QSSelectionHighlightDetailedView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double MaxX;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  CGColor *v19;
  const CGFloat *Components;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "quickSpeakHighlightOption");

  if (!-[QSSelectionHighlightDetailedView sentenceHighlight](self, "sentenceHighlight"))
  {
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 1)
      return;
    -[QSSelectionHighlightDetailedView selectionColor](self, "selectionColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFill");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x, y, width, height);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fill");
    goto LABEL_8;
  }
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 2)
    return;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "quickSpeakSentenceHighlightOption");

  if (v11 != 2)
  {
    if (v11 != 1)
      return;
    -[QSSelectionHighlightDetailedView underlineColor](self, "underlineColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStroke");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLineWidth:", 1.0);
    objc_msgSend(v22, "setLineCapStyle:", 1);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    objc_msgSend(v22, "moveToPoint:", x, CGRectGetMaxY(v23) + -1.0);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MaxX = CGRectGetMaxX(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    objc_msgSend(v22, "addLineToPoint:", MaxX, CGRectGetMaxY(v25) + -1.0);
    objc_msgSend(v22, "stroke");
    goto LABEL_8;
  }
  if (v9 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "quickSpeakSentenceHighlightColor");

    -[QSSelectionHighlightDetailedView selectionColor](self, "selectionColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v18 = objc_retainAutorelease(v15);
      v19 = (CGColor *)objc_msgSend(v18, "CGColor");

      Components = CGColorGetComponents(v19);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0 - *Components, 1.0 - Components[1], 1.0 - Components[2], CGColorGetAlpha(v19) + 0.1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (v9 != 2)
      return;
    -[QSSelectionHighlightDetailedView selectionColor](self, "selectionColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v15)
  {
    v22 = v15;
    objc_msgSend(v15, "setFill");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x, y, width, height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fill");

LABEL_8:
  }
}

- (CGRect)displayRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_displayRect.origin.x;
  y = self->_displayRect.origin.y;
  width = self->_displayRect.size.width;
  height = self->_displayRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)sentenceHighlight
{
  return self->_sentenceHighlight;
}

- (void)setSentenceHighlight:(BOOL)a3
{
  self->_sentenceHighlight = a3;
}

- (UIColor)underlineColor
{
  return self->_underlineColor;
}

- (void)setUnderlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_underlineColor, a3);
}

- (UIColor)selectionColor
{
  return self->_selectionColor;
}

- (void)setSelectionColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionColor, 0);
  objc_storeStrong((id *)&self->_underlineColor, 0);
}

@end
