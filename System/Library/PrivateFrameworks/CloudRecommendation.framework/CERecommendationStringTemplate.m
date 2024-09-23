@implementation CERecommendationStringTemplate

- (CERecommendationStringTemplate)initWithDictionary:(id)a3
{
  id v4;
  CERecommendationStringTemplate *v5;
  CERecommendationStringTemplate *v6;
  void *v7;
  NSDictionary *v8;
  NSObject *p_super;
  void *v10;
  NSDictionary *v11;
  NSObject *v12;
  void *v13;
  NSDictionary *v14;
  NSObject *v15;
  void *v16;
  NSDictionary *v17;
  NSObject *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CERecommendationStringTemplate;
  v5 = -[CERecommendationStringTemplate init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      p_super = &v6->_titleTemplates->super;
      v6->_titleTemplates = v8;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERecommendationStringTemplate initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      v12 = &v6->_subTitleTemplates->super;
      v6->_subTitleTemplates = v11;
    }
    else
    {
      _CELogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CERecommendationStringTemplate initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      v15 = &v6->_messageTemplates->super;
      v6->_messageTemplates = v14;
    }
    else
    {
      _CELogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[CERecommendationStringTemplate initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      v18 = &v6->_actionTitleTemplates->super;
      v6->_actionTitleTemplates = v17;
    }
    else
    {
      _CELogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CERecommendationStringTemplate initWithDictionary:].cold.1();
    }

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CERecommendationStringTemplate titleTemplates](self, "titleTemplates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationStringTemplate subTitleTemplates](self, "subTitleTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationStringTemplate messageTemplates](self, "messageTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CERecommendationStringTemplate actionTitleTemplates](self, "actionTitleTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("titleTemplates: %@, subTitleTemplates: %@, messageTemplates: %@, actionTitleTemplates: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendationStringTemplate *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *titleTemplates;
  void *v9;
  uint64_t v10;
  NSDictionary *subTitleTemplates;
  void *v12;
  uint64_t v13;
  NSDictionary *messageTemplates;
  void *v15;
  uint64_t v16;
  NSDictionary *actionTitleTemplates;

  v5 = objc_alloc_init(CERecommendationStringTemplate);
  v5->_lock._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(&v5->_lock);
  -[CERecommendationStringTemplate titleTemplates](self, "titleTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  titleTemplates = v5->_titleTemplates;
  v5->_titleTemplates = (NSDictionary *)v7;

  -[CERecommendationStringTemplate subTitleTemplates](self, "subTitleTemplates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  subTitleTemplates = v5->_subTitleTemplates;
  v5->_subTitleTemplates = (NSDictionary *)v10;

  -[CERecommendationStringTemplate messageTemplates](self, "messageTemplates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  messageTemplates = v5->_messageTemplates;
  v5->_messageTemplates = (NSDictionary *)v13;

  -[CERecommendationStringTemplate actionTitleTemplates](self, "actionTitleTemplates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  actionTitleTemplates = v5->_actionTitleTemplates;
  v5->_actionTitleTemplates = (NSDictionary *)v16;

  os_unfair_lock_unlock(&v5->_lock);
  return v5;
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
  id v8;

  v4 = a3;
  -[CERecommendationStringTemplate titleTemplates](self, "titleTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[CERecommendationStringTemplate subTitleTemplates](self, "subTitleTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[CERecommendationStringTemplate messageTemplates](self, "messageTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("message"));

  -[CERecommendationStringTemplate actionTitleTemplates](self, "actionTitleTemplates");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("actionTitle"));

}

- (CERecommendationStringTemplate)initWithCoder:(id)a3
{
  id v4;
  CERecommendationStringTemplate *v5;
  CERecommendationStringTemplate *v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *titleTemplates;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *subTitleTemplates;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *messageTemplates;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *actionTitleTemplates;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CERecommendationStringTemplate;
  v5 = -[CERecommendationStringTemplate init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v7, objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleTemplates = v6->_titleTemplates;
    v6->_titleTemplates = (NSDictionary *)v8;

    v10 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v10, objc_opt_class(), CFSTR("subtitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    subTitleTemplates = v6->_subTitleTemplates;
    v6->_subTitleTemplates = (NSDictionary *)v11;

    v13 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v13, objc_opt_class(), CFSTR("message"));
    v14 = objc_claimAutoreleasedReturnValue();
    messageTemplates = v6->_messageTemplates;
    v6->_messageTemplates = (NSDictionary *)v14;

    v16 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v16, objc_opt_class(), CFSTR("actionTitle"));
    v17 = objc_claimAutoreleasedReturnValue();
    actionTitleTemplates = v6->_actionTitleTemplates;
    v6->_actionTitleTemplates = (NSDictionary *)v17;

  }
  return v6;
}

- (NSDictionary)titleTemplates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_titleTemplates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSDictionary)subTitleTemplates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_subTitleTemplates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSDictionary)messageTemplates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_messageTemplates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSDictionary)actionTitleTemplates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_actionTitleTemplates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (id)titleTemplateForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSDictionary valueForKey:](self->_titleTemplates, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)subTitleTemplateForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSDictionary valueForKey:](self->_subTitleTemplates, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)messageTemplateForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSDictionary valueForKey:](self->_messageTemplates, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)actionTitleTemplateForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSDictionary valueForKey:](self->_actionTitleTemplates, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setTitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_titleTemplates, a3);
}

- (void)setSubTitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleTemplates, a3);
}

- (void)setMessageTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_messageTemplates, a3);
}

- (void)setActionTitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_actionTitleTemplates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTitleTemplates, 0);
  objc_storeStrong((id *)&self->_messageTemplates, 0);
  objc_storeStrong((id *)&self->_subTitleTemplates, 0);
  objc_storeStrong((id *)&self->_titleTemplates, 0);
}

- (void)initWithDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Could not find actionTitleTemplates in dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Could not find messageTemplates in dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Could not find subTitleTemplates in dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_2380DF000, v0, v1, "Could not find titleTemplates in dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
