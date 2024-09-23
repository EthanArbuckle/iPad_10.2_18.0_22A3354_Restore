@implementation CLKWidgetComplicationDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (CLKWidgetComplicationDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKWidgetComplicationDescriptor;
  return -[CLKWidgetComplicationDescriptor init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  CLKIntentReference *intentReference;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)CLKWidgetComplicationDescriptor;
  -[CLKWidgetComplicationDescriptor description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@, %@"), v4, self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_kind);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  intentReference = self->_intentReference;
  if (intentReference)
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(", %lli)"), -[CLKIntentReference indexingHash](intentReference, "indexingHash"));
  else
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(")"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5
{
  return -[CLKWidgetComplicationDescriptor initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intent:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intent:", a3, a4, a5, 0);
}

- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 intent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CLKIntentReference *v14;
  CLKWidgetComplicationDescriptor *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[CLKIntentReference initWithIntent:]([CLKIntentReference alloc], "initWithIntent:", v10);

  v15 = -[CLKWidgetComplicationDescriptor initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intentReference:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intentReference:", v13, v12, v11, v14);
  return v15;
}

- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 intentReference:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CLKWidgetComplicationDescriptor *v14;
  uint64_t v15;
  NSString *extensionBundleIdentifier;
  uint64_t v17;
  NSString *containerBundleIdentifier;
  uint64_t v19;
  NSString *kind;
  uint64_t v21;
  CLKIntentReference *intentReference;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CLKWidgetComplicationDescriptor;
  v14 = -[CLKWidgetComplicationDescriptor init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    extensionBundleIdentifier = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    kind = v14->_kind;
    v14->_kind = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    intentReference = v14->_intentReference;
    v14->_intentReference = (CLKIntentReference *)v21;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKWidgetComplicationDescriptor)initWithCoder:(id)a3
{
  id v4;
  CLKWidgetComplicationDescriptor *v5;
  uint64_t v6;
  NSString *extensionBundleIdentifier;
  uint64_t v8;
  NSString *containerBundleIdentifier;
  uint64_t v10;
  NSString *kind;
  uint64_t v12;
  CLKIntentReference *intentReference;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CLKIntentReference *v19;
  CLKIntentReference *v20;
  id v21;
  CLKIntentReference *v22;
  NSObject *v23;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  NSString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLKWidgetComplicationDescriptor;
  v5 = -[CLKWidgetComplicationDescriptor init](&v28, sel_init);
  if (!v5)
    goto LABEL_14;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  extensionBundleIdentifier = v5->_extensionBundleIdentifier;
  v5->_extensionBundleIdentifier = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  containerBundleIdentifier = v5->_containerBundleIdentifier;
  v5->_containerBundleIdentifier = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v10 = objc_claimAutoreleasedReturnValue();
  kind = v5->_kind;
  v5->_kind = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentReference"));
  v12 = objc_claimAutoreleasedReturnValue();
  intentReference = v5->_intentReference;
  v5->_intentReference = (CLKIntentReference *)v12;

  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("intent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CLKIntentReference initWithIntent:]([CLKIntentReference alloc], "initWithIntent:", v18);
    v20 = v5->_intentReference;
    v5->_intentReference = v19;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v21 = v17;
    v22 = -[CLKIntentReference initWithIntent:]([CLKIntentReference alloc], "initWithIntent:", v21);

    v18 = v5->_intentReference;
    v5->_intentReference = v22;
  }

LABEL_7:
  if (!v5->_extensionBundleIdentifier || !v5->_containerBundleIdentifier || !v5->_kind)
  {
    CLKLoggingObjectForDomain(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v25 = v5->_extensionBundleIdentifier;
      v26 = v5->_containerBundleIdentifier;
      v27 = v5->_kind;
      *(_DWORD *)buf = 138412802;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = v27;
      _os_log_fault_impl(&dword_2114F4000, v23, OS_LOG_TYPE_FAULT, "Unexpected nil identifiers decoding CLKWidgetComplicationDescriptor: %@ %@ %@", buf, 0x20u);
    }

  }
LABEL_14:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *extensionBundleIdentifier;
  id v5;

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerBundleIdentifier, CFSTR("containerBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentReference, CFSTR("intentReference"));

}

- (id)JSONObjectRepresentation
{
  void *v3;
  CLKIntentReference *intentReference;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_containerBundleIdentifier, CFSTR("containerBundleIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_kind, CFSTR("kind"));
  intentReference = self->_intentReference;
  if (intentReference)
  {
    -[CLKIntentReference keyedArchiverEncodedData](intentReference, "keyedArchiverEncodedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("intent"));

  }
  return v3;
}

- (CLKWidgetComplicationDescriptor)initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  CLKWidgetComplicationDescriptor *v5;
  uint64_t v6;
  NSString *extensionBundleIdentifier;
  uint64_t v8;
  NSString *containerBundleIdentifier;
  uint64_t v10;
  NSString *kind;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  CLKIntentReference *v18;
  CLKIntentReference *intentReference;
  id v21;

  v4 = a3;
  v5 = -[CLKWidgetComplicationDescriptor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extensionBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containerBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
    v10 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)MEMORY[0x24BDD0E20];
    if (v12)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
      if (!v14)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v13, CFSTR("CLKWidgetComplicationDescriptor failed to decode intent"));
      v21 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v17 = v16;
      if (!v15 && v16)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v13, CFSTR("CLKWidgetComplicationDescriptor failed to unarchive intent: %@"), v16);
      v18 = -[CLKIntentReference initWithIntent:]([CLKIntentReference alloc], "initWithIntent:", v15);
      intentReference = v5->_intentReference;
      v5->_intentReference = v18;

    }
    if (!v5->_extensionBundleIdentifier || !v5->_containerBundleIdentifier || !v5->_kind)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v13, CFSTR("CLKWidgetComplicationDescriptor was created from JSON with missing values"));

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKWidgetComplicationDescriptor *v4;
  uint64_t v5;
  CLKIntentReference *intentReference;

  v4 = objc_alloc_init(CLKWidgetComplicationDescriptor);
  objc_storeStrong((id *)&v4->_extensionBundleIdentifier, self->_extensionBundleIdentifier);
  objc_storeStrong((id *)&v4->_containerBundleIdentifier, self->_containerBundleIdentifier);
  objc_storeStrong((id *)&v4->_kind, self->_kind);
  v5 = -[CLKIntentReference copy](self->_intentReference, "copy");
  intentReference = v4->_intentReference;
  v4->_intentReference = (CLKIntentReference *)v5;

  return v4;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSString *extensionBundleIdentifier;
  uint64_t v7;
  id v8;
  id v9;
  NSString *containerBundleIdentifier;
  id v11;
  id v12;
  NSString *kind;
  id v14;
  id v15;
  CLKIntentReference *intentReference;
  id v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifier = self->_extensionBundleIdentifier;
    v7 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke;
    v29[3] = &unk_24CBF9EC0;
    v8 = v4;
    v30 = v8;
    v9 = (id)objc_msgSend(v5, "appendString:counterpart:", extensionBundleIdentifier, v29);
    containerBundleIdentifier = self->_containerBundleIdentifier;
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_2;
    v27[3] = &unk_24CBF9EC0;
    v11 = v8;
    v28 = v11;
    v12 = (id)objc_msgSend(v5, "appendString:counterpart:", containerBundleIdentifier, v27);
    kind = self->_kind;
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_3;
    v25[3] = &unk_24CBF9EC0;
    v14 = v11;
    v26 = v14;
    v15 = (id)objc_msgSend(v5, "appendString:counterpart:", kind, v25);
    intentReference = self->_intentReference;
    v20 = v7;
    v21 = 3221225472;
    v22 = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_4;
    v23 = &unk_24CBFA220;
    v24 = v14;
    v17 = (id)objc_msgSend(v5, "appendObject:counterpart:", intentReference, &v20);
    v18 = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CLKWidgetComplicationDescriptor isEqualToDescriptor:](self, "isEqualToDescriptor:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_extensionBundleIdentifier);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_containerBundleIdentifier);
  v6 = (id)objc_msgSend(v3, "appendString:", self->_kind);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_intentReference);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (CLKIntentReference)intentReference
{
  return self->_intentReference;
}

@end
