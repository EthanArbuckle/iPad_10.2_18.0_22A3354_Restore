@implementation MXDiskWriteExceptionDiagnostic

- (MXDiskWriteExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 totalWritesCaused:(id)a7 stackTrace:(id)a8
{
  uint64_t v10;
  id v15;
  id v16;
  MXDiskWriteExceptionDiagnostic *v17;
  double v18;
  MXDiskWriteExceptionDiagnostic *v19;
  objc_super v21;

  v10 = *(_QWORD *)&a6;
  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  v17 = -[MXDiagnostic initWithMetaData:applicationVersion:signpostData:andPID:](&v21, sel_initWithMetaData_applicationVersion_signpostData_andPID_, a3, a4, a5, v10);
  if (!v17)
    goto LABEL_5;
  objc_msgSend(v15, "doubleValue");
  v19 = 0;
  if (v16 && v18 > 0.0)
  {
    objc_storeStrong((id *)&v17->_totalWritesCaused, a7);
    objc_storeStrong((id *)&v17->_callStackTree, a8);
LABEL_5:
    v19 = v17;
  }

  return v19;
}

- (MXDiskWriteExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 totalWritesCaused:(id)a5 stackTrace:(id)a6
{
  id v11;
  id v12;
  MXDiskWriteExceptionDiagnostic *v13;
  double v14;
  MXDiskWriteExceptionDiagnostic *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  v13 = -[MXDiagnostic initWithMetaData:applicationVersion:](&v17, sel_initWithMetaData_applicationVersion_, a3, a4);
  if (!v13)
    goto LABEL_5;
  objc_msgSend(v11, "doubleValue");
  v15 = 0;
  if (v12 && v14 > 0.0)
  {
    objc_storeStrong((id *)&v13->_totalWritesCaused, a5);
    objc_storeStrong((id *)&v13->_callStackTree, a6);
LABEL_5:
    v15 = v13;
  }

  return v15;
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
  v5.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  v4 = a3;
  -[MXDiagnostic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalWritesCaused, CFSTR("writesCaused"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, CFSTR("callStackTree"));

}

- (MXDiskWriteExceptionDiagnostic)initWithCoder:(id)a3
{
  id v4;
  MXDiskWriteExceptionDiagnostic *v5;
  uint64_t v6;
  NSMeasurement *totalWritesCaused;
  uint64_t v8;
  MXCallStackTree *callStackTree;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  v5 = -[MXDiagnostic initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("writesCaused"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalWritesCaused = v5->_totalWritesCaused;
    v5->_totalWritesCaused = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callStackTree"));
    v8 = objc_claimAutoreleasedReturnValue();
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v8;

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
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13.receiver = self;
  v13.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  -[MXDiagnostic toDictionary](&v13, sel_toDictionary);
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

  if (self->_totalWritesCaused)
  {
    -[MXDiagnostic measurementFormatter](self, "measurementFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromMeasurement:", self->_totalWritesCaused);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("writesCaused"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("diagnosticMetaData"));

  }
  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)totalWritesCaused
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalWritesCaused, 0);
  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
