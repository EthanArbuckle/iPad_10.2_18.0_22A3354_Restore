@implementation FCEndpointConfiguration

- (NSString)fairPlayBaseURLString
{
  return self->_fairPlayBaseURLString;
}

- (NSString)ckRecordFetchBaseURLString
{
  return self->_ckRecordFetchBaseURLString;
}

- (NSString)ckOrderFeedBaseURLString
{
  return self->_ckOrderFeedBaseURLString;
}

- (NSString)ckMultiFetchBaseURLString
{
  return self->_ckMultiFetchBaseURLString;
}

- (NSString)ckEdgeCachedMultiFetchBaseURLString
{
  return self->_ckEdgeCachedMultiFetchBaseURLString;
}

- (NSString)appAnalyticsSportsEventsBaseURLString
{
  return self->_appAnalyticsSportsEventsBaseURLString;
}

- (FCEndpointConfiguration)initWithClientAPIBaseURLString:(id)a3 notificationsBaseURLString:(id)a4 staticAssetBaseURLString:(id)a5 remoteDataSourceBaseURLString:(id)a6 newsletterAPIBaseURLString:(id)a7 appAnalyticsBaseURLString:(id)a8 fairPlayBaseURLString:(id)a9 searchAPIBaseURLString:(id)a10 puzzlesArchiveAPIBaseURLString:(id)a11 appAnalyticsNotificationReceiptBaseURLString:(id)a12 authTokenAPIBaseURLString:(id)a13 sportsDataVisualizationAPIBaseURLString:(id)a14 fineGrainedNewsletterSubscriptionBaseURLString:(id)a15 appAnalyticsSportsEventsBaseURLString:(id)a16 appAnalyticsAppHealthBaseURLString:(id)a17 appAnalyticsAppHeartbeatBaseURLString:(id)a18 ckOrderFeedBaseURLString:(id)a19 ckMultiFetchBaseURLString:(id)a20 ckRecordFetchBaseURLString:(id)a21 ckEdgeCachedOrderFeedBaseURLString:(id)a22 ckEdgeCachedMultiFetchBaseURLString:(id)a23
{
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  FCEndpointConfiguration *v38;
  uint64_t v39;
  NSString *clientAPIBaseURLString;
  uint64_t v41;
  NSString *notificationsBaseURLString;
  uint64_t v43;
  NSString *staticAssetBaseURLString;
  uint64_t v45;
  NSString *remoteDataSourceBaseURLString;
  uint64_t v47;
  NSString *newsletterAPIBaseURLString;
  uint64_t v49;
  NSString *appAnalyticsBaseURLString;
  uint64_t v51;
  NSString *fairPlayBaseURLString;
  uint64_t v53;
  NSString *searchAPIBaseURLString;
  uint64_t v55;
  NSString *puzzlesArchiveAPIBaseURLString;
  uint64_t v57;
  NSString *appAnalyticsNotificationReceiptBaseURLString;
  uint64_t v59;
  NSString *authTokenAPIBaseURLString;
  uint64_t v61;
  NSString *sportsDataVisualizationAPIBaseURLString;
  uint64_t v63;
  NSString *fineGrainedNewsletterSubscriptionBaseURLString;
  uint64_t v65;
  NSString *appAnalyticsSportsEventsBaseURLString;
  uint64_t v67;
  NSString *appAnalyticsAppHealthBaseURLString;
  uint64_t v69;
  NSString *appAnalyticsAppHeartbeatBaseURLString;
  uint64_t v71;
  NSString *ckOrderFeedBaseURLString;
  uint64_t v73;
  NSString *ckMultiFetchBaseURLString;
  uint64_t v75;
  NSString *ckRecordFetchBaseURLString;
  uint64_t v77;
  NSString *ckEdgeCachedOrderFeedBaseURLString;
  uint64_t v79;
  NSString *ckEdgeCachedMultiFetchBaseURLString;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  objc_super v95;

  v28 = a3;
  v29 = a4;
  v94 = a5;
  v93 = a6;
  v92 = a7;
  v91 = a8;
  v90 = a9;
  v89 = a10;
  v88 = a11;
  v30 = v29;
  v87 = a12;
  v86 = a13;
  v85 = a14;
  v84 = a15;
  v83 = a16;
  v31 = a17;
  v32 = a18;
  v33 = a19;
  v34 = a20;
  v35 = a21;
  v36 = a22;
  v37 = a23;
  v95.receiver = self;
  v95.super_class = (Class)FCEndpointConfiguration;
  v38 = -[FCEndpointConfiguration init](&v95, sel_init);
  if (v38)
  {
    v39 = objc_msgSend(v28, "copy");
    clientAPIBaseURLString = v38->_clientAPIBaseURLString;
    v38->_clientAPIBaseURLString = (NSString *)v39;

    v41 = objc_msgSend(v30, "copy");
    notificationsBaseURLString = v38->_notificationsBaseURLString;
    v38->_notificationsBaseURLString = (NSString *)v41;

    v43 = objc_msgSend(v94, "copy");
    staticAssetBaseURLString = v38->_staticAssetBaseURLString;
    v38->_staticAssetBaseURLString = (NSString *)v43;

    v45 = objc_msgSend(v93, "copy");
    remoteDataSourceBaseURLString = v38->_remoteDataSourceBaseURLString;
    v38->_remoteDataSourceBaseURLString = (NSString *)v45;

    v47 = objc_msgSend(v92, "copy");
    newsletterAPIBaseURLString = v38->_newsletterAPIBaseURLString;
    v38->_newsletterAPIBaseURLString = (NSString *)v47;

    v49 = objc_msgSend(v91, "copy");
    appAnalyticsBaseURLString = v38->_appAnalyticsBaseURLString;
    v38->_appAnalyticsBaseURLString = (NSString *)v49;

    v51 = objc_msgSend(v90, "copy");
    fairPlayBaseURLString = v38->_fairPlayBaseURLString;
    v38->_fairPlayBaseURLString = (NSString *)v51;

    v53 = objc_msgSend(v89, "copy");
    searchAPIBaseURLString = v38->_searchAPIBaseURLString;
    v38->_searchAPIBaseURLString = (NSString *)v53;

    v55 = objc_msgSend(v88, "copy");
    puzzlesArchiveAPIBaseURLString = v38->_puzzlesArchiveAPIBaseURLString;
    v38->_puzzlesArchiveAPIBaseURLString = (NSString *)v55;

    v57 = objc_msgSend(v87, "copy");
    appAnalyticsNotificationReceiptBaseURLString = v38->_appAnalyticsNotificationReceiptBaseURLString;
    v38->_appAnalyticsNotificationReceiptBaseURLString = (NSString *)v57;

    v59 = objc_msgSend(v86, "copy");
    authTokenAPIBaseURLString = v38->_authTokenAPIBaseURLString;
    v38->_authTokenAPIBaseURLString = (NSString *)v59;

    v61 = objc_msgSend(v85, "copy");
    sportsDataVisualizationAPIBaseURLString = v38->_sportsDataVisualizationAPIBaseURLString;
    v38->_sportsDataVisualizationAPIBaseURLString = (NSString *)v61;

    v63 = objc_msgSend(v84, "copy");
    fineGrainedNewsletterSubscriptionBaseURLString = v38->_fineGrainedNewsletterSubscriptionBaseURLString;
    v38->_fineGrainedNewsletterSubscriptionBaseURLString = (NSString *)v63;

    v65 = objc_msgSend(v83, "copy");
    appAnalyticsSportsEventsBaseURLString = v38->_appAnalyticsSportsEventsBaseURLString;
    v38->_appAnalyticsSportsEventsBaseURLString = (NSString *)v65;

    v67 = objc_msgSend(v31, "copy");
    appAnalyticsAppHealthBaseURLString = v38->_appAnalyticsAppHealthBaseURLString;
    v38->_appAnalyticsAppHealthBaseURLString = (NSString *)v67;

    v69 = objc_msgSend(v32, "copy");
    appAnalyticsAppHeartbeatBaseURLString = v38->_appAnalyticsAppHeartbeatBaseURLString;
    v38->_appAnalyticsAppHeartbeatBaseURLString = (NSString *)v69;

    v71 = objc_msgSend(v33, "copy");
    ckOrderFeedBaseURLString = v38->_ckOrderFeedBaseURLString;
    v38->_ckOrderFeedBaseURLString = (NSString *)v71;

    v73 = objc_msgSend(v34, "copy");
    ckMultiFetchBaseURLString = v38->_ckMultiFetchBaseURLString;
    v38->_ckMultiFetchBaseURLString = (NSString *)v73;

    v75 = objc_msgSend(v35, "copy");
    ckRecordFetchBaseURLString = v38->_ckRecordFetchBaseURLString;
    v38->_ckRecordFetchBaseURLString = (NSString *)v75;

    v77 = objc_msgSend(v36, "copy");
    ckEdgeCachedOrderFeedBaseURLString = v38->_ckEdgeCachedOrderFeedBaseURLString;
    v38->_ckEdgeCachedOrderFeedBaseURLString = (NSString *)v77;

    v79 = objc_msgSend(v37, "copy");
    ckEdgeCachedMultiFetchBaseURLString = v38->_ckEdgeCachedMultiFetchBaseURLString;
    v38->_ckEdgeCachedMultiFetchBaseURLString = (NSString *)v79;

  }
  return v38;
}

