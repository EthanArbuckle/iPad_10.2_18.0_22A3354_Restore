@implementation _CUIPSDStopAndMidpointPair

- (_CUIPSDStopAndMidpointPair)initWithStop:(id)a3 midpoint:(id)a4
{
  _CUIPSDStopAndMidpointPair *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CUIPSDStopAndMidpointPair;
  v6 = -[_CUIPSDStopAndMidpointPair init](&v9, sel_init);
  if (v6)
  {
    v6->stop = a3;
    if (a4)
      objc_msgSend(a4, "doubleValue");
    else
      v7 = 0.5;
    v6->midpoint = v7;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIPSDStopAndMidpointPair;
  -[_CUIPSDStopAndMidpointPair dealloc](&v3, sel_dealloc);
}

- (int64_t)compare:(id)a3
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(self->stop, "location");
  v5 = v4;
  objc_msgSend(*((id *)a3 + 1), "location");
  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (id)stop
{
  return self->stop;
}

- (double)midpoint
{
  return self->midpoint;
}

@end
