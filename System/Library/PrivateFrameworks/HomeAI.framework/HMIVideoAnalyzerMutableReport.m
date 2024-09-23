@implementation HMIVideoAnalyzerMutableReport

- (HMIVideoAnalyzerMutableReport)initWithName:(id)a3
{
  id v4;
  HMIVideoAnalyzerMutableReport *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDictionary *deviceInformation;
  uint64_t v10;
  NSMutableDictionary *sessions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerMutableReport;
  v5 = -[HMIVideoAnalyzerMutableReport init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_version = 2;
    objc_msgSend((id)objc_opt_class(), "systemDeviceInformation");
    v8 = objc_claimAutoreleasedReturnValue();
    deviceInformation = v5->_deviceInformation;
    v5->_deviceInformation = (NSDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    sessions = v5->_sessions;
    v5->_sessions = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (HMIVideoAnalyzerMutableReport)initWithData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  HMIVideoAnalyzerMutableReport *v8;

  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = a3;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, a4);
  v8 = (HMIVideoAnalyzerMutableReport *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)appendFragmentResult:(id)a3 forKey:(id)a4 source:(id)a5 redactFrames:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMIVideoAnalyzerMutableReportSession *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v18 = a4;
  v10 = a5;
  v11 = a3;
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = -[HMIVideoAnalyzerMutableReportSession initWithSource:]([HMIVideoAnalyzerMutableReportSession alloc], "initWithSource:", v10);
    -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v18);

  }
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendFragmentResult:redactFrames:", v11, v6);

}

- (void)appendFragmentResultsFromReport:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v5);
}

- (NSSet)eventClasses
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke;
  v8[3] = &unk_24DBEAD38;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return (NSSet *)v6;
}

void __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a3, "fragments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_2;
  v5[3] = &unk_24DBEAD10;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_each:", v5);

}

void __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_3;
  v4[3] = &unk_24DBE9BD8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "allEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_4;
  v4[3] = &unk_24DBE9BD8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

uint64_t __45__HMIVideoAnalyzerMutableReport_eventClasses__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_opt_class());
}

- (id)averagePrecisionForMinPrecision:(float)a3 comparator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  float v16;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIVideoAnalyzerEvent eventClassesArray](HMIVideoAnalyzerEvent, "eventClassesArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__HMIVideoAnalyzerMutableReport_averagePrecisionForMinPrecision_comparator___block_invoke;
  v13[3] = &unk_24DBEAD60;
  v15 = v5;
  v16 = a3;
  v8 = v6;
  v14 = v8;
  v9 = v5;
  objc_msgSend(v7, "na_each:", v13);

  v10 = v14;
  v11 = v8;

  return v11;
}

void __76__HMIVideoAnalyzerMutableReport_averagePrecisionForMinPrecision_comparator___block_invoke(uint64_t a1, uint64_t a2)
{
  float v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  double v19;
  id v20;

  v4 = 0.0;
  v5 = 1.0;
  v6 = 0.0;
  v7 = 0.0;
  do
  {
    (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "precision");
    if (v9 >= v6)
    {
      objc_msgSend(v8, "recall");
      if (v10 <= v5)
      {
        objc_msgSend(v8, "precision");
        if (v11 > *(float *)(a1 + 48))
        {
          objc_msgSend(v8, "recall");
          v13 = (float)(v5 + v12) * 0.5;
          objc_msgSend(v8, "precision");
          v15 = *(float *)(a1 + 48);
          v16 = v14 - fmax(v6, v15);
          v4 = (float)(v13 * v16) / (1.0 - v15) + v4;
        }
        objc_msgSend(v8, "precision");
        v6 = v17;
        objc_msgSend(v8, "recall");
        v5 = v18;
      }
    }

    v19 = v7 + 0.01;
    v7 = v19;
  }
  while (v7 <= 1.0);
  *(float *)&v19 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, a2);

}

- (id)averagePrecisionWithClassificationTruth:(id)a3 minPrecision:(float)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  HMIVideoAnalyzerMutableReport *v16;
  id v17;

  v6 = a3;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __86__HMIVideoAnalyzerMutableReport_averagePrecisionWithClassificationTruth_minPrecision___block_invoke;
  v15 = &unk_24DBEAD88;
  v16 = self;
  v17 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x220735744](&v12);
  *(float *)&v9 = a4;
  -[HMIVideoAnalyzerMutableReport averagePrecisionForMinPrecision:comparator:](self, "averagePrecisionForMinPrecision:comparator:", v8, v9, v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __86__HMIVideoAnalyzerMutableReport_averagePrecisionWithClassificationTruth_minPrecision___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareWithClassificationTruth:eventClass:confidenceThreshold:", *(_QWORD *)(a1 + 40), a2);
}

- (id)averagePrecisionWithDetectionTruth:(id)a3 minPrecision:(float)a4 iouThreshold:(float)a5 videoMetric:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  float v18;
  BOOL v19;

  v10 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __106__HMIVideoAnalyzerMutableReport_averagePrecisionWithDetectionTruth_minPrecision_iouThreshold_videoMetric___block_invoke;
  v16[3] = &unk_24DBEADB0;
  v16[4] = self;
  v17 = v10;
  v18 = a5;
  v19 = a6;
  v11 = v10;
  v12 = (void *)MEMORY[0x220735744](v16);
  *(float *)&v13 = a4;
  -[HMIVideoAnalyzerMutableReport averagePrecisionForMinPrecision:comparator:](self, "averagePrecisionForMinPrecision:comparator:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __106__HMIVideoAnalyzerMutableReport_averagePrecisionWithDetectionTruth_minPrecision_iouThreshold_videoMetric___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  LODWORD(a4) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "compareWithDetectionTruth:eventClass:confidenceThreshold:iouThreshold:videoMetric:", *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 52), a3, a4);
}

- (id)chartDataWithBaseline:(BOOL)a3 comparator:(id)a4
{
  id v5;
  void *v6;
  float v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  float v16;
  BOOL v17;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1.0;
  v8 = MEMORY[0x24BDAC760];
  do
  {
    +[HMIVideoAnalyzerEvent eventClassesArray](HMIVideoAnalyzerEvent, "eventClassesArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __66__HMIVideoAnalyzerMutableReport_chartDataWithBaseline_comparator___block_invoke;
    v13[3] = &unk_24DBEADD8;
    v10 = v5;
    v15 = v10;
    v16 = v7;
    v11 = v6;
    v14 = v11;
    v17 = a3;
    objc_msgSend(v9, "na_each:", v13);

    v7 = v7 + -0.01;
  }
  while (v7 >= 0.0);

  return v11;
}

void __66__HMIVideoAnalyzerMutableReport_chartDataWithBaseline_comparator___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  float v5;
  float v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x24BDAC8D0];
  (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(*(float *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision");
  if (v5 != 0.0 || (objc_msgSend(v4, "recall"), v6 != 0.0))
  {
    v7 = (int)(float)(*(float *)(a1 + 48) * 100.0) % 10;
    v8 = *(void **)(a1 + 32);
    v20[0] = CFSTR("precision");
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "precision");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = CFSTR("recall");
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "recall");
    objc_msgSend(v11, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = CFSTR("threshold");
    LODWORD(v13) = *(_DWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    v20[3] = CFSTR("annotation");
    if (v7)
    {
      v15 = &stru_24DBF1B40;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), *(float *)(a1 + 48));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v21[3] = v15;
    v20[4] = CFSTR("class");
    +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", a2);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v20[5] = CFSTR("opacity");
    if (*(_BYTE *)(a1 + 52))
      v18 = &unk_24DC15470;
    else
      v18 = &unk_24DC14678;
    v21[4] = v16;
    v21[5] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);

    if (!v7)
  }

}

