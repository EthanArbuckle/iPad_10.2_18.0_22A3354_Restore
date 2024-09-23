@implementation CNChangeHistoryAddSubgroupToGroupEvent

- (CNChangeHistoryAddSubgroupToGroupEvent)init
{
  CNChangeHistoryAddSubgroupToGroupEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryAddSubgroupToGroupEvent)initWithSubgroup:(id)a3 group:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CNChangeHistoryAddSubgroupToGroupEvent *v11;
  CNChangeHistoryAddSubgroupToGroupEvent *v12;
  CNChangeHistoryAddSubgroupToGroupEvent *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  v9 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v8)
      goto LABEL_7;
  }
  else
  {
    -[CNChangeHistoryAddSubgroupToGroupEvent initWithSubgroup:group:].cold.2(v9);
    if (v8)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  v10 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
    -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:].cold.1(v10);
LABEL_12:
  v15.receiver = self;
  v15.super_class = (Class)CNChangeHistoryAddSubgroupToGroupEvent;
  v11 = -[CNChangeHistoryAddSubgroupToGroupEvent init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subgroup, a3);
    objc_storeStrong((id *)&v12->_group, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryAddSubgroupToGroupEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNChangeHistoryAddSubgroupToGroupEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subgroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNChangeHistoryAddSubgroupToGroupEvent initWithSubgroup:group:](self, "initWithSubgroup:group:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  CNGroup *subgroup;
  id v5;

  subgroup = self->_subgroup;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subgroup, CFSTR("_subgroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_group, CFSTR("_group"));

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
  CNChangeHistoryAddSubgroupToGroupEvent *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__CNChangeHistoryAddSubgroupToGroupEvent_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __50__CNChangeHistoryAddSubgroupToGroupEvent_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __50__CNChangeHistoryAddSubgroupToGroupEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "subgroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subgroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __50__CNChangeHistoryAddSubgroupToGroupEvent_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
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
  v7[2] = __46__CNChangeHistoryAddSubgroupToGroupEvent_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CNChangeHistoryAddSubgroupToGroupEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __46__CNChangeHistoryAddSubgroupToGroupEvent_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "subgroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __46__CNChangeHistoryAddSubgroupToGroupEvent_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "group");
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
  -[CNChangeHistoryAddSubgroupToGroupEvent subgroup](self, "subgroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("subgroup"), v4);

  -[CNChangeHistoryAddSubgroupToGroupEvent group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("group"), v6);

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

  -[CNSafeChangeHistoryEventVisitorWrapper visitAddSubgroupToGroupEvent:](v5, "visitAddSubgroupToGroupEvent:", self);
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CNChangeHistoryAddSubgroupToGroupEvent group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  if (!v9)
  {
    -[CNChangeHistoryAddSubgroupToGroupEvent subgroup](self, "subgroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subgroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "compare:", v13);

  }
  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 11;
}

- (CNGroup)subgroup
{
  return self->_subgroup;
}

- (CNGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_subgroup, 0);
}

- (void)initWithSubgroup:(void *)a1 group:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v3, v4, "parameter ‘subgroup’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
