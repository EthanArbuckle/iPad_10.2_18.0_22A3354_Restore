@implementation MTRBaseClusterLevelControl

- (void)moveToLevelWithParams:(MTRLevelControlClusterMoveToLevelParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterMoveToLevelParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterMoveToLevelParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D64CF4;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591C08, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)moveWithParams:(MTRLevelControlClusterMoveParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterMoveParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterMoveParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D64EC0;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591D10, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)stepWithParams:(MTRLevelControlClusterStepParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterStepParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterStepParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D6508C;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591D28, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)stopWithParams:(MTRLevelControlClusterStopParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterStopParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterStopParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D65258;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591D40, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)moveToLevelWithOnOffWithParams:(MTRLevelControlClusterMoveToLevelWithOnOffParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterMoveToLevelWithOnOffParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterMoveToLevelWithOnOffParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D65424;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591D58, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)moveWithOnOffWithParams:(MTRLevelControlClusterMoveWithOnOffParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterMoveWithOnOffParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterMoveWithOnOffParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D655F0;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591D70, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)stepWithOnOffWithParams:(MTRLevelControlClusterStepWithOnOffParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterStepWithOnOffParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterStepWithOnOffParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D657BC;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591E78, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)stopWithOnOffWithParams:(MTRLevelControlClusterStopWithOnOffParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterStopWithOnOffParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterStopWithOnOffParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D65988;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591E90, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)moveToClosestFrequencyWithParams:(MTRLevelControlClusterMoveToClosestFrequencyParams *)params completion:(MTRStatusCompletion)completion
{
  MTRLevelControlClusterMoveToClosestFrequencyParams *v6;
  MTRStatusCompletion v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRLevelControlClusterMoveToClosestFrequencyParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233D65B54;
  v29 = &unk_2504F4BE8;
  v8 = v7;
  v30 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250591E60, &unk_250591EA8, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)readAttributeCurrentLevelWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591C38, 0, v12, v14);

}

- (void)subscribeAttributeCurrentLevelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591C38, v20, v18, v9, v8);

}

+ (void)readAttributeCurrentLevelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 0, v10, v11);

}

- (void)readAttributeRemainingTimeWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591C50, 0, v12, v14);

}

- (void)subscribeAttributeRemainingTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591C50, v20, v18, v9, v8);

}

+ (void)readAttributeRemainingTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 1, v10, v11);

}

- (void)readAttributeMinLevelWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591EC0, 0, v12, v14);

}

- (void)subscribeAttributeMinLevelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591EC0, v20, v18, v9, v8);

}

+ (void)readAttributeMinLevelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 2, v10, v11);

}

- (void)readAttributeMaxLevelWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591ED8, 0, v12, v14);

}

- (void)subscribeAttributeMaxLevelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591ED8, v20, v18, v9, v8);

}

+ (void)readAttributeMaxLevelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 3, v10, v11);

}

- (void)readAttributeCurrentFrequencyWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591EF0, 0, v12, v14);

}

- (void)subscribeAttributeCurrentFrequencyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591EF0, v20, v18, v9, v8);

}

+ (void)readAttributeCurrentFrequencyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 4, v10, v11);

}

- (void)readAttributeMinFrequencyWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F08, 0, v12, v14);

}

- (void)subscribeAttributeMinFrequencyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F08, v20, v18, v9, v8);

}

+ (void)readAttributeMinFrequencyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 5, v10, v11);

}

- (void)readAttributeMaxFrequencyWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F20, 0, v12, v14);

}

- (void)subscribeAttributeMaxFrequencyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F20, v20, v18, v9, v8);

}

+ (void)readAttributeMaxFrequencyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 6, v10, v11);

}

- (void)readAttributeOptionsWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F38, 0, v12, v14);

}

- (void)writeAttributeOptionsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOptionsWithValue_params_completion_, value);
}

- (void)writeAttributeOptionsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(void **@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D67050;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D67060;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeOptionsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F38, v20, v18, v9, v8);

}

+ (void)readAttributeOptionsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 15, v10, v11);

}

- (void)readAttributeOnOffTransitionTimeWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591E48, 0, v12, v14);

}

- (void)writeAttributeOnOffTransitionTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnOffTransitionTimeWithValue_params_completion_, value);
}

- (void)writeAttributeOnOffTransitionTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(void **@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D676C4;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D676D4;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeOnOffTransitionTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591E48, v20, v18, v9, v8);

}

+ (void)readAttributeOnOffTransitionTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 16, v10, v11);

}

- (void)readAttributeOnLevelWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F50, 0, v12, v14);

}

- (void)writeAttributeOnLevelWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnLevelWithValue_params_completion_, value);
}

- (void)writeAttributeOnLevelWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D67D38;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D67D48;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeOnLevelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F50, v20, v18, v9, v8);

}

