@implementation MCMConcreteContainerIdentityForLibsystem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPathIdentifier, 0);
}

- (BOOL)existed
{
  return self->_existed;
}

- (MCMConcreteContainerIdentityForLibsystem)init
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

- (MCMConcreteContainerIdentityForLibsystem)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  MCMConcreteContainerIdentityForLibsystem *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *containerPathIdentifier;
  NSObject *v13;
  objc_super v14;
  unint64_t v15;
  uint8_t buf[8];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 1;
  v14.receiver = self;
  v14.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  v8 = -[MCMConcreteContainerIdentity initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](&v14, sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_, a3, a4, a5, &v15);
  if (!v8)
  {
LABEL_4:
    if (!a6)
      return v8;
    goto LABEL_5;
  }
  v9 = MEMORY[0x1D17D6A40](a3);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    containerPathIdentifier = v8->_containerPathIdentifier;
    v8->_containerPathIdentifier = (NSString *)v10;

    v8->_existed = container_is_new() ^ 1;
    goto LABEL_4;
  }
  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "container_object_t had a NULL unique path component when creating a concrete container identity", buf, 2u);
  }

  v15 = 11;
  v8 = 0;
  if (a6)
  {
LABEL_5:
    if (v15 != 1)
      *a6 = v15;
  }
  return v8;
}

- (MCMConcreteContainerIdentityForLibsystem)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12
{
  uint64_t v12;
  id v18;
  MCMConcreteContainerIdentityForLibsystem *v19;
  MCMConcreteContainerIdentityForLibsystem *v20;
  id v21;
  NSString *v22;
  NSString *containerPathIdentifier;
  NSObject *v24;
  objc_super v26;
  unint64_t v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v12 = *(_QWORD *)&a7;
  v30 = *MEMORY[0x1E0C80C00];
  v18 = a8;
  v27 = 1;
  v26.receiver = self;
  v26.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  v19 = -[MCMConcreteContainerIdentity initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](&v26, sel_initWithUUID_userIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_, a3, a4, a5, a6, v12, a10, a11, &v27);
  if (!v19)
  {
LABEL_9:
    v20 = 0;
    if (a12)
      *a12 = v27;
    goto LABEL_11;
  }
  v20 = v19;
  v19->_existed = a9;
  objc_opt_class();
  v21 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = (NSString *)v21;
  else
    v22 = 0;

  containerPathIdentifier = v20->_containerPathIdentifier;
  v20->_containerPathIdentifier = v22;

  if (!v20->_containerPathIdentifier)
  {
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Invalid object: containerPathIdentifier = [%@]", buf, 0xCu);
    }

    v27 = 11;
    goto LABEL_9;
  }
LABEL_11:

  return v20;
}

- (container_object_s)createLibsystemContainerWithError:(unint64_t *)a3
{
  void *v5;
  container_object_s *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  v6 = -[MCMConcreteContainerIdentity createLibsystemContainerWithContainerPathIdentifier:existed:error:](&v8, sel_createLibsystemContainerWithContainerPathIdentifier_existed_error_, v5, -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed"), a3);

  return v6;
}

- (id)transientContainerIdentity
{
  MCMConcreteContainerIdentityForLibsystem *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  v2 = self;
  if (!-[MCMContainerIdentity transient](v2, "transient"))
  {
    v3 = objc_alloc((Class)objc_opt_class());
    -[MCMConcreteContainerIdentity uuid](v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](v2, "containerPathIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MCMConcreteContainerIdentityForLibsystem existed](v2, "existed");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v14) = 1;
    LOBYTE(v14) = v10;
    v12 = objc_msgSend(v3, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, v14, v11, 0);

    v2 = (MCMConcreteContainerIdentityForLibsystem *)v12;
  }
  return v2;
}

- (id)nontransientContainerIdentity
{
  MCMConcreteContainerIdentityForLibsystem *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  v2 = self;
  if (-[MCMContainerIdentity transient](v2, "transient"))
  {
    v3 = objc_alloc((Class)objc_opt_class());
    -[MCMConcreteContainerIdentity uuid](v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal userIdentity](v2, "userIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal identifier](v2, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerIdentityMinimal containerConfig](v2, "containerConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCMContainerIdentityMinimal platform](v2, "platform");
    -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](v2, "containerPathIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MCMConcreteContainerIdentityForLibsystem existed](v2, "existed");
    -[MCMContainerIdentityMinimal userIdentityCache](v2, "userIdentityCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v14) = v10;
    v12 = objc_msgSend(v3, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, v14, v11, 0);

    v2 = (MCMConcreteContainerIdentityForLibsystem *)v12;
  }
  return v2;
}

- (id)transientConcreteContainerIdentityForLibsystem
{
  return -[MCMConcreteContainerIdentityForLibsystem transientContainerIdentity](self, "transientContainerIdentity");
}

- (id)nontransientConcreteContainerIdentityForLibsystem
{
  return -[MCMConcreteContainerIdentityForLibsystem nontransientContainerIdentity](self, "nontransientContainerIdentity");
}

- (id)identityByChangingUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;

  v4 = a3;
  v16 = objc_alloc((Class)objc_opt_class());
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCMContainerIdentityMinimal platform](self, "platform");
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  v11 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = (void *)objc_msgSend(v16, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, v15, v12, 0);

  return v13;
}

- (id)identityByChangingTransient:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v5 = objc_alloc((Class)objc_opt_class());
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMContainerIdentityMinimal platform](self, "platform");
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v16) = a3;
  LOBYTE(v16) = v12;
  v14 = (void *)objc_msgSend(v5, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v6, v7, v8, v9, v10, v11, v16, v13, 0);

  return v14;
}

