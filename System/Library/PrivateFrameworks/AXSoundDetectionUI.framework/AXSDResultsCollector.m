@implementation AXSDResultsCollector

- (AXSDResultsCollector)init
{
  AXSDResultsCollector *v2;
  NSMutableArray *v3;
  NSMutableArray *results;
  NSError *error;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSDResultsCollector;
  v2 = -[AXSDResultsCollector init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    results = v2->_results;
    v2->_results = v3;

    v2->_didFinish = 0;
    error = v2->_error;
    v2->_error = 0;

  }
  return v2;
}

- (NSArray)results
{
  return (NSArray *)self->_results;
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (NSError)error
{
  return self->_error;
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v5;
  AXSDDetectionResult *v6;

  v5 = a3;
  v6 = -[AXSDDetectionResult initWithResult:]([AXSDDetectionResult alloc], "initWithResult:", v5);

  -[NSMutableArray addObject:](self->_results, "addObject:", v6);
}

- (void)receivedCompletion:(id)a3
{
  self->_didFinish = 1;
}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  self->_didFinish = 1;
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
