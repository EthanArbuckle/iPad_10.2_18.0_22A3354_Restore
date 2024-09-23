@implementation CNDSIMCardItem

- (CNDSIMCardItem)initWithIdentifier:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CNDSIMCardItem *v24;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSString *value;
  CNDSIMCardItem *v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  if (v6)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_1 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_48);
  v8 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
  {
    -[CNDSIMCardItem initWithIdentifier:value:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v7)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v7)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_1 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_48);
  v16 = CNGuardOSLog_cn_once_object_0_1;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
    -[CNDSIMCardItem initWithIdentifier:value:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:
  v31.receiver = self;
  v31.super_class = (Class)CNDSIMCardItem;
  v24 = -[CNDSIMCardItem init](&v31, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v6, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v27 = objc_msgSend(v7, "copy");
    value = v24->_value;
    v24->_value = (NSString *)v27;

    v29 = v24;
  }

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDSIMCardItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v4);

  -[CNDSIMCardItem value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("value"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNDSIMCardItem *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)MEMORY[0x24BE19270];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __26__CNDSIMCardItem_isEqual___block_invoke;
  v16[3] = &unk_24C235F78;
  v16[4] = self;
  v17 = v4;
  v10 = v5;
  v11 = 3221225472;
  v12 = __26__CNDSIMCardItem_isEqual___block_invoke_2;
  v13 = &unk_24C235F78;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = (void *)MEMORY[0x20BD1799C](&v10);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, v10, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __26__CNDSIMCardItem_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __26__CNDSIMCardItem_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x24BE19288];
  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __22__CNDSIMCardItem_hash__block_invoke;
  v7[3] = &unk_24C235FA0;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __22__CNDSIMCardItem_hash__block_invoke_2;
  v6[3] = &unk_24C235FA0;
  v3 = (void *)MEMORY[0x20BD1799C](v6, a2);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __22__CNDSIMCardItem_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __22__CNDSIMCardItem_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNDSIMCardItem)initWithCoder:(id)a3
{
  id v4;
  CNDSIMCardItem *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *value;
  CNDSIMCardItem *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNDSIMCardItem;
  v5 = -[CNDSIMCardItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    value = v5->_value;
    v5->_value = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("_value"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(uint64_t)a3 value:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C22000, a1, a3, "parameter ‘value’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithIdentifier:(uint64_t)a3 value:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C22000, a1, a3, "parameter ‘identifier’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
