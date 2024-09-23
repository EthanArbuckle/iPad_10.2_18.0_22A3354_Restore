@implementation CNChangeHistoryDifferentMeCardEvent

- (CNChangeHistoryDifferentMeCardEvent)init
{
  CNChangeHistoryDifferentMeCardEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryDifferentMeCardEvent)initWithContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNChangeHistoryDifferentMeCardEvent *v6;
  uint64_t v7;
  NSString *contactIdentifier;
  CNChangeHistoryDifferentMeCardEvent *v9;
  objc_super v11;

  v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    v5 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNChangeHistoryDeleteContactEvent initWithContactIdentifier:externalURI:externalModificationTag:].cold.1(v5);
  }
  v11.receiver = self;
  v11.super_class = (Class)CNChangeHistoryDifferentMeCardEvent;
  v6 = -[CNChangeHistoryDifferentMeCardEvent init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryDifferentMeCardEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CNChangeHistoryDifferentMeCardEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNChangeHistoryDifferentMeCardEvent initWithContactIdentifier:](self, "initWithContactIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("_contactIdentifier"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CNChangeHistoryDifferentMeCardEvent_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

uint64_t __47__CNChangeHistoryDifferentMeCardEvent_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __43__CNChangeHistoryDifferentMeCardEvent_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __43__CNChangeHistoryDifferentMeCardEvent_hash__block_invoke(uint64_t a1)
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

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryDifferentMeCardEvent contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactIdentifier"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4;
  CNSafeChangeHistoryEventVisitorWrapper *v5;

  v4 = a3;
  v5 = -[CNSafeChangeHistoryEventVisitorWrapper initWithChangeHistoryEventVisitor:]([CNSafeChangeHistoryEventVisitorWrapper alloc], "initWithChangeHistoryEventVisitor:", v4);

  -[CNSafeChangeHistoryEventVisitorWrapper visitDifferentMeCardEvent:](v5, "visitDifferentMeCardEvent:", self);
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CNChangeHistoryDifferentMeCardEvent contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 9;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
