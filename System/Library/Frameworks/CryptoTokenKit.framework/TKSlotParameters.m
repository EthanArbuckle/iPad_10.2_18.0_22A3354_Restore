@implementation TKSlotParameters

- (TKSlotParameters)initWithMaxBlockSize:(int64_t)a3
{
  TKSlotParameters *v4;
  TKSlotParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKSlotParameters;
  v4 = -[TKSlotParameters init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TKSlotParameters setMaxInputLength:](v4, "setMaxInputLength:", a3);
    -[TKSlotParameters setMaxOutputLength:](v5, "setMaxOutputLength:", a3);
    -[TKSlotParameters setSecurePINVerificationSupported:](v5, "setSecurePINVerificationSupported:", 0);
    -[TKSlotParameters setSecurePINChangeSupported:](v5, "setSecurePINChangeSupported:", 0);
  }
  return v5;
}

- (TKSlotParameters)initWithEntriesFromDictionary:(id)a3
{
  id v4;
  TKSlotParameters *v5;
  objc_class *v6;
  objc_property_t *v7;
  unint64_t i;
  const char *Name;
  void *v10;
  void *v11;
  void *v12;
  unsigned int outCount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKSlotParameters;
  v5 = -[TKSlotParameters init](&v15, sel_init);
  if (v5)
  {
    outCount = 0;
    v6 = (objc_class *)objc_opt_class();
    v7 = class_copyPropertyList(v6, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        Name = property_getName(v7[i]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKSlotParameters setValue:forKey:](v5, "setValue:forKey:", v11, v12);

        }
      }
    }
    free(v7);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("{\n    maxInputLength: %ld\n"), -[TKSlotParameters maxInputLength](self, "maxInputLength"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    maxOutputLength: %ld\n"), -[TKSlotParameters maxOutputLength](self, "maxOutputLength"));
  -[TKSlotParameters productID](self, "productID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    productID: %@\n"), v4);

  -[TKSlotParameters vendorID](self, "vendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    vendorID: %@\n"), v5);

  -[TKSlotParameters firmwareVersion](self, "firmwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    firmwareVersion: %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("    securePINVerificationSupported: %d\n"), -[TKSlotParameters securePINVerificationSupported](self, "securePINVerificationSupported"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    securePINChangeSupported: %d\n"), -[TKSlotParameters securePINChangeSupported](self, "securePINChangeSupported"));
  -[TKSlotParameters displayMaxCharacters](self, "displayMaxCharacters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    displayMaxCharacters: %@\n"), v7);

  -[TKSlotParameters displayMaxLines](self, "displayMaxLines");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    displayMaxLines: %@ \n"), v8);

  -[TKSlotParameters pinValidationCondition](self, "pinValidationCondition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    pinValidationCondition: %@ \n"), v9);

  -[TKSlotParameters interactionTimeout](self, "interactionTimeout");
  objc_msgSend(v3, "appendFormat:", CFSTR("    interactionTimeout: %f\n"), v10);
  -[TKSlotParameters minPINLength](self, "minPINLength");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    minPINLength: %@\n"), v11);

  -[TKSlotParameters maxPINLength](self, "maxPINLength");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    maxPINLength: %@\n"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("    delegateWithControlMethod: %d\n"), -[TKSlotParameters delegateWithControlMethod](self, "delegateWithControlMethod"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    delegateWithEscapeMethod: %d\n}\n"), -[TKSlotParameters delegateWithEscapeMethod](self, "delegateWithEscapeMethod"));
  return v3;
}

- (id)getDictionaryParameters
{
  void *v3;
  objc_class *v4;
  objc_property_t *v5;
  unint64_t i;
  const char *Name;
  void *v8;
  void *v9;
  void *v10;
  unsigned int outCount;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v4 = (objc_class *)objc_opt_class();
  v5 = class_copyPropertyList(v4, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v5[i]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKSlotParameters valueForKey:](self, "valueForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v9, v10);

      }
    }
  }
  free(v5);
  return v3;
}

- (int64_t)maxInputLength
{
  return self->_maxInputLength;
}

- (void)setMaxInputLength:(int64_t)a3
{
  self->_maxInputLength = a3;
}

- (int64_t)maxOutputLength
{
  return self->_maxOutputLength;
}

- (void)setMaxOutputLength:(int64_t)a3
{
  self->_maxOutputLength = a3;
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProductID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)securePINVerificationSupported
{
  return self->_securePINVerificationSupported;
}

- (void)setSecurePINVerificationSupported:(BOOL)a3
{
  self->_securePINVerificationSupported = a3;
}

- (BOOL)securePINChangeSupported
{
  return self->_securePINChangeSupported;
}

- (void)setSecurePINChangeSupported:(BOOL)a3
{
  self->_securePINChangeSupported = a3;
}

- (NSNumber)displayMaxCharacters
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisplayMaxCharacters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)displayMaxLines
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayMaxLines:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)pinValidationCondition
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPinValidationCondition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (double)interactionTimeout
{
  return self->_interactionTimeout;
}

- (void)setInteractionTimeout:(double)a3
{
  self->_interactionTimeout = a3;
}

- (NSNumber)minPINLength
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMinPINLength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)maxPINLength
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMaxPINLength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)delegateWithControlMethod
{
  return self->_delegateWithControlMethod;
}

- (void)setDelegateWithControlMethod:(BOOL)a3
{
  self->_delegateWithControlMethod = a3;
}

- (BOOL)delegateWithEscapeMethod
{
  return self->_delegateWithEscapeMethod;
}

- (void)setDelegateWithEscapeMethod:(BOOL)a3
{
  self->_delegateWithEscapeMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxPINLength, 0);
  objc_storeStrong((id *)&self->_minPINLength, 0);
  objc_storeStrong((id *)&self->_pinValidationCondition, 0);
  objc_storeStrong((id *)&self->_displayMaxLines, 0);
  objc_storeStrong((id *)&self->_displayMaxCharacters, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
}

@end
