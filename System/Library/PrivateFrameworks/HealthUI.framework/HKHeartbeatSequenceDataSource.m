@implementation HKHeartbeatSequenceDataSource

- (HKHeartbeatSequenceDataSource)init
{
  HKHeartbeatSequenceDataSource *v2;
  HKGraphSeriesDataBlock *v3;
  HKGraphSeriesDataBlock *dataBlock;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHeartbeatSequenceDataSource;
  v2 = -[HKGraphSeriesDataSource init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKGraphSeriesDataBlock);
    dataBlock = v2->_dataBlock;
    v2->_dataBlock = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[HKGraphSeriesDataBlock setChartPoints:](v2->_dataBlock, "setChartPoints:", v5);

  }
  return v2;
}

- (void)setHeartbeatSequencePoints:(id)a3
{
  id v4;

  -[HKGraphSeriesDataBlock setChartPoints:](self->_dataBlock, "setChartPoints:", a3);
  -[HKGraphSeriesDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceDidUpdateCache:", self);

}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  *(_OWORD *)&retstr->index = xmmword_1D7B81440;
  retstr->resolution = a6;
  return self;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  HKGraphSeriesDataBlock *v4;

  if (a3->index)
  {
    v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    -[HKGraphSeriesDataBlock setChartPoints:](v4, "setChartPoints:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v4 = self->_dataBlock;
  }
  return v4;
}

- (CGRect)unionWithExtent:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32 = *MEMORY[0x1E0C80C00];
  -[HKGraphSeriesDataBlock chartPoints](self->_dataBlock, "chartPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      v12 = x;
      v13 = y;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        objc_msgSend(v14, "xValueAsGenericType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        objc_msgSend(v14, "yValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        if (v12 >= v17)
          x = v17;
        else
          x = v12;
        if (v13 >= v20)
          y = v20;
        else
          y = v13;
        v21 = v12 + width;
        if (v12 + width < v17)
          v21 = v17;
        v22 = v13 + height;
        if (v13 + height < v20)
          v22 = v20;
        width = v21 - x;
        height = v22 - y;
        ++v11;
        v12 = x;
        v13 = y;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
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
