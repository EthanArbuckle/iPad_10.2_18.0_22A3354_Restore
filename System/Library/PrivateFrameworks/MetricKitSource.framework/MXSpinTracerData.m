@implementation MXSpinTracerData

- (id)initPayloadDataWithDiagnostics:(id)a3
{
  id v4;
  MXSpinTracerData *v5;
  uint64_t v6;
  MXCPUExceptionDiagnostic *cpuExceptionDiagnostic;
  uint64_t v8;
  MXDiskWriteExceptionDiagnostic *diskWriteExceptionDiagnostic;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXSpinTracerData;
  v5 = -[MXSourceData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuExceptionDiagnostics"));
    v6 = objc_claimAutoreleasedReturnValue();
    cpuExceptionDiagnostic = v5->_cpuExceptionDiagnostic;
    v5->_cpuExceptionDiagnostic = (MXCPUExceptionDiagnostic *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("diskWriteExceptionDiagnostics"));
    v8 = objc_claimAutoreleasedReturnValue();
    diskWriteExceptionDiagnostic = v5->_diskWriteExceptionDiagnostic;
    v5->_diskWriteExceptionDiagnostic = (MXDiskWriteExceptionDiagnostic *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXCPUExceptionDiagnostic *cpuExceptionDiagnostic;
  id v5;

  cpuExceptionDiagnostic = self->_cpuExceptionDiagnostic;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cpuExceptionDiagnostic, CFSTR("cpuExceptionDiagnostics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diskWriteExceptionDiagnostic, CFSTR("diskWriteExceptionDiagnostics"));

}

- (MXSpinTracerData)initWithCoder:(id)a3
{
  id v4;
  MXSpinTracerData *v5;
  uint64_t v6;
  MXCPUExceptionDiagnostic *cpuExceptionDiagnostic;
  uint64_t v8;
  MXDiskWriteExceptionDiagnostic *diskWriteExceptionDiagnostic;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXSpinTracerData;
  v5 = -[MXSourceData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpuExceptionDiagnostics"));
    v6 = objc_claimAutoreleasedReturnValue();
    cpuExceptionDiagnostic = v5->_cpuExceptionDiagnostic;
    v5->_cpuExceptionDiagnostic = (MXCPUExceptionDiagnostic *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diskWriteExceptionDiagnostics"));
    v8 = objc_claimAutoreleasedReturnValue();
    diskWriteExceptionDiagnostic = v5->_diskWriteExceptionDiagnostic;
    v5->_diskWriteExceptionDiagnostic = (MXDiskWriteExceptionDiagnostic *)v8;

  }
  return v5;
}

- (MXCPUExceptionDiagnostic)cpuExceptionDiagnostic
{
  return (MXCPUExceptionDiagnostic *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCpuExceptionDiagnostic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXDiskWriteExceptionDiagnostic)diskWriteExceptionDiagnostic
{
  return (MXDiskWriteExceptionDiagnostic *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDiskWriteExceptionDiagnostic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskWriteExceptionDiagnostic, 0);
  objc_storeStrong((id *)&self->_cpuExceptionDiagnostic, 0);
}

@end
