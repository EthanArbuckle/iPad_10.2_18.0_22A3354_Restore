@implementation HKAudiogramDataSource

- (HKAudiogramDataSource)initWithSensitivityData:(id)a3 forLeftEar:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HKAudiogramDataSource *v7;
  HKGraphSeriesDataBlock *v8;
  HKGraphSeriesDataBlock *dataBlock;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKAudiogramDataSource;
  v7 = -[HKGraphSeriesDataSource init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(HKGraphSeriesDataBlock);
    dataBlock = v7->_dataBlock;
    v7->_dataBlock = v8;

    +[HKAudiogramChartPoint chartPointsFromSensitivityPoints:isLeftEar:](HKAudiogramChartPoint, "chartPointsFromSensitivityPoints:isLeftEar:", v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v7->_dataBlock, "setChartPoints:", v10);

  }
  return v7;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  *(_OWORD *)&retstr->index = xmmword_1D7B81440;
  retstr->resolution = 0;
  return self;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  HKGraphSeriesDataBlock *v4;

  if (a3->index)
  {
    +[HKGraphSeriesDataBlock emptyDataBlock](HKGraphSeriesDataBlock, "emptyDataBlock");
    v4 = (HKGraphSeriesDataBlock *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_dataBlock;
  }
  return v4;
}

- (HKGraphSeriesDataBlock)dataBlock
{
  return self->_dataBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBlock, 0);
}

@end
