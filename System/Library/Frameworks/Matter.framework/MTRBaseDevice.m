@implementation MTRBaseDevice

- (MTRBaseDevice)initWithPASEDevice:(void *)a3 controller:(id)a4
{
  id v7;
  MTRBaseDevice *v8;
  MTRBaseDevice *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTRBaseDevice;
  v8 = -[MTRBaseDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isPASEDevice = 1;
    v8->_nodeID = (*(uint64_t (**)(void *))(*(_QWORD *)a3 + 24))(a3);
    objc_storeStrong((id *)&v9->_deviceController, a4);
  }

  return v9;
}

- (MTRBaseDevice)initWithNodeID:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  MTRBaseDevice *v8;
  const char *v9;
  uint64_t v10;
  MTRBaseDevice *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTRBaseDevice;
  v8 = -[MTRBaseDevice init](&v13, sel_init);
  v11 = v8;
  if (v8)
  {
    v8->_isPASEDevice = 0;
    v8->_nodeID = objc_msgSend_unsignedLongLongValue(v6, v9, v10);
    objc_storeStrong((id *)&v11->_deviceController, a4);
  }

  return v11;
}

+ (MTRBaseDevice)deviceWithNodeID:(NSNumber *)nodeID controller:(MTRDeviceController *)controller
{
  objc_msgSend_baseDeviceForNodeID_(controller, a2, (uint64_t)nodeID);
  return (MTRBaseDevice *)(id)objc_claimAutoreleasedReturnValue();
}

- (MTRTransportType)sessionTransportType
{
  uint64_t v2;
  MTRBaseDevice *v3;
  void *v4;
  const char *v5;

  v3 = self;
  objc_msgSend_deviceController(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_sessionTransportTypeForDevice_(v4, v5, (uint64_t)v3);

  return v3;
}

- (void)invalidateCASESession
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  if ((objc_msgSend_isPASEDevice(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_deviceController(self, v4, v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_nodeID(self, v6, v7);
    objc_msgSend_invalidateCASESessionForNode_(v10, v9, v8);

  }
}

- (void)subscribeWithQueue:(dispatch_queue_t)queue params:(MTRSubscribeParams *)params clusterStateCacheContainer:(MTRClusterStateCacheContainer *)clusterStateCacheContainer attributeReportHandler:(MTRDeviceReportHandler)attributeReportHandler eventReportHandler:(MTRDeviceReportHandler)eventReportHandler errorHandler:(MTRDeviceErrorHandler)errorHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduled
{
  NSObject *v16;
  MTRSubscribeParams *v17;
  MTRDeviceReportHandler v18;
  MTRDeviceReportHandler v19;
  MTRDeviceErrorHandler v20;
  MTRSubscriptionEstablishedHandler v21;
  MTRDeviceResubscriptionScheduledHandler v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  MTRClusterStateCacheContainer *v37;
  _QWORD v38[4];
  NSObject *v39;
  MTRSubscribeParams *v40;
  MTRClusterStateCacheContainer *v41;
  MTRBaseDevice *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD block[4];
  id v49;

  v16 = queue;
  v17 = params;
  v37 = clusterStateCacheContainer;
  v18 = attributeReportHandler;
  v19 = eventReportHandler;
  v20 = errorHandler;
  v21 = subscriptionEstablished;
  v22 = resubscriptionScheduled;
  if (objc_msgSend_isPASEDevice(self, v23, v24))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233CE2538;
    block[3] = &unk_2504F0208;
    v27 = &v49;
    v49 = v20;
    dispatch_async(v16, block);
  }
  else
  {
    v28 = objc_msgSend_copy(v17, v25, v26);

    objc_msgSend_deviceController(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v28;
    v34 = objc_msgSend_nodeID(self, v32, v33);
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = sub_233CE25B4;
    v38[3] = &unk_2504F04F0;
    v39 = v16;
    v43 = v20;
    v17 = v36;
    v40 = v17;
    v41 = v37;
    v44 = v18;
    v45 = v19;
    v46 = v22;
    v47 = v21;
    v42 = self;
    objc_msgSend_getSessionForNode_completion_(v31, v35, v34, v38);
    v27 = (id *)&v39;

  }
}

- (void)readAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  NSObject *v14;
  MTRDeviceResponseHandler v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRReadParams *v22;

  v22 = params;
  v14 = queue;
  v15 = completion;
  v16 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend_requestPathWithEndpointID_clusterID_attributeID_(MTRAttributeRequestPath, v17, (uint64_t)endpointID, clusterID, attributeID);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v16, v19, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_readAttributePaths_eventPaths_params_queue_completion_(self, v21, (uint64_t)v20, 0, v22, v14, v15);
}

- (void)_readKnownAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v20, (uint64_t)v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_233CE5AA8;
  v29 = &unk_2504F0518;
  v22 = v19;
  v30 = v21;
  v31 = v22;
  v23 = v21;
  v24 = (void *)MEMORY[0x23493EEA8](&v26);
  objc_msgSend_readAttributesWithEndpointID_clusterID_attributeID_params_queue_completion_(self, v25, (uint64_t)v14, v15, v16, v17, v18, v24, v26, v27, v28, v29);

}

- (void)readAttributePaths:(NSArray *)attributePaths eventPaths:(NSArray *)eventPaths params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  objc_msgSend_readAttributePaths_eventPaths_params_includeDataVersion_queue_completion_(self, a2, (uint64_t)attributePaths, eventPaths, params, 0, queue, completion);
}

- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 includeDataVersion:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  BOOL v37;
  _QWORD block[4];
  id v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v20 = a8;
  if (v14 && objc_msgSend_count(v14, v18, v19))
    goto LABEL_6;
  if (v15 && objc_msgSend_count(v15, v18, v19))
  {
    if (!v14)
    {
      v25 = 0;
      goto LABEL_11;
    }
LABEL_6:
    v21 = objc_alloc(MEMORY[0x24BDBCE30]);
    v25 = (void *)objc_msgSend_initWithArray_copyItems_(v21, v22, (uint64_t)v14, 1);
    if (!v15)
    {
      v26 = 0;
      if (!v16)
        goto LABEL_13;
      goto LABEL_12;
    }
LABEL_11:
    v28 = objc_alloc(MEMORY[0x24BDBCE30]);
    v26 = (void *)objc_msgSend_initWithArray_copyItems_(v28, v29, (uint64_t)v15, 1);
    if (!v16)
    {
LABEL_13:
      v31 = (_QWORD *)operator new();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = sub_233CE5FB8;
      v33[3] = &unk_2504F0558;
      v37 = a6;
      v27 = v25;
      v34 = v27;
      v32 = v26;
      v35 = v32;
      v16 = v16;
      v36 = v16;
      sub_233CF073C((uint64_t)v31, v17, (uint64_t)v20, v33, (uint64_t)sub_233CF0730);
      *v31 = &off_2504F0750;
      sub_233CE6A5C((uint64_t)v31, self);

      goto LABEL_14;
    }
LABEL_12:
    v30 = objc_msgSend_copy(v16, v23, v24);

    v16 = (id)v30;
    goto LABEL_13;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233CE5FA0;
  block[3] = &unk_2504F0208;
  v39 = v20;
  dispatch_async(v17, block);
  v27 = v39;
LABEL_14:

}

- (void)writeAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID value:(id)value timedWriteTimeout:(NSNumber *)timeoutMs queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  id v17;
  NSNumber *v18;
  NSObject *v19;
  MTRDeviceResponseHandler v20;
  _QWORD *v21;
  id v22;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  NSNumber *v26;
  _QWORD v28[4];
  id v29;
  NSNumber *v30;
  NSNumber *v31;
  NSNumber *v32;
  NSNumber *v33;

  v14 = endpointID;
  v15 = clusterID;
  v16 = attributeID;
  v17 = value;
  v18 = timeoutMs;
  v19 = queue;
  v20 = completion;
  v21 = (_QWORD *)operator new();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_233CE6D50;
  v28[3] = &unk_2504F0580;
  v22 = v17;
  v29 = v22;
  v23 = v14;
  v30 = v23;
  v24 = v15;
  v31 = v24;
  v25 = v16;
  v32 = v25;
  v26 = v18;
  v33 = v26;
  sub_233CF073C((uint64_t)v21, v19, (uint64_t)v20, v28, (uint64_t)sub_233CF0730);
  *v21 = &off_2504F0750;
  sub_233CE6A5C((uint64_t)v21, self);

}

- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields timedInvokeTimeout:(NSNumber *)timeoutMs queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_serverSideProcessingTimeout_queue_completion_(self, a2, (uint64_t)endpointID, clusterID, commandID, commandFields, timeoutMs, 0, queue, completion);
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 queue:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v24 = a10;
  if (v15)
  {
    v25 = objc_msgSend_copy(v15, v22, v23);

    v15 = (id)v25;
  }
  if (v16)
  {
    v26 = objc_msgSend_copy(v16, v22, v23);

    v16 = (id)v26;
  }
  if (v17)
  {
    v27 = objc_msgSend_copy(v17, v22, v23);

    v17 = (id)v27;
  }
  if (v18)
  {
    v28 = objc_msgSend_copy(v18, v22, v23);

    v18 = (id)v28;
  }
  v29 = (void *)objc_msgSend_copy(v20, v22, v23);

  if (v29)
  {
    sub_2340DE8AC(v29, &unk_250591B30, &unk_250591B48);
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v32;
  }
  else
  {
    v33 = 0;
  }
  v34 = (void *)objc_msgSend_copy(v19, v30, v31);

  if (v34)
  {
    sub_2340DE8AC(v34, &unk_250591B60, &unk_250591B48);
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v35;
  }
  else
  {
    v36 = 0;
  }
  v37 = (_QWORD *)operator new();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = sub_233CE820C;
  v45[3] = &unk_2504F05A8;
  v38 = v16;
  v46 = v38;
  v39 = v17;
  v47 = v39;
  v40 = v15;
  v48 = v40;
  v41 = v36;
  v49 = v41;
  v42 = v18;
  v50 = v42;
  v43 = v33;
  v51 = v43;
  sub_233CF073C((uint64_t)v37, v21, (uint64_t)v24, v45, (uint64_t)sub_233CF0730);
  *v37 = &off_2504F0750;
  sub_233CE6A5C((uint64_t)v37, self);

}

- (void)_invokeKnownCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandPayload:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 responseClass:(Class)a9 queue:(id)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  const char *v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  id *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD block[4];
  id v33;
  id v34;
  id v35[2];

  v29 = a3;
  v17 = a4;
  v28 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v21 = a11;
  v35[0] = 0;
  objc_msgSend__encodeAsDataValue_(a6, v22, (uint64_t)v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v35[0];
  if (v23)
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = sub_233CE8988;
    v30[3] = &unk_2504F05D0;
    v31[1] = a9;
    v31[0] = v21;
    v25 = (void *)MEMORY[0x23493EEA8](v30);
    objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_serverSideProcessingTimeout_queue_completion_(self, v26, (uint64_t)v29, v17, v28, v23, v18, v19, v20, v25);
    v27 = (id *)v31;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233CE8974;
    block[3] = &unk_2504F03B0;
    v27 = &v34;
    v34 = v21;
    v33 = v24;
    dispatch_async(v20, block);
    v25 = v33;
  }

}

