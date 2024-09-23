@implementation MRAVOutputContextModification

- (MRAVOutputContextModification)initWithRequest:(id)a3
{
  id v5;
  MRAVOutputContextModification *v6;
  MRAVOutputContextModification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVOutputContextModification;
  v6 = -[MRAVOutputContextModification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_request, CFSTR("request"));
}

- (MRAVOutputContextModification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRAVOutputContextModification *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MRAVOutputContextModification initWithRequest:](self, "initWithRequest:", v5);
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MRAVOutputContextModification (%@) discovered=%@"), self->_request, self->_discoveredConcreteOutputDevices);
}

- (id)discoveredOutputDeviceUIDs
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "discoveredConcreteOutputDevices");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "msv_map:", &__block_literal_global_25);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __59__MRAVOutputContextModification_discoveredOutputDeviceUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  qos_class_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  qos_class_t v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRGroupTopologyModificationRequest requestDetails](self->_request, "requestDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = qos_class_self();
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("modifyOutputContext"), v13);
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v15;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v31 = (void *)v15;

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke;
  v38[3] = &unk_1E30C81C8;
  v42 = v14;
  v17 = v13;
  v39 = v17;
  v18 = v11;
  v40 = v18;
  v19 = v10;
  v41 = v19;
  v20 = (void *)MEMORY[0x194036C44](v38);
  if ((MRProcessIsMediaRemoteDaemon() & 1) != 0)
  {
    objc_msgSend(v8, "outputDevices");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_2;
    v32[3] = &unk_1E30C81F0;
    v34 = v20;
    v32[4] = self;
    v33 = v18;
    v35 = v22;
    v23 = v20;
    -[MRAVOutputContextModification _modifyWithOutputContext:queue:completion:]((uint64_t)self, v8, v9, v32);

    v24 = v34;
  }
  else
  {
    MRCreateXPCMessage(0x300000000000028uLL);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    MSVArchivedDataWithRootObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MRAddDataToXPCMessage(v23, v24, "MRXPC_CONTEXT_MODIFICATION_DATA_KEY");
    objc_msgSend(v8, "uniqueIdentifier");
    v30 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MRAddStringToXPCMessage(v23, v25, "MRXPC_ROUTING_CONTEXT_UID_KEY");

    MRAddStringToXPCMessage(v23, v17, "MRXPC_MESSAGE_CUSTOM_ID_KEY");
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "service");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mrXPCConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_26;
    v36[3] = &unk_1E30C6C80;
    v37 = v20;
    v29 = v20;
    objc_msgSend(v28, "sendMessage:queue:reply:", v23, v9, v36);

    v8 = v30;
  }

}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qos_class_self();
  if (*(_DWORD *)(a1 + 56) != (_DWORD)v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("priority degraded from %u -> %u"), *(unsigned int *)(a1 + 56), v4);
    _MRLogForCategory(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v15 = CFSTR("modifyOutputContext");
      v16 = 2114;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

  }
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 138543874;
    v15 = CFSTR("modifyOutputContext");
    v16 = 2114;
    v17 = v10;
    v18 = 2048;
    v19 = v12;
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)MRCreateClientErrorFromXPCMessage(a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  -[MRAVOutputContextModification trackModificationWithStartDate:initialGroupSize:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), v5);

}

- (void)trackModificationWithStartDate:(uint64_t)a3 initialGroupSize:(void *)a4 error:
{
  id v7;
  uint64_t v8;
  __CFString **v9;
  __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a4;
  if (a1)
  {
    v8 = objc_msgSend(a1[1], "type");
    v9 = kMRTopologyModificationTypeAdd;
    switch(v8)
    {
      case 0:
        goto LABEL_8;
      case 1:
        goto LABEL_6;
      case 2:
        v9 = kMRTopologyModificationTypeRemove;
        goto LABEL_6;
      case 3:
        v9 = kMRTopologyModificationTypeSet;
LABEL_6:
        v10 = *v9;
        break;
      default:
        v10 = 0;
        break;
    }
    objc_msgSend(a1[1], "requestDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MRAnalyticsCompositionForLocalDevice();
    objc_msgSend(a1, "discoveredConcreteOutputDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MRAnalyticsTrackTopologyChangeEvent(v10, v15, v12, v13, a3, v14, 1, v7);

  }
LABEL_8:

}

- (void)_modifyWithOutputContext:(void *)a3 queue:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  MRAVLightweightReconnaissanceSession *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  qos_class_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if ((MRProcessIsMediaRemoteDaemon() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__modifyWithOutputContext_queue_completion_, a1, CFSTR("MRAVOutputContextModification.m"), 211, CFSTR("Attempting to make topology modification from client process"));

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDiscoveryMode:", 3);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke;
    v33[3] = &unk_1E30C8260;
    v12 = v10;
    v34 = v12;
    v35 = a1;
    v39 = v9;
    v36 = v7;
    v37 = v8;
    v38 = v11;
    v28 = v11;
    v13 = (void *)MEMORY[0x194036C44](v33);
    v14 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    objc_msgSend(*(id *)(a1 + 8), "outputDeviceUIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = &stru_1E30D5AF8;
    getAVAudioSessionCategoryPlayback_0();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v15;
    getAVAudioSessionCategoryPlayAndRecord();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v29 = v9;
    v27 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestID");
    v19 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = qos_class_self();
    dispatch_get_global_queue(v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_3;
    v30[3] = &unk_1E30C8288;
    v31 = v12;
    v32 = v13;
    v23 = v13;
    v26 = v12;
    -[MRAVLightweightReconnaissanceSession searchForOutputDevices:categories:timeout:reason:queue:completion:](v14, "searchForOutputDevices:categories:timeout:reason:queue:completion:", v25, v17, v20, v22, v30, 7.0);

    v8 = v19;
    v7 = v27;
    v9 = v29;

  }
}

void __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  MRAVOutputContextModification *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count")
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "outputDeviceUIDs"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "count"),
        v21,
        !v22))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "type") == 1
      && (objc_msgSend(*(id *)(a1 + 32), "mr_filter:", &__block_literal_global_42),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v3 = objc_msgSend(v2, "count"),
          v2,
          v3))
    {
      v29 = -[MRAVOutputContextModification initWithRequest:]([MRAVOutputContextModification alloc], "initWithRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      +[MRAVConcreteOutputContext sharedSystemAudioContext](MRAVConcreteOutputContext, "sharedSystemAudioContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVOutputContextModification modifyWithOutputContext:queue:completion:](v29, "modifyWithOutputContext:queue:completion:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

    }
    else
    {
      -[MRAVOutputContextModification _notifyDidBeginModifyOutputContext:](*(id **)(a1 + 40), *(void **)(a1 + 48));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));
      v5 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v36;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v36 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v11), "avOutputDevice");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v9);
      }

      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(v13 + 24);
      *(_QWORD *)(v13 + 24) = v6;

      v15 = *(id **)(a1 + 40);
      v16 = *(void **)(a1 + 48);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_2;
      v30[3] = &unk_1E30C8238;
      v17 = *(void **)(a1 + 56);
      v31 = *(id *)(a1 + 64);
      v18 = *(id *)(a1 + 72);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(void **)(a1 + 48);
      v34 = v18;
      v32 = v19;
      v33 = v20;
      -[MRAVOutputContextModification performModificationWithOutputContext:queue:completion:](v15, v16, v17, v30);

    }
  }
  else
  {
    _MRLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_cold_1((uint64_t *)(a1 + 40), v23);

    v24 = *(_QWORD *)(a1 + 72);
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "outputDeviceUIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithMRError:format:", 47, CFSTR("Failed to discover all output devices involved in modification: discovered=%@ vs requested=%@"), v26, v27);
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v28);

  }
}

