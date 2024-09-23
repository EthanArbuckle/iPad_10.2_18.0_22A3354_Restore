@implementation MXHangDiagnostic

- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 hangDuration:(id)a8 hangType:(int64_t)a9
{
  uint64_t v11;
  id v16;
  id v17;
  MXHangDiagnostic *v18;
  double v19;
  MXHangDiagnostic *v20;
  objc_super v22;

  v11 = *(_QWORD *)&a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MXHangDiagnostic;
  v18 = -[MXDiagnostic initWithMetaData:applicationVersion:signpostData:andPID:](&v22, sel_initWithMetaData_applicationVersion_signpostData_andPID_, a3, a4, a5, v11);
  if (v18)
  {
    if (!v16 || (objc_msgSend(v17, "doubleValue"), v19 <= 0.0))
    {
      v20 = 0;
      goto LABEL_7;
    }
    v18->_hangType = a9;
    objc_storeStrong((id *)&v18->_callStackTree, a7);
    objc_storeStrong((id *)&v18->_hangDuration, a8);
  }
  v20 = v18;
LABEL_7:

  return v20;
}

- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 hangDuration:(id)a8
{
  return -[MXHangDiagnostic initWithMetaData:applicationVersion:signpostData:pid:callStack:hangDuration:hangType:](self, "initWithMetaData:applicationVersion:signpostData:pid:callStack:hangDuration:hangType:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 1);
}

- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 hangDuration:(id)a6
{
  id v11;
  id v12;
  MXHangDiagnostic *v13;
  double v14;
  MXHangDiagnostic *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MXHangDiagnostic;
  v13 = -[MXDiagnostic initWithMetaData:applicationVersion:](&v17, sel_initWithMetaData_applicationVersion_, a3, a4);
  if (v13)
  {
    if (!v11 || (objc_msgSend(v12, "doubleValue"), v14 <= 0.0))
    {
      v15 = 0;
      goto LABEL_7;
    }
    v13->_hangType = 1;
    objc_storeStrong((id *)&v13->_callStackTree, a5);
    objc_storeStrong((id *)&v13->_hangDuration, a6);
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
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXHangDiagnostic;
  v4 = a3;
  -[MXDiagnostic encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, CFSTR("callStackTree"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_hangDuration, CFSTR("hangDuration"));
  -[MXHangDiagnostic hangTypeString](self, "hangTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hangType"));

}

- (MXHangDiagnostic)initWithCoder:(id)a3
{
  id v4;
  MXHangDiagnostic *v5;
  uint64_t v6;
  MXCallStackTree *callStackTree;
  uint64_t v8;
  NSMeasurement *hangDuration;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXHangDiagnostic;
  v5 = -[MXDiagnostic initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callStackTree"));
    v6 = objc_claimAutoreleasedReturnValue();
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hangDuration"));
    v8 = objc_claimAutoreleasedReturnValue();
    hangDuration = v5->_hangDuration;
    v5->_hangDuration = (NSMeasurement *)v8;

    v10 = (void *)objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hangType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hangType = objc_msgSend(v10, "_hangTypeForHangTypeString:", v11);

  }
  return v5;
}

+ (int64_t)_hangTypeForHangTypeString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Main Runloop Hang")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Compositor Client Hang")))
    {
      v5 = 2;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)hangTypeString
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[MXHangDiagnostic hangType](self, "hangType");
  v3 = CFSTR("Unknown");
  if (v2 == 1)
    v3 = CFSTR("Main Runloop Hang");
  if (v2 == 2)
    return (NSString *)CFSTR("Compositor Client Hang");
  else
    return &v3->isa;
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
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14.receiver = self;
  v14.super_class = (Class)MXHangDiagnostic;
  -[MXDiagnostic toDictionary](&v14, sel_toDictionary);
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

  if (self->_hangDuration)
  {
    -[MXDiagnostic measurementFormatter](self, "measurementFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromMeasurement:", self->_hangDuration);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("hangDuration"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("diagnosticMetaData"));

  }
  -[MXHangDiagnostic hangTypeString](self, "hangTypeString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hangType"));

  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)hangDuration
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)hangType
{
  return self->_hangType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hangDuration, 0);
  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
