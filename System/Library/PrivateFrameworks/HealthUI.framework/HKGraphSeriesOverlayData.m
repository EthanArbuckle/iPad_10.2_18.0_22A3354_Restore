@implementation HKGraphSeriesOverlayData

- (HKGraphSeriesOverlayData)initWithGraphSeries:(id)a3 graphSeriesScreenRect:(CGRect)a4 graphSeriesCoordinates:(id)a5 graphSeriesPointTransform:(CGAffineTransform *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  HKGraphSeriesOverlayData *v16;
  HKGraphSeriesOverlayData *v17;
  __int128 v18;
  __int128 v19;
  objc_super v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKGraphSeriesOverlayData;
  v16 = -[HKGraphSeriesOverlayData init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_graphSeries, a3);
    v17->_graphSeriesScreenRect.origin.x = x;
    v17->_graphSeriesScreenRect.origin.y = y;
    v17->_graphSeriesScreenRect.size.width = width;
    v17->_graphSeriesScreenRect.size.height = height;
    objc_storeStrong((id *)&v17->_graphSeriesCoordinates, a5);
    v18 = *(_OWORD *)&a6->a;
    v19 = *(_OWORD *)&a6->c;
    *(_OWORD *)&v17->_graphSeriesPointTransform.tx = *(_OWORD *)&a6->tx;
    *(_OWORD *)&v17->_graphSeriesPointTransform.c = v19;
    *(_OWORD *)&v17->_graphSeriesPointTransform.a = v18;
  }

  return v17;
}

- (HKGraphSeries)graphSeries
{
  return self->_graphSeries;
}

- (CGRect)graphSeriesScreenRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_graphSeriesScreenRect.origin.x;
  y = self->_graphSeriesScreenRect.origin.y;
  width = self->_graphSeriesScreenRect.size.width;
  height = self->_graphSeriesScreenRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (HKGraphSeriesBlockCoordinateList)graphSeriesCoordinates
{
  return self->_graphSeriesCoordinates;
}

- (CGAffineTransform)graphSeriesPointTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphSeriesCoordinates, 0);
  objc_storeStrong((id *)&self->_graphSeries, 0);
}

@end