BOOL __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "deviceType") == 4 && objc_msgSend(v2, "deviceSubtype") == 4;

  return v3;
}

- (void)_notifyDidBeginModifyOutputContext:(id *)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0C99E08];
    v4 = a2;
    objc_msgSend(v3, "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("kMRAVOutputContextIdentifierUserInfoKey"));

    objc_msgSend(v4, "outputDeviceUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey"));

    -[MRAVOutputContextModification discoveredOutputDeviceUIDs](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1[1], "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("kMRAVOutputContextModificationTypeUserInfoKey"));

    objc_msgSend(a1[1], "requestDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("MRAVOutputContextModificationInitiatorUserInfoKey"));

    objc_msgSend(a1[1], "requestDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("MRAVOutputContextModificationIdentifierUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextDidBeginModificationNotification"), v4, v14);

  }
}

void __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setDiscoveryMode:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  -[MRAVOutputContextModification _notifyDidEndModifyOutputContext:error:](*(id **)(a1 + 40), *(void **)(a1 + 48), v4);

}

- (void)_notifyDidEndModifyOutputContext:(void *)a3 error:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a1)
  {
    v5 = (void *)MEMORY[0x1E0C99E08];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "dictionary");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, CFSTR("kMRAVOutputContextIdentifierUserInfoKey"));

    objc_msgSend(v7, "outputDeviceUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey"));

    -[MRAVOutputContextModification discoveredOutputDeviceUIDs](a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1[1], "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, CFSTR("kMRAVOutputContextModificationTypeUserInfoKey"));

    objc_msgSend(a1[1], "requestDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("MRAVOutputContextModificationInitiatorUserInfoKey"));

    objc_msgSend(a1[1], "requestDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("MRAVOutputContextModificationIdentifierUserInfoKey"));

    objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, CFSTR("kMRAVOutputContextModificationErrorUserInfoKey"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextDidFinishModificationNotification"), v7, v17);

  }
}

- (void)performModificationWithOutputContext:(void *)a3 queue:(void *)a4 completion:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  MRBlockGuard *v29;
  void *v30;
  id v31;
  MRBlockGuard *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  int v40;
  int v41;
  id v42;
  const __CFString *v43;
  void *v44;
  void *ErrorWithDescription;
  id v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  char v61;
  id v62;
  void *v63;
  void *v64;
  MRAVOutputContextModification *v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD *v76;
  void (**v77)(_QWORD, _QWORD);
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void (**v89)(_QWORD, _QWORD);
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t k;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void (**v125)(_QWORD, _QWORD);
  void *v126;
  id v127;
  id v128;
  id v129;
  MRBlockGuard *v130;
  id v131;
  __CFString *v132;
  void *v133;
  __SecTask *v134;
  id v135;
  void (**v136)(_QWORD, _QWORD);
  void *v137;
  id v138;
  void *v139;
  dispatch_queue_t queue;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  id *v147;
  _QWORD v148[6];
  _QWORD v149[6];
  _QWORD v150[5];
  id v151;
  _QWORD v152[4];
  void (**v153)(_QWORD, _QWORD);
  _BYTE *v154;
  _QWORD v155[5];
  NSObject *v156;
  _BYTE *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD block[4];
  void (**v163)(_QWORD, _QWORD);
  _BYTE *v164;
  _QWORD v165[5];
  NSObject *v166;
  _BYTE *v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[4];
  id v177;
  id *v178;
  id v179;
  NSObject *v180;
  void (**v181)(_QWORD, _QWORD);
  _QWORD v182[4];
  void (**v183)(_QWORD, _QWORD);
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[4];
  MRBlockGuard *v189;
  id v190;
  _QWORD v191[4];
  id v192;
  id v193;
  _QWORD v194[4];
  id v195;
  id v196;
  id v197;
  id v198;
  id *v199;
  id v200;
  id v201;
  dispatch_queue_t v202;
  id v203;
  _BYTE v204[128];
  uint8_t v205[128];
  _BYTE buf[24];
  const __CFString *v207;
  void (*v208)(uint64_t);
  id v209;
  _BYTE v210[128];
  _BYTE v211[128];
  _QWORD v212[4];

  v212[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  queue = a3;
  v135 = a4;
  v147 = a1;
  v139 = v7;
  if (a1)
  {
    objc_msgSend(v7, "avOutputContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "handleFailureInMethod:object:file:lineNumber:description:", sel_performModificationWithOutputContext_queue_completion_, a1, CFSTR("MRAVOutputContextModification.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avOutputContext"));

    }
    if (!queue)
    {
      queue = (dispatch_queue_t)MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[1], "requestDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    MRGroupTopologyModificationRequestTypeDescription(objc_msgSend(v147[1], "type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@OutputDevices"), v14);

    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    MRAVOutputDeviceArrayDescription(v147[2]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("devices=%@ , outputContext=%@"), v17, v139);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v15, v12);
    v20 = v19;
    if (v18)
      objc_msgSend(v19, "appendFormat:", CFSTR(" for %@"), v18);
    v133 = v20;
    _MRLogForCategory(0xAuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v133;
      _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "outputDevices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = (__CFString *)objc_msgSend(v22, "initWithFormat:", CFSTR("Existing devices in context %@"), v23);

    _MRLogForCategory(0xAuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v207 = v132;
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v194[0] = MEMORY[0x1E0C809B0];
    v194[1] = 3221225472;
    v194[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke;
    v194[3] = &unk_1E30C8370;
    v146 = v8;
    v195 = v146;
    v25 = v15;
    v196 = v25;
    v138 = v12;
    v197 = v138;
    v26 = v139;
    v198 = v26;
    v199 = v147;
    v129 = v18;
    v200 = v129;
    v127 = v10;
    v201 = v127;
    v203 = v135;
    queue = queue;
    v202 = queue;
    v27 = (void *)MEMORY[0x194036C44](v194);
    v212[0] = CFSTR("com.apple.avfoundation.allows-set-output-device");
    v134 = MRMediaRemoteCopyEntitlements((const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 1));
    -[__SecTask objectForKeyedSubscript:](v134, "objectForKeyedSubscript:", CFSTR("com.apple.avfoundation.allows-set-output-device"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v137 || (objc_msgSend(v137, "BOOLValue") & 1) == 0)
    {
      _MRLogForCategory(0xAuLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v138;
        *(_WORD *)&buf[22] = 2112;
        v207 = CFSTR("Missing entitlement needed to modify output context. Operation will likley not work");
        _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

    }
    v29 = [MRBlockGuard alloc];
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), v25, v138);
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_87;
    v191[3] = &unk_1E30C75E8;
    v131 = v25;
    v192 = v131;
    v31 = v27;
    v193 = v31;
    v32 = -[MRBlockGuard initWithTimeout:reason:handler:](v29, "initWithTimeout:reason:handler:", v30, v191, 60.0);

    v188[0] = MEMORY[0x1E0C809B0];
    v188[1] = 3221225472;
    v188[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2;
    v188[3] = &unk_1E30C75E8;
    v130 = v32;
    v189 = v130;
    v128 = v31;
    v190 = v128;
    v136 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v188);
    if (objc_msgSend(v147[1], "type") == 3)
    {
      objc_msgSend(v147[1], "outputDeviceUIDs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count") == 0;

      if (v34)
      {
        v46 = (id)MRMediaRemoteCopyLocalAirPlayReceiverTightSyncIdentity();
        v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v186 = 0u;
        v187 = 0u;
        v184 = 0u;
        v185 = 0u;
        objc_msgSend(v26, "outputDevices");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v185;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v185 != v57)
                objc_enumerationMutation(v55);
              v59 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * i);
              if ((objc_msgSend(v59, "isLocalDevice") & 1) == 0)
              {
                objc_msgSend(v59, "uid");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = objc_msgSend(v60, "isEqualToString:", v46);

                if ((v61 & 1) == 0)
                  objc_msgSend(v54, "addObject:", v59);
              }
            }
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
          }
          while (v56);
        }

        if (objc_msgSend(v54, "count"))
        {
          v62 = v147[1];
          objc_msgSend(v54, "msv_compactMap:", &__block_literal_global_91_0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)objc_msgSend(v62, "copyWithType:outputDeviceUIDs:", 2, v63);

          v65 = -[MRAVOutputContextModification initWithRequest:]([MRAVOutputContextModification alloc], "initWithRequest:", v64);
          _MRLogForCategory(0xAuLL);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v131;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v138;
            *(_WORD *)&buf[22] = 2112;
            v207 = CFSTR("instead of setting nil devices removing all non local devices...");
            _os_log_impl(&dword_193827000, v66, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          v182[0] = MEMORY[0x1E0C809B0];
          v182[1] = 3221225472;
          v182[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_94;
          v182[3] = &unk_1E30C6798;
          v183 = v136;
          -[MRAVOutputContextModification _modifyWithOutputContext:queue:completion:](v65, v26, queue, v182);

        }
        else
        {
          _MRLogForCategory(0xAuLL);
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v131;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v138;
            *(_WORD *)&buf[22] = 2112;
            v207 = CFSTR("instead of setting nil devices removing all non local devices, but only local devices remain so nothing to do...");
            _os_log_impl(&dword_193827000, v79, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          v136[2](v136, 0);
        }

        goto LABEL_76;
      }
    }
    if (objc_msgSend(v147[1], "type") == 2 && (objc_msgSend(v147[1], "shouldNotPauseIfLastDeviceRemoved") & 1) == 0)
    {
      +[MROrigin localOrigin](MROrigin, "localOrigin");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v176[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_99;
      v176[3] = &unk_1E30C83C0;
      v181 = v136;
      v177 = v26;
      v178 = v147;
      v179 = v138;
      v180 = queue;
      +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:](MRDeviceInfoRequest, "deviceInfoForOrigin:queue:completion:", v53, v180, v176);

      v46 = v181;
      goto LABEL_76;
    }
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v35 = v147[3];
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v172, v210, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v173;
      while (2)
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v173 != v37)
            objc_enumerationMutation(v35);
          v39 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * j);
          if ((objc_msgSend(v39, "canBeGrouped") & 1) == 0 && (objc_msgSend(v39, "supportsBluetoothSharing") & 1) == 0)
          {
            if (objc_msgSend(v147[1], "type") == 1)
            {
              v41 = objc_msgSend(v39, "canBeGrouped");
              v42 = objc_alloc(MEMORY[0x1E0CB3940]);
              if (v41)
                v43 = CFSTR("device %@ does not support bluetooth sharing");
              else
                v43 = CFSTR("device %@ is not groupable");
              v44 = (void *)objc_msgSend(v42, "initWithFormat:", v43, v39);
              ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(33, (uint64_t)v44);

              ((void (**)(_QWORD, void *))v136)[2](v136, ErrorWithDescription);
            }
            v40 = 0;
            goto LABEL_37;
          }
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v172, v210, 16);
        if (v36)
          continue;
        break;
      }
    }
    v40 = 1;
