@implementation PKDrawingReplayPoint

- ($78FB54F4A6B442EA15B736438C71FAD1)pkInputPointWithOffset:(SEL)a3
{
  double y;
  double x;
  $78FB54F4A6B442EA15B736438C71FAD1 *result;
  double v8;
  double v9;

  y = a4.y;
  x = a4.x;
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var1 = 0.5;
  result = ($78FB54F4A6B442EA15B736438C71FAD1 *)-[PKDrawingReplayPoint point](self, "point");
  retstr->var0.var0.x = x + v8;
  retstr->var0.var0.y = y + v9;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

@end
