@implementation CEURLRecommendationAction

- (CEURLRecommendationAction)initWithIdentifier:(id)a3 actionType:(id)a4 title:(id)a5 actionURL:(id)a6
{
  id v11;
  CEURLRecommendationAction *v12;
  CEURLRecommendationAction *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CEURLRecommendationAction;
  v12 = -[CERecommendationAction initWithIdentifier:actionTitle:actionType:](&v15, sel_initWithIdentifier_actionTitle_actionType_, a3, a5, a4);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_actionURL, a6);

  return v13;
}

- (CEURLRecommendationAction)initWithDictionary:(id)a3
{
  id v4;
  CEURLRecommendationAction *v5;
  void *v6;
  uint64_t v7;
  NSObject *p_super;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEURLRecommendationAction;
  v5 = -[CERecommendationAction initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      p_super = &v5->_actionURL->super;
      v5->_actionURL = (NSURL *)v7;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CEURLRecommendationAction initWithDictionary:].cold.1();
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
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CEURLRecommendationAction;
  v4 = a3;
  -[CERecommendationAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"), v5.receiver, v5.super_class);

}

- (CEURLRecommendationAction)initWithCoder:(id)a3
{
  id v4;
  CEURLRecommendationAction *v5;
  uint64_t v6;
  NSURL *actionURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CEURLRecommendationAction;
  v5 = -[CERecommendationAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEURLRecommendationAction;
  v4 = -[CERecommendationAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setActionURL:", self->_actionURL);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEURLRecommendationAction;
  -[CERecommendationAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" actionURL: %@"), self->_actionURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse url from dictionary.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
