@implementation MRAVConcreteEndpoint

- (MRAVConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVConcreteEndpoint.m"), 71, CFSTR("Attempted to create MRAVConcreteEndpoint without using AVOutputDeviceGroup. Use MRConcreteEndpoint instead."));

  return 0;
}

- (MRAVConcreteEndpoint)initWithOutputDeviceGroup:(id)a3 groupLeader:(id)a4 outputDevices:(id)a5
{
  id v9;
  id v10;
  id v11;
  MRAVOutputDeviceSourceInfo *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  MRAVOutputDeviceSourceInfo *v22;
  void *v23;
  MRAVOutputDeviceSourceInfo *v24;
  MRAVConcreteOutputDevice *v25;
  MRAVConcreteEndpoint *v26;
  AVOutputDeviceGroup *outputDeviceGroup;
  void *v29;
  MRAVConcreteOutputDevice *v30;
  void *v31;
  MRAVConcreteEndpoint *v32;
  void *v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "receivesLongFormAudioFromLocalDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVConcreteEndpoint.m"), 78, CFSTR("Attempted to initialize local endpoint from AVOutputDeviceGroup. Use MRAVLocalEndpoint instead."));

  }
  v32 = self;
  v12 = [MRAVOutputDeviceSourceInfo alloc];
  objc_msgSend(v10, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:](v12, "initWithRoutingContextUID:multipleBuiltInDevices:", v13, 0);

  v33 = v10;
  v31 = (void *)v14;
  v30 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]([MRAVConcreteOutputDevice alloc], "initWithAVOutputDevice:sourceInfo:", v10, v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v22 = [MRAVOutputDeviceSourceInfo alloc];
        objc_msgSend(v21, "deviceID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:](v22, "initWithRoutingContextUID:multipleBuiltInDevices:", v23, 0);

        v25 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]([MRAVConcreteOutputDevice alloc], "initWithAVOutputDevice:sourceInfo:", v21, v24);
        objc_msgSend(v15, "addObject:", v25);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }

  if ((objc_msgSend(v15, "containsObject:", v30) & 1) == 0)
    objc_msgSend(v15, "addObject:", v30);
  v34.receiver = v32;
  v34.super_class = (Class)MRAVConcreteEndpoint;
  v26 = -[MRConcreteEndpoint initWithDesignatedGroupLeader:outputDevices:preferredSuffix:](&v34, sel_initWithDesignatedGroupLeader_outputDevices_preferredSuffix_, v30, v15, 0);
  outputDeviceGroup = v26->_outputDeviceGroup;
  v26->_outputDeviceGroup = (AVOutputDeviceGroup *)v9;

  -[MRAVConcreteEndpoint registerVolumeNotifications](v26, "registerVolumeNotifications");
  return v26;
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  AVOutputDeviceGroup *outputDeviceGroup;
  void *v35;
  MRBlockGuard *v36;
  void *v37;
  id v38;
  MRBlockGuard *v39;
  id v40;
  MRBlockGuard *v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  void *v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void *v48;
  int v49;
  id v50;
  dispatch_queue_t queue;
  id v52;
  id obj;
  id obja;
  id v55;
  void *v56;
  _QWORD block[4];
  MRBlockGuard *v59;
  id v60;
  _BYTE *v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[6];
  NSObject *v65;
  _BYTE *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  __CFString *v72;
  id v73;
  id v74;
  id v75;
  dispatch_queue_t v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  int v81;
  BOOL v82;
  uint8_t v83[128];
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v55 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v49 = MRAnalyticsCompositionForEndpoint(self);
  v45 = -[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint");
  -[MRConcreteEndpoint outputDevices](self, "outputDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = (void *)MEMORY[0x1E0CB3940];
  MRAVOutputDeviceArrayDescription(v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint debugName](self, "debugName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("devices=%@ to endpoint=%@"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("addOutputDevices:APSync"), v12);
  v21 = v20;
  if (v19)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v19);
  v48 = v21;
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[AVOutputDeviceGroup outputDevices](self->_outputDeviceGroup, "outputDevices");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v23, "initWithFormat:", CFSTR("Existing devices in endpoint %@"), v24);

  _MRLogForCategory(0xAuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = CFSTR("addOutputDevices:APSync");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v85 = v47;
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v71[3] = &unk_1E30CF308;
  v71[4] = self;
  v72 = CFSTR("addOutputDevices:APSync");
  v52 = v12;
  v73 = v52;
  v44 = v19;
  v74 = v44;
  v43 = obj;
  v75 = v43;
  v42 = v55;
  v79 = v42;
  queue = (dispatch_queue_t)v11;
  v76 = queue;
  v81 = v49;
  v50 = v10;
  v77 = v50;
  v80 = v15;
  v26 = v9;
  v78 = v26;
  v82 = v45;
  v46 = (void *)MEMORY[0x194036C44](v71);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v27);

  if (v10)
  {
    getAVOutputDeviceGroupAddOutputDeviceOptionInitiator();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v50, v28);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v85 = __Block_byref_object_copy__45;
  v86 = __Block_byref_object_dispose__45;
  v87 = 0;
  v29 = dispatch_group_create();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obja = v26;
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v68 != v31)
          objc_enumerationMutation(obja);
        v33 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        dispatch_group_enter(v29);
        outputDeviceGroup = self->_outputDeviceGroup;
        objc_msgSend(v33, "avOutputDevice");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_30;
        v64[3] = &unk_1E30CF330;
        v66 = buf;
        v64[4] = self;
        v64[5] = v33;
        v65 = v29;
        -[AVOutputDeviceGroup addOutputDevice:withOptions:completionHandler:](outputDeviceGroup, "addOutputDevice:withOptions:completionHandler:", v35, v56, v64);

      }
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v30);
  }

  v36 = [MRBlockGuard alloc];
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("addOutputDevices:APSync"), v52);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
  v62[3] = &unk_1E30C6798;
  v38 = v46;
  v63 = v38;
  v39 = -[MRBlockGuard initWithTimeout:reason:handler:](v36, "initWithTimeout:reason:handler:", v37, v62, 30.0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  block[3] = &unk_1E30CF358;
  v59 = v39;
  v60 = v38;
  v61 = buf;
  v40 = v38;
  v41 = v39;
  dispatch_group_notify(v29, queue, block);

  _Block_object_dispose(buf, 8);
}

