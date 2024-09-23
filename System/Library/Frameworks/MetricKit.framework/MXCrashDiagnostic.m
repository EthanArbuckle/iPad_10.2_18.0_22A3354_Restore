@implementation MXCrashDiagnostic

- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 terminationReason:(id)a7 applicationSpecificInfo:(id)a8 virtualMemoryRegionInfo:(id)a9 exceptionType:(id)a10 exceptionCode:(id)a11 signal:(id)a12 stackTrace:(id)a13
{
  uint64_t v13;
  id v18;
  id v19;
  MXCrashDiagnostic *v20;
  id *p_isa;
  MXCrashDiagnostic *v22;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v13 = *(_QWORD *)&a6;
  v28 = a7;
  v27 = a9;
  v26 = a10;
  v25 = a11;
  v18 = a12;
  v19 = a13;
  v29.receiver = self;
  v29.super_class = (Class)MXCrashDiagnostic;
  v20 = -[MXDiagnostic initWithMetaData:applicationVersion:signpostData:andPID:](&v29, sel_initWithMetaData_applicationVersion_signpostData_andPID_, a3, a4, a5, v13);
  p_isa = (id *)&v20->super.super.isa;
  if (v20)
  {
    if (!v19)
    {
      v22 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v20->_terminationReason, a7);
    objc_storeStrong(p_isa + 8, a9);
    objc_storeStrong(p_isa + 9, a10);
    objc_storeStrong(p_isa + 10, a11);
    objc_storeStrong(p_isa + 11, a12);
    objc_storeStrong(p_isa + 6, a13);
  }
  v22 = p_isa;
LABEL_6:

  return v22;
}

- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 terminationReason:(id)a7 applicationSpecificInfo:(id)a8 virtualMemoryRegionInfo:(id)a9 exceptionType:(id)a10 exceptionCode:(id)a11 exceptionReason:(id)a12 signal:(id)a13 stackTrace:(id)a14
{
  id v18;
  MXCrashDiagnostic *v19;
  id *p_isa;
  MXCrashDiagnostic *v21;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a7;
  v29 = a9;
  v28 = a10;
  v27 = a11;
  v26 = a12;
  v25 = a13;
  v18 = a14;
  v31.receiver = self;
  v31.super_class = (Class)MXCrashDiagnostic;
  v19 = -[MXDiagnostic initWithMetaData:applicationVersion:signpostData:andPID:](&v31, sel_initWithMetaData_applicationVersion_signpostData_andPID_, a3, a4, a5, a6);
  p_isa = (id *)&v19->super.super.isa;
  if (v19)
  {
    if (!v18)
    {
      v21 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v19->_terminationReason, a7);
    objc_storeStrong(p_isa + 8, a9);
    objc_storeStrong(p_isa + 9, a10);
    objc_storeStrong(p_isa + 10, a11);
    objc_storeStrong(p_isa + 11, a13);
    objc_storeStrong(p_isa + 6, a14);
    objc_storeStrong(p_isa + 12, a12);
  }
  v21 = p_isa;
LABEL_6:

  return v21;
}

- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 terminationReason:(id)a5 applicationSpecificInfo:(id)a6 virtualMemoryRegionInfo:(id)a7 exceptionType:(id)a8 exceptionCode:(id)a9 signal:(id)a10 stackTrace:(id)a11
{
  id v17;
  MXCrashDiagnostic *v18;
  id *p_isa;
  MXCrashDiagnostic *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a5;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v17 = a11;
  v27.receiver = self;
  v27.super_class = (Class)MXCrashDiagnostic;
  v18 = -[MXDiagnostic initWithMetaData:applicationVersion:](&v27, sel_initWithMetaData_applicationVersion_, a3, a4);
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    if (!v17)
    {
      v20 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v18->_terminationReason, a5);
    objc_storeStrong(p_isa + 8, a7);
    objc_storeStrong(p_isa + 9, a8);
    objc_storeStrong(p_isa + 10, a9);
    objc_storeStrong(p_isa + 11, a10);
    objc_storeStrong(p_isa + 6, a11);
  }
  v20 = p_isa;
