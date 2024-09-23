@implementation HMMTRColorControl

- (HMMTRColorControl)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMTRColorControl;
  return -[MTRGenericBaseCluster initWithDevice:endpointID:queue:](&v6, sel_initWithDevice_endpointID_queue_, a3, a4, a5);
}

- (void)moveToCustomColorTemperatureValue:(id)a3 transitionTime:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDDB638];
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  objc_msgSend(v12, "setColorTemperatureMireds:", v11);

  objc_msgSend(v12, "setTransitionTime:", v10);
  objc_msgSend(v12, "setOptionsMask:", &unk_250F3F708);
  objc_msgSend(v12, "setOptionsOverride:", &unk_250F3F708);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__HMMTRColorControl_moveToCustomColorTemperatureValue_transitionTime_completionHandler___block_invoke;
  v15[3] = &unk_250F228C0;
  v15[4] = self;
  v16 = v12;
  v17 = v8;
  v13 = v8;
  v14 = v12;
  -[MTRBaseClusterColorControl moveToColorTemperatureWithParams:completion:](self, "moveToColorTemperatureWithParams:completion:", v14, v15);

}

- (void)moveToCustomColorTemperatureWithParams:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDDB638];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v8, "colorTemperatureMireds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColorTemperatureMireds:", v10);

  objc_msgSend(v8, "transitionTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTransitionTime:", v11);
  objc_msgSend(v9, "setOptionsMask:", &unk_250F3F708);
  objc_msgSend(v9, "setOptionsOverride:", &unk_250F3F708);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__HMMTRColorControl_moveToCustomColorTemperatureWithParams_completionHandler___block_invoke;
  v14[3] = &unk_250F228C0;
  v14[4] = self;
  v15 = v9;
  v16 = v6;
  v12 = v6;
  v13 = v9;
  -[MTRBaseClusterColorControl moveToColorTemperatureWithParams:completion:](self, "moveToColorTemperatureWithParams:completion:", v13, v14);

}

- (void)supportsColorTemperatureRangeWithMinColorTemperature:(id)a3 maxColorTemperature:(id)a4 completion:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  NSObject *queue;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  NSObject *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[5];
  NSObject *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[3];
  char v47;
  _QWORD v48[5];
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  queue = a6;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__5561;
  v48[4] = __Block_byref_object_dispose__5562;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__5561;
  v44[4] = __Block_byref_object_dispose__5562;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__5561;
  v42[4] = __Block_byref_object_dispose__5562;
  v43 = 0;
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v14 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke;
  v38[3] = &unk_250F21398;
  v40 = v46;
  v41 = v48;
  v38[4] = self;
  v15 = v13;
  v39 = v15;
  -[MTRBaseClusterColorControl readAttributeColorCapabilitiesWithCompletion:](self, "readAttributeColorCapabilitiesWithCompletion:", v38);
  dispatch_group_enter(v15);
  v34[0] = v14;
  v34[1] = 3221225472;
  v34[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_4;
  v34[3] = &unk_250F21398;
  v36 = v44;
  v37 = v48;
  v34[4] = self;
  v16 = v15;
  v35 = v16;
  -[MTRBaseClusterColorControl readAttributeColorTempPhysicalMinMiredsWithCompletion:](self, "readAttributeColorTempPhysicalMinMiredsWithCompletion:", v34);
  dispatch_group_enter(v16);
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_5;
  v30[3] = &unk_250F21398;
  v30[4] = self;
  v32 = v42;
  v33 = v48;
  v17 = v16;
  v31 = v17;
  -[MTRBaseClusterColorControl readAttributeColorTempPhysicalMaxMiredsWithCompletion:](self, "readAttributeColorTempPhysicalMaxMiredsWithCompletion:", v30);
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_6;
  block[3] = &unk_250F213C0;
  v26 = v46;
  v27 = v44;
  block[4] = self;
  v23 = v10;
  v28 = v42;
  v29 = v48;
  v24 = v11;
  v25 = v12;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_group_notify(v17, queue, block);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);

}

