@implementation BLSDiagnosticEnvironmentDateSpecifier

+ (id)createWithSpecifier:(id)a3
{
  id v3;
  BLSDiagnosticEnvironmentDateSpecifier *v4;
  void *v5;
  void *v6;
  BLSDiagnosticEnvironmentDateSpecifier *v7;

  v3 = a3;
  v4 = [BLSDiagnosticEnvironmentDateSpecifier alloc];
  objc_msgSend(v3, "dateSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLSDiagnosticEnvironmentDateSpecifier initWithDateSpecifier:environmentIdentifier:](v4, "initWithDateSpecifier:environmentIdentifier:", v5, v6);
  return v7;
}

- (BLSDiagnosticEnvironmentDateSpecifier)initWithDateSpecifier:(id)a3 environmentIdentifier:(id)a4
{
  id v7;
  id v8;
  BLSDiagnosticEnvironmentDateSpecifier *v9;
  BLSDiagnosticEnvironmentDateSpecifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSDiagnosticEnvironmentDateSpecifier;
  v9 = -[BLSDiagnosticEnvironmentDateSpecifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateSpecifier, a3);
    objc_storeStrong((id *)&v10->_environmentIdentifier, a4);
  }

  return v10;
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSDiagnosticEnvironmentDateSpecifier *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __63__BLSDiagnosticEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __63__BLSDiagnosticEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v4, 0, 1);

  v5 = *(void **)(a1 + 32);
  NSStringFromBLSUpdateFidelity(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "fidelity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:skipIfEmpty:", v6, 0, 1);

  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0, 1);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSAlwaysOnDateSpecifier date](self->_dateSpecifier, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("presentationDate"));

  NSStringFromBLSUpdateFidelity(-[BLSAlwaysOnDateSpecifier fidelity](self->_dateSpecifier, "fidelity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("fidelity"));

  objc_msgSend(v3, "appendString:withName:", self->_environmentIdentifier, CFSTR("environment"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_dateSpecifier);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_environmentIdentifier);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BLSAlwaysOnDateSpecifier *dateSpecifier;
  uint64_t v7;
  id v8;
  id v9;
  NSString *environmentIdentifier;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dateSpecifier = self->_dateSpecifier;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke;
  v19[3] = &unk_1E621A808;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", dateSpecifier, v19);
  environmentIdentifier = self->_environmentIdentifier;
  v14 = v7;
  v15 = 3221225472;
  v16 = __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke_2;
  v17 = &unk_1E621AE68;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", environmentIdentifier, &v14);
  LOBYTE(environmentIdentifier) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)environmentIdentifier;
}

uint64_t __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateSpecifier");
}

uint64_t __49__BLSDiagnosticEnvironmentDateSpecifier_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "environmentIdentifier");
}

- (BLSDiagnosticEnvironmentDateSpecifier)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  BLSAlwaysOnDateSpecifier *v6;
  NSObject *v7;
  const char *string;
  __CFString *v9;
  NSObject *v10;
  BLSDiagnosticEnvironmentDateSpecifier *v11;

  v4 = a3;
  xpc_dictionary_get_dictionary(v4, (const char *)objc_msgSend(CFSTR("specifier"), "UTF8String"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[BLSAlwaysOnDateSpecifier initWithXPCDictionary:]([BLSAlwaysOnDateSpecifier alloc], "initWithXPCDictionary:", v5);
  }
  else
  {
    bls_diagnostics_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BLSDiagnosticFlipbookFrame initWithXPCDictionary:].cold.2();

    v6 = 0;
  }
  string = xpc_dictionary_get_string(v4, (const char *)objc_msgSend(CFSTR("environment"), "UTF8String"));
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    bls_diagnostics_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BLSDiagnosticEnvironmentDateSpecifier initWithXPCDictionary:].cold.1();

    v9 = CFSTR("<null environment identifier>");
  }
  v11 = -[BLSDiagnosticEnvironmentDateSpecifier initWithDateSpecifier:environmentIdentifier:](self, "initWithDateSpecifier:environmentIdentifier:", v6, v9);

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  xpc_object_t value;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("specifier"), "UTF8String");
  value = xpc_dictionary_create(0, 0, 0);
  -[BLSAlwaysOnDateSpecifier encodeWithXPCDictionary:](self->_dateSpecifier, "encodeWithXPCDictionary:", value);
  xpc_dictionary_set_value(v4, v5, value);
  xpc_dictionary_set_string(v4, (const char *)objc_msgSend(CFSTR("environment"), "UTF8String"), -[NSString UTF8String](self->_environmentIdentifier, "UTF8String"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDiagnosticEnvironmentDateSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BLSDiagnosticEnvironmentDateSpecifier *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BLSDiagnosticEnvironmentDateSpecifier initWithDateSpecifier:environmentIdentifier:](self, "initWithDateSpecifier:environmentIdentifier:", v5, v6);

    v7 = self;
  }
  else
  {
    bls_diagnostics_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BLSDiagnosticEnvironmentDateSpecifier initWithCoder:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  BLSAlwaysOnDateSpecifier *dateSpecifier;
  id v5;

  dateSpecifier = self->_dateSpecifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateSpecifier, CFSTR("specifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environmentIdentifier, CFSTR("environment"));

}

- (BLSAlwaysOnDateSpecifier)dateSpecifier
{
  return self->_dateSpecifier;
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifier, 0);
  objc_storeStrong((id *)&self->_dateSpecifier, 0);
}

- (void)initWithXPCDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, v0, v1, "failed to decode explanation from %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, v0, v1, "invalid specifier from %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
