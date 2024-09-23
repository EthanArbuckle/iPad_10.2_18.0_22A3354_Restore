@implementation HKSleepPeriodCoordinate

- (HKSleepPeriodCoordinate)initWithXValue:(double)a3 asleepYValues:(id)a4 inBedYValues:(id)a5 yValues:(id)a6 upperGoalYValue:(id)a7 lowerGoalYValue:(id)a8 highlighted:(BOOL)a9 userInfo:(id)a10
{
  id v17;
  id v18;
  id v19;
  HKSleepPeriodCoordinate *v20;
  HKSleepPeriodCoordinate *v21;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)HKSleepPeriodCoordinate;
  v20 = -[HKSleepPeriodCoordinate init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_xValue = a3;
    objc_storeStrong((id *)&v20->_asleepYValues, a4);
    objc_storeStrong((id *)&v21->_inBedYValues, a5);
    objc_storeStrong((id *)&v21->_yValues, a6);
    objc_storeStrong((id *)&v21->_upperGoalYValue, a7);
    objc_storeStrong((id *)&v21->_lowerGoalYValue, a8);
    v21->_highlighted = a9;
    objc_storeStrong((id *)&v21->_userInfo, a10);
  }

  return v21;
}

- (double)startXValue
{
  return self->_xValue;
}

- (double)endXValue
{
  return self->_xValue;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  id v6;
  uint64_t v7;
  NSArray *asleepYValues;
  __int128 v9;
  NSArray *inBedYValues;
  __int128 v11;
  void *v12;
  double xValue;
  double a;
  double c;
  double tx;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  NSNumber *upperGoalYValue;
  double v26;
  void *v27;
  NSNumber *lowerGoalYValue;
  double v29;
  void *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  asleepYValues = self->_asleepYValues;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke;
  v42[3] = &unk_1E9C453D0;
  v42[4] = self;
  v9 = *(_OWORD *)&a3->c;
  v43 = *(_OWORD *)&a3->a;
  v44 = v9;
  v45 = *(_OWORD *)&a3->tx;
  -[NSArray hk_map:](asleepYValues, "hk_map:", v42);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  inBedYValues = self->_inBedYValues;
  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke_2;
  v38[3] = &unk_1E9C453D0;
  v38[4] = self;
  v11 = *(_OWORD *)&a3->c;
  v39 = *(_OWORD *)&a3->a;
  v40 = v11;
  v41 = *(_OWORD *)&a3->tx;
  -[NSArray hk_map:](inBedYValues, "hk_map:", v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  xValue = self->_xValue;
  a = a3->a;
  c = a3->c;
  tx = a3->tx;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = self->_yValues;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = self->_xValue;
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v21), "doubleValue");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->ty + v23 * a3->d + a3->b * v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v24);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v19);
  }

  upperGoalYValue = self->_upperGoalYValue;
  if (upperGoalYValue)
  {
    -[NSNumber doubleValue](upperGoalYValue, "doubleValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->ty + v26 * a3->d + a3->b * 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  lowerGoalYValue = self->_lowerGoalYValue;
  if (lowerGoalYValue)
  {
    -[NSNumber doubleValue](lowerGoalYValue, "doubleValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->ty + v29 * a3->d + a3->b * 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v31 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXValue:asleepYValues:inBedYValues:yValues:upperGoalYValue:lowerGoalYValue:highlighted:userInfo:", v33, v12, v6, v27, v30, self->_highlighted, tx + c * 0.0 + a * xValue, self->_userInfo);

  return v31;
}

id __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = a2;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80) + v7 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "continuation");

  +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = a2;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80) + v7 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "continuation");

  +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)asleepYValues
{
  return self->_asleepYValues;
}

- (NSArray)inBedYValues
{
  return self->_inBedYValues;
}

- (NSArray)yValues
{
  return self->_yValues;
}

- (NSNumber)upperGoalYValue
{
  return self->_upperGoalYValue;
}

- (NSNumber)lowerGoalYValue
{
  return self->_lowerGoalYValue;
}

- (double)xValue
{
  return self->_xValue;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lowerGoalYValue, 0);
  objc_storeStrong((id *)&self->_upperGoalYValue, 0);
  objc_storeStrong((id *)&self->_yValues, 0);
  objc_storeStrong((id *)&self->_inBedYValues, 0);
  objc_storeStrong((id *)&self->_asleepYValues, 0);
}

@end
