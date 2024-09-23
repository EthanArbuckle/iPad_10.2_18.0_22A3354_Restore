@implementation ANAnalyticsDailyMessaging

- (ANAnalyticsDailyMessaging)init
{
  ANAnalyticsDailyMessaging *v2;
  uint64_t v3;
  ANRapportConnectionProvider *rapportConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANAnalyticsDailyMessaging;
  v2 = -[ANAnalyticsDailyMessaging init](&v6, sel_init);
  if (v2)
  {
    +[ANRapportConnection sharedConnection](ANRapportConnection, "sharedConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    rapportConnection = v2->_rapportConnection;
    v2->_rapportConnection = (ANRapportConnectionProvider *)v3;

  }
  return v2;
}

- (NSDictionary)devicesCountingAnnouncements
{
  void *v2;
  void *v3;
  void *v4;

  -[ANAnalyticsDailyMessaging rapportConnection](self, "rapportConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccessoryDevicesSupportingAnnounce");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (BOOL)isDeviceAnalyticsCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[ANAnalyticsDailyMessaging devicesCountingAnnouncements](self, "devicesCountingAnnouncements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnalyticsDailyMessaging rapportConnection](self, "rapportConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v5, "homeKitIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "compare:", v11) == -1;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __57__ANAnalyticsDailyMessaging_isDeviceAnalyticsCoordinator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)registerDailyRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANAnalyticsDailyMessaging rapportConnection](self, "rapportConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ANAnalyticsDailyMessaging_registerDailyRequest___block_invoke;
  v7[3] = &unk_1E93902D0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "activateLinkWithOptions:completion:", 2, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __50__ANAnalyticsDailyMessaging_registerDailyRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "rapportConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDailyRequest:", *(_QWORD *)(a1 + 32));

}

- (void)sendDailyRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ANAnalyticsDailyMessaging rapportConnection](self, "rapportConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendDailyRequest:handler:", v7, v6);

}

- (ANRapportConnectionProvider)rapportConnection
{
  return self->_rapportConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportConnection, 0);
}

@end
