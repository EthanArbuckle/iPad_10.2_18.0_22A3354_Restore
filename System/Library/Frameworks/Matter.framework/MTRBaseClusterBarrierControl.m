@implementation MTRBaseClusterBarrierControl

- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params completion:(MTRStatusCompletion)completion
{
  MTRBarrierControlClusterBarrierControlGoToPercentParams *v6;
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
    v6 = objc_alloc_init(MTRBarrierControlClusterBarrierControlGoToPercentParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233E85D3C;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250592EF8, &unk_250591C08, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)barrierControlStopWithCompletion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_barrierControlStopWithParams_completion_, 0);
}

- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params completion:(MTRStatusCompletion)completion
{
  MTRBarrierControlClusterBarrierControlStopParams *v6;
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
    v6 = objc_alloc_init(MTRBarrierControlClusterBarrierControlStopParams);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233E85F14;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_250592EF8, &unk_250591D10, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);

}

- (void)readAttributeBarrierMovingStateWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591C50, 0, v12, v14);

}

- (void)subscribeAttributeBarrierMovingStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591C50, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierMovingStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 1, v10, v11);

}

- (void)readAttributeBarrierSafetyStatusWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591EC0, 0, v12, v14);

}

- (void)subscribeAttributeBarrierSafetyStatusWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591EC0, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierSafetyStatusWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 2, v10, v11);

}

- (void)readAttributeBarrierCapabilitiesWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591ED8, 0, v12, v14);

}

- (void)subscribeAttributeBarrierCapabilitiesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591ED8, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierCapabilitiesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 3, v10, v11);

}

- (void)readAttributeBarrierOpenEventsWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591EF0, 0, v12, v14);

}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierOpenEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
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
  MTRBaseClusterBarrierControl *v34;
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
  v35[2] = sub_233E869E0;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233E869F0;
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

- (void)subscribeAttributeBarrierOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591EF0, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 4, v10, v11);

}

- (void)readAttributeBarrierCloseEventsWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591F08, 0, v12, v14);

}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCloseEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
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
  MTRBaseClusterBarrierControl *v34;
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
  v35[2] = sub_233E87054;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233E87064;
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

- (void)subscribeAttributeBarrierCloseEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591F08, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierCloseEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 5, v10, v11);

}

- (void)readAttributeBarrierCommandOpenEventsWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591F20, 0, v12, v14);

}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCommandOpenEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
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
  MTRBaseClusterBarrierControl *v34;
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
  v35[2] = sub_233E876C8;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233E876D8;
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

- (void)subscribeAttributeBarrierCommandOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591F20, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierCommandOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 6, v10, v11);

}

- (void)readAttributeBarrierCommandCloseEventsWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250592178, 0, v12, v14);

}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCommandCloseEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
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
  MTRBaseClusterBarrierControl *v34;
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
  v35[2] = sub_233E87D3C;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233E87D4C;
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

- (void)subscribeAttributeBarrierCommandCloseEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250592178, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierCommandCloseEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 7, v10, v11);

}

- (void)readAttributeBarrierOpenPeriodWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250592190, 0, v12, v14);

}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierOpenPeriodWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
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
  MTRBaseClusterBarrierControl *v34;
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
  v35[2] = sub_233E883B0;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233E883C0;
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

- (void)subscribeAttributeBarrierOpenPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250592190, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierOpenPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 8, v10, v11);

}

- (void)readAttributeBarrierClosePeriodWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_2505921A8, 0, v12, v14);

}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierClosePeriodWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
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
  MTRBaseClusterBarrierControl *v34;
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
  v35[2] = sub_233E88A24;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233E88A34;
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

- (void)subscribeAttributeBarrierClosePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_2505921A8, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierClosePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 9, v10, v11);

}

- (void)readAttributeBarrierPositionWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_2505921C0, 0, v12, v14);

}

- (void)subscribeAttributeBarrierPositionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_2505921C0, v20, v18, v9, v8);

}

