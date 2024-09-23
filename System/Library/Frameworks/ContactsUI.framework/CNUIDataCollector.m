@implementation CNUIDataCollector

- (void)logContactShown:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  _suggestedContact(v9);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v4 == v9)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v9, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNUIDataCollector sgLogger](self, "sgLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionRecordId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIDataCollector appIdentifier](self, "appIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logSuggestedContactDetailShown:contactIdentifier:bundleID:", v7, v5, v8);

  }
}

+ (id)sharedCollector
{
  if (sharedCollector_onceToken != -1)
    dispatch_once(&sharedCollector_onceToken, &__block_literal_global_38396);
  return (id)sharedCollector_sharedCollector;
}

void __36__CNUIDataCollector_sharedCollector__block_invoke()
{
  CNUIDataCollector *v0;
  void *v1;

  v0 = objc_alloc_init(CNUIDataCollector);
  v1 = (void *)sharedCollector_sharedCollector;
  sharedCollector_sharedCollector = (uint64_t)v0;

}

- (CNUIDataCollector)init
{
  void *v3;
  CNUIDataCollector *v4;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIDataCollector initWithEnvironment:](self, "initWithEnvironment:", v3);

  return v4;
}

- (CNUIDataCollector)initWithEnvironment:(id)a3
{
  id v4;
  CNUIDataCollector *v5;
  CNMetricsUIReporter *v6;
  CNMetricsUIReporter *metricsReporter;
  void *v8;
  uint64_t v9;
  CNUIDataCollectorSGLogger *sgLogger;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *appIdentifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNUIDataCollector;
  v5 = -[CNUIDataCollector init](&v16, sel_init);
  if (v5)
  {
    v6 = (CNMetricsUIReporter *)objc_alloc_init(MEMORY[0x1E0D13C28]);
    metricsReporter = v5->_metricsReporter;
    v5->_metricsReporter = v6;

    objc_msgSend(v4, "defaultSchedulerProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIDataCollectorSGLogger loggerWithSGSuggestionsServiceProvider:schedulerProvider:](CNUIDataCollectorSGLogger, "loggerWithSGSuggestionsServiceProvider:schedulerProvider:", &__block_literal_global_43_38384, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    sgLogger = v5->_sgLogger;
    v5->_sgLogger = (CNUIDataCollectorSGLogger *)v9;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
    v13 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v13;

  }
  return v5;
}

- (void)logContactActionType:(id)a3 attributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  if (!+[CNUIDataCollector isEnabled](CNUIDataCollector, "isEnabled"))
    goto LABEL_23;
  -[CNUIDataCollector metricsReporter](self, "metricsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIDataCollector appIdentifier](self, "appIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emptyDictionaryForAction:andApplication:", v27, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0D13848];
  objc_msgSend(v6, "objectForKeyedSubscript:", CNUIContactActionDestinationType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CNUIContactActionDestinationType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v12, *MEMORY[0x1E0D13C00]);

  }
  if (objc_msgSend(v27, "isEqualToString:", CNUIContactActionTypeShare))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CNUIContactActionShareActivityType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_14;
    v14 = v13;
    if (objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.UIKit.activity.")))
    {
      objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.UIKit.activity."), "length"));
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = (_QWORD *)MEMORY[0x1E0D13C18];
      v14 = (void *)v15;
    }
    else
    {
      v16 = (_QWORD *)MEMORY[0x1E0D13C18];
    }
  }
  else if (objc_msgSend(v27, "isEqualToString:", CNUIContactActionTypeTapProperty))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CNUIContactActionTapPropertyIdentifier);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (_QWORD *)MEMORY[0x1E0D13C10];
  }
  else
  {
    if (!objc_msgSend(v27, "isEqualToString:", CNUIContactActionTypeFaceTime))
      goto LABEL_14;
    objc_msgSend(v6, "objectForKeyedSubscript:", CNUIContactActionFaceTimeMediaType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (_QWORD *)MEMORY[0x1E0D13C08];
  }
  objc_msgSend(v9, "setValue:forKey:", v14, *v16);

LABEL_14:
  -[CNUIDataCollector metricsReporter](self, "metricsReporter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logActionDictionary:", v9);

  objc_msgSend(v6, "objectForKeyedSubscript:", CNUIDataCollectorActionTypeAttributeLabeledValue);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && objc_msgSend(v18, "isSuggested"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CNUIDataCollectorActionTypeAttributeContact);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      _suggestedContact(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v21, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[CNUIDataCollector sgLogger](self, "sgLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "suggestionRecordId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIDataCollector appIdentifier](self, "appIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logSuggestedContactDetailUsed:contactIdentifier:bundleID:", v25, v23, v26);

    }
  }

LABEL_23:
}

- (void)logPresentation
{
  void *v3;
  id v4;

  if (+[CNUIDataCollector isEnabled](CNUIDataCollector, "isEnabled"))
  {
    -[CNUIDataCollector metricsReporter](self, "metricsReporter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNUIDataCollector appIdentifier](self, "appIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logContactShownforApplication:", v3);

  }
}

- (void)logSearchUsage
{
  void *v3;
  id v4;

  if (+[CNUIDataCollector isEnabled](CNUIDataCollector, "isEnabled"))
  {
    -[CNUIDataCollector metricsReporter](self, "metricsReporter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNUIDataCollector appIdentifier](self, "appIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logSearchUsageforApplication:", v3);

  }
}

- (void)logSearchResultsFetchedSuggested:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (+[CNUIDataCollector isEnabled](CNUIDataCollector, "isEnabled"))
  {
    if (v3)
    {
      -[CNUIDataCollector sgLogger](self, "sgLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUIDataCollector appIdentifier](self, "appIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logSearchResultsIncludedPureSuggestionsWithBundleID:", v6);

    }
    -[CNUIDataCollector metricsReporter](self, "metricsReporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CNUIDataCollector appIdentifier](self, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logSearchResultsFetchedforApplication:fromSuggestions:", v7, v3);

  }
}

- (void)logSearchResultSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (+[CNUIDataCollector isEnabled](CNUIDataCollector, "isEnabled"))
  {
    _suggestedContact(v11);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v11)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v11, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNUIDataCollector sgLogger](self, "sgLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionRecordId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIDataCollector appIdentifier](self, "appIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logContactSearchResultSelected:contactIdentifier:bundleID:", v7, v5, v8);

    -[CNUIDataCollector metricsReporter](self, "metricsReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIDataCollector appIdentifier](self, "appIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logSearchResultsSelectedforApplication:fromSuggestions:", v10, objc_msgSend(v11, "isSuggested"));

  }
}

- (void)logContactCreated:(id)a3 originalContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  if (objc_msgSend(v11, "isSuggested"))
  {
    objc_msgSend(v11, "suggestionRecordId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[CNUIDataCollector sgLogger](self, "sgLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIDataCollector appIdentifier](self, "appIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logContactCreated:contactIdentifier:bundleID:", v7, v9, v10);

}

- (CNMetricsUIReporter)metricsReporter
{
  return self->_metricsReporter;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (CNUIDataCollectorSGLogger)sgLogger
{
  return self->_sgLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sgLogger, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsReporter, 0);
}

id __41__CNUIDataCollector_initWithEnvironment___block_invoke()
{
  return +[CNUIContactsEnvironmentServicesProvider suggestionsService](CNUIContactsEnvironmentServicesProvider, "suggestionsService");
}

+ (BOOL)isEnabled
{
  return objc_msgSend(MEMORY[0x1E0D13BE0], "isEnabled");
}

@end
