@implementation ATXHomeScreenWidgetIdentifiable

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setWidgetUniqueId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setWidgetKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSuggestedWidget:(BOOL)a3
{
  self->_suggestedWidget = a3;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void)setOnboardingWidget:(BOOL)a3
{
  self->_onboardingWidget = a3;
}

- (void)setIntent:(id)a3
{
  INIntent *v4;
  NSData *intentProtoData;
  INIntent *intent;
  ATXHomeScreenWidgetIdentifiable *obj;

  v4 = (INIntent *)a3;
  obj = self;
  objc_sync_enter(obj);
  intentProtoData = obj->_intentProtoData;
  obj->_intentProtoData = 0;

  intent = obj->_intent;
  obj->_intent = v4;

  objc_sync_exit(obj);
}

- (void)setExtensionBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isSuggestedWidget
{
  return self->_suggestedWidget;
}

- (INIntent)intent
{
  ATXHomeScreenWidgetIdentifiable *v2;
  uint64_t v3;
  INIntent *intent;
  INIntent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSData *intentProtoData;
  uint64_t v10;
  id v11;
  INIntent *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v2 = self;
  v3 = objc_sync_enter(v2);
  intent = v2->_intent;
  if (intent)
  {
    v5 = intent;
  }
  else if (v2->_intentProtoData)
  {
    v6 = (void *)MEMORY[0x1A85A4F90](v3);
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    intentProtoData = v2->_intentProtoData;
    v21 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, intentProtoData, &v21);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v21;
    v12 = v2->_intent;
    v2->_intent = (INIntent *)v10;

    if (v11)
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenWidgetIdentifiable intent].cold.1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

    }
    v5 = v2->_intent;

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (ATXHomeScreenWidgetIdentifiable)init
{
  void *v3;
  ATXHomeScreenWidgetIdentifiable *v4;

  objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXHomeScreenWidgetIdentifiable initWithMemoryPressureMonitor:](self, "initWithMemoryPressureMonitor:", v3);

  return v4;
}

- (ATXHomeScreenWidgetIdentifiable)initWithMemoryPressureMonitor:(id)a3
{
  id v5;
  ATXHomeScreenWidgetIdentifiable *v6;
  ATXHomeScreenWidgetIdentifiable *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
  v6 = -[ATXHomeScreenWidgetIdentifiable init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_memoryPressureMonitor, a3);
    -[ATXMemoryPressureMonitor registerObserver:](v7->_memoryPressureMonitor, "registerObserver:", v7);
  }

  return v7;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)dealloc
{
  objc_super v3;

  -[ATXMemoryPressureMonitor unregisterObserver:](self->_memoryPressureMonitor, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
  -[ATXHomeScreenWidgetIdentifiable dealloc](&v3, sel_dealloc);
}

- (id)compactDescription
{
  __CFString *v3;
  objc_class *v4;
  __CFString *v5;
  void *v6;

  if (self->_suggestedWidget)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = v3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("{extBundleID: %@, kind: %@, isSuggestedWidget: %@}"), self->_extensionBundleId, self->_widgetKind, v5);

  return v6;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_intentProtoData, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ATXHomeScreenWidgetIdentifiable _dictionaryRepresentationIncludingFullIntent:](self, "_dictionaryRepresentationIncludingFullIntent:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionWithLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHomeScreenWidgetIdentifiable intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ATXHomeScreenWidgetIdentifiable intent](self, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\nFull Intent: %@\n"), v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v5;
  }

  return (NSString *)v8;
}

- (id)dictionaryRepresentation
{
  return -[ATXHomeScreenWidgetIdentifiable _dictionaryRepresentationIncludingFullIntent:](self, "_dictionaryRepresentationIncludingFullIntent:", 1);
}

