@implementation NTHeadlinePersonalizationMetadata

- (NTHeadlinePersonalizationMetadata)init
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
    v8 = "-[NTHeadlinePersonalizationMetadata init]";
    v9 = 2080;
    v10 = "NTHeadlinePersonalizationMetadata.m";
    v11 = 1024;
    v12 = 19;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTHeadlinePersonalizationMetadata init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTHeadlinePersonalizationMetadata)initWithArticleID:(id)a3 publisherID:(id)a4 scoredTopicIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTHeadlinePersonalizationMetadata *v11;
  uint64_t v12;
  NSString *articleID;
  uint64_t v14;
  NSString *publisherID;
  uint64_t v16;
  NSDictionary *scoredTopicIDs;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:].cold.3();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:].cold.2();
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:].cold.1();
  v19.receiver = self;
  v19.super_class = (Class)NTHeadlinePersonalizationMetadata;
  v11 = -[NTHeadlinePersonalizationMetadata init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    articleID = v11->_articleID;
    v11->_articleID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    publisherID = v11->_publisherID;
    v11->_publisherID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    scoredTopicIDs = v11->_scoredTopicIDs;
    v11->_scoredTopicIDs = (NSDictionary *)v16;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NTHeadlinePersonalizationMetadata articleID](self, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("a"));

  -[NTHeadlinePersonalizationMetadata publisherID](self, "publisherID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("b"));

  -[NTHeadlinePersonalizationMetadata scoredTopicIDs](self, "scoredTopicIDs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("c"));

}

- (NTHeadlinePersonalizationMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NTHeadlinePersonalizationMetadata *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("a"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("c"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:](self, "initWithArticleID:publisherID:scoredTopicIDs:", v5, v6, v11);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (NSString)publisherID
{
  return self->_publisherID;
}

- (NSDictionary)scoredTopicIDs
{
  return self->_scoredTopicIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredTopicIDs, 0);
  objc_storeStrong((id *)&self->_publisherID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

- (void)initWithArticleID:publisherID:scoredTopicIDs:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"scoredTopicIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithArticleID:publisherID:scoredTopicIDs:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherID", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithArticleID:publisherID:scoredTopicIDs:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleID", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
