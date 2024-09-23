@implementation MTRClusterDeviceEnergyManagement

- (void)powerAdjustRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterPowerAdjustRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterPowerAdjustRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340812B8;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_2505944E8, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)cancelPowerAdjustRequestWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_cancelPowerAdjustRequestWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)cancelPowerAdjustRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterCancelPowerAdjustRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterCancelPowerAdjustRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterCancelPowerAdjustRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340814CC;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_250594608, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)startTimeAdjustRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterStartTimeAdjustRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterStartTimeAdjustRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterStartTimeAdjustRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340816CC;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_250594620, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)pauseRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterPauseRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterPauseRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterPauseRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340818CC;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_250594638, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)resumeRequestWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_resumeRequestWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)resumeRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterResumeRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterResumeRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterResumeRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_234081AE0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_250594650, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)modifyForecastRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterModifyForecastRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterModifyForecastRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterModifyForecastRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_234081CE0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_250594668, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)requestConstraintBasedForecastWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterRequestConstraintBasedForecastParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_234081EE0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_2505947A0, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (void)cancelRequestWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_cancelRequestWithParams_expectedValues_expectedValueInterval_completion_, 0);
}

- (void)cancelRequestWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  MTRDeviceEnergyManagementClusterCancelRequestParams *v10;
  id v11;
  id v12;
  id v13;
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

  v10 = (MTRDeviceEnergyManagementClusterCancelRequestParams *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    v10 = objc_alloc_init(MTRDeviceEnergyManagementClusterCancelRequestParams);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_2340820F4;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_250595508, &unk_2505947B8, v10, v11, v12, v18, v27, 0, v30, v15);

}

- (id)readAttributeESATypeWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594530, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeESACanGenerateWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594548, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeESAStateWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594800, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeAbsMinPowerWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594518, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeAbsMaxPowerWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594680, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributePowerAdjustmentCapabilityWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594818, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeForecastWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_2505946E0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeOptOutStateWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594758, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeGeneratedCommandListWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594560, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeAcceptedCommandListWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594578, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_250594590, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeAttributeListWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_2505945A8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeFeatureMapWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_2505945C0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeClusterRevisionWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595520, &unk_2505945D8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