void __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD block[4];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Final devices in endpoint %@"), v5);

  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 56);
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v3)
  {
    v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v19)
        goto LABEL_16;
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      v22 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138544130;
      v36 = v20;
      v37 = 2114;
      v38 = v21;
      v39 = 2114;
      v40 = v22;
      v41 = 2048;
      v42 = v23;
      v24 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v25 = v12;
      v26 = 42;
    }
    else
    {
      if (!v19)
        goto LABEL_16;
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138543874;
      v36 = v27;
      v37 = 2114;
      v38 = v28;
      v39 = 2048;
      v40 = v29;
      v24 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v25 = v12;
      v26 = 32;
    }
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_15;
  }
  v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (!v13)
      goto LABEL_16;
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544386;
    v36 = v14;
    v37 = 2114;
    v38 = v15;
    v39 = 2114;
    v40 = v3;
    v41 = 2114;
    v42 = v16;
    v43 = 2048;
    v44 = v18;
    _os_log_error_impl(&dword_193827000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_15:

    goto LABEL_16;
  }
  if (v13)
    __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_cold_1();
LABEL_16:

  v30 = *(void **)(a1 + 96);
  if (v30)
  {
    v31 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_26;
    block[3] = &unk_1E30C6568;
    v34 = v30;
    v33 = v3;
    dispatch_async(v31, block);

  }
  MRAnalyticsTrackTopologyChangeEvent(CFSTR("add"), *(void **)(a1 + 64), *(void **)(a1 + 80), *(_DWORD *)(a1 + 112), *(_QWORD *)(a1 + 104), *(void **)(a1 + 88), *(_BYTE *)(a1 + 116), v3);

}

