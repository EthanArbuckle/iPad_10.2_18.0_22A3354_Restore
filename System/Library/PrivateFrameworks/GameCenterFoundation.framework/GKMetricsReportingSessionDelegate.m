@implementation GKMetricsReportingSessionDelegate

- (GKMetricsReportingSessionDelegate)initWithReporter:(id)a3
{
  GKMetricsReportingSessionDelegate *result;

  MetricsReportingSessionDelegate.init(reporter:)((uint64_t)a3);
  return result;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKMetricsReportingSessionDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  MetricsReportingSessionDelegate.urlSession(_:task:didFinishCollecting:)((NSURLSession)v11, (NSURLSessionTask)v9, (NSURLSessionTaskMetrics)v10);

}

- (GKMetricsReportingSessionDelegate)init
{
  MetricsReportingSessionDelegate.init()();
}

- (void).cxx_destruct
{

}

@end
