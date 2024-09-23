@implementation MTRClusterUnitTesting

- (void)testWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_testWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)testWithParams:(MTRUnitTestingClusterTestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRUnitTestingClusterTestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340C4D54;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250596A08, &unk_2505944E8, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)testNotHandledWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_testNotHandledWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)testNotHandledWithParams:(MTRUnitTestingClusterTestNotHandledParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRUnitTestingClusterTestNotHandledParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestNotHandledParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340C4F68;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250596A08, &unk_250594608, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)testSpecificWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  objc_msgSend_testSpecificWithParams_expectedValues_expectedValueInterval_completion_(self, a2, 0, expectedValues, expectedValueIntervalMs, completion);
}

- (void)testSpecificWithParams:(MTRUnitTestingClusterTestSpecificParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestSpecificParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestSpecificParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C5194;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250594620, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testUnknownCommandWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_testUnknownCommandWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)testUnknownCommandWithParams:(MTRUnitTestingClusterTestUnknownCommandParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRUnitTestingClusterTestUnknownCommandParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestUnknownCommandParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340C53A4;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250596A08, &unk_250594638, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)testAddArgumentsWithParams:(MTRUnitTestingClusterTestAddArgumentsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestAddArgumentsParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestAddArgumentsParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C55BC;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250594650, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testSimpleArgumentRequestWithParams:(MTRUnitTestingClusterTestSimpleArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestSimpleArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestSimpleArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C57D0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250594668, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testStructArrayArgumentRequestWithParams:(MTRUnitTestingClusterTestStructArrayArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestStructArrayArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestStructArrayArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C59E4;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505947A0, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testStructArgumentRequestWithParams:(MTRUnitTestingClusterTestStructArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestStructArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestStructArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C5BF8;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505947B8, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testNestedStructArgumentRequestWithParams:(MTRUnitTestingClusterTestNestedStructArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestNestedStructArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C5E0C;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505947D0, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testListStructArgumentRequestWithParams:(MTRUnitTestingClusterTestListStructArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestListStructArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestListStructArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6020;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505949C8, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testListInt8UArgumentRequestWithParams:(MTRUnitTestingClusterTestListInt8UArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestListInt8UArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestListInt8UArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6234;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505949E0, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testNestedStructListArgumentRequestWithParams:(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6448;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505949F8, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testListNestedStructListArgumentRequestWithParams:(MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C665C;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250595670, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testListInt8UReverseRequestWithParams:(MTRUnitTestingClusterTestListInt8UReverseRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestListInt8UReverseRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestListInt8UReverseRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6870;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250595688, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testEnumsRequestWithParams:(MTRUnitTestingClusterTestEnumsRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestEnumsRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestEnumsRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6A84;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505956A0, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testNullableOptionalRequestWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
  objc_msgSend_testNullableOptionalRequestWithParams_expectedValues_expectedValueInterval_completion_(self, a2, 0, a3, a4, a5);
}

- (void)testNullableOptionalRequestWithParams:(MTRUnitTestingClusterTestNullableOptionalRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestNullableOptionalRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestNullableOptionalRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6CAC;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505956B8, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testComplexNullableOptionalRequestWithParams:(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestComplexNullableOptionalRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C6EC0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505956D0, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)simpleStructEchoRequestWithParams:(MTRUnitTestingClusterSimpleStructEchoRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterSimpleStructEchoRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterSimpleStructEchoRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C70D4;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_2505956E8, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)timedInvokeRequestWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MEMORY[0x24BEDD108](self, sel_timedInvokeRequestWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)timedInvokeRequestWithParams:(MTRUnitTestingClusterTimedInvokeRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRUnitTestingClusterTimedInvokeRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTimedInvokeRequestParams);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_2340C72F0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_250596A08, &unk_250595700, v10, v11, v12, v21, v28, 0, v31, v15);

}

- (void)testSimpleOptionalArgumentRequestWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_testSimpleOptionalArgumentRequestWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)testSimpleOptionalArgumentRequestWithParams:(MTRUnitTestingClusterTestSimpleOptionalArgumentRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRUnitTestingClusterTestSimpleOptionalArgumentRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestSimpleOptionalArgumentRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340C7504;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250596A08, &unk_250595718, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)testEmitTestEventRequestWithParams:(MTRUnitTestingClusterTestEmitTestEventRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestEmitTestEventRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestEmitTestEventRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C771C;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250596A20, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testEmitTestFabricScopedEventRequestWithParams:(MTRUnitTestingClusterTestEmitTestFabricScopedEventRequestParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  MTRUnitTestingClusterTestEmitTestFabricScopedEventRequestParams *v10;
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
    v10 = objc_alloc_init(MTRUnitTestingClusterTestEmitTestFabricScopedEventRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C7930;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250596A38, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testBatchHelperRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRUnitTestingClusterTestBatchHelperRequestParams *v10;
  id v11;
  id v12;
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
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v10 = (MTRUnitTestingClusterTestBatchHelperRequestParams *)a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRUnitTestingClusterTestBatchHelperRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C7B44;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250596A50, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testSecondBatchHelperRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRUnitTestingClusterTestSecondBatchHelperRequestParams *v10;
  id v11;
  id v12;
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
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v10 = (MTRUnitTestingClusterTestSecondBatchHelperRequestParams *)a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRUnitTestingClusterTestSecondBatchHelperRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C7D58;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250596A68, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)stringEchoRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRUnitTestingClusterStringEchoRequestParams *v10;
  id v11;
  id v12;
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
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v10 = (MTRUnitTestingClusterStringEchoRequestParams *)a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRUnitTestingClusterStringEchoRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C7F6C;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250596A80, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (void)testDifferentVendorMeiRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRUnitTestingClusterTestDifferentVendorMeiRequestParams *v10;
  id v11;
  id v12;
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
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v10 = (MTRUnitTestingClusterTestDifferentVendorMeiRequestParams *)a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  v32 = v12;
  if (!v10)
    v10 = objc_alloc_init(MTRUnitTestingClusterTestDifferentVendorMeiRequestParams);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340C8180;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_250596A08, &unk_250596A98, v10, v33, v11, v17, v26, v27, v30, v14, v32);

}

- (NSDictionary)readAttributeBooleanWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594530, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBooleanWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594530, v19, v8, v11);

}

- (NSDictionary)readAttributeBitmap8WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594548, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeBitmap8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBitmap8WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeBitmap8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594548, v19, v8, v11);

}

- (NSDictionary)readAttributeBitmap16WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594800, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeBitmap16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBitmap16WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeBitmap16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594800, v19, v8, v11);

}

- (NSDictionary)readAttributeBitmap32WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594518, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeBitmap32WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBitmap32WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeBitmap32WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594518, v19, v8, v11);

}

