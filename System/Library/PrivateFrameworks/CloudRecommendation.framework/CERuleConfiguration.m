@implementation CERuleConfiguration

- (CERuleConfiguration)initWithDictionary:(id)a3
{
  id v4;
  CERuleConfiguration *v5;
  CERuleConfiguration *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *p_super;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSNumber *v20;
  NSObject *v21;
  void *v22;
  NSDictionary *v23;
  NSObject *v24;
  void *v25;
  CERecommendationInfo *v26;
  NSObject *v27;
  void *v28;
  id v29;
  CERuleConfiguration *v30;
  NSObject *v31;
  uint64_t v32;
  NSArray *ruleset;
  void *v35;
  void *v36;
  _QWORD v37[4];
  CERuleConfiguration *v38;
  id v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CERuleConfiguration;
  v5 = -[CERuleConfiguration init](&v40, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayUrl"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = (void *)v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      p_super = &v6->_displayURL->super;
      v6->_displayURL = (NSURL *)v8;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERuleConfiguration initWithDictionary:].cold.8();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissUrl"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = (void *)v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10, v10, v36);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = &v6->_dismissURL->super;
      v6->_dismissURL = (NSURL *)v11;
    }
    else
    {
      _CELogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CERuleConfiguration initWithDictionary:].cold.7();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionUrl"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = &v6->_actionURL->super;
      v6->_actionURL = (NSURL *)v14;
    }
    else
    {
      _CELogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CERuleConfiguration initWithDictionary:].cold.6((uint64_t)v6, v15);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedUrl"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = &v6->_completedURL->super;
      v6->_completedURL = (NSURL *)v17;
    }
    else
    {
      _CELogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CERuleConfiguration initWithDictionary:].cold.5();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxTipsShown"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;
      v21 = &v6->_maxRecommendationsToShow->super.super;
      v6->_maxRecommendationsToShow = v20;
    }
    else
    {
      _CELogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thresholds"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
      v24 = &v6->_thresholds->super;
      v6->_thresholds = v23;
    }
    else
    {
      _CELogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[CERuleConfiguration initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendationsInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[CERecommendationInfo initWithDictionary:]([CERecommendationInfo alloc], "initWithDictionary:", v25);
      v27 = &v6->_recommendationInfo->super;
      v6->_recommendationInfo = v26;
    }
    else
    {
      _CELogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[CERuleConfiguration initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ruleset"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __42__CERuleConfiguration_initWithDictionary___block_invoke;
      v37[3] = &unk_2509E0928;
      v30 = v6;
      v38 = v30;
      v39 = v29;
      v31 = v29;
      objc_msgSend(v28, "enumerateObjectsUsingBlock:", v37);
      v32 = -[NSObject copy](v31, "copy");
      ruleset = v30->_ruleset;
      v30->_ruleset = (NSArray *)v32;

    }
    else
    {
      _CELogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[CERuleConfiguration initWithDictionary:].cold.1();
    }

  }
  return v6;
}

