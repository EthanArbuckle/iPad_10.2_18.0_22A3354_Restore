@implementation HKHistogramAnnotationViewDataSource

- (HKHistogramAnnotationViewDataSource)initWithFormatter:(id)a3
{
  id v5;
  HKHistogramAnnotationViewDataSource *v6;
  HKHistogramAnnotationViewDataSource *v7;
  NSMutableArray *v8;
  NSMutableArray *keyValuePairs;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHistogramAnnotationViewDataSource;
  v6 = -[HKHistogramAnnotationViewDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_formatter, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keyValuePairs = v7->_keyValuePairs;
    v7->_keyValuePairs = v8;

  }
  return v7;
}

- (void)updateWithPointSelectionContexts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  HKInteractiveChartAnnotationViewKeyValueLabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKHistogramAnnotationViewDataSource keyValuePairs](self, "keyValuePairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v11), "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }
  v26 = v7;

  -[HKHistogramAnnotationViewDataSource formatter](self, "formatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formattedSelectedRangeLabelDataWithChartData:context:", v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
        v21 = objc_alloc_init(HKInteractiveChartAnnotationViewKeyValueLabel);
        -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v21, "keyLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSelectedRangeData:", v20);

        -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v21, "valueLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "attributedString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAttributedText:", v24);

        -[HKHistogramAnnotationViewDataSource keyValuePairs](self, "keyValuePairs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }

}

- (id)dateViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HKHistogramAnnotationViewDataSource keyValuePairs](self, "keyValuePairs", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  -[HKHistogramAnnotationViewDataSource keyValuePairs](self, "keyValuePairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    v8 = 1;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v8 = 0;
LABEL_5:
    objc_msgSend(v7, "setOrientation:", v8);
  }
  return v7;
}

- (BOOL)showSeparators
{
  return 0;
}

- (HKInteractiveChartDataFormatter)formatter
{
  return self->_formatter;
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
  objc_storeStrong((id *)&self->_keyValuePairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
