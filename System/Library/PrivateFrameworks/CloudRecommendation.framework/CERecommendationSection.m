@implementation CERecommendationSection

- (CERecommendationSection)initWithDictionary:(id)a3
{
  id v4;
  CERecommendationSection *v5;
  void *v6;
  NSString *v7;
  NSObject *sectionID;
  void *v9;
  NSString *v10;
  NSObject *sectionHeader;
  void *v12;
  NSString *v13;
  NSObject *sectionFooter;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CERecommendationSection;
  v5 = -[CERecommendationSection init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      sectionID = v5->_sectionID;
      v5->_sectionID = v7;
    }
    else
    {
      _CELogSystem();
      sectionID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(sectionID, OS_LOG_TYPE_DEBUG))
        -[CERuleset initWithDictionary:].cold.5();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionHeader"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      sectionHeader = v5->_sectionHeader;
      v5->_sectionHeader = v10;
    }
    else
    {
      _CELogSystem();
      sectionHeader = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(sectionHeader, OS_LOG_TYPE_DEBUG))
        -[CERecommendationSection initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionFooter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      sectionFooter = v5->_sectionFooter;
      v5->_sectionFooter = v13;
    }
    else
    {
      _CELogSystem();
      sectionFooter = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(sectionFooter, OS_LOG_TYPE_DEBUG))
        -[CERecommendationSection initWithDictionary:].cold.1();
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
  NSString *sectionID;
  id v5;

  sectionID = self->_sectionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sectionID, CFSTR("sectionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionHeader, CFSTR("sectionHeader"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionFooter, CFSTR("sectionFooter"));

}

- (CERecommendationSection)initWithCoder:(id)a3
{
  id v4;
  CERecommendationSection *v5;
  uint64_t v6;
  NSString *sectionID;
  uint64_t v8;
  NSString *sectionHeader;
  uint64_t v10;
  NSString *sectionFooter;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CERecommendationSection;
  v5 = -[CERecommendationSection init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionHeader"));
    v8 = objc_claimAutoreleasedReturnValue();
    sectionHeader = v5->_sectionHeader;
    v5->_sectionHeader = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionFooter"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendationSection *v4;

  v4 = -[CERecommendationSection init](+[CERecommendationSection allocWithZone:](CERecommendationSection, "allocWithZone:", a3), "init");
  -[CERecommendationSection setSectionID:](v4, "setSectionID:", self->_sectionID);
  -[CERecommendationSection setSectionHeader:](v4, "setSectionHeader:", self->_sectionHeader);
  -[CERecommendationSection setSectionFooter:](v4, "setSectionFooter:", self->_sectionFooter);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Section with id: %@, header: %@, footer: %@"), self->_sectionID, self->_sectionHeader, self->_sectionFooter);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse sectionFooter from dictionary", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse sectionHeader from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
