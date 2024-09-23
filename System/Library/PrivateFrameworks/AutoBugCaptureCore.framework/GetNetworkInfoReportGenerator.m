@implementation GetNetworkInfoReportGenerator

- (GetNetworkInfoReportGenerator)initWithQueue:(id)a3
{
  GetNetworkInfoReportGenerator *v3;
  GetNetworkInfoReportGenerator *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GetNetworkInfoReportGenerator;
  v3 = -[NetworkDiagnosticsReportGenerator initWithQueue:](&v7, sel_initWithQueue_, a3);
  v4 = v3;
  if (v3)
  {
    -[NetworkDiagnosticsReportGenerator createDefaultTaskDictionaryWithTaskName:](v3, "createDefaultTaskDictionaryWithTaskName:", kNetDiagTaskGetNetworkInfo[0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkDiagnosticsReportGenerator setOptions:](v4, "setOptions:", v5);
    -[GetNetworkInfoReportGenerator setDefaults](v4, "setDefaults");

  }
  return v4;
}

- (void)setDefaults
{
  void *v3;
  void *v4;

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GetNetworkInfoReportGenerator setGNISensitiveOption:](self, "setGNISensitiveOption:", objc_msgSend(v4, "autoBugCaptureSensitivePayloads"));

  -[GetNetworkInfoReportGenerator setGNISysConfigOption:](self, "setGNISysConfigOption:", 1);
  -[GetNetworkInfoReportGenerator setGNINDFInfoOption:](self, "setGNINDFInfoOption:", 1);
}

- (void)setGNISensitiveOption:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("taskGNISensitive"));

}

- (void)setGNISysConfigOption:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("taskGNISysConfig"));

}

- (void)setGNINDFInfoOption:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("taskGNINDFInfo"));

}

@end