- (NSString)clientAPIBaseURLString
{
  return self->_clientAPIBaseURLString;
}

- (NSString)appAnalyticsAppHeartbeatBaseURLString
{
  return self->_appAnalyticsAppHeartbeatBaseURLString;
}

- (NSString)notificationsBaseURLString
{
  return self->_notificationsBaseURLString;
}

- (NSString)newsletterAPIBaseURLString
{
  return self->_newsletterAPIBaseURLString;
}

- (NSString)staticAssetBaseURLString
{
  return self->_staticAssetBaseURLString;
}

- (NSString)remoteDataSourceBaseURLString
{
  return self->_remoteDataSourceBaseURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckEdgeCachedMultiFetchBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckEdgeCachedOrderFeedBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckRecordFetchBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckMultiFetchBaseURLString, 0);
  objc_storeStrong((id *)&self->_ckOrderFeedBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAppHeartbeatBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAppHealthBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsSportsEventsBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsNotificationReceiptBaseURLString, 0);
  objc_storeStrong((id *)&self->_fineGrainedNewsletterSubscriptionBaseURLString, 0);
  objc_storeStrong((id *)&self->_sportsDataVisualizationAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_authTokenAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_puzzlesArchiveAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_searchAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_fairPlayBaseURLString, 0);
  objc_storeStrong((id *)&self->_appAnalyticsBaseURLString, 0);
  objc_storeStrong((id *)&self->_newsletterAPIBaseURLString, 0);
  objc_storeStrong((id *)&self->_remoteDataSourceBaseURLString, 0);
  objc_storeStrong((id *)&self->_staticAssetBaseURLString, 0);
  objc_storeStrong((id *)&self->_notificationsBaseURLString, 0);
  objc_storeStrong((id *)&self->_clientAPIBaseURLString, 0);
}

