@implementation FIUIChartPointMultiple

+ (id)chartPointWithDate:(id)a3 valueIndexSet:(id)a4
{
  id v5;
  id v6;
  FIUIChartPointMultiple *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(FIUIChartPointMultiple);
  -[FIUIChartPointMultiple setXValue:](v7, "setXValue:", v6);

  -[FIUIChartPointMultiple setYValue:](v7, "setYValue:", v5);
  return v7;
}

+ (id)chartPointWithXValue:(id)a3 yValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "doubleValue", (_QWORD)v17);
        objc_msgSend(v8, "addIndex:", llround(v14));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "chartPointWithDate:valueIndexSet:", v6, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)minYValue
{
  void *v3;

  v3 = -[NSIndexSet count](self->_yValue, "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSIndexSet firstIndex](self->_yValue, "firstIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v3;
}

- (NSNumber)maxYValue
{
  void *v3;

  v3 = -[NSIndexSet count](self->_yValue, "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSIndexSet lastIndex](self->_yValue, "lastIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p, (%@, %@)>"), objc_opt_class(), self, self->_xValue, self->_yValue);
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSIndexSet)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