- (id)chartDataWithClassificationTruth:(id)a3 isBaseline:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  HMIVideoAnalyzerMutableReport *v15;
  id v16;

  v4 = a4;
  v6 = a3;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __77__HMIVideoAnalyzerMutableReport_chartDataWithClassificationTruth_isBaseline___block_invoke;
  v14 = &unk_24DBEAD88;
  v15 = self;
  v16 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x220735744](&v11);
  -[HMIVideoAnalyzerMutableReport chartDataWithBaseline:comparator:](self, "chartDataWithBaseline:comparator:", v4, v8, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __77__HMIVideoAnalyzerMutableReport_chartDataWithClassificationTruth_isBaseline___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "compareWithClassificationTruth:eventClass:confidenceThreshold:", *(_QWORD *)(a1 + 40), a2);
}

- (id)chartDataWithDetectionTruth:(id)a3 isBaseline:(BOOL)a4 iouThreshold:(float)a5 videoMetric:(BOOL)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  float v17;
  BOOL v18;

  v8 = a4;
  v10 = a3;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__HMIVideoAnalyzerMutableReport_chartDataWithDetectionTruth_isBaseline_iouThreshold_videoMetric___block_invoke;
  v15[3] = &unk_24DBEADB0;
  v15[4] = self;
  v16 = v10;
  v17 = a5;
  v18 = a6;
  v11 = v10;
  v12 = (void *)MEMORY[0x220735744](v15);
  -[HMIVideoAnalyzerMutableReport chartDataWithBaseline:comparator:](self, "chartDataWithBaseline:comparator:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __97__HMIVideoAnalyzerMutableReport_chartDataWithDetectionTruth_isBaseline_iouThreshold_videoMetric___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  LODWORD(a4) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "compareWithDetectionTruth:eventClass:confidenceThreshold:iouThreshold:videoMetric:", *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 52), a3, a4);
}

- (NSData)data
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v3);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSDictionary)systemDeviceInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v3 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("HardwareModel"));

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HomeAI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BDBD2A0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBD2A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("HomeAIBundleVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", HMIIsDebug());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("Debug"));

  return (NSDictionary *)v2;
}

- (id)truthReportFromLegacyClassificationFormat:(id)a3
{
  id v4;
  HMIVideoAnalyzerMutableReport *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  HMIVideoAnalyzerMutableReportSession *(*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  HMIVideoAnalyzerMutableReport *v16;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerMutableReport initWithName:]([HMIVideoAnalyzerMutableReport alloc], "initWithName:", CFSTR("Truth"));
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke;
  v14 = &unk_24DBEAE68;
  v15 = v4;
  v16 = self;
  v7 = v4;
  objc_msgSend(v6, "na_dictionaryByMappingValues:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoAnalyzerMutableReport sessions](v5, "sessions", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);

  return v5;
}

HMIVideoAnalyzerMutableReportSession *__75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMIVideoAnalyzerFragmentResult *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMIVideoAnalyzerFragmentResult *v19;
  HMIVideoAnalyzerMutableReportSession *v20;
  void *v21;
  HMIVideoAnalyzerMutableReportSession *v22;
  HMIVideoAnalyzerMutableReportSession *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke_2;
  v32[3] = &unk_24DBEAE00;
  v8 = v6;
  v33 = v8;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "fragments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("classification_classes"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "na_map:", &__block_literal_global_194);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [HMIVideoAnalyzerFragmentResult alloc];
    objc_msgSend(v11, "fragment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outcome");
    v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    v19 = -[HMIVideoAnalyzerFragmentResult initWithFragment:events:frameResults:thumbnails:configuration:outcome:](v12, "initWithFragment:events:frameResults:thumbnails:configuration:outcome:", v13, v14, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v15, v17);

    v20 = [HMIVideoAnalyzerMutableReportSession alloc];
    objc_msgSend(v8, "source");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    v5 = v16;
    v23 = -[HMIVideoAnalyzerMutableReportSession initWithSource:](v22, "initWithSource:", v21);

    -[HMIVideoAnalyzerMutableReportSession appendFragmentResult:redactFrames:](v23, "appendFragmentResult:redactFrames:", v19, 1);
    v9 = v18;

  }
  else
  {
    v24 = (void *)MEMORY[0x220735570]();
    v25 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "source");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_219D45000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot find ground truth for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v23 = 0;
  }

  return v23;
}

