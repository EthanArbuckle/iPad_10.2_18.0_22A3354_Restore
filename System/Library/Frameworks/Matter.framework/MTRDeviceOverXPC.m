@implementation MTRDeviceOverXPC

- (MTRDeviceOverXPC)initWithControllerOverXPC:(id)a3 deviceID:(id)a4 xpcConnection:(id)a5
{
  MTRDeviceControllerOverXPC *v8;
  NSNumber *v9;
  MTRDeviceControllerXPCConnection *v10;
  const char *v11;
  uint64_t v12;
  NSCopying *v13;
  NSCopying *controllerID;
  MTRDeviceControllerOverXPC *controller;
  MTRDeviceControllerOverXPC *v16;
  NSNumber *nodeID;
  NSNumber *v18;
  MTRDeviceControllerXPCConnection *xpcConnection;

  v8 = (MTRDeviceControllerOverXPC *)a3;
  v9 = (NSNumber *)a4;
  v10 = (MTRDeviceControllerXPCConnection *)a5;
  objc_msgSend_controllerXPCID(v8, v11, v12);
  v13 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  controllerID = self->_controllerID;
  self->_controllerID = v13;

  controller = self->_controller;
  self->_controller = v8;
  v16 = v8;

  nodeID = self->_nodeID;
  self->_nodeID = v9;
  v18 = v9;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v10;

  return self;
}

- (void)subscribeWithQueue:(id)a3 params:(id)a4 clusterStateCacheContainer:(id)a5 attributeReportHandler:(id)a6 eventReportHandler:(id)a7 errorHandler:(id)a8 subscriptionEstablished:(id)a9 resubscriptionScheduled:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  const char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  MTRDeviceOverXPC *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  sub_234117B80(0, "NotSpecified");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_INFO, "Subscribing all attributes... Note that attributeReportHandler, eventReportHandler, and resubscriptionScheduled are not supported.", buf, 2u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = sub_2340D2E90;
  v31 = &unk_250501E88;
  v20 = v17;
  v36 = v20;
  v21 = v16;
  v32 = v21;
  v33 = self;
  v22 = v15;
  v34 = v22;
  v27 = v14;
  v23 = v14;
  v35 = v23;
  v24 = v18;
  v37 = v24;
  v25 = (void *)MEMORY[0x23493EEA8](&v28);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(self, v26, (uint64_t)v23, v25, v15, v27, v28, v29, v30, v31);

}

- (void)readAttributesWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  const char *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  sub_234117B80(0, "NotSpecified");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v20, OS_LOG_TYPE_INFO, "Reading attribute ...", buf, 2u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_2340D3458;
  v29[3] = &unk_250501F00;
  v21 = v19;
  v35 = v21;
  v29[4] = self;
  v22 = v14;
  v30 = v22;
  v23 = v15;
  v31 = v23;
  v24 = v16;
  v32 = v24;
  v25 = v17;
  v33 = v25;
  v26 = v18;
  v34 = v26;
  v27 = (void *)MEMORY[0x23493EEA8](v29);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(self, v28, (uint64_t)v26, v27);

}

- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 queue:(id)a6 completion:(id)a7
{
  objc_msgSend_readAttributePaths_eventPaths_params_includeDataVersion_queue_completion_(self, a2, (uint64_t)a3, a4, a5, 0, a6, a7);
}

- (void)readAttributePaths:(id)a3 eventPaths:(id)a4 params:(id)a5 includeDataVersion:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id obj;
  id v40;
  NSObject *queue;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD *v46;
  uint8_t *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[3];
  char v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD block[4];
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v40 = a5;
  queue = a7;
  v42 = a8;
  v37 = v14;
  v38 = v13;
  if (!v13 || v14)
  {
    sub_234117B80(0, "NotSpecified");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v36, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support reading event paths over XPC", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2340D3C04;
    block[3] = &unk_2504F0208;
    v60 = v42;
    dispatch_async(queue, block);

  }
  else
  {
    v17 = objc_msgSend_count(v13, v15, v16);
    *(_QWORD *)buf = 0;
    v56 = buf;
    v57 = 0x2020000000;
    v58 = 0;
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v13;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v49, v61, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = sub_2340D3C7C;
          v43[3] = &unk_250501F28;
          v46 = v53;
          v45 = v42;
          v44 = v18;
          v47 = buf;
          v48 = v17;
          v24 = (void *)MEMORY[0x23493EEA8](v43);
          objc_msgSend_endpoint(v23, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_cluster(v23, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_attribute(v23, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_readAttributesWithEndpointID_clusterID_attributeID_params_queue_completion_(self, v34, (uint64_t)v27, v30, v33, v40, queue, v24);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v49, v61, 16);
      }
      while (v20);
    }

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(buf, 8);
  }

}

- (void)writeAttributeWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 value:(id)a6 timedWriteTimeout:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  MTRDeviceOverXPC *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  sub_234117B80(0, "NotSpecified");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v16;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_INFO, "Writing attribute ...", buf, 2u);
  }
  v24 = self;

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340D4048;
  v34[3] = &unk_250501F50;
  v25 = v21;
  v41 = v25;
  v34[4] = v24;
  v33 = v15;
  v35 = v33;
  v32 = v23;
  v36 = v32;
  v26 = v17;
  v37 = v26;
  v27 = v18;
  v38 = v27;
  v28 = v19;
  v39 = v28;
  v29 = v20;
  v40 = v29;
  v30 = (void *)MEMORY[0x23493EEA8](v34);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(v24, v31, (uint64_t)v29, v30);

}

