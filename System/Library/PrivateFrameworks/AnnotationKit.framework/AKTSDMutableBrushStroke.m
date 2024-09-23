@implementation AKTSDMutableBrushStroke

- (UIColor)color
{
  return self->color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->color, a3);
}

- (double)width
{
  return self->width;
}

- (void)setWidth:(double)a3
{
  self->width = a3;
}

- (int)join
{
  return self->join;
}

- (void)setJoin:(int)a3
{
  self->join = a3;
}

- (double)miterLimit
{
  return self->miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->miterLimit = a3;
}

- (NSString)strokeName
{
  return self->strokeName;
}

- (void)setStrokeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->strokeName, 0);
  objc_storeStrong((id *)&self->color, 0);
}

@end