uint64_t __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "status") != 1)
  {
    objc_msgSend((id)objc_opt_class(), "errorWithChangeResult:outputDevice:", v6, *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  AVOutputDeviceGroup *outputDeviceGroup;
  void *v35;
  MRBlockGuard *v36;
  void *v37;
  id v38;
  MRBlockGuard *v39;
  id v40;
  MRBlockGuard *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void *v47;
  int v48;
  id v49;
  dispatch_queue_t queue;
  id v51;
  BOOL obj;
  id obja;
  void *v54;
  void *v55;
  _QWORD block[4];
  MRBlockGuard *v58;
  id v59;
  _BYTE *v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[6];
  NSObject *v64;
  _BYTE *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[5];
  __CFString *v71;
  id v72;
  id v73;
  id v74;
  dispatch_queue_t v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  int v80;
  BOOL v81;
  uint8_t v82[128];
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  MRAVOutputDeviceArrayDescription(v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVEndpoint debugName](self, "debugName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("devices=%@ from endpoint=%@"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = MRAnalyticsCompositionForEndpoint(self);
  obj = -[MRAVEndpoint isLocalEndpoint](self, "isLocalEndpoint");
  -[MRConcreteEndpoint outputDevices](self, "outputDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("removeOutputDevices:APSync"), v13);
  v22 = v21;
  if (v18)
    objc_msgSend(v21, "appendFormat:", CFSTR(" for %@"), v18);
  v47 = v22;
  _MRLogForCategory(0xAuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v22;
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[AVOutputDeviceGroup outputDevices](self->_outputDeviceGroup, "outputDevices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v24, "initWithFormat:", CFSTR("Existing devices in endpoint %@"), v25);

  _MRLogForCategory(0xAuLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = CFSTR("removeOutputDevices:APSync");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v84 = v46;
    _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v70[3] = &unk_1E30CF308;
  v70[4] = self;
  v71 = CFSTR("removeOutputDevices:APSync");
  v51 = v13;
  v72 = v51;
  v43 = v18;
  v73 = v43;
  v44 = v54;
  v74 = v44;
  v42 = v12;
  v78 = v42;
  queue = (dispatch_queue_t)v11;
  v75 = queue;
  v80 = v48;
  v49 = v10;
  v76 = v49;
  v79 = v20;
  v27 = v9;
  v77 = v27;
  v81 = obj;
  v45 = (void *)MEMORY[0x194036C44](v70);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    getAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v49, v28);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v84 = __Block_byref_object_copy__45;
  v85 = __Block_byref_object_dispose__45;
  v86 = 0;
  v29 = dispatch_group_create();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obja = v27;
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v67 != v31)
          objc_enumerationMutation(obja);
        v33 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        dispatch_group_enter(v29);
        outputDeviceGroup = self->_outputDeviceGroup;
        objc_msgSend(v33, "avOutputDevice");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
        v63[3] = &unk_1E30CF330;
        v65 = buf;
        v63[4] = self;
        v63[5] = v33;
        v64 = v29;
        -[AVOutputDeviceGroup removeOutputDevice:withOptions:completionHandler:](outputDeviceGroup, "removeOutputDevice:withOptions:completionHandler:", v35, v55, v63);

      }
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v30);
  }

  v36 = [MRBlockGuard alloc];
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("removeOutputDevices:APSync"), v51);
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  v61[3] = &unk_1E30C6798;
  v38 = v45;
  v62 = v38;
  v39 = -[MRBlockGuard initWithTimeout:reason:handler:](v36, "initWithTimeout:reason:handler:", v37, v61, 30.0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_4;
  block[3] = &unk_1E30CF358;
  v58 = v39;
  v59 = v38;
  v60 = buf;
  v40 = v38;
  v41 = v39;
  dispatch_group_notify(v29, queue, block);

  _Block_object_dispose(buf, 8);
}

void __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD block[4];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Final devices in endpoint %@"), v5);

  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 56);
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v3)
  {
    v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v19)
        goto LABEL_16;
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      v22 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138544130;
      v36 = v20;
      v37 = 2114;
      v38 = v21;
      v39 = 2114;
      v40 = v22;
      v41 = 2048;
      v42 = v23;
      v24 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v25 = v12;
      v26 = 42;
    }
    else
    {
      if (!v19)
        goto LABEL_16;
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138543874;
      v36 = v27;
      v37 = 2114;
      v38 = v28;
      v39 = 2048;
      v40 = v29;
      v24 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v25 = v12;
      v26 = 32;
    }
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_15;
  }
  v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (!v13)
      goto LABEL_16;
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544386;
    v36 = v14;
    v37 = 2114;
    v38 = v15;
    v39 = 2114;
    v40 = v3;
    v41 = 2114;
    v42 = v16;
    v43 = 2048;
    v44 = v18;
    _os_log_error_impl(&dword_193827000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_15:

    goto LABEL_16;
  }
  if (v13)
    __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_cold_1();
