@implementation HAMenstrualAlgorithmsAnalysis(HKMenstrualCycles)

- (id)hkmc_menstruationProjections
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "menstruationPredictions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_map:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource:()HKMenstrualCycles currentDayIndex:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(a1, "fertilityPredictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __133__HAMenstrualAlgorithmsAnalysis_HKMenstrualCycles__hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource_currentDayIndex___block_invoke;
  v11[3] = &unk_24D99DA68;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "hk_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hkmc_statistics
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stats");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hkmc_statistics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hkmc_deviations
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(a1, "deviationAnalysis");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "deviationAnalysis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prolongedBleeding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hkmc_deviationOfType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_addNonNilObject:", v6);

    objc_msgSend(a1, "deviationAnalysis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spotting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hkmc_deviationOfType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_addNonNilObject:", v9);

    objc_msgSend(a1, "deviationAnalysis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "irregularBleeding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hkmc_deviationOfType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_addNonNilObject:", v12);

    objc_msgSend(a1, "deviationAnalysis");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "infrequentBleeding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hkmc_deviationOfType:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_addNonNilObject:", v15);

    v16 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)hkmc_description
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "menstruationPredictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "fertilityPredictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stats");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hkmc_description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hkmc_deviations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p %@ menstruation predictions, %@ fertility predictions, stats: %@, deviations: %@>"), v3, a1, v6, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