- (id)_dictionaryRepresentationIncludingFullIntent:(BOOL)a3
{
  _BOOL4 v3;
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

  v3 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_extensionBundleId, CFSTR("widgetBundleId"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_appBundleId, CFSTR("appBundleId"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_widgetUniqueId, CFSTR("widgetUniqueId"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_widgetKind, CFSTR("widgetKind"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_size);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestedWidget);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("suggestedWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onboardingWidget);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("onboardingWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("score"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_predictionSource, CFSTR("predictionSource"));
  -[ATXHomeScreenWidgetIdentifiable intent](self, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v3)
  {
    objc_msgSend(v10, "typeName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v10, "intentDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
LABEL_5:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("intent"));
    goto LABEL_6;
  }
  -[ATXHomeScreenWidgetIdentifiable intent](self, "intent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("intent"));

LABEL_6:
  return v5;
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  id v4;
  ATXHomeScreenWidgetIdentifiable *v5;
  ATXHomeScreenWidgetIdentifiable *v6;
  uint64_t v7;
  NSString *extensionBundleId;
  uint64_t v9;
  NSString *appBundleId;
  uint64_t v11;
  NSString *widgetUniqueId;
  uint64_t v13;
  NSString *widgetKind;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  NSString *predictionSource;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
  v5 = -[ATXHomeScreenWidgetIdentifiable init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetBundleId"));
    v6 = (ATXHomeScreenWidgetIdentifiable *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetBundleId"));
      v7 = objc_claimAutoreleasedReturnValue();
      extensionBundleId = v5->_extensionBundleId;
      v5->_extensionBundleId = (NSString *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleId"));
      v9 = objc_claimAutoreleasedReturnValue();
      appBundleId = v5->_appBundleId;
      v5->_appBundleId = (NSString *)v9;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetUniqueId"));
      v11 = objc_claimAutoreleasedReturnValue();
      widgetUniqueId = v5->_widgetUniqueId;
      v5->_widgetUniqueId = (NSString *)v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetKind"));
      v13 = objc_claimAutoreleasedReturnValue();
      widgetKind = v5->_widgetKind;
      v5->_widgetKind = (NSString *)v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_size = objc_msgSend(v15, "unsignedIntegerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestedWidget"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_suggestedWidget = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onboardingWidget"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_onboardingWidget = objc_msgSend(v17, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v5->_score = v19;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictionSource"));
      v20 = objc_claimAutoreleasedReturnValue();
      predictionSource = v5->_predictionSource;
      v5->_predictionSource = (NSString *)v20;

      v6 = v5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)handleMemoryPressure
{
  ATXHomeScreenWidgetIdentifiable *v2;
  NSObject *v3;
  NSData *intentProtoData;
  uint8_t v5[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_intentProtoData && v2->_intent)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Purging intent proto data due to memory pressure", v5, 2u);
    }

    intentProtoData = v2->_intentProtoData;
    v2->_intentProtoData = 0;

  }
  objc_sync_exit(v2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXHomeScreenWidgetIdentifiable encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXHomeScreenWidgetIdentifiable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXHomeScreenWidgetIdentifiable *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXHomeScreenWidgetIdentifiable initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXHomeScreenWidgetIdentifiable proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;
  int v4;
  ATXHomeScreenWidgetIdentifiable *v5;
  NSData *intentProtoData;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v3 = (void *)objc_opt_new();
  -[ATXPBHomeScreenWidgetIdentifiable setAppBundleId:]((uint64_t)v3, self->_appBundleId);
  -[ATXPBHomeScreenWidgetIdentifiable setExtensionBundleId:]((uint64_t)v3, self->_extensionBundleId);
  -[ATXPBHomeScreenWidgetIdentifiable setWidgetUniqueId:]((uint64_t)v3, self->_widgetUniqueId);
  -[ATXPBHomeScreenWidgetIdentifiable setWidgetKind:]((uint64_t)v3, self->_widgetKind);
  v4 = ATXStackLayoutSizeToProto(self->_size);
  -[ATXPBHomeScreenWidgetIdentifiable setSize:]((uint64_t)v3, v4);
  -[ATXPBHomeScreenWidgetIdentifiable setSuggestedWidget:]((uint64_t)v3, self->_suggestedWidget);
  -[ATXPBHomeScreenWidgetIdentifiable setOnboardingWidget:]((uint64_t)v3, self->_onboardingWidget);
  -[ATXPBHomeScreenWidgetIdentifiable setScore:]((uint64_t)v3, self->_score);
  -[ATXPBHomeScreenWidgetIdentifiable setPredictionSource:]((uint64_t)v3, self->_predictionSource);
  v5 = self;
  objc_sync_enter(v5);
  intentProtoData = v5->_intentProtoData;
  if (intentProtoData)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setIntent:]((uint64_t)v3, intentProtoData);
  }
  else
  {
    -[ATXHomeScreenWidgetIdentifiable intent](v5, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1A85A4F90]();
      v9 = (void *)MEMORY[0x1E0CB36F8];
      -[ATXHomeScreenWidgetIdentifiable intent](v5, "intent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v9, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      -[ATXPBHomeScreenWidgetIdentifiable setIntent:]((uint64_t)v3, v11);

      objc_autoreleasePoolPop(v8);
      if (v12)
      {
        __atxlog_handle_default();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[ATXHomeScreenWidgetIdentifiable proto].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

      }
    }
  }
  objc_sync_exit(v5);

  return v3;
}

- (ATXHomeScreenWidgetIdentifiable)initWithProtoData:(id)a3
{
  id v4;
  ATXPBHomeScreenWidgetIdentifiable *v5;
  ATXHomeScreenWidgetIdentifiable *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBHomeScreenWidgetIdentifiable initWithData:]([ATXPBHomeScreenWidgetIdentifiable alloc], "initWithData:", v4);

    self = -[ATXHomeScreenWidgetIdentifiable initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXHomeScreenWidgetIdentifiable)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  ATXHomeScreenWidgetIdentifiable *v6;
  void *v7;
  uint64_t v8;
  NSData *intentProtoData;
  uint64_t v10;
  NSString *appBundleId;
  uint64_t v12;
  NSString *extensionBundleId;
  uint64_t v14;
  NSString *widgetUniqueId;
  uint64_t v16;
  NSString *widgetKind;
  int v18;
  uint64_t v19;
  NSString *predictionSource;
  ATXHomeScreenWidgetIdentifiable *v21;
  objc_super v23;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXHomeScreenWidgetIdentifiable initWithProto:].cold.1((uint64_t)self, v5);
      v21 = 0;
      goto LABEL_11;
    }
    v23.receiver = self;
    v23.super_class = (Class)ATXHomeScreenWidgetIdentifiable;
    self = -[ATXHomeScreenWidgetIdentifiable init](&v23, sel_init);
    if (self)
    {
      v5 = v4;
      v6 = self;
      objc_sync_enter(v6);
      -[ATXPBHomeScreenWidgetIdentifiable intent]((uint64_t)v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[ATXPBHomeScreenWidgetIdentifiable intent]((uint64_t)v5);
        v8 = objc_claimAutoreleasedReturnValue();
        intentProtoData = v6->_intentProtoData;
        v6->_intentProtoData = (NSData *)v8;

      }
      objc_sync_exit(v6);

      -[ATXPBHomeScreenWidgetIdentifiable appBundleId]((uint64_t)v5);
      v10 = objc_claimAutoreleasedReturnValue();
      appBundleId = v6->_appBundleId;
      v6->_appBundleId = (NSString *)v10;

      -[ATXPBHomeScreenWidgetIdentifiable extensionBundleId]((uint64_t)v5);
      v12 = objc_claimAutoreleasedReturnValue();
      extensionBundleId = v6->_extensionBundleId;
      v6->_extensionBundleId = (NSString *)v12;

      -[ATXPBHomeScreenWidgetIdentifiable widgetUniqueId]((uint64_t)v5);
      v14 = objc_claimAutoreleasedReturnValue();
      widgetUniqueId = v6->_widgetUniqueId;
      v6->_widgetUniqueId = (NSString *)v14;

      -[ATXPBHomeScreenWidgetIdentifiable widgetKind]((uint64_t)v5);
      v16 = objc_claimAutoreleasedReturnValue();
      widgetKind = v6->_widgetKind;
      v6->_widgetKind = (NSString *)v16;

      v18 = -[ATXPBHomeScreenWidgetIdentifiable size]((uint64_t)v5);
      v6->_size = ATXStackLayoutSizeFromProto(v18);
      v6->_suggestedWidget = -[ATXPBHomeScreenWidgetIdentifiable suggestedWidget]((_BOOL8)v5);
      v6->_onboardingWidget = -[ATXPBHomeScreenWidgetIdentifiable onboardingWidget]((_BOOL8)v5);
      v6->_score = -[ATXPBHomeScreenWidgetIdentifiable score]((uint64_t)v5);
      -[ATXPBHomeScreenWidgetIdentifiable predictionSource]((uint64_t)v5);
      v19 = objc_claimAutoreleasedReturnValue();
      predictionSource = v6->_predictionSource;
      v6->_predictionSource = (NSString *)v19;

      self = v6;
      v21 = self;
LABEL_11:

      goto LABEL_12;
    }
  }
  v21 = 0;
