@implementation BLTRemoteGizmoClient

- (BLTRemoteGizmoClient)init
{
  BLTRemoteGizmoClient *v2;
  BLTRemoteGizmoClient *v3;
  __objc2_class *v4;
  BLTBulletinSendQueuePassthrough *v5;
  BLTBulletinSendQueuePassthrough *bulletinSendQueue;
  void *v7;

  v2 = -[BLTRemoteObject initWithServiceName:idsQueueName:](self, "initWithServiceName:idsQueueName:", CFSTR("com.apple.private.alloy.bulletindistributor"), "com.apple.bulletindistributor.ids");
  v3 = v2;
  if (v2)
  {
    -[BLTRemoteObject setPairedDeviceReady:](v2, "setPairedDeviceReady:", 0);
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsFileBulletinAdd"))
      v4 = BLTBulletinSendQueue;
    else
      v4 = BLTBulletinSendQueuePassthrough;
    v5 = (BLTBulletinSendQueuePassthrough *)objc_alloc_init(v4);
    bulletinSendQueue = v3->_bulletinSendQueue;
    v3->_bulletinSendQueue = v5;

    -[BLTBulletinSendQueuePassthrough setDelegate:](v3->_bulletinSendQueue, "setDelegate:", v3);
    -[BLTRemoteGizmoClient _pingPairedDevice](v3, "_pingPairedDevice");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__handleSyncStateChanged_, CFSTR("BLTPairedSyncStateChanged"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BLTRemoteGizmoClient;
  -[BLTRemoteObject dealloc](&v4, sel_dealloc);
}

- (void)registerProtobufHandlers
{
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAcknowledgeActionRequest_, 5);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSnoozeActionRequest_, 6);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleDismissActionRequest_, 8);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSupplementaryActionRequest_, 7);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleLaunchSessionActionRequest_, 26);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleDidPlayLightsAndSirensReply_, 9);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleRemoveBulletinRequest_, 10);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleShouldSuppressLightsAndSirensNowRequest_, 16);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleHandlePairedDeviceReady_, 17);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleWillSendLightsAndSirensRequest_, 18);
}

- (void)_handleSyncStateChanged:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "becameTrafficUnrestricted:", v4);

  if (v6)
    -[BLTBulletinSendQueuePassthrough sendNow](self->_bulletinSendQueue, "sendNow");
}

- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4
{
  -[BLTRemoteGizmoClient addBulletin:playLightsAndSirens:updateType:withTimeout:completion:](self, "addBulletin:playLightsAndSirens:updateType:withTimeout:completion:", a3, a4, 0, 0, 0);
}

- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 updateType:(unint64_t)a5 transmissionDate:(id)a6 receptionDate:(id)a7
{
  -[BLTRemoteGizmoClient addBulletin:playLightsAndSirens:updateType:withTimeout:completion:](self, "addBulletin:playLightsAndSirens:updateType:withTimeout:completion:", a3, a4, 0, 0, 0);
}

