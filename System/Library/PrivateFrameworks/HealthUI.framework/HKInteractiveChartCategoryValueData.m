@implementation HKInteractiveChartCategoryValueData

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKInteractiveChartCategoryValueData value](self, "value");
    if (v6 == objc_msgSend(v5, "value"))
    {
      -[HKInteractiveChartCategoryValueData startDate](self, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        -[HKInteractiveChartCategoryValueData endDate](self, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v10 == v11;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[HKInteractiveChartCategoryValueData startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKInteractiveChartCategoryValueData endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[HKInteractiveChartCategoryValueData value](self, "value");

  return v7;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
