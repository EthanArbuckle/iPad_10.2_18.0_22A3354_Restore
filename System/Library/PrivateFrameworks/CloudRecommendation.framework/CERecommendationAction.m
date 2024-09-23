@implementation CERecommendationAction

- (CERecommendationAction)initWithIdentifier:(id)a3 actionTitle:(id)a4 actionType:(id)a5
{
  id v9;
  id v10;
  id v11;
  CERecommendationAction *v12;
  CERecommendationAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CERecommendationAction;
  v12 = -[CERecommendationAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionIdentifier, a3);
    objc_storeStrong((id *)&v13->_actionTitle, a4);
    objc_storeStrong((id *)&v13->_actionType, a5);
  }

  return v13;
}

- (CERecommendationAction)initWithDictionary:(id)a3
{
  id v4;
  CERecommendationAction *v5;
  void *v6;
  NSString *v7;
  NSObject *actionIdentifier;
  void *v9;
  NSString *v10;
  NSObject *actionTitle;
  void *v12;
  NSString *v13;
  NSObject *actionType;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CERecommendationAction;
  v5 = -[CERecommendationAction init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      actionIdentifier = v5->_actionIdentifier;
      v5->_actionIdentifier = v7;
    }
    else
    {
      _CELogSystem();
      actionIdentifier = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(actionIdentifier, OS_LOG_TYPE_DEBUG))
        -[CERecommendationAction initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      actionTitle = v5->_actionTitle;
      v5->_actionTitle = v10;
    }
    else
    {
      _CELogSystem();
      actionTitle = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(actionTitle, OS_LOG_TYPE_DEBUG))
        -[CERecommendationAction initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      actionType = v5->_actionType;
      v5->_actionType = v13;
    }
    else
    {
      _CELogSystem();
      actionType = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(actionType, OS_LOG_TYPE_DEBUG))
        -[CERecommendationAction initWithDictionary:].cold.1();
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *actionIdentifier;
  id v5;

  actionIdentifier = self->_actionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionTitle, CFSTR("actionTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionType, CFSTR("actionType"));

}

- (CERecommendationAction)initWithCoder:(id)a3
{
  id v4;
  CERecommendationAction *v5;
  uint64_t v6;
  NSString *actionIdentifier;
  uint64_t v8;
  NSString *actionTitle;
  uint64_t v10;
  NSString *actionType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CERecommendationAction;
  v5 = -[CERecommendationAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionTitle = v5->_actionTitle;
    v5->_actionTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionType"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionType = v5->_actionType;
    v5->_actionType = (NSString *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendationAction *v4;

  v4 = -[CERecommendationAction init](+[CERecommendationAction allocWithZone:](CERecommendationAction, "allocWithZone:", a3), "init");
  -[CERecommendationAction setActionIdentifier:](v4, "setActionIdentifier:", self->_actionIdentifier);
  -[CERecommendationAction setActionTitle:](v4, "setActionTitle:", self->_actionTitle);
  -[CERecommendationAction setActionType:](v4, "setActionType:", self->_actionType);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Action with id: %@, title: %@, actionType: %@"), self->_actionIdentifier, self->_actionTitle, self->_actionType);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse actionType from dictionary", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse actionTitle from dictionary", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse actionIdentifier from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
