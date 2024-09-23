@implementation CNChangeHistoryAddGroupEvent

- (CNChangeHistoryAddGroupEvent)init
{
  CNChangeHistoryAddGroupEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryAddGroupEvent)initWithGroup:(id)a3 containerIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CNChangeHistoryAddGroupEvent *v10;
  CNChangeHistoryAddGroupEvent *v11;
  uint64_t v12;
  NSString *containerIdentifier;
  CNChangeHistoryAddGroupEvent *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    v9 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:].cold.1(v9);
  }
  v16.receiver = self;
  v16.super_class = (Class)CNChangeHistoryAddGroupEvent;
  v10 = -[CNChangeHistoryAddGroupEvent init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_group, a3);
    v12 = objc_msgSend(v8, "copy");
    containerIdentifier = v11->_containerIdentifier;
    v11->_containerIdentifier = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryAddGroupEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNChangeHistoryAddGroupEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_group"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:](self, "initWithGroup:containerIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  CNGroup *group;
  id v5;

  group = self->_group;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", group, CFSTR("_group"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("_containerIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNChangeHistoryAddGroupEvent *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isObject:equalToOther:", v4, v6);

  return v7;
}

uint64_t __40__CNChangeHistoryAddGroupEvent_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CNChangeHistoryAddGroupEvent_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CNChangeHistoryAddGroupEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __36__CNChangeHistoryAddGroupEvent_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "objectHash:", v3);

  return v4;
}

uint64_t __36__CNChangeHistoryAddGroupEvent_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryAddGroupEvent group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("group"), v4);

  -[CNChangeHistoryAddGroupEvent containerIdentifier](self, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("containerIdentifier"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4;
  CNSafeChangeHistoryEventVisitorWrapper *v5;

  v4 = a3;
  v5 = -[CNSafeChangeHistoryEventVisitorWrapper initWithChangeHistoryEventVisitor:]([CNSafeChangeHistoryEventVisitorWrapper alloc], "initWithChangeHistoryEventVisitor:", v4);

  -[CNSafeChangeHistoryEventVisitorWrapper visitAddGroupEvent:](v5, "visitAddGroupEvent:", self);
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[CNChangeHistoryAddGroupEvent group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 3;
}

- (CNGroup)group
{
  return self->_group;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)initWithGroup:(void *)a1 containerIdentifier:.cold.1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v3, v4, "parameter ‘group’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