+ (void)readAttributeBarrierPositionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 10, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591C68, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591C68, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 65528, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591C80, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591C80, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 65529, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591C98, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591C98, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 65530, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591CB0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591CB0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 65531, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591CC8, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591CC8, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 65532, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_250592EF8, &unk_250591CE0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_250592EF8, &unk_250591CE0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 259, 65533, v10, v11);

}

- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_barrierControlGoToPercentWithParams_completion_, params);
}

- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_barrierControlStopWithParams_completion_, params);
}

- (void)barrierControlStopWithCompletionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_barrierControlStopWithParams_completionHandler_, 0);
}

- (void)readAttributeBarrierMovingStateWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E89FF8;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierMovingStateWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeBarrierMovingStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8A158;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierMovingStateWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierMovingStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8A260;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierMovingStateWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierSafetyStatusWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8A2FC;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierSafetyStatusWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeBarrierSafetyStatusWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8A45C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierSafetyStatusWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierSafetyStatusWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8A564;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierSafetyStatusWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierCapabilitiesWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8A600;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierCapabilitiesWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeBarrierCapabilitiesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8A760;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCapabilitiesWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierCapabilitiesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8A868;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierCapabilitiesWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierOpenEventsWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8A904;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierOpenEventsWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierOpenEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierOpenEventsWithValue_params_completion_, value);
}

- (void)subscribeAttributeBarrierOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8AA74;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierOpenEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8AB7C;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierOpenEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierCloseEventsWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8AC18;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierCloseEventsWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCloseEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCloseEventsWithValue_params_completion_, value);
}

- (void)subscribeAttributeBarrierCloseEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8AD88;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCloseEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierCloseEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8AE90;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierCloseEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierCommandOpenEventsWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8AF2C;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierCommandOpenEventsWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCommandOpenEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCommandOpenEventsWithValue_params_completion_, value);
}

- (void)subscribeAttributeBarrierCommandOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8B09C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCommandOpenEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierCommandOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8B1A4;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierCommandOpenEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierCommandCloseEventsWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8B240;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierCommandCloseEventsWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCommandCloseEventsWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierCommandCloseEventsWithValue_params_completion_, value);
}

- (void)subscribeAttributeBarrierCommandCloseEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8B3B0;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCommandCloseEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierCommandCloseEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8B4B8;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierCommandCloseEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierOpenPeriodWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8B554;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierOpenPeriodWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierOpenPeriodWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierOpenPeriodWithValue_params_completion_, value);
}

- (void)subscribeAttributeBarrierOpenPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8B6C4;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierOpenPeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierOpenPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8B7CC;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierOpenPeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierClosePeriodWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8B868;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierClosePeriodWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierClosePeriodWithValue_params_completion_, value);
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBarrierClosePeriodWithValue_params_completion_, value);
}

- (void)subscribeAttributeBarrierClosePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8B9D8;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierClosePeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierClosePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8BAE0;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierClosePeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeBarrierPositionWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233E8BB7C;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeBarrierPositionWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeBarrierPositionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233E8BCDC;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeBarrierPositionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeBarrierPositionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233E8BDE4;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeBarrierPositionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

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
  v7[2] = sub_233E8BE80;
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
  v26[2] = sub_233E8BFE0;
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
  v18[2] = sub_233E8C0E8;
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
  v7[2] = sub_233E8C184;
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
  v26[2] = sub_233E8C2E4;
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
  v18[2] = sub_233E8C3EC;
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
  v7[2] = sub_233E8C488;
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
  v26[2] = sub_233E8C5E8;
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
  v18[2] = sub_233E8C6F0;
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
  v7[2] = sub_233E8C78C;
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
  v26[2] = sub_233E8C8EC;
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
  v18[2] = sub_233E8C9F4;
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
  v7[2] = sub_233E8CA90;
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
  v26[2] = sub_233E8CBF0;
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
  v18[2] = sub_233E8CCF8;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (MTRBaseClusterBarrierControl)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRBaseDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRBaseClusterBarrierControl *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRBaseClusterBarrierControl *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end
