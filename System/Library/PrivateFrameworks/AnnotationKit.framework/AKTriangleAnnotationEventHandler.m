@implementation AKTriangleAnnotationEventHandler

- (double)naturalAspectRatioForAnnotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[AKAnnotationEventHandler initialDraggedPoint](self, "initialDraggedPoint");
  v4 = v3;
  v6 = v5;
  -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
  return fabs((v4 - v7) / (v6 - v8));
}

@end
