@implementation MTRClusterGroups

- (void)addGroupWithParams:(MTRGroupsClusterAddGroupParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRGroupsClusterAddGroupParams *v10;
  NSNumber *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  NSArray *v33;
  _QWORD v34[4];
  id v35;

  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRGroupsClusterAddGroupParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_234047138;
  v34[3] = &unk_2504F4BE8;
  v13 = v12;
  v35 = v13;
  v14 = (void *)MEMORY[0x23493EEA8](v34);
  objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_2505945F0, &unk_2505944E8, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)viewGroupWithParams:(MTRGroupsClusterViewGroupParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRGroupsClusterViewGroupParams *v10;
  NSNumber *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  NSArray *v33;
  _QWORD v34[4];
  id v35;

  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRGroupsClusterViewGroupParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_23404734C;
  v34[3] = &unk_2504F4BE8;
  v13 = v12;
  v35 = v13;
  v14 = (void *)MEMORY[0x23493EEA8](v34);
  objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_2505945F0, &unk_250594608, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)getGroupMembershipWithParams:(MTRGroupsClusterGetGroupMembershipParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRGroupsClusterGetGroupMembershipParams *v10;
  NSNumber *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  NSArray *v33;
  _QWORD v34[4];
  id v35;

  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRGroupsClusterGetGroupMembershipParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_234047560;
  v34[3] = &unk_2504F4BE8;
  v13 = v12;
  v35 = v13;
  v14 = (void *)MEMORY[0x23493EEA8](v34);
  objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_2505945F0, &unk_250594620, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)removeGroupWithParams:(MTRGroupsClusterRemoveGroupParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRGroupsClusterRemoveGroupParams *v10;
  NSNumber *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  NSArray *v33;
  _QWORD v34[4];
  id v35;

  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRGroupsClusterRemoveGroupParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_234047774;
  v34[3] = &unk_2504F4BE8;
  v13 = v12;
  v35 = v13;
  v14 = (void *)MEMORY[0x23493EEA8](v34);
  objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_2505945F0, &unk_250594638, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)removeAllGroupsWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_removeAllGroupsWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)removeAllGroupsWithParams:(MTRGroupsClusterRemoveAllGroupsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRGroupsClusterRemoveAllGroupsParams *v10;
  NSArray *v11;
  NSNumber *v12;
  MTRStatusCompletion v13;
  id v14;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  _QWORD v32[4];
  id v33;

  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  v13 = completion;
  if (!v10)
    v10 = objc_alloc_init(MTRGroupsClusterRemoveAllGroupsParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_234047984;
  v32[3] = &unk_2504F4BE8;
  v14 = v13;
  v33 = v14;
  v15 = (void *)MEMORY[0x23493EEA8](v32);
  objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_2505945F0, &unk_250594650, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)addGroupIfIdentifyingWithParams:(MTRGroupsClusterAddGroupIfIdentifyingParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRGroupsClusterAddGroupIfIdentifyingParams *v10;
  NSArray *v11;
  NSNumber *v12;
  MTRStatusCompletion v13;
  id v14;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  _QWORD v32[4];
  id v33;

  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  v13 = completion;
  if (!v10)
    v10 = objc_alloc_init(MTRGroupsClusterAddGroupIfIdentifyingParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_234047B84;
  v32[3] = &unk_2504F4BE8;
  v14 = v13;
  v33 = v14;
  v15 = (void *)MEMORY[0x23493EEA8](v32);
  objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_2505945F0, &unk_250594668, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (NSDictionary)readAttributeNameSupportWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_250594530, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_250594560, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_250594578, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = a3;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_250594590, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_2505945A8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_2505945C0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250594680, &unk_2505945D8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (MTRClusterGroups)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRClusterGroups *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRClusterGroups *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)addGroupWithParams:(MTRGroupsClusterAddGroupParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = completionHandler;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23404819C;
  v13[3] = &unk_2504F4C88;
  v14 = v10;
  v11 = v10;
  objc_msgSend_addGroupWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);

}

- (void)viewGroupWithParams:(MTRGroupsClusterViewGroupParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = completionHandler;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_234048260;
  v13[3] = &unk_2504F4CB0;
  v14 = v10;
  v11 = v10;
  objc_msgSend_viewGroupWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);

}

- (void)getGroupMembershipWithParams:(MTRGroupsClusterGetGroupMembershipParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = completionHandler;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_234048324;
  v13[3] = &unk_2504F4CD8;
  v14 = v10;
  v11 = v10;
  objc_msgSend_getGroupMembershipWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);

}

- (void)removeGroupWithParams:(MTRGroupsClusterRemoveGroupParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = completionHandler;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2340483E8;
  v13[3] = &unk_2504F4D00;
  v14 = v10;
  v11 = v10;
  objc_msgSend_removeGroupWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);

}

- (void)removeAllGroupsWithParams:(MTRGroupsClusterRemoveAllGroupsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_removeAllGroupsWithParams_expectedValues_expectedValueInterval_completion_, params);
}

- (void)removeAllGroupsWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_removeAllGroupsWithParams_expectedValues_expectedValueInterval_completionHandler_, 0);
}

- (void)addGroupIfIdentifyingWithParams:(MTRGroupsClusterAddGroupIfIdentifyingParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_addGroupIfIdentifyingWithParams_expectedValues_expectedValueInterval_completion_, params);
}

@end
