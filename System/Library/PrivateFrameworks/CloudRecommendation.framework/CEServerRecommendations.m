@implementation CEServerRecommendations

- (CEServerRecommendations)initWithDictionary:(id)a3
{
  id v4;
  CEServerRecommendations *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSArray *recommendations;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSArray *sections;
  void *v17;
  CERecommendationPage *v18;
  NSObject *p_super;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CEServerRecommendations;
  v5 = -[CEServerRecommendations init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __46__CEServerRecommendations_initWithDictionary___block_invoke;
      v26[3] = &unk_2509E06B0;
      v27 = v7;
      v8 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);
      v9 = -[NSObject copy](v8, "copy");
      recommendations = v5->_recommendations;
      v5->_recommendations = (NSArray *)v9;

    }
    else
    {
      _CELogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CEServerRecommendations initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sections"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sectionDetails"));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v21 = MEMORY[0x24BDAC760];
        v22 = 3221225472;
        v23 = __46__CEServerRecommendations_initWithDictionary___block_invoke_17;
        v24 = &unk_2509E06B0;
        v25 = v13;
        v14 = v13;
        -[NSObject enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", &v21);
        v15 = -[NSObject copy](v14, "copy", v21, v22, v23, v24);
        sections = v5->_sections;
        v5->_sections = (NSArray *)v15;

      }
      else
      {
        _CELogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[CEServerRecommendations initWithDictionary:].cold.2();
      }

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sectionHeader"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = -[CERecommendationPage initWithDictionary:]([CERecommendationPage alloc], "initWithDictionary:", v17);
        p_super = &v5->_page->super;
        v5->_page = v18;
      }
      else
      {
        _CELogSystem();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
          -[CEServerRecommendations initWithDictionary:].cold.1((uint64_t)v5, p_super);
      }

    }
    else
    {
      _CELogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CEServerRecommendations initWithDictionary:].cold.3();
    }

  }
  return v5;
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  CERecommendation *v5;
  NSObject *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[CERecommendation initWithDictionary:]([CERecommendation alloc], "initWithDictionary:", v4);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    _CELogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__CEServerRecommendations_initWithDictionary___block_invoke_cold_1();

  }
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  CERecommendationSection *v5;
  NSObject *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[CERecommendationSection initWithDictionary:]([CERecommendationSection alloc], "initWithDictionary:", v4);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    _CELogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__CEServerRecommendations_initWithDictionary___block_invoke_17_cold_1();

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *recommendations;
  id v5;

  recommendations = self->_recommendations;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recommendations, CFSTR("recommendations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sections, CFSTR("sections"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_page, CFSTR("page"));

}

- (CEServerRecommendations)initWithCoder:(id)a3
{
  id v4;
  CEServerRecommendations *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *recommendations;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *sections;
  uint64_t v16;
  CERecommendationPage *page;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CEServerRecommendations;
  v5 = -[CEServerRecommendations init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recommendations"));
    v9 = objc_claimAutoreleasedReturnValue();
    recommendations = v5->_recommendations;
    v5->_recommendations = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("sections"));
    v14 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("page"));
    v16 = objc_claimAutoreleasedReturnValue();
    page = v5->_page;
    v5->_page = (CERecommendationPage *)v16;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CEServerRecommendations *v4;

  v4 = -[CEServerRecommendations init](+[CEServerRecommendations allocWithZone:](CEServerRecommendations, "allocWithZone:", a3), "init");
  -[CEServerRecommendations setRecommendations:](v4, "setRecommendations:", self->_recommendations);
  -[CEServerRecommendations setSections:](v4, "setSections:", self->_sections);
  -[CEServerRecommendations setPage:](v4, "setPage:", self->_page);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Recommendations: %@ Sections: %@ Page Details: %@"), self->_recommendations, self->_sections, self->_page);
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
  objc_storeStrong((id *)&self->_recommendations, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (CERecommendationPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  objc_storeStrong((id *)&self->_page, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint8_t v5[24];

  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_1(v3);
  _os_log_debug_impl(&dword_2380DF000, a2, OS_LOG_TYPE_DEBUG, "%@ Unable to parse page", v5, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0(v1);
  v2 = (void *)OUTLINED_FUNCTION_5_0();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_1(&dword_2380DF000, v4, v5, "%@ Expected sections array to be of type array but found %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

- (void)initWithDictionary:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0(v1);
  v2 = (void *)OUTLINED_FUNCTION_5_0();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_1(&dword_2380DF000, v4, v5, "%@ Expected sections to be of type dictionary but found %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

- (void)initWithDictionary:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0(v1);
  v2 = (void *)OUTLINED_FUNCTION_5_0();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_1_1(&dword_2380DF000, v4, v5, "%@ Expected recommendations to be of type array but found %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_1();
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_4(&dword_2380DF000, v2, v3, "Expected recommendation object to be a dictionary, instead found a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __46__CEServerRecommendations_initWithDictionary___block_invoke_17_cold_1()
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
  OUTLINED_FUNCTION_4(&dword_2380DF000, v2, v3, "Expected section object to be a dictionary, instead found a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
