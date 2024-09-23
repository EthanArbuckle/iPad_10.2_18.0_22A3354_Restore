@implementation CNGroup

+ (id)localizedStringForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", a3, a1, 1);
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_0_0 != -1)
    dispatch_once(&identifierProvider_cn_once_token_0_0, &__block_literal_global_61);
  return (id)identifierProvider_cn_once_object_0_0;
}

void __29__CNGroup_identifierProvider__block_invoke()
{
  CNUuidIdentifierProvider *v0;
  void *v1;

  v0 = -[CNUuidIdentifierProvider initWithSuffix:]([CNUuidIdentifierProvider alloc], "initWithSuffix:", CFSTR("ABGroup"));
  v1 = (void *)identifierProvider_cn_once_object_0_0;
  identifierProvider_cn_once_object_0_0 = (uint64_t)v0;

}

+ (id)makeIdentifierString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "identifierProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNGroup)init
{
  return -[CNGroup initWithName:](self, "initWithName:", 0);
}

- (CNGroup)initWithName:(id)a3
{
  id v4;
  void *v5;
  CNGroup *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNGroup initWithIdentifier:name:](self, "initWithIdentifier:name:", v5, v4);

  return v6;
}

- (CNGroup)initWithIdentifier:(id)a3 name:(id)a4
{
  return -[CNGroup initWithIdentifier:name:creationDate:modificationDate:iOSLegacyIdentifier:](self, "initWithIdentifier:name:creationDate:modificationDate:iOSLegacyIdentifier:", a3, a4, 0, 0, 0xFFFFFFFFLL);
}

- (CNGroup)initWithIdentifier:(id)a3 name:(id)a4 creationDate:(id)a5 modificationDate:(id)a6 iOSLegacyIdentifier:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CNGroup *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSDate *creationDate;
  uint64_t v25;
  NSDate *modificationDate;
  CNGroup *v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CNGroup;
  v16 = -[CNGroup init](&v29, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = *MEMORY[0x1E0D13780];
    v20 = (void *)objc_msgSend(v13, "copy");
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    name = v16->_name;
    v16->_name = (NSString *)v21;

    v23 = objc_msgSend(v14, "copy");
    creationDate = v16->_creationDate;
    v16->_creationDate = (NSDate *)v23;

    v25 = objc_msgSend(v15, "copy");
    modificationDate = v16->_modificationDate;
    v16->_modificationDate = (NSDate *)v25;

    v16->_iOSLegacyIdentifier = a7;
    v27 = v16;
  }

  return v16;
}

