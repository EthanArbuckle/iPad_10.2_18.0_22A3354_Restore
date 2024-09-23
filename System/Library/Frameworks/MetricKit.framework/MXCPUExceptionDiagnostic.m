@implementation MXCPUExceptionDiagnostic

- (MXCPUExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 totalCpuTime:(id)a8 totalSampledTime:(id)a9
{
  uint64_t v11;
  id v16;
  id v17;
  MXCPUExceptionDiagnostic *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  MXCPUExceptionDiagnostic *v23;
  id v25;
  objc_super v26;

  v11 = *(_QWORD *)&a6;
  v16 = a7;
  v25 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MXCPUExceptionDiagnostic;
  v18 = -[MXDiagnostic initWithMetaData:applicationVersion:signpostData:andPID:](&v26, sel_initWithMetaData_applicationVersion_signpostData_andPID_, a3, a4, a5, v11);
  if (v18)
  {
    if (!v16)
    {
      v23 = 0;
      goto LABEL_8;
    }
    v19 = v25;
    objc_msgSend(v25, "doubleValue");
    if (v20 <= 0.0)
    {
      v23 = 0;
      v21 = v17;
      goto LABEL_11;
    }
    v21 = v17;
    objc_msgSend(v17, "doubleValue");
    if (v22 <= 0.0)
    {
      v23 = 0;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v18->_callStackTree, a7);
    objc_storeStrong((id *)&v18->_totalCPUTime, a8);
    objc_storeStrong((id *)&v18->_totalSampledTime, a9);
  }
  v23 = v18;
LABEL_8:
  v21 = v17;
  v19 = v25;
LABEL_11:

  return v23;
}

- (MXCPUExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 totalCpuTime:(id)a6 totalSampledTime:(id)a7
{
  id v13;
  id v14;
  id v15;
  MXCPUExceptionDiagnostic *v16;
  double v17;
  double v18;
  MXCPUExceptionDiagnostic *v19;
  objc_super v21;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MXCPUExceptionDiagnostic;
  v16 = -[MXDiagnostic initWithMetaData:applicationVersion:](&v21, sel_initWithMetaData_applicationVersion_, a3, a4);
  if (v16)
  {
    if (!v13 || (objc_msgSend(v14, "doubleValue"), v17 <= 0.0) || (objc_msgSend(v15, "doubleValue"), v18 <= 0.0))
    {
      v19 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v16->_callStackTree, a5);
    objc_storeStrong((id *)&v16->_totalCPUTime, a6);
    objc_storeStrong((id *)&v16->_totalSampledTime, a7);
  }
  v19 = v16;
LABEL_8:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXCPUExceptionDiagnostic;
  v4 = a3;
  -[MXDiagnostic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalCPUTime, CFSTR("totalCPUTime"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, CFSTR("callStackTree"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalSampledTime, CFSTR("totalSampledTime"));

}

- (MXCPUExceptionDiagnostic)initWithCoder:(id)a3
{
  id v4;
  MXCPUExceptionDiagnostic *v5;
  uint64_t v6;
  NSMeasurement *totalCPUTime;
  uint64_t v8;
  MXCallStackTree *callStackTree;
  uint64_t v10;
  NSMeasurement *totalSampledTime;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXCPUExceptionDiagnostic;
  v5 = -[MXDiagnostic initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalCPUTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalCPUTime = v5->_totalCPUTime;
    v5->_totalCPUTime = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callStackTree"));
    v8 = objc_claimAutoreleasedReturnValue();
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalSampledTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    totalSampledTime = v5->_totalSampledTime;
    v5->_totalSampledTime = (NSMeasurement *)v10;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  MXCallStackTree *callStackTree;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15.receiver = self;
  v15.super_class = (Class)MXCPUExceptionDiagnostic;
  -[MXDiagnostic toDictionary](&v15, sel_toDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  callStackTree = self->_callStackTree;
  if (callStackTree)
  {
    -[MXCallStackTree toDictionary](callStackTree, "toDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("callStackTree"));

  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("diagnosticMetaData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  if (self->_totalCPUTime)
  {
    -[MXDiagnostic measurementFormatter](self, "measurementFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromMeasurement:", self->_totalCPUTime);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("totalCPUTime"));

  }
  if (self->_totalSampledTime)
  {
    -[MXDiagnostic measurementFormatter](self, "measurementFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromMeasurement:", self->_totalSampledTime);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("totalSampledTime"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v13 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("diagnosticMetaData"));

  }
  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)totalCPUTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (NSMeasurement)totalSampledTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalSampledTime, 0);
  objc_storeStrong((id *)&self->_totalCPUTime, 0);
  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
