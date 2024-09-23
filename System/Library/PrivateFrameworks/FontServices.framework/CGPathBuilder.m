@implementation CGPathBuilder

- (CGPathBuilder)init
{
  CGPathBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CGPathBuilder;
  v2 = -[CGPathBuilder init](&v4, sel_init);
  if (v2)
    v2->path = CGPathCreateMutable();
  return v2;
}

- (void)dealloc
{
  CGPath *path;
  objc_super v4;

  path = self->path;
  if (path)
    CFRelease(path);
  v4.receiver = self;
  v4.super_class = (Class)CGPathBuilder;
  -[CGPathBuilder dealloc](&v4, sel_dealloc);
}

- (void)moveTo:(CGPoint)a3
{
  CGPathMoveToPoint(self->path, 0, a3.x, a3.y);
}

- (void)lineTo:(CGPoint)a3
{
  CGPathAddLineToPoint(self->path, 0, a3.x, a3.y);
}

- (void)quadCurveTo:(CGPoint)a3 control:(CGPoint)a4
{
  CGPathAddQuadCurveToPoint(self->path, 0, a4.x, a4.y, a3.x, a3.y);
}

- (void)cubicCurveTo:(CGPoint)a3 control1:(CGPoint)a4 control2:(CGPoint)a5
{
  CGPathAddCurveToPoint(self->path, 0, a4.x, a4.y, a5.x, a5.y, a3.x, a3.y);
}

- (void)endPath
{
  CGPathCloseSubpath(self->path);
}

- (CGPath)copyPath
{
  _BOOL4 overlaps;
  CGPath *path;

  overlaps = self->overlaps;
  path = self->path;
  if (!overlaps)
    JUMPOUT(0x1B5E0CB58);
  return CGPathCreateCopyByNormalizing(path, 0);
}

- (BOOL)overlaps
{
  return self->overlaps;
}

- (void)setOverlaps:(BOOL)a3
{
  self->overlaps = a3;
}

@end