uint64_t __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("image_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id __75__HMIVideoAnalyzerMutableReport_truthReportFromLegacyClassificationFormat___block_invoke_192(uint64_t a1, uint64_t a2)
{
  id v2;
  HMIConfidence *v3;
  void *v4;

  v2 = objc_alloc(+[HMIVideoAnalyzerEvent eventClassForShortName:](HMIVideoAnalyzerEvent, "eventClassForShortName:", a2));
  v3 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15158, 1.0);
  v4 = (void *)objc_msgSend(v2, "initWithConfidence:boundingBox:", v3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  return v4;
}

- (id)truthReportFromLegacyDetectionFormat:(id)a3
{
  id v4;
  HMIVideoAnalyzerMutableReport *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  HMIVideoAnalyzerMutableReportSession *(*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  HMIVideoAnalyzerMutableReport *v16;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerMutableReport initWithName:]([HMIVideoAnalyzerMutableReport alloc], "initWithName:", CFSTR("Truth"));
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __70__HMIVideoAnalyzerMutableReport_truthReportFromLegacyDetectionFormat___block_invoke;
  v14 = &unk_24DBEAE68;
  v15 = v4;
  v16 = self;
  v7 = v4;
  objc_msgSend(v6, "na_dictionaryByMappingValues:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIVideoAnalyzerMutableReport sessions](v5, "sessions", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);

  return v5;
}

HMIVideoAnalyzerMutableReportSession *__70__HMIVideoAnalyzerMutableReport_truthReportFromLegacyDetectionFormat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMIVideoAnnotationParser *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  HMIVideoFrame *v20;
  void *v21;
  void *v22;
  HMIVideoAnalyzerFrameResult *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  HMIVideoAnalyzerFragmentResult *v27;
  void *v28;
  void *v29;
  void *v30;
  HMIVideoAnalyzerFragmentResult *v31;
  HMIVideoAnalyzerMutableReportSession *v32;
  void *v33;
  HMIVideoAnalyzerMutableReportSession *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v44 = v5;
    v42 = v9;
    v10 = -[HMIVideoAnnotationParser initWithArray:]([HMIVideoAnnotationParser alloc], "initWithArray:", v9);
    v43 = v6;
    objc_msgSend(v6, "fragments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v12;
    objc_msgSend(v12, "frameResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "count");
    v15 = 0;
    v16 = *MEMORY[0x24BDBF148];
    v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
    do
    {
      if (v15 >= objc_msgSend(v13, "count"))
      {
        v20 = [HMIVideoFrame alloc];
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          -[HMIVideoAnnotationParser lastKnownTimeStamp](v10, "lastKnownTimeStamp");
        else
          memset(v46, 0, sizeof(v46));
        v19 = -[HMIVideoFrame initWithJPEGData:size:presentationTimeStamp:](v20, "initWithJPEGData:size:presentationTimeStamp:", v18, v46, v16, v17);
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frame");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v21 = (void *)v19;

      if (v21)
        objc_msgSend(v21, "presentationTimeStamp");
      else
        memset(v45, 0, sizeof(v45));
      -[HMIVideoAnnotationParser eventsForTimeStamp:](v10, "eventsForTimeStamp:", v45);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:]([HMIVideoAnalyzerFrameResult alloc], "initWithFrame:events:regionOfInterest:", v21, v22, 0.0, 0.0, 1.0, 1.0);
      objc_msgSend(v14, "addObject:", v23);

      ++v15;
      v24 = objc_msgSend(v13, "count");
      if (v24 <= 1)
        v25 = 1;
      else
        v25 = v24;
    }
    while (v15 < v25);
    -[HMIVideoAnnotationParser eventsForFragment](v10, "eventsForFragment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = [HMIVideoAnalyzerFragmentResult alloc];
    objc_msgSend(v41, "fragment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "outcome");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMIVideoAnalyzerFragmentResult initWithFragment:events:frameResults:thumbnails:configuration:outcome:](v27, "initWithFragment:events:frameResults:thumbnails:configuration:outcome:", v28, v26, v14, MEMORY[0x24BDBD1A8], v29, v30);

    v32 = [HMIVideoAnalyzerMutableReportSession alloc];
    v6 = v43;
    objc_msgSend(v43, "source");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HMIVideoAnalyzerMutableReportSession initWithSource:](v32, "initWithSource:", v33);

    -[HMIVideoAnalyzerMutableReportSession appendFragmentResult:redactFrames:](v34, "appendFragmentResult:redactFrames:", v31, 1);
    v5 = v44;
    v9 = v42;
  }
  else
  {
    v35 = (void *)MEMORY[0x220735570]();
    v36 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "source");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v38;
      v49 = 2112;
      v50 = v39;
      _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot find ground truth for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v34 = 0;
  }

  return v34;
}

- (id)compareWithClassificationTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMIVideoAnalyzerMutableReportComparison *v17;
  void *v18;
  void *v19;
  void *v20;
  HMIVideoAnalyzerMutableReportComparison *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  Class v31;
  float v32;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __95__HMIVideoAnalyzerMutableReport_compareWithClassificationTruth_eventClass_confidenceThreshold___block_invoke;
  v26 = &unk_24DBEAE90;
  v30 = v10;
  v31 = a4;
  v32 = a5;
  v27 = v8;
  v28 = v9;
  v29 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v12, "na_each:", &v23);

  v17 = [HMIVideoAnalyzerMutableReportComparison alloc];
  v18 = (void *)objc_msgSend(v15, "copy", v23, v24, v25, v26);
  v19 = (void *)objc_msgSend(v14, "copy");
  v20 = (void *)objc_msgSend(v13, "copy");
  v21 = -[HMIVideoAnalyzerMutableReportComparison initWithTruePositiveKeys:falseNegativeKeys:falsePositiveKeys:groupByKey:](v17, "initWithTruePositiveKeys:falseNegativeKeys:falsePositiveKeys:groupByKey:", v18, v19, v20, 0);

  return v21;
}

void __95__HMIVideoAnalyzerMutableReport_compareWithClassificationTruth_eventClass_confidenceThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  HMIVideoAnalyzerReportRecord *v23;
  void *v24;
  void *v25;
  HMIVideoAnalyzerReportRecord *v26;
  void *v27;
  HMIVideoAnalyzerReportRecord *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  HMIVideoAnalyzerReportRecord *v35;
  void *v36;
  HMIVideoAnalyzerReportRecord *v37;
  void *v38;
  void *v39;
  HMIVideoAnalyzerReportRecord *v40;
  id v41;

  v41 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "sessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fragments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maxConfidenceEventForEventClass:", *(_QWORD *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "confidence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fragments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maxConfidenceEventForEventClass:", *(_QWORD *)(a1 + 64));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "confidence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "value");
  v18 = v17;
  v19 = *(float *)(a1 + 72);
  objc_msgSend(v16, "value");
  v21 = v20;
  if (v18 >= v19 && v20 > 0.0)
  {
    v22 = *(void **)(a1 + 40);
    v23 = [HMIVideoAnalyzerReportRecord alloc];
    v24 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v12, "value");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMIVideoAnalyzerReportRecord initWithKey:classificationScore:](v23, "initWithKey:classificationScore:", v41, v25);
    objc_msgSend(v22, "addObject:", v26);

  }
  if (v18 < v19 && v21 > 0.0)
  {
    v27 = *(void **)(a1 + 48);
    v28 = [HMIVideoAnalyzerReportRecord alloc];
    v29 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v11, "boundingBox");
    objc_msgSend(v29, "numberWithDouble:", HMICGRectArea(v30, v31, v32, v33));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[HMIVideoAnalyzerReportRecord initWithKey:classificationScore:](v28, "initWithKey:classificationScore:", v41, v34);
    objc_msgSend(v27, "addObject:", v35);

  }
  if (v18 >= v19 && v21 <= 0.0)
  {
    v36 = *(void **)(a1 + 56);
    v37 = [HMIVideoAnalyzerReportRecord alloc];
    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v12, "value");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[HMIVideoAnalyzerReportRecord initWithKey:classificationScore:](v37, "initWithKey:classificationScore:", v41, v39);
    objc_msgSend(v36, "addObject:", v40);

  }
}

- (id)compareWithDetectionTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5 iouThreshold:(float)a6 videoMetric:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMIVideoAnalyzerMutableReportComparison *v25;
  void *v26;
  void *v27;
  void *v28;
  HMIVideoAnalyzerMutableReportComparison *v29;
  id v31;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  Class v43;
  float v44;
  float v45;
  BOOL v46;

  v7 = a7;
  v11 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v12;
    v16 = v13;
    v17 = v14;
  }
  v18 = v17;
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_2;
  v34[3] = &unk_24DBEAFD0;
  v44 = a5;
  v45 = a6;
  v35 = v11;
  v36 = v15;
  v37 = v16;
  v38 = v18;
  v46 = v7;
  v39 = v12;
  v40 = v14;
  v42 = &__block_literal_global_207;
  v43 = a4;
  v41 = v13;
  v20 = v13;
  v21 = v14;
  v22 = v12;
  v33 = v18;
  v31 = v16;
  v23 = v15;
  v24 = v11;
  objc_msgSend(v19, "na_each:", v34);

  v25 = [HMIVideoAnalyzerMutableReportComparison alloc];
  v26 = (void *)objc_msgSend(v22, "copy");
  v27 = (void *)objc_msgSend(v21, "copy");
  v28 = (void *)objc_msgSend(v20, "copy");
  v29 = -[HMIVideoAnalyzerMutableReportComparison initWithTruePositiveKeys:falseNegativeKeys:falsePositiveKeys:groupByKey:](v25, "initWithTruePositiveKeys:falseNegativeKeys:falsePositiveKeys:groupByKey:", v26, v27, v28, v7);

  return v29;
}

BOOL __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6, void *a7)
{
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v8 = a7;
  objc_msgSend(a6, "boundingBox");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "boundingBox");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  return HMICGRectIntersectionOverUnionWithRespectToROI(v10, v12, v14, v16, v18, v20, v22, v24, a1, a2, a3, a4);
}

