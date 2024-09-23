@implementation GEOOfflineDirectionsServiceRequesterOperation

- (GEOOfflineDirectionsServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17;
  GEOOfflineDirectionsServiceRequesterOperation *v18;
  void *v19;
  uint64_t v20;
  NSString *offlineCohortId;
  objc_super v23;

  v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOOfflineDirectionsServiceRequesterOperation;
  v18 = -[GEOOfflineServiceRequesterOperation initWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:validationHandler:completionHandler:](&v23, sel_initWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_validationHandler_completionHandler_, a3, a4, v17, a6, a7, a8, a9, a10, a11);
  if (v18)
  {
    objc_msgSend(v17, "offlineCohortId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    offlineCohortId = v18->_offlineCohortId;
    v18->_offlineCohortId = (NSString *)v20;

  }
  return v18;
}

- (void)_recordAnalyticsDataForResponse:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v8;
    if (objc_msgSend(v6, "hasAnalyticData"))
    {
      objc_msgSend(v6, "analyticData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEORequestResponseMetadataRecorder recordDirectionsRequestResponseAnalyticsData:forCohortId:](GEORequestResponseMetadataRecorder, "recordDirectionsRequestResponseAnalyticsData:forCohortId:", v7, self->_offlineCohortId);

    }
    v5 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineCohortId, 0);
}

@end
