@implementation ATXAppClipUsageDuetEvent

- (ATXAppClipUsageDuetEvent)initWithLaunchDate:(id)a3 timeSinceDownload:(double)a4 urlHash:(id)a5 clipBundleId:(id)a6 parentAppBundleId:(id)a7 webClipBundleId:(id)a8 launchReason:(int)a9
{
  id v16;
  id v17;
  id v18;
  ATXAppClipUsageDuetEvent *v19;
  ATXAppClipUsageDuetEvent *v20;
  ATXAppClipUsageDuetEvent *v21;
  id v24;
  id v25;
  objc_super v26;

  v16 = a3;
  v25 = a5;
  v17 = a6;
  v24 = a7;
  v18 = a8;
  v19 = 0;
  if (v18 && v17 && v16 && v25 && v24)
  {
    v26.receiver = self;
    v26.super_class = (Class)ATXAppClipUsageDuetEvent;
    v20 = -[ATXDuetEvent initWithStartDate:endDate:](&v26, sel_initWithStartDate_endDate_, v16, 0);
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_launchDate, a3);
      v21->_timeSinceDownload = a4;
      objc_storeStrong((id *)&v21->_urlHash, a5);
      objc_storeStrong((id *)&v21->_clipBundleId, a6);
      objc_storeStrong((id *)&v21->_parentAppBundleId, a7);
      objc_storeStrong((id *)&v21->_webClipBundleId, a8);
      v21->_launchReason = a9;
    }
    self = v21;
    v19 = self;
  }

  return v19;
}

- (ATXAppClipUsageDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  ATXAppClipUsageDuetEvent *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXAppClipUsageDuetEvent initWithCurrentContextStoreValues:](self, "initWithCurrentContextStoreValues:", v3);

  return v4;
}

- (ATXAppClipUsageDuetEvent)initWithContext:(id)a3 modifiedDate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ATXAppClipUsageDuetEvent *v23;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D15C58];
  v8 = a3;
  objc_msgSend(v7, "timeSinceDownloadKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0D15C58], "URLHashKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "clipBundleIDKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "webAppBundleIDKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v8, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    self = -[ATXAppClipUsageDuetEvent initWithLaunchDate:timeSinceDownload:urlHash:clipBundleId:parentAppBundleId:webClipBundleId:launchReason:](self, "initWithLaunchDate:timeSinceDownload:urlHash:clipBundleId:parentAppBundleId:webClipBundleId:launchReason:", v6, v14, v16, v18, v20, -[ATXAppClipUsageDuetEvent launchReasonFromString:](self, "launchReasonFromString:", v22), v12);
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (ATXAppClipUsageDuetEvent)initWithCurrentContextStoreValues:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ATXAppClipUsageDuetEvent *v9;

  v4 = (void *)MEMORY[0x1E0D15C58];
  v5 = a3;
  objc_msgSend(v4, "keyPathForAppClipLaunch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchDataDictionaryForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastModifiedDateForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXAppClipUsageDuetEvent initWithContext:modifiedDate:](self, "initWithContext:modifiedDate:", v7, v8);
  return v9;
}

- (ATXAppClipUsageDuetEvent)initWithContextValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXAppClipUsageDuetEvent *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "lastModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[ATXAppClipUsageDuetEvent initWithContext:modifiedDate:](self, "initWithContext:modifiedDate:", v6, v5);
    v7 = self;
  }
  else
  {
    __atxlog_handle_hero();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXAppClipUsageDuetEvent initWithContextValue:].cold.1((uint64_t)v6, v8);

    v7 = 0;
  }

  return v7;
}

- (ATXAppClipUsageDuetEvent)initWithDKEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  ATXAppClipUsageDuetEvent *v26;
  NSObject *v27;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15990], "timeSinceDownload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppClipUsageDuetEvent loadNumberFromMetadata:key:](self, "loadNumberFromMetadata:key:", v6, v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15990], "URLHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15990], "clipBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15990], "appBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15990], "webAppBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15990], "launchReason");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:](self, "loadStringFromMetadata:key:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = v29;
      objc_msgSend(v29, "doubleValue");
      self = -[ATXAppClipUsageDuetEvent initWithLaunchDate:timeSinceDownload:urlHash:clipBundleId:parentAppBundleId:webClipBundleId:launchReason:](self, "initWithLaunchDate:timeSinceDownload:urlHash:clipBundleId:parentAppBundleId:webClipBundleId:launchReason:", v8, v11, v14, v17, v20, -[ATXAppClipUsageDuetEvent launchReasonFromString:](self, "launchReasonFromString:", v23), v25);
      v26 = self;
    }
    else
    {
      v26 = 0;
      v24 = v29;
    }

  }
  else
  {
    __atxlog_handle_hero();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ATXAppClipUsageDuetEvent initWithDKEvent:].cold.1(v27);

    v26 = 0;
  }

  return v26;
}

- (id)loadStringFromMetadata:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  char v14;
  NSObject *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E82FDC98;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "timeSinceDownloadKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      __atxlog_handle_hero();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:].cold.1();

    }
    v12 = 0;
  }

  return v12;
}

- (id)loadNumberFromMetadata:(id)a3 key:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  NSObject *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (int)launchReasonFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;

  v3 = a3;
  objc_msgSend(&unk_1E83D0950, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(&unk_1E83D0950, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

  }
  else
  {
    __atxlog_handle_hero();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXAppClipUsageDuetEvent launchReasonFromString:].cold.1();

    v6 = 9;
  }

  return v6;
}

- (id)identifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXAppClipUsageDuetEvent urlHash](self, "urlHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppClipUsageDuetEvent clipBundleId](self, "clipBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%@"), v4, v5);

  return v6;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (double)timeSinceDownload
{
  return self->_timeSinceDownload;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (int)launchReason
{
  return self->_launchReason;
}

- (NSString)parentAppBundleId
{
  return self->_parentAppBundleId;
}

- (NSString)clipBundleId
{
  return self->_clipBundleId;
}

- (NSString)webClipBundleId
{
  return self->_webClipBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipBundleId, 0);
  objc_storeStrong((id *)&self->_clipBundleId, 0);
  objc_storeStrong((id *)&self->_parentAppBundleId, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
}

- (void)initWithContextValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Clip usage context value was %@ instead of NSDictionary", v5, 0xCu);

}

- (void)initWithDKEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "_DKEvent missing metadata", v1, 2u);
}

- (void)loadStringFromMetadata:key:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Value for key %@ not the expected type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)launchReasonFromString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Encountered unexpected launch reason %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
