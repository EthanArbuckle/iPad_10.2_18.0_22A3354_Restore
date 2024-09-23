@implementation HKTickStyle

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKTickStyle;
  result = -[HKStrokeStyle copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_tickLength;
  *((_QWORD *)result + 8) = self->_tickDirection;
  return result;
}

- (double)tickLength
{
  return self->_tickLength;
}

- (void)setTickLength:(double)a3
{
  self->_tickLength = a3;
}

- (int64_t)tickDirection
{
  return self->_tickDirection;
}

- (void)setTickDirection:(int64_t)a3
{
  self->_tickDirection = a3;
}

- (BOOL)shouldRenderMajorTickMarks
{
  return self->_shouldRenderMajorTickMarks;
}

- (void)setShouldRenderMajorTickMarks:(BOOL)a3
{
  self->_shouldRenderMajorTickMarks = a3;
}

@end