+ (void)readAttributeOnLevelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 17, v10, v11);

}

- (void)readAttributeOnTransitionTimeWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F68, 0, v12, v14);

}

- (void)writeAttributeOnTransitionTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnTransitionTimeWithValue_params_completion_, value);
}

- (void)writeAttributeOnTransitionTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D683BC;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D683CC;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeOnTransitionTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F68, v20, v18, v9, v8);

}

+ (void)readAttributeOnTransitionTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 18, v10, v11);

}

- (void)readAttributeOffTransitionTimeWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F80, 0, v12, v14);

}

- (void)writeAttributeOffTransitionTimeWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOffTransitionTimeWithValue_params_completion_, value);
}

- (void)writeAttributeOffTransitionTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D68A44;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D68A54;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeOffTransitionTimeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F80, v20, v18, v9, v8);

}

+ (void)readAttributeOffTransitionTimeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 19, v10, v11);

}

- (void)readAttributeDefaultMoveRateWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591F98, 0, v12, v14);

}

- (void)writeAttributeDefaultMoveRateWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeDefaultMoveRateWithValue_params_completion_, value);
}

- (void)writeAttributeDefaultMoveRateWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D690CC;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D690DC;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeDefaultMoveRateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591F98, v20, v18, v9, v8);

}

+ (void)readAttributeDefaultMoveRateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 20, v10, v11);

}

- (void)readAttributeStartUpCurrentLevelWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591DD0, 0, v12, v14);

}

- (void)writeAttributeStartUpCurrentLevelWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeStartUpCurrentLevelWithValue_params_completion_, value);
}

- (void)writeAttributeStartUpCurrentLevelWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSNumber *v8;
  MTRWriteParams *v9;
  MTRStatusCompletion v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, _QWORD *@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterLevelControl *v34;
  _QWORD v35[4];
  id v36;

  v8 = value;
  v9 = params;
  v10 = completion;
  v13 = (void *)objc_msgSend_copy(v9, v11, v12);

  v16 = (void *)objc_msgSend_copy(v8, v14, v15);
  v17 = (_QWORD *)operator new();
  objc_msgSend_callbackQueue(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_233D69750;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D69760;
  v31 = &unk_2504F4C10;
  v23 = v13;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v34 = self;
  sub_233FBC5E4((uint64_t)v17, v20, (uint64_t)v35, &v28, (uint64_t)sub_233FBC5D8);
  *v17 = &off_2504F55A8;

  objc_msgSend_device(self, v25, v26, v28, v29, v30, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  sub_233CE6A5C((uint64_t)v17, v27);

}

- (void)subscribeAttributeStartUpCurrentLevelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591DD0, v20, v18, v9, v8);

}

+ (void)readAttributeStartUpCurrentLevelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 0x4000, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591C68, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591C68, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 65528, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591C80, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591C80, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 65529, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591C98, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591C98, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 65530, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591CB0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591CB0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 65531, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591CC8, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591CC8, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 65532, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250591E60, &unk_250591CE0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250591E60, &unk_250591CE0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 8, 65533, v10, v11);

}

- (void)moveToLevelWithParams:(MTRLevelControlClusterMoveToLevelParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_moveToLevelWithParams_completion_, params);
}

- (void)moveWithParams:(MTRLevelControlClusterMoveParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_moveWithParams_completion_, params);
}

- (void)stepWithParams:(MTRLevelControlClusterStepParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_stepWithParams_completion_, params);
}

- (void)moveToLevelWithOnOffWithParams:(MTRLevelControlClusterMoveToLevelWithOnOffParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_moveToLevelWithOnOffWithParams_completion_, params);
}

- (void)moveWithOnOffWithParams:(MTRLevelControlClusterMoveWithOnOffParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_moveWithOnOffWithParams_completion_, params);
}

- (void)stepWithOnOffWithParams:(MTRLevelControlClusterStepWithOnOffParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_stepWithOnOffWithParams_completion_, params);
}

- (void)stopWithOnOffWithParams:(MTRLevelControlClusterStopWithOnOffParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_stopWithOnOffWithParams_completion_, params);
}

- (void)moveToClosestFrequencyWithParams:(MTRLevelControlClusterMoveToClosestFrequencyParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_moveToClosestFrequencyWithParams_completion_, params);
}

- (void)readAttributeCurrentLevelWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6AAB8;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeCurrentLevelWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeCurrentLevelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6AC18;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeCurrentLevelWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeCurrentLevelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6AD20;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeCurrentLevelWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeRemainingTimeWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6ADBC;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeRemainingTimeWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeRemainingTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6AF1C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeRemainingTimeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeRemainingTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6B024;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeRemainingTimeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeMinLevelWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6B0C0;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMinLevelWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMinLevelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6B220;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMinLevelWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMinLevelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6B328;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMinLevelWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeMaxLevelWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6B3C4;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMaxLevelWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMaxLevelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6B524;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMaxLevelWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMaxLevelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6B62C;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMaxLevelWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeCurrentFrequencyWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6B6C8;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeCurrentFrequencyWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeCurrentFrequencyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6B828;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeCurrentFrequencyWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeCurrentFrequencyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6B930;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeCurrentFrequencyWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeMinFrequencyWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6B9CC;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMinFrequencyWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMinFrequencyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6BB2C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMinFrequencyWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMinFrequencyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6BC34;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMinFrequencyWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeMaxFrequencyWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6BCD0;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeMaxFrequencyWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeMaxFrequencyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6BE30;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeMaxFrequencyWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeMaxFrequencyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6BF38;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeMaxFrequencyWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeOptionsWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6BFD4;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeOptionsWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeOptionsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOptionsWithValue_params_completion_, value);
}

- (void)writeAttributeOptionsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOptionsWithValue_params_completion_, value);
}

- (void)subscribeAttributeOptionsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6C144;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeOptionsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeOptionsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6C24C;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeOptionsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeOnOffTransitionTimeWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6C2E8;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeOnOffTransitionTimeWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeOnOffTransitionTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnOffTransitionTimeWithValue_params_completion_, value);
}

- (void)writeAttributeOnOffTransitionTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnOffTransitionTimeWithValue_params_completion_, value);
}

- (void)subscribeAttributeOnOffTransitionTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6C458;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeOnOffTransitionTimeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeOnOffTransitionTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6C560;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeOnOffTransitionTimeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeOnLevelWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6C5FC;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeOnLevelWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeOnLevelWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnLevelWithValue_params_completion_, value);
}

- (void)writeAttributeOnLevelWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnLevelWithValue_params_completion_, value);
}

- (void)subscribeAttributeOnLevelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6C76C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeOnLevelWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeOnLevelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6C874;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeOnLevelWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeOnTransitionTimeWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6C910;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeOnTransitionTimeWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeOnTransitionTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnTransitionTimeWithValue_params_completion_, value);
}

- (void)writeAttributeOnTransitionTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOnTransitionTimeWithValue_params_completion_, value);
}

- (void)subscribeAttributeOnTransitionTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6CA80;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeOnTransitionTimeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeOnTransitionTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6CB88;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeOnTransitionTimeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeOffTransitionTimeWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6CC24;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeOffTransitionTimeWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeOffTransitionTimeWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOffTransitionTimeWithValue_params_completion_, value);
}

- (void)writeAttributeOffTransitionTimeWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOffTransitionTimeWithValue_params_completion_, value);
}

- (void)subscribeAttributeOffTransitionTimeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6CD94;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeOffTransitionTimeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeOffTransitionTimeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6CE9C;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeOffTransitionTimeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeDefaultMoveRateWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6CF38;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeDefaultMoveRateWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeDefaultMoveRateWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeDefaultMoveRateWithValue_params_completion_, value);
}

- (void)writeAttributeDefaultMoveRateWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeDefaultMoveRateWithValue_params_completion_, value);
}

- (void)subscribeAttributeDefaultMoveRateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6D0A8;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeDefaultMoveRateWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeDefaultMoveRateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6D1B0;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeDefaultMoveRateWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeStartUpCurrentLevelWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D6D24C;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeStartUpCurrentLevelWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeStartUpCurrentLevelWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeStartUpCurrentLevelWithValue_params_completion_, value);
}

- (void)writeAttributeStartUpCurrentLevelWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeStartUpCurrentLevelWithValue_params_completion_, value);
}

- (void)subscribeAttributeStartUpCurrentLevelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D6D3BC;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeStartUpCurrentLevelWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeStartUpCurrentLevelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D6D4C4;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeStartUpCurrentLevelWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

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
  v7[2] = sub_233D6D560;
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
  v26[2] = sub_233D6D6C0;
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
  v18[2] = sub_233D6D7C8;
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
  v7[2] = sub_233D6D864;
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
  v26[2] = sub_233D6D9C4;
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
  v18[2] = sub_233D6DACC;
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
  v7[2] = sub_233D6DB68;
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
  v26[2] = sub_233D6DCC8;
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
  v18[2] = sub_233D6DDD0;
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
  v7[2] = sub_233D6DE6C;
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
  v26[2] = sub_233D6DFCC;
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
  v18[2] = sub_233D6E0D4;
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
  v7[2] = sub_233D6E170;
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
  v26[2] = sub_233D6E2D0;
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
  v18[2] = sub_233D6E3D8;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (MTRBaseClusterLevelControl)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRBaseDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRBaseClusterLevelControl *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRBaseClusterLevelControl *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end