LABEL_16:

  v30 = *(void **)(a1 + 96);
  if (v30)
  {
    v31 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_37;
    block[3] = &unk_1E30C6568;
    v34 = v30;
    v33 = v3;
    dispatch_async(v31, block);

  }
  MRAnalyticsTrackTopologyChangeEvent(CFSTR("remove"), *(void **)(a1 + 64), *(void **)(a1 + 80), *(_DWORD *)(a1 + 112), *(_QWORD *)(a1 + 104), *(void **)(a1 + 88), *(_BYTE *)(a1 + 116), v3);

}

uint64_t __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "status") != 1)
  {
    objc_msgSend((id)objc_opt_class(), "errorWithChangeResult:outputDevice:", v6, *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRAVConcreteEndpoint;
  -[MRAVEndpoint setOutputDevices:initiator:withReplyQueue:completion:](&v6, sel_setOutputDevices_initiator_withReplyQueue_completion_, a3, a4, a5, a6);
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, float);
  void *v25;
  void *v26;
  unsigned __int32 v27;
  unsigned __int32 v28;
  id v29;
  __n128 v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __CFString *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceUID=%@, endpoint=%@"), v8, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("outputDeviceVolume:APSync"), v12);
  v16 = v15;
  if (v13)
    objc_msgSend(v15, "appendFormat:", CFSTR(" for %@"), v13);
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v16;
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke;
  v37[3] = &unk_1E30CF3A8;
  v19 = v10;
  v43 = v19;
  v20 = v9;
  v38 = v20;
  v21 = v13;
  v39 = v21;
  v40 = CFSTR("outputDeviceVolume:APSync");
  v22 = v12;
  v41 = v22;
  v23 = v14;
  v42 = v23;
  v24 = (void (**)(_QWORD, _QWORD, float))MEMORY[0x194036C44](v37);
  if (-[AVOutputDeviceGroup volumeControlType](self->_outputDeviceGroup, "volumeControlType") != 1)
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 36);
    ((void (**)(_QWORD, void *, float))v24)[2](v24, v31, 0.0);

LABEL_13:
    v32 = v33;
    goto LABEL_14;
  }
  if (v8)
  {
    -[MRConcreteEndpoint outputDevices](self, "outputDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_48;
    v35[3] = &unk_1E30C5F68;
    v36 = v33;
    objc_msgSend(v25, "mr_first:", v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v34 = 0;
      -[MRAVConcreteEndpoint volumeForOutputDevice:error:](self, "volumeForOutputDevice:error:", v26, &v34);
      v28 = v27;
      v29 = v34;
      v30.n128_u32[0] = v28;
    }
    else
    {
      v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
      v30.n128_u32[0] = 0;
    }
    ((void (*)(void (**)(_QWORD, _QWORD, float), id, __n128))v24[2])(v24, v29, v30);

    goto LABEL_13;
  }
  -[AVOutputDeviceGroup volume](self->_outputDeviceGroup, "volume");
  ((void (*)(void (**)(_QWORD, _QWORD, float), _QWORD))v24[2])(v24, 0);
  v32 = 0;
LABEL_14:

}

void __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  float v18;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("volume: %f"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 72))
  {
    v7 = *(NSObject **)(a1 + 32);
    v8 = v7;
    if (!v7)
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2;
    block[3] = &unk_1E30CF380;
    v11 = v5;
    v12 = v6;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 72);
    v18 = a3;
    dispatch_async(v8, block);
    if (!v7)

  }
}