- (void)writeStartUpColorTemperature:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HMMTRColorControl_writeStartUpColorTemperature_completion___block_invoke;
  v8[3] = &unk_250F23F80;
  v9 = v6;
  v7 = v6;
  -[MTRBaseClusterColorControl writeAttributeStartUpColorTemperatureMiredsWithValue:completion:](self, "writeAttributeStartUpColorTemperatureMiredsWithValue:completion:", a3, v8);

}

- (void)readStartUpColorTemperatureWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__HMMTRColorControl_readStartUpColorTemperatureWithCompletion___block_invoke;
  v6[3] = &unk_250F22FD0;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterColorControl readAttributeStartUpColorTemperatureMiredsWithCompletion:](self, "readAttributeStartUpColorTemperatureMiredsWithCompletion:", v6);

}

- (void)stopMoveToColorTemperatureCommandWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDB658]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMMTRColorControl_stopMoveToColorTemperatureCommandWithCompletion___block_invoke;
  v7[3] = &unk_250F23F80;
  v8 = v4;
  v6 = v4;
  -[MTRBaseClusterColorControl stopMoveStepWithParams:completion:](self, "stopMoveStepWithParams:completion:", v5, v7);

}

- (void)subscribeAttributeReportForColorModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, _QWORD);
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB818]), "initWithMinInterval:maxInterval:", &unk_250F3F708, &unk_250F3F708);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HMMTRColorControl_subscribeAttributeReportForColorModeWithCompletion___block_invoke;
  v7[3] = &unk_250F24178;
  v7[4] = self;
  v8 = v4;
  v6 = (void (**)(id, _QWORD))v4;
  -[MTRBaseClusterColorControl subscribeAttributeColorModeWithParams:subscriptionEstablished:reportHandler:](self, "subscribeAttributeColorModeWithParams:subscriptionEstablished:reportHandler:", v5, 0, v7);
  v6[2](v6, 0);

}

- (void)readColorModeAndColorTemperatureWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterColorControl readAttributeColorModeWithCompletion:](self, "readAttributeColorModeWithCompletion:", v6);

}

- (void)readColorTemperatureAttributesWithCompletion:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  HMMTRColorControlColorTemperatureAttributes *v8;
  NSObject *v9;
  uint64_t v10;
  HMMTRColorControlColorTemperatureAttributes *v11;
  NSObject *v12;
  HMMTRColorControlColorTemperatureAttributes *v13;
  NSObject *v14;
  HMMTRColorControlColorTemperatureAttributes *v15;
  NSObject *v16;
  HMMTRColorControlColorTemperatureAttributes *v17;
  id v18;
  _QWORD v19[4];
  HMMTRColorControlColorTemperatureAttributes *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  HMMTRColorControlColorTemperatureAttributes *v24;
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[4];
  HMMTRColorControlColorTemperatureAttributes *v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[4];
  HMMTRColorControlColorTemperatureAttributes *v32;
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(HMMTRColorControlColorTemperatureAttributes);
  v9 = dispatch_group_create();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__5561;
  v35[4] = __Block_byref_object_dispose__5562;
  v36 = 0;
  dispatch_group_enter(v9);
  v10 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke;
  v31[3] = &unk_250F213E8;
  v11 = v8;
  v32 = v11;
  v34 = v35;
  v12 = v9;
  v33 = v12;
  -[MTRBaseClusterColorControl readAttributeColorModeWithCompletion:](self, "readAttributeColorModeWithCompletion:", v31);
  dispatch_group_enter(v12);
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_2;
  v27[3] = &unk_250F213E8;
  v13 = v11;
  v28 = v13;
  v30 = v35;
  v14 = v12;
  v29 = v14;
  -[MTRBaseClusterColorControl readAttributeRemainingTimeWithCompletion:](self, "readAttributeRemainingTimeWithCompletion:", v27);
  dispatch_group_enter(v14);
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_3;
  v23[3] = &unk_250F213E8;
  v15 = v13;
  v24 = v15;
  v26 = v35;
  v16 = v14;
  v25 = v16;
  -[MTRBaseClusterColorControl readAttributeColorTemperatureMiredsWithCompletion:](self, "readAttributeColorTemperatureMiredsWithCompletion:", v23);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_4;
  v19[3] = &unk_250F22F58;
  v20 = v15;
  v21 = v6;
  v22 = v35;
  v17 = v15;
  v18 = v6;
  dispatch_group_notify(v16, v7, v19);

  _Block_object_dispose(v35, 8);
}