- (void)addBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 updateType:(unint64_t)a5 withTimeout:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  const char *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  BLTPBAddBulletinRequest *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  BLTPBIntelligentSummaryBulletinRequest *v49;
  NSObject *v50;
  void *v51;
  _BOOL4 v52;
  _BOOL4 v53;
  unsigned int v54;
  id v55;
  BLTRemoteGizmoClient *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  uint8_t buf[4];
  _BYTE v61[10];
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v53 = a4;
  v72 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v55 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v15 = v14;

  v56 = self;
  v16 = -[BLTRemoteObject connectionStatus](self, "connectionStatus");
  v17 = v16 - 1;
  if (v16 == 1)
  {
    +[BLTPairedSyncCoordinator syncState](BLTPairedSyncCoordinator, "syncState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isTrafficRestricted");

  }
  else
  {
    v19 = 0;
  }
  blt_ids_log();
  v20 = objc_claimAutoreleasedReturnValue();
  v57 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v52 = v17 < 2;
    v21 = v16 - 1;
    v22 = v19;
    v23 = objc_msgSend(v11, "hasSummary");
    v24 = objc_msgSend(v11, "hasThreadSummary");
    v25 = BLTIDSConnectionStatusString(v16);
    objc_msgSend(v11, "publisherMatchID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionID");
    v27 = a5;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v61 = v23;
    v19 = v22;
    v17 = v21;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v24;
    v62 = 2080;
    v63 = v25;
    v64 = 1024;
    v65 = v19;
    v66 = 1024;
    v67 = v52;
    v12 = v57;
    v68 = 2112;
    v69 = v26;
    v70 = 2112;
    v71 = v28;
    _os_log_impl(&dword_2173D9000, v20, OS_LOG_TYPE_DEFAULT, "addBulletin hasSummary=%{BOOL}u hasThreadSummary=%{BOOL}u connectionStatus=%s isTrafficRestricted=%{BOOL}u watchNearby=%{BOOL}u matchID=%@ sectionID=%@", buf, 0x38u);

    a5 = v27;
  }

  if ((objc_msgSend(v11, "hasSummary") & 1) != 0)
  {
    if (v17 < 2)
      v29 = 1;
    else
      v29 = v19;
    if ((v29 & 1) != 0)
    {
      v30 = 0;
      v31 = 0;
      goto LABEL_15;
    }
LABEL_14:
    v30 = objc_msgSend(v11, "copy");
    objc_msgSend(v11, "setSummary:", 0);
    objc_msgSend(v11, "setThreadSummary:", 0);
    v31 = 1;
    goto LABEL_15;
  }
  v32 = objc_msgSend(v11, "hasThreadSummary");
  v31 = 0;
  v30 = 0;
  if (v17 >= 2 && ((v32 ^ 1 | v19) & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v33 = (void *)v30;
  objc_msgSend(v11, "sectionID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  v36 = v35 ^ 1u;
  if (v17 < 2 || ((v35 ^ 1) & 1) != 0)
  {
    v39 = v19;
    v37 = objc_alloc_init(BLTPBAddBulletinRequest);
    -[BLTPBAddBulletinRequest setBulletin:](v37, "setBulletin:", v11);
    -[BLTPBAddBulletinRequest setShouldPlayLightsAndSirens:](v37, "setShouldPlayLightsAndSirens:", v53);
    -[BLTPBAddBulletinRequest setDate:](v37, "setDate:", v15);
    -[BLTPBAddBulletinRequest setUpdateType:](v37, "setUpdateType:", a5);
    v54 = v39;
    -[BLTPBAddBulletinRequest setTrafficRestricted:](v37, "setTrafficRestricted:", v39);
    objc_msgSend(v11, "universalSectionID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40)
    {
      objc_msgSend(v11, "sectionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[BLTPBAddBulletinRequest data](v37, "data");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "length");
    objc_msgSend(v11, "publisherMatchID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    BLTAnalyticsLogBulletinSize(v41, v43, v44);

    if (!v40)
    kdebug_trace();
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __90__BLTRemoteGizmoClient_addBulletin_playLightsAndSirens_updateType_withTimeout_completion___block_invoke;
    v58[3] = &unk_24D762330;
    v12 = v57;
    v45 = v57;
    v59 = v45;
    v46 = (void *)MEMORY[0x219A0C15C](v58);
    v38 = v55;
    if (v45)
      v47 = v46;
    else
      v47 = 0;
    -[BLTBulletinSendQueuePassthrough sendRequest:withTimeout:isTrafficRestricted:didSend:](v56->_bulletinSendQueue, "sendRequest:withTimeout:isTrafficRestricted:didSend:", v37, v55, v54, v47);

  }
  else
  {
    blt_ids_log();
    v37 = (BLTPBAddBulletinRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v37->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2173D9000, &v37->super.super.super, OS_LOG_TYPE_DEFAULT, "skipping add bulletin request for messages, it is not needed due to direct push to watch", buf, 2u);
    }
    v38 = v55;
  }
  v48 = v33;

  if (v31)
  {
    v49 = objc_alloc_init(BLTPBIntelligentSummaryBulletinRequest);
    -[BLTPBIntelligentSummaryBulletinRequest setBulletin:](v49, "setBulletin:", v48);
    -[BLTPBIntelligentSummaryBulletinRequest setUpdateType:](v49, "setUpdateType:", v36);
    blt_ids_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      -[PBCodable redact](v49, "redact");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v61 = v51;
      _os_log_impl(&dword_2173D9000, v50, OS_LOG_TYPE_DEFAULT, "sending intelligent summary request %@", buf, 0xCu);

    }
    -[BLTBulletinSendQueuePassthrough sendRequest:withTimeout:didSend:](v56->_bulletinSendQueue, "sendRequest:withTimeout:didSend:", v49, &unk_24D7865F0, 0);

  }
}

uint64_t __90__BLTRemoteGizmoClient_addBulletin_playLightsAndSirens_updateType_withTimeout_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addBulletinSummary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setBulletin:", v4);

  -[BLTRemoteObject sendRequest:type:](self, "sendRequest:type:", v5, 3);
}

- (void)cancelBulletinWithPublisherMatchID:(id)a3 universalSectionID:(id)a4 feed:(unint64_t)a5 transmissionDate:(id)a6 receptionDate:(id)a7
{
  -[BLTRemoteGizmoClient cancelBulletinWithPublisherMatchID:universalSectionID:feed:withTimeout:](self, "cancelBulletinWithPublisherMatchID:universalSectionID:feed:withTimeout:", a3, a4, a5, 0, a7);
}

- (void)cancelBulletinWithPublisherMatchID:(id)a3 universalSectionID:(id)a4 feed:(unint64_t)a5 withTimeout:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BLTPBCancelBulletinRequest *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v14 = objc_alloc_init(BLTPBCancelBulletinRequest);
  -[BLTPBCancelBulletinRequest setPublisherMatchID:](v14, "setPublisherMatchID:", v12);

  -[BLTPBCancelBulletinRequest setUniversalSectionID:](v14, "setUniversalSectionID:", v11);
  -[BLTPBCancelBulletinRequest setFeed:](v14, "setFeed:", a5);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  -[BLTPBCancelBulletinRequest setDate:](v14, "setDate:");

  -[BLTRemoteObject sendRequest:type:withTimeout:didSend:](self, "sendRequest:type:withTimeout:didSend:", v14, 4, v10, 0);
}

- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5
{
  -[BLTRemoteGizmoClient removeBulletinWithPublisherBulletinID:recordID:sectionID:withTimeout:](self, "removeBulletinWithPublisherBulletinID:recordID:sectionID:withTimeout:", a3, a4, a5, 0);
}

- (void)removeBulletinWithPublisherBulletinID:(id)a3 recordID:(id)a4 sectionID:(id)a5 withTimeout:(id)a6
{
  BLTBulletinSendQueuePassthrough *bulletinSendQueue;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BLTPBRemoveBulletinRequest *v16;

  bulletinSendQueue = self->_bulletinSendQueue;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[BLTBulletinSendQueuePassthrough sendNow](bulletinSendQueue, "sendNow");
  v16 = objc_alloc_init(BLTPBRemoveBulletinRequest);
  -[BLTPBRemoveBulletinRequest setPublisherBulletinID:](v16, "setPublisherBulletinID:", v14);

  -[BLTPBRemoveBulletinRequest setRecordID:](v16, "setRecordID:", v13);
  -[BLTPBRemoveBulletinRequest setSectionID:](v16, "setSectionID:", v12);

  +[BLTRemoteRequest remoteRequestWithProtobuf:type:](BLTRemoteRequest, "remoteRequestWithProtobuf:type:", v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeout:", v11);

  objc_msgSend(v15, "setNonWaking:", 1);
  -[BLTRemoteObject sendRequest:](self, "sendRequest:", v15);

}

- (void)updateBulletinList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BLTPBUpdateBulletinListRequest *v9;

  v4 = a3;
  v9 = objc_alloc_init(BLTPBUpdateBulletinListRequest);
  -[BLTPBUpdateBulletinListRequest setBulletinList:](v9, "setBulletinList:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[BLTPBUpdateBulletinListRequest bulletinList](v9, "bulletinList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionBulletinLists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("BLTPBUpdateBulletinListRequest %lu sections"), objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteObject sendRequest:type:withTimeout:withDescription:didSend:](self, "sendRequest:type:withTimeout:withDescription:didSend:", v9, 15, 0, v8, 0);

}

- (void)setLastKnownConnectionStatus:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLTRemoteGizmoClient;
  -[BLTRemoteObject setLastKnownConnectionStatus:](&v5, sel_setLastKnownConnectionStatus_);
  if (a3 == 1)
    -[BLTRemoteGizmoClient _pingPairedDevice](self, "_pingPairedDevice");
  else
    -[BLTRemoteObject setPairedDeviceReady:](self, "setPairedDeviceReady:", 0);
}

- (void)_pingPairedDevice
{
  -[BLTRemoteGizmoClient _pingPairedDeviceWithRetry:](self, "_pingPairedDeviceWithRetry:", 0);
}

- (void)_pingPairedDeviceWithRetry:(unint64_t)a3
{
  BLTPBHandlePairedDeviceReady *v5;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  if (a3 <= 2
    && BLTIsDebugOrInternalBuild()
    && -[BLTRemoteObject lastKnownConnectionStatus](self, "lastKnownConnectionStatus") == 1)
  {
    v5 = objc_alloc_init(BLTPBHandlePairedDeviceReady);
    objc_initWeak(&location, self);
    +[BLTRemoteRequest remoteRequestWithProtobuf:type:](BLTRemoteRequest, "remoteRequestWithProtobuf:type:", v5, 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowCloudDelivery:", 0);
    objc_msgSend(v6, "setUniqueID:", CFSTR("pingRequest"));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__BLTRemoteGizmoClient__pingPairedDeviceWithRetry___block_invoke;
    v7[3] = &unk_24D762358;
    objc_copyWeak(v8, &location);
    v8[1] = (id)a3;
    objc_msgSend(v6, "setDidSend:", v7);
    -[BLTRemoteObject sendRequest:](self, "sendRequest:", v6);
    objc_destroyWeak(v8);

    objc_destroyWeak(&location);
  }
}

void __51__BLTRemoteGizmoClient__pingPairedDeviceWithRetry___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_pingPairedDeviceWithRetry:", *(_QWORD *)(a1 + 40) + 1);

  }
}

