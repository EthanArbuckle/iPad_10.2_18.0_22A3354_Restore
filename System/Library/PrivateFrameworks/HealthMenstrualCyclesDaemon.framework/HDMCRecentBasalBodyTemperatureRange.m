@implementation HDMCRecentBasalBodyTemperatureRange

- (id)_initWithUpperQuantileValue:(double)a3 medianValue:(double)a4 lowerQuantileValue:(double)a5 unit:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;

  v10 = a6;
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDMCRecentBasalBodyTemperatureRange initWithUpperQuantileQuantity:medianQuantity:lowerQuantileQuantity:](self, v11, v12, v13);

  return v14;
}

- (_QWORD)initWithUpperQuantileQuantity:(void *)a3 medianQuantity:(void *)a4 lowerQuantileQuantity:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HDMCRecentBasalBodyTemperatureRange;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      v10 = objc_msgSend(v7, "copy");
      v11 = (void *)a1[1];
      a1[1] = v10;

      v12 = objc_msgSend(v8, "copy");
      v13 = (void *)a1[2];
      a1[2] = v12;

      v14 = objc_msgSend(v9, "copy");
      v15 = (void *)a1[3];
      a1[3] = v14;

    }
  }

  return a1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %@,%@,%@>"), objc_opt_class(), self->_lowerQuantile, self->_median, self->_upperQuantile);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  HKQuantity *upperQuantile;
  HKQuantity *v8;
  HKQuantity *median;
  HKQuantity *v10;
  HKQuantity *lowerQuantile;
  HKQuantity *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDMCRecentBasalBodyTemperatureRange;
  if (!-[HDMCRecentBasalBodyTemperatureRange isEqual:](&v14, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_16;
    }
    v6 = v4;
    upperQuantile = self->_upperQuantile;
    v8 = (HKQuantity *)v6[1];
    if (upperQuantile != v8 && (!v8 || !-[HKQuantity isEqual:](upperQuantile, "isEqual:")))
      goto LABEL_14;
    median = self->_median;
    v10 = (HKQuantity *)v6[2];
    if (median != v10 && (!v10 || !-[HKQuantity isEqual:](median, "isEqual:")))
      goto LABEL_14;
    lowerQuantile = self->_lowerQuantile;
    v12 = (HKQuantity *)v6[3];
    if (lowerQuantile == v12)
    {
      v5 = 1;
      goto LABEL_15;
    }
    if (v12)
      v5 = -[HKQuantity isEqual:](lowerQuantile, "isEqual:");
    else
LABEL_14:
      v5 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v5 = 1;
LABEL_16:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[HKQuantity hash](self->_upperQuantile, "hash");
  v4 = -[HKQuantity hash](self->_median, "hash") ^ v3;
  return v4 ^ -[HKQuantity hash](self->_lowerQuantile, "hash");
}

- (id)recentBasalBodyTemperatureWithMostRecentQuantity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE46BF0]), "initWithMostRecent:upperQuantile:median:lowerQuantile:", v4, self->_upperQuantile, self->_median, self->_lowerQuantile);

  return v5;
}

- (HKQuantity)upperQuantile
{
  return self->_upperQuantile;
}

- (HKQuantity)median
{
  return self->_median;
}

- (HKQuantity)lowerQuantile
{
  return self->_lowerQuantile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerQuantile, 0);
  objc_storeStrong((id *)&self->_median, 0);
  objc_storeStrong((id *)&self->_upperQuantile, 0);
}

@end
