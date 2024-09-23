@implementation CMLDynamicUseCase

- (CMLDynamicUseCase)initWithGroup:(id)a3 useCase:(id)a4 config:(id)a5 networkManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CMLDynamicUseCase *v15;
  CMLDynamicUseCase *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CMLDynamicUseCase;
  v15 = -[CMLDynamicUseCase init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_group, a3);
    objc_storeStrong((id *)&v16->_useCase, a4);
    objc_storeStrong((id *)&v16->_config, a5);
    objc_storeStrong((id *)&v16->_networkManager, a6);
  }

  return v16;
}

- (void)registerWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CMLUseCaseGroup *v14;
  void *v15;
  CMLUseCaseGroup *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v4 = (void (**)(id, id))a3;
  +[CMLUseCaseGroupManager sharedManager](CMLUseCaseGroupManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "listUseCaseGroupsWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v6)
  {
    -[CMLDynamicUseCase group](self, "group");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "useCases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
      v11 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    -[CMLDynamicUseCase config](self, "config");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMLDynamicUseCase useCase](self, "useCase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v13);

    v14 = [CMLUseCaseGroup alloc];
    -[CMLDynamicUseCase networkManager](self, "networkManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CMLUseCaseGroup initWithUseCases:networkConfig:](v14, "initWithUseCases:networkConfig:", v11, v15);

    -[CMLDynamicUseCase group](self, "group");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    objc_msgSend(v5, "configureGroupWithName:useCaseGroup:error:", v17, v16, &v19);
    v18 = v19;

    v4[2](v4, v18);
    v7 = v18;
  }
  else
  {
    v4[2](v4, v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  CMLDynamicUseCase *v4;
  CMLDynamicUseCase *v5;
  BOOL v6;

  v4 = (CMLDynamicUseCase *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLDynamicUseCase isEqualToDynamicUseCase:](self, "isEqualToDynamicUseCase:", v5);

  return v6;
}

- (BOOL)isEqualToDynamicUseCase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[CMLDynamicUseCase group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CMLDynamicUseCase useCase](self, "useCase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "useCase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[CMLDynamicUseCase config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[CMLDynamicUseCase networkManager](self, "networkManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "networkManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

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

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[CMLDynamicUseCase group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CMLDynamicUseCase useCase](self, "useCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CMLDynamicUseCase config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CMLDynamicUseCase networkManager](self, "networkManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLDynamicUseCase)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMLDynamicUseCase *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useCase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CMLDynamicUseCase initWithGroup:useCase:config:networkManager:](self, "initWithGroup:useCase:config:networkManager:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CMLDynamicUseCase group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("group"));

  -[CMLDynamicUseCase useCase](self, "useCase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("useCase"));

  -[CMLDynamicUseCase config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("config"));

  -[CMLDynamicUseCase networkManager](self, "networkManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("networkManager"));

}

- (NSString)group
{
  return self->_group;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (CMLUseCaseConfig)config
{
  return self->_config;
}

- (CMLNetworkManager)networkManager
{
  return self->_networkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkManager, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