- (void)handleAcknowledgeActionRequest:(id)a3
{
  id v4;
  BLTPBHandleAcknowledgeActionRequest *v5;
  void *v6;
  BLTPBHandleAcknowledgeActionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BLTActionInfo *v17;
  void *v18;
  BLTPBHandleAcknowledgeActionRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  BLTRemoteGizmoClient *v23;
  void *v24;
  void *v25;
  BLTActionInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  BLTPBHandleAcknowledgeActionRequest *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandleAcknowledgeActionRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandleAcknowledgeActionRequest initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v32 = "-[BLTRemoteGizmoClient handleAcknowledgeActionRequest:]";
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTPBHandleAcknowledgeActionRequest sectionID](v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleAcknowledgeActionRequest publisherBulletinID](v7, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBHandleAcknowledgeActionRequest recordID](v7, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v13);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  v29 = (void *)v12;

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "phoneSectionIDForGizmoKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [BLTActionInfo alloc];
  -[BLTPBHandleAcknowledgeActionRequest recordID](v7, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleAcknowledgeActionRequest actionInfo](v7, "actionInfo");
  v19 = v7;
  v30 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleAcknowledgeActionRequest actionInfo](v19, "actionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contextNulls");
  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromPBData(v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[BLTActionInfo initWithActionType:publisherBulletinID:recordID:sectionID:context:](v17, "initWithActionType:publisherBulletinID:recordID:sectionID:context:", 3, v28, v18, v16, v25);

  -[BLTRemoteGizmoClient server](v23, "server");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleAction:", v26);

}

