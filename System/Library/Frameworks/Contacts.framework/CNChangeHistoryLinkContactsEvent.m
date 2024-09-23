@implementation CNChangeHistoryLinkContactsEvent

- (CNChangeHistoryLinkContactsEvent)init
{
  CNChangeHistoryLinkContactsEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryLinkContactsEvent)initWithFromContact:(id)a3 toContact:(id)a4 unifiedContact:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CNChangeHistoryLinkContactsEvent *v15;
  CNChangeHistoryLinkContactsEvent *v16;
  CNChangeHistoryLinkContactsEvent *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  v12 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v10)
      goto LABEL_7;
  }
  else
  {
    -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:].cold.3(v12);
    if (v10)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  v13 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
    -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:].cold.2(v13);
    if (!v11)
      goto LABEL_17;
    goto LABEL_12;
  }
LABEL_11:
  if (!v11)
    goto LABEL_17;
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    v14 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:].cold.1(v14);
  }
LABEL_17:
  v19.receiver = self;
  v19.super_class = (Class)CNChangeHistoryLinkContactsEvent;
  v15 = -[CNChangeHistoryLinkContactsEvent init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromContact, a3);
    objc_storeStrong((id *)&v16->_toContact, a4);
    objc_storeStrong((id *)&v16->_unifiedContact, a5);
    v17 = v16;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryLinkContactsEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNChangeHistoryLinkContactsEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fromContact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_toContact"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_unifiedContact"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:](self, "initWithFromContact:toContact:unifiedContact:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *fromContact;
  id v5;

  fromContact = self->_fromContact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fromContact, CFSTR("_fromContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toContact, CFSTR("_toContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unifiedContact, CFSTR("_unifiedContact"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v7 = v17;
  v15 = v7;
  v8 = _Block_copy(aBlock);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_3;
  v12[3] = &unk_1E29F7D70;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v9, v16, v8, v10, 0);

  return (char)self;
}

uint64_t __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "fromContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fromContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isObject:equalToOther:", v4, v6);

  return v7;
}

uint64_t __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "toContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "toContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isObject:equalToOther:", v4, v6);

  return v7;
}

uint64_t __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "unifiedContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "unifiedContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isObject:equalToOther:", v4, v6);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD aBlock[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_3;
  v9[3] = &unk_1E29F7D98;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

uint64_t __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "fromContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "objectHash:", v3);

  return v4;
}

uint64_t __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "toContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "objectHash:", v3);

  return v4;
}

uint64_t __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "unifiedContact");
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
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryLinkContactsEvent fromContact](self, "fromContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("fromContact"), v4);

  -[CNChangeHistoryLinkContactsEvent toContact](self, "toContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("toContact"), v6);

  -[CNChangeHistoryLinkContactsEvent unifiedContact](self, "unifiedContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("unifiedContact"), v8);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4;
  CNSafeChangeHistoryEventVisitorWrapper *v5;

  v4 = a3;
  v5 = -[CNSafeChangeHistoryEventVisitorWrapper initWithChangeHistoryEventVisitor:]([CNSafeChangeHistoryEventVisitorWrapper alloc], "initWithChangeHistoryEventVisitor:", v4);

  -[CNSafeChangeHistoryEventVisitorWrapper visitLinkContactsEvent:](v5, "visitLinkContactsEvent:", self);
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
  -[CNChangeHistoryLinkContactsEvent fromContact](self, "fromContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  if (!v9)
  {
    -[CNChangeHistoryLinkContactsEvent toContact](self, "toContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "compare:", v13);

  }
  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 5;
}

- (CNContact)fromContact
{
  return self->_fromContact;
}

- (CNContact)toContact
{
  return self->_toContact;
}

- (CNContact)unifiedContact
{
  return self->_unifiedContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedContact, 0);
  objc_storeStrong((id *)&self->_toContact, 0);
  objc_storeStrong((id *)&self->_fromContact, 0);
}

- (void)initWithFromContact:(void *)a1 toContact:unifiedContact:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v3, v4, "parameter ‘unifiedContact’ must be of type %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)initWithFromContact:(void *)a1 toContact:unifiedContact:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v3, v4, "parameter ‘toContact’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)initWithFromContact:(void *)a1 toContact:unifiedContact:.cold.3(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v3, v4, "parameter ‘fromContact’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
