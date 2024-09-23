@implementation HMIVideoAnalyzerProcessingNode

- (HMIVideoAnalyzerProcessingNode)initWithConfiguration:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  HMIVideoAnalyzerProcessingNode *v9;
  HMIVideoAnalyzerProcessingNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoAnalyzerProcessingNode;
  v9 = -[HMIVideoAnalyzerProcessingNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (HMIVideoAnalyzerDynamicConfiguration)dynamicConfiguration
{
  return (HMIVideoAnalyzerDynamicConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDynamicConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