LABEL_12:

  return v21;
}

- (BOOL)isSameWidgetAsWidgetBundleId:(id)a3 widgetKind:(id)a4
{
  id v6;
  id v7;
  NSString *extensionBundleId;
  const __CFString **v9;
  const __CFString *v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", &stru_1E4D5DB30))
    goto LABEL_14;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSiri")))
  {
    extensionBundleId = self->_extensionBundleId;
    v9 = (const __CFString **)MEMORY[0x1E0CF9480];
LABEL_6:
    v10 = *v9;
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions")))
  {
    extensionBundleId = self->_extensionBundleId;
    v9 = (const __CFString **)ATXAppPredictionPanelBundleIdentifier;
    goto LABEL_6;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle")))
  {
    extensionBundleId = self->_extensionBundleId;
    v10 = CFSTR("Shortcuts");
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles")))
      goto LABEL_14;
    extensionBundleId = self->_extensionBundleId;
    v10 = CFSTR("Files");
  }
LABEL_10:
  if (!-[NSString isEqualToString:](extensionBundleId, "isEqualToString:", v10))
  {
LABEL_14:
    +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:kind:](ATXWidgetPersonality, "stringRepresentationForExtensionBundleId:kind:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:kind:](ATXWidgetPersonality, "stringRepresentationForExtensionBundleId:kind:", self->_extensionBundleId, self->_widgetKind);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isEqualToString:", v13);

    goto LABEL_15;
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_appBundleId, "hash");
  v4 = -[NSString hash](self->_extensionBundleId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_widgetUniqueId, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_widgetKind, "hash");
  v7 = self->_size - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = self->_suggestedWidget - v7 + 32 * v7;
  return self->_onboardingWidget - v8 + 32 * v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenWidgetIdentifiable *v4;
  id *v5;
  unint64_t size;
  int suggestedWidget;
  int onboardingWidget;
  NSString *extensionBundleId;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  char v14;
  NSString *appBundleId;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *widgetUniqueId;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  id widgetKind;
  id v26;
  void *v27;
  char v28;
  void *v30;
  void *v31;
  void *v32;

  v4 = (ATXHomeScreenWidgetIdentifiable *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      size = self->_size;
      if (size != objc_msgSend(v5, "size"))
        goto LABEL_22;
      suggestedWidget = self->_suggestedWidget;
      if (suggestedWidget != objc_msgSend(v5, "isSuggestedWidget"))
        goto LABEL_22;
      onboardingWidget = self->_onboardingWidget;
      if (onboardingWidget != objc_msgSend(v5, "isOnboardingWidget"))
        goto LABEL_22;
      extensionBundleId = self->_extensionBundleId;
      v10 = (NSString *)v5[6];
      if (extensionBundleId == v10)
      {

      }
      else
      {
        v11 = v10;
        v12 = extensionBundleId;
        v13 = -[NSString isEqual:](v12, "isEqual:", v11);

        if ((v13 & 1) == 0)
          goto LABEL_22;
      }
      appBundleId = self->_appBundleId;
      v16 = (NSString *)v5[8];
      if (appBundleId == v16)
      {

      }
      else
      {
        v17 = v16;
        v18 = appBundleId;
        v19 = -[NSString isEqual:](v18, "isEqual:", v17);

        if ((v19 & 1) == 0)
          goto LABEL_22;
      }
      widgetUniqueId = self->_widgetUniqueId;
      v21 = (NSString *)v5[10];
      if (widgetUniqueId == v21)
      {

      }
      else
      {
        v22 = v21;
        v23 = widgetUniqueId;
        v24 = -[NSString isEqual:](v23, "isEqual:", v22);

        if ((v24 & 1) == 0)
          goto LABEL_22;
      }
      widgetKind = self->_widgetKind;
      v26 = v5[7];
      if (widgetKind == v26)
      {

      }
      else
      {
        v27 = v26;
        widgetKind = widgetKind;
        v28 = objc_msgSend(widgetKind, "isEqual:", v27);

        if ((v28 & 1) == 0)
        {
LABEL_22:
          v14 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      -[ATXHomeScreenWidgetIdentifiable intent](self, "intent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 || (objc_msgSend(v5, "intent"), (widgetKind = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[ATXHomeScreenWidgetIdentifiable intent](self, "intent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "intent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v31, "atx_isEqualToIntent:", v32);

        if (v30)
        {
LABEL_32:

          goto LABEL_23;
        }
      }
      else
      {
        v14 = 1;
      }

      goto LABEL_32;
    }
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (ATXHomeScreenPage)page
{
  return (ATXHomeScreenPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (BOOL)isOnboardingWidget
{
  return self->_onboardingWidget;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)predictionSource
{
  return self->_predictionSource;
}

- (void)setPredictionSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)requiresAppLaunch
{
  return self->_requiresAppLaunch;
}

- (void)setRequiresAppLaunch:(BOOL)a3
{
  self->_requiresAppLaunch = a3;
}

- (void)intent
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not unarchive intent for widget identifiable: %@", a5, a6, a7, a8, 2u);
}

- (void)proto
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not serialize intent: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBHomeScreenWidgetIdentifiable proto", (uint8_t *)&v5, 0xCu);

}

@end
