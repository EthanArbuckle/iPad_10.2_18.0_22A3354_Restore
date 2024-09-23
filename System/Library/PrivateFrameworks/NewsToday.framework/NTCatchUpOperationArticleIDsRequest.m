@implementation NTCatchUpOperationArticleIDsRequest

- (NTCatchUpOperationArticleIDsRequest)init
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
    v8 = "-[NTCatchUpOperationArticleIDsRequest init]";
    v9 = 2080;
    v10 = "NTCatchUpOperationRequest.m";
    v11 = 1024;
    v12 = 97;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTCatchUpOperationArticleIDsRequest init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTCatchUpOperationArticleIDsRequest)initWithArticleIDs:(id)a3 overrideHeadlineMetadataByArticleID:(id)a4
{
  id v6;
  id v7;
  NTCatchUpOperationArticleIDsRequest *v8;
  uint64_t v9;
  NSCopying *identifier;
  uint64_t v11;
  NSOrderedSet *articleIDs;
  uint64_t v13;
  NSDictionary *overrideHeadlineMetadataByArticleID;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationArticleIDsRequest initWithArticleIDs:overrideHeadlineMetadataByArticleID:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationArticleIDsRequest initWithArticleIDs:overrideHeadlineMetadataByArticleID:].cold.1();
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)NTCatchUpOperationArticleIDsRequest;
  v8 = -[NTCatchUpOperationArticleIDsRequest init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSCopying *)v9;

    v11 = objc_msgSend(v6, "copy");
    articleIDs = v8->_articleIDs;
    v8->_articleIDs = (NSOrderedSet *)v11;

    v13 = objc_msgSend(v7, "copy");
    overrideHeadlineMetadataByArticleID = v8->_overrideHeadlineMetadataByArticleID;
    v8->_overrideHeadlineMetadataByArticleID = (NSDictionary *)v13;

  }
  return v8;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSOrderedSet)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)overrideHeadlineMetadataByArticleID
{
  return self->_overrideHeadlineMetadataByArticleID;
}

- (void)setOverrideHeadlineMetadataByArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHeadlineMetadataByArticleID, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithArticleIDs:overrideHeadlineMetadataByArticleID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"overrideHeadlineMetadataByArticleID", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithArticleIDs:overrideHeadlineMetadataByArticleID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
