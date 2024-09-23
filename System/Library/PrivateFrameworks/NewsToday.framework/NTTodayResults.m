@implementation NTTodayResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTTodayResults)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NTTodayResults *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("si"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("promotionCriterion"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("headlineScale"));
  v13 = v12;

  v14 = -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:](self, "initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:", v5, v9, v10, v11, 0, 0, v13);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsHoldToken, 0);
  objc_storeStrong((id *)&self->_assetsHoldToken, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NTTodayResults sourceIdentifier](self, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("si"));

  -[NTTodayResults sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("sections"));

  objc_msgSend(v7, "encodeInt32:forKey:", -[NTTodayResults promotionCriterion](self, "promotionCriterion"), CFSTR("promotionCriterion"));
  -[NTTodayResults expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("expirationDate"));

  -[NTTodayResults headlineScale](self, "headlineScale");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("headlineScale"));

}

- (double)headlineScale
{
  return self->_headlineScale;
}

- (NTTodayResults)initWithSourceIdentifier:(id)a3 sections:(id)a4 expirationDate:(id)a5 headlineScale:(double)a6
{
  return -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:](self, "initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:", a3, a4, 0, a5, 0, 0, a6);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NTTodayResults)initWithSourceIdentifier:(id)a3 sections:(id)a4 promotionCriterion:(int)a5 expirationDate:(id)a6 headlineScale:(double)a7 assetsHoldToken:(id)a8 recordsHoldToken:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NTTodayResults *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  NSOrderedSet *sections;
  uint64_t v27;
  NSDate *expirationDate;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (!v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:].cold.3();
    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:].cold.2();
LABEL_6:
  if (!v18 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:].cold.1();
  v30.receiver = self;
  v30.super_class = (Class)NTTodayResults;
  v21 = -[NTTodayResults init](&v30, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    v23 = (void *)v22;
    if (v22)
      v24 = (__CFString *)v22;
    else
      v24 = CFSTR("unknown");
    objc_storeStrong((id *)&v21->_sourceIdentifier, v24);

    v25 = objc_msgSend(v17, "copy");
    sections = v21->_sections;
    v21->_sections = (NSOrderedSet *)v25;

    v21->_promotionCriterion = a5;
    v27 = objc_msgSend(v18, "copy");
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = (NSDate *)v27;

    v21->_headlineScale = a7;
    objc_storeStrong((id *)&v21->_assetsHoldToken, a8);
    objc_storeStrong((id *)&v21->_recordsHoldToken, a9);
  }

  return v21;
}

- (int)promotionCriterion
{
  return self->_promotionCriterion;
}

- (NTTodayResults)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTTodayResults init]";
    v9 = 2080;
    v10 = "NTTodayResults.m";
    v11 = 1024;
    v12 = 308;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTTodayResults init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)itemCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NTTodayResults sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__NTTodayResults_itemCount__block_invoke;
  v5[3] = &unk_24DB5E908;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __27__NTTodayResults_itemCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "items");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTTodayResults sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[NTTodayResults expirationDate](self, "expirationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NTTodayResults sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTTodayResults expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE6CB48], "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayResults sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("sections"), v4);

  objc_msgSend(v3, "descriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSObject)assetsHoldToken
{
  return self->_assetsHoldToken;
}

- (NSObject)recordsHoldToken
{
  return self->_recordsHoldToken;
}

- (void)initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"expirationDate", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sections", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceIdentifier", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
