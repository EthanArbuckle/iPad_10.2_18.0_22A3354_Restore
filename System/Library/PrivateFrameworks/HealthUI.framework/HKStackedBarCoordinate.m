@implementation HKStackedBarCoordinate

- (HKStackedBarCoordinate)initWithStackPoints:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  HKStackedBarCoordinate *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  HKStackedBarCoordinate *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGPointValue");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v7, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGPointValue");
    v20.receiver = self;
    v20.super_class = (Class)HKStackedBarCoordinate;
    v18 = -[HKMinMaxCoordinate initWithMin:max:userInfo:](&v20, sel_initWithMin_max_userInfo_, v8, v12, v14, v16, v17);

    if (v18)
      objc_storeStrong((id *)&v18->_stackPoints, a3);
    self = v18;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  id v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[HKStackedBarCoordinate stackPoints](self, "stackPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HKStackedBarCoordinate stackPoints](self, "stackPoints", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "CGPointValue");
        v17 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v15), *(float64x2_t *)&a3->a, v16));
        v18 = v17.f64[1];
        if (v4)
          v17.f64[0] = HKUIFloorCGPointToScreenScale(v17.f64[0], v17.f64[1]);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v17.f64[0], v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  v20 = objc_alloc((Class)objc_opt_class());
  -[HKMinMaxCoordinate userInfo](self, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithStackPoints:userInfo:", v9, v21);

  return v22;
}

- (NSArray)stackPoints
{
  return self->_stackPoints;
}

- (void)setStackPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackPoints, 0);
}

@end
