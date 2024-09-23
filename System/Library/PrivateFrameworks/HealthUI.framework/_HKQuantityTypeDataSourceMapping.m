@implementation _HKQuantityTypeDataSourceMapping

- (_HKQuantityTypeDataSourceMapping)initWithQuantityTypeDataSource:(id)a3
{
  id v4;
  _HKQuantityTypeDataSourceMapping *v5;
  _HKQuantityTypeDataSourceMapping *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKQuantityTypeDataSourceMapping;
  v5 = -[_HKQuantityTypeDataSourceMapping init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakQuantityTypeDataSource, v4);

  return v6;
}

- (id)map:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  HKGraphSeriesDataBlock *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  _HKQuantityTypeDataSourceMapping *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;

  v5 = a3;
  -[_HKQuantityTypeDataSourceMapping weakQuantityTypeDataSource](self, "weakQuantityTypeDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v5, "chartPoints"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v6, "displayType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unitController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitForChartingDisplayType:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chartPoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __40___HKQuantityTypeDataSourceMapping_map___block_invoke;
    v21 = &unk_1E9C43C78;
    v27 = a2;
    v22 = self;
    v23 = v6;
    v24 = v10;
    v25 = v8;
    v26 = v11;
    v13 = v11;
    v14 = v8;
    v15 = v10;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v18);

    v16 = objc_alloc_init(HKGraphSeriesDataBlock);
    -[HKGraphSeriesDataBlock setChartPoints:](v16, "setChartPoints:", v13, v18, v19, v20, v21, v22);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (HKQuantityTypeDataSource)weakQuantityTypeDataSource
{
  return (HKQuantityTypeDataSource *)objc_loadWeakRetained((id *)&self->_weakQuantityTypeDataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakQuantityTypeDataSource);
}

@end
