@implementation WFMachineReadableCode

- (WFMachineReadableCode)initWithType:(id)a3 stringValue:(id)a4 errorCorrectionLevel:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFMachineReadableCode *v11;
  uint64_t v12;
  NSString *type;
  uint64_t v14;
  NSString *stringValue;
  uint64_t v16;
  NSString *errorCorrectionLevel;
  WFMachineReadableCode *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFMachineReadableCode;
  v11 = -[WFMachineReadableCode init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    type = v11->_type;
    v11->_type = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    stringValue = v11->_stringValue;
    v11->_stringValue = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    errorCorrectionLevel = v11->_errorCorrectionLevel;
    v11->_errorCorrectionLevel = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (WFMachineReadableCode)initWithMachineReadableCodeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFMachineReadableCode *v7;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFMachineReadableCode initWithType:stringValue:errorCorrectionLevel:](self, "initWithType:stringValue:errorCorrectionLevel:", v5, v6, 0);
  return v7;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFMachineReadableCode type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("type"));

  -[WFMachineReadableCode stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("stringValue"));

  -[WFMachineReadableCode errorCorrectionLevel](self, "errorCorrectionLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("errorCorrectionLevel"));

  v9 = CFSTR("link.contentkit.machinereadablecode");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WFMachineReadableCode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFMachineReadableCode *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCorrectionLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFMachineReadableCode initWithType:stringValue:errorCorrectionLevel:](self, "initWithType:stringValue:errorCorrectionLevel:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFMachineReadableCode type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[WFMachineReadableCode stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("stringValue"));

  -[WFMachineReadableCode errorCorrectionLevel](self, "errorCorrectionLevel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("errorCorrectionLevel"));

}

- (NSString)type
{
  return self->_type;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)errorCorrectionLevel
{
  return self->_errorCorrectionLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCorrectionLevel, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFMachineReadableCode *v8;

  v3 = a3;
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.machinereadablecode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("errorCorrectionLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = -[WFMachineReadableCode initWithType:stringValue:errorCorrectionLevel:]([WFMachineReadableCode alloc], "initWithType:stringValue:errorCorrectionLevel:", v5, v6, v7);
  else
    v8 = 0;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
