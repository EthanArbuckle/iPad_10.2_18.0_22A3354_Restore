@implementation AXAuditDeduplicator

- (AXAuditDeduplicator)init
{
  AXAuditDeduplicator *v2;
  AXAuditDeduplicatorModels *v3;
  AXAuditDeduplicatorHeuristics *v4;
  os_log_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAuditDeduplicator;
  v2 = -[AXAuditDeduplicator init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AXAuditDeduplicatorModels);
    -[AXAuditDeduplicator setModels:](v2, "setModels:", v3);

    v4 = objc_alloc_init(AXAuditDeduplicatorHeuristics);
    -[AXAuditDeduplicator setHeuristics:](v2, "setHeuristics:", v4);

    v5 = os_log_create("AXAuditDeduplicator", "Muxer");
    -[AXAuditDeduplicator setLog:](v2, "setLog:", v5);

  }
  return v2;
}

- (BOOL)modelsAvailableForPlatform:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", CFSTR("iPhone")) & 1) != 0
    || objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", CFSTR("iPad"));

  return v4;
}

- (CGImage)getCGImageForIssue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  CGImage *v7;

  v3 = a3;
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "screenshotImageForTimestamp:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (CGImage *)objc_msgSend(v6, "CGImage");

  return v7;
}

- (int)findNewIssues:(id)a3 forPlatform:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CGImage *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXAuditDeduplicator getCGImageForIssue:](self, "getCGImageForIssue:", v8);

  v10 = -[AXAuditDeduplicator modelsAvailableForPlatform:](self, "modelsAvailableForPlatform:", v6);
  -[AXAuditDeduplicator log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_235CE3000, v11, OS_LOG_TYPE_DEFAULT, "Deduplicating with models", v17, 2u);
    }

    -[AXAuditDeduplicator models](self, "models");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235CE3000, v11, OS_LOG_TYPE_DEFAULT, "Deduplicating with heuristics", buf, 2u);
    }

    -[AXAuditDeduplicator heuristics](self, "heuristics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = objc_msgSend(v13, "deduplicateIssues:onImage:forPlatform:", v7, v9, v6);

  return v15;
}

+ (BOOL)isFrameworkAvailable
{
  return 1;
}

+ (void)downloadUIUnderstandingAssetsIfNeeded
{
  NSObject *v2;

  v2 = dispatch_queue_create("XRCAuditDeduplicator", 0);
  dispatch_async(v2, &__block_literal_global_19);

}

void __60__AXAuditDeduplicator_downloadUIUnderstandingAssetsIfNeeded__block_invoke()
{
  if ((objc_msgSend(MEMORY[0x24BEBECC8], "areModelsAvailable") & 1) == 0
    && (objc_msgSend(MEMORY[0x24BEBECC8], "downloadModelSet:timeout:", 0, 300.0) & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __60__AXAuditDeduplicator_downloadUIUnderstandingAssetsIfNeeded__block_invoke_cold_1();
  }
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (AXAuditDeduplicatorModels)models
{
  return (AXAuditDeduplicatorModels *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AXAuditDeduplicatorHeuristics)heuristics
{
  return (AXAuditDeduplicatorHeuristics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeuristics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __60__AXAuditDeduplicator_downloadUIUnderstandingAssetsIfNeeded__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to download UIUnderstandingAssets - do not dedupe issues", v0, 2u);
}

@end
