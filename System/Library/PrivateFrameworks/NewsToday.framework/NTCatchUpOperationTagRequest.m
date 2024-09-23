@implementation NTCatchUpOperationTagRequest

- (NTCatchUpOperationTagRequest)init
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
    v8 = "-[NTCatchUpOperationTagRequest init]";
    v9 = 2080;
    v10 = "NTCatchUpOperationRequest.m";
    v11 = 1024;
    v12 = 131;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTCatchUpOperationTagRequest init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTCatchUpOperationTagRequest)initWithTagTodaySectionSpecificConfig:(id)a3 tagID:(id)a4
{
  id v6;
  id v7;
  NTCatchUpOperationTagRequest *v8;
  uint64_t v9;
  NSString *tagID;
  int v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationTagRequest initWithTagTodaySectionSpecificConfig:tagID:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationTagRequest initWithTagTodaySectionSpecificConfig:tagID:].cold.1();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NTCatchUpOperationTagRequest;
  v8 = -[NTCatchUpOperationTagRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    tagID = v8->_tagID;
    v8->_tagID = (NSString *)v9;

    v8->_cutoffTime = objc_msgSend(v6, "cutoffTime");
    v8->_headlinesPerFeedFetchCount = objc_msgSend(v6, "headlinesPerFeedFetchCount");
    v11 = objc_msgSend(v6, "fetchingBin");
    v12 = v11 == 1;
    if (v11 == 2)
      v12 = 2;
    v8->_fetchingBin = v12;
  }

  return v8;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (int64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (int64_t)fetchingBin
{
  return self->_fetchingBin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
}

- (void)initWithTagTodaySectionSpecificConfig:tagID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagID", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithTagTodaySectionSpecificConfig:tagID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagTodaySectionSpecificConfig", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
