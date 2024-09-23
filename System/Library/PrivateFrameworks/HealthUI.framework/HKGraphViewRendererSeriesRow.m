@implementation HKGraphViewRendererSeriesRow

- (HKGraphViewRendererSeriesRow)initWithRowSeries:(id)a3 mainSeriesForRow:(id)a4 selectedSeriesForRow:(id)a5 selectedRangeBoundariesXValue:(id)a6 selectedTouchPointCount:(int64_t)a7 yAxisRect:(CGRect)a8 axisAnnotationHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  HKGraphViewRendererSeriesRow *v23;
  HKGraphViewRendererSeriesRow *v24;
  id v27;
  objc_super v28;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v27 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a9;
  v28.receiver = self;
  v28.super_class = (Class)HKGraphViewRendererSeriesRow;
  v23 = -[HKGraphViewRendererSeriesRow init](&v28, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_overlaidSeries, a3);
    objc_storeStrong((id *)&v24->_mainSeriesForRow, a4);
    objc_storeStrong((id *)&v24->_selectedSeriesForRow, a5);
    objc_storeStrong((id *)&v24->_selectedRangeBoundariesXValue, a6);
    v24->_selectedTouchPointCount = a7;
    v24->_yAxisRect.origin.x = x;
    v24->_yAxisRect.origin.y = y;
    v24->_yAxisRect.size.width = width;
    v24->_yAxisRect.size.height = height;
    objc_storeStrong((id *)&v24->_axisAnnotationHandler, a9);
  }

  return v24;
}

- (NSArray)overlaidSeries
{
  return self->_overlaidSeries;
}

- (HKGraphSeries)mainSeriesForRow
{
  return self->_mainSeriesForRow;
}

- (HKGraphSeries)selectedSeriesForRow
{
  return self->_selectedSeriesForRow;
}

- (NSArray)selectedRangeBoundariesXValue
{
  return self->_selectedRangeBoundariesXValue;
}

- (int64_t)selectedTouchPointCount
{
  return self->_selectedTouchPointCount;
}

- (CGRect)yAxisRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_yAxisRect.origin.x;
  y = self->_yAxisRect.origin.y;
  width = self->_yAxisRect.size.width;
  height = self->_yAxisRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (HKGraphSeriesAxisAnnotation)axisAnnotationHandler
{
  return self->_axisAnnotationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisAnnotationHandler, 0);
  objc_storeStrong((id *)&self->_selectedRangeBoundariesXValue, 0);
  objc_storeStrong((id *)&self->_selectedSeriesForRow, 0);
  objc_storeStrong((id *)&self->_mainSeriesForRow, 0);
  objc_storeStrong((id *)&self->_overlaidSeries, 0);
}

@end