void __42__CERuleConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  CERuleset *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[CERuleset initWithDictionary:]([CERuleset alloc], "initWithDictionary:", v4);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else
  {
    _CELogSystem();
    v5 = (CERuleset *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
      __42__CERuleConfiguration_initWithDictionary___block_invoke_cold_1();
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
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CERuleConfiguration displayURL](self, "displayURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayURL"));

  -[CERuleConfiguration dismissURL](self, "dismissURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dismissURL"));

  -[CERuleConfiguration completedURL](self, "completedURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("completedURL"));

  -[CERuleConfiguration actionURL](self, "actionURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("actionURL"));

  -[CERuleConfiguration maxRecommendationsToShow](self, "maxRecommendationsToShow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("maxRecommendationsToShow"));

  -[CERuleConfiguration thresholds](self, "thresholds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("thresholds"));

  -[CERuleConfiguration ruleset](self, "ruleset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("ruleset"));

  -[CERuleConfiguration recommendationInfo](self, "recommendationInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("recommendationsInfo"));

}

- (CERuleConfiguration)initWithCoder:(id)a3
{
  id v4;
  CERuleConfiguration *v5;
  CERuleConfiguration *v6;
  uint64_t v7;
  NSURL *displayURL;
  uint64_t v9;
  NSURL *dismissURL;
  uint64_t v11;
  NSURL *completedURL;
  uint64_t v13;
  NSURL *actionURL;
  uint64_t v15;
  NSNumber *maxRecommendationsToShow;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *thresholds;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *ruleset;
  uint64_t v27;
  CERecommendationInfo *recommendationInfo;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CERuleConfiguration;
  v5 = -[CERuleConfiguration init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    displayURL = v6->_displayURL;
    v6->_displayURL = (NSURL *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismissURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    dismissURL = v6->_dismissURL;
    v6->_dismissURL = (NSURL *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completedURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    completedURL = v6->_completedURL;
    v6->_completedURL = (NSURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    actionURL = v6->_actionURL;
    v6->_actionURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxRecommendationsToShow"));
    v15 = objc_claimAutoreleasedReturnValue();
    maxRecommendationsToShow = v6->_maxRecommendationsToShow;
    v6->_maxRecommendationsToShow = (NSNumber *)v15;

    v17 = (void *)MEMORY[0x24BDBCF20];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("thresholds"));
    v20 = objc_claimAutoreleasedReturnValue();
    thresholds = v6->_thresholds;
    v6->_thresholds = (NSDictionary *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("ruleset"));
    v25 = objc_claimAutoreleasedReturnValue();
    ruleset = v6->_ruleset;
    v6->_ruleset = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recommendationsInfo"));
    v27 = objc_claimAutoreleasedReturnValue();
    recommendationInfo = v6->_recommendationInfo;
    v6->_recommendationInfo = (CERecommendationInfo *)v27;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERuleConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *thresholds;
  void *v14;
  uint64_t v15;
  NSArray *ruleset;

  v5 = -[CERuleConfiguration init](+[CERuleConfiguration allocWithZone:](CERuleConfiguration, "allocWithZone:"), "init");
  v5->_lock._os_unfair_lock_opaque = 0;
  -[CERuleConfiguration displayURL](self, "displayURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration setDisplayURL:](v5, "setDisplayURL:", v6);

  -[CERuleConfiguration dismissURL](self, "dismissURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration setDismissURL:](v5, "setDismissURL:", v7);

  -[CERuleConfiguration completedURL](self, "completedURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration setCompletedURL:](v5, "setCompletedURL:", v8);

  -[CERuleConfiguration actionURL](self, "actionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration setActionURL:](v5, "setActionURL:", v9);

  -[CERuleConfiguration maxRecommendationsToShow](self, "maxRecommendationsToShow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration setMaxRecommendationsToShow:](v5, "setMaxRecommendationsToShow:", v10);

  -[CERuleConfiguration recommendationInfo](self, "recommendationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration setRecommendationInfo:](v5, "setRecommendationInfo:", v11);

  os_unfair_lock_lock(&v5->_lock);
  -[CERuleConfiguration thresholds](self, "thresholds");
  v12 = objc_claimAutoreleasedReturnValue();
  thresholds = v5->_thresholds;
  v5->_thresholds = (NSDictionary *)v12;

  -[CERuleConfiguration ruleset](self, "ruleset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copyWithZone:", a3);
  ruleset = v5->_ruleset;
  v5->_ruleset = (NSArray *)v15;

  os_unfair_lock_unlock(&v5->_lock);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CERuleConfiguration displayURL](self, "displayURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration dismissURL](self, "dismissURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration completedURL](self, "completedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration actionURL](self, "actionURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration maxRecommendationsToShow](self, "maxRecommendationsToShow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration thresholds](self, "thresholds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration ruleset](self, "ruleset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERuleConfiguration recommendationInfo](self, "recommendationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Rule configuration with displayURL: %@, dismissURL: %@, completedURL: %@, actionURL: %@, maxRecommendations: %@, thresholds: %@, ruleset: %@, recommendationInfo: %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURL)displayURL
{
  os_unfair_lock_s *p_lock;
  NSURL *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_displayURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)dismissURL
{
  os_unfair_lock_s *p_lock;
  NSURL *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_dismissURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)completedURL
{
  os_unfair_lock_s *p_lock;
  NSURL *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_completedURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)actionURL
{
  os_unfair_lock_s *p_lock;
  NSURL *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_actionURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maxRecommendationsToShow
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_maxRecommendationsToShow;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)thresholds
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_thresholds;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)ruleset
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_ruleset, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)thresholdForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSDictionary valueForKey:](self->_thresholds, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (CERecommendationInfo)recommendationInfo
{
  os_unfair_lock_s *p_lock;
  CERecommendationInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_recommendationInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDisplayURL:(id)a3
{
  NSURL *v4;
  NSURL *displayURL;

  v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  displayURL = self->_displayURL;
  self->_displayURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDismissURL:(id)a3
{
  NSURL *v4;
  NSURL *dismissURL;

  v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  dismissURL = self->_dismissURL;
  self->_dismissURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCompletedURL:(id)a3
{
  NSURL *v4;
  NSURL *completedURL;

  v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  completedURL = self->_completedURL;
  self->_completedURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setActionURL:(id)a3
{
  NSURL *v4;
  NSURL *actionURL;

  v4 = (NSURL *)a3;
  os_unfair_lock_lock(&self->_lock);
  actionURL = self->_actionURL;
  self->_actionURL = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxRecommendationsToShow:(id)a3
{
  NSNumber *v4;
  NSNumber *maxRecommendationsToShow;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  maxRecommendationsToShow = self->_maxRecommendationsToShow;
  self->_maxRecommendationsToShow = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRecommendationInfo:(id)a3
{
  CERecommendationInfo *v4;
  CERecommendationInfo *recommendationInfo;

  v4 = (CERecommendationInfo *)a3;
  os_unfair_lock_lock(&self->_lock);
  recommendationInfo = self->_recommendationInfo;
  self->_recommendationInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_thresholds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationInfo, 0);
  objc_storeStrong((id *)&self->_ruleset, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_maxRecommendationsToShow, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_completedURL, 0);
  objc_storeStrong((id *)&self->_dismissURL, 0);
  objc_storeStrong((id *)&self->_displayURL, 0);
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (id)OUTLINED_FUNCTION_3();
  v2 = (void *)OUTLINED_FUNCTION_5_0();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_1(&dword_2380DF000, v4, v5, "%@ Expected ruleset to be of type array but found: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse recommendationInfo from rules response", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse thresholds from dictionary", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse completedURL from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint8_t v5[24];

  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_1(v3);
  _os_log_error_impl(&dword_2380DF000, a2, OS_LOG_TYPE_ERROR, "%@ Unable to parse actionURL from dictionary", v5, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse dismissURL from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse displayURL from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __42__CERuleConfiguration_initWithDictionary___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (id)objc_opt_class();
  v2 = (void *)OUTLINED_FUNCTION_5_0();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_1(&dword_2380DF000, v4, v5, "%@ Expected rule to be of type dictionary but found: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

@end
