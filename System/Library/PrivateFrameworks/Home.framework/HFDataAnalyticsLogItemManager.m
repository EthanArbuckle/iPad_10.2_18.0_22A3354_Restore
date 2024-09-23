@implementation HFDataAnalyticsLogItemManager

- (HFDataAnalyticsLogItemManager)initWithMediaProfileContainer:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HFDataAnalyticsLogItemManager *v10;
  HFDataAnalyticsLogItemManager *v11;
  HFDataAnalyticsModule *v12;
  HFDataAnalyticsModule *dataAnalyticsModule;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsLogItemManager.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HFDataAnalyticsLogItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v16, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaProfileContainer, a3);
    v12 = -[HFDataAnalyticsModule initWithItemUpdater:mediaProfileContainer:]([HFDataAnalyticsModule alloc], "initWithItemUpdater:mediaProfileContainer:", v11, v8);
    dataAnalyticsModule = v11->_dataAnalyticsModule;
    v11->_dataAnalyticsModule = v12;

  }
  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HFDataAnalyticsLogItemManager dataAnalyticsModule](self, "dataAnalyticsModule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HFDataAnalyticsLogItemManager dataAnalyticsModule](self, "dataAnalyticsModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFDataAnalyticsModule)dataAnalyticsModule
{
  return self->_dataAnalyticsModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataAnalyticsModule, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