- (NSDictionary)readAttributeBitmap64WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594680, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeBitmap64WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeBitmap64WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeBitmap64WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594680, v19, v8, v11);

}

- (NSDictionary)readAttributeInt8uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594818, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt8uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594818, v19, v8, v11);

}

- (NSDictionary)readAttributeInt16uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505946E0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt16uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_2505946E0, v19, v8, v11);

}

- (NSDictionary)readAttributeInt24uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594758, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt24uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt24uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt24uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594758, v19, v8, v11);

}

- (NSDictionary)readAttributeInt32uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505947E8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt32uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt32uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt32uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_2505947E8, v19, v8, v11);

}

- (NSDictionary)readAttributeInt40uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594A70, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt40uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt40uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt40uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594A70, v19, v8, v11);

}

- (NSDictionary)readAttributeInt48uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594A88, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt48uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt48uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt48uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594A88, v19, v8, v11);

}

- (NSDictionary)readAttributeInt56uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594AA0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt56uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt56uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt56uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594AA0, v19, v8, v11);

}

- (NSDictionary)readAttributeInt64uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594AB8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt64uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt64uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt64uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594AB8, v19, v8, v11);

}

- (NSDictionary)readAttributeInt8sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594AD0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt8sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594AD0, v19, v8, v11);

}

- (NSDictionary)readAttributeInt16sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594AE8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt16sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594AE8, v19, v8, v11);

}

- (NSDictionary)readAttributeInt24sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594830, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt24sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt24sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt24sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594830, v19, v8, v11);

}

- (NSDictionary)readAttributeInt32sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594770, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt32sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt32sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt32sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594770, v19, v8, v11);

}

- (NSDictionary)readAttributeInt40sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594848, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt40sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt40sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt40sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594848, v19, v8, v11);

}

- (NSDictionary)readAttributeInt48sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594860, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt48sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt48sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt48sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594860, v19, v8, v11);

}

- (NSDictionary)readAttributeInt56sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594878, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt56sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt56sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt56sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594878, v19, v8, v11);

}

- (NSDictionary)readAttributeInt64sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594890, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeInt64sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeInt64sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeInt64sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594890, v19, v8, v11);

}

