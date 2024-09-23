@implementation MXReportCrashData

- (id)initPayloadDataWithDiagnostics:(id)a3
{
  id v4;
  MXReportCrashData *v5;
  uint64_t v6;
  MXCrashDiagnostic *crashDiagnostic;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXReportCrashData;
  v5 = -[MXSourceData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crashDiagnostic"));
    v6 = objc_claimAutoreleasedReturnValue();
    crashDiagnostic = v5->_crashDiagnostic;
    v5->_crashDiagnostic = (MXCrashDiagnostic *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_crashDiagnostic, CFSTR("crashDiagnostic"));
}

- (MXReportCrashData)initWithCoder:(id)a3
{
  id v4;
  MXReportCrashData *v5;
  uint64_t v6;
  MXCrashDiagnostic *crashDiagnostic;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXReportCrashData;
  v5 = -[MXSourceData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crashDiagnostic"));
    v6 = objc_claimAutoreleasedReturnValue();
    crashDiagnostic = v5->_crashDiagnostic;
    v5->_crashDiagnostic = (MXCrashDiagnostic *)v6;

  }
  return v5;
}

- (MXCrashDiagnostic)crashDiagnostic
{
  return (MXCrashDiagnostic *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCrashDiagnostic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crashDiagnostic, 0);
}

@end
