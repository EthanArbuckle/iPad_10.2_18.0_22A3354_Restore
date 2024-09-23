@implementation CNChangeHistoryUpdateContactEvent

- (CNChangeHistoryUpdateContactEvent)init
{
  CNChangeHistoryUpdateContactEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryUpdateContactEvent)initWithContact:(id)a3 imagesChanged:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CNChangeHistoryUpdateContactEvent *v9;

  v4 = a4;
  v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    v7 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNChangeHistoryAddContactEvent initWithContact:containerIdentifier:].cold.1(v7);
  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNChangeHistoryUpdateContactEvent initWithContact:contactIdentifier:imagesChanged:](self, "initWithContact:contactIdentifier:imagesChanged:", v6, v8, v4);

  return v9;
}

- (CNChangeHistoryUpdateContactEvent)initWithContactIdentifier:(id)a3 imagesChanged:(BOOL)a4
{
  return -[CNChangeHistoryUpdateContactEvent initWithContact:contactIdentifier:imagesChanged:](self, "initWithContact:contactIdentifier:imagesChanged:", 0, a3, a4);
}

- (CNChangeHistoryUpdateContactEvent)initWithContact:(id)a3 contactIdentifier:(id)a4 imagesChanged:(BOOL)a5
{
  id v9;
  id v10;
  CNChangeHistoryUpdateContactEvent *v11;
  CNChangeHistoryUpdateContactEvent *v12;
  uint64_t v13;
  NSString *contactIdentifier;
  CNChangeHistoryUpdateContactEvent *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNChangeHistoryUpdateContactEvent;
  v11 = -[CNChangeHistoryUpdateContactEvent init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contact, a3);
    v13 = objc_msgSend(v10, "copy");
    contactIdentifier = v12->_contactIdentifier;
    v12->_contactIdentifier = (NSString *)v13;

    v12->_imagesChanged = a5;
    v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryUpdateContactEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CNChangeHistoryUpdateContactEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_imagesChanged"));

  v8 = -[CNChangeHistoryUpdateContactEvent initWithContact:contactIdentifier:imagesChanged:](self, "initWithContact:contactIdentifier:imagesChanged:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *contact;
  id v5;

  contact = self->_contact;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contact, CFSTR("_contact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("_contactIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_imagesChanged, CFSTR("_imagesChanged"));

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
  CNChangeHistoryUpdateContactEvent *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "imagesChanged"), objc_msgSend(*(id *)(a1 + 40), "imagesChanged"));
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
  v7[2] = __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "imagesChanged"));
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryUpdateContactEvent contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactIdentifier"), v4);

  v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("imagesChanged"), -[CNChangeHistoryUpdateContactEvent imagesChanged](self, "imagesChanged"));
  -[CNChangeHistoryUpdateContactEvent contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contact"), v7);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4;
  CNSafeChangeHistoryEventVisitorWrapper *v5;

  v4 = a3;
  v5 = -[CNSafeChangeHistoryEventVisitorWrapper initWithChangeHistoryEventVisitor:]([CNSafeChangeHistoryEventVisitorWrapper alloc], "initWithChangeHistoryEventVisitor:", v4);

  -[CNSafeChangeHistoryEventVisitorWrapper visitUpdateContactEvent:](v5, "visitUpdateContactEvent:", self);
}

- (id)contactIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[CNChangeHistoryUpdateContactEvent contactIdentifier](self, "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CNChangeHistoryUpdateContactEvent contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 2;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (BOOL)imagesChanged
{
  return self->_imagesChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