uint64_t __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    _MRLogForCategory(0xAuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v11)
      {
        if (!v13)
          goto LABEL_21;
        v14 = *(_QWORD *)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 64);
        v16 = *(_QWORD *)(a1 + 40);
        v17 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
        v34 = 138544386;
        v35 = v14;
        v36 = 2114;
        v37 = v15;
        v38 = 2112;
        v39 = v16;
        v40 = 2114;
        v41 = v17;
        v42 = 2048;
        v43 = v18;
        v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v20 = v3;
        v21 = 52;
LABEL_19:
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v34, v21);
        goto LABEL_20;
      }
      if (!v13)
        goto LABEL_21;
      v26 = *(_QWORD *)(a1 + 56);
      v27 = *(_QWORD *)(a1 + 64);
      v28 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
      v34 = 138544130;
      v35 = v26;
      v36 = 2114;
      v37 = v27;
      v38 = 2112;
      v39 = v28;
      v40 = 2048;
      v41 = v29;
      v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v11)
      {
        if (!v13)
          goto LABEL_21;
        v30 = *(_QWORD *)(a1 + 56);
        v31 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
        v34 = 138543874;
        v35 = v30;
        v36 = 2114;
        v37 = v31;
        v38 = 2048;
        v39 = v32;
        v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v20 = v3;
        v21 = 32;
        goto LABEL_19;
      }
      if (!v13)
        goto LABEL_21;
      v23 = *(_QWORD *)(a1 + 56);
      v22 = *(_QWORD *)(a1 + 64);
      v24 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
      v34 = 138544130;
      v35 = v23;
      v36 = 2114;
      v37 = v22;
      v38 = 2114;
      v39 = v24;
      v40 = 2048;
      v41 = v25;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    v20 = v3;
    v21 = 42;
    goto LABEL_19;
  }
  v2 = *(_QWORD *)(a1 + 48);
  _MRLogForCategory(0xAuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
      v34 = 138544386;
      v35 = v6;
      v36 = 2114;
      v37 = v5;
      v38 = 2114;
      v39 = v7;
      v40 = 2114;
      v41 = v8;
      v42 = 2048;
      v43 = v10;
      _os_log_error_impl(&dword_193827000, v3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v34, 0x34u);
LABEL_20:

    }
  }
  else if (v4)
  {
    __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1();
  }
LABEL_21:

  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 80) + 16))(*(float *)(a1 + 88));
}

uint64_t __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __CFString *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceUID=%@, endpoint=%@"), v8, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("volumeControlCapabilities:APSync"), v12);
  v16 = v15;
  if (v13)
    objc_msgSend(v15, "appendFormat:", CFSTR(" for %@"), v13);
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v16;
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v31 = v16;

  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke;
  v34[3] = &unk_1E30CF3D0;
  v19 = v10;
  v40 = v19;
  v20 = v9;
  v35 = v20;
  v21 = v13;
  v36 = v21;
  v37 = CFSTR("volumeControlCapabilities:APSync");
  v22 = v12;
  v38 = v22;
  v23 = v14;
  v39 = v23;
  v24 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v34);
  if (v8)
  {
    -[MRConcreteEndpoint outputDevices](self, "outputDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_53;
    v32[3] = &unk_1E30C5F68;
    v33 = v8;
    objc_msgSend(v25, "mr_first:", v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v24[2](v24, objc_msgSend(v26, "volumeCapabilities"), 0);
    }
    else
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
      ((void (**)(_QWORD, _QWORD, void *))v24)[2](v24, 0, v30);

    }
    v29 = v31;

  }
  else
  {
    v27 = -[AVOutputDeviceGroup volumeControlType](self->_outputDeviceGroup, "volumeControlType");
    if (v27 == 1)
      v28 = 2;
    else
      v28 = v27 == 2;
    v24[2](v24, v28, 0);
    v29 = v31;
  }

}

void __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;

  v5 = a3;
  v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a2);
  if (*(_QWORD *)(a1 + 72))
  {
    v7 = *(NSObject **)(a1 + 32);
    v8 = v7;
    if (!v7)
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2;
    v10[3] = &unk_1E30CF380;
    v11 = v5;
    v12 = v6;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 72);
    v18 = a2;
    dispatch_async(v8, v10);
    if (!v7)

  }
}

