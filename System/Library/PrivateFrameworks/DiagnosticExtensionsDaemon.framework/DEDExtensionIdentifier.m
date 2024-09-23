@implementation DEDExtensionIdentifier

+ (id)log
{
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, &__block_literal_global_16);
  return (id)log_log_3;
}

void __29__DEDExtensionIdentifier_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-identifier");
  v1 = (void *)log_log_3;
  log_log_3 = (uint64_t)v0;

}

+ (id)parseDEDIdentifierString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", &stru_24D1E6AF0) & 1) != 0)
  {
    objc_msgSend(v5, "removeLastObject");
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (DEDExtensionIdentifier)initWithString:(id)a3
{
  id v4;
  DEDExtensionIdentifier *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *extensionIdentifier;
  DEDExtensionIdentifier *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DEDExtensionIdentifier;
  v5 = -[DEDExtensionIdentifier init](&v15, sel_init);
  if (!v5)
  {
LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "parseDEDIdentifierString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      extensionIdentifier = v5->_extensionIdentifier;
      v5->_extensionIdentifier = (NSString *)v8;

      v5->_invocationNumber = 0;
    }
    else
    {
      objc_msgSend(v7, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_invocationNumber = objc_msgSend(v11, "integerValue");

      objc_msgSend(v7, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_extensionIdentifier;
      v5->_extensionIdentifier = (NSString *)v12;

    }
    goto LABEL_9;
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (DEDExtensionIdentifier)initWithExtensionIdentifier:(id)a3 invocationNumber:(int64_t)a4
{
  id v7;
  DEDExtensionIdentifier *v8;
  DEDExtensionIdentifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEDExtensionIdentifier;
  v8 = -[DEDExtensionIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extensionIdentifier, a3);
    v9->_invocationNumber = a4;
  }

  return v9;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;

  if (-[DEDExtensionIdentifier invocationNumber](self, "invocationNumber"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[DEDExtensionIdentifier extensionIdentifier](self, "extensionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%ld"), v4, -[DEDExtensionIdentifier invocationNumber](self, "invocationNumber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[DEDExtensionIdentifier extensionIdentifier](self, "extensionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DEDExtensionIdentifier extensionIdentifier](self, "extensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("extensionIdentifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[DEDExtensionIdentifier invocationNumber](self, "invocationNumber"), CFSTR("invocationNumber"));
}

- (DEDExtensionIdentifier)initWithCoder:(id)a3
{
  id v4;
  DEDExtensionIdentifier *v5;
  uint64_t v6;
  NSString *extensionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DEDExtensionIdentifier;
  v5 = -[DEDExtensionIdentifier init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v6;

    v5->_invocationNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("invocationNumber"));
  }

  return v5;
}

+ (id)archivedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__DEDExtensionIdentifier_archivedClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (archivedClasses_onceToken_2 != -1)
    dispatch_once(&archivedClasses_onceToken_2, block);
  return (id)archivedClasses_classes;
}

void __41__DEDExtensionIdentifier_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)archivedClasses_classes;
  archivedClasses_classes = v2;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[DEDExtensionIdentifier extensionIdentifier](self, "extensionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[DEDExtensionIdentifier invocationNumber](self, "invocationNumber");
      v9 = v8 == objc_msgSend(v5, "invocationNumber");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)invocationNumber
{
  return self->_invocationNumber;
}

- (void)setInvocationNumber:(int64_t)a3
{
  self->_invocationNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end
