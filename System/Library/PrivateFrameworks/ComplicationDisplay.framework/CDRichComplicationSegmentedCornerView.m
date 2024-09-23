@implementation CDRichComplicationSegmentedCornerView

- (int64_t)_segmentShapeStyleForIndex:(unint64_t)a3 angle:(double)a4
{
  int64_t result;
  int64_t v6;
  int64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationSegmentedCornerView;
  result = -[CDRichComplicationSegmentedView _segmentShapeStyleForIndex:angle:](&v8, sel__segmentShapeStyleForIndex_angle_, a3);
  v6 = 1;
  v7 = 2;
  if (result != 1)
    v7 = result;
  if (result != 2)
    v6 = v7;
  if (a4 <= 3.14159265)
    return v6;
  return result;
}

@end
