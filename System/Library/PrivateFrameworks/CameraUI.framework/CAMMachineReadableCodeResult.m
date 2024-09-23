@implementation CAMMachineReadableCodeResult

- (CAMMachineReadableCodeResult)initWithMachineReadableCodeObject:(id)a3
{
  id v5;
  CAMMachineReadableCodeResult *v6;
  CAMMachineReadableCodeResult *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *uniqueIdentifier;
  CAMMachineReadableCodeResult *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMMachineReadableCodeResult;
  v6 = -[CAMMachineReadableCodeResult init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingMachineReadableCodeObject, a3);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMMachineReadableCodeResult symbolString](v7, "symbolString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v11;

    v13 = v7;
  }

  return v7;
}

- (BOOL)isOfSignificantSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  -[CAMMachineReadableCodeResult underlyingMachineReadableCodeObject](self, "underlyingMachineReadableCodeObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v5 = v4;
  objc_msgSend(v3, "minimumMachineReadableCodeNormalizedHeight");
  v7 = v5 >= v6;

  return v7;
}

- (int64_t)mrcType
{
  void *v2;
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[CAMMachineReadableCodeResult underlyingMachineReadableCodeObject](self, "underlyingMachineReadableCodeObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "basicDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BarcodeType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8AA08]))
        v4 = 1;
      else
        v4 = 2;

    }
    else
    {
      v4 = 2;
    }

  }
  return v4;
}

- (NSString)symbolString
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  -[CAMMachineReadableCodeResult underlyingMachineReadableCodeObject](self, "underlyingMachineReadableCodeObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMMachineReadableCodeResult mrcType](self, "mrcType");
  if (v4 == 1)
  {
    objc_msgSend(v3, "basicDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RawData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      v7 = &stru_1EA3325A0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorCorrectedPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return (NSString *)v7;
}

- (NSString)metadataType
{
  void *v2;
  void *v3;

  -[CAMMachineReadableCodeResult underlyingMachineReadableCodeObject](self, "underlyingMachineReadableCodeObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (AVMetadataMachineReadableCodeObject)underlyingMachineReadableCodeObject
{
  return self->_underlyingMachineReadableCodeObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMachineReadableCodeObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
