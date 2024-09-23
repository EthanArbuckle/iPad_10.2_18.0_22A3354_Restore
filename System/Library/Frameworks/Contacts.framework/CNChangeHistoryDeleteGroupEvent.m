@implementation CNChangeHistoryDeleteGroupEvent

- (CNChangeHistoryDeleteGroupEvent)init
{
  CNChangeHistoryDeleteGroupEvent *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryDeleteGroupEvent)initWithGroupIdentifier:(id)a3
{
  return -[CNChangeHistoryDeleteGroupEvent initWithGroupIdentifier:externalURI:externalModificationTag:](self, "initWithGroupIdentifier:externalURI:externalModificationTag:", a3, &stru_1E29FF900, &stru_1E29FF900);
}

- (CNChangeHistoryDeleteGroupEvent)initWithGroupIdentifier:(id)a3 externalURI:(id)a4 externalModificationTag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNChangeHistoryDeleteGroupEvent *v12;
  uint64_t v13;
  NSString *groupIdentifier;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *externalURI;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSString *externalModificationTag;
  CNChangeHistoryDeleteGroupEvent *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    v11 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNChangeHistoryDeleteGroupEvent initWithGroupIdentifier:externalURI:externalModificationTag:].cold.1(v11);
  }
  v26.receiver = self;
  v26.super_class = (Class)CNChangeHistoryDeleteGroupEvent;
  v12 = -[CNChangeHistoryDeleteGroupEvent init](&v26, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    groupIdentifier = v12->_groupIdentifier;
    v12->_groupIdentifier = (NSString *)v13;

    v15 = (uint64_t *)MEMORY[0x1E0D13780];
    v16 = *MEMORY[0x1E0D13780];
    v17 = (void *)objc_msgSend(v9, "copy");
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    externalURI = v12->_externalURI;
    v12->_externalURI = (NSString *)v18;

    v20 = *v15;
    v21 = (void *)objc_msgSend(v10, "copy");
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    externalModificationTag = v12->_externalModificationTag;
    v12->_externalModificationTag = (NSString *)v22;

    v24 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryDeleteGroupEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNChangeHistoryDeleteGroupEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalURI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalModificationTag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNChangeHistoryDeleteGroupEvent initWithGroupIdentifier:externalURI:externalModificationTag:](self, "initWithGroupIdentifier:externalURI:externalModificationTag:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupIdentifier;
  id v5;

  groupIdentifier = self->_groupIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupIdentifier, CFSTR("_groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalURI, CFSTR("_externalURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalModificationTag, CFSTR("_externalModificationTag"));

}

- (BOOL)isEqual:(id)a3
{
  CNChangeHistoryDeleteGroupEvent *v4;
  NSString *groupIdentifier;
  NSString *externalURI;
  NSString *externalModificationTag;
  BOOL v8;

  v4 = (CNChangeHistoryDeleteGroupEvent *)a3;
  v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (groupIdentifier = self->_groupIdentifier,
          (unint64_t)groupIdentifier | (unint64_t)v4->_groupIdentifier)
      && !-[NSString isEqual:](groupIdentifier, "isEqual:")
      || (externalURI = self->_externalURI, (unint64_t)externalURI | (unint64_t)v4->_externalURI)
      && !-[NSString isEqual:](externalURI, "isEqual:")
      || (externalModificationTag = self->_externalModificationTag,
          (unint64_t)externalModificationTag | (unint64_t)v4->_externalModificationTag)
      && !-[NSString isEqual:](externalModificationTag, "isEqual:"))
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_groupIdentifier);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_externalURI) - v3 + 32 * v3;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_externalModificationTag) - v4 + 32 * v4 + 506447;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupIdentifier"), self->_groupIdentifier);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("externalURI"), self->_externalURI);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("externalModificationTag"), self->_externalModificationTag);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4;
  CNSafeChangeHistoryEventVisitorWrapper *v5;

  v4 = a3;
  v5 = -[CNSafeChangeHistoryEventVisitorWrapper initWithChangeHistoryEventVisitor:]([CNSafeChangeHistoryEventVisitorWrapper alloc], "initWithChangeHistoryEventVisitor:", v4);

  -[CNSafeChangeHistoryEventVisitorWrapper visitDeleteGroupEvent:](v5, "visitDeleteGroupEvent:", self);
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CNChangeHistoryDeleteGroupEvent groupIdentifier](self, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 15;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

- (void)initWithGroupIdentifier:(void *)a1 externalURI:externalModificationTag:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_4(&dword_18F8BD000, v3, v4, "parameter ‘groupIdentifier’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
