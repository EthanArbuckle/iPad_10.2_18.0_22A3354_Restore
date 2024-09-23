@implementation MXAppLaunchDiagnostic

- (MXAppLaunchDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 launchDuration:(id)a8
{
  uint64_t v10;
  id v15;
  id v16;
  MXAppLaunchDiagnostic *v17;
  double v18;
  MXAppLaunchDiagnostic *v19;
  objc_super v21;

  v10 = *(_QWORD *)&a6;
  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MXAppLaunchDiagnostic;
  v17 = -[MXDiagnostic initWithMetaData:applicationVersion:signpostData:andPID:](&v21, sel_initWithMetaData_applicationVersion_signpostData_andPID_, a3, a4, a5, v10);
  if (v17)
  {
    if (!v15 || (objc_msgSend(v16, "doubleValue"), v18 <= 0.0))
    {
      v19 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v17->_callStackTree, a7);
    objc_storeStrong((id *)&v17->_launchDuration, a8);
  }
  v19 = v17;
LABEL_7:

  return v19;
}

- (MXAppLaunchDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 launchDuration:(id)a6
{
  id v11;
  id v12;
  MXAppLaunchDiagnostic *v13;
  double v14;
  MXAppLaunchDiagnostic *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MXAppLaunchDiagnostic;
  v13 = -[MXDiagnostic initWithMetaData:applicationVersion:](&v17, sel_initWithMetaData_applicationVersion_, a3, a4);
  if (v13)
  {
    if (!v11 || (objc_msgSend(v12, "doubleValue"), v14 <= 0.0))
    {
      v15 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v13->_callStackTree, a5);
    objc_storeStrong((id *)&v13->_launchDuration, a6);
  }
  v15 = v13;
LABEL_7:

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
  v5.super_class = (Class)MXAppLaunchDiagnostic;
  v4 = a3;
  -[MXDiagnostic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, CFSTR("callStackTree"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_launchDuration, CFSTR("launchDuration"));

}

- (MXAppLaunchDiagnostic)initWithCoder:(id)a3
{
  id v4;
  MXAppLaunchDiagnostic *v5;
  uint64_t v6;
  MXCallStackTree *callStackTree;
  uint64_t v8;
  NSMeasurement *launchDuration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXAppLaunchDiagnostic;
  v5 = -[MXDiagnostic initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callStackTree"));
    v6 = objc_claimAutoreleasedReturnValue();
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchDuration"));
    v8 = objc_claimAutoreleasedReturnValue();
    launchDuration = v5->_launchDuration;
    v5->_launchDuration = (NSMeasurement *)v8;

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
  NSMeasurement *launchDuration;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16.receiver = self;
  v16.super_class = (Class)MXAppLaunchDiagnostic;
  -[MXDiagnostic toDictionary](&v16, sel_toDictionary);
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

  if (self->_launchDuration)
  {
    -[MXDiagnostic measurementFormatter](self, "measurementFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    launchDuration = self->_launchDuration;
    objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement measurementByConvertingToUnit:](launchDuration, "measurementByConvertingToUnit:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromMeasurement:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("launchDuration"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v14 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("diagnosticMetaData"));

  }
  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)launchDuration
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDuration, 0);
  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