uint64_t __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1[4])
  {
    v12 = a1[5];
    v11 = a1[6];
    _MRLogForCategory(0xAuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v11)
      {
        if (!v13)
          goto LABEL_21;
        v14 = a1[7];
        v15 = a1[8];
        v16 = a1[5];
        v17 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
        v34 = 138544386;
        v35 = v14;
        v36 = 2114;
        v37 = v15;
        v38 = 2112;
        v39 = v16;
        v40 = 2114;
        v41 = v17;
        v42 = 2048;
        v43 = v18;
        v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v20 = v3;
        v21 = 52;
LABEL_19:
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v34, v21);
        goto LABEL_20;
      }
      if (!v13)
        goto LABEL_21;
      v26 = a1[7];
      v27 = a1[8];
      v28 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
      v34 = 138544130;
      v35 = v26;
      v36 = 2114;
      v37 = v27;
      v38 = 2112;
      v39 = v28;
      v40 = 2048;
      v41 = v29;
      v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v11)
      {
        if (!v13)
          goto LABEL_21;
        v30 = a1[7];
        v31 = a1[8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
        v34 = 138543874;
        v35 = v30;
        v36 = 2114;
        v37 = v31;
        v38 = 2048;
        v39 = v32;
        v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v20 = v3;
        v21 = 32;
        goto LABEL_19;
      }
      if (!v13)
        goto LABEL_21;
      v23 = a1[7];
      v22 = a1[8];
      v24 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
      v34 = 138544130;
      v35 = v23;
      v36 = 2114;
      v37 = v22;
      v38 = 2114;
      v39 = v24;
      v40 = 2048;
      v41 = v25;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    v20 = v3;
    v21 = 42;
    goto LABEL_19;
  }
  v2 = a1[6];
  _MRLogForCategory(0xAuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      v6 = a1[7];
      v5 = a1[8];
      v7 = a1[4];
      v8 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
      v34 = 138544386;
      v35 = v6;
      v36 = 2114;
      v37 = v5;
      v38 = 2114;
      v39 = v7;
      v40 = 2114;
      v41 = v8;
      v42 = 2048;
      v43 = v10;
      _os_log_error_impl(&dword_193827000, v3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v34, 0x34u);
LABEL_20:

    }
  }
  else if (v4)
  {
    __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1();
  }
LABEL_21:

  return (*(uint64_t (**)(void))(a1[10] + 16))();
}

uint64_t __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_53(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  AVOutputDeviceGroup **p_outputDeviceGroup;
  double v28;
  id v29;
  void *v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  __CFString *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  __int128 *p_buf;
  const __CFString *v43;
  id v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v31 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MRConcreteEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("volume=%f, deviceUID=%@, endpoint=%@"), a3, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("setOutputDeviceVolume:APSync"), v13);
  v19 = v18;
  if (v16)
    objc_msgSend(v18, "appendFormat:", CFSTR(" for %@"), v16);
  _MRLogForCategory(0xAuLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v19;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (!v10)
  {
    if (-[AVOutputDeviceGroup volumeControlType](self->_outputDeviceGroup, "volumeControlType"))
    {
      p_outputDeviceGroup = &self->_outputDeviceGroup;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setVolume on %@"), self->_outputDeviceGroup);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v28 = a3;
      -[AVOutputDeviceGroup setVolume:](*p_outputDeviceGroup, "setVolume:", v28);
      v26 = 0;
      if (!v11)
        goto LABEL_17;
    }
    else
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 36);
      v24 = 0;
      if (!v11)
        goto LABEL_17;
    }
    goto LABEL_16;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__45;
  v48 = __Block_byref_object_dispose__45;
  v49 = 0;
  -[MRConcreteEndpoint outputDevices](self, "outputDevices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke;
  v40[3] = &unk_1E30CF3F8;
  v22 = v10;
  v41 = v22;
  p_buf = &buf;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v40);

  v23 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v23)
  {
    if (objc_msgSend(v23, "volumeControlType"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setVolume on %@"), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v25 = a3;
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setVolume:", v25);
      v26 = 0;
      goto LABEL_15;
    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 36);
  }
  else
  {
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v43 = CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey");
    v44 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v29, "initWithMRError:userInfo:", 39, v30);

  }
  v24 = 0;
