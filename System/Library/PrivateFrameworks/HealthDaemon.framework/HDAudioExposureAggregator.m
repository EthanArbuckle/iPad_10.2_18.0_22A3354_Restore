@implementation HDAudioExposureAggregator

- (void)addDatum:(id)a3 toAccumulatedData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HDActiveQuantityDataAggregator quantityType](self, "quantityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canonicalUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v11);
    v13 = v12;

    if (v13 >= 80.0)
      goto LABEL_5;
    objc_msgSend(v8, "quantity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canonicalUnit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v15);
    v17 = v16;

    if (v17 >= 80.0)
      goto LABEL_5;
    objc_msgSend(v6, "dateInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateInterval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v21);
    v23 = v22;

    if (v23 <= 30.0)
    {
      v28[0] = v8;
      v28[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HDMergedQuantitySensorData(v24, v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v7;
      if (v25)
      {
        objc_msgSend(v7, "removeLastObject");
        v26 = v7;
        v27 = v25;
      }
      else
      {
        v27 = v6;
      }
      objc_msgSend(v26, "addObject:", v27);

    }
    else
    {
LABEL_5:
      objc_msgSend(v7, "addObject:", v6);
    }

  }
  else
  {
    objc_msgSend(v7, "addObject:", v6);
  }

}

- (BOOL)shouldFreezeCurrentSeries:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 configuration:(id)a6 aggregationInterval:(double)a7
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v9 = a3;
  v10 = a6;
  -[HDActiveQuantityDataAggregator quantityType](self, "quantityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "code");

  v17 = 0;
  if (v12 == 173)
  {
    objc_msgSend(v9, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = -v14;

    objc_msgSend(v10, "maximumSeriesDuration");
    if (v16 < v15)
      v17 = 1;
  }

  return v17;
}

@end
