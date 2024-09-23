@implementation MTRBaseClusterTemperatureMeasurement

- (void)readAttributeMeasuredValueWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591C38, 0, v12, v14);

}

- (void)subscribeAttributeMeasuredValueWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591C38, v20, v18, v9, v8);

}

+ (void)readAttributeMeasuredValueWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 0, v10, v11);

}

- (void)readAttributeMinMeasuredValueWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591C50, 0, v12, v14);

}

- (void)subscribeAttributeMinMeasuredValueWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591C50, v20, v18, v9, v8);

}

+ (void)readAttributeMinMeasuredValueWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 1, v10, v11);

}

- (void)readAttributeMaxMeasuredValueWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591EC0, 0, v12, v14);

}

- (void)subscribeAttributeMaxMeasuredValueWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591EC0, v20, v18, v9, v8);

}

+ (void)readAttributeMaxMeasuredValueWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 2, v10, v11);

}

- (void)readAttributeToleranceWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591ED8, 0, v12, v14);

}

- (void)subscribeAttributeToleranceWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591ED8, v20, v18, v9, v8);

}

+ (void)readAttributeToleranceWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 3, v10, v11);

}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591C68, 0, v12, v14);

}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591C68, v20, v18, v9, v8);

}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 65528, v10, v11);

}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591C80, 0, v12, v14);

}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591C80, v20, v18, v9, v8);

}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 65529, v10, v11);

}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591C98, 0, v12, v14);

}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591C98, v20, v18, v9, v8);

}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 65530, v10, v11);

}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591CB0, 0, v12, v14);

}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591CB0, v20, v18, v9, v8);

}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 65531, v10, v11);

}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591CC8, 0, v12, v14);

}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591CC8, v20, v18, v9, v8);

}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 65532, v10, v11);

}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = completion;
  objc_msgSend_device(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250593270, &unk_250591CE0, 0, v12, v14);

}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRSubscriptionEstablishedHandler v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  MTRSubscribeParams *v20;

  v20 = params;
  v8 = subscriptionEstablished;
  v9 = reportHandler;
  objc_msgSend_device(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250593270, &unk_250591CE0, v20, v18, v9, v8);

}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  MTRClusterStateCacheContainer *v16;

  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  v11 = completion;
  v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1026, 65533, v10, v11);

}

- (void)readAttributeMeasuredValueWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EEBEB0;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMeasuredValueWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMeasuredValueWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EEC010;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMeasuredValueWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMeasuredValueWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EEC118;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMeasuredValueWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeMinMeasuredValueWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EEC1B4;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMinMeasuredValueWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMinMeasuredValueWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EEC314;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMinMeasuredValueWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMinMeasuredValueWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EEC41C;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMinMeasuredValueWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeMaxMeasuredValueWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EEC4B8;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMaxMeasuredValueWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMaxMeasuredValueWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EEC618;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMaxMeasuredValueWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMaxMeasuredValueWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EEC720;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMaxMeasuredValueWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeToleranceWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EEC7BC;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeToleranceWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeToleranceWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EEC91C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeToleranceWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeToleranceWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EECA24;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeToleranceWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EECAC0;
  v7[3] = &unk_2504F4C60;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeGeneratedCommandListWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EECC20;
  v26[3] = &unk_2504F4C60;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EECD28;
  v18[3] = &unk_2504F4C60;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeGeneratedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EECDC4;
  v7[3] = &unk_2504F4C60;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeAcceptedCommandListWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EECF24;
  v26[3] = &unk_2504F4C60;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EED02C;
  v18[3] = &unk_2504F4C60;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeAcceptedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EED0C8;
  v7[3] = &unk_2504F4C60;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeAttributeListWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EED228;
  v26[3] = &unk_2504F4C60;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EED330;
  v18[3] = &unk_2504F4C60;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeAttributeListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EED3CC;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeFeatureMapWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EED52C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EED634;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeFeatureMapWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233EED6D0;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeClusterRevisionWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  NSNumber *v12;
  NSNumber *v13;
  MTRSubscriptionEstablishedHandler v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRSubscribeParams *v22;
  const char *v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;

  v12 = minInterval;
  v13 = maxInterval;
  v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = (void *)objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_233EED830;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  NSNumber *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v10 = endpoint;
  v11 = queue;
  v12 = completionHandler;
  objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_233EED938;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (MTRBaseClusterTemperatureMeasurement)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRBaseDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRBaseClusterTemperatureMeasurement *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRBaseClusterTemperatureMeasurement *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end
