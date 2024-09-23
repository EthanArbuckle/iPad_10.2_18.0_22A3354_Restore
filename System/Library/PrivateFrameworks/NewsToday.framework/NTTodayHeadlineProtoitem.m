@implementation NTTodayHeadlineProtoitem

- (NTTodayHeadlineProtoitem)init
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
    v8 = "-[NTTodayHeadlineProtoitem init]";
    v9 = 2080;
    v10 = "NTTodayHeadlineProtoitem.m";
    v11 = 1024;
    v12 = 28;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTTodayHeadlineProtoitem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTTodayHeadlineProtoitem)initWithIdentifier:(id)a3 headline:(id)a4 actionURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTTodayHeadlineProtoitem *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  FCHeadlineProviding *headline;
  uint64_t v16;
  NSURL *actionURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayHeadlineProtoitem initWithIdentifier:headline:actionURL:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayHeadlineProtoitem initWithIdentifier:headline:actionURL:].cold.1();
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)NTTodayHeadlineProtoitem;
  v11 = -[NTTodayHeadlineProtoitem init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    headline = v11->_headline;
    v11->_headline = (FCHeadlineProviding *)v14;

    v16 = objc_msgSend(v10, "copy");
    actionURL = v11->_actionURL;
    v11->_actionURL = (NSURL *)v16;

  }
  return v11;
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
    -[NTTodayHeadlineProtoitem identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[NTTodayHeadlineProtoitem headline](self, "headline");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headline");
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

  -[NTTodayHeadlineProtoitem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTTodayHeadlineProtoitem headline](self, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)assetHandlesWithOperationInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayHeadlineProtoitem assetHandlesWithOperationInfo:].cold.1();
  -[NTTodayHeadlineProtoitem headline](self, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE30];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__NTTodayHeadlineProtoitem_assetHandlesWithOperationInfo___block_invoke;
  v11[3] = &unk_24DB5E260;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "fc_array:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __58__NTTodayHeadlineProtoitem_assetHandlesWithOperationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "thumbnailSizePreset");
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dynamicThumbnailSizeMinimumSizeInPixels");
  NTHeadlineThumbnailFromFCHeadline(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailAssetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NTSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v17 = 138412290;
      v18 = v10;
      _os_log_impl(&dword_2197E6000, v8, OS_LOG_TYPE_INFO, "Including thumbnailAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v3, "addObject:", v7);
  }
  else
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v17 = 138412290;
      v18 = v11;
      _os_log_impl(&dword_2197E6000, v8, OS_LOG_TYPE_INFO, "Missing thumbnailAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline(*(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "sourceNameImageSizePreset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NTSharedLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 40);
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_2197E6000, v13, OS_LOG_TYPE_INFO, "Including nameImageMaskAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v3, "addObject:", v12);
  }
  else
  {
    if (v14)
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_2197E6000, v13, OS_LOG_TYPE_INFO, "Missing nameImageMaskAssetHandle for headline: %@", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (NTTodayHeadlineProtoitem)itemWithContentContext:(id)a3 operationInfo:(id)a4 sectionDescriptor:(id)a5 todayData:(id)a6 assetFileURLsByRemoteURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v28 = a6;
  v15 = a7;
  v16 = v12;
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:].cold.4();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:].cold.3();
LABEL_6:
  if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:].cold.2();
    if (v15)
      goto LABEL_11;
  }
  else if (v15)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayHeadlineProtoitem itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:].cold.1();
LABEL_11:
  -[NTTodayHeadlineProtoitem headline](self, "headline");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NTHeadlineAdElementFromFCHeadline(v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NTHeadlineAnalyticsElementFromFCHeadline(v17, objc_msgSend(v14, "seenArticlesFilterMethod"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NTHeadlineBackingElementFromFCHeadline(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayHeadlineProtoitem actionURL](self, "actionURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v13, "thumbnailSizePreset");
  objc_msgSend(v13, "dynamicThumbnailSizeMinimumSizeInPixels");
  v22 = objc_msgSend(v13, "sourceNameImageSizePreset");
  objc_msgSend(v13, "assetsDirectoryFileURL");
  v26 = v14;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NTHeadlineFromFCHeadline(v17, v20, v16, v21, v22, v27, v18, v19, v28, v23, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NTTodayHeadlineProtoitem *)v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:headline:actionURL:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:headline:actionURL:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)assetHandlesWithOperationInfo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetFileURLsByRemoteURL", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)itemWithContentContext:operationInfo:sectionDescriptor:todayData:assetFileURLsByRemoteURL:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
