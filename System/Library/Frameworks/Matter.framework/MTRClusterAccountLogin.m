@implementation MTRClusterAccountLogin

- (void)getSetupPINWithParams:(MTRAccountLoginClusterGetSetupPINParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRAccountLoginClusterGetSetupPINParams *v10;
  NSNumber *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  NSArray *v34;
  _QWORD v35[4];
  id v36;

  v10 = params;
  v34 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v33 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRAccountLoginClusterGetSetupPINParams);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = sub_2340BAE28;
  v35[3] = &unk_2504F4BE8;
  v13 = v12;
  v36 = v13;
  v14 = (void *)MEMORY[0x23493EEA8](v35);
  objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
    v20 = (void *)v17;
  else
    v20 = &unk_250594F50;
  objc_msgSend_device(self, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_class();
  objc_msgSend_callbackQueue(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v32, (uint64_t)v24, &unk_250595FE8, &unk_2505944E8, v10, v34, v11, v20, v27, v28, v31, v14, v33);

}

- (void)loginWithParams:(MTRAccountLoginClusterLoginParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRAccountLoginClusterLoginParams *v10;
  NSArray *v11;
  NSNumber *v12;
  MTRStatusCompletion v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  _QWORD v33[4];
  id v34;

  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  v13 = completion;
  if (!v10)
    v10 = objc_alloc_init(MTRAccountLoginClusterLoginParams);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_2340BB030;
  v33[3] = &unk_2504F4BE8;
  v14 = v13;
  v34 = v14;
  v15 = (void *)MEMORY[0x23493EEA8](v33);
  objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    v21 = (void *)v18;
  else
    v21 = &unk_250594F50;
  objc_msgSend_device(self, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_250595FE8, &unk_250594620, v10, v11, v12, v21, v28, 0, v31, v15);

}

- (void)logoutWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_logoutWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)logoutWithParams:(MTRAccountLoginClusterLogoutParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRAccountLoginClusterLogoutParams *v10;
  NSArray *v11;
  NSNumber *v12;
  MTRStatusCompletion v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  _QWORD v33[4];
  id v34;

  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  v13 = completion;
  if (!v10)
    v10 = objc_alloc_init(MTRAccountLoginClusterLogoutParams);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_2340BB250;
  v33[3] = &unk_2504F4BE8;
  v14 = v13;
  v34 = v14;
  v15 = (void *)MEMORY[0x23493EEA8](v33);
  objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    v21 = (void *)v18;
  else
    v21 = &unk_250594F50;
  objc_msgSend_device(self, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_250595FE8, &unk_250594638, v10, v11, v12, v21, v28, 0, v31, v15);

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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596000, &unk_250594560, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596000, &unk_250594578, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596000, &unk_250594590, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596000, &unk_2505945A8, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596000, &unk_2505945C0, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596000, &unk_2505945D8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (MTRClusterAccountLogin)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRClusterAccountLogin *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRClusterAccountLogin *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)getSetupPINWithParams:(MTRAccountLoginClusterGetSetupPINParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = completionHandler;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2340BB7BC;
  v13[3] = &unk_2504F5340;
  v14 = v10;
  v11 = v10;
  objc_msgSend_getSetupPINWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);

}

- (void)loginWithParams:(MTRAccountLoginClusterLoginParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_loginWithParams_expectedValues_expectedValueInterval_completion_, params);
}

- (void)logoutWithParams:(MTRAccountLoginClusterLogoutParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_logoutWithParams_expectedValues_expectedValueInterval_completion_, params);
}

- (void)logoutWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_logoutWithParams_expectedValues_expectedValueInterval_completionHandler_, 0);
}

@end
