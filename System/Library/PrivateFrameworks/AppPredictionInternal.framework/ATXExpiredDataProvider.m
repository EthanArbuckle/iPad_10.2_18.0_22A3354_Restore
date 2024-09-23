@implementation ATXExpiredDataProvider

- (ATXExpiredDataProvider)initWithAppInfoManager:(id)a3 histogramBundleIdTable:(id)a4
{
  id v7;
  id v8;
  ATXExpiredDataProvider *v9;
  ATXExpiredDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXExpiredDataProvider;
  v9 = -[ATXExpiredDataProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appInfoManager, a3);
    objc_storeStrong((id *)&v10->_histogramBundleIdTable, a4);
  }

  return v10;
}

- (id)expiredBundleIdsAndActionKeys
{
  void *v3;
  void *v4;
  ATXExpiredData *v5;

  -[ATXExpiredDataProvider expiredBundleIds](self, "expiredBundleIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXExpiredDataProvider expiredActionKeysFromExpiredBundleIds:](self, "expiredActionKeysFromExpiredBundleIds:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXExpiredData initWithExpiredBundleIds:expiredActionKeys:]([ATXExpiredData alloc], "initWithExpiredBundleIds:expiredActionKeys:", v3, v4);

  return v5;
}

- (id)expiredBundleIds
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInfoManager allApps](self->_appInfoManager, "allApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__ATXExpiredDataProvider_expiredBundleIds__block_invoke;
  v8[3] = &unk_1E82E1A88;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __42__ATXExpiredDataProvider_expiredBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _BOOL8 v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appInfoForBundleId:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastLaunch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "lastLaunch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = fabs(v7);

    v9 = v8 > 2419200.0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)expiredActionKeysFromExpiredBundleIds:(id)a3
{
  id v4;
  ATXHistogramBundleIdTable *histogramBundleIdTable;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    histogramBundleIdTable = self->_histogramBundleIdTable;
    +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:](_ATXActionUtils, "actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:", v4, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHistogramTable allKeysFilteredBy:](histogramBundleIdTable, "allKeysFilteredBy:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramBundleIdTable, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
}

@end