void __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMIVideoAnalyzerReportRecord *v28;
  HMIVideoAnalyzerReportRecord *v29;
  id v30[2];
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  uint64_t v40;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "sessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fragments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frameResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fragments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frameResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_3;
  v33[3] = &unk_24DBEAFA8;
  v17 = v15;
  v34 = v17;
  v40 = *(_QWORD *)(a1 + 104);
  *(_OWORD *)v30 = *(_OWORD *)(a1 + 88);
  v18 = v30[0];
  v39 = *(_OWORD *)v30;
  v35 = *(id *)(a1 + 40);
  v31 = v5;
  v36 = v31;
  v37 = *(id *)(a1 + 48);
  v38 = *(id *)(a1 + 56);
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v33);
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(v9, "fragments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "events");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = 3221225472;
    v32[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_9;
    v32[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
    v32[4] = *(_QWORD *)(a1 + 96);
    v22 = objc_msgSend(v21, "na_any:", v32);

    if (v22)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        v23 = *(void **)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 40), "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v24);

      }
      if (!objc_msgSend(*(id *)(a1 + 40), "count", v31) && objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        v25 = *(void **)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 56), "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

      }
      if (objc_msgSend(*(id *)(a1 + 40), "count") || objc_msgSend(*(id *)(a1 + 56), "count"))
        goto LABEL_14;
      v27 = *(void **)(a1 + 72);
      v28 = -[HMIVideoAnalyzerReportRecord initWithKey:detectionScores:frameResultIndex:]([HMIVideoAnalyzerReportRecord alloc], "initWithKey:detectionScores:frameResultIndex:", v31, &unk_24DC15170, 0);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", v31);
        objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
        objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
        goto LABEL_15;
      }
      v27 = *(void **)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 48), "firstObject");
      v28 = (HMIVideoAnalyzerReportRecord *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v28;
    objc_msgSend(v27, "addObject:", v28, v31);

    goto LABEL_14;
  }
LABEL_15:

}

void __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  HMIVideoAnalyzerReportRecord *v35;
  void *v36;
  HMIVideoAnalyzerReportRecord *v37;
  void *v38;
  HMIVideoAnalyzerReportRecord *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;

  v5 = a2;
  objc_msgSend(v5, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_flatMap:", &__block_literal_global_209);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_flatMap:", &__block_literal_global_210);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v5, "regionOfInterest");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  LODWORD(v24) = *(_DWORD *)(a1 + 88);
  LODWORD(v25) = *(_DWORD *)(a1 + 92);
  +[HMIVideoAnalyzerMutableReport greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:](HMIVideoAnalyzerMutableReport, "greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:", v8, v12, v13, v14, v15, *(_QWORD *)(a1 + 72), v17, v19, v21, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_6;
  v46[3] = &unk_24DBEAF58;
  v28 = v8;
  v47 = v28;
  v41 = v26;
  objc_msgSend(v26, "na_map:", v46);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v27;
  v44[1] = 3221225472;
  v44[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_7;
  v44[3] = &unk_24DBEAF80;
  v40 = v28;
  v45 = v40;
  objc_msgSend(v13, "na_map:", v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v27;
  v31 = a3;
  v42[1] = 3221225472;
  v42[2] = __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_8;
  v42[3] = &unk_24DBEAF80;
  v32 = v12;
  v43 = v32;
  objc_msgSend(v14, "na_map:", v42);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count"))
  {
    v34 = *(void **)(a1 + 40);
    v35 = -[HMIVideoAnalyzerReportRecord initWithKey:detectionScores:frameResultIndex:]([HMIVideoAnalyzerReportRecord alloc], "initWithKey:detectionScores:frameResultIndex:", *(_QWORD *)(a1 + 48), v29, v31);
    objc_msgSend(v34, "addObject:", v35);

  }
  if (objc_msgSend(v30, "count"))
  {
    v36 = *(void **)(a1 + 56);
    v37 = -[HMIVideoAnalyzerReportRecord initWithKey:detectionScores:frameResultIndex:]([HMIVideoAnalyzerReportRecord alloc], "initWithKey:detectionScores:frameResultIndex:", *(_QWORD *)(a1 + 48), v30, v31);
    objc_msgSend(v36, "addObject:", v37);

  }
  if (objc_msgSend(v33, "count"))
  {
    v38 = *(void **)(a1 + 64);
    v39 = -[HMIVideoAnalyzerReportRecord initWithKey:detectionScores:frameResultIndex:]([HMIVideoAnalyzerReportRecord alloc], "initWithKey:detectionScores:frameResultIndex:", *(_QWORD *)(a1 + 48), v33, v31);
    objc_msgSend(v38, "addObject:", v39);

  }
}

uint64_t __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allEvents");
}

uint64_t __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allEvents");
}

id __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  objc_msgSend(v2, "numberWithDouble:", HMICGRectArea(v4, v5, v6, v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __115__HMIVideoAnalyzerMutableReport_compareWithDetectionTruth_eventClass_confidenceThreshold_iouThreshold_videoMetric___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  double v6;

  v3 = a2;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "confidence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v4 = v6 > 0.0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)compareWithTrackingTruth:(id)a3 eventClass:(Class)a4 confidenceThreshold:(float)a5 ioaThreshold:(float)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMIVideoAnalyzerMutableReportComparison *v19;
  void *v20;
  void *v21;
  void *v22;
  HMIVideoAnalyzerMutableReportComparison *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  Class v31;
  float v32;
  float v33;

  v10 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_2;
  v25[3] = &unk_24DBEB040;
  v32 = a5;
  v33 = a6;
  v30 = &__block_literal_global_221;
  v31 = a4;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "na_each:", v25);

  v19 = [HMIVideoAnalyzerMutableReportComparison alloc];
  v20 = (void *)objc_msgSend(v17, "copy");
  v21 = (void *)objc_msgSend(v15, "copy");
  v22 = (void *)objc_msgSend(v16, "copy");
  v23 = -[HMIVideoAnalyzerMutableReportComparison initWithTruePositiveKeys:falseNegativeKeys:falsePositiveKeys:groupByKey:](v19, "initWithTruePositiveKeys:falseNegativeKeys:falsePositiveKeys:groupByKey:", v20, v21, v22, 0);

  return v23;
}

float __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6, void *a7)
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;

  v12 = a6;
  v13 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;
  v16 = v15;
  if (!v15)
    goto LABEL_10;
  objc_msgSend(v15, "torso");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v16, "face");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v16, "face");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend(v12, "boundingBox");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    objc_msgSend(v13, "boundingBox");
    HMICGRectIntersectionOverMinAreaWithRespectToROI(v36, v38, v40, v42, v43, v44, v45, v46, a1, a2, a3, a4);
    v34 = v47;
    goto LABEL_11;
  }
  objc_msgSend(v16, "torso");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v20 = v18;
  objc_msgSend(v18, "boundingBox");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v13, "boundingBox");
  HMICGRectIntersectionOverMinAreaWithRespectToROI(v22, v24, v26, v28, v29, v30, v31, v32, a1, a2, a3, a4);
  v34 = v33;

LABEL_11:
  return v34;
}

