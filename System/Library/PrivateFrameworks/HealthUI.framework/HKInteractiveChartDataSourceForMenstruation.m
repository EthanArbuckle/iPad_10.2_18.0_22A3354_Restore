@implementation HKInteractiveChartDataSourceForMenstruation

HKInteractiveChartMenstruationData *__HKInteractiveChartDataSourceForMenstruation_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  id v7;
  HKInteractiveChartMenstruationData *v8;

  v7 = a3;
  v8 = objc_alloc_init(HKInteractiveChartMenstruationData);
  -[HKInteractiveChartMenstruationData setValue:](v8, "setValue:", a2);
  -[HKInteractiveChartMenstruationData setDate:](v8, "setDate:", v7);

  -[HKInteractiveChartMenstruationData setStartOfCycle:](v8, "setStartOfCycle:", a5 & 1);
  return v8;
}

uint64_t __HKInteractiveChartDataSourceForMenstruation_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0CB5588]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    v6 = 1;
  else
    v6 = 2 * (objc_msgSend(v2, "value") == 5);

  return v6;
}

HKInteractiveChartMenstruationData *__HKInteractiveChartDataSourceForMenstruation_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  id v7;
  HKInteractiveChartMenstruationData *v8;

  v7 = a3;
  v8 = objc_alloc_init(HKInteractiveChartMenstruationData);
  -[HKInteractiveChartMenstruationData setValue:](v8, "setValue:", a2);
  -[HKInteractiveChartMenstruationData setDate:](v8, "setDate:", v7);

  -[HKInteractiveChartMenstruationData setStartOfCycle:](v8, "setStartOfCycle:", a5 & 1);
  return v8;
}

@end