LABEL_15:

  _Block_object_dispose(&buf, 8);
  if (v11)
  {
LABEL_16:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke_2;
    block[3] = &unk_1E30CF420;
    v33 = v26;
    v34 = v24;
    v35 = v16;
    v36 = CFSTR("setOutputDeviceVolume:APSync");
    v37 = v13;
    v38 = v17;
    v39 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_17:

}

void __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "containsUID:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v9, "avOutputDevice");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

uint64_t __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1[4])
  {
    v12 = a1[5];
    v11 = a1[6];
    _MRLogForCategory(0xAuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v11)
      {
        if (!v13)
          goto LABEL_21;
        v14 = a1[7];
        v15 = a1[8];
        v16 = a1[5];
        v17 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
        v34 = 138544386;
        v35 = v14;
        v36 = 2114;
        v37 = v15;
        v38 = 2112;
        v39 = v16;
        v40 = 2114;
        v41 = v17;
        v42 = 2048;
        v43 = v18;
        v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v20 = v3;
        v21 = 52;
LABEL_19:
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v34, v21);
        goto LABEL_20;
      }
      if (!v13)
        goto LABEL_21;
      v26 = a1[7];
      v27 = a1[8];
      v28 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
      v34 = 138544130;
      v35 = v26;
      v36 = 2114;
      v37 = v27;
      v38 = 2112;
      v39 = v28;
      v40 = 2048;
      v41 = v29;
      v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v11)
      {
        if (!v13)
          goto LABEL_21;
        v30 = a1[7];
        v31 = a1[8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
        v34 = 138543874;
        v35 = v30;
        v36 = 2114;
        v37 = v31;
        v38 = 2048;
        v39 = v32;
        v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v20 = v3;
        v21 = 32;
        goto LABEL_19;
      }
      if (!v13)
        goto LABEL_21;
      v23 = a1[7];
      v22 = a1[8];
      v24 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
      v34 = 138544130;
      v35 = v23;
      v36 = 2114;
      v37 = v22;
      v38 = 2114;
      v39 = v24;
      v40 = 2048;
      v41 = v25;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    v20 = v3;
    v21 = 42;
    goto LABEL_19;
  }
  v2 = a1[6];
  _MRLogForCategory(0xAuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      v6 = a1[7];
      v5 = a1[8];
      v7 = a1[4];
      v8 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", a1[9]);
      v34 = 138544386;
      v35 = v6;
      v36 = 2114;
      v37 = v5;
      v38 = 2114;
      v39 = v7;
      v40 = 2114;
      v41 = v8;
      v42 = 2048;
      v43 = v10;
      _os_log_error_impl(&dword_193827000, v3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v34, 0x34u);
LABEL_20:

    }
  }
  else if (v4)
  {
    __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1();
  }
LABEL_21:

  return (*(uint64_t (**)(void))(a1[10] + 16))();
}

- (void)setExternalDevice:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRAVConcreteEndpoint;
  v3 = a3;
  -[MRConcreteEndpoint setExternalDevice:](&v4, sel_setExternalDevice_, v3);
  objc_msgSend(v3, "setWantsVolumeNotifications:", 0, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setWantsOutputDeviceNotifications:", 0);
  objc_msgSend(v3, "setWantsEndpointChangeNotifications:", 0);

}

- (float)volumeForOutputDevice:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  float v7;
  float v8;

  v5 = a3;
  if ((objc_msgSend(v5, "volumeCapabilities") & 2) != 0)
  {
    if ((objc_msgSend(v5, "isVolumeControlAvailable") & 1) != 0)
    {
      objc_msgSend(v5, "volume");
      v8 = v7;
      goto LABEL_8;
    }
    v6 = 37;
  }
  else
  {
    v6 = 36;
  }
  v8 = 0.0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", v6);
LABEL_8:

  return v8;
}

