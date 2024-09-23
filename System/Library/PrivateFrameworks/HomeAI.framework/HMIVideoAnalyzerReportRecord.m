@implementation HMIVideoAnalyzerReportRecord

- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 classificationScore:(id)a4
{
  id v7;
  id v8;
  HMIVideoAnalyzerReportRecord *v9;
  HMIVideoAnalyzerReportRecord *v10;
  float v11;
  NSArray *frameResultIndices;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnalyzerReportRecord;
  v9 = -[HMIVideoAnalyzerReportRecord init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    v10->_count = 1;
    objc_msgSend(v8, "floatValue");
    v10->_score = v11;
    frameResultIndices = v10->_frameResultIndices;
    v10->_frameResultIndices = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v10;
}

- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 detectionScores:(id)a4 frameResultIndex:(unint64_t)a5
{
  id v9;
  id v10;
  HMIVideoAnalyzerReportRecord *v11;
  HMIVideoAnalyzerReportRecord *v12;
  void *v13;
  float v14;
  void *v15;
  uint64_t v16;
  NSArray *frameResultIndices;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerReportRecord;
  v11 = -[HMIVideoAnalyzerReportRecord init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    v12->_count = objc_msgSend(v10, "count");
    objc_msgSend(v10, "valueForKeyPath:", CFSTR("@max.floatValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v12->_score = v14;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    frameResultIndices = v12->_frameResultIndices;
    v12->_frameResultIndices = (NSArray *)v16;

  }
  return v12;
}

- (HMIVideoAnalyzerReportRecord)initWithKey:(id)a3 trackingScores:(id)a4 frameResultIndices:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMIVideoAnalyzerReportRecord *v12;
  HMIVideoAnalyzerReportRecord *v13;
  void *v14;
  float v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIVideoAnalyzerReportRecord;
  v12 = -[HMIVideoAnalyzerReportRecord init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    v13->_count = objc_msgSend(v10, "count");
    objc_msgSend(v10, "valueForKeyPath:", CFSTR("@max.floatValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v13->_score = v15;

    objc_storeStrong((id *)&v13->_frameResultIndices, a5);
  }

  return v13;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (float)score
{
  return self->_score;
}

- (NSArray)frameResultIndices
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameResultIndices, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