- (void)subscribeToAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished
{
  NSObject *v15;
  MTRDeviceResponseHandler v16;
  MTRSubscriptionEstablishedHandler v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  MTRSubscribeParams *v24;

  v24 = params;
  v15 = queue;
  v16 = reportHandler;
  v17 = subscriptionEstablished;
  v18 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend_requestPathWithEndpointID_clusterID_attributeID_(MTRAttributeRequestPath, v19, (uint64_t)endpointID, clusterID, attributeID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v18, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_subscribeToAttributePaths_eventPaths_params_queue_reportHandler_subscriptionEstablished_resubscriptionScheduled_(self, v23, (uint64_t)v22, 0, v24, v15, v16, v17, 0);
}

- (void)_subscribeToKnownAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 reportHandler:(id)a8 subscriptionEstablished:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  const char *v26;
  _QWORD v28[4];
  id v29;
  id v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend_attributePathWithEndpointID_clusterID_attributeID_(MTRAttributePath, v21, (uint64_t)v14, v15, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_233CE8D98;
  v28[3] = &unk_2504F0518;
  v23 = v19;
  v29 = v22;
  v30 = v23;
  v24 = v22;
  v25 = (void *)MEMORY[0x23493EEA8](v28);
  objc_msgSend_subscribeToAttributesWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(self, v26, (uint64_t)v14, v15, v16, v17, v18, v25, v20);

}

- (void)subscribeToAttributePaths:(NSArray *)attributePaths eventPaths:(NSArray *)eventPaths params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduled
{
  NSArray *v15;
  NSArray *v16;
  MTRSubscribeParams *v17;
  NSObject *v18;
  MTRDeviceResponseHandler v19;
  MTRSubscriptionEstablishedHandler v20;
  const char *v21;
  uint64_t v22;
  MTRDeviceResubscriptionScheduledHandler v23;
  const char *v24;
  uint64_t v25;
  id v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  MTRSubscribeParams *v37;
  const char *v38;
  void *v39;
  MTRDeviceResubscriptionScheduledHandler v40;
  MTRSubscriptionEstablishedHandler v41;
  void *v42;
  _QWORD v43[4];
  NSObject *v44;
  MTRBaseDevice *v45;
  id v46;
  id v47;
  MTRSubscribeParams *v48;
  id v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  _QWORD v54[4];
  id v55;

  v15 = attributePaths;
  v16 = eventPaths;
  v17 = params;
  v18 = queue;
  v19 = reportHandler;
  v20 = subscriptionEstablished;
  v23 = resubscriptionScheduled;
  if ((!v15 || !objc_msgSend_count(v15, v21, v22)) && (!v16 || !objc_msgSend_count(v16, v21, v22)))
  {
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = sub_233CE93C0;
    v54[3] = &unk_2504F0208;
    v55 = v19;
    dispatch_async(v18, v54);
    v26 = v55;
    goto LABEL_16;
  }
  if (!objc_msgSend_isPASEDevice(self, v21, v22))
  {
    v40 = v23;
    v41 = v20;
    if (v15)
    {
      v27 = objc_alloc(MEMORY[0x24BDBCE30]);
      v39 = (void *)objc_msgSend_initWithArray_copyItems_(v27, v28, (uint64_t)v15, 1);
      if (v16)
        goto LABEL_10;
    }
    else
    {
      v39 = 0;
      if (v16)
      {
LABEL_10:
        v29 = objc_alloc(MEMORY[0x24BDBCE30]);
        v42 = (void *)objc_msgSend_initWithArray_copyItems_(v29, v30, (uint64_t)v16, 1);
        if (!v17)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    v42 = 0;
    if (!v17)
    {
LABEL_15:
      objc_msgSend_deviceController(self, v24, v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_nodeID(self, v33, v34);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = sub_233CE94AC;
      v43[3] = &unk_2504F0610;
      v44 = v18;
      v49 = v19;
      v50 = v20;
      v51 = v23;
      v45 = self;
      v26 = v39;
      v46 = v26;
      v36 = v42;
      v47 = v36;
      v37 = v17;
      v48 = v37;
      objc_msgSend_getSessionForNode_completion_(v32, v38, v35, v43);

      v17 = v37;
      v23 = v40;
      v20 = v41;
      goto LABEL_16;
    }
LABEL_14:
    v31 = objc_msgSend_copy(v17, v24, v25);

    v17 = (MTRSubscribeParams *)v31;
    goto LABEL_15;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_233CE942C;
  block[3] = &unk_2504F0208;
  v53 = v19;
  dispatch_async(v18, block);
  v26 = v53;
LABEL_16:

}

- (void)deregisterReportHandlersWithQueue:(dispatch_queue_t)queue completion:(dispatch_block_t)completion
{
  NSObject *v6;
  dispatch_block_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  const char *v17;
  id v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  const char *v35;
  uint8_t buf[8];
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  id v47;

  v6 = queue;
  v7 = completion;
  sub_234117B80(0, "NotSpecified");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_INFO, "Unexpected call to deregister report handlers", buf, 2u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  objc_msgSend_deviceController(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_nodeID(self, v12, v13);
  v15 = v11;
  v16 = v6;
  v18 = v7;
  if (qword_2561591E0 != -1)
    dispatch_once(&qword_2561591E0, &unk_2504F0720);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v17, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock((void *)qword_2561591D0, v20, v21);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_2561591D8, v22, (uint64_t)v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_((void *)qword_2561591D8, v24, (uint64_t)v19);
  objc_msgSend_unlock((void *)qword_2561591D0, v25, v26);
  v27 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = sub_233CF1388;
  v44[3] = &unk_2504F0808;
  v28 = v23;
  v45 = v28;
  v29 = v18;
  v47 = v29;
  v30 = v16;
  v46 = v30;
  *(_QWORD *)buf = v27;
  v37 = 3221225472;
  v38 = sub_233CF14AC;
  v39 = &unk_2504F0830;
  v31 = v28;
  v40 = v31;
  v32 = v19;
  v41 = v32;
  v33 = v30;
  v42 = v33;
  v34 = v29;
  v43 = v34;
  objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(v15, v35, (uint64_t)v44, buf);

}

- (void)_openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7
{
  unint64_t v7;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  id *v23;
  _QWORD *v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  const char *v37;
  int v38;
  void *v39;
  char v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  _QWORD v44[4];
  _QWORD v45[2];
  id v46;
  unint64_t v47;
  unint64_t v48;
  char v49;
  int v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD block[4];
  id v56;
  _QWORD v57[4];
  id v58;
  uint8_t buf[4];
  _BYTE v60[14];
  char v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  *(_DWORD *)buf = 0;
  *(_QWORD *)&v60[4] = "dwnfw_open_pairing_window";
  v61 = 0;
  sub_2341C4BEC((uint64_t)buf);
  if (objc_msgSend_isPASEDevice(self, v18, v19))
  {
    sub_234117B80(0, "NotSpecified");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "Can't open a commissioning window over PASE", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = sub_233CEABB8;
    v57[3] = &unk_2504F0208;
    v23 = &v58;
    v58 = v17;
    v24 = v57;
LABEL_19:
    dispatch_async(v16, v24);
    goto LABEL_20;
  }
  v27 = objc_msgSend_unsignedLongLongValue(v15, v20, v21);
  if (v27 >= 0x10000)
  {
    sub_234117B80(0, "NotSpecified");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v60 = v27;
      _os_log_impl(&dword_233BF3000, v32, OS_LOG_TYPE_ERROR, "Error: Duration %llu is too large.", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_233CEAC68;
    block[3] = &unk_2504F0208;
    v23 = &v56;
    v56 = v17;
    v24 = block;
    goto LABEL_19;
  }
  v30 = objc_msgSend_unsignedLongLongValue(v14, v25, v26);
  if (v30 >= 0x1000)
  {
    sub_234117B80(0, "NotSpecified");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v60 = v30;
      *(_WORD *)&v60[8] = 1024;
      *(_DWORD *)&v60[10] = 4095;
      _os_log_impl(&dword_233BF3000, v31, OS_LOG_TYPE_ERROR, "Error: Discriminator %llu is too large. Max value %d", buf, 0x12u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = sub_233CEAD1C;
    v53[3] = &unk_2504F0208;
    v23 = &v54;
    v54 = v17;
    v24 = v53;
    goto LABEL_19;
  }
  if (v13)
  {
    v33 = objc_msgSend_unsignedLongLongValue(v13, v28, v29);
    v7 = v33;
    if (HIDWORD(v33) || !sub_2341C8690(v33))
    {
      sub_234117B80(0, "NotSpecified");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v60 = v7;
        _os_log_impl(&dword_233BF3000, v34, OS_LOG_TYPE_ERROR, "Error: Setup passcode %llu is not valid", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = sub_233CEADD0;
      v51[3] = &unk_2504F0208;
      v23 = &v52;
      v52 = v17;
      v24 = v51;
      goto LABEL_19;
    }
    v40 = 1;
  }
  else
  {
    v40 = 0;
  }
  v38 = v7;
  objc_msgSend_deviceController(self, v28, v29);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3321888768;
  v44[2] = sub_233CEAE84;
  v44[3] = &unk_2504F0660;
  v35 = v16;
  v45[0] = v35;
  v36 = v17;
  v45[1] = self;
  v46 = v36;
  v47 = v27;
  v48 = v30;
  v49 = v40;
  if (v13)
    v50 = v38;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = sub_233CEB6B4;
  v41[3] = &unk_2504F0428;
  v42 = v35;
  v43 = v36;
  objc_msgSend_asyncGetCommissionerOnMatterQueue_errorHandler_(v39, v37, (uint64_t)v44, v41);

  v23 = (id *)v45;
LABEL_20:

}

- (void)openCommissioningWindowWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
  MEMORY[0x24BEDD108](self, sel__openCommissioningWindowWithSetupPasscode_discriminator_duration_queue_completion_, setupPasscode);
}

- (void)openCommissioningWindowWithDiscriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
  MEMORY[0x24BEDD108](self, sel__openCommissioningWindowWithSetupPasscode_discriminator_duration_queue_completion_, 0);
}

- (void)readEventsWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID params:(MTRReadParams *)params queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  NSObject *v14;
  MTRDeviceResponseHandler v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  MTRReadParams *v22;

  v22 = params;
  v14 = queue;
  v15 = completion;
  v16 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend_requestPathWithEndpointID_clusterID_eventID_(MTREventRequestPath, v17, (uint64_t)endpointID, clusterID, eventID);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v16, v19, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_readAttributePaths_eventPaths_params_queue_completion_(self, v21, 0, v20, v22, v14, v15);
}

- (void)subscribeToEventsWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID params:(MTRSubscribeParams *)params queue:(dispatch_queue_t)queue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished
{
  NSObject *v15;
  MTRDeviceResponseHandler v16;
  MTRSubscriptionEstablishedHandler v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  MTRSubscribeParams *v24;

  v24 = params;
  v15 = queue;
  v16 = reportHandler;
  v17 = subscriptionEstablished;
  v18 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend_requestPathWithEndpointID_clusterID_eventID_(MTREventRequestPath, v19, (uint64_t)endpointID, clusterID, eventID);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v18, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_subscribeToAttributePaths_eventPaths_params_queue_reportHandler_subscriptionEstablished_resubscriptionScheduled_(self, v23, 0, v22, v24, v15, v16, v17, 0);
}

+ (id)eventReportForHeader:(const EventHeader *)a3 andData:(id)a4
{
  id v5;
  MTREventPath *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  int var0;
  const char *v27;
  NSObject *v28;
  int var2;
  const char *v30;
  __int128 v32;
  int v33;
  __int128 v34;
  int v35;
  __int128 v36;
  int v37;
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = [MTREventPath alloc];
  v10 = (void *)objc_msgSend_initWithPath_(v6, v7, (uint64_t)a3);
  if (!v5)
  {
    sub_234117B80(0, "NotSpecified");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v10;
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "%@ could not decode event data", buf, 0xCu);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v48[1] = CFSTR("error");
    v49[0] = v10;
    v48[0] = CFSTR("eventPath");
    LODWORD(v36) = 47;
    *((_QWORD *)&v36 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRBaseDevice.mm";
    v37 = 2048;
    sub_2340017F0((uint64_t)MTRError, &v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)v49, v48, 2);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (a3->var3.var0 == 1)
  {
    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x24BDBCE60], v8, v9, (double)(a3->var3.var1 % 0x3E8) / 1000.0 + (double)(a3->var3.var1 / 0x3E8));
    v11 = CFSTR("eventTimestampDate");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = &unk_250591BC0;
    goto LABEL_11;
  }
  if (a3->var3.var0)
  {
    sub_234117B80(0, "NotSpecified");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      var0 = a3->var3.var0;
      *(_DWORD *)buf = 138412546;
      v45 = v10;
      v46 = 1024;
      v47 = var0;
      _os_log_impl(&dword_233BF3000, v25, OS_LOG_TYPE_ERROR, "%@ Unsupported event timestamp type %u - ignoring", buf, 0x12u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v42[1] = CFSTR("error");
    v43[0] = v10;
    v42[0] = CFSTR("eventPath");
    LODWORD(v34) = 108;
    *((_QWORD *)&v34 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRBaseDevice.mm";
    v35 = 2065;
    sub_2340017F0((uint64_t)MTRError, &v34);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)v43, v42, 2);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v24 = (void *)v18;
    goto LABEL_30;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v8, v9, (double)(a3->var3.var1 % 0x3E8) / 1000.0 + (double)(a3->var3.var1 / 0x3E8));
  v11 = CFSTR("eventSystemUpTime");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = &unk_250591BA8;
LABEL_11:
  if (a3->var2 >= 3u)
  {
    sub_234117B80(0, "NotSpecified");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      var2 = a3->var2;
      *(_DWORD *)buf = 138412546;
      v45 = v10;
      v46 = 1024;
      v47 = var2;
      _os_log_impl(&dword_233BF3000, v28, OS_LOG_TYPE_ERROR, "%@ Unsupported event priority %u - ignoring", buf, 0x12u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    v41[0] = v10;
    v40[0] = CFSTR("eventPath");
    v40[1] = CFSTR("error");
    LODWORD(v32) = 108;
    *((_QWORD *)&v32 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRBaseDevice.mm";
    v33 = 2070;
    sub_2340017F0((uint64_t)MTRError, &v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v41, v40, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38[0] = CFSTR("eventPath");
    v38[1] = CFSTR("data");
    v39[0] = v10;
    v39[1] = v5;
    v38[2] = CFSTR("eventNumber");
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v12, a3->var1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v20;
    v38[3] = CFSTR("eventPriority");
    v21 = 1;
    if (a3->var2 != 1)
      v21 = 2;
    if (a3->var2)
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v19, v21);
    else
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v22;
    v39[4] = v14;
    v38[4] = CFSTR("eventTimeType");
    v38[5] = v11;
    v39[5] = v13;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v39, v38, 6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = (void *)v13;
LABEL_30:

  return v24;
}

+ (PacketBufferHandle)_responseDataForCommand:(id)a3 clusterID:(unsigned int)a4 commandID:(unsigned int)a5 error:(id *)a6
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  char isEqualToNumber;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  char v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  PacketBufferHandle v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  char v53[64];
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  int v58;
  const char *v59;
  int v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v10 = v6;
  v11 = a3;
  v12 = objc_opt_class();
  if ((sub_233CEC478(v11, CFSTR("commandPath"), v12, CFSTR("response-value command path is not an MTRCommandPath."), a6) & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v11, v13, (uint64_t)CFSTR("commandPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cluster(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v18, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToNumber = objc_msgSend_isEqualToNumber_(v17, v20, (uint64_t)v19);

    if ((isEqualToNumber & 1) != 0)
    {
      objc_msgSend_command(v14, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v25, v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_isEqualToNumber_(v24, v27, (uint64_t)v26);

      if ((v28 & 1) != 0)
      {
        v31 = objc_opt_class();
        if ((sub_233CEC478(v11, CFSTR("data"), v31, CFSTR("response-value data is not a data-value dictionary."), a6) & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v11, v32, (uint64_t)CFSTR("data"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          sub_234118674(0x62FuLL, 0, &v61);
          if (!v61)
          {
            v58 = 11;
            v59 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRBaseDevice.mm";
            v60 = 2116;
            sub_233CEC784(CFSTR("Unable to allocate encoding buffer"), (uint64_t)&v58, a6);
            *v10 = 0;
LABEL_19:
            sub_233CAF128(&v61);

            goto LABEL_12;
          }
          sub_234106C48((uint64_t)v53);
          v55 = 0;
          v56 = 0;
          v54 = &unk_250504030;
          v57 = 0;
          sub_233CAF098((uint64_t)&v54, &v61, 0);
          sub_234106CA8((uint64_t)v53, (uint64_t)&v54, 0xFFFFFFFF, (uint64_t)&v62);
          v62 = 0uLL;
          v63 = 0;
          sub_233CE4434(v33, v53, 0x100uLL, (uint64_t)&v62);
          if ((_DWORD)v62)
          {
            v51 = v62;
            v52 = v63;
            sub_233CEC784(CFSTR("Unable to encode data-value to TLV"), (uint64_t)&v51, a6);
          }
          else
          {
            sub_233C115F0((uint64_t)v53, &v61, &v49);
            v62 = v49;
            v63 = v50;
            if (!(_DWORD)v49)
            {
              *v10 = v61;
              v61 = 0;
              goto LABEL_18;
            }
            v47 = v62;
            v48 = v63;
            sub_233CEC784(CFSTR("Unable to encode data-value to TLV"), (uint64_t)&v47, a6);
          }
          *v10 = 0;
LABEL_18:
          v54 = &unk_250504030;
          sub_233CAF128(&v56);
          sub_233CAF128(&v55);
          goto LABEL_19;
        }
      }
      else
      {
        v40 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_command(v14, v29, v30);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v42, v8);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v40, v44, (uint64_t)CFSTR("Expected command id %@ but got %@"), v41, v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        sub_233CEC58C(v45, 13, a6);

      }
    }
    else
    {
      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_cluster(v14, v22, v23);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v36, v9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v34, v38, (uint64_t)CFSTR("Expected cluster id %@ but got %@"), v35, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      sub_233CEC58C(v39, 13, a6);

    }
    *v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  *v10 = 0;
LABEL_13:

  return v46;
}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  MTRDeviceController *deviceController;
  const char *v12;
  void *v13;
  const char *v14;
  id v15;

  v15 = a5;
  v10 = a6;
  deviceController = self->_deviceController;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v12, self->_nodeID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadLogFromNodeWithID_type_timeout_queue_completion_(deviceController, v14, (uint64_t)v13, a3, v15, v10, a4);

}

- (BOOL)isPASEDevice
{
  return self->_isPASEDevice;
}

- (MTRDeviceController)deviceController
{
  return self->_deviceController;
}

- (unint64_t)nodeID
{
  return self->_nodeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceController, 0);
}

- (void)subscribeWithQueue:(dispatch_queue_t)queue minInterval:(uint16_t)minInterval maxInterval:(uint16_t)maxInterval params:(MTRSubscribeParams *)params cacheContainer:(MTRAttributeCacheContainer *)attributeCacheContainer attributeReportHandler:(MTRDeviceReportHandler)attributeReportHandler eventReportHandler:(MTRDeviceReportHandler)eventReportHandler errorHandler:(MTRDeviceErrorHandler)errorHandler subscriptionEstablished:(dispatch_block_t)subscriptionEstablishedHandler resubscriptionScheduled:(MTRDeviceResubscriptionScheduledHandler)resubscriptionScheduledHandler
{
  uint64_t v15;
  uint64_t v16;
  MTRDeviceReportHandler v17;
  MTRDeviceReportHandler v18;
  MTRDeviceErrorHandler v19;
  dispatch_block_t v20;
  MTRDeviceResubscriptionScheduledHandler v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  MTRSubscribeParams *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  NSObject *v41;
  MTRAttributeCacheContainer *v42;

  v15 = maxInterval;
  v16 = minInterval;
  v41 = queue;
  v42 = attributeCacheContainer;
  v17 = attributeReportHandler;
  v18 = eventReportHandler;
  v19 = errorHandler;
  v20 = subscriptionEstablishedHandler;
  v21 = resubscriptionScheduledHandler;
  v25 = (void *)objc_msgSend_copy(params, v22, v23);
  if (v25)
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v24, v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMinInterval_(v25, v27, (uint64_t)v26);

    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v28, v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMaxInterval_(v25, v30, (uint64_t)v29);
  }
  else
  {
    v31 = [MTRSubscribeParams alloc];
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v32, v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v33, v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v31, v35, (uint64_t)v29, v34);

  }
  objc_msgSend_realContainer(v42, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscribeWithQueue_params_clusterStateCacheContainer_attributeReportHandler_eventReportHandler_errorHandler_subscriptionEstablished_resubscriptionScheduled_(self, v39, (uint64_t)v41, v25, v38, v17, v18, v19, v20, v21);

}

- (void)writeAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId value:(id)value timedWriteTimeout:(NSNumber *)timeoutMs clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion
{
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_timedWriteTimeout_queue_completion_(self, a2, (uint64_t)endpointId, clusterId, attributeId, value, timeoutMs, clientQueue);
}

- (void)invokeCommandWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId commandId:(NSNumber *)commandId commandFields:(id)commandFields timedInvokeTimeout:(NSNumber *)timeoutMs clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion
{
  objc_msgSend_invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_queue_completion_(self, a2, (uint64_t)endpointId, clusterId, commandId, commandFields, timeoutMs, clientQueue);
}

- (void)subscribeAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId minInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params clientQueue:(dispatch_queue_t)clientQueue reportHandler:(MTRDeviceResponseHandler)reportHandler subscriptionEstablished:(dispatch_block_t)subscriptionEstablishedHandler
{
  NSNumber *v17;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  NSObject *v21;
  MTRDeviceResponseHandler v22;
  dispatch_block_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  MTRSubscribeParams *v31;
  const char *v32;
  NSNumber *v33;

  v33 = endpointId;
  v17 = clusterId;
  v18 = attributeId;
  v19 = minInterval;
  v20 = maxInterval;
  v21 = clientQueue;
  v22 = reportHandler;
  v23 = subscriptionEstablishedHandler;
  v26 = (void *)objc_msgSend_copy(params, v24, v25);
  v28 = v26;
  if (v26)
  {
    objc_msgSend_setMinInterval_(v26, v27, (uint64_t)v19);
    objc_msgSend_setMaxInterval_(v28, v29, (uint64_t)v20);
  }
  else
  {
    v31 = [MTRSubscribeParams alloc];
    v28 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v31, v32, (uint64_t)v19, v20);
  }
  objc_msgSend_subscribeToAttributesWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(self, v30, (uint64_t)v33, v17, v18, v28, v21, v22, v23);

}

- (void)deregisterReportHandlersWithClientQueue:(dispatch_queue_t)queue completion:(dispatch_block_t)completion
{
  MEMORY[0x24BEDD108](self, sel_deregisterReportHandlersWithQueue_completion_, queue);
}

@end
