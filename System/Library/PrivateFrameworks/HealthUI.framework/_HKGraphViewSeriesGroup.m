@implementation _HKGraphViewSeriesGroup

- (_HKGraphViewSeriesGroup)init
{
  _HKGraphViewSeriesGroup *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *zoomToSeriesMapping;
  NSMutableArray *v5;
  NSMutableArray *currentSeries;
  _HKGraphViewSelectionContext *selectionContext;
  _HKGraphViewAxisAnnotationHandler *v8;
  _HKGraphViewAxisAnnotationHandler *axisAnnotationHandler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_HKGraphViewSeriesGroup;
  v2 = -[_HKGraphViewSeriesGroup init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    zoomToSeriesMapping = v2->_zoomToSeriesMapping;
    v2->_zoomToSeriesMapping = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentSeries = v2->_currentSeries;
    v2->_currentSeries = v5;

    selectionContext = v2->_selectionContext;
    v2->_selectionContext = 0;

    v8 = objc_alloc_init(_HKGraphViewAxisAnnotationHandler);
    axisAnnotationHandler = v2->_axisAnnotationHandler;
    v2->_axisAnnotationHandler = v8;

  }
  return v2;
}

- (NSMutableDictionary)zoomToSeriesMapping
{
  return self->_zoomToSeriesMapping;
}

- (void)setZoomToSeriesMapping:(id)a3
{
  objc_storeStrong((id *)&self->_zoomToSeriesMapping, a3);
}

- (NSMutableArray)currentSeries
{
  return self->_currentSeries;
}

- (void)setCurrentSeries:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeries, a3);
}

- (_HKGraphViewSelectionContext)selectionContext
{
  return self->_selectionContext;
}

- (void)setSelectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_selectionContext, a3);
}

- (_HKGraphViewAxisAnnotationHandler)axisAnnotationHandler
{
  return self->_axisAnnotationHandler;
}

- (void)setAxisAnnotationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_axisAnnotationHandler, a3);
}

- (NSArray)independentAxes
{
  return self->_independentAxes;
}

- (void)setIndependentAxes:(id)a3
{
  objc_storeStrong((id *)&self->_independentAxes, a3);
}

- (HKLegendView)legendView
{
  return self->_legendView;
}

- (void)setLegendView:(id)a3
{
  objc_storeStrong((id *)&self->_legendView, a3);
}

- (CGSize)lastLegendSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastLegendSize.width;
  height = self->_lastLegendSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastLegendSize:(CGSize)a3
{
  self->_lastLegendSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendView, 0);
  objc_storeStrong((id *)&self->_independentAxes, 0);
  objc_storeStrong((id *)&self->_axisAnnotationHandler, 0);
  objc_storeStrong((id *)&self->_selectionContext, 0);
  objc_storeStrong((id *)&self->_currentSeries, 0);
  objc_storeStrong((id *)&self->_zoomToSeriesMapping, 0);
}

@end
