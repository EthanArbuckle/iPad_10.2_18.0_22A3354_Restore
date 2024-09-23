@implementation CERecommendationRule

- (CERecommendationRule)initWithDictionary:(id)a3
{
  id v4;
  CERecommendationRule *v5;
  CERecommendationRule *v6;
  void *v7;
  NSString *v8;
  NSObject *recommendationID;
  void *v10;
  NSString *v11;
  NSObject *bundleID;
  void *v13;
  NSString *v14;
  NSObject *titleHint;
  void *v16;
  NSString *v17;
  NSObject *messageHint;
  void *v19;
  NSNumber *v20;
  NSObject *p_super;
  void *v22;
  NSNumber *v23;
  NSObject *v24;
  void *v25;
  char v26;
  CERuleCriteria *v27;
  void *v28;
  CERuleCriteria *v29;
  CERuleCriteria *v30;
  NSObject *v31;
  CERecommendationStringTemplate *v32;
  CERecommendationStringTemplate *v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSArray *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *context;
  NSObject *v45;
  CERecommendationStringTemplate *v47;
  void *v48;
  CERuleCriteria *v49;
  void *v50;
  _QWORD v51[4];
  NSArray *v52;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)CERecommendationRule;
  v5 = -[CERecommendationRule init](&v53, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendationID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      recommendationID = v6->_recommendationID;
      v6->_recommendationID = v8;
    }
    else
    {
      _CELogSystem();
      recommendationID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(recommendationID, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.9();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      bundleID = v6->_bundleID;
      v6->_bundleID = v11;
    }
    else
    {
      _CELogSystem();
      bundleID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(bundleID, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.8();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleHint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      titleHint = v6->_titleHint;
      v6->_titleHint = v14;
    }
    else
    {
      _CELogSystem();
      titleHint = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(titleHint, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.7();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageHint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      messageHint = v6->_messageHint;
      v6->_messageHint = v17;
    }
    else
    {
      _CELogSystem();
      messageHint = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(messageHint, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.6();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankingHint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;
      p_super = &v6->_rankingHint->super.super;
      v6->_rankingHint = v20;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.5();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastCompletedTimestamp"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
      v24 = &v6->_lastCompletedTimeStamp->super.super;
      v6->_lastCompletedTimeStamp = v23;
    }
    else
    {
      _CELogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ignoreClientRank"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    v6->_ignoreClientRank = v26;
    v27 = [CERuleCriteria alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("criteria"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[CERuleCriteria initWithDictionary:](v27, "initWithDictionary:", v28);

    objc_opt_class();
    v49 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v29;
      v31 = &v6->_criteria->super;
      v6->_criteria = v30;
    }
    else
    {
      _CELogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("templates"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[CERecommendationStringTemplate initWithDictionary:]([CERecommendationStringTemplate alloc], "initWithDictionary:", v48);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v32;
      v34 = &v6->_templates->super;
      v6->_templates = v33;
    }
    else
    {
      _CELogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __43__CERecommendationRule_initWithDictionary___block_invoke;
      v51[3] = &unk_2509E06B0;
      v37 = (NSArray *)v36;
      v52 = v37;
      objc_msgSend(v35, "enumerateObjectsUsingBlock:", v51);
      v38 = v4;
      v39 = v19;
      v40 = v16;
      v41 = v13;
      v42 = v10;
      v43 = v7;
      context = v6->_context;
      v6->_context = v37;
      v45 = v37;

      v7 = v43;
      v10 = v42;
      v13 = v41;
      v16 = v40;
      v19 = v39;
      v4 = v38;

    }
    else
    {
      _CELogSystem();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[CERecommendationRule initWithDictionary:].cold.1();
    }

  }
  return v6;
}

void __43__CERecommendationRule_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

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
  void *v12;
  id v13;

  v4 = a3;
  -[CERecommendationRule recommendationID](self, "recommendationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("recommendationID"));

  -[CERecommendationRule bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  -[CERecommendationRule titleHint](self, "titleHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("titleHint"));

  -[CERecommendationRule messageHint](self, "messageHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("messageHint"));

  -[CERecommendationRule rankingHint](self, "rankingHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("rankingHint"));

  -[CERecommendationRule lastCompletedTimeStamp](self, "lastCompletedTimeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lastCompletedTimeStamp"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CERecommendationRule ignoreClientRank](self, "ignoreClientRank"), CFSTR("ignoreClientRank"));
  -[CERecommendationRule criteria](self, "criteria");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("criteria"));

  -[CERecommendationRule templates](self, "templates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("templates"));

  -[CERecommendationRule context](self, "context");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("context"));

}

- (CERecommendationRule)initWithCoder:(id)a3
{
  id v4;
  CERecommendationRule *v5;
  CERecommendationRule *v6;
  uint64_t v7;
  NSString *recommendationID;
  uint64_t v9;
  NSString *bundleID;
  uint64_t v11;
  NSString *titleHint;
  uint64_t v13;
  NSString *messageHint;
  uint64_t v15;
  NSNumber *rankingHint;
  uint64_t v17;
  NSNumber *lastCompletedTimeStamp;
  uint64_t v19;
  CERuleCriteria *criteria;
  uint64_t v21;
  CERecommendationStringTemplate *templates;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *context;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CERecommendationRule;
  v5 = -[CERecommendationRule init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recommendationID"));
    v7 = objc_claimAutoreleasedReturnValue();
    recommendationID = v6->_recommendationID;
    v6->_recommendationID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleHint"));
    v11 = objc_claimAutoreleasedReturnValue();
    titleHint = v6->_titleHint;
    v6->_titleHint = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageHint"));
    v13 = objc_claimAutoreleasedReturnValue();
    messageHint = v6->_messageHint;
    v6->_messageHint = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rankingHint"));
    v15 = objc_claimAutoreleasedReturnValue();
    rankingHint = v6->_rankingHint;
    v6->_rankingHint = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastCompletedTimeStamp"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastCompletedTimeStamp = v6->_lastCompletedTimeStamp;
    v6->_lastCompletedTimeStamp = (NSNumber *)v17;

    v6->_ignoreClientRank = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreClientRank"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criteria"));
    v19 = objc_claimAutoreleasedReturnValue();
    criteria = v6->_criteria;
    v6->_criteria = (CERuleCriteria *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templates"));
    v21 = objc_claimAutoreleasedReturnValue();
    templates = v6->_templates;
    v6->_templates = (CERecommendationStringTemplate *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("context"));
    v26 = objc_claimAutoreleasedReturnValue();
    context = v6->_context;
    v6->_context = (NSArray *)v26;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendationRule *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = -[CERecommendationRule init](+[CERecommendationRule allocWithZone:](CERecommendationRule, "allocWithZone:"), "init");
  v5->_lock._os_unfair_lock_opaque = 0;
  -[CERecommendationRule recommendationID](self, "recommendationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule setRecommendationID:](v5, "setRecommendationID:", v6);

  -[CERecommendationRule bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule setBundleID:](v5, "setBundleID:", v7);

  -[CERecommendationRule titleHint](self, "titleHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule setTitleHint:](v5, "setTitleHint:", v8);

  -[CERecommendationRule messageHint](self, "messageHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule setMessageHint:](v5, "setMessageHint:", v9);

  -[CERecommendationRule rankingHint](self, "rankingHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule setRankingHint:](v5, "setRankingHint:", v10);

  -[CERecommendationRule lastCompletedTimeStamp](self, "lastCompletedTimeStamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule setLastCompletedTimeStamp:](v5, "setLastCompletedTimeStamp:", v11);

  -[CERecommendationRule setIgnoreClientRank:](v5, "setIgnoreClientRank:", -[CERecommendationRule ignoreClientRank](self, "ignoreClientRank"));
  -[CERecommendationRule criteria](self, "criteria");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[CERecommendationRule setCriteria:](v5, "setCriteria:", v13);

  -[CERecommendationRule templates](self, "templates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[CERecommendationRule setTemplates:](v5, "setTemplates:", v15);

  -[CERecommendationRule context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[CERecommendationRule setContext:](v5, "setContext:", v17);

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
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[CERecommendationRule recommendationID](self, "recommendationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule titleHint](self, "titleHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule messageHint](self, "messageHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule rankingHint](self, "rankingHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule lastCompletedTimeStamp](self, "lastCompletedTimeStamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CERecommendationRule ignoreClientRank](self, "ignoreClientRank");
  -[CERecommendationRule criteria](self, "criteria");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule templates](self, "templates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationRule context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Recommendation Rule with id: %@, bundleID: %@, titleHint: %@, messageHint: %@, rankingHint: %@, lastCompletedTimestamp: %@, ignoreClientRank: %d, criteria: %@, templates: %@, context: %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)titleHint
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_titleHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)messageHint
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_messageHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)rankingHint
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_rankingHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)recommendationID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_recommendationID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)bundleID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_bundleID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)ignoreClientRank
{
  CERecommendationRule *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_ignoreClientRank;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSNumber)lastCompletedTimeStamp
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastCompletedTimeStamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CERuleCriteria)criteria
{
  os_unfair_lock_s *p_lock;
  CERuleCriteria *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_criteria;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CERecommendationStringTemplate)templates
{
  os_unfair_lock_s *p_lock;
  CERecommendationStringTemplate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_templates;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)context
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTitleHint:(id)a3
{
  NSString *v4;
  NSString *titleHint;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  titleHint = self->_titleHint;
  self->_titleHint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMessageHint:(id)a3
{
  NSString *v4;
  NSString *messageHint;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  messageHint = self->_messageHint;
  self->_messageHint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRankingHint:(id)a3
{
  NSNumber *v4;
  NSNumber *rankingHint;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  rankingHint = self->_rankingHint;
  self->_rankingHint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRecommendationID:(id)a3
{
  NSString *v4;
  NSString *recommendationID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  recommendationID = self->_recommendationID;
  self->_recommendationID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setBundleID:(id)a3
{
  NSString *v4;
  NSString *bundleID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  bundleID = self->_bundleID;
  self->_bundleID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIgnoreClientRank:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ignoreClientRank = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setLastCompletedTimeStamp:(id)a3
{
  NSNumber *v4;
  NSNumber *lastCompletedTimeStamp;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  lastCompletedTimeStamp = self->_lastCompletedTimeStamp;
  self->_lastCompletedTimeStamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCriteria:(id)a3
{
  CERuleCriteria *v4;
  CERuleCriteria *criteria;

  v4 = (CERuleCriteria *)a3;
  os_unfair_lock_lock(&self->_lock);
  criteria = self->_criteria;
  self->_criteria = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setTemplates:(id)a3
{
  CERecommendationStringTemplate *v4;
  CERecommendationStringTemplate *templates;

  v4 = (CERecommendationStringTemplate *)a3;
  os_unfair_lock_lock(&self->_lock);
  templates = self->_templates;
  self->_templates = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  NSArray *v4;
  NSArray *context;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_lastCompletedTimeStamp, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_recommendationID, 0);
  objc_storeStrong((id *)&self->_rankingHint, 0);
  objc_storeStrong((id *)&self->_messageHint, 0);
  objc_storeStrong((id *)&self->_titleHint, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse context array from Recommendation Rule.", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse templates dictionary from Recommendation Rule.", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse criteria from dictionary.", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse lastCompletedTimestamp from dictionary.", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse rankingHint from dictionary.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse messageHint from dictionary.", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse titleHint from dictionary.", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse bundleID from dictionary.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse recommendationID from dictionary.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