- (void)registerVolumeNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputDeviceGroupVolumeDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleVolumeChangedNotification_, v4, self->_outputDeviceGroup);

  getAVOutputDeviceGroupVolumeControlTypeDidChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleVolumeCapabilityChangedNotification_, v5, self->_outputDeviceGroup);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MRConcreteEndpoint outputDevices](self, "outputDevices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        getAVOutputDeviceVolumeDidChangeNotification_0[0]();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "avOutputDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleVolumeChangedNotification_, v11, v12);

        getAVOutputDeviceCanSetVolumeDidChangeNotification_0[0]();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "avOutputDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleVolumeCapabilityChangedNotification_, v13, v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)handleVolumeChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  MRAVConcreteEndpoint *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  int v20;
  NSObject *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  MRAVConcreteEndpoint *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRConcreteEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputDeviceClass_0[0]();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v8 = (MRAVConcreteEndpoint *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("kMRAVEndpointIdentifierUserInfoKey"));
  if (v8)
  {
    -[MRAVConcreteEndpoint ID](v8, "ID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[MRAVEndpoint volume](v8, "volume");
    objc_msgSend(v11, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("kMRAVEndpointVolumeUserInfoKey"));

    _MRLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v14 = objc_claimAutoreleasedReturnValue();
      -[MRAVEndpoint volume](v8, "volume");
      v20 = 138543874;
      v21 = v14;
      v22 = 2050;
      v23 = v15;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Output device volume updated: %{public}f - %{public}@", (uint8_t *)&v20, 0x20u);

    }
    goto LABEL_9;
  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[AVOutputDeviceGroup volume](self->_outputDeviceGroup, "volume");
  objc_msgSend(v16, "numberWithFloat:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("kMRAVEndpointVolumeUserInfoKey"));

  _MRLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    -[AVOutputDeviceGroup volume](self->_outputDeviceGroup, "volume");
    v20 = 138543874;
    v21 = v13;
    v22 = 2050;
    v23 = v18;
    v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Endpoint volume updated: %{public}f - %{public}@", (uint8_t *)&v20, 0x20u);
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointVolumeDidChangeNotification"), self, v9);

}

- (void)handleVolumeCapabilityChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  MRAVConcreteEndpoint *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  MRAVConcreteEndpoint *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  MRAVConcreteEndpoint *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRConcreteEndpoint uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputDeviceClass_0[0]();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v8 = (MRAVConcreteEndpoint *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("kMRAVEndpointIdentifierUserInfoKey"));
  if (v8)
  {
    -[MRConcreteEndpoint outputDevices](self, "outputDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __66__MRAVConcreteEndpoint_handleVolumeCapabilityChangedNotification___block_invoke;
    v22[3] = &unk_1E30C5F68;
    v23 = v8;
    objc_msgSend(v10, "mr_first:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "volumeCapabilities");
  }
  else
  {
    v13 = -[AVOutputDeviceGroup volumeControlType](self->_outputDeviceGroup, "volumeControlType");
    if (v13 == 1)
      v12 = 2;
    else
      v12 = v13 == 2;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("kMRAVEndpointVolumeControlCapabilitiesUserInfoKey"));

  if (v8)
  {
    -[MRAVConcreteEndpoint ID](v8, "ID");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
    _MRLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v12);
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Device volume capabilities updated: %{public}@ - %{public}@", buf, 0x20u);

    }
  }
  else
  {
    _MRLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v12);
      *(_DWORD *)buf = 138543874;
      v25 = v19;
      v26 = 2114;
      v27 = v20;
      v28 = 2114;
      v29 = self;
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Group volume capabilities updated: %{public}@ - %{public}@", buf, 0x20u);

    }
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification"), self, v9);

}

uint64_t __66__MRAVConcreteEndpoint_handleVolumeCapabilityChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsUID:", v4);

  return v5;
}

+ (id)errorWithChangeResult:(id)a3 outputDevice:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("kMRAVEndpointOutputDeviceIdentifierUserInfoKey"));
  v10 = objc_msgSend(v5, "status");
  switch(v10)
  {
    case 0:
      v14 = CFSTR("Unknown");
LABEL_9:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("kMRAVEndpointTopologyModificationFailureReasonUserInfoKey"));

      break;
    case 2:
      v14 = CFSTR("Failed");
      goto LABEL_9;
    case 3:
      objc_msgSend(v5, "cancellationReason");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("Cancelled");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

      goto LABEL_9;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:userInfo:", 40, v8);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceGroup, 0);
}

void __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2(v1, v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_3();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_7(v1, v2);
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

@end