- (NSDictionary)readAttributeEnum8WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594B00, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnum8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeEnum8WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeEnum8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594B00, v19, v8, v11);

}

- (NSDictionary)readAttributeEnum16WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594B18, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnum16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeEnum16WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeEnum16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594B18, v19, v8, v11);

}

- (NSDictionary)readAttributeFloatSingleWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594BF0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeFloatSingleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeFloatSingleWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeFloatSingleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594BF0, v19, v8, v11);

}

- (NSDictionary)readAttributeFloatDoubleWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594C08, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeFloatDoubleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeFloatDoubleWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeFloatDoubleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594C08, v19, v8, v11);

}

- (NSDictionary)readAttributeOctetStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594C20, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeOctetStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594C20, v19, v8, v11);

}

- (NSDictionary)readAttributeListInt8uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594C38, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeListInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeListInt8uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeListInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594C38, v19, v8, v11);

}

- (NSDictionary)readAttributeListOctetStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594C50, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeListOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeListOctetStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeListOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594C50, v19, v8, v11);

}

- (NSDictionary)readAttributeListStructOctetStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505948A8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeListStructOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeListStructOctetStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeListStructOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_2505948A8, v19, v8, v11);

}

- (NSDictionary)readAttributeLongOctetStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594968, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeLongOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeLongOctetStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeLongOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594968, v19, v8, v11);

}

- (NSDictionary)readAttributeCharStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594980, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeCharStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeCharStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeCharStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594980, v19, v8, v11);

}

- (NSDictionary)readAttributeLongCharStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594998, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeLongCharStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeLongCharStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeLongCharStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594998, v19, v8, v11);

}

- (NSDictionary)readAttributeEpochUsWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594D88, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeEpochUsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeEpochUsWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeEpochUsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594D88, v19, v8, v11);

}

- (NSDictionary)readAttributeEpochSWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594DA0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeEpochSWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeEpochSWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeEpochSWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594DA0, v19, v8, v11);

}

- (NSDictionary)readAttributeVendorIdWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594DB8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeVendorIdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeVendorIdWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeVendorIdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594DB8, v19, v8, v11);

}

- (NSDictionary)readAttributeListNullablesAndOptionalsStructWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594DD0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeListNullablesAndOptionalsStructWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeListNullablesAndOptionalsStructWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeListNullablesAndOptionalsStructWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594DD0, v19, v8, v11);

}

- (NSDictionary)readAttributeEnumAttrWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594DE8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeEnumAttrWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeEnumAttrWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeEnumAttrWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594DE8, v19, v8, v11);

}

- (NSDictionary)readAttributeStructAttrWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594A10, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeStructAttrWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeStructAttrWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeStructAttrWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594A10, v19, v8, v11);

}

- (NSDictionary)readAttributeRangeRestrictedInt8uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594E00, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeRangeRestrictedInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeRangeRestrictedInt8uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeRangeRestrictedInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594E00, v19, v8, v11);

}

- (NSDictionary)readAttributeRangeRestrictedInt8sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594E18, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeRangeRestrictedInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeRangeRestrictedInt8sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeRangeRestrictedInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594E18, v19, v8, v11);

}

- (NSDictionary)readAttributeRangeRestrictedInt16uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594A58, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeRangeRestrictedInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeRangeRestrictedInt16uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeRangeRestrictedInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594A58, v19, v8, v11);

}

- (NSDictionary)readAttributeRangeRestrictedInt16sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594B48, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeRangeRestrictedInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeRangeRestrictedInt16sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeRangeRestrictedInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594B48, v19, v8, v11);

}

- (NSDictionary)readAttributeListLongOctetStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594B78, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeListLongOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeListLongOctetStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeListLongOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594B78, v19, v8, v11);

}

- (NSDictionary)readAttributeListFabricScopedWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594B90, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeListFabricScopedWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeListFabricScopedWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeListFabricScopedWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594B90, v19, v8, v11);

}

- (NSDictionary)readAttributeTimedWriteBooleanWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594C80, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeTimedWriteBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeTimedWriteBooleanWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeTimedWriteBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSDictionary *v20;

  v20 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    v14 = (void *)v11;
  else
    v14 = &unk_250594F50;
  objc_msgSend_device(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v15, v19, (uint64_t)v18, &unk_250596AB0, &unk_250594C80, v20, v8, v14);

}

