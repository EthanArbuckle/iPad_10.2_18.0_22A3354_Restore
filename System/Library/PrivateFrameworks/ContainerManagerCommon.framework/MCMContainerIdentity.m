@implementation MCMContainerIdentity

- (BOOL)transient
{
  return self->_transient;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 transient;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMContainerIdentityMinimal platform](self, "platform");
  transient = self->_transient;
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v6, v8, v9, v10, transient, v12, 0);

  return v13;
}

- (MCMContainerIdentity)init
{
  NSObject *v3;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1CF807000, v3, OS_LOG_TYPE_ERROR, "You cannot init this class directly.", v5, 2u);
  }

  return 0;
}

- (MCMContainerIdentity)initWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  MCMContainerIdentity *result;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 1;
  v11.receiver = self;
  v11.super_class = (Class)MCMContainerIdentity;
  result = -[MCMContainerIdentityMinimal initWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](&v11, sel_initWithUserIdentity_identifier_containerConfig_platform_userIdentityCache_error_, a3, a4, a5, *(_QWORD *)&a6, a8, v12);
  if (result)
  {
    result->_transient = a7;
  }
  else if (a9)
  {
    *a9 = v12[0];
  }
  return result;
}

- (MCMContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  MCMContainerIdentity *v7;
  objc_super v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = 1;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerIdentity;
  v7 = -[MCMContainerIdentityMinimal initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](&v9, sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
  if (v7)
  {
    container_is_transient();
    v7->_transient = v10;
  }
  else if (a6)
  {
    *a6 = v11;
  }
  return v7;
}

- (id)plist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MCMContainerIdentity;
  -[MCMContainerIdentityMinimal plist](&v8, sel_plist);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMContainerIdentity transient](self, "transient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("transient"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (MCMContainerIdentity)initWithVersion1PlistDictionary:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMContainerIdentity *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  MCMContainerIdentity *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19[0] = 1;
  v18.receiver = self;
  v18.super_class = (Class)MCMContainerIdentity;
  v10 = -[MCMContainerIdentityMinimal initWithVersion1PlistDictionary:userIdentityCache:error:](&v18, sel_initWithVersion1PlistDictionary_userIdentityCache_error_, v8, v9, v19);
  if (!v10)
  {
    v16 = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_9;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = objc_msgSend(v11, "BOOLValue");
  else
    v12 = 0;
  -[MCMContainerIdentityMinimal userIdentity](v10, "userIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](v10, "containerConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MCMContainerIdentity initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](v10, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v13, v14, v15, -[MCMContainerIdentityMinimal platform](v10, "platform"), v12, v9, v19);

  if (a5)
  {
LABEL_9:
    if (!v16)
      *a5 = v19[0];
  }
LABEL_11:

  return v16;
}

- (id)transientContainerIdentity
{
  MCMContainerIdentity *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = self;
  if (!-[MCMContainerIdentity transient](v2, "transient"))
  {
    v3 = objc_alloc((Class)objc_opt_class());
    -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v4, v5, v6, v7, 1, v8, 0);

    v2 = (MCMContainerIdentity *)v9;
  }
  return v2;
}

- (id)nontransientContainerIdentity
{
  MCMContainerIdentity *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = self;
  if (-[MCMContainerIdentity transient](v2, "transient"))
  {
    v3 = objc_alloc((Class)objc_opt_class());
    -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v4, v5, v6, v7, 0, v8, 0);

    v2 = (MCMContainerIdentity *)v9;
  }
  return v2;
}

- (id)identityByChangingTransient:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[MCMContainerIdentity copy](self, "copy");
  v4[48] = a3;
  return v4;
}

- (id)identityByChangingUserIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerIdentityMinimal platform](self, "platform");
  v8 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)containerIdentity
{
  return self;
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MCMContainerIdentity_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)debugDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MCMContainerIdentity_debugDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMContainerIdentity;
  v3 = -[MCMContainerIdentityMinimal hash](&v6, sel_hash);
  v4 = 15;
  if (!self->_transient)
    v4 = 0;
  return v4 ^ v3;
}

- (BOOL)isEqualToContainerIdentity:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)MCMContainerIdentity;
  if (-[MCMContainerIdentityMinimal isEqualToContainerIdentity:](&v7, sel_isEqualToContainerIdentity_, v4))
    v5 = self->_transient == v4[48];
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainerIdentity *v4;
  BOOL v5;

  v4 = (MCMContainerIdentity *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[MCMContainerIdentity isEqualToContainerIdentity:](self, "isEqualToContainerIdentity:", v4);

  return v5;
}

id __40__MCMContainerIdentity_debugDescription__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    objc_msgSend(v7, "redactedDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "redactedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (uint64_t)v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d>"),
    v17,
    v5,
    v9,
    v10,
    v12,
    objc_msgSend(*(id *)(a1 + 32), "platform"),
    objc_msgSend(*(id *)(a1 + 32), "transient"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v10 = (void *)v9;
  }

  return v13;
}

id __35__MCMContainerIdentity_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5;
  if (a2)
  {
    objc_msgSend(v5, "redactedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "transient"))
    v9 = "T";
  else
    v9 = "";
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v11;
  if (a2)
  {
    objc_msgSend(v11, "redactedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@(%@%s);%@;pf%d>"),
    v7,
    v8,
    v9,
    v13,
    objc_msgSend(*(id *)(a1 + 32), "platform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {

    v12 = v10;
    v10 = (void *)v8;
  }
  else
  {
    v7 = (void *)v8;
  }

  return v14;
}

+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 transient:(BOOL)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  _BOOL8 v9;
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v18, v17, v16, v10, v9, v15, a9);

  return v19;
}

+ (id)containerIdentityWithUserIdentity:(id)a3 identifier:(id)a4 containerConfig:(id)a5 platform:(unsigned int)a6 userIdentityCache:(id)a7 error:(unint64_t *)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v9 = *(_QWORD *)&a6;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v17, v16, v15, v9, 0, v14, a8);

  return v18;
}

+ (id)containerIdentityWithIdentifier:(id)a3 containerConfig:(id)a4 platform:(unsigned int)a5 userIdentityCache:(id)a6 error:(unint64_t *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v9 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v20 = 1;
  if (!objc_msgSend(v13, "personaAndUserSpecific"))
  {
    v17 = objc_alloc((Class)a1);
    objc_msgSend(v14, "defaultUserIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v17, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v18, v12, v13, v9, 0, v14, &v20);

    if (!a7)
      goto LABEL_9;
    goto LABEL_7;
  }
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    _os_log_fault_impl(&dword_1CF807000, v15, OS_LOG_TYPE_FAULT, "Attempt to create a container identity without a user identity when one is required; identifier = [%{public}@], cl"
      "ass = %{public}@",
      buf,
      0x16u);
  }

  v16 = 0;
  v20 = 11;
  if (a7)
  {
LABEL_7:
    if (!v16)
      *a7 = v20;
  }
LABEL_9:

  return v16;
}

+ (id)containerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlist:userIdentityCache:error:", v9, v8, a5);

  return v10;
}

+ (id)containerIdentityWithMinimalContainerIdentity:(id)a3 transient:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(v6, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "platform");
  objc_msgSend(v6, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v7, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v8, v9, v10, v11, v4, v12, 0);
  return v13;
}

@end
