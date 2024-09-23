@implementation BEScrollViewScrollUpdate

- (_QWORD)initWithScrollEvent:(uint64_t)a3 phase:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BEScrollViewScrollUpdate;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 2, a2);
      a1[1] = a3;
    }
  }

  return a1;
}

- (double)timestamp
{
  double result;

  if (self)
    self = (BEScrollViewScrollUpdate *)self->__scrollEvent;
  -[BEScrollViewScrollUpdate timestamp](self, "timestamp");
  return result;
}

- (uint64_t)_scrollEvent
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  if (self)
    self = (BEScrollViewScrollUpdate *)self->__scrollEvent;
  -[BEScrollViewScrollUpdate locationInView:](self, "locationInView:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  if (self)
    self = (BEScrollViewScrollUpdate *)self->__scrollEvent;
  -[BEScrollViewScrollUpdate _adjustedAcceleratedDeltaInView:](self, "_adjustedAcceleratedDeltaInView:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scrollEvent, 0);
}

@end