- (NSString)appAnalyticsBaseURLString
{
  return self->_appAnalyticsBaseURLString;
}

- (FCEndpointConfiguration)initWithClientAPIBaseURLString:(id)a3 notificationsBaseURLString:(id)a4 staticAssetBaseURLString:(id)a5 remoteDataSourceBaseURLString:(id)a6 newsletterAPIBaseURLString:(id)a7 appAnalyticsBaseURLString:(id)a8 fairPlayBaseURLString:(id)a9 searchAPIBaseURLString:(id)a10 puzzlesArchiveAPIBaseURLString:(id)a11 appAnalyticsNotificationReceiptBaseURLString:(id)a12 authTokenAPIBaseURLString:(id)a13 sportsDataVisualizationAPIBaseURLString:(id)a14 fineGrainedNewsletterSubscriptionBaseURLString:(id)a15 appAnalyticsSportsEventsBaseURLString:(id)a16 appAnalyticsAppHealthBaseURLString:(id)a17 ckOrderFeedBaseURLString:(id)a18 ckMultiFetchBaseURLString:(id)a19 ckRecordFetchBaseURLString:(id)a20 ckEdgeCachedOrderFeedBaseURLString:(id)a21 ckEdgeCachedMultiFetchBaseURLString:(id)a22
{
  return -[FCEndpointConfiguration initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:](self, "initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           0,
           a18,
           a19,
           a20,
           a21,
           a22);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCEndpointConfiguration clientAPIBaseURLString](self, "clientAPIBaseURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientAPIBaseURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCEndpointConfiguration notificationsBaseURLString](self, "notificationsBaseURLString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notificationsBaseURLString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCEndpointConfiguration clientAPIBaseURLString](self, "clientAPIBaseURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCEndpointConfiguration notificationsBaseURLString](self, "notificationsBaseURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)searchAPIBaseURLString
{
  return self->_searchAPIBaseURLString;
}

- (NSString)puzzlesArchiveAPIBaseURLString
{
  return self->_puzzlesArchiveAPIBaseURLString;
}

- (NSString)authTokenAPIBaseURLString
{
  return self->_authTokenAPIBaseURLString;
}

- (NSString)sportsDataVisualizationAPIBaseURLString
{
  return self->_sportsDataVisualizationAPIBaseURLString;
}

- (NSString)fineGrainedNewsletterSubscriptionBaseURLString
{
  return self->_fineGrainedNewsletterSubscriptionBaseURLString;
}

- (NSString)appAnalyticsNotificationReceiptBaseURLString
{
  return self->_appAnalyticsNotificationReceiptBaseURLString;
}

- (NSString)appAnalyticsAppHealthBaseURLString
{
  return self->_appAnalyticsAppHealthBaseURLString;
}

- (NSString)ckEdgeCachedOrderFeedBaseURLString
{
  return self->_ckEdgeCachedOrderFeedBaseURLString;
}

@end
