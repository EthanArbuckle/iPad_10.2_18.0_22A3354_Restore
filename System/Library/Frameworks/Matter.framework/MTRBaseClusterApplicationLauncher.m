@implementation MTRBaseClusterApplicationLauncher

- (void)launchAppWithCompletion:(id)a3
{
  objc_msgSend_launchAppWithParams_completion_(self, a2, 0, a3);
}

- (void)launchAppWithParams:(MTRApplicationLauncherClusterLaunchAppParams *)params completion:(void *)completion
{
  MTRApplicationLauncherClusterLaunchAppParams *v6;
  void *v7;
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
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRApplicationLauncherClusterLaunchAppParams);
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = sub_233F40408;
  v30 = &unk_2504F4BE8;
  v8 = v7;
  v31 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v27);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_2505934F8, &unk_250591C08, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);

}

- (void)stopAppWithCompletion:(id)a3
{
  objc_msgSend_stopAppWithParams_completion_(self, a2, 0, a3);
}

- (void)stopAppWithParams:(MTRApplicationLauncherClusterStopAppParams *)params completion:(void *)completion
{
  MTRApplicationLauncherClusterStopAppParams *v6;
  void *v7;
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
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRApplicationLauncherClusterStopAppParams);
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = sub_233F405EC;
  v30 = &unk_2504F4BE8;
  v8 = v7;
  v31 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v27);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_2505934F8, &unk_250591D10, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);

}

- (void)hideAppWithCompletion:(id)a3
{
  objc_msgSend_hideAppWithParams_completion_(self, a2, 0, a3);
}

- (void)hideAppWithParams:(MTRApplicationLauncherClusterHideAppParams *)params completion:(void *)completion
{
  MTRApplicationLauncherClusterHideAppParams *v6;
  void *v7;
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
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;

  v6 = params;
  v7 = completion;
  if (!v6)
    v6 = objc_alloc_init(MTRApplicationLauncherClusterHideAppParams);
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = sub_233F407D0;
  v30 = &unk_2504F4BE8;
  v8 = v7;
  v31 = v8;
  v9 = (void *)MEMORY[0x23493EEA8](&v27);
  objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_2505934F8, &unk_250591D28, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);

}

- (void)readAttributeCatalogListWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591C38, 0, v12, v14);

}

- (void)subscribeAttributeCatalogListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591C38, v20, v18, v9, v8);

}

+ (void)readAttributeCatalogListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 0, v10, v11);

}

- (void)readAttributeCurrentAppWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591C50, 0, v12, v14);

}

- (void)writeAttributeCurrentAppWithValue:(MTRApplicationLauncherClusterApplicationEPStruct *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeCurrentAppWithValue_params_completion_, value);
}

- (void)writeAttributeCurrentAppWithValue:(MTRApplicationLauncherClusterApplicationEPStruct *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRApplicationLauncherClusterApplicationEPStruct *v8;
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
  MTRBaseClusterApplicationLauncher *v34;
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
  v35[2] = sub_233F40D80;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233F40D90;
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

- (void)subscribeAttributeCurrentAppWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591C50, v20, v18, v9, v8);

}

+ (void)readAttributeCurrentAppWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 1, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591C68, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591C68, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 65528, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591C80, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591C80, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 65529, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591C98, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591C98, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 65530, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591CB0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591CB0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 65531, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591CC8, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591CC8, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 65532, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505934F8, &unk_250591CE0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505934F8, &unk_250591CE0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1292, 65533, v10, v11);

}

- (void)launchAppWithParams:(MTRApplicationLauncherClusterLaunchAppParams *)params completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = completionHandler;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_233F421CC;
  v9[3] = &unk_2504F52C8;
  v10 = v6;
  v7 = v6;
  objc_msgSend_launchAppWithParams_completion_(self, v8, (uint64_t)params, v9);

}

- (void)stopAppWithParams:(MTRApplicationLauncherClusterStopAppParams *)params completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = completionHandler;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_233F42278;
  v9[3] = &unk_2504F52C8;
  v10 = v6;
  v7 = v6;
  objc_msgSend_stopAppWithParams_completion_(self, v8, (uint64_t)params, v9);

}

- (void)hideAppWithParams:(MTRApplicationLauncherClusterHideAppParams *)params completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = completionHandler;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_233F42324;
  v9[3] = &unk_2504F52C8;
  v10 = v6;
  v7 = v6;
  objc_msgSend_hideAppWithParams_completion_(self, v8, (uint64_t)params, v9);

}

- (void)readAttributeCatalogListWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233F423C0;
  v7[3] = &unk_2504F4C60;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeCatalogListWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeCatalogListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233F42520;
  v26[3] = &unk_2504F4C60;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeCatalogListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeCatalogListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233F42628;
  v18[3] = &unk_2504F4C60;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeCatalogListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeCurrentAppWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233F426C4;
  v7[3] = &unk_2504F52F0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeCurrentAppWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)writeAttributeCurrentAppWithValue:(MTRApplicationLauncherClusterApplicationEP *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeCurrentAppWithValue_params_completion_, value);
}

- (void)writeAttributeCurrentAppWithValue:(MTRApplicationLauncherClusterApplicationEP *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeCurrentAppWithValue_params_completion_, value);
}

- (void)subscribeAttributeCurrentAppWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233F42834;
  v26[3] = &unk_2504F52F0;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeCurrentAppWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeCurrentAppWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233F4293C;
  v18[3] = &unk_2504F52F0;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeCurrentAppWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

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
  v7[2] = sub_233F429D8;
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
  v26[2] = sub_233F42B38;
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
  v18[2] = sub_233F42C40;
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
  v7[2] = sub_233F42CDC;
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
  v26[2] = sub_233F42E3C;
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
  v18[2] = sub_233F42F44;
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
  v7[2] = sub_233F42FE0;
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
  v26[2] = sub_233F43140;
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
  v18[2] = sub_233F43248;
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
  v7[2] = sub_233F432E4;
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
  v26[2] = sub_233F43444;
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
  v18[2] = sub_233F4354C;
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
  v7[2] = sub_233F435E8;
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
  v26[2] = sub_233F43748;
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
  v18[2] = sub_233F43850;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (MTRBaseClusterApplicationLauncher)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRBaseDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRBaseClusterApplicationLauncher *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRBaseClusterApplicationLauncher *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end
