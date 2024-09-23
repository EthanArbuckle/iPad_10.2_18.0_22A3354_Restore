@implementation HMIVideoAnalyzerMutableReportComparison

- (HMIVideoAnalyzerMutableReportComparison)initWithTruePositiveKeys:(id)a3 falseNegativeKeys:(id)a4 falsePositiveKeys:(id)a5 groupByKey:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  HMIVideoAnalyzerMutableReportComparison *v14;
  HMIVideoAnalyzerMutableReportComparison *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t truePositive;
  float v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  float v32;
  objc_super v34;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v34.receiver = self;
  v34.super_class = (Class)HMIVideoAnalyzerMutableReportComparison;
  v14 = -[HMIVideoAnalyzerMutableReportComparison init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_truePositiveKeys, a3);
    objc_storeStrong((id *)&v15->_falseNegativeKeys, a4);
    objc_storeStrong((id *)&v15->_falsePositiveKeys, a5);
    if (v6)
    {
      v16 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v11, "na_map:", &__block_literal_global_14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_truePositive = objc_msgSend(v18, "count");

      v19 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v12, "na_map:", &__block_literal_global_49);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_falseNegative = objc_msgSend(v21, "count");

      v22 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v13, "na_map:", &__block_literal_global_50);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_falsePositive = objc_msgSend(v24, "count");

    }
    else
    {
      objc_msgSend(v11, "valueForKeyPath:", CFSTR("@sum.count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_truePositive = (int)objc_msgSend(v25, "intValue");

      objc_msgSend(v12, "valueForKeyPath:", CFSTR("@sum.count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_falseNegative = (int)objc_msgSend(v26, "intValue");

      objc_msgSend(v13, "valueForKeyPath:", CFSTR("@sum.count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_falsePositive = (int)objc_msgSend(v23, "intValue");
    }

    truePositive = v15->_truePositive;
    v28 = (float)truePositive;
    v29 = v15->_falsePositive + truePositive;
    v30 = (float)truePositive / (float)v29;
    if (!v29)
      v30 = 0.0;
    v15->_precision = v30;
    v31 = v15->_falseNegative + truePositive;
    v32 = v28 / (float)v31;
    if (!v31)
      v32 = 0.0;
    v15->_recall = v32;
  }

  return v15;
}

uint64_t __115__HMIVideoAnalyzerMutableReportComparison_initWithTruePositiveKeys_falseNegativeKeys_falsePositiveKeys_groupByKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

uint64_t __115__HMIVideoAnalyzerMutableReportComparison_initWithTruePositiveKeys_falseNegativeKeys_falsePositiveKeys_groupByKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

uint64_t __115__HMIVideoAnalyzerMutableReportComparison_initWithTruePositiveKeys_falseNegativeKeys_falsePositiveKeys_groupByKey___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerMutableReportComparison precision](self, "precision");
  objc_msgSend(v4, "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Precision"), v21);
  v22[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerMutableReportComparison recall](self, "recall");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Recall"), v8);
  v22[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIVideoAnalyzerMutableReportComparison truePositive](self, "truePositive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("True Positive"), v11);
  v22[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIVideoAnalyzerMutableReportComparison falseNegative](self, "falseNegative"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("False Negative"), v14);
  v22[3] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMIVideoAnalyzerMutableReportComparison falsePositive](self, "falsePositive"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("False Positive"), v17);
  v22[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (float)precision
{
  return self->_precision;
}

- (float)recall
{
  return self->_recall;
}

- (NSArray)truePositiveKeys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)falseNegativeKeys
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)falsePositiveKeys
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)truePositive
{
  return self->_truePositive;
}

- (int64_t)falseNegative
{
  return self->_falseNegative;
}

- (int64_t)falsePositive
{
  return self->_falsePositive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falsePositiveKeys, 0);
  objc_storeStrong((id *)&self->_falseNegativeKeys, 0);
  objc_storeStrong((id *)&self->_truePositiveKeys, 0);
}

@end