void __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMIVideoAnalyzerReportRecord *v33;
  void *v34;
  HMIVideoAnalyzerReportRecord *v35;
  void *v36;
  HMIVideoAnalyzerReportRecord *v37;
  void *v38;
  HMIVideoAnalyzerReportRecord *v39;
  void *v40;
  void *v41;
  HMIVideoAnalyzerReportRecord *v42;
  void *v43;
  HMIVideoAnalyzerReportRecord *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v6;
  objc_msgSend(v6, "fragments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v8;
  objc_msgSend(v8, "fragments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frameResults");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v14 = 0;
    v57 = (void *)MEMORY[0x24BDBD1B8];
    v50 = v11;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "events");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "events");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "regionOfInterest");
      +[HMIVideoAnalyzerMutableReport greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:](HMIVideoAnalyzerMutableReport, "greedyMatchBetweenPredictionEvents:truthEvents:falsePositiveIndices:falseNegativeIndices:eventClass:regionOfInterest:confidenceThreshold:scoreThreshold:scoreFunction:", v55, v19, v20, v21, v22, *(_QWORD *)(a1 + 64));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_3;
      v59[3] = &unk_24DBEB018;
      v54 = v55;
      v60 = v54;
      v53 = v19;
      v61 = v53;
      v26 = v25;
      v62 = v26;
      v56 = v24;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v59);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v26, "copy");
      +[HMIVideoAnalyzerMutableReport sihouetteScoreForMatches:previousMatches:truePositiveScores:falsePositiveScores:falseNegativeScores:](HMIVideoAnalyzerMutableReport, "sihouetteScoreForMatches:previousMatches:truePositiveScores:falsePositiveScores:falseNegativeScores:", v30, v57, v27, v28, v29);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObject:", v31);

      if (objc_msgSend(v27, "count"))
      {
        v32 = *(void **)(a1 + 40);
        v33 = [HMIVideoAnalyzerReportRecord alloc];
        v34 = (void *)objc_msgSend(v58, "copy");
        v35 = -[HMIVideoAnalyzerReportRecord initWithKey:trackingScores:frameResultIndices:](v33, "initWithKey:trackingScores:frameResultIndices:", v52, v27, v34);
        objc_msgSend(v32, "addObject:", v35);

      }
      if (objc_msgSend(v28, "count"))
      {
        v36 = *(void **)(a1 + 48);
        v37 = [HMIVideoAnalyzerReportRecord alloc];
        v38 = (void *)objc_msgSend(v58, "copy");
        v39 = -[HMIVideoAnalyzerReportRecord initWithKey:trackingScores:frameResultIndices:](v37, "initWithKey:trackingScores:frameResultIndices:", v52, v28, v38);
        objc_msgSend(v36, "addObject:", v39);

      }
      v40 = v58;
      if (objc_msgSend(v29, "count"))
      {
        v41 = *(void **)(a1 + 56);
        v42 = [HMIVideoAnalyzerReportRecord alloc];
        v43 = (void *)objc_msgSend(v58, "copy");
        v44 = -[HMIVideoAnalyzerReportRecord initWithKey:trackingScores:frameResultIndices:](v42, "initWithKey:trackingScores:frameResultIndices:", v52, v29, v43);
        objc_msgSend(v41, "addObject:", v44);

        v40 = v58;
      }
      if (objc_msgSend(v26, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v45;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setArray:", v46);

        v47 = objc_msgSend(v26, "copy");
        v57 = (void *)v47;
      }
      v11 = v50;

      ++v14;
    }
    while (v14 < objc_msgSend(v50, "count"));
  }
  else
  {
    v57 = (void *)MEMORY[0x24BDBD1B8];
  }

}

void __102__HMIVideoAnalyzerMutableReport_compareWithTrackingTruth_eventClass_confidenceThreshold_ioaThreshold___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v19 = v8;

  v9 = *(void **)(a1 + 40);
  v10 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v19)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    objc_msgSend(v19, "sessionEntityUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionEntityUUID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (!v18)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v19, v16);

  }
}

- (id)selectFramesWithRecord:(id)a3 truth:(id)a4 frameResults:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameResultIndices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v6, "frameResultIndices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke;
    v20[3] = &unk_24DBEB068;
    v21 = v8;
    objc_msgSend(v11, "na_each:", v20);

    v12 = v21;
  }
  else
  {
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(v8, "addObject:", &unk_24DC14690);
      goto LABEL_6;
    }
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke_2;
    v18 = &unk_24DBEB090;
    v19 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v15);
    v12 = v19;
  }

LABEL_6:
  v13 = (void *)objc_msgSend(v8, "copy", v15, v16, v17, v18);

  return v13;
}

uint64_t __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __75__HMIVideoAnalyzerMutableReport_selectFramesWithRecord_truth_frameResults___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (void)writeHTMLReportComparison:(id)a3 truth:(id)a4 eventClass:(Class)a5 comparisonType:(id)a6 assetPath:(id)a7 outputPath:(id)a8 limit:(unint64_t)a9 shuffle:(BOOL)a10
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMIHTMLReport *v33;
  void *v34;
  uint64_t v35;
  float v36;
  double v37;
  float v38;
  void *v39;
  HMIHTMLReport *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v46;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  HMIHTMLReport *v53;
  void *v54;
  _QWORD v55[3];
  _QWORD v56[5];

  v56[3] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v48 = a4;
  v15 = a6;
  v46 = a7;
  v49 = a8;
  v55[0] = CFSTR("TP");
  objc_msgSend(v14, "truePositiveKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v16;
  v55[1] = CFSTR("FP");
  objc_msgSend(v14, "falsePositiveKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v17;
  v55[2] = CFSTR("FN");
  objc_msgSend(v14, "falseNegativeKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "count");
  if (v21 >= a9)
    v22 = a9;
  else
    v22 = v21;
  if (a10)
  {
    v23 = (void *)objc_msgSend(v20, "mutableCopy");
    if (v22)
    {
      for (i = 0; i != v22; ++i)
        objc_msgSend(v23, "exchangeObjectAtIndex:withObjectAtIndex:", i, arc4random_uniform(objc_msgSend(v20, "count")));
    }
    objc_msgSend(v23, "subarrayWithRange:", 0, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v25, "copy");
  }
  else
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("score"), 0);
    v54 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingDescriptors:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "subarrayWithRange:", 0, v22);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = (void *)MEMORY[0x24BDD17C8];
  +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", a5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v15;
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@%@"), v28, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Object detection (%@)"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Visualize%@.html"), v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stringByAppendingPathComponent:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HMIHTMLReport initWithTitle:outputPath:]([HMIHTMLReport alloc], "initWithTitle:outputPath:", v30, v32);
  v34 = (void *)MEMORY[0x24BDD17C8];
  v35 = objc_msgSend(v20, "count");
  objc_msgSend(v14, "precision");
  v37 = v36;
  objc_msgSend(v14, "recall");
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%lu %@s (Precision: %.3f, Recall: %.3f)"), v35, v29, *(_QWORD *)&v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHTMLReport appendText:](v33, "appendText:", v39);

  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke;
  v50[3] = &unk_24DBEB130;
  v50[4] = self;
  v51 = v48;
  v52 = v46;
  v53 = v33;
  v40 = v33;
  v41 = v46;
  v42 = v48;
  objc_msgSend(v44, "na_each:", v50);

}

