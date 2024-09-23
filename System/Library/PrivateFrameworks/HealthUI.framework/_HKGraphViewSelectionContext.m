@implementation _HKGraphViewSelectionContext

- (double)minimumSelectionDistance
{
  unint64_t v2;
  double result;

  v2 = -[_HKGraphViewSelectionContext selectionState](self, "selectionState");
  result = 40.0;
  if (v2 < 3)
    return 1.79769313e308;
  return result;
}

- (int64_t)selectionState
{
  return self->_selectionState;
}

- (void)setSelectionState:(int64_t)a3
{
  self->_selectionState = a3;
}

- (CGRect)seriesSelectionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_seriesSelectionRect.origin.x;
  y = self->_seriesSelectionRect.origin.y;
  width = self->_seriesSelectionRect.size.width;
  height = self->_seriesSelectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSeriesSelectionRect:(CGRect)a3
{
  self->_seriesSelectionRect = a3;
}

- (NSArray)touchPoints
{
  return self->_touchPoints;
}

- (void)setTouchPoints:(id)a3
{
  objc_storeStrong((id *)&self->_touchPoints, a3);
}

- (NSArray)selectionAreaMapping
{
  return self->_selectionAreaMapping;
}

- (void)setSelectionAreaMapping:(id)a3
{
  objc_storeStrong((id *)&self->_selectionAreaMapping, a3);
}

- (NSArray)selectedRangeBoundariesXValue
{
  return self->_selectedRangeBoundariesXValue;
}

- (void)setSelectedRangeBoundariesXValue:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeBoundariesXValue, a3);
}

- (HKGraphSeries)closestSeriesToSelection
{
  return self->_closestSeriesToSelection;
}

- (void)setClosestSeriesToSelection:(id)a3
{
  objc_storeStrong((id *)&self->_closestSeriesToSelection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closestSeriesToSelection, 0);
  objc_storeStrong((id *)&self->_selectedRangeBoundariesXValue, 0);
  objc_storeStrong((id *)&self->_selectionAreaMapping, 0);
  objc_storeStrong((id *)&self->_touchPoints, 0);
}

@end
