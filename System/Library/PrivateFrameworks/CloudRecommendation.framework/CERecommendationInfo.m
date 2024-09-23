@implementation CERecommendationInfo

- (CERecommendationInfo)initWithDictionary:(id)a3
{
  id v4;
  CERecommendationInfo *v5;
  void *v6;
  NSString *v7;
  NSObject *recommendationSpecifierTitle;
  void *v9;
  NSString *v10;
  NSObject *recommendationSpecifierSubtitle;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSDictionary *v19;
  NSObject *p_super;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CERecommendationInfo;
  v5 = -[CERecommendationInfo init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      recommendationSpecifierTitle = v5->_recommendationSpecifierTitle;
      v5->_recommendationSpecifierTitle = v7;
    }
    else
    {
      _CELogSystem();
      recommendationSpecifierTitle = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(recommendationSpecifierTitle, OS_LOG_TYPE_ERROR))
        -[CERecommendationInfo initWithDictionary:].cold.6();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      recommendationSpecifierSubtitle = v5->_recommendationSpecifierSubtitle;
      v5->_recommendationSpecifierSubtitle = v10;
    }
    else
    {
      _CELogSystem();
      recommendationSpecifierSubtitle = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(recommendationSpecifierSubtitle, OS_LOG_TYPE_ERROR))
        -[CERecommendationInfo initWithDictionary:].cold.5();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendationsUrl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_storeStrong((id *)&v5->_serverRecommendationsURL, v13);
    }
    else
    {
      _CELogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CERecommendationInfo initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendationRulesUrl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_storeStrong((id *)&v5->_serverRulesURL, v15);
    }
    else
    {
      _CELogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CERecommendationInfo initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedRecommendationsUrl"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_storeStrong((id *)&v5->_completedRecommendationsURL, v17);
    }
    else
    {
      _CELogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CERecommendationInfo initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitleTemplates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
      p_super = &v5->_subtitleTemplates->super;
      v5->_subtitleTemplates = v19;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[CERecommendationInfo initWithDictionary:].cold.1();
    }

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("title: %@, subtitle: %@, recommendationsURL: %@, rulesURL: %@, completedRecommendationsURL: %@, subtitleTemplates: %@"), self->_recommendationSpecifierTitle, self->_recommendationSpecifierSubtitle, self->_serverRecommendationsURL, self->_serverRulesURL, self->_completedRecommendationsURL, self->_subtitleTemplates);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendationInfo *v4;

  v4 = objc_alloc_init(CERecommendationInfo);
  -[CERecommendationInfo setRecommendationSpecifierTitle:](v4, "setRecommendationSpecifierTitle:", self->_recommendationSpecifierTitle);
  -[CERecommendationInfo setRecommendationSpecifierSubtitle:](v4, "setRecommendationSpecifierSubtitle:", self->_recommendationSpecifierSubtitle);
  -[CERecommendationInfo setServerRecommendationsURL:](v4, "setServerRecommendationsURL:", self->_serverRecommendationsURL);
  -[CERecommendationInfo setServerRulesURL:](v4, "setServerRulesURL:", self->_serverRulesURL);
  -[CERecommendationInfo setCompletedRecommendationsURL:](v4, "setCompletedRecommendationsURL:", self->_completedRecommendationsURL);
  -[CERecommendationInfo setSubtitleTemplates:](v4, "setSubtitleTemplates:", self->_subtitleTemplates);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *recommendationSpecifierTitle;
  id v5;

  recommendationSpecifierTitle = self->_recommendationSpecifierTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recommendationSpecifierTitle, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recommendationSpecifierSubtitle, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverRecommendationsURL, CFSTR("recommendationsUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverRulesURL, CFSTR("recommendationRulesUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completedRecommendationsURL, CFSTR("completedRecommendationsUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleTemplates, CFSTR("subtitleTemplates"));

}

- (CERecommendationInfo)initWithCoder:(id)a3
{
  id v4;
  CERecommendationInfo *v5;
  uint64_t v6;
  NSString *recommendationSpecifierTitle;
  uint64_t v8;
  NSString *recommendationSpecifierSubtitle;
  uint64_t v10;
  NSURL *serverRecommendationsURL;
  uint64_t v12;
  NSURL *serverRulesURL;
  uint64_t v14;
  NSURL *completedRecommendationsURL;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *subtitleTemplates;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CERecommendationInfo;
  v5 = -[CERecommendationInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    recommendationSpecifierTitle = v5->_recommendationSpecifierTitle;
    v5->_recommendationSpecifierTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = objc_claimAutoreleasedReturnValue();
    recommendationSpecifierSubtitle = v5->_recommendationSpecifierSubtitle;
    v5->_recommendationSpecifierSubtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recommendationsUrl"));
    v10 = objc_claimAutoreleasedReturnValue();
    serverRecommendationsURL = v5->_serverRecommendationsURL;
    v5->_serverRecommendationsURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recommendationRulesUrl"));
    v12 = objc_claimAutoreleasedReturnValue();
    serverRulesURL = v5->_serverRulesURL;
    v5->_serverRulesURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completedRecommendationsUrl"));
    v14 = objc_claimAutoreleasedReturnValue();
    completedRecommendationsURL = v5->_completedRecommendationsURL;
    v5->_completedRecommendationsURL = (NSURL *)v14;

    v16 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v16, objc_opt_class(), CFSTR("subtitleTemplates"));
    v17 = objc_claimAutoreleasedReturnValue();
    subtitleTemplates = v5->_subtitleTemplates;
    v5->_subtitleTemplates = (NSDictionary *)v17;

  }
  return v5;
}

- (NSString)recommendationSpecifierTitle
{
  return self->_recommendationSpecifierTitle;
}

- (void)setRecommendationSpecifierTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)recommendationSpecifierSubtitle
{
  return self->_recommendationSpecifierSubtitle;
}

- (void)setRecommendationSpecifierSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)serverRecommendationsURL
{
  return self->_serverRecommendationsURL;
}

- (void)setServerRecommendationsURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverRecommendationsURL, a3);
}

- (NSURL)serverRulesURL
{
  return self->_serverRulesURL;
}

- (void)setServerRulesURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverRulesURL, a3);
}

- (NSURL)completedRecommendationsURL
{
  return self->_completedRecommendationsURL;
}

- (void)setCompletedRecommendationsURL:(id)a3
{
  objc_storeStrong((id *)&self->_completedRecommendationsURL, a3);
}

- (NSDictionary)subtitleTemplates
{
  return self->_subtitleTemplates;
}

- (void)setSubtitleTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTemplates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTemplates, 0);
  objc_storeStrong((id *)&self->_completedRecommendationsURL, 0);
  objc_storeStrong((id *)&self->_serverRulesURL, 0);
  objc_storeStrong((id *)&self->_serverRecommendationsURL, 0);
  objc_storeStrong((id *)&self->_recommendationSpecifierSubtitle, 0);
  objc_storeStrong((id *)&self->_recommendationSpecifierTitle, 0);
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
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Could not find subtitleTemplates in dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Could not find completedRecommendationsUrl from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Could not find recommendationRulesUrl from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Could not find recommendationsUrl from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithDictionary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Could not find recommendationSpecifierSubtitle from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithDictionary:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_2380DF000, v0, v1, "Could not find recommendationSpecifierTitle from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
