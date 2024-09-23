@implementation AnalyticsReportOutlet

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  +[AnalyticsAgent sharedInstance](AnalyticsAgent, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postDiagnosticIncidentReportForCase:", v4);

  return 1;
}

@end