- (void)handleSnoozeActionRequest:(id)a3
{
  id v4;
  BLTPBHandleSnoozeActionRequest *v5;
  void *v6;
  BLTPBHandleSnoozeActionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BLTActionInfo *v17;
  void *v18;
  BLTPBHandleSnoozeActionRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  BLTRemoteGizmoClient *v23;
  void *v24;
  void *v25;
  BLTActionInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  BLTPBHandleSnoozeActionRequest *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandleSnoozeActionRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandleSnoozeActionRequest initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v32 = "-[BLTRemoteGizmoClient handleSnoozeActionRequest:]";
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTPBHandleSnoozeActionRequest sectionID](v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSnoozeActionRequest publisherBulletinID](v7, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBHandleSnoozeActionRequest recordID](v7, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v13);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  v29 = (void *)v12;

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "phoneSectionIDForGizmoKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [BLTActionInfo alloc];
  -[BLTPBHandleSnoozeActionRequest recordID](v7, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSnoozeActionRequest actionInfo](v7, "actionInfo");
  v19 = v7;
  v30 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSnoozeActionRequest actionInfo](v19, "actionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contextNulls");
  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromPBData(v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[BLTActionInfo initWithActionType:publisherBulletinID:recordID:sectionID:context:](v17, "initWithActionType:publisherBulletinID:recordID:sectionID:context:", 6, v28, v18, v16, v25);

  -[BLTRemoteGizmoClient server](v23, "server");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleAction:", v26);

}

