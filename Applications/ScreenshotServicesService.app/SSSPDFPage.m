@implementation SSSPDFPage

- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4
{
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v17;
  CGRect v18;

  -[SSSPDFPage vellumOpacity](self, "vellumOpacity");
  if (v7 < 1.0)
  {
    v17.receiver = self;
    v17.super_class = (Class)SSSPDFPage;
    -[SSSPDFPage drawWithBox:toContext:](&v17, "drawWithBox:toContext:", a3, a4);
  }
  if (-[SSSPDFPage isSaving](self, "isSaving"))
  {
    -[SSSPDFPage boundsForBox:](self, "boundsForBox:", a3);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SSSPDFPage vellumOpacity](self, "vellumOpacity");
    CGContextSetRGBFillColor(a4, 1.0, 1.0, 1.0, v16);
    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    CGContextFillRect(a4, v18);
  }
}

- (double)vellumOpacity
{
  return *(double *)&self->_isSaving;
}

- (void)setVellumOpacity:(double)a3
{
  *(double *)&self->_isSaving = a3;
}

- (BOOL)isSaving
{
  return (BOOL)self->super._private;
}

- (void)setIsSaving:(BOOL)a3
{
  LOBYTE(self->super._private) = a3;
}

@end
