@implementation BLSDiagnosticPresentationDateSpecifier

+ (id)createWithSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "presentationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithPresentationDate:specifiers:", v6, v7);
  return v8;
}

- (BLSDiagnosticPresentationDateSpecifier)initWithPresentationDate:(id)a3 specifiers:(id)a4
{
  id v7;
  id v8;
  BLSDiagnosticPresentationDateSpecifier *v9;
  BLSDiagnosticPresentationDateSpecifier *v10;
  uint64_t v11;
  NSArray *specifiers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSDiagnosticPresentationDateSpecifier;
  v9 = -[BLSDiagnosticPresentationDateSpecifier init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentationDate, a3);
    objc_msgSend(v8, "bs_map:", &__block_literal_global_11);
    v11 = objc_claimAutoreleasedReturnValue();
    specifiers = v10->_specifiers;
    v10->_specifiers = (NSArray *)v11;

  }
  return v10;
}

id __78__BLSDiagnosticPresentationDateSpecifier_initWithPresentationDate_specifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BLSDiagnosticEnvironmentDateSpecifier createWithSpecifier:](BLSDiagnosticEnvironmentDateSpecifier, "createWithSpecifier:", a2);
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (id)bls_loggingString
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_presentationDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("presentationDate"));

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", self->_specifiers, CFSTR("specifiers"), 0, &__block_literal_global_174);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__BLSDiagnosticPresentationDateSpecifier_bls_loggingString__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (id)bls_shortLoggingString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[NSDate bls_shortLoggingString](self->_presentationDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, 0, 1);

  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_specifiers, "count"), CFSTR("environments"));
  -[NSArray firstObject](self->_specifiers, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "environmentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("startingWith"), 1);

  objc_msgSend(v3, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_presentationDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("presentationDate"));

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_specifiers, CFSTR("specifiers"), 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  NSArray *specifiers;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_presentationDate);
  specifiers = self->_specifiers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__BLSDiagnosticPresentationDateSpecifier_hash__block_invoke;
  v9[3] = &unk_1E621AE18;
  v10 = v3;
  v6 = v3;
  -[NSArray enumerateObjectsUsingBlock:](specifiers, "enumerateObjectsUsingBlock:", v9);
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

id __46__BLSDiagnosticPresentationDateSpecifier_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDate *presentationDate;
  id v7;
  id v8;
  NSArray *specifiers;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  presentationDate = self->_presentationDate;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__BLSDiagnosticPresentationDateSpecifier_isEqual___block_invoke;
  v13[3] = &unk_1E621A808;
  v7 = v4;
  v14 = v7;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", presentationDate, v13);
  if (objc_msgSend(v5, "isEqual"))
  {
    specifiers = self->_specifiers;
    objc_msgSend(v7, "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray isEqualToArray:](specifiers, "isEqualToArray:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __50__BLSDiagnosticPresentationDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationDate");
}

- (BLSDiagnosticPresentationDateSpecifier)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  id v7;
  void *v8;
  BLSDiagnosticPresentationDateSpecifier *v9;
  _QWORD applier[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("presentationDate"), "UTF8String")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const char *)objc_msgSend(CFSTR("specifiers"), "UTF8String");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  xpc_dictionary_get_array(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke;
    applier[3] = &unk_1E621AE40;
    v12 = v7;
    xpc_array_apply(v8, applier);

  }
  v9 = -[BLSDiagnosticPresentationDateSpecifier initWithPresentationDate:specifiers:](self, "initWithPresentationDate:specifiers:", v5, v7);

  return v9;
}

uint64_t __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  if (!v5)
  {
    bls_diagnostics_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_1();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    bls_diagnostics_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_2();
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
LABEL_9:

  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v4;
  double v5;
  xpc_object_t xdict;

  xdict = a3;
  v4 = (const char *)objc_msgSend(CFSTR("presentationDate"), "UTF8String");
  -[NSDate timeIntervalSinceReferenceDate](self->_presentationDate, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(xdict, v4, v5);
  objc_msgSend(CFSTR("specifiers"), "UTF8String");
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDiagnosticPresentationDateSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BLSDiagnosticPresentationDateSpecifier *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("specifiers"));
    v9 = objc_claimAutoreleasedReturnValue();

    self = -[BLSDiagnosticPresentationDateSpecifier initWithPresentationDate:specifiers:](self, "initWithPresentationDate:specifiers:", v5, v9);
    v10 = self;
  }
  else
  {
    bls_diagnostics_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BLSDiagnosticPresentationDateSpecifier initWithCoder:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *presentationDate;
  id v5;

  presentationDate = self->_presentationDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", presentationDate, CFSTR("presentationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specifiers, CFSTR("specifiers"));

}

- (NSDate)presentationDate
{
  return self->_presentationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationDate, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

void __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, v0, v1, "unable to decode specifiers for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __64__BLSDiagnosticPresentationDateSpecifier_initWithXPCDictionary___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_1B0C75000, v1, OS_LOG_TYPE_FAULT, "decoded object:%{public}@ for %{public}@ is not a BLSDiagnosticEnvironmentDateSpecifier class", v2, 0x16u);
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
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, v0, v1, "invalid date from %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
