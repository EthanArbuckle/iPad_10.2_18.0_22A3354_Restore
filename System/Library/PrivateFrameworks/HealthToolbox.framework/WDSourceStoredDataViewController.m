@implementation WDSourceStoredDataViewController

- (BOOL)sourceIsInstalled
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v13;

  v4 = objc_alloc(MEMORY[0x24BDC1540]);
  -[WDSourceStoredDataViewController source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &v13);
  v8 = v13;

  if (v7)
  {
    objc_msgSend(v7, "applicationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isInstalled");

  }
  else
  {
    if (v8)
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x24BDD2FE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
        -[WDSourceStoredDataViewController sourceIsInstalled].cold.1(v11, a2);
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)sourceHasData
{
  void *v2;
  BOOL v3;

  -[WDStoredDataByCategoryViewController capturedSampleTypes](self, "capturedSampleTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)storedDataPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD3E88];
  -[WDSourceStoredDataViewController source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForObjectsFromSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)storedDataDisplayName
{
  void *v2;
  void *v3;

  -[WDSourceStoredDataViewController source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowDeleteAllDataButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 3)
    return 0;
  if (-[WDSourceStoredDataViewController sourceHasData](self, "sourceHasData"))
    return 1;
  return !-[WDSourceStoredDataViewController sourceIsInstalled](self, "sourceIsInstalled");
}

- (void)deleteAllStoredData
{
  void *v3;
  char v4;

  if (-[WDSourceStoredDataViewController sourceIsInstalled](self, "sourceIsInstalled")
    || (-[WDSourceStoredDataViewController source](self, "source"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_isLocalDevice"),
        v3,
        (v4 & 1) != 0))
  {
    if (-[WDSourceStoredDataViewController sourceHasData](self, "sourceHasData"))
      -[WDSourceStoredDataViewController deleteAllSourceData](self, "deleteAllSourceData");
  }
  else
  {
    -[WDSourceStoredDataViewController deleteSource](self, "deleteSource");
  }
}

- (void)deleteSource
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = objc_alloc(MEMORY[0x24BDD3FD8]);
  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithHealthStore:", v5);

  -[WDSourceStoredDataViewController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__WDSourceStoredDataViewController_deleteSource__block_invoke;
  v9[3] = &unk_24D38CFB0;
  v9[4] = self;
  objc_msgSend(v6, "deleteSourceWithBundleIdentifier:completion:", v8, v9);

}

void __48__WDSourceStoredDataViewController_deleteSource__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __48__WDSourceStoredDataViewController_deleteSource__block_invoke_cold_1(a1, v6);
  }

}

- (void)deleteAllSourceData
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataByCategoryViewController capturedSampleTypes](self, "capturedSampleTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSourceStoredDataViewController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke;
  v9[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
  v9[4] = a2;
  objc_msgSend(v5, "deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", v6, v8, 2, v9);

}

void __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke_cold_1(a1, v6);
  }

}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)sourceIsInstalled
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%@ sourceIsInstalled: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __48__WDSourceStoredDataViewController_deleteSource__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1, a2);
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "Source %@ not deleted: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __55__WDSourceStoredDataViewController_deleteAllSourceData__block_invoke_cold_1(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1, a2);
  NSStringFromSelector(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%@ deleteAllSamplesWithTypes: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
