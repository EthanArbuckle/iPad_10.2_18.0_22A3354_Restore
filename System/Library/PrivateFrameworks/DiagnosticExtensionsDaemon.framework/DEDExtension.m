@implementation DEDExtension

+ (id)extensionWithDictionary:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DEDExtensionIdentifier *v14;
  void *v15;
  DEDExtensionIdentifier *v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedConsentText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedConsentText:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedDataCollectedExplanation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedDataCollectedExplanation:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedDataCollectedSummary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedDataCollectedSummary:", v11);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("requiresDataClassBAccessToRun"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresDataClassBAccessToRun:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dedExtensionIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [DEDExtensionIdentifier alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dedExtensionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DEDExtensionIdentifier initWithString:](v14, "initWithString:", v15);
    objc_msgSend(v4, "setDedExtensionIdentifier:", v16);

  }
  return v4;
}

+ (id)extensionWithDEExtension:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "attachmentsName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v3, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.iOSExtension"));

  v10 = objc_msgSend(v3, "requiresDataClassBAccessToRun");
  objc_msgSend(v4, "setRequiresDataClassBAccessToRun:", v10);
  return v4;
}

- (id)serialize
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v20;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("name");
  -[DEDExtension name](self, "name");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  v23[1] = CFSTR("identifier");
  -[DEDExtension identifier](self, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  v23[2] = CFSTR("dedExtensionIdentifier");
  -[DEDExtension dedExtensionIdentifier](self, "dedExtensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v9;
  v23[3] = CFSTR("requiresDataClassBAccessToRun");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DEDExtension requiresDataClassBAccessToRun](self, "requiresDataClassBAccessToRun"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDExtension localizedConsentText](self, "localizedConsentText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[DEDExtension localizedDataCollectedSummary](self, "localizedDataCollectedSummary"),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[DEDExtension localizedDataCollectedExplanation](self, "localizedDataCollectedExplanation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v20 = v11;
      goto LABEL_5;
    }
  }
  v13 = (void *)objc_msgSend(v11, "mutableCopy");
  -[DEDExtension localizedConsentText](self, "localizedConsentText");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("localizedConsentText"));

  -[DEDExtension localizedDataCollectedExplanation](self, "localizedDataCollectedExplanation");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("localizedDataCollectedExplanation"));

  -[DEDExtension localizedDataCollectedSummary](self, "localizedDataCollectedSummary");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("localizedDataCollectedSummary"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
  v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v20;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)DEDExtension;
  -[DEDExtension description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDExtension serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DEDExtension *v4;

  v4 = -[DEDExtension init](+[DEDExtension allocWithZone:](DEDExtension, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_name, self->_name);
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  objc_storeStrong((id *)&v4->_dedExtensionIdentifier, self->_dedExtensionIdentifier);
  v4->_requiresDataClassBAccessToRun = self->_requiresDataClassBAccessToRun;
  return v4;
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken_1 != -1)
    dispatch_once(&archivedClasses_onceToken_1, &__block_literal_global_14);
  return (id)archivedClasses__classes_0;
}

void __31__DEDExtension_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDExtensionIdentifier archivedClasses](DEDExtensionIdentifier, "archivedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

  v4 = (void *)archivedClasses__classes_0;
  archivedClasses__classes_0 = (uint64_t)v2;

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DEDExtensionIdentifier)dedExtensionIdentifier
{
  return (DEDExtensionIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDedExtensionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)requiresDataClassBAccessToRun
{
  return self->_requiresDataClassBAccessToRun;
}

- (void)setRequiresDataClassBAccessToRun:(BOOL)a3
{
  self->_requiresDataClassBAccessToRun = a3;
}

- (NSString)localizedConsentText
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalizedConsentText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)localizedDataCollectedExplanation
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalizedDataCollectedExplanation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)localizedDataCollectedSummary
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedDataCollectedSummary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDataCollectedSummary, 0);
  objc_storeStrong((id *)&self->_localizedDataCollectedExplanation, 0);
  objc_storeStrong((id *)&self->_localizedConsentText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dedExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
