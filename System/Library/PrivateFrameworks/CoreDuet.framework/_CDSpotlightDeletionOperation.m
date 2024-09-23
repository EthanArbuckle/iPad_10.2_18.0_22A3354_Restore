@implementation _CDSpotlightDeletionOperation

+ (id)deletionForEventsWithItemIdentifiers:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);

  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_msgSend(v11, "initWithDeletionType:bundleId:itemIdentifiers:domainIdentifiers:completion:", CFSTR("identifiers"), v9, v12, v13, v8);

  return v14;
}

+ (id)deletionForEventsWithDomainIdentifiers:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);

  v14 = (void *)objc_msgSend(v11, "initWithDeletionType:bundleId:itemIdentifiers:domainIdentifiers:completion:", CFSTR("domainIdentifiers"), v9, v12, v13, v8);
  return v14;
}

- (_CDSpotlightDeletionOperation)initWithDeletionType:(id)a3 bundleId:(id)a4 itemIdentifiers:(id)a5 domainIdentifiers:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _CDSpotlightDeletionOperation *v17;
  _CDSpotlightDeletionOperation *v18;
  uint64_t v19;
  id completion;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_CDSpotlightDeletionOperation;
  v17 = -[_CDSpotlightDeletionOperation init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deletionType, a3);
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_itemIdentifiers, a5);
    objc_storeStrong((id *)&v18->_domainIdentifiers, a6);
    v19 = objc_msgSend(v16, "copy");
    completion = v18->_completion;
    v18->_completion = (id)v19;

  }
  return v18;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  NSString *v6;
  NSSet *v7;
  NSSet *domainIdentifiers;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_bundleId;
    v7 = self->_itemIdentifiers;
    domainIdentifiers = self->_domainIdentifiers;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    domainIdentifiers = 0;
  }
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - bundleId: %@, itemIdentifiers: %@, domainIdentifiers: %@"), v5, v6, v7, domainIdentifiers);

  return (NSString *)v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  if (a4 == 1)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v5)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[_CDSpotlightDeletionOperation eventWithData:dataVersion:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)serialize
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (v3)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_CDSpotlightDeletionOperation serialize].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v2;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deletionType;
  id v5;

  deletionType = self->_deletionType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deletionType, CFSTR("deletionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifiers, CFSTR("itemIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainIdentifiers, CFSTR("domainIdentifiers"));

}

- (_CDSpotlightDeletionOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _CDSpotlightDeletionOperation *v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D81610], "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("deletionType"), v4, 1, CFSTR("_CDSpotlightDeletionErrorDomain"), -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D81610], "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("bundleId"), v4, 1, CFSTR("_CDSpotlightDeletionErrorDomain"), -1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0D81610];
      v8 = (void *)MEMORY[0x193FEE914]();
      v9 = objc_alloc(MEMORY[0x1E0C99E60]);
      v10 = objc_opt_class();
      v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v7, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("itemIdentifiers"), v4, 1, CFSTR("_CDSpotlightDeletionErrorDomain"), -1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0D81610];
        v14 = (void *)MEMORY[0x193FEE914]();
        v15 = objc_alloc(MEMORY[0x1E0C99E60]);
        v16 = objc_opt_class();
        v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("domainIdentifiers"), v4, 1, CFSTR("_CDSpotlightDeletionErrorDomain"), -1, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          self = -[_CDSpotlightDeletionOperation initWithDeletionType:bundleId:itemIdentifiers:domainIdentifiers:completion:](self, "initWithDeletionType:bundleId:itemIdentifiers:domainIdentifiers:completion:", v5, v6, v12, v18, 0);
          v19 = self;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_domainIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_deletionType, 0);
}

+ (void)eventWithData:(uint64_t)a3 dataVersion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "_CDSpotlightDeletionOperation unarchive error: %@", a5, a6, a7, a8, 2u);
}

- (void)serialize
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "_CDSpotlightDeletionOperation archive error: %@", a5, a6, a7, a8, 2u);
}

@end
