@implementation NTCatchUpOperationForYouFetchInfo

- (NTCatchUpOperationForYouFetchInfo)init
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
    v8 = "-[NTCatchUpOperationForYouFetchInfo init]";
    v9 = 2080;
    v10 = "NTCatchUpOperation.m";
    v11 = 1024;
    v12 = 562;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTCatchUpOperationForYouFetchInfo init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTCatchUpOperationForYouFetchInfo)initWithAttemptedCachedOnly:(BOOL)a3 feedContextByFeedID:(id)a4
{
  id v6;
  NTCatchUpOperationForYouFetchInfo *v7;
  NTCatchUpOperationForYouFetchInfo *v8;
  uint64_t v9;
  NSDictionary *feedContextByFeedID;
  objc_super v12;

  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationForYouFetchInfo initWithAttemptedCachedOnly:feedContextByFeedID:].cold.1();
  v12.receiver = self;
  v12.super_class = (Class)NTCatchUpOperationForYouFetchInfo;
  v7 = -[NTCatchUpOperationForYouFetchInfo init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_attemptedCachedOnly = a3;
    v9 = objc_msgSend(v6, "copy");
    feedContextByFeedID = v8->_feedContextByFeedID;
    v8->_feedContextByFeedID = (NSDictionary *)v9;

  }
  return v8;
}

- (BOOL)attemptedCachedOnly
{
  return self->_attemptedCachedOnly;
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
}

- (void)initWithAttemptedCachedOnly:feedContextByFeedID:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedContextByFeedID");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

@end
