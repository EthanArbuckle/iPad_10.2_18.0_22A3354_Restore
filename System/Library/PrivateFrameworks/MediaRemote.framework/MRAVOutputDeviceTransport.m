@implementation MRAVOutputDeviceTransport

- (MRAVOutputDeviceTransport)initWithOutputDevice:(id)a3 groupID:(id)a4 connectionType:(int64_t)a5
{
  id v9;
  id v10;
  MRAVOutputDeviceTransport *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workerQueue;
  uint64_t v15;
  NSString *outputDeviceUID;
  uint64_t v17;
  NSString *groupID;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVOutputDeviceTransport.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

  }
  v21.receiver = self;
  v21.super_class = (Class)MRAVOutputDeviceTransport;
  v11 = -[MRAVOutputDeviceTransport init](&v21, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.mediaremote.externalDeviceTransport/workerQueue", v12);
    workerQueue = v11->_workerQueue;
    v11->_workerQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(v9, "primaryID");
    v15 = objc_claimAutoreleasedReturnValue();
    outputDeviceUID = v11->_outputDeviceUID;
    v11->_outputDeviceUID = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    groupID = v11->_groupID;
    v11->_groupID = (NSString *)v17;

    v11->super._connectionType = a5;
    v11->_useSystemAuthenticationPrompt = 1;
  }

  return v11;
}