void __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke(uint64_t a1, void *a2)
{
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
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMIVideoFragment *v25;
  void *v26;
  HMIVideoFragment *v27;
  HMIVideoFrameGenerator *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fragments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v10, "sessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fragments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frameResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(*(id *)(a1 + 32), "selectFramesWithRecord:truth:frameResults:", v3, *(_QWORD *)(a1 + 40), v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v3;
  v18 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_2;
  v41[3] = &unk_24DBEB0B8;
  v19 = v9;
  v42 = v19;
  v20 = v16;
  v43 = v20;
  objc_msgSend(v17, "na_map:", v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(a1 + 48);
  objc_msgSend(v6, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingPathComponent:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [HMIVideoFragment alloc];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HMIVideoFragment initWithData:](v25, "initWithData:", v26);

  v28 = -[HMIVideoFrameGenerator initWithVideoFragment:]([HMIVideoFrameGenerator alloc], "initWithVideoFragment:", v27);
  v35[0] = v18;
  v35[1] = 3221225472;
  v35[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_3;
  v35[3] = &unk_24DBEB108;
  v36 = v17;
  v37 = v19;
  v38 = v6;
  v39 = v20;
  v40 = *(id *)(a1 + 56);
  v29 = v20;
  v30 = v6;
  v31 = v19;
  v32 = v17;
  v33 = (void *)MEMORY[0x220735744](v35);
  -[HMIVideoFrameGenerator generateVideoFramesForTimes:completionHandler:](v28, "generateVideoFramesForTimes:completionHandler:", v21, v33);

}

id __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (v4 < objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "presentationTimeStamp");
    else
      memset(v18, 0, sizeof(v18));
    v13 = v18;
LABEL_12:
    objc_msgSend(v5, "valueWithCMTime:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v9 = objc_msgSend(v3, "unsignedIntegerValue");
  v10 = objc_msgSend(*(id *)(a1 + 40), "count");
  v5 = (void *)MEMORY[0x24BDD1968];
  if (v9 < v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v11)
      objc_msgSend(v11, "presentationTimeStamp");
    else
      memset(v17, 0, sizeof(v17));
    v13 = v17;
    goto LABEL_12;
  }
  v15 = *MEMORY[0x24BDC0D88];
  v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v12;
}

void __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_3(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_4;
  v4[3] = &unk_24DBEB0E0;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a1[8];
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);

}

void __126__HMIVideoAnalyzerMutableReport_writeHTMLReportComparison_truth_eventClass_comparisonType_assetPath_outputPath_limit_shuffle___block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  HMIVideoAnalyzerFrameResult *v9;
  void *v10;
  void *v11;
  void *v12;
  HMIVideoAnalyzerFrameResult *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMTime time;

  v5 = a2;
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = objc_msgSend(a1[5], "count");
  v9 = [HMIVideoAnalyzerFrameResult alloc];
  if (v7 >= v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v9, "initWithFrame:events:regionOfInterest:", v5, v10, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  else
  {
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "events");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "regionOfInterest");
    v13 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v9, "initWithFrame:events:regionOfInterest:", v5, v11);

  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = objc_msgSend(a1[5], "count");
  objc_msgSend(a1[6], "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "presentationTimeStamp");
  else
    memset(&time, 0, sizeof(time));
  objc_msgSend(v14, "stringWithFormat:", CFSTR("[%lu/%lu] %@ (%.2fs)"), v7, v15, v16, CMTimeGetSeconds(&time));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 >= objc_msgSend(a1[7], "count"))
  {
    objc_msgSend(a1[8], "appendFrameResult:frameTruth:description:", v13, 0, v17);
  }
  else
  {
    objc_msgSend(a1[7], "objectAtIndexedSubscript:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "presentationTimeStamp");

    -[HMIVideoAnalyzerFrameResult frame](v13, "frame");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "presentationTimeStamp");

    objc_msgSend(a1[8], "appendFrameResult:frameTruth:description:", v13, v18, v17);
  }

}

- (void)writeImageCropForEventClass:(Class)a3 outputPath:(id)a4 assetPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  Class v16;

  v8 = a4;
  v9 = a5;
  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke;
  v13[3] = &unk_24DBEB2B0;
  v15 = v9;
  v16 = a3;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "na_each:", v13);

}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMIVideoFragment *v20;
  HMIVideoFrameGenerator *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(id *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fragments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_2;
  v30[3] = &unk_24DBEB1B8;
  v33 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v31 = v11;
  v12 = v6;
  v32 = v12;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v30);
  v23 = v10;
  v24 = 3221225472;
  v25 = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_7;
  v26 = &unk_24DBEB208;
  v13 = v4;
  v27 = v13;
  v14 = v12;
  v28 = v14;
  v29 = *(id *)(a1 + 32);
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x220735744](&v23);
  v16 = *(void **)(a1 + 40);
  if (v16)
  {
    objc_msgSend(v13, "source", v23, v24, v25, v26, v27, v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMIVideoFragment initWithData:]([HMIVideoFragment alloc], "initWithData:", v19);
    v21 = -[HMIVideoFrameGenerator initWithVideoFragment:]([HMIVideoFrameGenerator alloc], "initWithVideoFragment:", v20);
    objc_msgSend(v11, "na_map:", &__block_literal_global_259);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoFrameGenerator generateVideoFramesForTimes:completionHandler:](v21, "generateVideoFramesForTimes:completionHandler:", v22, v15);

  }
  else
  {
    objc_msgSend(v11, "na_map:", &__block_literal_global_261, v23, v24, v25, v26, v27, v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v18);
  }

}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v12 = a2;
  objc_msgSend(v12, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_3;
  v13[3] = &__block_descriptor_40_e40___NSArray_16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v13[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "na_flatMap:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == objc_opt_class())
  {
    objc_msgSend(v5, "na_filter:", &__block_literal_global_254);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 == objc_opt_class())
  {
    objc_msgSend(v5, "na_filter:", &__block_literal_global_256);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  if (objc_msgSend(v5, "count"))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v12, "frame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

id __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a2, "allEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_4;
  v6[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_4()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "faceRecognition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "torsoRecognition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_7(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_8;
  v4[3] = &unk_24DBEB1E0;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);

}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIVideoAnalyzerMutableReport writeImageCropFromFrame:events:outputPath:source:](HMIVideoAnalyzerMutableReport, "writeImageCropFromFrame:events:outputPath:source:", v6, v8, *(_QWORD *)(a1 + 48), v9);

}

id __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD v4[3];

  v2 = (void *)MEMORY[0x24BDD1968];
  if (a2)
    objc_msgSend(a2, "presentationTimeStamp");
  else
    memset(v4, 0, sizeof(v4));
  objc_msgSend(v2, "valueWithCMTime:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __82__HMIVideoAnalyzerMutableReport_writeImageCropForEventClass_outputPath_assetPath___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(a2, "pixelBufferFrameWithError:", &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)writeFragmentFileComparison:(id)a3 eventClass:(Class)a4 outputPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  Class v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v18[0] = CFSTR("TP");
  v9 = a3;
  objc_msgSend(v9, "truePositiveKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v18[1] = CFSTR("FP");
  objc_msgSend(v9, "falsePositiveKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  v18[2] = CFSTR("FN");
  objc_msgSend(v9, "falseNegativeKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke;
  v15[3] = &unk_24DBEB340;
  v16 = v8;
  v17 = a4;
  v15[4] = self;
  v14 = v8;
  objc_msgSend(v13, "na_each:", v15);

}

void __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];

  v5 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke_2;
  v17[3] = &unk_24DBEB2D8;
  v17[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "na_map:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_264);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Fragment%@%@.txt"), v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "writeToFile:atomically:encoding:error:", v15, 1, 4, &v16);

}

id __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __83__HMIVideoAnalyzerMutableReport_writeFragmentFileComparison_eventClass_outputPath___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (void)writeJSONChartData:(id)a3 outputPath:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__HMIVideoAnalyzerMutableReport_writeJSONChartData_outputPath___block_invoke;
  v17[3] = &unk_24DBEA200;
  v18 = v8;
  v9 = v8;
  objc_msgSend(v7, "na_each:", v17);

  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PRArray.json"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 1, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
  v15 = v12;
  objc_msgSend(v13, "writeToFile:atomically:encoding:error:", v10, 1, 4, &v15);
  v14 = v15;

}