LABEL_37:

    -[MRAVOutputContextModification _sendPreviewNotificationsForOutputContext:](v147, v26);
    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v147[1], "data");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, v49);

    if ((((unint64_t)objc_msgSend(v147[3], "count") > 1) & ~v40) == 0)
    {
      if ((unint64_t)objc_msgSend(v147[3], "count") >= 2
        && !objc_msgSend(v146, "supportsMultipleOutputDevices"))
      {
        v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Output context modification failed. Output context doesn't support multiple devices"));
        v144 = (void *)MRMediaRemoteCreateErrorWithDescription(34, (uint64_t)v78);

        ((void (**)(_QWORD, void *))v136)[2](v136, v144);
        goto LABEL_76;
      }
      if (objc_msgSend(v146, "supportsMultipleOutputDevices"))
      {
        objc_msgSend(v147[1], "password");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50 == 0;

        if (!v51)
        {
          v141 = (void *)MRMediaRemoteCreateErrorWithDescription(6, (uint64_t)CFSTR("output contexts that support multiple devices do not yet support passwords"));
          ((void (**)(_QWORD, void *))v136)[2](v136, v141);

LABEL_76:
          goto LABEL_77;
        }
        v90 = objc_msgSend(v147[1], "type");
        switch(v90)
        {
          case 3:
            v145 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            getAVOutputContextAddOutputDeviceOptionInitiator();
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setObject:forKeyedSubscript:", v138, v117);

            getAVOutputContextRemoveOutputDeviceOptionInitiator();
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setObject:forKeyedSubscript:", v138, v118);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "fadeAudio"));
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            getAVOutputContextSetOutputDevicesOptionFadePlayback();
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setObject:forKeyedSubscript:", v119, v120);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "muteUntilFinished"));
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            getAVOutputContextSetOutputDevicesOptionMuteUntilContextModificationIsFinished();
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setObject:forKeyedSubscript:", v121, v122);

            getAVOutputContextSetOutputDevicesOptionDidFailToConnectToOutputDeviceUserInfo();
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setObject:forKeyedSubscript:", v46, v123);

            v124 = v147[3];
            v150[0] = MEMORY[0x1E0C809B0];
            v150[1] = 3221225472;
            v150[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_6;
            v150[3] = &unk_1E30C8438;
            v125 = v136;
            v150[4] = v147;
            v151 = v125;
            objc_msgSend(v146, "setOutputDevices:options:completionHandler:", v124, v145, v150);

            goto LABEL_76;
          case 2:
            v143 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            getAVOutputContextAddOutputDeviceOptionInitiator();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v138, v103);

            getAVOutputContextRemoveOutputDeviceOptionInitiator();
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v138, v104);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "fadeAudio"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            getAVOutputContextRemoveOutputDeviceOptionFadePlayback();
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v105, v106);

            objc_msgSend(v147[1], "requestDetails");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "reason");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v106) = objc_msgSend(v108, "containsString:", CFSTR("proximity"));

            if ((_DWORD)v106)
            {
              getAVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved();
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v109);

            }
            getAVOutputContextRemoveOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo();
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v46, v110);

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v207 = (const __CFString *)__Block_byref_object_copy__8;
            v208 = __Block_byref_object_dispose__8;
            v209 = 0;
            v111 = dispatch_group_create();
            v158 = 0u;
            v159 = 0u;
            v160 = 0u;
            v161 = 0u;
            v112 = (void *)objc_msgSend(v147[3], "copy");
            v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v158, v204, 16);
            if (v113)
            {
              v114 = *(_QWORD *)v159;
              do
              {
                for (k = 0; k != v113; ++k)
                {
                  if (*(_QWORD *)v159 != v114)
                    objc_enumerationMutation(v112);
                  v116 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * k);
                  dispatch_group_enter(v111);
                  v155[0] = MEMORY[0x1E0C809B0];
                  v155[1] = 3221225472;
                  v155[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_4;
                  v155[3] = &unk_1E30C83E8;
                  v157 = buf;
                  v155[4] = v147;
                  v156 = v111;
                  objc_msgSend(v146, "removeOutputDevice:options:completionHandler:", v116, v143, v155);

                }
                v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v158, v204, 16);
              }
              while (v113);
            }

            v152[0] = MEMORY[0x1E0C809B0];
            v152[1] = 3221225472;
            v152[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_5;
            v152[3] = &unk_1E30C8410;
            v153 = v136;
            v154 = buf;
            dispatch_group_notify(v111, queue, v152);

            _Block_object_dispose(buf, 8);
            break;
          case 1:
            v143 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            getAVOutputContextAddOutputDeviceOptionInitiator();
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v138, v91);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "fadeAudio"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            getAVOutputContextAddOutputDeviceOptionFadePlayback();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v92, v93);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "muteUntilFinished"));
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            getAVOutputContextAddOutputDeviceOptionMuteUntilContextModificationIsFinished();
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v94, v95);

            getAVOutputContextAddOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo();
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v46, v96);

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v207 = (const __CFString *)__Block_byref_object_copy__8;
            v208 = __Block_byref_object_dispose__8;
            v209 = 0;
            v97 = dispatch_group_create();
            v168 = 0u;
            v169 = 0u;
            v170 = 0u;
            v171 = 0u;
            v98 = (void *)objc_msgSend(v147[3], "copy");
            v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v168, v205, 16);
            if (v99)
            {
              v100 = *(_QWORD *)v169;
              do
              {
                for (m = 0; m != v99; ++m)
                {
                  if (*(_QWORD *)v169 != v100)
                    objc_enumerationMutation(v98);
                  v102 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * m);
                  dispatch_group_enter(v97);
                  v165[0] = MEMORY[0x1E0C809B0];
                  v165[1] = 3221225472;
                  v165[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2_118;
                  v165[3] = &unk_1E30C83E8;
                  v167 = buf;
                  v165[4] = v147;
                  v166 = v97;
                  objc_msgSend(v146, "addOutputDevice:options:completionHandler:", v102, v143, v165);

                }
                v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v168, v205, 16);
              }
              while (v99);
            }

            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_3_120;
            block[3] = &unk_1E30C8410;
            v163 = v136;
            v164 = buf;
            dispatch_group_notify(v97, queue, block);

            _Block_object_dispose(buf, 8);
            break;
          default:
            goto LABEL_76;
        }
      }
      else
      {
        _MRLogForCategory(0xAuLL);
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v131;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v138;
          *(_WORD *)&buf[22] = 2112;
          v207 = CFSTR("outputContext does not support mutiple devices");
          _os_log_impl(&dword_193827000, v67, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        v143 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v68 = objc_msgSend(v147[1], "type");
        v69 = v147[1];
        if (v68 == 2)
        {
          if (objc_msgSend(v69, "shouldNotPauseIfLastDeviceRemoved"))
          {
            getAVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved();
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              getAVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v71);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "fadeAudio"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          getAVOutputContextRemoveOutputDeviceOptionFadePlayback();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "setObject:forKeyedSubscript:", v72, v73);

          getAVOutputContextRemoveOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo();
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "setObject:forKeyedSubscript:", v46, v74);

          objc_msgSend(v147[3], "firstObject");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v149[0] = MEMORY[0x1E0C809B0];
          v149[1] = 3221225472;
          v149[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_125;
          v149[3] = &unk_1E30C8438;
          v76 = v149;
          v77 = v136;
          v149[4] = v147;
          v149[5] = v77;
          objc_msgSend(v146, "removeOutputDevice:options:completionHandler:", v75, v143, v149);
        }
        else
        {
          objc_msgSend(v69, "password");
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v80)
          {
            objc_msgSend(v147[1], "password");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            getAVOutputContextSetOutputDevicePasswordKey();
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", v81, v82);

            getAVOutputContextSetOutputDeviceCancelIfAuthRequiredKey();
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v83);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "fadeAudio"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          getAVOutputContextSetOutputDeviceFadePlaybackKey();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "setObject:forKeyedSubscript:", v84, v85);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v147[1], "muteUntilFinished"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          getAVOutputContextSetOutputDeviceMuteUntilContextModificationIsFinishedKey();
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "setObject:forKeyedSubscript:", v86, v87);

          getAVOutputContextSetOutputDeviceDidFailToConnectToOutputDeviceUserInfoKey();
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "setObject:forKeyedSubscript:", v46, v88);

          objc_msgSend(v147[3], "firstObject");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v148[0] = MEMORY[0x1E0C809B0];
          v148[1] = 3221225472;
          v148[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2_126;
          v148[3] = &unk_1E30C8438;
          v76 = v148;
          v89 = v136;
          v148[4] = v147;
          v148[5] = v89;
          objc_msgSend(v146, "setOutputDevice:options:completionHandler:", v75, v143, v148);
        }

      }
      goto LABEL_76;
    }
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Output context modification failed. Attempted to group multiple devices where at least one is not groupable"));
    v142 = (void *)MRMediaRemoteCreateErrorWithDescription(33, (uint64_t)v52);

    ((void (**)(_QWORD, void *))v136)[2](v136, v142);
    goto LABEL_76;
  }