- (void)handleDismissActionRequest:(id)a3
{
  id v4;
  BLTPBHandleDismissActionRequest *v5;
  void *v6;
  BLTPBHandleDismissActionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BLTActionInfo *v17;
  void *v18;
  BLTPBHandleDismissActionRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  BLTRemoteGizmoClient *v23;
  void *v24;
  void *v25;
  BLTActionInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  BLTPBHandleDismissActionRequest *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandleDismissActionRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandleDismissActionRequest initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v32 = "-[BLTRemoteGizmoClient handleDismissActionRequest:]";
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTPBHandleDismissActionRequest sectionID](v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDismissActionRequest publisherBulletinID](v7, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBHandleDismissActionRequest recordID](v7, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v13);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  v29 = (void *)v12;

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "phoneSectionIDForGizmoKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [BLTActionInfo alloc];
  -[BLTPBHandleDismissActionRequest recordID](v7, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDismissActionRequest actionInfo](v7, "actionInfo");
  v19 = v7;
  v30 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDismissActionRequest actionInfo](v19, "actionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contextNulls");
  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromPBData(v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[BLTActionInfo initWithActionType:publisherBulletinID:recordID:sectionID:context:](v17, "initWithActionType:publisherBulletinID:recordID:sectionID:context:", 8, v28, v18, v16, v25);

  -[BLTRemoteGizmoClient server](v23, "server");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleAction:", v26);

}

- (void)handleSupplementaryActionRequest:(id)a3
{
  id v4;
  BLTPBHandleSupplementaryActionRequest *v5;
  void *v6;
  BLTPBHandleSupplementaryActionRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BLTSupplementaryActionInfo *v17;
  void *v18;
  BLTPBHandleSupplementaryActionRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  BLTRemoteGizmoClient *v23;
  void *v24;
  void *v25;
  BLTSupplementaryActionInfo *v26;
  void *v27;
  void *v28;
  BLTPBHandleSupplementaryActionRequest *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandleSupplementaryActionRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandleSupplementaryActionRequest initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[BLTRemoteGizmoClient handleSupplementaryActionRequest:]";
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTPBHandleSupplementaryActionRequest sectionID](v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSupplementaryActionRequest publisherBulletinID](v7, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBHandleSupplementaryActionRequest recordID](v7, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v13);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  v31 = (void *)v12;

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "phoneSectionIDForGizmoKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [BLTSupplementaryActionInfo alloc];
  -[BLTPBHandleSupplementaryActionRequest recordID](v7, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSupplementaryActionRequest actionInfo](v7, "actionInfo");
  v19 = v7;
  v29 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSupplementaryActionRequest actionInfo](v19, "actionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contextNulls");
  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromPBData(v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[BLTActionInfo initWithActionType:publisherBulletinID:recordID:sectionID:context:](v17, "initWithActionType:publisherBulletinID:recordID:sectionID:context:", 7, v30, v18, v16, v25);

  -[BLTPBHandleSupplementaryActionRequest identifier](v29, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSupplementaryActionInfo setIdentifier:](v26, "setIdentifier:", v27);

  -[BLTRemoteGizmoClient server](v23, "server");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleAction:", v26);

}