void __63__HMIVideoAnalyzerMutableReport_writeJSONChartData_outputPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("class"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("precision"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recall"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("threshold"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v4);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = CFSTR("precision");
    v12[1] = CFSTR("recall");
    v13[0] = v5;
    v13[1] = v6;
    v12[2] = CFSTR("threshold");
    v13[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

+ (id)chartSpecWithRange:(CGRect)a3 colors:(id)a4 labels:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[2];
  const __CFString *v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[2];
  const __CFString *v63;
  void *v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[2];
  const __CFString *v76;
  void *v77;
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[2];
  const __CFString *v81;
  void *v82;
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[7];
  _QWORD v91[9];
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v91[7] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("domain"));
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __66__HMIVideoAnalyzerMutableReport_chartSpecWithRange_colors_labels___block_invoke;
    v55[3] = &unk_24DBEB368;
    v56 = v10;
    objc_msgSend(v14, "na_map:", v55);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("range"));

  }
  v54 = v10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "na_map:", &__block_literal_global_282);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@}[datum.label]"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("labelExpr"));

  }
  v90[0] = CFSTR("$schema");
  v90[1] = CFSTR("description");
  v91[0] = CFSTR("https://vega.github.io/schema/vega-lite/v4.json");
  v91[1] = CFSTR("PR Curves");
  v90[2] = CFSTR("width");
  v90[3] = CFSTR("height");
  v91[2] = CFSTR("container");
  v91[3] = CFSTR("container");
  v90[4] = CFSTR("data");
  v90[5] = CFSTR("config");
  v91[4] = &unk_24DC155B8;
  v91[5] = &unk_24DC15630;
  v90[6] = CFSTR("layer");
  v88[0] = &unk_24DC15658;
  v87[0] = CFSTR("mark");
  v87[1] = CFSTR("encoding");
  v85[0] = CFSTR("x");
  v53 = v11;
  v83[0] = CFSTR("field");
  v83[1] = CFSTR("type");
  v84[0] = CFSTR("recall");
  v84[1] = CFSTR("quantitative");
  v83[2] = CFSTR("scale");
  v81 = CFSTR("domain");
  v92.origin.x = x;
  v92.origin.y = y;
  v92.size.width = width;
  v92.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinX(v92));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v52;
  v93.origin.x = x;
  v93.origin.y = y;
  v93.size.width = width;
  v93.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxX(v93));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v50;
  v46 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v49;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v48;
  v85[1] = CFSTR("y");
  v78[0] = CFSTR("field");
  v78[1] = CFSTR("type");
  v79[0] = CFSTR("precision");
  v79[1] = CFSTR("quantitative");
  v78[2] = CFSTR("scale");
  v76 = CFSTR("domain");
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = width;
  v94.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinY(v94));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v47;
  v95.origin.x = x;
  v95.origin.y = y;
  v95.size.width = width;
  v95.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxY(v95));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v44;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v43;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v42;
  v85[2] = CFSTR("color");
  v73[0] = CFSTR("field");
  v73[1] = CFSTR("type");
  v74[0] = CFSTR("class");
  v74[1] = CFSTR("nominal");
  v73[2] = CFSTR("scale");
  v73[3] = CFSTR("legend");
  v74[2] = v12;
  v74[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v41;
  v85[3] = CFSTR("opacity");
  v71[0] = CFSTR("field");
  v71[1] = CFSTR("type");
  v72[0] = CFSTR("opacity");
  v72[1] = CFSTR("nominal");
  v71[2] = CFSTR("legend");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v39;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v37;
  v69[0] = CFSTR("mark");
  v69[1] = CFSTR("encoding");
  v70[0] = &unk_24DC15680;
  v68[0] = &unk_24DC156A8;
  v67[0] = CFSTR("text");
  v67[1] = CFSTR("x");
  v65[0] = CFSTR("field");
  v65[1] = CFSTR("type");
  v66[0] = CFSTR("recall");
  v66[1] = CFSTR("quantitative");
  v65[2] = CFSTR("scale");
  v63 = CFSTR("domain");
  v96.origin.x = x;
  v96.origin.y = y;
  v96.size.width = width;
  v96.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinX(v96));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v36;
  v97.origin.x = x;
  v97.origin.y = y;
  v97.size.width = width;
  v97.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxX(v97));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v32;
  v67[2] = CFSTR("y");
  v60[0] = CFSTR("field");
  v60[1] = CFSTR("type");
  v61[0] = CFSTR("precision");
  v61[1] = CFSTR("quantitative");
  v60[2] = CFSTR("scale");
  v58 = CFSTR("domain");
  v98.origin.x = x;
  v98.origin.y = y;
  v98.size.width = width;
  v98.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinY(v98));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v20;
  v99.origin.x = x;
  v99.origin.y = y;
  v99.size.width = width;
  v99.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxY(v99));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v28, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v29, 4);

  return v30;
}

uint64_t __66__HMIVideoAnalyzerMutableReport_chartSpecWithRange_colors_labels___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __66__HMIVideoAnalyzerMutableReport_chartSpecWithRange_colors_labels___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@': '%@'"), a2, a3);
}

+ (void)writeImageCropFromFrame:(id)a3 events:(id)a4 outputPath:(id)a5 source:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BDBCF48];
  v12 = a4;
  objc_msgSend(v11, "fileURLWithPath:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__HMIVideoAnalyzerMutableReport_writeImageCropFromFrame_events_outputPath_source___block_invoke;
  v17[3] = &unk_24DBEB3D0;
  v18 = v9;
  v19 = v10;
  v20 = v13;
  v14 = v13;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);

}

void __82__HMIVideoAnalyzerMutableReport_writeImageCropFromFrame_events_outputPath_source___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CVBuffer *v13;
  id v14;
  uint64_t v15;
  void *v16;
  double Size;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  Float64 v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  CMTime time;
  void *v43;
  void *v44;
  id v45;
  CGRect v46;
  CGRect v47;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7)
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
    objc_msgSend(v7, "roll");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v13 = +[HMIFaceprinter createFacePixelBufferForFaceEvent:pixelBuffer:roll:error:](HMIFaceprinter, "createFacePixelBufferForFaceEvent:pixelBuffer:roll:error:", v7, v11, v12, &v45);
    v14 = v45;

  }
  else
  {
    if (v10)
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
      v44 = 0;
      v13 = +[HMITorsoprinter createTorsoPixelBufferForTorsoEvent:pixelBuffer:error:](HMITorsoprinter, "createTorsoPixelBufferForTorsoEvent:pixelBuffer:error:", v10, v15, &v44);
      v16 = v44;
    }
    else
    {
      Size = HMICVPixelBufferGetSize((__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "pixelBuffer"));
      v19 = v18;
      objc_msgSend(v8, "boundingBox");
      HMICGRectPixelFromNormalized(v20, v21, v22, v23, Size, v19);
      v47 = CGRectIntegral(v46);
      x = v47.origin.x;
      y = v47.origin.y;
      width = v47.size.width;
      height = v47.size.height;
      v28 = objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
      v43 = 0;
      v13 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", v28, 1111970369, 8, &v43, x, y, width, height, width, height);
      v16 = v43;
    }
    v14 = v16;
  }
  v40 = v7;
  CVPixelBufferLockBaseAddress(v13, 1uLL);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:", v13);
  CVPixelBufferUnlockBaseAddress(v13, 1uLL);
  CVPixelBufferRelease(v13);
  v30 = *(void **)(a1 + 32);
  v31 = v10;
  if (v30)
    objc_msgSend(v30, "presentationTimeStamp");
  else
    memset(&time, 0, sizeof(time));
  v32 = CMTimeGetSeconds(&time) * 1000.0;
  +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%.0f_%@_%lu.png"), *(_QWORD *)(a1 + 40), *(_QWORD *)&v32, v33, a3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:relativeToURL:", v34, *(_QWORD *)(a1 + 48));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", MEMORY[0x24BDBD1B8]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x24BDBF868];
  v41 = v14;
  objc_msgSend(v37, "writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:", v29, v35, v38, objc_msgSend(v29, "colorSpace"), v36, &v41);
  v39 = v41;

}