LABEL_6:

  return v20;
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
  v5.super_class = (Class)MXCrashDiagnostic;
  v4 = a3;
  -[MXDiagnostic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_terminationReason, CFSTR("terminationReason"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_virtualMemoryRegionInfo, CFSTR("virtualMemoryRegionInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_exceptionType, CFSTR("exceptionType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_exceptionCode, CFSTR("exceptionCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_exceptionReason, CFSTR("objectiveCexceptionReason"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_signal, CFSTR("signal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, CFSTR("callStackTree"));

}

- (MXCrashDiagnostic)initWithCoder:(id)a3
{
  id v4;
  MXCrashDiagnostic *v5;
  uint64_t v6;
  NSString *terminationReason;
  uint64_t v8;
  NSString *virtualMemoryRegionInfo;
  uint64_t v10;
  NSNumber *exceptionType;
  uint64_t v12;
  NSNumber *exceptionCode;
  uint64_t v14;
  MXCrashDiagnosticObjectiveCExceptionReason *exceptionReason;
  uint64_t v16;
  NSNumber *signal;
  uint64_t v18;
  MXCallStackTree *callStackTree;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MXCrashDiagnostic;
  v5 = -[MXDiagnostic initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("terminationReason"));
    v6 = objc_claimAutoreleasedReturnValue();
    terminationReason = v5->_terminationReason;
    v5->_terminationReason = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("virtualMemoryRegionInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    virtualMemoryRegionInfo = v5->_virtualMemoryRegionInfo;
    v5->_virtualMemoryRegionInfo = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exceptionType"));
    v10 = objc_claimAutoreleasedReturnValue();
    exceptionType = v5->_exceptionType;
    v5->_exceptionType = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exceptionCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    exceptionCode = v5->_exceptionCode;
    v5->_exceptionCode = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectiveCexceptionReason"));
    v14 = objc_claimAutoreleasedReturnValue();
    exceptionReason = v5->_exceptionReason;
    v5->_exceptionReason = (MXCrashDiagnosticObjectiveCExceptionReason *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signal"));
    v16 = objc_claimAutoreleasedReturnValue();
    signal = v5->_signal;
    v5->_signal = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callStackTree"));
    v18 = objc_claimAutoreleasedReturnValue();
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v18;

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
  NSString *terminationReason;
  NSString *virtualMemoryRegionInfo;
  NSNumber *exceptionType;
  NSNumber *exceptionCode;
  MXCrashDiagnosticObjectiveCExceptionReason *exceptionReason;
  void *v14;
  NSNumber *signal;
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18.receiver = self;
  v18.super_class = (Class)MXCrashDiagnostic;
  -[MXDiagnostic toDictionary](&v18, sel_toDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  callStackTree = self->_callStackTree;
  if (callStackTree)
  {
    -[MXCallStackTree toDictionary](callStackTree, "toDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("callStackTree"));

  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("diagnosticMetaData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  terminationReason = self->_terminationReason;
  if (terminationReason)
    objc_msgSend(v7, "setValue:forKey:", terminationReason, CFSTR("terminationReason"));
  virtualMemoryRegionInfo = self->_virtualMemoryRegionInfo;
  if (virtualMemoryRegionInfo)
    objc_msgSend(v7, "setValue:forKey:", virtualMemoryRegionInfo, CFSTR("virtualMemoryRegionInfo"));
  exceptionType = self->_exceptionType;
  if (exceptionType)
    objc_msgSend(v7, "setValue:forKey:", exceptionType, CFSTR("exceptionType"));
  exceptionCode = self->_exceptionCode;
  if (exceptionCode)
    objc_msgSend(v7, "setValue:forKey:", exceptionCode, CFSTR("exceptionCode"));
  exceptionReason = self->_exceptionReason;
  if (exceptionReason)
  {
    -[MXCrashDiagnosticObjectiveCExceptionReason dictionaryRepresentation](exceptionReason, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v14, CFSTR("objectiveCexceptionReason"));

  }
  signal = self->_signal;
  if (signal)
    objc_msgSend(v7, "setValue:forKey:", signal, CFSTR("signal"));
  if (objc_msgSend(v7, "count"))
  {
    v16 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("diagnosticMetaData"));

  }
  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)terminationReason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)virtualMemoryRegionInfo
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)exceptionType
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)exceptionCode
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)signal
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (MXCrashDiagnosticObjectiveCExceptionReason)exceptionReason
{
  return (MXCrashDiagnosticObjectiveCExceptionReason *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionReason, 0);
  objc_storeStrong((id *)&self->_signal, 0);
  objc_storeStrong((id *)&self->_exceptionCode, 0);
  objc_storeStrong((id *)&self->_exceptionType, 0);
  objc_storeStrong((id *)&self->_virtualMemoryRegionInfo, 0);
  objc_storeStrong((id *)&self->_terminationReason, 0);
  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
