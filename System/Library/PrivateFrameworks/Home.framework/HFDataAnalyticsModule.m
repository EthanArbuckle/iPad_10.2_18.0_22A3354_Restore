@implementation HFDataAnalyticsModule

- (HFDataAnalyticsModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4
{
  id v7;
  id v8;
  HFDataAnalyticsModule *v9;
  HFDataAnalyticsModule *v10;
  HFDataAnalyticsLogItemProvider *v11;
  HFDataAnalyticsLogItemProvider *logItemProvider;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsModule.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HFDataAnalyticsModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v15, sel_initWithItemUpdater_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a4);
    v11 = -[HFDataAnalyticsLogItemProvider initWithMediaProfileContainer:]([HFDataAnalyticsLogItemProvider alloc], "initWithMediaProfileContainer:", v8);
    logItemProvider = v10->_logItemProvider;
    v10->_logItemProvider = v11;

  }
  return v10;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFDataAnalyticsModule logItemProvider](self, "logItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v3;
  HFMutableItemSection *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[HFItemSection initWithIdentifier:]([HFMutableItemSection alloc], "initWithIdentifier:", CFSTR("DataAnalyticsLogSection"));
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemSection setItems:](v4, "setItems:", v6);

  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__HFDataAnalyticsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFDataAnalyticsLogItemProvider)logItemProvider
{
  return self->_logItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