+ (id)greedyMatchBetweenPredictionEvents:(id)a3 truthEvents:(id)a4 falsePositiveIndices:(id)a5 falseNegativeIndices:(id)a6 eventClass:(Class)a7 regionOfInterest:(CGRect)a8 confidenceThreshold:(float)a9 scoreThreshold:(float)a10 scoreFunction:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  float v58;
  _QWORD v59[4];
  id v60;
  Class v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  _QWORD v66[4];
  id v67;
  Class v68;
  float v69;
  _QWORD v70[3];

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v70[1] = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a11;
  v27 = MEMORY[0x24BDAC760];
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke;
  v66[3] = &unk_24DBEB3F8;
  v68 = a7;
  v69 = a9;
  v28 = v24;
  v67 = v28;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v66);
  v59[0] = v27;
  v59[1] = 3221225472;
  v59[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_2;
  v59[3] = &unk_24DBEB420;
  v61 = a7;
  v62 = x;
  v63 = y;
  v64 = width;
  v65 = height;
  v29 = v25;
  v60 = v29;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v59);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v27;
  v48[1] = 3221225472;
  v48[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_3;
  v48[3] = &unk_24DBEB470;
  v31 = v29;
  v52 = v30;
  v53 = v26;
  v49 = v31;
  v50 = v22;
  v54 = x;
  v55 = y;
  v56 = width;
  v57 = height;
  v58 = a10;
  v51 = v23;
  v32 = v30;
  v33 = v23;
  v34 = v22;
  v35 = v26;
  objc_msgSend(v28, "na_each:", v48);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("score"), 0);
  v70[0] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortedArrayUsingDescriptors:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v44[0] = v27;
  v44[1] = 3221225472;
  v44[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_5;
  v44[3] = &unk_24DBEB498;
  v45 = v31;
  v46 = v28;
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v39 = v47;
  v40 = v28;
  v41 = v31;
  objc_msgSend(v38, "na_each:", v44);
  v42 = (void *)objc_msgSend(v39, "copy");

  return v42;
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "confidence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v7 = v6;
    v8 = *(float *)(a1 + 48);

    if (v7 >= v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;

  v11 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "boundingBox");
    v12.origin.x = v5;
    v12.origin.y = v6;
    v12.size.width = v7;
    v12.size.height = v8;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v12))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  int v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_4;
  v6[3] = &unk_24DBEB448;
  v11 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 88);
  v14 = *(_DWORD *)(a1 + 104);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  objc_msgSend(v4, "na_each:", v6);

}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  HMIVideoAnalyzerReportMatch *v8;
  double v9;
  HMIVideoAnalyzerReportMatch *v10;
  id v11;

  v11 = a2;
  v3 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(float (**)(uint64_t, void *, void *, double, double, double, double))(v3 + 16))(v3, v4, v5, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

  if (v6 > *(float *)(a1 + 104))
  {
    v7 = *(void **)(a1 + 56);
    v8 = [HMIVideoAnalyzerReportMatch alloc];
    *(float *)&v9 = v6;
    v10 = -[HMIVideoAnalyzerReportMatch initWithTruth:prediction:score:](v8, "initWithTruth:prediction:score:", v11, *(_QWORD *)(a1 + 40), v9);
    objc_msgSend(v7, "addObject:", v10);

  }
}

void __199__HMIVideoAnalyzerMutableReport_greedyMatchBetweenPredictionEvents_truthEvents_falsePositiveIndices_falseNegativeIndices_eventClass_regionOfInterest_confidenceThreshold_scoreThreshold_scoreFunction___block_invoke_5(_QWORD *a1, void *a2)
{
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
  id v15;

  v3 = a2;
  v4 = (void *)a1[4];
  v15 = v3;
  objc_msgSend(v3, "truth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsObject:", v5))
    goto LABEL_4;
  v6 = (void *)a1[5];
  objc_msgSend(v15, "prediction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  v8 = v15;
  if ((_DWORD)v6)
  {
    v9 = (void *)a1[4];
    objc_msgSend(v15, "truth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v10);

    v11 = (void *)a1[5];
    objc_msgSend(v15, "prediction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);

    objc_msgSend(v15, "truth");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)a1[6];
    objc_msgSend(v15, "prediction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, v14);

LABEL_4:
    v8 = v15;
  }

}

+ (void)sihouetteScoreForMatches:(id)a3 previousMatches:(id)a4 truePositiveScores:(id)a5 falsePositiveScores:(id)a6 falseNegativeScores:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke;
  v19[3] = &unk_24DBEB4E8;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v19);

}

void __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke_2;
  v10[3] = &unk_24DBEB4C0;
  v11 = v6;
  v12 = v5;
  v7 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __133__HMIVideoAnalyzerMutableReport_sihouetteScoreForMatches_previousMatches_truePositiveScores_falsePositiveScores_falseNegativeScores___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  float v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "boundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "boundingBox");
  v20 = (HMICGRectGeneralizedIntersectionOverUnion(v9, v11, v13, v15, v16, v17, v18, v19) + 1.0) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "sessionEntityUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionEntityUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(id *)(a1 + 40);
  if (v21 == v22 && v23 == v7)
  {
    v25 = *(void **)(a1 + 48);
    *(float *)&v24 = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);

  }
  if (v21 == v22 && v23 != v7)
  {
    v27 = *(void **)(a1 + 56);
    *(float *)&v24 = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

  }
  if (v21 != v22 && v23 == v7)
  {
    v29 = *(void **)(a1 + 64);
    *(float *)&v24 = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[HMIVideoAnalyzerMutableReport name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[HMIVideoAnalyzerMutableReport version](self, "version");
  NSStringFromSelector(sel_version);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  -[HMIVideoAnalyzerMutableReport deviceInformation](self, "deviceInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceInformation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[HMIVideoAnalyzerMutableReport sessions](self, "sessions");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v13, "copy");
  NSStringFromSelector(sel_sessions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

}

- (HMIVideoAnalyzerMutableReport)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
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
  void *v17;
  HMIVideoAnalyzerMutableReport *v18;
  HMIVideoAnalyzerMutableReport *v19;
  uint64_t v20;
  NSMutableDictionary *sessions;
  uint64_t v23;
  objc_super v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v3, "decodeIntegerForKey:", v7);

  v8 = (void *)MEMORY[0x24BDBCF20];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceInformation);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessions);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v25.receiver = self;
  v25.super_class = (Class)HMIVideoAnalyzerMutableReport;
  v18 = -[HMIVideoAnalyzerMutableReport init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, v6);
    v19->_version = v23;
    objc_storeStrong((id *)&v19->_deviceInformation, v12);
    v20 = objc_msgSend(v17, "mutableCopy");
    sessions = v19->_sessions;
    v19->_sessions = (NSMutableDictionary *)v20;

  }
  return v19;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)version
{
  return self->_version;
}

- (NSDictionary)deviceInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)sessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