- (void)handleLaunchSessionActionRequest:(id)a3
{
  id v4;
  BLTPBHandleLaunchSessionActionRequest *v5;
  void *v6;
  BLTPBHandleLaunchSessionActionRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BLTActionInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BLTActionInfo *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  BLTRemoteGizmoClient *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  BLTActionInfo *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandleLaunchSessionActionRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandleLaunchSessionActionRequest initWithData:](v5, "initWithData:", v6);
  -[BLTPBHandleLaunchSessionActionRequest sectionID](v7, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleLaunchSessionActionRequest publisherBulletinID](v7, "publisherBulletinID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBHandleLaunchSessionActionRequest recordID](v7, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v8, v11);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "phonePublisherBulletinIDForGizmoKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v10;
  objc_msgSend(v14, "phoneSectionIDForGizmoKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [BLTActionInfo alloc];
  -[BLTPBHandleLaunchSessionActionRequest recordID](v7, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleLaunchSessionActionRequest actionInfo](v7, "actionInfo");
  v28 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleLaunchSessionActionRequest actionInfo](v7, "actionInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contextNulls");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromPBData(v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[BLTActionInfo initWithActionType:publisherBulletinID:recordID:sectionID:context:](v16, "initWithActionType:publisherBulletinID:recordID:sectionID:context:", 11, v13, v17, v15, v22);

  blt_ids_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTRemoteGizmoClient server](v28, "server");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v25;
    v32 = 2112;
    v33 = v23;
    v34 = 2112;
    v35 = v26;
    _os_log_impl(&dword_2173D9000, v24, OS_LOG_TYPE_DEFAULT, "handleLaunchSessionActionRequest: Received request: %@ generated actionInfo: %@ sending to: %@", buf, 0x20u);

  }
  -[BLTRemoteGizmoClient server](v28, "server");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleAction:", v23);

}

- (void)handleRemoveBulletinRequest:(id)a3
{
  id v4;
  BLTPBRemoveBulletinRequest *v5;
  void *v6;
  BLTPBRemoveBulletinRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBRemoveBulletinRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBRemoveBulletinRequest initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[BLTRemoteGizmoClient handleRemoveBulletinRequest:]";
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v20, 0x16u);

  }
  -[BLTPBRemoveBulletinRequest sectionID](v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBRemoveBulletinRequest publisherBulletinID](v7, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBRemoveBulletinRequest recordID](v7, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "phoneSectionIDForGizmoKey:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTPBRemoveBulletinRequest recordID](v7, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteGizmoClient server](self, "server");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeBulletinWithPublisherBulletinID:recordID:sectionID:", v15, v18, v17);

}

- (void)handleDidPlayLightsAndSirensReply:(id)a3
{
  id v4;
  BLTPBHandleDidPlayLightsAndSirensReplyRequest *v5;
  void *v6;
  BLTPBHandleDidPlayLightsAndSirensReplyRequest *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandleDidPlayLightsAndSirensReplyRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandleDidPlayLightsAndSirensReplyRequest initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136315394;
    v24 = "-[BLTRemoteGizmoClient handleDidPlayLightsAndSirensReply:]";
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v23, 0x16u);

  }
  kdebug_trace();
  v10 = -[BLTPBHandleDidPlayLightsAndSirensReplyRequest didPlayLightsAndSirens](v7, "didPlayLightsAndSirens");
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest phoneSectionID](v7, "phoneSectionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest publisherMatchID](v7, "publisherMatchID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "phoneSectionIDForGizmoKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest replyToken](v7, "replyToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteGizmoClient server](self, "server");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCE60];
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest date](v7, "date");
  objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleDidPlayLightsAndSirens:forBulletin:inPhoneSection:transmissionDate:receptionDate:replyToken:", v10, v15, v17, v21, v22, v18);

}

- (void)handleHandlePairedDeviceReady:(id)a3
{
  id v4;
  BLTPBHandlePairedDeviceReady *v5;
  void *v6;
  BLTPBHandlePairedDeviceReady *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBHandlePairedDeviceReady alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBHandlePairedDeviceReady initWithData:](v5, "initWithData:", v6);
  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[BLTRemoteGizmoClient handleHandlePairedDeviceReady:]";
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v10, 0x16u);

  }
  if (-[BLTRemoteObject lastKnownConnectionStatus](self, "lastKnownConnectionStatus") == 1)
    -[BLTRemoteObject setPairedDeviceReady:](self, "setPairedDeviceReady:", 1);

}

