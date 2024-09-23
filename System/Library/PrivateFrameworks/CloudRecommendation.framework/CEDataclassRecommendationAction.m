@implementation CEDataclassRecommendationAction

- (CEDataclassRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 dataclasses:(id)a5
{
  id v9;
  CEDataclassRecommendationAction *v10;
  CEDataclassRecommendationAction *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CEDataclassRecommendationAction;
  v10 = -[CERecommendationAction initWithIdentifier:actionTitle:actionType:](&v13, sel_initWithIdentifier_actionTitle_actionType_, a3, a4, CFSTR("EnableDataclass"));
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_dataclasses, a5);

  return v11;
}

- (CEDataclassRecommendationAction)initWithDictionary:(id)a3
{
  id v4;
  CEDataclassRecommendationAction *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSArray *dataclasses;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CEDataclassRecommendationAction;
  v5 = -[CERecommendationAction initWithDictionary:](&v14, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataclassesToEnable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __54__CEDataclassRecommendationAction_initWithDictionary___block_invoke;
      v12[3] = &unk_2509E0900;
      v13 = v7;
      v8 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
      v9 = -[NSObject copy](v8, "copy");
      dataclasses = v5->_dataclasses;
      v5->_dataclasses = (NSArray *)v9;

    }
    else
    {
      _CELogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CEDataclassRecommendationAction initWithDictionary:].cold.1();
    }

  }
  return v5;
}

uint64_t __54__CEDataclassRecommendationAction_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
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
  v5.super_class = (Class)CEDataclassRecommendationAction;
  v4 = a3;
  -[CERecommendationAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataclasses, CFSTR("dataclasses"), v5.receiver, v5.super_class);

}

- (CEDataclassRecommendationAction)initWithCoder:(id)a3
{
  id v4;
  CEDataclassRecommendationAction *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *dataclasses;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CEDataclassRecommendationAction;
  v5 = -[CERecommendationAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("dataclasses"));
    v9 = objc_claimAutoreleasedReturnValue();
    dataclasses = v5->_dataclasses;
    v5->_dataclasses = (NSArray *)v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CEDataclassRecommendationAction;
  v4 = -[CERecommendationAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setDataclasses:", self->_dataclasses);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEDataclassRecommendationAction;
  -[CERecommendationAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" dataclasses: %@"), self->_dataclasses);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)dataclasses
{
  return self->_dataclasses;
}

- (void)setDataclasses:(id)a3
{
  objc_storeStrong((id *)&self->_dataclasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclasses, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse dataclasses from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
