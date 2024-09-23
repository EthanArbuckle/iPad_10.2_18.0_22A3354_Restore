@implementation UNNotificationConnectionDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UNNotificationConnectionDetails auditToken](self, "auditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("auditToken"));

  -[UNNotificationConnectionDetails bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  objc_msgSend(v6, "encodeBool:forKey:", -[UNNotificationConnectionDetails isInternalTool](self, "isInternalTool"), CFSTR("internalTool"));
}

- (BOOL)isInternalTool
{
  return self->_internalTool;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (UNNotificationConnectionDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UNNotificationConnectionDetails *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("internalTool"));

  v8 = -[UNNotificationConnectionDetails initWithAuditToken:bundleIdentifier:internalTool:](self, "initWithAuditToken:bundleIdentifier:internalTool:", v5, v6, v7);
  return v8;
}

- (UNNotificationConnectionDetails)initWithAuditToken:(id)a3 bundleIdentifier:(id)a4 internalTool:(BOOL)a5
{
  id v8;
  id v9;
  UNNotificationConnectionDetails *v10;
  uint64_t v11;
  BSAuditToken *auditToken;
  uint64_t v13;
  NSString *bundleIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UNNotificationConnectionDetails;
  v10 = -[UNNotificationConnectionDetails init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    auditToken = v10->_auditToken;
    v10->_auditToken = (BSAuditToken *)v11;

    v13 = objc_msgSend(v9, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v13;

    v10->_internalTool = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationConnectionDetails auditToken](self, "auditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[UNNotificationConnectionDetails bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  v8 = (id)objc_msgSend(v3, "appendBool:", -[UNNotificationConnectionDetails isInternalTool](self, "isInternalTool"));
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[UNNotificationConnectionDetails auditToken](self, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __43__UNNotificationConnectionDetails_isEqual___block_invoke;
  v22[3] = &unk_1E57EFC90;
  v9 = v6;
  v23 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v7, v22);

  -[UNNotificationConnectionDetails bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __43__UNNotificationConnectionDetails_isEqual___block_invoke_2;
  v20[3] = &unk_1E57EFCB8;
  v12 = v9;
  v21 = v12;
  v13 = (id)objc_msgSend(v5, "appendString:counterpart:", v11, v20);

  v14 = -[UNNotificationConnectionDetails isInternalTool](self, "isInternalTool");
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __43__UNNotificationConnectionDetails_isEqual___block_invoke_3;
  v18[3] = &unk_1E57EFCE0;
  v19 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v5, "appendBool:counterpart:", v14, v18);
  LOBYTE(v14) = objc_msgSend(v5, "isEqual");

  return v14;
}

uint64_t __43__UNNotificationConnectionDetails_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "auditToken");
}

uint64_t __43__UNNotificationConnectionDetails_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
}

uint64_t __43__UNNotificationConnectionDetails_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isInternalTool");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", self);
}

@end