- (void)invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  MTRDeviceOverXPC *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  sub_234117B80(0, "NotSpecified");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v16;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_INFO, "Invoking command ...", buf, 2u);
  }
  v24 = self;

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2340D467C;
  v34[3] = &unk_250501F50;
  v25 = v21;
  v41 = v25;
  v34[4] = v24;
  v33 = v15;
  v35 = v33;
  v32 = v23;
  v36 = v32;
  v26 = v17;
  v37 = v26;
  v27 = v18;
  v38 = v27;
  v28 = v19;
  v39 = v28;
  v29 = v20;
  v40 = v29;
  v30 = (void *)MEMORY[0x23493EEA8](v34);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(v24, v31, (uint64_t)v29, v30);

}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 timedInvokeTimeout:(id)a7 serverSideProcessingTimeout:(id)a8 queue:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v25 = v23;
  if (v21)
  {
    sub_234117B80(0, "NotSpecified");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v26, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support invokes with a server-side processing timeout over XPC", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2340D4BBC;
    block[3] = &unk_2504F0208;
    v28 = v25;
    dispatch_async(v22, block);

  }
  else
  {
    objc_msgSend_invokeCommandWithEndpointID_clusterID_commandID_commandFields_timedInvokeTimeout_queue_completion_(self, v24, (uint64_t)v16, v17, v18, v19, v20, v22, v23);
  }

}

- (void)subscribeToAttributesWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5 params:(id)a6 queue:(id)a7 reportHandler:(id)a8 subscriptionEstablished:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  MTRDeviceOverXPC *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  const char *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  sub_234117B80(0, "NotSpecified");
  v22 = objc_claimAutoreleasedReturnValue();
  v36 = v18;
  v37 = v15;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_INFO, "Subscribing attribute ...", buf, 2u);
  }
  v23 = v16;
  v24 = self;

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_2340D4EF8;
  v38[3] = &unk_250501FA0;
  v25 = v21;
  v44 = v25;
  v26 = v20;
  v45 = v26;
  v38[4] = v24;
  v27 = v19;
  v39 = v27;
  v35 = v37;
  v40 = v35;
  v34 = v19;
  v28 = v23;
  v41 = v28;
  v33 = v17;
  v29 = v17;
  v42 = v29;
  v30 = v36;
  v43 = v30;
  v31 = (void *)MEMORY[0x23493EEA8](v38);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(v24, v32, (uint64_t)v27, v31, v20, v33, v34);

}

- (void)deregisterReportHandlersWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(_QWORD);
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  sub_234117B80(0, "NotSpecified");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_INFO, "Deregistering report handlers", buf, 2u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v9 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_2340D5D1C;
  v23[3] = &unk_250500850;
  v23[4] = self;
  v10 = v6;
  v24 = v10;
  v11 = v7;
  v25 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x23493EEA8](v23);
  objc_msgSend_controllerID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v12[2](v12);
  }
  else
  {
    objc_msgSend_controller(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = sub_2340D5E1C;
    v20[3] = &unk_250501FC8;
    v20[4] = self;
    v21 = v11;
    v22 = v12;
    objc_msgSend_fetchControllerIdWithQueue_completion_(v18, v19, (uint64_t)v10, v20);

  }
}

- (void)openCommissioningWindowWithSetupPasscode:(id)a3 discriminator:(id)a4 duration:(id)a5 queue:(id)a6 completion:(id)a7
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[16];

  v8 = a6;
  v9 = a7;
  sub_234117B80(0, "NotSpecified");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support openCommissioningWindowWithSetupPasscode over XPC", buf, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2340D5FBC;
  block[3] = &unk_2504F0208;
  v13 = v9;
  v11 = v9;
  dispatch_async(v8, block);

}

- (void)openCommissioningWindowWithDiscriminator:(id)a3 duration:(id)a4 queue:(id)a5 completion:(id)a6
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  v7 = a5;
  v8 = a6;
  sub_234117B80(0, "NotSpecified");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "MTRBaseDevice doesn't support openCommissioningWindowWithDiscriminator over XPC", buf, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2340D614C;
  block[3] = &unk_2504F0208;
  v12 = v8;
  v10 = v8;
  dispatch_async(v7, block);

}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  const char *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  double v21;
  uint8_t buf[16];

  v10 = a5;
  v11 = a6;
  sub_234117B80(0, "NotSpecified");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_INFO, "Downloading log ...", buf, 2u);
  }

  if (sub_234114844(3u))
    sub_2341147D0(0, 3);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_2340D6344;
  v17[3] = &unk_250502018;
  v13 = v11;
  v19 = v13;
  v20 = a3;
  v17[4] = self;
  v21 = a4;
  v14 = v10;
  v18 = v14;
  v15 = (void *)MEMORY[0x23493EEA8](v17);
  objc_msgSend_fetchProxyHandleWithQueue_completion_(self, v16, (uint64_t)v14, v15);

}

- (void)fetchProxyHandleWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  MTRDeviceControllerXPCConnection *xpcConnection;
  const char *v14;
  id *v15;
  void *v16;
  const char *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend_controllerID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    xpcConnection = self->_xpcConnection;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_2340D67FC;
    v20[3] = &unk_250502040;
    v21 = v6;
    v22 = v7;
    objc_msgSend_getProxyHandleWithCompletion_(xpcConnection, v14, (uint64_t)v20);
    v15 = &v21;

  }
  else
  {
    objc_msgSend_controller(self, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_2340D69A0;
    v18[3] = &unk_250502068;
    v18[4] = self;
    v19 = v7;
    objc_msgSend_fetchControllerIdWithQueue_completion_(v16, v17, (uint64_t)v6, v18);
    v15 = &v19;

  }
}

- (NSCopying)controllerID
{
  return self->_controllerID;
}

- (MTRDeviceControllerOverXPC)controller
{
  return self->_controller;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (MTRDeviceControllerXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);
}

@end
