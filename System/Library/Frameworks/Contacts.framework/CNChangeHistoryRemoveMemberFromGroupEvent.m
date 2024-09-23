@implementation CNChangeHistoryRemoveMemberFromGroupEvent

- (CNChangeHistoryRemoveMemberFromGroupEvent)init
{
  CNChangeHistoryRemoveMemberFromGroupEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryRemoveMemberFromGroupEvent)initWithMember:(id)a3 group:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CNChangeHistoryRemoveMemberFromGroupEvent *v11;
  CNChangeHistoryRemoveMemberFromGroupEvent *v12;
  CNChangeHistoryRemoveMemberFromGroupEvent *v13;
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
    -[CNChangeHistoryAddMemberToGroupEvent initWithMember:group:].cold.2(v9);
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
  v15.super_class = (Class)CNChangeHistoryRemoveMemberFromGroupEvent;
  v11 = -[CNChangeHistoryRemoveMemberFromGroupEvent init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_member, a3);
    objc_storeStrong((id *)&v12->_group, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryRemoveMemberFromGroupEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNChangeHistoryRemoveMemberFromGroupEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_member"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNChangeHistoryRemoveMemberFromGroupEvent initWithMember:group:](self, "initWithMember:group:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *member;
  id v5;

  member = self->_member;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", member, CFSTR("_member"));
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
  CNChangeHistoryRemoveMemberFromGroupEvent *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "member");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "member");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isObject:equalToOther:", v4, v6);

  return v7;
}

uint64_t __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke_2(uint64_t a1)
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
  v7[2] = __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "member");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "objectHash:", v3);

  return v4;
}

uint64_t __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke_2(uint64_t a1)
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
  -[CNChangeHistoryRemoveMemberFromGroupEvent member](self, "member");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("member"), v4);

  -[CNChangeHistoryRemoveMemberFromGroupEvent group](self, "group");
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

  -[CNSafeChangeHistoryEventVisitorWrapper visitRemoveMemberFromGroupEvent:](v5, "visitRemoveMemberFromGroupEvent:", self);
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
  -[CNChangeHistoryRemoveMemberFromGroupEvent group](self, "group");
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
    -[CNChangeHistoryRemoveMemberFromGroupEvent member](self, "member");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "member");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "compare:", v13);

  }
  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 12;
}

- (CNContact)member
{
  return self->_member;
}

- (CNGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_member, 0);
}

@end