- (id)description
{
  MRAVOutputDeviceTransport *v2;
  void *v3;
  uint64_t v4;
  NSString *outputDeviceUID;
  NSString *groupID;
  MRAirPlayTransportConnection *connection;
  void *v8;
  void *v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  outputDeviceUID = v2->_outputDeviceUID;
  groupID = v2->_groupID;
  connection = v2->_connection;
  NSStringFromMRAVEndpointConnectionType(v2->super._connectionType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p OutputDeviceUID=%@ groupID=%@ connection:%@ connectionType=%@>"), v4, v2, outputDeviceUID, groupID, connection, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v9;
}

- (id)debugDescription
{
  MRAVOutputDeviceTransport *v2;
  void *v3;
  uint64_t v4;
  NSString *outputDeviceUID;
  NSString *groupID;
  AVOutputDevice *avOutputDevice;
  void *v8;
  void *v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  outputDeviceUID = v2->_outputDeviceUID;
  groupID = v2->_groupID;
  avOutputDevice = v2->_avOutputDevice;
  NSStringFromMRAVEndpointConnectionType(v2->super._connectionType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v2->_connection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n   OutputDeviceUID=%@\n   groupID=%@\n   AVOutputDevice=%@\n   connectionType=%@\n   connection=%@\n}>"), v4, v2, outputDeviceUID, groupID, avOutputDevice, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v10;
}

- (id)deviceInfo
{
  return 0;
}

- (id)uid
{
  return self->_outputDeviceUID;
}

- (id)name
{
  return (id)-[AVOutputDevice name](self->_avOutputDevice, "name");
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  MRAVOutputDeviceTransport *v2;
  BOOL useSystemAuthenticationPrompt;

  v2 = self;
  objc_sync_enter(v2);
  useSystemAuthenticationPrompt = v2->_useSystemAuthenticationPrompt;
  objc_sync_exit(v2);

  return useSystemAuthenticationPrompt;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  MRAVOutputDeviceTransport *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_useSystemAuthenticationPrompt = a3;
  objc_sync_exit(obj);

}

- (id)error
{
  MRAVOutputDeviceTransport *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *error;
  MRAVOutputDeviceTransport *obj;

  v4 = (NSError *)a3;
  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = v4;

  objc_sync_exit(obj);
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v4;
  MRAVOutputDeviceTransport *v5;
  MRAirPlayTransportConnection *v6;
  _BOOL4 useSystemAuthenticationPrompt;
  void *v8;
  MRAVOutputDeviceTransport *v9;
  uint64_t v10;
  MRAirPlayTransportConnection *connection;
  uint64_t v12;
  NSError *error;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_connection;
  useSystemAuthenticationPrompt = v5->_useSystemAuthenticationPrompt;
  objc_sync_exit(v5);

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "_createConnectionWith:groupID:connectionType:shouldUseSystemAuthenticationPrompt:userInfo:", v5->_outputDeviceUID, v5->_groupID, v5->super._connectionType, useSystemAuthenticationPrompt, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    objc_sync_enter(v9);
    objc_msgSend(v8, "first");
    v10 = objc_claimAutoreleasedReturnValue();
    connection = v5->_connection;
    v5->_connection = (MRAirPlayTransportConnection *)v10;

    objc_msgSend(v8, "second");
    v12 = objc_claimAutoreleasedReturnValue();
    error = v9->_error;
    v9->_error = (NSError *)v12;

    objc_sync_exit(v9);
    objc_msgSend(v8, "first");
    v6 = (MRAirPlayTransportConnection *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)_createConnectionWith:(id)a3 groupID:(id)a4 connectionType:(int64_t)a5 shouldUseSystemAuthenticationPrompt:(BOOL)a6 userInfo:(id)a7
{
  _BOOL4 v8;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MRAVDiscoverySessionHelper *v27;
  NSObject *v28;
  id v29;
  double v30;
  dispatch_time_t v31;
  intptr_t v32;
  id v33;
  MRAirPlayTransportConnection *v34;
  MRAirPlayTransportConnection *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  const __CFString *v41;
  uint64_t v42;
  MRConfigureConnectionMessage *v43;
  void *v44;
  void *v45;
  id v47;
  void *v48;
  id v49;
  id v50;
  __CFString *v51;
  _QWORD v52[4];
  NSObject *v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[5];
  _QWORD v77[7];

  v8 = a6;
  v77[5] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v50 = a4;
  v49 = a7;
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionReasonUserInfoKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("unknown");
  if (v11)
    v13 = (__CFString *)v11;
  v51 = v13;

  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("MRExternalDeviceConnectionCorrelationIDUserInfoKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = dispatch_group_create();
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__2;
  v74 = __Block_byref_object_dispose__2;
  v75 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__2;
  v62 = __Block_byref_object_dispose__2;
  v63 = 0;
  v19 = &getAVOutputDeviceCommunicationChannelControlTypeDirect;
  if (a5 == 3)
    v19 = &getAVOutputDeviceCommunicationChannelControlTypeRelayed;
  ((void (*)(void))*v19)();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v21;
  getAVOutputDeviceCommunicationChannelOptionControlType();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v22;
  v77[1] = v48;
  getAVOutputDeviceCommunicationChannelOptionCorrelationID();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v23;
  v77[2] = v16;
  getAVOutputDeviceCommunicationChannelOptionInitiator();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v24;
  v77[3] = v51;
  getAVOutputDeviceCommunicationChannelOptionUsePerCommChannelDelegate();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v25;
  v77[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v18);
  v27 = -[MRAVDiscoverySessionHelper initWithFeatures:]([MRAVDiscoverySessionHelper alloc], "initWithFeatures:", 8);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke;
  v52[3] = &unk_1E30C6020;
  v55 = &v64;
  v28 = v18;
  v53 = v28;
  v29 = v26;
  v54 = v29;
  v56 = &v70;
  v57 = &v58;
  -[MRAVDiscoverySessionHelper searchAVOutputDeviceForUID:timeout:identifier:reason:completion:](v27, "searchAVOutputDeviceForUID:timeout:identifier:reason:completion:", v47, v16, v51, v52, 5.0);
  if (v8)
    v30 = 60.0;
  else
    v30 = 33.0;
  v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
  v32 = dispatch_group_wait(v28, v31);
  if (!v65[5] && v71[5])
  {
    v34 = [MRAirPlayTransportConnection alloc];
    v35 = -[MRAirPlayTransportConnection initWithOutputDeviceCommunicationChannel:](v34, "initWithOutputDeviceCommunicationChannel:", v71[5]);
    v36 = 0;
    goto LABEL_23;
  }
  if (!v32)
  {
    v37 = (void *)v59[5];
    getAVOutputDeviceCommunicationChannelOpenCancellationReasonAuthorizationSkipped();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = v37 == v38;

    if ((_DWORD)v37)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = CFSTR("Skipped creating remote control communication channel. CancelIfAuthRequired was used");
      v42 = 119;
    }
    else
    {
      v39 = (void *)v65[5];
      if (v39)
      {
        v33 = v39;
        goto LABEL_22;
      }
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = CFSTR("Failed to create remote control communication channel with no underlying error");
      v42 = 100;
    }
    v33 = (id)objc_msgSend(v40, "initWithMRError:description:", v42, v41);
    goto LABEL_22;
  }
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 26, CFSTR("Timed out after <%lf> waiting to open remote control communication channel"), *(_QWORD *)&v30);
LABEL_22:
  v36 = v33;
  v35 = 0;
LABEL_23:
  if (v50)
  {
    v43 = -[MRConfigureConnectionMessage initWithGroupID:]([MRConfigureConnectionMessage alloc], "initWithGroupID:", v50);
    -[MRProtocolMessage protobufData](v43, "protobufData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAirPlayTransportConnection sendTransportData:options:](v35, "sendTransportData:options:", v44, 0);

  }
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0B8]), "initWithFirst:second:", v35, v36);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  return v45;
}

void __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = v6;
    if (!v6)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 39);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
    if (!v7)

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke_2;
    v10[3] = &unk_1E30C5FF8;
    v12 = *(_OWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v5, "openCommunicationChannelWithOptions:completionHandler:", v8, v10);

  }
}

void __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v18 = v8;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;
  v14 = v7;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)resetWithError:(id)a3
{
  id v4;
  NSObject *workerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRAVOutputDeviceTransport_resetWithError___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workerQueue, block);

}

void __44__MRAVOutputDeviceTransport_resetWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "closeWithError:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

}

- (BOOL)requiresCustomPairing
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avOutputDevice, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end