- (CNGroup)initWithGroup:(id)a3
{
  id v4;
  CNGroup *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  uint64_t v15;
  NSDate *creationDate;
  void *v17;
  uint64_t v18;
  NSDate *modificationDate;
  void *v20;
  uint64_t v21;
  NSString *externalIdentifier;
  void *v23;
  uint64_t v24;
  NSData *externalRepresentation;
  void *v26;
  uint64_t v27;
  NSString *externalModificationTag;
  void *v29;
  uint64_t v30;
  NSString *externalUUID;
  void *v32;
  uint64_t v33;
  CNGroup *snapshot;
  CNGroup *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CNGroup;
  v5 = -[CNGroup init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = *MEMORY[0x1E0D13780];
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

    v5->_iOSLegacyIdentifier = objc_msgSend(v4, "iOSLegacyIdentifier");
    objc_msgSend(v4, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v15;

    objc_msgSend(v4, "modificationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v18;

    objc_msgSend(v4, "externalIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v21;

    objc_msgSend(v4, "externalRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    externalRepresentation = v5->_externalRepresentation;
    v5->_externalRepresentation = (NSData *)v24;

    objc_msgSend(v4, "externalModificationTag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    externalModificationTag = v5->_externalModificationTag;
    v5->_externalModificationTag = (NSString *)v27;

    objc_msgSend(v4, "externalUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    externalUUID = v5->_externalUUID;
    v5->_externalUUID = (NSString *)v30;

    objc_msgSend(v4, "snapshot");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    snapshot = v5->_snapshot;
    v5->_snapshot = (CNGroup *)v33;

    v35 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGroup)initWithCoder:(id)a3
{
  id v4;
  CNGroup *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSDate *creationDate;
  void *v15;
  uint64_t v16;
  NSDate *modificationDate;
  uint64_t v18;
  NSString *externalIdentifier;
  void *v20;
  uint64_t v21;
  NSData *externalRepresentation;
  void *v23;
  uint64_t v24;
  NSString *externalModificationTag;
  void *v26;
  uint64_t v27;
  NSString *externalUUID;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  CNGroup *snapshot;
  CNGroup *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CNGroup;
  v5 = -[CNGroup init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    if (!v5->_name)
    {
      v5->_name = (NSString *)&stru_1E29FF900;

    }
    v5->_iOSLegacyIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("iOSLegacyIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalRepresentation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    externalRepresentation = v5->_externalRepresentation;
    v5->_externalRepresentation = (NSData *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalModificationTag"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    externalModificationTag = v5->_externalModificationTag;
    v5->_externalModificationTag = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalUUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    externalUUID = v5->_externalUUID;
    v5->_externalUUID = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("snapshot"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    snapshot = v5->_snapshot;
    v5->_snapshot = (CNGroup *)v33;

    v35 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, CFSTR("iOSLegacyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("externalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalRepresentation, CFSTR("externalRepresentation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalModificationTag, CFSTR("externalModificationTag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalUUID, CFSTR("externalUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshot, CFSTR("snapshot"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNMutableGroup *v4;
  CNGroup *snapshot;
  CNGroup *v6;

  v4 = -[CNGroup initWithGroup:]([CNMutableGroup alloc], "initWithGroup:", self);
  snapshot = self->_snapshot;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (CNGroup *)objc_claimAutoreleasedReturnValue();

  if (snapshot == v6)
    -[CNMutableGroup setSnapshot:](v4, "setSnapshot:", self);
  return v4;
}

- (CNGroup)snapshot
{
  CNGroup *v3;
  CNGroup *v4;
  CNGroup *v5;

  v3 = self->_snapshot;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (CNGroup *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v5 = self;

    v3 = v5;
  }
  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_iOSLegacyIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("iOSLegacyIdentifier"));

  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_creationDate, CFSTR("creationDate"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_modificationDate, CFSTR("modificationDate"));
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalIdentifier, CFSTR("externalURI"));
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalRepresentation, CFSTR("externalRepresentation"));
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalModificationTag, CFSTR("externalModificationTag"));
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", self->_externalUUID, CFSTR("externalUUID"));
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD aBlock[5];
  id v40;
  _QWORD v41[5];
  id v42;

  v4 = a3;
  v24 = (void *)MEMORY[0x1E0D13A40];
  v23 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __19__CNGroup_isEqual___block_invoke;
  v41[3] = &unk_1E29F7D70;
  v41[4] = self;
  v42 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNGroup_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v6 = v42;
  v40 = v6;
  v22 = _Block_copy(aBlock);
  v37[0] = v5;
  v37[1] = 3221225472;
  v37[2] = __19__CNGroup_isEqual___block_invoke_3;
  v37[3] = &unk_1E29F7D70;
  v37[4] = self;
  v7 = v6;
  v38 = v7;
  v8 = _Block_copy(v37);
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __19__CNGroup_isEqual___block_invoke_4;
  v35[3] = &unk_1E29F7D70;
  v35[4] = self;
  v9 = v7;
  v36 = v9;
  v10 = _Block_copy(v35);
  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __19__CNGroup_isEqual___block_invoke_5;
  v33[3] = &unk_1E29F7D70;
  v33[4] = self;
  v11 = v9;
  v34 = v11;
  v12 = _Block_copy(v33);
  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __19__CNGroup_isEqual___block_invoke_6;
  v31[3] = &unk_1E29F7D70;
  v31[4] = self;
  v13 = v11;
  v32 = v13;
  v14 = _Block_copy(v31);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __19__CNGroup_isEqual___block_invoke_7;
  v29[3] = &unk_1E29F7D70;
  v29[4] = self;
  v15 = v13;
  v30 = v15;
  v16 = _Block_copy(v29);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __19__CNGroup_isEqual___block_invoke_8;
  v27[3] = &unk_1E29F7D70;
  v27[4] = self;
  v17 = v15;
  v28 = v17;
  v18 = _Block_copy(v27);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __19__CNGroup_isEqual___block_invoke_9;
  v25[3] = &unk_1E29F7D70;
  v25[4] = self;
  v26 = v17;
  v19 = v17;
  v20 = _Block_copy(v25);
  LOBYTE(self) = objc_msgSend(v24, "isObject:kindOfClass:andEqualToObject:withBlocks:", v19, v23, self, v41, v22, v8, v10, v12, v14, v16, v18, v20, 0);

  return (char)self;
}

uint64_t __19__CNGroup_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

BOOL __19__CNGroup_isEqual___block_invoke_3(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "iOSLegacyIdentifier");
}

uint64_t __19__CNGroup_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "externalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "externalModificationTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalModificationTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "externalUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD aBlock[5];
  _QWORD v23[6];

  v14 = (void *)MEMORY[0x1E0D13A78];
  v3 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __15__CNGroup_hash__block_invoke;
  v23[3] = &unk_1E29F7D98;
  v23[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __15__CNGroup_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v4 = _Block_copy(aBlock);
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __15__CNGroup_hash__block_invoke_3;
  v21[3] = &unk_1E29F7D98;
  v21[4] = self;
  v5 = _Block_copy(v21);
  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __15__CNGroup_hash__block_invoke_4;
  v20[3] = &unk_1E29F7D98;
  v20[4] = self;
  v6 = _Block_copy(v20);
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __15__CNGroup_hash__block_invoke_5;
  v19[3] = &unk_1E29F7D98;
  v19[4] = self;
  v7 = _Block_copy(v19);
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __15__CNGroup_hash__block_invoke_6;
  v18[3] = &unk_1E29F7D98;
  v18[4] = self;
  v8 = _Block_copy(v18);
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __15__CNGroup_hash__block_invoke_7;
  v17[3] = &unk_1E29F7D98;
  v17[4] = self;
  v9 = _Block_copy(v17);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __15__CNGroup_hash__block_invoke_8;
  v16[3] = &unk_1E29F7D98;
  v16[4] = self;
  v10 = _Block_copy(v16);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __15__CNGroup_hash__block_invoke_9;
  v15[3] = &unk_1E29F7D98;
  v15[4] = self;
  v11 = _Block_copy(v15);
  v12 = objc_msgSend(v14, "hashWithBlocks:", v23, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  return v12;
}

uint64_t __15__CNGroup_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "integerHash:", (int)objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier"));
}

uint64_t __15__CNGroup_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalModificationTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_9(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSData)externalRepresentation
{
  return self->_externalRepresentation;
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (NSString)externalUUID
{
  return self->_externalUUID;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalUUID, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalRepresentation, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSPredicate)predicateForGroupsWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v3;
  CNiOSABGroupIdentifiersPredicate *v4;

  v3 = identifiers;
  v4 = -[CNiOSABGroupIdentifiersPredicate initWithIdentifiers:]([CNiOSABGroupIdentifiersPredicate alloc], "initWithIdentifiers:", v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForSubgroupsInGroupWithIdentifier:(NSString *)parentGroupIdentifier
{
  NSString *v3;
  CNiOSABGroupsInGroupPredicate *v4;

  v3 = parentGroupIdentifier;
  v4 = -[CNiOSABGroupsInGroupPredicate initWithParentGroupIdentifier:]([CNiOSABGroupsInGroupPredicate alloc], "initWithParentGroupIdentifier:", v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForGroupsInContainerWithIdentifier:(NSString *)containerIdentifier
{
  NSString *v3;
  CNiOSABGroupsInContainerPredicate *v4;

  v3 = containerIdentifier;
  v4 = -[CNiOSABGroupsInContainerPredicate initWithContainerIdentifier:]([CNiOSABGroupsInContainerPredicate alloc], "initWithContainerIdentifier:", v3);

  return (NSPredicate *)v4;
}

+ (id)predicateForGroupsWithMemberContact:(id)a3 includeAllParentGroups:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CNiOSABGroupsWithMembersPredicate *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CNiOSABGroupsWithMembersPredicate initWithContact:includeAllParentGroups:]([CNiOSABGroupsWithMembersPredicate alloc], "initWithContact:includeAllParentGroups:", v5, v4);

  return v6;
}

+ (id)predicateForGroupsWithMemberGroup:(id)a3 includeAllParentGroups:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CNiOSABGroupsWithMembersPredicate *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CNiOSABGroupsWithMembersPredicate initWithGroup:includeAllParentGroups:]([CNiOSABGroupsWithMembersPredicate alloc], "initWithGroup:includeAllParentGroups:", v5, v4);

  return v6;
}

+ (id)predicateForGroupsWithNameMatching:(id)a3
{
  id v3;
  CNiOSABGroupNameMatchingPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABGroupNameMatchingPredicate initWithName:]([CNiOSABGroupNameMatchingPredicate alloc], "initWithName:", v3);

  return v4;
}

+ (id)predicateForiOSLegacyIdentifier:(int)a3
{
  return -[CNiOSABGroupiOSLegacyIdentifierPredicate initWithiOSLegacyIdentifier:]([CNiOSABGroupiOSLegacyIdentifierPredicate alloc], "initWithiOSLegacyIdentifier:", *(_QWORD *)&a3);
}

@end