- (id)identityByChangingContainerPathIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;

  v4 = a3;
  v16 = objc_alloc((Class)objc_opt_class());
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCMContainerIdentityMinimal platform](self, "platform");
  v10 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  v11 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = (void *)objc_msgSend(v16, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v5, v6, v7, v8, v9, v4, v15, v12, 0);

  return v13;
}

- (id)identityByChangingIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;

  v4 = a3;
  v16 = objc_alloc((Class)objc_opt_class());
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCMContainerIdentityMinimal platform](self, "platform");
  -[MCMConcreteContainerIdentityForLibsystem containerPathIdentifier](self, "containerPathIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMConcreteContainerIdentityForLibsystem existed](self, "existed");
  v11 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = (void *)objc_msgSend(v16, "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v5, v6, v4, v7, v8, v9, v15, v12, 0);

  return v13;
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MCMConcreteContainerIdentityForLibsystem_description__block_invoke;
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
  v5[2] = __60__MCMConcreteContainerIdentityForLibsystem_debugDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MCMConcreteContainerIdentityForLibsystem;
  v5 = -[MCMConcreteContainerIdentity copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_containerPathIdentifier, "copyWithZone:", a3);
    v7 = (void *)v5[9];
    v5[9] = v6;

    *((_BYTE *)v5 + 64) = self->_existed;
  }
  return v5;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

id __60__MCMConcreteContainerIdentityForLibsystem_debugDescription__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "userIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v7;
  v22 = a2;
  v23 = (void *)v5;
  v19 = v7;
  if (a2)
  {
    objc_msgSend(v7, "redactedDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "redactedDescription");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 32), "platform");
  v13 = objc_msgSend(*(id *)(a1 + 32), "transient");
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerPathIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d, uuid = %@, containerPathIdentifier = %@, existed = %d>"),
    v23,
    v6,
    v8,
    v9,
    v11,
    v12,
    v13,
    v14,
    v15,
    objc_msgSend(*(id *)(a1 + 32), "existed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {

    v9 = (void *)v8;
  }

  return v16;
}

id __55__MCMConcreteContainerIdentityForLibsystem_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  void *v19;
  const char *v21;
  void *v22;
  void *v23;

  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4;
  if (a2)
  {
    objc_msgSend(v4, "redactedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v5;
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "transient");
  v9 = "T";
  if (!v8)
    v9 = "";
  v21 = v9;
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
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerPathIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(*(id *)(a1 + 32), "platform");
  v17 = objc_msgSend(*(id *)(a1 + 32), "existed");
  v18 = ";E";
  if (!v17)
    v18 = "";
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@(%@%s);%@;u%@;p%@;pf%d%s>"), v6, v7, v21, v13, v14, v15, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v12 = v10;
    v10 = (void *)v7;
  }
  else
  {
    v6 = (void *)v7;
  }

  return v19;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 containerPathIdentifier:(id)a8 existed:(BOOL)a9 transient:(BOOL)a10 userIdentityCache:(id)a11 error:(unint64_t *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;

  v18 = a11;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  LOWORD(v26) = __PAIR16__(a10, a9);
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v23, v22, v21, v20, a7, v19, v26, v18, a12);

  return v24;
}

@end
