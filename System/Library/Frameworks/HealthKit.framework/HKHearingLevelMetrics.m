@implementation HKHearingLevelMetrics

- (HKHearingLevelMetrics)initWithAverageSensitivity:(id)a3 minimumSensitivity:(id)a4 maximumSensitivity:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKHearingLevelMetrics *v12;
  HKHearingLevelMetrics *v13;
  uint64_t v14;
  HKQuantity *roundedAverageSensitivity;
  uint64_t v16;
  HKQuantity *roundedMinimumSensitivity;
  uint64_t v18;
  HKQuantity *roundedMaximumSensitivity;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKHearingLevelMetrics;
  v12 = -[HKHearingLevelMetrics init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_averageSensitivity, a3);
    objc_storeStrong((id *)&v13->_minimumSensitivity, a4);
    objc_storeStrong((id *)&v13->_maximumSensitivity, a5);
    +[HKHearingLevelMetrics _roundWithPositiveZeroForSensitivity:]((uint64_t)HKHearingLevelMetrics, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    roundedAverageSensitivity = v13->_roundedAverageSensitivity;
    v13->_roundedAverageSensitivity = (HKQuantity *)v14;

    +[HKHearingLevelMetrics _roundWithPositiveZeroForSensitivity:]((uint64_t)HKHearingLevelMetrics, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    roundedMinimumSensitivity = v13->_roundedMinimumSensitivity;
    v13->_roundedMinimumSensitivity = (HKQuantity *)v16;

    +[HKHearingLevelMetrics _roundWithPositiveZeroForSensitivity:]((uint64_t)HKHearingLevelMetrics, v11);
    v18 = objc_claimAutoreleasedReturnValue();
    roundedMaximumSensitivity = v13->_roundedMaximumSensitivity;
    v13->_roundedMaximumSensitivity = (HKQuantity *)v18;

  }
  return v13;
}

+ (id)_roundWithPositiveZeroForSensitivity:(uint64_t)a1
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_msgSend(v2, "_value");
    v4 = round(v3);
    if (v4 == 0.0)
    {
      objc_msgSend(v2, "_value");
      v5 = fabs(v4);
      if (v6 < 0.0)
        v4 = v5;
    }
    objc_msgSend(v2, "_unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (HKHearingLevelMetrics)_overallMetricsFromLeftEarMetrics:(void *)a3 rightEarMetrics:
{
  unint64_t v4;
  unint64_t v5;
  HKHearingLevelMetrics *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v4 | v5)
  {
    objc_msgSend((id)v4, "averageSensitivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "averageSensitivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKQuantityMin(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v4, "minimumSensitivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "minimumSensitivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKQuantityMin(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v4, "maximumSensitivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "maximumSensitivity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKQuantityMax(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[HKHearingLevelMetrics initWithAverageSensitivity:minimumSensitivity:maximumSensitivity:]([HKHearingLevelMetrics alloc], "initWithAverageSensitivity:minimumSensitivity:maximumSensitivity:", v9, v12, v15);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HKHearingLevelMetrics *v4;
  HKHearingLevelMetrics *v5;
  char v6;

  v4 = (HKHearingLevelMetrics *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[HKHearingLevelMetrics isEqualToHearingLevelMetrics:](self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToHearingLevelMetrics:(void *)a1
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a2;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_29;
  }
  objc_msgSend(a1, "averageSensitivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "averageSensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {
    objc_msgSend(v4, "averageSensitivity");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v16 = 0;
      goto LABEL_28;
    }
    v2 = (void *)v7;
    objc_msgSend(a1, "averageSensitivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "averageSensitivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v16 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v31 = v9;
    v32 = v8;
  }
  objc_msgSend(a1, "minimumSensitivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumSensitivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v11)
  {
    objc_msgSend(v4, "minimumSensitivity");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(a1, "minimumSensitivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "minimumSensitivity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", v15))
      {
        v27 = v15;
        v28 = v14;
        v29 = v13;
        goto LABEL_11;
      }

    }
    v16 = 0;
LABEL_23:
    v24 = v5 == v6;
    goto LABEL_26;
  }
LABEL_11:
  objc_msgSend(a1, "maximumSensitivity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumSensitivity");
  v18 = objc_claimAutoreleasedReturnValue();
  v16 = v17 == (void *)v18;
  if (v17 == (void *)v18)
  {

LABEL_20:
    if (v10 != v11)
    {

    }
    goto LABEL_23;
  }
  v19 = (void *)v18;
  v30 = v10;
  objc_msgSend(v4, "maximumSensitivity");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {

    goto LABEL_20;
  }
  v21 = (void *)v20;
  v26 = v2;
  objc_msgSend(a1, "maximumSensitivity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumSensitivity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v22, "isEqual:", v23);

  if (v30 == v11)
  {

  }
  else
  {

  }
  v24 = v5 == v6;
  v2 = v26;
LABEL_26:
  v9 = v31;
  v8 = v32;
  if (!v24)
    goto LABEL_27;
LABEL_28:

LABEL_29:
  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHearingLevelMetrics averageSensitivity](self, "averageSensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHearingLevelMetrics minimumSensitivity](self, "minimumSensitivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHearingLevelMetrics maximumSensitivity](self, "maximumSensitivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p averageValue = %@, minValue = %@, maxValue = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HKQuantity)averageSensitivity
{
  return self->_averageSensitivity;
}

- (HKQuantity)minimumSensitivity
{
  return self->_minimumSensitivity;
}

- (HKQuantity)maximumSensitivity
{
  return self->_maximumSensitivity;
}

- (HKQuantity)roundedAverageSensitivity
{
  return self->_roundedAverageSensitivity;
}

- (HKQuantity)roundedMinimumSensitivity
{
  return self->_roundedMinimumSensitivity;
}

- (HKQuantity)roundedMaximumSensitivity
{
  return self->_roundedMaximumSensitivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedMaximumSensitivity, 0);
  objc_storeStrong((id *)&self->_roundedMinimumSensitivity, 0);
  objc_storeStrong((id *)&self->_roundedAverageSensitivity, 0);
  objc_storeStrong((id *)&self->_maximumSensitivity, 0);
  objc_storeStrong((id *)&self->_minimumSensitivity, 0);
  objc_storeStrong((id *)&self->_averageSensitivity, 0);
}

@end
