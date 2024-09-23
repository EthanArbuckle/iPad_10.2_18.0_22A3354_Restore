@implementation FetchLogArchivesReportGenerator

- (FetchLogArchivesReportGenerator)initWithQueue:(id)a3
{
  FetchLogArchivesReportGenerator *v3;
  FetchLogArchivesReportGenerator *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FetchLogArchivesReportGenerator;
  v3 = -[NetworkDiagnosticsReportGenerator initWithQueue:](&v7, sel_initWithQueue_, a3);
  v4 = v3;
  if (v3)
  {
    -[NetworkDiagnosticsReportGenerator createDefaultTaskDictionaryWithTaskName:](v3, "createDefaultTaskDictionaryWithTaskName:", kNetDiagTaskFetchLogArchive[0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkDiagnosticsReportGenerator setOptions:](v4, "setOptions:", v5);
    -[FetchLogArchivesReportGenerator setDefaults](v4, "setDefaults");

  }
  return v4;
}

- (void)setDefaults
{
  -[FetchLogArchivesReportGenerator setBaseDuration:maximumSize:](self, "setBaseDuration:maximumSize:", 900, 26214400);
  -[FetchLogArchivesReportGenerator setTTLDuration:maximumSize:](self, "setTTLDuration:maximumSize:", 900, 26214400);
  -[FetchLogArchivesReportGenerator setHighVolumeLoggersDuration:maximumSize:](self, "setHighVolumeLoggersDuration:maximumSize:", 900, 26214400);
}

- (void)setBaseDuration:(unint64_t)a3 maximumSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("taskArchiveBaseSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("taskArchiveBaseDuration"));

}

- (void)setTTLDuration:(unint64_t)a3 maximumSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("taskArchiveTTLSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("taskArchiveTTLDuration"));

}

- (void)setHighVolumeLoggersDuration:(unint64_t)a3 maximumSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("taskArchiveHVSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("taskArchiveHVDuration"));

}

@end
