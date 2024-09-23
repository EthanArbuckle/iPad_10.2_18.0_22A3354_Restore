@implementation MCMConcreteContainerIdentity

- (container_object_s)createLibsystemContainerWithContainerPathIdentifier:(id)a3 existed:(BOOL)a4 error:(unint64_t *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  container_object_s *v14;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v17[0] = 0;
  v17[1] = 0;
  v6 = a3;
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUUIDBytes:", v17);

  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "UTF8String");
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerClass");
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posixUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UID");
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "UTF8String");

  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaUniqueString");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "UTF8String");
  -[MCMContainerIdentity transient](self, "transient");
  v14 = (container_object_s *)container_object_create();

  return v14;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MCMConcreteContainerIdentity)init
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

- (MCMConcreteContainerIdentity)initWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10
{
  _BOOL8 v10;
  uint64_t v11;
  id v16;
  MCMConcreteContainerIdentity *v17;
  MCMConcreteContainerIdentity *v18;
  id v19;
  NSUUID *v20;
  NSUUID *uuid;
  NSObject *v22;
  objc_super v24;
  unint64_t v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v10 = a8;
  v11 = *(_QWORD *)&a7;
  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v25 = 1;
  v24.receiver = self;
  v24.super_class = (Class)MCMConcreteContainerIdentity;
  v17 = -[MCMContainerIdentity initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](&v24, sel_initWithUserIdentity_identifier_containerConfig_platform_transient_userIdentityCache_error_, a4, a5, a6, v11, v10, a9, &v25);
  if (!v17)
  {
LABEL_9:
    v18 = 0;
    if (a10)
      *a10 = v25;
    goto LABEL_11;
  }
  v18 = v17;
  objc_opt_class();
  v19 = v16;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = (NSUUID *)v19;
  else
    v20 = 0;

  uuid = v18->_uuid;
  v18->_uuid = v20;

  if (!v18->_uuid)
  {
    container_log_handle_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Invalid object: uuid = [%@]", buf, 0xCu);
    }

    v25 = 11;
    goto LABEL_9;
  }
LABEL_11:

  return v18;
}

- (MCMConcreteContainerIdentity)initWithPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMConcreteContainerIdentity *v9;
  id v10;
  void *v11;
  int v12;
  MCMConcreteContainerIdentity *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16[0] = 1;
  v15.receiver = self;
  v15.super_class = (Class)MCMConcreteContainerIdentity;
  v9 = -[MCMContainerIdentityMinimal initWithPlist:userIdentityCache:error:](&v15, sel_initWithPlist_userIdentityCache_error_, v8, a4, v16);
  if (v9)
  {
    v10 = v8;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", CFSTR("1"));

    if (v12)
    {
      v13 = -[MCMConcreteContainerIdentity initWithVersion1PlistDictionary:containerIdentity:error:](v9, "initWithVersion1PlistDictionary:containerIdentity:error:", v10, v9, a5);
    }
    else
    {

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MCMConcreteContainerIdentity)initWithContainerIdentity:(id)a3 UUID:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MCMConcreteContainerIdentity *v16;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "platform");
  v14 = objc_msgSend(v9, "transient");
  objc_msgSend(v9, "userIdentityCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[MCMConcreteContainerIdentity initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](self, "initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v8, v10, v11, v12, v13, v14, v15, a5);
  return v16;
}

- (MCMConcreteContainerIdentity)initWithVersion1PlistDictionary:(id)a3 containerIdentity:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MCMConcreteContainerIdentity *v13;
  NSObject *v14;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 1;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      if (v11)
      {
        v12 = (void *)v11;
        v13 = -[MCMConcreteContainerIdentity initWithContainerIdentity:UUID:error:](self, "initWithContainerIdentity:UUID:error:", v9, v11, &v17);
        self = v13;
        if (!a5)
          goto LABEL_11;
        goto LABEL_9;
      }
    }
  }
  v17 = 116;
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v19 = CFSTR("UUID");
    v20 = 2112;
    v21 = (id)objc_opt_class();
    v22 = 2112;
    v23 = v8;
    v16 = v21;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Invalid container identity plist data. Expected UUID string for %@, got %@. Data: %@", buf, 0x20u);

  }
  v12 = 0;
  v13 = 0;
  if (a5)
  {
LABEL_9:
    if (!v13)
      *a5 = v17;
  }
LABEL_11:

  return v13;
}

