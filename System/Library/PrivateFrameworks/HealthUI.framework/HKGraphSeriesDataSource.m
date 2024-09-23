@implementation HKGraphSeriesDataSource

- (HKGraphSeriesDataSource)init
{
  HKGraphSeriesDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKGraphSeriesDataSource;
  result = -[HKGraphSeriesDataSource init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_minimumZoom = xmmword_1D7B827E0;
  return result;
}

- (BOOL)hasPendingQueriesBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  return 0;
}

- (BOOL)hasAvailableBlocksBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  return 1;
}

- (BOOL)hasAllBlocksAvailableBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  return 1;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  int64_t v10;
  int64_t v11;
  int64_t v12;
  HKGraphSeriesDataBlockPath *result;
  id v14;

  v14 = a4;
  v10 = -[HKGraphSeriesDataSource minimumZoom](self, "minimumZoom");
  if (v10 > a5)
    a5 = v10;
  v11 = -[HKGraphSeriesDataSource maximumZoom](self, "maximumZoom");
  if (a5 >= v11)
    v12 = v11;
  else
    v12 = a5;
  HKGraphSeriesDataBlockPathContainingDate(v14, v12, a6, retstr);

  return result;
}

- (HKGraphSeriesDataSourceDelegate)delegate
{
  return (HKGraphSeriesDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)minimumZoom
{
  return self->_minimumZoom;
}

- (void)setMinimumZoom:(int64_t)a3
{
  self->_minimumZoom = a3;
}

- (int64_t)maximumZoom
{
  return self->_maximumZoom;
}

- (void)setMaximumZoom:(int64_t)a3
{
  self->_maximumZoom = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
