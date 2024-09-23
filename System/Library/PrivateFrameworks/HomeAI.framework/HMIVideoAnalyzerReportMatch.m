@implementation HMIVideoAnalyzerReportMatch

- (HMIVideoAnalyzerReportMatch)initWithTruth:(id)a3 prediction:(id)a4 score:(float)a5
{
  id v9;
  id v10;
  HMIVideoAnalyzerReportMatch *v11;
  HMIVideoAnalyzerReportMatch *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnalyzerReportMatch;
  v11 = -[HMIVideoAnalyzerReportMatch init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_truth, a3);
    objc_storeStrong((id *)&v12->_prediction, a4);
    v12->_score = a5;
  }

  return v12;
}

- (NSNumber)truth
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)prediction
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_truth, 0);
}

@end
