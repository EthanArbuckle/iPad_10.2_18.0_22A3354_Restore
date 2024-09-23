@implementation _MKLegendString

- (_MKLegendString)init
{
  _MKLegendString *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKLegendString;
  v2 = -[_MKLegendString init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    -[_MKLegendString setContentsScale:](v2, "setContentsScale:");

  }
  return v2;
}

- (void)dealloc
{
  __CTLine *line;
  objc_super v4;

  line = self->_line;
  if (line)
    CFRelease(line);
  v4.receiver = self;
  v4.super_class = (Class)_MKLegendString;
  -[_MKLegendString dealloc](&v4, sel_dealloc);
}

- (void)sizeToFit
{
  __CTLine *line;
  CGFloat leading;
  CGFloat descent;
  CGFloat ascent;
  CGRect BoundsWithOptions;

  line = self->_line;
  if (line)
  {
    descent = 0.0;
    ascent = 0.0;
    leading = 0.0;
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    BoundsWithOptions = CTLineGetBoundsWithOptions(self->_line, 8uLL);
    ceil(CGRectGetMaxX(BoundsWithOptions));
    self->_baselineDistanceFromBottom = descent;
    -[_MKLegendString frame](self, "frame");
    -[_MKLegendString setFrame:](self, "setFrame:");
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKLegendString;
  -[_MKLegendString setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setString:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;
  BOOL v7;
  __CTLine *line;
  const __CFAttributedString *v9;
  NSAttributedString *v10;

  v5 = (NSAttributedString *)a3;
  v6 = v5;
  if (self->_string != v5)
  {
    v10 = v5;
    v7 = -[NSAttributedString isEqualToAttributedString:](v5, "isEqualToAttributedString:");
    v6 = v10;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_string, a3);
      line = self->_line;
      if (line)
      {
        CFRelease(line);
        self->_line = 0;
      }
      v6 = v10;
      if (self->_string)
      {
        -[_MKLegendString string](self, "string");
        v9 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
        self->_line = CTLineCreateWithAttributedString(v9);

        v6 = v10;
      }
    }
  }

}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  __CTLine *line;
  CGFloat v7;

  -[_MKLegendString string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    line = self->_line;

    if (line)
    {
      CGContextSaveGState(a3);
      -[_MKLegendString bounds](self, "bounds");
      CGContextTranslateCTM(a3, 0.0, v7);
      CGContextScaleCTM(a3, 1.0, -1.0);
      CGContextSetTextPosition(a3, 0.0, self->_baselineDistanceFromBottom);
      VKLineDrawWithOuterStroke();
      CGContextRestoreGState(a3);
    }
  }
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (double)baselineDistanceFromBottom
{
  return self->_baselineDistanceFromBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
