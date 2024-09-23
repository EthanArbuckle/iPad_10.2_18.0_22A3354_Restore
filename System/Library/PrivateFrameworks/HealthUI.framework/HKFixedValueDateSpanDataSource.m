@implementation HKFixedValueDateSpanDataSource

- (HKFixedValueDateSpanDataSource)initWithTrendModel:(id)a3 preferredUnitBlock:(id)a4 fixedValueScalingBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HKFixedValueDateSpanDelegate *v12;
  HKFixedValueDateSpanDataSource *v13;
  HKFixedValueDateSpanDataSource *v14;
  void *v15;
  id preferredUnitBlock;
  void *v17;
  id fixedValueScalingBlock;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(_HKFixedValueDateSpanDelegate);
  v20.receiver = self;
  v20.super_class = (Class)HKFixedValueDateSpanDataSource;
  v13 = -[HKDateRangeDataSource initWithSourceDelegate:](&v20, sel_initWithSourceDelegate_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_trendModel, a3);
    v15 = _Block_copy(v10);
    preferredUnitBlock = v14->_preferredUnitBlock;
    v14->_preferredUnitBlock = v15;

    v17 = _Block_copy(v11);
    fixedValueScalingBlock = v14->_fixedValueScalingBlock;
    v14->_fixedValueScalingBlock = v17;

    objc_storeStrong((id *)&v14->_sourceDelegate, v12);
    -[_HKFixedValueDateSpanDelegate setFixedValueDateSpanDataSource:](v12, "setFixedValueDateSpanDataSource:", v14);
    objc_msgSend(v9, "addObserver:", v14);
  }

  return v14;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  HKFixedValueDateSpanChartPoint *v23;
  uint64_t v24;
  void *v25;
  HKFixedValueDateSpanDataSource *v26;
  id v27;
  void *v28;
  HKFixedValueDateSpanChartPoint *v29;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[HKFixedValueDateSpanDataSource trendModel](self, "trendModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeScopeTrends");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    v31 = *(_QWORD *)v45;
    v32 = a4;
    do
    {
      v12 = 0;
      v33 = v10;
      do
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
        if (objc_msgSend(v13, "timeScope") == a4)
        {
          v35 = v12;
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v13, "trendSpans");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v14)
          {
            v15 = v14;
            v39 = 0;
            v16 = *(_QWORD *)v41;
            v37 = v13;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v41 != v16)
                  objc_enumerationMutation(v38);
                v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v13, "trendSpans");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "count");

                if (-[HKFixedValueDateSpanDataSource _insideRange:trendSpan:](self, "_insideRange:trendSpan:", v6, v18))
                {
                  v21 = 1;
                  if (((v39 + (_BYTE)i) & 1) != 0)
                    v21 = 2;
                  if (v20 == 1)
                    v22 = 0;
                  else
                    v22 = v21;
                  v23 = [HKFixedValueDateSpanChartPoint alloc];
                  objc_msgSend(v13, "localizableTrendDescription");
                  v24 = v15;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKFixedValueDateSpanDataSource fixedValueScalingBlock](self, "fixedValueScalingBlock");
                  v26 = self;
                  v27 = v6;
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = -[HKFixedValueDateSpanChartPoint initWithTrendSpan:styleIdentifier:localizableTrendDescription:fixedValueScalingBlock:](v23, "initWithTrendSpan:styleIdentifier:localizableTrendDescription:fixedValueScalingBlock:", v18, v22, v25, v28);

                  v6 = v27;
                  self = v26;

                  v15 = v24;
                  v13 = v37;
                  objc_msgSend(v36, "addObject:", v29);

                }
              }
              v15 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              v39 += i;
            }
            while (v15);
          }

          v11 = v31;
          a4 = v32;
          v10 = v33;
          v12 = v35;
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v10);
  }

  return v36;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  HKGraphSeriesDataBlockPath v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKFixedValueDateSpanDataSource;
  v10 = *a3;
  -[HKDateRangeDataSource cachedBlockForPath:context:](&v11, sel_cachedBlockForPath_context_, &v10, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFixedValueDateSpanDataSource preferredUnitBlock](self, "preferredUnitBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKFixedValueDateSpanDataSource preferredUnitBlock](self, "preferredUnitBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[HKFixedValueDateSpanDataSource _setPreferredUnitForBlock:unit:](self, "_setPreferredUnitForBlock:unit:", v5, v8);

  }
  return v5;
}

- (void)_setPreferredUnitForBlock:(id)a3 unit:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "chartPoints", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "setPreferredUnit:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)trendModelChanged
{
  void *v2;
  id v3;

  -[HKFixedValueDateSpanDataSource sourceDelegate](self, "sourceDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCallbackDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateRangeDataUpdated");

}

- (BOOL)_insideRange:(id)a3 trendSpan:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "trendDateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "trendDateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hk_isBeforeDate:", v10) & 1) != 0)
    LOBYTE(v13) = 0;
  else
    v13 = objc_msgSend(v7, "hk_isAfterDate:", v12) ^ 1;

  return v13;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (id)preferredUnitBlock
{
  return self->_preferredUnitBlock;
}

- (id)fixedValueScalingBlock
{
  return self->_fixedValueScalingBlock;
}

- (_HKFixedValueDateSpanDelegate)sourceDelegate
{
  return self->_sourceDelegate;
}

- (void)setSourceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDelegate, 0);
  objc_storeStrong(&self->_fixedValueScalingBlock, 0);
  objc_storeStrong(&self->_preferredUnitBlock, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
}

@end
