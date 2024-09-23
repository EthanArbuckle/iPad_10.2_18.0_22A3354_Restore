@implementation AIMLExperimentationAnalyticsManager

- (AIMLExperimentationAnalyticsManager)init
{
  AIMLExperimentationAnalyticsManager *v2;
  uint64_t v3;
  AIMLExperimentationAnalyticsManagerInternal *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AIMLExperimentationAnalyticsManager;
  v2 = -[AIMLExperimentationAnalyticsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (AIMLExperimentationAnalyticsManagerInternal *)v3;

  }
  return v2;
}

- (void)emitTriggerForCodePathID:(id)a3 requestID:(id)a4 completionHandler:(id)a5
{
  -[AIMLExperimentationAnalyticsManagerInternal emitTriggerFor:requestID:completionHandler:](self->_underlyingObject, "emitTriggerFor:requestID:completionHandler:", a3, a4, a5);
}

- (void)cacheTrialExperimentsForCodePathID:(id)a3 completionHandler:(id)a4
{
  -[AIMLExperimentationAnalyticsManagerInternal cacheTrialExperimentsFor:completionHandler:](self->_underlyingObject, "cacheTrialExperimentsFor:completionHandler:", a3, a4);
}

- (void)cacheTrialExperimentsIdentifiersForCodePathID:(id)a3 namespaces:(id)a4 completionHandler:(id)a5
{
  -[AIMLExperimentationAnalyticsManagerInternal cacheTrialExperimentIdentifiersFor:namespaces:completionHandler:](self->_underlyingObject, "cacheTrialExperimentIdentifiersFor:namespaces:completionHandler:", a3, a4, a5);
}

- (void)emitTriggerFromCacheForCodePathID:(id)a3 requestID:(id)a4 completionHandler:(id)a5
{
  -[AIMLExperimentationAnalyticsManagerInternal emitTriggerFromCacheFor:requestID:completionHandler:](self->_underlyingObject, "emitTriggerFromCacheFor:requestID:completionHandler:", a3, a4, a5);
}

- (void)emitTriggerForCodePathID:(id)a3 withNamespace:(id)a4 requestID:(id)a5 completionHandler:(id)a6
{
  -[AIMLExperimentationAnalyticsManagerInternal emitTriggerFor:namespace:requestID:completionHandler:](self->_underlyingObject, "emitTriggerFor:namespace:requestID:completionHandler:", a3, a4, a5, a6);
}

- (AIMLExperimentationAnalyticsManagerInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
