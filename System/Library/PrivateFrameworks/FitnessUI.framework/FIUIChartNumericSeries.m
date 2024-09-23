@implementation FIUIChartNumericSeries

- (id)CGPointsFromDataSet
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FIUIChartSeries dataSet](self, "dataSet", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "points");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[FIUIChartNumericSeries _CGPointFromChartPoint:](self, "_CGPointFromChartPoint:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (CGPoint)_CGPointFromChartPoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[FIUIChartSeries xValueForPointFromChartPoint:](self, "xValueForPointFromChartPoint:", v4);
  v6 = v5;
  objc_msgSend(v4, "yValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIChartSeries yValueForPointFromChartPointValue:](self, "yValueForPointFromChartPointValue:", v7);
  v9 = v8;

  v10 = v6;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

@end