LABEL_77:

}

void __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)waitForOutputContextModificationVerification:(void *)a3 initiator:(void *)a4 completion:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  MRBlockGuard *v17;
  void *v18;
  id v19;
  id v20;
  MRBlockGuard *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int (**v25)(_QWORD);
  MRBlockGuard *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  MRBlockGuard *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v31 = a3;
  v30 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("waitForOutputContextModificationVerification"), v31);
    objc_msgSend(v32, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v32, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR(" for %@"), v10);

    }
    _MRLogForCategory(0xAuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__8;
    v52 = __Block_byref_object_dispose__8;
    v12 = MEMORY[0x1E0C809B0];
    v53 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke;
    v43[3] = &unk_1E30C82B0;
    p_buf = &buf;
    v13 = v32;
    v44 = v13;
    v14 = v31;
    v45 = v14;
    v15 = v7;
    v46 = v15;
    v47 = v30;
    v16 = (void *)MEMORY[0x194036C44](v43);
    v17 = [MRBlockGuard alloc];
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("waitForOutputContextModificationVerification<%@>"), v14);
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_57;
    v39[3] = &unk_1E30C6878;
    v19 = v13;
    v40 = v19;
    v41 = v14;
    v20 = v16;
    v42 = v20;
    v21 = -[MRBlockGuard initWithTimeout:reason:handler:](v17, "initWithTimeout:reason:handler:", v18, v39, 7.0);

    v37[0] = v12;
    v37[1] = 3221225472;
    v37[2] = __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_60;
    v37[3] = &unk_1E30C82F8;
    v22 = v19;
    v38 = v22;
    v23 = (void *)MEMORY[0x194036C44](v37);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v12;
    v33[1] = 3221225472;
    v33[2] = __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_4;
    v33[3] = &unk_1E30C8320;
    v25 = v23;
    v35 = v25;
    v26 = v21;
    v34 = v26;
    v27 = v20;
    v36 = v27;
    objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", CFSTR("MRAVOutputContextOutputDevicesDidChangeNotification"), v22, 0, v33);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v28;

    if (v25[2](v25) && -[MSVBlockGuard disarm](v26, "disarm"))
      (*((void (**)(id, _QWORD))v27 + 2))(v27, 0);

    _Block_object_dispose(&buf, 8);
  }

}

