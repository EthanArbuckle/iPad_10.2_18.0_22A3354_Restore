@implementation CERecommendationPage

- (CERecommendationPage)initWithDictionary:(id)a3
{
  id v4;
  CERecommendationPage *v5;
  void *v6;
  NSString *v7;
  NSObject *title;
  void *v9;
  NSString *v10;
  NSObject *subTitle;
  void *v12;
  CEImageIcon *v13;
  NSObject *p_super;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CERecommendationPage;
  v5 = -[CERecommendationPage init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      title = v5->_title;
      v5->_title = v7;
    }
    else
    {
      _CELogSystem();
      title = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(title, OS_LOG_TYPE_DEBUG))
        -[CERecommendationPage initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageSubtitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      subTitle = v5->_subTitle;
      v5->_subTitle = v10;
    }
    else
    {
      _CELogSystem();
      subTitle = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(subTitle, OS_LOG_TYPE_DEBUG))
        -[CERecommendationPage initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CEImageIcon initWithDictionary:]([CEImageIcon alloc], "initWithDictionary:", v12);
      p_super = &v5->_icon->super.super;
      v5->_icon = v13;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERecommendationPage initWithDictionary:].cold.1();
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
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subTitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));

}

- (CERecommendationPage)initWithCoder:(id)a3
{
  id v4;
  CERecommendationPage *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subTitle;
  uint64_t v10;
  CEImageIcon *icon;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CERecommendationPage;
  v5 = -[CERecommendationPage init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v10 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (CEImageIcon *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendationPage *v4;

  v4 = -[CERecommendationPage init](+[CERecommendationPage allocWithZone:](CERecommendationPage, "allocWithZone:", a3), "init");
  -[CERecommendationPage setTitle:](v4, "setTitle:", self->_title);
  -[CERecommendationPage setSubTitle:](v4, "setSubTitle:", self->_subTitle);
  -[CERecommendationPage setIcon:](v4, "setIcon:", self->_icon);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Page with title: %@, subtitle: %@, icon: %@"), self->_title, self->_subTitle, self->_icon);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEImageIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse icon from dictionary", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse subtitle from dictionary", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse title from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
