@implementation SGSuggestionsICSMetrics

- (SGSuggestionsICSMetrics)init
{
  SGSuggestionsICSMetrics *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGSuggestionsICSMetrics;
  v2 = -[SGSuggestionsICSMetrics init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SGSuggestionsICSMetrics setFoundInAppsICS:](v2, "setFoundInAppsICS:", v3);

  }
  return v2;
}

- (SGMFoundInAppsICS)foundInAppsICS
{
  return self->_foundInAppsICS;
}

- (void)setFoundInAppsICS:(id)a3
{
  objc_storeStrong((id *)&self->_foundInAppsICS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundInAppsICS, 0);
}

+ (id)instance
{
  if (instance_onceToken_236 != -1)
    dispatch_once(&instance_onceToken_236, &__block_literal_global_237);
  return (id)instance__instance_235;
}

+ (void)recordWithTimezoneValue:(SGMFoundInAppsICSTZValue_)a3 datetimeType:(SGMFoundInAppsDatetimeType_)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foundInAppsICS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackEventWithScalar:timezone:datetime:", 1, a3.var0, a4.var0);

  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setTimezone:", a3.var0);
  objc_msgSend(v13, "setDatetime:", a4.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:", v13);

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v13, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.Proactive.CoreSuggestions"), v10);

  objc_msgSend(v13, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

void __35__SGSuggestionsICSMetrics_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance__instance_235;
  instance__instance_235 = v0;

}

@end
