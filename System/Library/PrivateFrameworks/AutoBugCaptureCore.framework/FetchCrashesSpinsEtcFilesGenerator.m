@implementation FetchCrashesSpinsEtcFilesGenerator

- (FetchCrashesSpinsEtcFilesGenerator)initWithQueue:(id)a3
{
  FetchCrashesSpinsEtcFilesGenerator *v3;
  FetchCrashesSpinsEtcFilesGenerator *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FetchCrashesSpinsEtcFilesGenerator;
  v3 = -[NetworkDiagnosticsReportGenerator initWithQueue:](&v7, sel_initWithQueue_, a3);
  v4 = v3;
  if (v3)
  {
    -[NetworkDiagnosticsReportGenerator createDefaultTaskDictionaryWithTaskName:](v3, "createDefaultTaskDictionaryWithTaskName:", kNetDiagTaskFetchCrashesSpinsEtc[0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA3CFD08, CFSTR("taskFileAge"));
    -[NetworkDiagnosticsReportGenerator setOptions:](v4, "setOptions:", v5);

  }
  return v4;
}

@end