void __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v3)
  {
    v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (!v15)
        goto LABEL_16;
      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v21 = 138543874;
      v22 = CFSTR("waitForOutputContextModificationVerification");
      v23 = 2114;
      v24 = v18;
      v25 = 2048;
      v26 = v19;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", (uint8_t *)&v21, 0x20u);
      goto LABEL_15;
    }
    if (!v15)
      goto LABEL_16;
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v21 = 138544130;
    v22 = CFSTR("waitForOutputContextModificationVerification");
    v23 = 2114;
    v24 = v16;
    v25 = 2114;
    v26 = v12;
    v27 = 2048;
    v28 = v17;
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", (uint8_t *)&v21, 0x2Au);
LABEL_10:

LABEL_15:
    goto LABEL_16;
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v10)
      goto LABEL_16;
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v21 = 138544386;
    v22 = CFSTR("waitForOutputContextModificationVerification");
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    v29 = 2048;
    v30 = v14;
    _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v21, 0x34u);
    goto LABEL_10;
  }
  if (v10)
    __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_cold_1();
LABEL_16:

  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v3);

}

uint64_t __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_57(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "outputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "avOutputContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Timed out waiting for verification %@ vs %@"), v4, v6);

    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = CFSTR("waitForOutputContextModificationVerification");
      v13 = 2114;
      v14 = v9;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_60(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "concreteOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_compactMap:", &__block_literal_global_62);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithArray:", v4);

  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "avOutputContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "msv_compactMap:", &__block_literal_global_64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithArray:", v9);

  v11 = objc_msgSend(v5, "isEqualToSet:", v10);
  return v11;
}

