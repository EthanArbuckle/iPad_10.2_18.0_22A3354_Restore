@implementation HKScalarZoomScale

- (int64_t)zoomForZoomScale:(double)a3
{
  return 6;
}

- (double)zoomScaleForRange:(HKRange)a3
{
  return 1.0;
}

- (id)unitZoomScaleValueRange
{
  return 0;
}

@end