- (void)handleShouldSuppressLightsAndSirensNowRequest:(id)a3
{
  id v4;
  BLTPBShouldSuppressLightsAndSirensNowRequest *v5;
  void *v6;
  BLTPBShouldSuppressLightsAndSirensNowRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BLTPBShouldSuppressLightsAndSirensNowResponse *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBShouldSuppressLightsAndSirensNowRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLTPBShouldSuppressLightsAndSirensNowRequest initWithData:](v5, "initWithData:", v6);

  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[BLTRemoteGizmoClient handleShouldSuppressLightsAndSirensNowRequest:]";
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTRemoteGizmoClient server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldSuppressLightsAndSirensNow");

  v12 = objc_alloc_init(BLTPBShouldSuppressLightsAndSirensNowResponse);
  -[BLTPBShouldSuppressLightsAndSirensNowResponse setShouldSuppress:](v12, "setShouldSuppress:", v11);
  -[BLTRemoteObject sendResponse:type:withRequest:withTimeout:withDescription:onlyOneFor:didSend:](self, "sendResponse:type:withRequest:withTimeout:withDescription:onlyOneFor:didSend:", v12, 16, v4, 0, 0, 0, 0);

}

- (void)handleWillSendLightsAndSirensRequest:(id)a3
{
  id v4;
  BLTPBWillSendLightsAndSirensRequest *v5;
  void *v6;
  BLTPBWillSendLightsAndSirensRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  BLTPBWillSendLightsAndSirensRequest *v22;
  _QWORD v23[4];
  BLTPBWillSendLightsAndSirensRequest *v24;
  BLTRemoteGizmoClient *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBWillSendLightsAndSirensRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLTPBWillSendLightsAndSirensRequest initWithData:](v5, "initWithData:", v6);

  blt_ids_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v28 = "-[BLTRemoteGizmoClient handleWillSendLightsAndSirensRequest:]";
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTPBWillSendLightsAndSirensRequest sectionID](v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBWillSendLightsAndSirensRequest publisherBulletinID](v7, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLTPBWillSendLightsAndSirensRequest recordID](v7, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v10, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "phonePublisherBulletinIDForGizmoKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient gizmoLegacyMap](self, "gizmoLegacyMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "phoneSectionIDForGizmoKey:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTRemoteGizmoClient server](self, "server");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBWillSendLightsAndSirensRequest recordID](v7, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[BLTPBWillSendLightsAndSirensRequest systemApp](v7, "systemApp");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __61__BLTRemoteGizmoClient_handleWillSendLightsAndSirensRequest___block_invoke;
  v23[3] = &unk_24D762380;
  v24 = v7;
  v25 = self;
  v26 = v4;
  v21 = v4;
  v22 = v7;
  objc_msgSend(v18, "willSendLightsAndSirensWithPublisherBulletinID:recordID:inPhoneSection:systemApp:completion:", v15, v19, v17, v20, v23);

}

void __61__BLTRemoteGizmoClient_handleWillSendLightsAndSirensRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BLTPBWillSendLightsAndSirensResponse *v6;

  v6 = objc_alloc_init(BLTPBWillSendLightsAndSirensResponse);
  -[BLTPBWillSendLightsAndSirensResponse setWillSend:](v6, "setWillSend:", a2);
  if (objc_msgSend(*(id *)(a1 + 32), "hasSystemApp"))
    -[BLTPBWillSendLightsAndSirensResponse setAdditionalWait:](v6, "setAdditionalWait:", a3);
  objc_msgSend(*(id *)(a1 + 40), "sendResponse:type:withRequest:withTimeout:withDescription:onlyOneFor:didSend:", v6, 18, *(_QWORD *)(a1 + 48), 0, 0, 0, 0);

}

- (void)handleFileURL:(id)a3 extraMetadata:(id)a4
{
  -[BLTBulletinSendQueuePassthrough handleFileURL:](self->_bulletinSendQueue, "handleFileURL:", a3, a4);
}

- (void)queuePendingRequests
{
  -[BLTBulletinSendQueuePassthrough queuePending](self->_bulletinSendQueue, "queuePending");
}

- (BLTCompanionServer)server
{
  return (BLTCompanionServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (BLTGizmoLegacyMap)gizmoLegacyMap
{
  return self->_gizmoLegacyMap;
}

- (void)setGizmoLegacyMap:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoLegacyMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gizmoLegacyMap, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_gizmoToPhonePublisherBulletinIDMap, 0);
  objc_storeStrong((id *)&self->_bulletinSendQueue, 0);
}

@end