id __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "avOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ID");
}

uint64_t __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "disarm");
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Final devices in context %@"), v5);

  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "_reloadOutputDevices");
  v10 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_81;
  v14[3] = &unk_1E30C8348;
  v15 = v10;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = v3;
  v19 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  v22 = *(id *)(a1 + 96);
  v21 = *(id *)(a1 + 88);
  v13 = v3;
  -[MRAVOutputContextModification waitForOutputContextModificationVerification:initiator:completion:](v11, v15, v12, v14);

}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _QWORD block[4];
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Final devices in context %@"), v5);

  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v38 = v8;
    v39 = 2114;
    v40 = v9;
    v41 = 2112;
    v42 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v10 = *(void **)(a1 + 56);
  if (!v10)
    v10 = v3;
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 64);
  _MRLogForCategory(0xAuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v11)
  {
    v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (!v21)
        goto LABEL_18;
      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(_QWORD *)(a1 + 48);
      v24 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
      *(_DWORD *)buf = 138544130;
      v38 = v22;
      v39 = 2114;
      v40 = v23;
      v41 = 2114;
      v42 = v24;
      v43 = 2048;
      v44 = v25;
      v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v27 = v14;
      v28 = 42;
    }
    else
    {
      if (!v21)
        goto LABEL_18;
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
      *(_DWORD *)buf = 138543874;
      v38 = v29;
      v39 = 2114;
      v40 = v30;
      v41 = 2048;
      v42 = v31;
      v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v27 = v14;
      v28 = 32;
    }
    _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_17;
  }
  v15 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (!v15)
      goto LABEL_18;
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 72));
    *(_DWORD *)buf = 138544386;
    v38 = v16;
    v39 = 2114;
    v40 = v17;
    v41 = 2114;
    v42 = v11;
    v43 = 2114;
    v44 = v18;
    v45 = 2048;
    v46 = v20;
    _os_log_error_impl(&dword_193827000, v14, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

    goto LABEL_18;
  }
  if (v15)
    __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_81_cold_1();
