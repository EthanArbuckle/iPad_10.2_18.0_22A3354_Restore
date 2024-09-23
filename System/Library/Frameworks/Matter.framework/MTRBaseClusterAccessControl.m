@implementation MTRBaseClusterAccessControl

- (void)readAttributeACLWithParams:(MTRReadParams *)params completion:(void *)completion
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  MTRReadParams *v17;

  v17 = params;
  v6 = completion;
  objc_msgSend_device(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v9, v16, (uint64_t)v12, &unk_2505920D0, &unk_250591C38, v17, v15, v6);

}

- (void)writeAttributeACLWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeACLWithValue_params_completion_, value);
}

- (void)writeAttributeACLWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSArray *v8;
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
  uint64_t (*v30)@<X0>(void **@<X0>, const char *@<X1>, uint64_t@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, uint64_t@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterAccessControl *v34;
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
  v35[2] = sub_233D7C3C4;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D7C3D4;
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

- (void)subscribeAttributeACLWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591C38, v20, v18, v9, v8);

}

+ (void)readAttributeACLWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 0, v10, v11);

}

- (void)readAttributeExtensionWithParams:(MTRReadParams *)params completion:(void *)completion
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  MTRReadParams *v17;

  v17 = params;
  v6 = completion;
  objc_msgSend_device(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v9, v16, (uint64_t)v12, &unk_2505920D0, &unk_250591C50, v17, v15, v6);

}

- (void)writeAttributeExtensionWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeExtensionWithValue_params_completion_, value);
}

- (void)writeAttributeExtensionWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  NSArray *v8;
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
  uint64_t (*v30)@<X0>(void **@<X0>, const char *@<X1>, uint64_t *@<X2>, uint64_t@<X3>, uint64_t@<X4>, uint64_t@<X5>, uint64_t@<X8>);
  void *v31;
  id v32;
  id v33;
  MTRBaseClusterAccessControl *v34;
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
  v35[2] = sub_233D7D204;
  v35[3] = &unk_2504F4BE8;
  v22 = v10;
  v36 = v22;
  v28 = v21;
  v29 = 3221225472;
  v30 = sub_233D7D214;
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

- (void)subscribeAttributeExtensionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591C50, v20, v18, v9, v8);

}

+ (void)readAttributeExtensionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 1, v10, v11);

}

- (void)readAttributeSubjectsPerAccessControlEntryWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591EC0, 0, v12, v14);

}

- (void)subscribeAttributeSubjectsPerAccessControlEntryWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591EC0, v20, v18, v9, v8);

}

+ (void)readAttributeSubjectsPerAccessControlEntryWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 2, v10, v11);

}

- (void)readAttributeTargetsPerAccessControlEntryWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591ED8, 0, v12, v14);

}

- (void)subscribeAttributeTargetsPerAccessControlEntryWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591ED8, v20, v18, v9, v8);

}

+ (void)readAttributeTargetsPerAccessControlEntryWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 3, v10, v11);

}

- (void)readAttributeAccessControlEntriesPerFabricWithCompletion:(void *)completion
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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591EF0, 0, v12, v14);

}

- (void)subscribeAttributeAccessControlEntriesPerFabricWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591EF0, v20, v18, v9, v8);

}

+ (void)readAttributeAccessControlEntriesPerFabricWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 4, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591C68, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591C68, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 65528, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591C80, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591C80, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 65529, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591C98, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591C98, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 65530, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591CB0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591CB0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 65531, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591CC8, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591CC8, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 65532, v10, v11);

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
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_2505920D0, &unk_250591CE0, 0, v12, v14);

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
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_2505920D0, &unk_250591CE0, v20, v18, v9, v8);

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
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 31, 65533, v10, v11);

}

- (void)readAttributeAclWithParams:(MTRReadParams *)params completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = completionHandler;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_233D7EEEC;
  v9[3] = &unk_2504F4C60;
  v10 = v6;
  v7 = v6;
  objc_msgSend_readAttributeACLWithParams_completion_(self, v8, (uint64_t)params, v9);

}

- (void)writeAttributeAclWithValue:(NSArray *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeACLWithValue_params_completion_, value);
}

- (void)writeAttributeAclWithValue:(NSArray *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeACLWithValue_params_completion_, value);
}

- (void)subscribeAttributeAclWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D7F05C;
  v26[3] = &unk_2504F4C60;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeACLWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeAclWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D7F164;
  v18[3] = &unk_2504F4C60;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeACLWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeExtensionWithParams:(MTRReadParams *)params completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = completionHandler;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_233D7F210;
  v9[3] = &unk_2504F4C60;
  v10 = v6;
  v7 = v6;
  objc_msgSend_readAttributeExtensionWithParams_completion_(self, v8, (uint64_t)params, v9);

}

- (void)writeAttributeExtensionWithValue:(NSArray *)value completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeExtensionWithValue_params_completion_, value);
}

- (void)writeAttributeExtensionWithValue:(NSArray *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeExtensionWithValue_params_completion_, value);
}

- (void)subscribeAttributeExtensionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D7F380;
  v26[3] = &unk_2504F4C60;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeExtensionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeExtensionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D7F488;
  v18[3] = &unk_2504F4C60;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeExtensionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeSubjectsPerAccessControlEntryWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D7F524;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeSubjectsPerAccessControlEntryWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeSubjectsPerAccessControlEntryWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D7F684;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeSubjectsPerAccessControlEntryWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeSubjectsPerAccessControlEntryWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D7F78C;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeSubjectsPerAccessControlEntryWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeTargetsPerAccessControlEntryWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D7F828;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeTargetsPerAccessControlEntryWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeTargetsPerAccessControlEntryWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D7F988;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeTargetsPerAccessControlEntryWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeTargetsPerAccessControlEntryWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D7FA90;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeTargetsPerAccessControlEntryWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (void)readAttributeAccessControlEntriesPerFabricWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_233D7FB2C;
  v7[3] = &unk_2504F4C38;
  v8 = v4;
  v5 = v4;
  objc_msgSend_readAttributeAccessControlEntriesPerFabricWithCompletion_(self, v6, (uint64_t)v7);

}

- (void)subscribeAttributeAccessControlEntriesPerFabricWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_233D7FC8C;
  v26[3] = &unk_2504F4C38;
  v24 = v15;
  v27 = v24;
  objc_msgSend_subscribeAttributeAccessControlEntriesPerFabricWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);

}

+ (void)readAttributeAccessControlEntriesPerFabricWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
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
  v18[2] = sub_233D7FD94;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeAccessControlEntriesPerFabricWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

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
  v7[2] = sub_233D7FE30;
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
  v26[2] = sub_233D7FF90;
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
  v18[2] = sub_233D80098;
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
  v7[2] = sub_233D80134;
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
  v26[2] = sub_233D80294;
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
  v18[2] = sub_233D8039C;
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
  v7[2] = sub_233D80438;
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
  v26[2] = sub_233D80598;
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
  v18[2] = sub_233D806A0;
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
  v7[2] = sub_233D8073C;
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
  v26[2] = sub_233D8089C;
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
  v18[2] = sub_233D809A4;
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
  v7[2] = sub_233D80A40;
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
  v26[2] = sub_233D80BA0;
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
  v18[2] = sub_233D80CA8;
  v18[3] = &unk_2504F4C38;
  v16 = v12;
  v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);

}

- (MTRBaseClusterAccessControl)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRBaseDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRBaseClusterAccessControl *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRBaseClusterAccessControl *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end
