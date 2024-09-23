@implementation AXAuditDeduplicatorModels

- (AXAuditDeduplicatorModels)init
{
  AXAuditDeduplicatorModels *v2;
  dispatch_queue_t v3;
  os_log_t v4;
  NSObject *v5;
  _QWORD block[4];
  AXAuditDeduplicatorModels *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXAuditDeduplicatorModels;
  v2 = -[AXAuditDeduplicatorModels init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXAuditDeduplicator", 0);
    -[AXAuditDeduplicatorModels setDedupeQueue:](v2, "setDedupeQueue:", v3);

    v4 = os_log_create("AXAuditDeduplicator", "Models");
    -[AXAuditDeduplicatorModels setLog:](v2, "setLog:", v4);

    -[AXAuditDeduplicatorModels setActivePlatform:](v2, "setActivePlatform:", 0);
    -[AXAuditDeduplicatorModels dedupeQueue](v2, "dedupeQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__AXAuditDeduplicatorModels_init__block_invoke;
    block[3] = &unk_25071ABD8;
    v8 = v2;
    dispatch_async(v5, block);

  }
  return v2;
}

void __33__AXAuditDeduplicatorModels_init__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBECC8]), "initWithPortraitModels");
  objc_msgSend(*(id *)(a1 + 32), "setDeduplicator:", v2);

  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_235CE3000, v3, OS_LOG_TYPE_DEFAULT, "Created the deduplicator", v4, 2u);
  }

}

- (BOOL)determineUIPlatform:(id)a3 outPlatform:(int64_t *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if ((objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", CFSTR("iPad")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (!objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", CFSTR("iPhone")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = 0;
  }
  *a4 = v6;
  v7 = 1;
LABEL_7:

  return v7;
}

- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forPlatform:(id)a5
{
  id v8;
  int v9;
  uint64_t v11;

  v8 = a3;
  v11 = 0;
  if (-[AXAuditDeduplicatorModels determineUIPlatform:outPlatform:](self, "determineUIPlatform:outPlatform:", a5, &v11))
    v9 = -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:](self, "deduplicateIssues:onImage:forUIUPlatform:", v8, a4, v11);
  else
    v9 = -1;

  return v9;
}

- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forUIUPlatform:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v52;
  _QWORD block[5];

  v8 = a3;
  if (!objc_opt_class())
    goto LABEL_16;
  if ((objc_msgSend(MEMORY[0x24BEBECC8], "areModelsAvailable") & 1) == 0)
  {
    -[AXAuditDeduplicatorModels log](self, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:].cold.3(v35, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_15;
  }
  -[AXAuditDeduplicatorModels deduplicator](self, "deduplicator");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        v11 = -[AXAuditDeduplicatorModels activePlatform](self, "activePlatform"),
        v10,
        v11 != a5))
  {
    -[AXAuditDeduplicatorModels dedupeQueue](self, "dedupeQueue");
    v43 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__AXAuditDeduplicatorModels_deduplicateIssues_onImage_forUIUPlatform___block_invoke;
    block[3] = &unk_25071ABD8;
    block[4] = self;
    dispatch_async(v43, block);

    -[AXAuditDeduplicatorModels setActivePlatform:](self, "setActivePlatform:", a5);
    -[AXAuditDeduplicatorModels log](self, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:].cold.1(v35, v44, v45, v46, v47, v48, v49, v50);
LABEL_15:

    goto LABEL_16;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_16:
    v17 = 0;
    v19 = 0;
    v15 = 0;
    v14 = 0;
LABEL_17:
    v26 = -1;
    goto LABEL_18;
  }
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeStamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditDeduplicatorModels createUIUScreenShotForImage:withTimestamp:](self, "createUIUScreenShotForImage:withTimestamp:", a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditDeduplicatorModels packIssueRects:](self, "packIssueRects:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditDeduplicatorModels deduplicator](self, "deduplicator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifyElements:elements:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditDeduplicatorModels deduplicator](self, "deduplicator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addElementsForScreen:candidates:screenGroupID:", v14, v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "results");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  v22 = objc_msgSend(v8, "count");

  if (v21 != v22)
  {
    -[AXAuditDeduplicatorModels log](self, "log");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      -[AXAuditDeduplicatorModels deduplicateIssues:onImage:forUIUPlatform:].cold.2(v19, v8, v52);

    goto LABEL_17;
  }
  objc_msgSend(v19, "results");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    v25 = 0;
    v26 = 0;
    do
    {
      objc_msgSend(v19, "results");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "isDuplicate");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setIsDuplicate:", v29);

      objc_msgSend(v19, "groupID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setScreenGroupId:", v31);

      v26 += objc_msgSend(v28, "isDuplicate");
      ++v25;
      objc_msgSend(v19, "results");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

    }
    while (v34 > v25);
  }
  else
  {
    v26 = 0;
  }
LABEL_18:

  return v26;
}

void __70__AXAuditDeduplicatorModels_deduplicateIssues_onImage_forUIUPlatform___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBECC8]), "initWithPortraitModels");
  objc_msgSend(*(id *)(a1 + 32), "setDeduplicator:", v2);

}

- (id)createUIUScreenShotForImage:(CGImage *)a3 withTimestamp:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[AXAuditDeduplicatorModels deduplicator](self, "deduplicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifyImage:image:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)packIssueRects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v5, "screenshotForIssue:elementRect:", v11, &v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scale");
        v14 = v13;
        v15 = v13 * *(double *)&v19;
        objc_msgSend(v12, "size");
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v15, v14 * (v16 - *((double *)&v19 + 1) - *((double *)&v20 + 1)), v14 * *(double *)&v20, v14 * *((double *)&v20 + 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v4;
}

- (UIUDeduplicator)deduplicator
{
  return (UIUDeduplicator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeduplicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)activePlatform
{
  return self->_activePlatform;
}

- (void)setActivePlatform:(int64_t)a3
{
  self->_activePlatform = a3;
}

- (OS_dispatch_queue)dedupeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDedupeQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dedupeQueue, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
}

- (void)deduplicateIssues:(uint64_t)a3 onImage:(uint64_t)a4 forUIUPlatform:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_235CE3000, a1, a3, "UIUDeduplicator object is not available, skipping", a5, a6, a7, a8, 0);
}

- (void)deduplicateIssues:(void *)a1 onImage:(void *)a2 forUIUPlatform:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218240;
  v7 = objc_msgSend(v5, "count");
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_235CE3000, a3, OS_LOG_TYPE_ERROR, "Deduplication result mismatched length, added %lu but expected %lu. Do nothing to avoid wrong duping", (uint8_t *)&v6, 0x16u);

}

- (void)deduplicateIssues:(uint64_t)a3 onImage:(uint64_t)a4 forUIUPlatform:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_235CE3000, a1, a3, "UIUDeduplicator models are not available, skipping", a5, a6, a7, a8, 0);
}

@end