- (NSDictionary)readAttributeGeneralErrorBooleanWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594CB0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeGeneralErrorBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeGeneralErrorBooleanWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeGeneralErrorBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594CB0, v19, v8, v11);

}

- (NSDictionary)readAttributeClusterErrorBooleanWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594CE0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeClusterErrorBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeClusterErrorBooleanWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeClusterErrorBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594CE0, v19, v8, v11);

}

- (NSDictionary)readAttributeUnsupportedWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596AC8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeUnsupportedWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeUnsupportedWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeUnsupportedWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596AC8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableBooleanWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505946F8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableBooleanWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableBooleanWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_2505946F8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableBitmap8WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594710, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableBitmap8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableBitmap8WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableBitmap8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594710, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableBitmap16WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594728, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableBitmap16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableBitmap16WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableBitmap16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594728, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableBitmap32WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594740, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableBitmap32WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableBitmap32WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableBitmap32WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250594740, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableBitmap64WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595B20, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableBitmap64WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableBitmap64WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableBitmap64WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595B20, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt8uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595B38, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt8uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595B38, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt16uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595B50, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt16uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595B50, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt24uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596AE0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt24uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt24uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt24uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596AE0, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt32uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596AF8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt32uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt32uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt32uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596AF8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt40uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596B10, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt40uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt40uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt40uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596B10, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt48uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595B68, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt48uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt48uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt48uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595B68, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt56uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595B80, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt56uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt56uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt56uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595B80, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt64uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595B98, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt64uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt64uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt64uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595B98, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt8sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595BB0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt8sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595BB0, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt16sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596B28, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt16sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596B28, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt24sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596B40, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt24sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt24sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt24sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596B40, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt32sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250595BC8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt32sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt32sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt32sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250595BC8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt40sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596B58, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt40sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt40sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt40sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596B58, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt48sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596B70, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt48sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt48sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt48sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596B70, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt56sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596B88, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt56sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt56sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt56sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596B88, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableInt64sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596BA0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableInt64sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableInt64sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableInt64sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596BA0, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableEnum8WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596BB8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableEnum8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableEnum8WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableEnum8WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596BB8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableEnum16WithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596BD0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableEnum16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableEnum16WithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableEnum16WithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596BD0, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableFloatSingleWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596BE8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableFloatSingleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableFloatSingleWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableFloatSingleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596BE8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableFloatDoubleWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C00, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableFloatDoubleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableFloatDoubleWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableFloatDoubleWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C00, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableOctetStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C18, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableOctetStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableOctetStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C18, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableCharStringWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C30, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableCharStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableCharStringWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableCharStringWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C30, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableEnumAttrWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C48, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableEnumAttrWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableEnumAttrWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableEnumAttrWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C48, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableStructWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C60, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableStructWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableStructWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableStructWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C60, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableRangeRestrictedInt8uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C78, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableRangeRestrictedInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableRangeRestrictedInt8uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableRangeRestrictedInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C78, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableRangeRestrictedInt8sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596C90, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableRangeRestrictedInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableRangeRestrictedInt8sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableRangeRestrictedInt8sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596C90, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableRangeRestrictedInt16uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596CA8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableRangeRestrictedInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableRangeRestrictedInt16uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableRangeRestrictedInt16uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596CA8, v19, v8, v11);

}

- (NSDictionary)readAttributeNullableRangeRestrictedInt16sWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596CC0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeNullableRangeRestrictedInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeNullableRangeRestrictedInt16sWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeNullableRangeRestrictedInt16sWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596CC0, v19, v8, v11);

}

- (NSDictionary)readAttributeWriteOnlyInt8uWithParams:(MTRReadParams *)params
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596CD8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeWriteOnlyInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeWriteOnlyInt8uWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeWriteOnlyInt8uWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596CD8, v19, v8, v11);

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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594560, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594578, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250594590, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505945A8, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505945C0, v4);
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_2505945D8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)readAttributeMeiInt8uWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250596AB0, &unk_250596CF0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)writeAttributeMeiInt8uWithValue:(id)a3 expectedValueInterval:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeMeiInt8uWithValue_expectedValueInterval_params_, a3);
}

- (void)writeAttributeMeiInt8uWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  objc_msgSend_timedWriteTimeout(a5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250596AB0, &unk_250596CF0, v19, v8, v11);

}

@end
