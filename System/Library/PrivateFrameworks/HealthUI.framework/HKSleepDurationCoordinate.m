@implementation HKSleepDurationCoordinate

- (HKSleepDurationCoordinate)initWithStackPoints:(id)a3 goalLineYValue:(id)a4 highlighted:(BOOL)a5 userInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKSleepDurationCoordinate *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  HKSleepDurationCoordinate *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGPointValue");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CGPointValue");
    v25.receiver = self;
    v25.super_class = (Class)HKSleepDurationCoordinate;
    v23 = -[HKMinMaxCoordinate initWithMin:max:userInfo:](&v25, sel_initWithMin_max_userInfo_, v13, v17, v19, v21, v22);

    if (v23)
    {
      objc_storeStrong((id *)&v23->_stackPoints, a3);
      objc_storeStrong((id *)&v23->_goalLineYValue, a4);
      v23->_highlighted = a5;
    }
    self = v23;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  double v16;
  float64x2_t v17;
  double v18;
  void *v19;
  NSNumber *goalLineYValue;
  double v21;
  void *v22;
  id v23;
  _BOOL8 highlighted;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[HKSleepDurationCoordinate stackPoints](self, "stackPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HKSleepDurationCoordinate stackPoints](self, "stackPoints", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "CGPointValue");
        v17 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v15), *(float64x2_t *)&a3->a, v16));
        v18 = v17.f64[1];
        if (v4)
          v17.f64[0] = HKUIFloorCGPointToScreenScale(v17.f64[0], v17.f64[1]);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v17.f64[0], v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  goalLineYValue = self->_goalLineYValue;
  if (goalLineYValue)
  {
    -[NSNumber doubleValue](goalLineYValue, "doubleValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->ty + v21 * a3->d + a3->b * 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v23 = objc_alloc((Class)objc_opt_class());
  highlighted = self->_highlighted;
  -[HKMinMaxCoordinate userInfo](self, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v9, v22, highlighted, v25);

  return v26;
}

- (NSArray)stackPoints
{
  return self->_stackPoints;
}

- (void)setStackPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)goalLineYValue
{
  return self->_goalLineYValue;
}

- (void)setGoalLineYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalLineYValue, 0);
  objc_storeStrong((id *)&self->_stackPoints, 0);
}

@end
