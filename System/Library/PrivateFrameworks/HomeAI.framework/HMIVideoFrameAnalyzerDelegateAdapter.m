@implementation HMIVideoFrameAnalyzerDelegateAdapter

- (void)frameAnalyzer:(id)a3 didAnalyzeFrame:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoFrameAnalyzerDelegateAdapter frameAnalyzerDidAnalyzeFrame](self, "frameAnalyzerDidAnalyzeFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoFrameAnalyzerDelegateAdapter frameAnalyzerDidAnalyzeFrame](self, "frameAnalyzerDidAnalyzeFrame");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)frameAnalyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoFrameAnalyzerDelegateAdapter frameAnalyzerDidProduceAnalysisStateUpdate](self, "frameAnalyzerDidProduceAnalysisStateUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoFrameAnalyzerDelegateAdapter frameAnalyzerDidProduceAnalysisStateUpdate](self, "frameAnalyzerDidProduceAnalysisStateUpdate");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (id)frameAnalyzerDidAnalyzeFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameAnalyzerDidAnalyzeFrame:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)frameAnalyzerDidProduceAnalysisStateUpdate
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameAnalyzerDidProduceAnalysisStateUpdate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameAnalyzerDidProduceAnalysisStateUpdate, 0);
  objc_storeStrong(&self->_frameAnalyzerDidAnalyzeFrame, 0);
}

@end
