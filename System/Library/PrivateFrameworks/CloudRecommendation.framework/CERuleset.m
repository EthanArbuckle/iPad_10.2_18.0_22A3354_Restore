@implementation CERuleset

- (CERuleset)initWithDictionary:(id)a3
{
  id v4;
  CERuleset *v5;
  CERuleset *v6;
  void *v7;
  NSString *v8;
  NSObject *sectionID;
  void *v10;
  NSNumber *v11;
  NSObject *p_super;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *context;
  NSObject *v19;
  void *v20;
  NSArray *v21;
  NSArray *recommendationRules;
  NSObject *v23;
  void *v24;
  NSString *v25;
  NSObject *userType;
  _QWORD v28[4];
  NSArray *v29;
  _QWORD v30[4];
  NSArray *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CERuleset;
  v5 = -[CERuleset init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      sectionID = v6->_sectionID;
      v6->_sectionID = v8;
    }
    else
    {
      _CELogSystem();
      sectionID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(sectionID, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.5();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxRecommendations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      p_super = &v6->_maxRecommendations->super.super;
      v6->_maxRecommendations = v11;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ignoreClientSectionRank"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    v6->_ignoreClientSectionRank = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __32__CERuleset_initWithDictionary___block_invoke;
      v30[3] = &unk_2509E06B0;
      v17 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v31 = v17;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v30);
      context = v6->_context;
      v6->_context = v17;
      v19 = v17;

    }
    else
    {
      v16 = MEMORY[0x24BDAC760];
      _CELogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendations"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __32__CERuleset_initWithDictionary___block_invoke_15;
      v28[3] = &unk_2509E06B0;
      v21 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v29 = v21;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v28);
      recommendationRules = v6->_recommendationRules;
      v6->_recommendationRules = v21;
      v23 = v21;

    }
    else
    {
      _CELogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v24;
      userType = v6->_userType;
      v6->_userType = v25;
    }
    else
    {
      _CELogSystem();
      userType = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(userType, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.1();
    }

  }
  return v6;
}

void __32__CERuleset_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __32__CERuleset_initWithDictionary___block_invoke_15(uint64_t a1, void *a2)
{
  CERecommendationRule *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[CERecommendationRule initWithDictionary:]([CERecommendationRule alloc], "initWithDictionary:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CERuleset sectionID](self, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sectionID"));

  -[CERuleset maxRecommendations](self, "maxRecommendations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxRecommendations"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CERuleset ignoreClientSectionRank](self, "ignoreClientSectionRank"), CFSTR("ignoreClientSectionRank"));
  -[CERuleset context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("context"));

  -[CERuleset recommendationRules](self, "recommendationRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("recommendationRules"));

  -[CERuleset userType](self, "userType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userType"));

}

- (CERuleset)initWithCoder:(id)a3
{
  id v4;
  CERuleset *v5;
  CERuleset *v6;
  uint64_t v7;
  NSString *sectionID;
  uint64_t v9;
  NSNumber *maxRecommendations;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *context;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *recommendationRules;
  uint64_t v21;
  NSString *userType;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CERuleset;
  v5 = -[CERuleset init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionID"));
    v7 = objc_claimAutoreleasedReturnValue();
    sectionID = v6->_sectionID;
    v6->_sectionID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxRecommendations"));
    v9 = objc_claimAutoreleasedReturnValue();
    maxRecommendations = v6->_maxRecommendations;
    v6->_maxRecommendations = (NSNumber *)v9;

    v6->_ignoreClientSectionRank = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreClientSectionRank"));
    v11 = (void *)MEMORY[0x24BDBCF20];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("context"));
    v14 = objc_claimAutoreleasedReturnValue();
    context = v6->_context;
    v6->_context = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("recommendationRules"));
    v19 = objc_claimAutoreleasedReturnValue();
    recommendationRules = v6->_recommendationRules;
    v6->_recommendationRules = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userType"));
    v21 = objc_claimAutoreleasedReturnValue();
    userType = v6->_userType;
    v6->_userType = (NSString *)v21;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERuleset *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *context;
  void *v11;
  uint64_t v12;
  NSArray *recommendationRules;

  v5 = -[CERuleset init](+[CERuleset allocWithZone:](CERuleset, "allocWithZone:"), "init");
  v5->_lock._os_unfair_lock_opaque = 0;
  -[CERuleset sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleset setSectionID:](v5, "setSectionID:", v6);

  -[CERuleset maxRecommendations](self, "maxRecommendations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleset setMaxRecommendations:](v5, "setMaxRecommendations:", v7);

  -[CERuleset setIgnoreClientSectionRank:](v5, "setIgnoreClientSectionRank:", -[CERuleset ignoreClientSectionRank](self, "ignoreClientSectionRank"));
  -[CERuleset userType](self, "userType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleset setUserType:](v5, "setUserType:", v8);

  os_unfair_lock_lock(&v5->_lock);
  -[CERuleset context](self, "context");
  v9 = objc_claimAutoreleasedReturnValue();
  context = v5->_context;
  v5->_context = (NSArray *)v9;

  -[CERuleset recommendationRules](self, "recommendationRules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copyWithZone:", a3);
  recommendationRules = v5->_recommendationRules;
  v5->_recommendationRules = (NSArray *)v12;

  os_unfair_lock_unlock(&v5->_lock);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CERuleset sectionID](self, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleset maxRecommendations](self, "maxRecommendations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CERuleset ignoreClientSectionRank](self, "ignoreClientSectionRank");
  -[CERuleset context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleset recommendationRules](self, "recommendationRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleset userType](self, "userType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Ruleset with sectionID: %@, maxRecommendations: %@, ignoreClientSectionRank: %d, context: %@, rules: %@, userType: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)sectionID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sectionID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maxRecommendations
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_maxRecommendations;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)ignoreClientSectionRank
{
  CERuleset *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_ignoreClientSectionRank;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)context
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_context, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)userType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)recommendationRules
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_recommendationRules, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setSectionID:(id)a3
{
  NSString *v4;
  NSString *sectionID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  sectionID = self->_sectionID;
  self->_sectionID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxRecommendations:(id)a3
{
  NSNumber *v4;
  NSNumber *maxRecommendations;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  maxRecommendations = self->_maxRecommendations;
  self->_maxRecommendations = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIgnoreClientSectionRank:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ignoreClientSectionRank = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setUserType:(id)a3
{
  NSString *v4;
  NSString *userType;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  userType = self->_userType;
  self->_userType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)sortRecommendationRulesUsingComparator:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSArray *v6;
  NSArray *recommendationRules;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSArray sortedArrayUsingComparator:](self->_recommendationRules, "sortedArrayUsingComparator:", v5);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

  recommendationRules = self->_recommendationRules;
  self->_recommendationRules = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationRules, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_maxRecommendations, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse userType from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse rules from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse context from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse maxRecommendations from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.5()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse sectionID from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