- (void)moveToPluginColorTemperatureWithParams:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDDB638];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v8, "colorTemperature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColorTemperature:", v10);

  objc_msgSend(v8, "transitionTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTransitionTime:", v11);
  objc_msgSend(v9, "setOptionsMask:", &unk_250F3F708);
  objc_msgSend(v9, "setOptionsOverride:", &unk_250F3F708);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__HMMTRColorControl_moveToPluginColorTemperatureWithParams_completionHandler___block_invoke;
  v14[3] = &unk_250F228C0;
  v14[4] = self;
  v15 = v9;
  v16 = v6;
  v12 = v6;
  v13 = v9;
  -[MTRBaseClusterColorControl moveToColorTemperatureWithParams:completionHandler:](self, "moveToColorTemperatureWithParams:completionHandler:", v13, v14);

}

- (void)readAttributePluginColorTemperatureMiredsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterColorControl readAttributeColorModeWithCompletionHandler:](self, "readAttributeColorModeWithCompletionHandler:", v6);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRColorControl endpointID](self, "endpointID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("enddePoint/%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "endpointID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read colorMode for endPoint: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 15, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else if (objc_msgSend(v5, "integerValue") == 2)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke_13;
    v20[3] = &unk_250F22FD0;
    v14 = *(void **)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v14, "readAttributeColorTemperatureMiredsWithCompletion:", v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "endpointID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v18;
      v24 = 2112;
      v25 = &unk_250F3F720;
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Returning color temp: %@ because colorMode: %@ on accessory endPoint: %@ is not color temp", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__HMMTRColorControl_moveToPluginColorTemperatureWithParams_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "colorTemperature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "optionsMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@moveToColorTemperatureWithParams colorTemperature %@, optionsMask %@, error %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setColorMode:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRemainingTime:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setColorTemperatureMireds:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke_2;
    v7[3] = &unk_250F24178;
    v6 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "readAttributeColorTemperatureMiredsWithCompletion:", v7);

  }
}

uint64_t __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), a2);
}

void __72__HMMTRColorControl_subscribeAttributeReportForColorModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Received attribute report for colorMode value: %@ error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __69__HMMTRColorControl_stopMoveToColorTemperatureCommandWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__HMMTRColorControl_readStartUpColorTemperatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HMMTRColorControl_writeStartUpColorTemperature_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (objc_msgSend(v5, "unsignedIntValue") & 0x10) != 0;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to read color control attribute colorCapabilities with error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to read color control attribute physicalMinMireds with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to read color control attribute physicalMaxMireds with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v16 = 138544898;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Read color control attribute colorCapabilities supportsColorTempFeature: %@ accessoryRange: [%@ : %@]  allowedRange: [%@ : %@] error: %@", (uint8_t *)&v16, 0x48u);

  }
  objc_autoreleasePoolPop(v2);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && (v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "longValue"),
        v12 <= objc_msgSend(*(id *)(a1 + 40), "longValue"))
    && (v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "longValue"),
        v13 >= objc_msgSend(*(id *)(a1 + 48), "longValue")))
  {
    v14 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v14 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v14();
}

void __78__HMMTRColorControl_moveToCustomColorTemperatureWithParams_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "colorTemperature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "optionsMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@moveToColorTemperatureWithParams completed with colorTemperature %@, optionsMask %@, error %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __88__HMMTRColorControl_moveToCustomColorTemperatureValue_transitionTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "colorTemperature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "transitionTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "optionsMask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544386;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@moveToColorTemperatureWithParams completed with colorTemperature %@, transitionTime %@, optionsMask %@, error %@", (uint8_t *)&v11, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_5598 != -1)
    dispatch_once(&logCategory__hmf_once_t10_5598, &__block_literal_global_5599);
  return (id)logCategory__hmf_once_v11_5600;
}

void __32__HMMTRColorControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_5600;
  logCategory__hmf_once_v11_5600 = v0;

}

@end