LABEL_18:

  v32 = *(void **)(a1 + 88);
  if (v32)
  {
    v33 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_82;
    block[3] = &unk_1E30C6568;
    v36 = v32;
    v35 = v11;
    dispatch_async(v33, block);

  }
}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (objc_msgSend(v3, "code") == 26)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 125, CFSTR("%@OutputContextModification timedout after %lf seconds"), *(_QWORD *)(a1 + 32), 0x404E000000000000);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_99(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  MRAVOutputContextModification *v21;
  void *v22;
  qos_class_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  MRAVOutputContextModification *v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "outputDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v40;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "outputDeviceUIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "containsObject:", v14);

          v10 &= v15;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v8);
      v16 = v10 ^ 1;
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v5, "deviceUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    v19 = objc_msgSend(v5, "isProxyGroupPlayer");
    v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "copy");
    objc_msgSend(v20, "setShouldNotPauseIfLastDeviceRemoved:", 1);
    v21 = -[MRAVOutputContextModification initWithRequest:]([MRAVOutputContextModification alloc], "initWithRequest:", v20);
    if ((v16 & 1) == 0 && v18 && v19)
    {
      v49 = CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier");
      v50 = CFSTR("No devices on output context");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = qos_class_self();
      dispatch_get_global_queue(v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _MRLogForCategory(0xAuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v44 = v20;
        v45 = 2114;
        v46 = v26;
        v47 = 2112;
        v48 = CFSTR("pausing now playing app before removing last output device...");
        _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      +[MROrigin localOrigin](MROrigin, "localOrigin");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_105;
      v34[3] = &unk_1E30C8398;
      v35 = v21;
      v36 = *(id *)(a1 + 32);
      v37 = *(id *)(a1 + 56);
      v38 = *(id *)(a1 + 64);
      MRMediaRemoteSendCommandForOriginWithReply((uint64_t)v27, 1, v22, v24, v34);

    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v44 = v20;
        v45 = 2114;
        v46 = v29;
        v47 = 2112;
        v48 = CFSTR("removing last output device...");
        _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v30 = *(_QWORD *)(a1 + 32);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_110;
      v32[3] = &unk_1E30C6798;
      v31 = *(_QWORD *)(a1 + 56);
      v33 = *(id *)(a1 + 64);
      -[MRAVOutputContextModification _modifyWithOutputContext:queue:completion:](v21, v30, v31, v32);
      v22 = v33;
    }

  }
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_105(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2_106;
  v4[3] = &unk_1E30C6798;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  -[MRAVOutputContextModification _modifyWithOutputContext:queue:completion:](v1, v2, v3, v4);

}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2_106(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendPreviewNotificationsForOutputContext:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  id v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  void *v37;
  _QWORD v38[4];
  void *v39;
  _QWORD v40[4];
  id v41;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v35 = v3;
    v5 = objc_msgSend(a1[1], "type") | 2;
    v6 = MEMORY[0x1E0C809B0];
    if (v5 == 3)
    {
      objc_msgSend(a1, "discoveredConcreteOutputDevices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVOutputContextModification _notifyRequestToAddDevices:toOutputContext:]((uint64_t)a1, v7, v35);

      v8 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v35, "outputDeviceUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(a1, "discoveredConcreteOutputDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "minusSet:", v10);
      objc_msgSend(a1, "discoveredConcreteOutputDevices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v6;
      v40[1] = 3221225472;
      v40[2] = __75__MRAVOutputContextModification__sendPreviewNotificationsForOutputContext___block_invoke;
      v40[3] = &unk_1E30C8460;
      v41 = v13;
      v15 = v13;
      objc_msgSend(v14, "msv_filter:", v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
        -[MRAVOutputContextModification _notifyWillAddDevices:toOutputContext:]((uint64_t)a1, v16, v35);

    }
    v17 = objc_msgSend(a1[1], "type");
    if (v17 == 3)
    {
      v29 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v35, "outputDeviceUIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithArray:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0C99E20];
      -[MRAVOutputContextModification discoveredOutputDeviceUIDs](a1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "minusSet:", v21);
      objc_msgSend(v35, "outputDevices");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v6;
      v36[1] = 3221225472;
      v36[2] = __75__MRAVOutputContextModification__sendPreviewNotificationsForOutputContext___block_invoke_3;
      v36[3] = &unk_1E30C5F68;
      v26 = &v37;
      v37 = v31;
      v27 = v31;
      v28 = v36;
    }
    else
    {
      v4 = v35;
      if (v17 != 2)
        goto LABEL_13;
      objc_msgSend(a1, "discoveredConcreteOutputDevices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAVOutputContextModification _notifyRequestToRemoveDevices:fromOutputContext:]((uint64_t)a1, v18, v35);

      v19 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v35, "outputDeviceUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0C99E20];
      -[MRAVOutputContextModification discoveredOutputDeviceUIDs](a1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "intersectSet:", v21);
      objc_msgSend(a1, "discoveredConcreteOutputDevices");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v6;
      v38[1] = 3221225472;
      v38[2] = __75__MRAVOutputContextModification__sendPreviewNotificationsForOutputContext___block_invoke_2;
      v38[3] = &unk_1E30C8460;
      v26 = &v39;
      v39 = v24;
      v27 = v24;
      v28 = v38;
    }
    objc_msgSend(v25, "msv_filter:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "count"))
      -[MRAVOutputContextModification _notifyWillRemoveDevices:fromOutputContext:]((uint64_t)a1, v34, v35);

    v4 = v35;
  }
LABEL_13:

}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2_118(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[MRAVOutputContextModification errorFromResult:](*(void **)(a1 + 32), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)errorFromResult:(void *)Error
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = v3;
  if (Error)
  {
    v5 = objc_msgSend(v3, "status");
    if (v5 < 2 || v5 == 3)
    {
      objc_msgSend(Error, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 28;
    }
    else
    {
      if (v5 != 4)
      {
        Error = 0;
        goto LABEL_11;
      }
      objc_msgSend(v4, "cancellationReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        Error = (void *)MRMediaRemoteCreateError(101);
        goto LABEL_11;
      }
      objc_msgSend(v4, "cancellationReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 101;
    }
    Error = (void *)MRMediaRemoteCreateErrorWithDescription(v8, (uint64_t)v7);

  }
LABEL_11:

  return Error;
}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_3_120(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[MRAVOutputContextModification errorFromResult:](*(void **)(a1 + 32), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[MRAVOutputContextModification errorFromResult:](*(void **)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[MRAVOutputContextModification errorFromResult:](*(void **)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_2_126(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[MRAVOutputContextModification errorFromResult:](*(void **)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)_notifyRequestToAddDevices:(void *)a3 toOutputContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kMRAVOutputContextIdentifierUserInfoKey"));

    objc_msgSend(v6, "outputDeviceUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_133);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 8), "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("kMRAVOutputContextModificationTypeUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("MRAVOutputContextModificationInitiatorUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("MRAVOutputContextModificationIdentifierUserInfoKey"));

    objc_msgSend(v5, "msv_map:", &__block_literal_global_134);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Request to add outputDevices %@ to context %@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationRequestToAddOutputDeviceNotification"), v6, v7);

    objc_msgSend(v5, "msv_firstWhere:", &__block_literal_global_136);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      _MRLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "debugName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v21;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Will add localDevice %@ to context %@", (uint8_t *)&v23, 0x16u);

      }
      if (((objc_msgSend(v19, "clusterType") - 1) & 0xFFFFFFFD) == 0)
        MRMediaRemoteSetClusterLeader();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationRequestToAddLocalDeviceNotification"), v6, v7);

    }
  }

}

uint64_t __75__MRAVOutputContextModification__sendPreviewNotificationsForOutputContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)_notifyWillAddDevices:(void *)a3 toOutputContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kMRAVOutputContextIdentifierUserInfoKey"));

    objc_msgSend(v6, "outputDeviceUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_137);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 8), "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("kMRAVOutputContextModificationTypeUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("MRAVOutputContextModificationInitiatorUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("MRAVOutputContextModificationIdentifierUserInfoKey"));

    objc_msgSend(v5, "msv_map:", &__block_literal_global_138);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Will add outputDevices %@ to context %@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationWillAddOutputDeviceNotification"), v6, v7);

    objc_msgSend(v5, "msv_firstWhere:", &__block_literal_global_140);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      _MRLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "debugName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v21;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Will add localDevice %@ to context %@", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationWillAddLocalDeviceNotification"), v6, v7);

    }
  }

}

- (void)_notifyRequestToRemoveDevices:(void *)a3 fromOutputContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kMRAVOutputContextIdentifierUserInfoKey"));

    objc_msgSend(v6, "outputDeviceUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_141);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 8), "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("kMRAVOutputContextModificationTypeUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("MRAVOutputContextModificationInitiatorUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("MRAVOutputContextModificationIdentifierUserInfoKey"));

    objc_msgSend(v5, "msv_map:", &__block_literal_global_142);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Request to remove outputDevices %@ from context %@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationRequestToRemoveLocalDeviceNotification"), v6, v7);

    objc_msgSend(v5, "msv_firstWhere:", &__block_literal_global_144_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      _MRLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "debugName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v21;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Request to remove localDevice %@ from context %@", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationRequestToRemoveLocalDeviceNotification"), v6, v7);

    }
  }

}

uint64_t __75__MRAVOutputContextModification__sendPreviewNotificationsForOutputContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)_notifyWillRemoveDevices:(void *)a3 fromOutputContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kMRAVOutputContextIdentifierUserInfoKey"));

    objc_msgSend(v6, "outputDeviceUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("MRAVOutputContextExistingOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_145);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("MRAVOutputContextModificationOutputDeviceIdentifiersUserInfoKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 8), "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("kMRAVOutputContextModificationTypeUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("MRAVOutputContextModificationInitiatorUserInfoKey"));

    objc_msgSend(*(id *)(a1 + 8), "requestDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("MRAVOutputContextModificationIdentifierUserInfoKey"));

    objc_msgSend(v5, "msv_map:", &__block_literal_global_146);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Will remove outputDevices %@ from context %@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationWillRemoveOutputDeviceNotification"), v6, v7);

    objc_msgSend(v5, "msv_firstWhere:", &__block_literal_global_148);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      _MRLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "debugName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v21;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[OutputContextModification] Will remove localDevice %@ from context %@", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextModificationWillRemoveLocalDeviceNotification"), v6, v7);

    }
  }

}

uint64_t __75__MRAVOutputContextModification__sendPreviewNotificationsForOutputContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __76__MRAVOutputContextModification__notifyRequestToAddDevices_toOutputContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

uint64_t __76__MRAVOutputContextModification__notifyRequestToAddDevices_toOutputContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugName");
}

uint64_t __76__MRAVOutputContextModification__notifyRequestToAddDevices_toOutputContext___block_invoke_135(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

uint64_t __71__MRAVOutputContextModification__notifyWillAddDevices_toOutputContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

uint64_t __71__MRAVOutputContextModification__notifyWillAddDevices_toOutputContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugName");
}

uint64_t __71__MRAVOutputContextModification__notifyWillAddDevices_toOutputContext___block_invoke_139(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

uint64_t __81__MRAVOutputContextModification__notifyRequestToRemoveDevices_fromOutputContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

uint64_t __81__MRAVOutputContextModification__notifyRequestToRemoveDevices_fromOutputContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugName");
}

uint64_t __81__MRAVOutputContextModification__notifyRequestToRemoveDevices_fromOutputContext___block_invoke_143(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

uint64_t __76__MRAVOutputContextModification__notifyWillRemoveDevices_fromOutputContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

uint64_t __76__MRAVOutputContextModification__notifyWillRemoveDevices_fromOutputContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugName");
}

uint64_t __76__MRAVOutputContextModification__notifyWillRemoveDevices_fromOutputContext___block_invoke_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

- (MRGroupTopologyModificationRequest)request
{
  return self->_request;
}

- (NSArray)discoveredConcreteOutputDevices
{
  return self->_discoveredConcreteOutputDevices;
}

- (NSArray)avOutputDevices
{
  return self->_avOutputDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avOutputDevices, 0);
  objc_storeStrong((id *)&self->_discoveredConcreteOutputDevices, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __74__MRAVOutputContextModification_modifyWithOutputContext_queue_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_193827000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

void __75__MRAVOutputContextModification__modifyWithOutputContext_queue_completion___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[OutputContextModification] Failed to discover all output devices involved in modification: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __99__MRAVOutputContextModification_waitForOutputContextModificationVerification_initiator_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_193827000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

void __87__MRAVOutputContextModification_performModificationWithOutputContext_queue_completion___block_invoke_81_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", *(_QWORD *)(v0 + 72));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_193827000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

@end
