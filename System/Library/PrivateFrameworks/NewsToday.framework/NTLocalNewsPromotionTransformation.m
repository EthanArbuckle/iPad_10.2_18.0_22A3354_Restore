@implementation NTLocalNewsPromotionTransformation

- (NTLocalNewsPromotionTransformation)init
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
    v8 = "-[NTLocalNewsPromotionTransformation init]";
    v9 = 2080;
    v10 = "NTLocalNewsPromotionTransformation.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTLocalNewsPromotionTransformation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTLocalNewsPromotionTransformation)initWithLocalNewsPromotedArticleID:(id)a3 localNewsPromotionIndex:(unint64_t)a4 baseTransformation:(id)a5
{
  id v8;
  id v9;
  NTLocalNewsPromotionTransformation *v10;
  uint64_t v11;
  NSString *localNewsPromotedArticleID;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTLocalNewsPromotionTransformation initWithLocalNewsPromotedArticleID:localNewsPromotionIndex:baseTransformation:].cold.1();
  v14.receiver = self;
  v14.super_class = (Class)NTLocalNewsPromotionTransformation;
  v10 = -[NTLocalNewsPromotionTransformation init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    localNewsPromotedArticleID = v10->_localNewsPromotedArticleID;
    v10->_localNewsPromotedArticleID = (NSString *)v11;

    v10->_localNewsPromotionIndex = a4;
    objc_storeStrong((id *)&v10->_baseTransformation, a5);
  }

  return v10;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NTLocalNewsPromotionTransformation baseTransformation](self, "baseTransformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformFeedItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTLocalNewsPromotionTransformation localNewsPromotedArticleID](self, "localNewsPromotedArticleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    v10 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_11;
    v26[3] = &unk_24DB5E958;
    v11 = v9;
    v27 = v11;
    objc_msgSend(v4, "fc_firstObjectPassingTest:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(v6, "mutableCopy");
      v19 = v10;
      v20 = 3221225472;
      v21 = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_13;
      v22 = &unk_24DB5E958;
      v14 = &v23;
      v23 = v11;
      objc_msgSend(v13, "fc_removeObjectsPassingTest:", &v19);
      v15 = objc_msgSend(v13, "count", v19, v20, v21, v22);
      v16 = -[NTLocalNewsPromotionTransformation localNewsPromotionIndex](self, "localNewsPromotionIndex");
      if (v15 >= v16)
        v15 = v16;
      objc_msgSend(v13, "insertObject:atIndex:", v12, v15);
      NTSharedLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v31 = v15;
        _os_log_impl(&dword_2197E6000, v17, OS_LOG_TYPE_INFO, "inserting local news article into For You at position %ld", buf, 0xCu);
      }

    }
    else
    {
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_2;
      v24[3] = &unk_24DB5F730;
      v14 = &v25;
      v25 = v6;
      __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_2((uint64_t)v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke;
    v28[3] = &unk_24DB5F730;
    v29 = v6;
    __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke((uint64_t)v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NTSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2197E6000, v2, OS_LOG_TYPE_INFO, "returning For You without regard for local news because we have no promoted article ID", v4, 2u);
  }

  return *(id *)(a1 + 32);
}

uint64_t __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NTSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2197E6000, v2, OS_LOG_TYPE_ERROR, "returning For You without regard for local news because we could not find the promoted local news article", v4, 2u);
  }

  return *(id *)(a1 + 32);
}

uint64_t __57__NTLocalNewsPromotionTransformation_transformFeedItems___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSString)localNewsPromotedArticleID
{
  return self->_localNewsPromotedArticleID;
}

- (unint64_t)localNewsPromotionIndex
{
  return self->_localNewsPromotionIndex;
}

- (NTFeedTransforming)baseTransformation
{
  return self->_baseTransformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTransformation, 0);
  objc_storeStrong((id *)&self->_localNewsPromotedArticleID, 0);
}

- (void)initWithLocalNewsPromotedArticleID:localNewsPromotionIndex:baseTransformation:.cold.1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "baseTransformation");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTLocalNewsPromotionTransformation initWithLocalNewsPromotedArticleID:localNewsPromotionIndex:baseTransformation:]";
  v3 = 2080;
  v4 = "NTLocalNewsPromotionTransformation.m";
  v5 = 1024;
  v6 = 36;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
