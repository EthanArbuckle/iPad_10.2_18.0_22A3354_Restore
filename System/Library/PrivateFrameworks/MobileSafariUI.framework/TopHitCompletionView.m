@implementation TopHitCompletionView

- (void)setAttributedText:(id)a3 highlightStartIndex:(unint64_t)a4
{
  id v6;
  NSAttributedString *v7;
  char v8;
  NSAttributedString *v9;
  NSAttributedString *attributedText;
  NSAttributedString *v11;
  NSAttributedString *v12;

  v6 = a3;
  v7 = (NSAttributedString *)v6;
  if (self->_highlightStartIndex != a4
    || (unint64_t)v6 | (unint64_t)self->_attributedText
    && (v11 = (NSAttributedString *)v6, v8 = objc_msgSend(v6, "isEqualToAttributedString:"), v7 = v11, (v8 & 1) == 0))
  {
    v12 = v7;
    self->_highlightStartIndex = a4;
    if (self->_attributedText != v7)
    {
      v9 = (NSAttributedString *)-[NSAttributedString copy](v7, "copy");
      attributedText = self->_attributedText;
      self->_attributedText = v9;

    }
    -[TopHitCompletionView setNeedsDisplay](self, "setNeedsDisplay");
    v7 = v12;
  }

}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  const __CTLine *v8;
  CGContext *CurrentContext;
  const CGPath *v10;
  CGContext *v11;
  id v12;

  if (-[NSAttributedString length](self->_attributedText, "length", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[NSAttributedString attribute:atIndex:effectiveRange:](self->_attributedText, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    objc_msgSend(v12, "descender");
    -[TopHitCompletionView bounds](self, "bounds");
    v5 = v4;
    UIRoundToViewScale();
    v7 = v6 + v5;
    v8 = CTLineCreateWithAttributedString((CFAttributedStringRef)self->_attributedText);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextTranslateCTM(CurrentContext, 0.0, -v7);
    -[NSAttributedString length](self->_attributedText, "length");
    v10 = (const CGPath *)CTLineCopyHighlightPathForStringRange();
    CGContextAddPath(CurrentContext, v10);
    CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](self->_highlightColor, "CGColor"));
    CGContextFillPath(CurrentContext);
    CGPathRelease(v10);
    v11 = UIGraphicsGetCurrentContext();
    CTLineDraw(v8, v11);
    CFRelease(v8);

  }
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