- (MCMConcreteContainerIdentity)initWithLibsystemContainer:(container_object_s *)a3 defaultUserIdentity:(id)a4 userIdentityCache:(id)a5 error:(unint64_t *)a6
{
  MCMConcreteContainerIdentity *v7;
  uint64_t v8;
  NSUUID *uuid;
  objc_super v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v11.receiver = self;
  v11.super_class = (Class)MCMConcreteContainerIdentity;
  v7 = -[MCMContainerIdentity initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](&v11, sel_initWithLibsystemContainer_defaultUserIdentity_userIdentityCache_error_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", container_object_get_uuid());
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

  }
  else if (a6)
  {
    *a6 = v12;
  }
  return v7;
}

- (id)plist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MCMConcreteContainerIdentity;
  -[MCMContainerIdentity plist](&v9, sel_plist);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[MCMConcreteContainerIdentity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("UUID"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (id)containerIdentity
{
  MCMContainerIdentity *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  MCMContainerIdentity *v10;

  v3 = [MCMContainerIdentity alloc];
  -[MCMContainerIdentityMinimal userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerIdentityMinimal containerConfig](self, "containerConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerIdentityMinimal platform](self, "platform");
  v8 = -[MCMContainerIdentity transient](self, "transient");
  -[MCMContainerIdentityMinimal userIdentityCache](self, "userIdentityCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMContainerIdentity initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](v3, "initWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__MCMConcreteContainerIdentity_description__block_invoke;
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
  v5[2] = __48__MCMConcreteContainerIdentity_debugDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MCMConcreteContainerIdentity;
  v3 = -[MCMContainerIdentity hash](&v5, sel_hash);
  return -[NSUUID hash](self->_uuid, "hash") ^ v3;
}

- (BOOL)isEqualToConcreteContainerIdentity:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSUUID isEqual:](self->_uuid, "isEqual:", v4[7]))
  {
    v7.receiver = self;
    v7.super_class = (Class)MCMConcreteContainerIdentity;
    v5 = -[MCMContainerIdentity isEqualToContainerIdentity:](&v7, sel_isEqualToContainerIdentity_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MCMConcreteContainerIdentity *v4;
  BOOL v5;
  BOOL v6;

  v4 = (MCMConcreteContainerIdentity *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[MCMConcreteContainerIdentity isEqualToConcreteContainerIdentity:](self, "isEqualToConcreteContainerIdentity:", v4);
LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  v6 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[MCMContainerIdentity isEqualToContainerIdentity:](self, "isEqualToContainerIdentity:", v4);
    goto LABEL_5;
  }
LABEL_6:

  return v6;
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
  v9.super_class = (Class)MCMConcreteContainerIdentity;
  v5 = -[MCMContainerIdentity copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
    v7 = (void *)v5[7];
    v5[7] = v6;

  }
  return v5;
}

id __48__MCMConcreteContainerIdentity_debugDescription__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v21 = a2;
  v22 = (void *)v5;
  if (a2)
  {
    objc_msgSend(v8, "redactedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "redactedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (uint64_t)v9;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "platform");
  v15 = objc_msgSend(*(id *)(a1 + 32), "transient");
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, identifier = %@, class = %@, platform = %d, transient = %d, uuid = %@>"),
    v22,
    v6,
    v10,
    v11,
    v13,
    v14,
    v15,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {

    v11 = (void *)v10;
  }

  return v17;
}

id __43__MCMConcreteContainerIdentity_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4;
  if (a2)
  {
    objc_msgSend(v4, "redactedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "containerConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "transient"))
    v8 = "T";
  else
    v8 = "";
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v10;
  if (a2)
  {
    objc_msgSend(v10, "redactedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@(%@%s);%@;u%@;pf%d>"),
    v6,
    v7,
    v8,
    v12,
    v13,
    objc_msgSend(*(id *)(a1 + 32), "platform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v11 = v9;
    v9 = (void *)v7;
  }
  else
  {
    v6 = (void *)v7;
  }

  return v14;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 transient:(BOOL)a8 userIdentityCache:(id)a9 error:(unint64_t *)a10
{
  _BOOL8 v10;
  uint64_t v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v10 = a8;
  v11 = *(_QWORD *)&a7;
  v17 = a9;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v21, v20, v19, v18, v11, v10, v17, a10);

  return v22;
}

+ (id)containerIdentityWithUUID:(id)a3 userIdentity:(id)a4 identifier:(id)a5 containerConfig:(id)a6 platform:(unsigned int)a7 userIdentityCache:(id)a8 error:(unint64_t *)a9
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v9 = *(_QWORD *)&a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v19, v18, v17, v16, v9, 0, v15, a9);

  return v20;
}

+ (id)concreteContainerIdentityFromPlist:(id)a3 userIdentityCache:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlist:userIdentityCache:error:", v9, v8, a5);

  return v10;
}

@end
