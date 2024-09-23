@implementation HMIVideoAnalyzerDelegateAdapter

- (void)analyzer:(id)a3 didAnalyzeFrameWithResult:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAnalyzerDelegateAdapter analyzerDidAnalyzeFrameWithResult](self, "analyzerDidAnalyzeFrameWithResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAnalyzerDelegateAdapter analyzerDidAnalyzeFrameWithResult](self, "analyzerDidAnalyzeFrameWithResult");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)analyzer:(id)a3 didAnalyzeFragmentWithResult:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAnalyzerDelegateAdapter analyzerDidAnalyzeFragmentWithResult](self, "analyzerDidAnalyzeFragmentWithResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAnalyzerDelegateAdapter analyzerDidAnalyzeFragmentWithResult](self, "analyzerDidAnalyzeFragmentWithResult");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)analyzer:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAnalyzerDelegateAdapter analyzerDidFailWithError](self, "analyzerDidFailWithError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAnalyzerDelegateAdapter analyzerDidFailWithError](self, "analyzerDidFailWithError");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)analyzer:(id)a3 didCreateTimelapseFragment:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAnalyzerDelegateAdapter analyzerDidCreateTimelapseFragment](self, "analyzerDidCreateTimelapseFragment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAnalyzerDelegateAdapter analyzerDidCreateTimelapseFragment](self, "analyzerDidCreateTimelapseFragment");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)analyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMIVideoAnalyzerDelegateAdapter analyzerDidProduceAnalysisStateUpdate](self, "analyzerDidProduceAnalysisStateUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMIVideoAnalyzerDelegateAdapter analyzerDidProduceAnalysisStateUpdate](self, "analyzerDidProduceAnalysisStateUpdate");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (id)analyzerDidAnalyzeFrameWithResult
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAnalyzerDidAnalyzeFrameWithResult:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)analyzerDidAnalyzeFragmentWithResult
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAnalyzerDidAnalyzeFragmentWithResult:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)analyzerDidFailWithError
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAnalyzerDidFailWithError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)analyzerDidCreateTimelapseFragment
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAnalyzerDidCreateTimelapseFragment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)analyzerDidProduceAnalysisStateUpdate
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setAnalyzerDidProduceAnalysisStateUpdate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyzerDidProduceAnalysisStateUpdate, 0);
  objc_storeStrong(&self->_analyzerDidCreateTimelapseFragment, 0);
  objc_storeStrong(&self->_analyzerDidFailWithError, 0);
  objc_storeStrong(&self->_analyzerDidAnalyzeFragmentWithResult, 0);
  objc_storeStrong(&self->_analyzerDidAnalyzeFrameWithResult, 0);
}

@end
