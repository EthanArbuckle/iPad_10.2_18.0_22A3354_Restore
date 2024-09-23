@implementation ATXWidgetLogUploadAllowList

- (ATXWidgetLogUploadAllowList)init
{
  void *v3;
  ATXWidgetLogUploadAllowList *v4;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXWidgetLogUploadAllowList initWithAssets:](self, "initWithAssets:", v3);

  return v4;
}

- (ATXWidgetLogUploadAllowList)initWithAssets:(id)a3
{
  id v4;
  ATXWidgetLogUploadAllowList *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSSet *allowedWidgetBundleIds;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetLogUploadAllowList;
  v5 = -[ATXWidgetLogUploadAllowList init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowListEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowListEnabled = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowedWidgetBundleIds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowedWidgetBundleIds"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithArray:", v9);
      allowedWidgetBundleIds = v5->_allowedWidgetBundleIds;
      v5->_allowedWidgetBundleIds = (NSSet *)v10;

    }
  }

  return v5;
}

- (BOOL)logUploadAllowedForWidgetBundleId:(id)a3
{
  return !self->_allowListEnabled || -[NSSet containsObject:](self->_allowedWidgetBundleIds, "containsObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedWidgetBundleIds, 0);
}

@end
