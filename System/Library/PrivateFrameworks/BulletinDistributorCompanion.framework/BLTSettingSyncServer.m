@implementation BLTSettingSyncServer

- (BLTSettingSyncServer)init
{
  BLTSettingSyncServer *v2;
  __objc2_class *v3;
  BLTSettingsSendSerializerPassthrough *v4;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v6;
  _QWORD v8[4];
  BLTSettingSyncServer *v9;

  v2 = -[BLTRemoteObject initWithServiceName:idsQueueName:](self, "initWithServiceName:idsQueueName:", CFSTR("com.apple.private.alloy.bulletindistributor.settings"), "com.apple.bulletindistributor.settingsync");
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsFileSettingSync"))
      v3 = BLTSettingsSendSerializer;
    else
      v3 = BLTSettingsSendSerializerPassthrough;
    v4 = (BLTSettingsSendSerializerPassthrough *)objc_alloc_init(v3);
    settingSendSerializer = v2->_settingSendSerializer;
    v2->_settingSendSerializer = v4;

    -[BLTSettingsSendSerializerPassthrough setDelegate:](v2->_settingSendSerializer, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__BLTSettingSyncServer_init__block_invoke;
    v8[3] = &unk_24D761EA8;
    v9 = v2;
    objc_msgSend(v6, "waitForPairingStorePathPairingID:", v8);

  }
  return v2;
}

void __28__BLTSettingSyncServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  BLTPreviouslySentMessageStore *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BLTPreviouslySentMessageStore *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "stringByAppendingPathComponent:", CFSTR("BulletinDistributor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BDD0CF0];
    v21[0] = *MEMORY[0x24BDD0CF8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, v8, &v19);
    v6 = v19;

    if ((v9 & 1) == 0)
    {
      blt_settings_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __28__BLTSettingSyncServer_init__block_invoke_cold_1((uint64_t)v3, v10);

    }
  }
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PreviouslySentSettingSyncMessageStore.plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BLTPreviouslySentMessageStore initWithMessageStorePath:]([BLTPreviouslySentMessageStore alloc], "initWithMessageStorePath:", v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 168);
  *(_QWORD *)(v13 + 168) = v12;

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PreviouslySentSectionSubtypeParameterIconsMessageStore.plist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[BLTPreviouslySentMessageStore initWithMessageStorePath:]([BLTPreviouslySentMessageStore alloc], "initWithMessageStorePath:", v15);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 176);
  *(_QWORD *)(v17 + 176) = v16;

}

- (void)handleFileURL:(id)a3 extraMetadata:(id)a4
{
  -[BLTSettingsSendSerializerPassthrough handleFileURL:](self->_settingSendSerializer, "handleFileURL:", a3, a4);
}

- (void)registerProtobufHandlers
{
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetSectionInfoRequest_, 13);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetSectionSubtypeParametersIconRequest_, 14);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleRemoveSectionRequest_, 19);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetNotificationsAlertLevelRequest_, 20);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetNotificationsGroupingRequest_, 21);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetNotificationsSoundRequest_, 22);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetNotificationsCriticalAlertRequest_, 23);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetRemoteGlobalSpokenSettingEnabledRequest_, 24);
  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetRemoteGlobalSettingsRequest_, 25);
  -[BLTRemoteObject setProtobufAction:forIncomingResponsesOfType:](self, "setProtobufAction:forIncomingResponsesOfType:", sel_handleSetSectionInfoResponse_, 13);
  -[BLTRemoteObject setProtobufAction:forIncomingResponsesOfType:](self, "setProtobufAction:forIncomingResponsesOfType:", sel_handleSetSectionSubtypeParametersIconResponse_, 14);
}

- (void)setSectionInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[BLTSettingSyncServer setSectionInfo:completion:]", "BLTSettingSyncServer.m", 144, "0");
}

- (void)setSectionInfo:(id)a3 withSent:(id)a4 withAcknowledgement:(id)a5 keypaths:(id)a6 spoolToFile:(BOOL)a7
{
  id v11;
  BLTPBSetSectionInfoRequest *v12;
  BLTPBSetSectionInfoRequest *v13;
  void *v14;
  BLTPBSetSectionInfoRequest *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BLTPreviouslySentMessageStore *sectionInfoPreviouslySentMessageStore;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BLTPBSetSectionInfoRequest *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *context;
  void *v47;
  void (**v48)(void);
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  void (**v61)(void);
  id v62;
  id location[4];

  location[2] = *(id *)MEMORY[0x24BDAC8D0];
  v11 = a3;
  v50 = a4;
  v48 = (void (**)(void))a5;
  v45 = a6;
  context = (void *)MEMORY[0x219A0BFAC]();
  v12 = objc_alloc_init(BLTPBSetSectionInfoRequest);
  -[BLTPBSetSectionInfoRequest setSectionInfo:](v12, "setSectionInfo:", v11);
  v13 = v12;
  objc_msgSend(v11, "icon");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "data");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR(".setSectionInfoIconsOnly"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLTPreviouslySentMessageStore messageDigestForUnsentMessage:messageKey:](self->_sectionInfoPreviouslySentMessageStore, "messageDigestForUnsentMessage:messageKey:", v49, v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(BLTPBSetSectionInfoRequest);
  v16 = v11;
  v17 = v16;
  v18 = v16;
  if (v53)
  {
    v18 = (void *)objc_msgSend(v16, "copy");

    objc_msgSend(v18, "setIcon:", 0);
    objc_msgSend(v18, "setIconsStripped:", 1);
  }
  v44 = v17;
  -[BLTPBSetSectionInfoRequest setSectionInfo:](v15, "setSectionInfo:", v18);
  -[BLTPBSetSectionInfoRequest sectionInfo](v13, "sectionInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingString:", CFSTR(".setSectionInfoWithoutIcons"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  sectionInfoPreviouslySentMessageStore = self->_sectionInfoPreviouslySentMessageStore;
  -[BLTPBSetSectionInfoRequest data](v15, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPreviouslySentMessageStore messageDigestForUnsentMessage:messageKey:](sectionInfoPreviouslySentMessageStore, "messageDigestForUnsentMessage:messageKey:", v23, v21);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    if (v13)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      -[BLTPBSetSectionInfoRequest sectionInfo](v13, "sectionInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sectionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("setSectionInfoWithIcons:\"%@\"), v26);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BDD17C8];
      -[BLTPBSetSectionInfoRequest sectionInfo](v13, "sectionInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sectionID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@.setSectionInfo.withIcons"), v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v13;
LABEL_9:

      objc_initWeak(location, self);
      v35 = MEMORY[0x24BDAC760];
      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v56[2] = __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke;
      v56[3] = &unk_24D763CE8;
      objc_copyWeak(&v62, location);
      v57 = v51;
      v58 = v52;
      v59 = v47;
      v60 = v21;
      v61 = v48;
      v36 = (void *)MEMORY[0x219A0C15C](v56);
      settingSendSerializer = self->_settingSendSerializer;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v35;
      v54[1] = 3221225472;
      v54[2] = __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke_2;
      v54[3] = &unk_24D762330;
      v55 = v50;
      LOBYTE(v40) = a7;
      -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v30, 13, v38, v43, v42, v54, v36, v40);

      objc_destroyWeak(&v62);
      objc_destroyWeak(location);

      goto LABEL_18;
    }
  }
  else if (v47)
  {
    v30 = v15;

    if (v30)
    {
      v31 = (void *)MEMORY[0x24BDD17C8];
      -[BLTPBSetSectionInfoRequest sectionInfo](v13, "sectionInfo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sectionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("setSectionInfoWithoutIcons:\"%@\"), v33);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x24BDD17C8];
      -[BLTPBSetSectionInfoRequest sectionInfo](v13, "sectionInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sectionID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.setSectionInfo.withoutIcons"), v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {

  }
  blt_settings_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v21;
    _os_log_impl(&dword_2173D9000, v39, OS_LOG_TYPE_DEFAULT, "Not sending %@ because already sent", (uint8_t *)location, 0xCu);
  }

  if (v50)
    (*((void (**)(id, uint64_t, _QWORD))v50 + 2))(v50, 1, 0);
  if (v48)
    v48[2]();
  v30 = 0;
LABEL_18:

  objc_autoreleasePoolPop(context);
}

void __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v5 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "sectionInfoPreviouslySentMessageStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordMessageDigestAsPreviouslySent:messageKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v5, "sectionInfoPreviouslySentMessageStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordMessageDigestAsPreviouslySent:messageKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    }
    v3 = v9;
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
  {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v3 != 0);
    v3 = v9;
  }

}

uint64_t __89__BLTSettingSyncServer_setSectionInfo_withSent_withAcknowledgement_keypaths_spoolToFile___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  __assert_rtn("-[BLTSettingSyncServer setSectionSubtypeParametersIcon:forSectionID:forSubtypeID:]", "BLTSettingSyncServer.m", 258, "0");
}

- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5 withQueue:(id)a6 withSent:(id)a7 withAcknowledgement:(id)a8 spoolToFile:(BOOL)a9
{
  id v15;
  BLTPBSetSectionSubtypeParametersIconRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *context;
  void *v30;
  id v31;
  void *v32;
  dispatch_queue_t queue;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD block[4];
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  NSObject *v46;
  id v47;
  id v48;
  id location[4];

  location[2] = *(id *)MEMORY[0x24BDAC8D0];
  v31 = a3;
  v15 = a4;
  queue = (dispatch_queue_t)a6;
  v34 = a7;
  v35 = a8;
  context = (void *)MEMORY[0x219A0BFAC]();
  v16 = objc_alloc_init(BLTPBSetSectionSubtypeParametersIconRequest);
  v30 = v15;
  -[BLTPBSetSectionSubtypeParametersIconRequest setSectionID:](v16, "setSectionID:", v15);
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    -[BLTPBSetSectionSubtypeParametersIconRequest setSubtypeID:](v16, "setSubtypeID:", a5);
  -[BLTPBSetSectionSubtypeParametersIconRequest setDefaultSubtype:](v16, "setDefaultSubtype:", a5 == 0x7FFFFFFFFFFFFFFFLL);
  -[BLTPBSetSectionSubtypeParametersIconRequest setIcon:](v16, "setIcon:", v31);
  -[BLTPBSetSectionSubtypeParametersIconRequest data](v16, "data");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD17C8];
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v15, CFSTR("default"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), v15, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[BLTPreviouslySentMessageStore messageDigestForUnsentMessage:messageKey:](self->_sectionSubtypeParametersIconsPreviouslySentMessageStore, "messageDigestForUnsentMessage:messageKey:", v32, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("setSectionSubtypeParametersIcon:\"%@\"), v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.setSectionSubtypeParametersIcon"), v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke;
    v43[3] = &unk_24D763D10;
    objc_copyWeak(&v48, location);
    v44 = v20;
    v45 = v18;
    v47 = v35;
    v22 = queue;
    v46 = v22;
    v23 = (void *)MEMORY[0x219A0C15C](v43);
    settingSendSerializer = self->_settingSendSerializer;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_3;
    v40[3] = &unk_24D763D38;
    v42 = v34;
    v41 = v22;
    LOBYTE(v27) = a9;
    -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v16, 14, v25, v21, v28, v40, v23, v27);

    objc_destroyWeak(&v48);
    objc_destroyWeak(location);

LABEL_14:
    goto LABEL_15;
  }
  blt_settings_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v18;
    _os_log_impl(&dword_2173D9000, v26, OS_LOG_TYPE_INFO, "Not sending %@ because already sent", (uint8_t *)location, 0xCu);
  }

  if (v34)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_58;
    block[3] = &unk_24D761B98;
    v39 = v34;
    dispatch_async(queue, block);

  }
  if (v35)
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2_59;
    v36[3] = &unk_24D761B98;
    v37 = v35;
    dispatch_async(queue, v36);
    v21 = v37;
    goto LABEL_14;
  }
LABEL_15:

  objc_autoreleasePoolPop(context);
}

void __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "sectionSubtypeParametersIconsPreviouslySentMessageStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordMessageDigestAsPreviouslySent:messageKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2;
    v9[3] = &unk_24D761B20;
    v11 = v7;
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0);
}

void __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_4;
    block[3] = &unk_24D761B70;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __133__BLTSettingSyncServer_setSectionSubtypeParametersIcon_forSectionID_forSubtypeID_withQueue_withSent_withAcknowledgement_spoolToFile___block_invoke_2_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendSpooledRequestsNowWithSent:(id)a3 withAcknowledgement:(id)a4
{
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v6;
  double v7;
  id v8;
  id v9;
  id v10;

  settingSendSerializer = self->_settingSendSerializer;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = *MEMORY[0x24BE4FA10];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "numberWithDouble:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[BLTSettingsSendSerializerPassthrough sendNowWithSent:withAcknowledgement:withTimeout:](settingSendSerializer, "sendNowWithSent:withAcknowledgement:withTimeout:", v9, v8, v10);

}

- (void)clearSectionInfoSentCache
{
  -[BLTPreviouslySentMessageStore clear](self->_sectionInfoPreviouslySentMessageStore, "clear");
}

- (void)removeSectionInfoSentCacheForSectionID:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR(".setSectionInfoWithoutIcons"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLTPreviouslySentMessageStore removeDigestForKey:](self->_sectionInfoPreviouslySentMessageStore, "removeDigestForKey:", v4);

}

- (BOOL)isSectionInfoSentCacheEmpty
{
  return -[BLTPreviouslySentMessageStore isEmpty](self->_sectionInfoPreviouslySentMessageStore, "isEmpty");
}

- (void)removeSectionWithSectionID:(id)a3 sent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v13;
  void *v14;
  uint64_t v15;
  BLTPBRemoveSectionRequest *v16;

  v6 = a4;
  v7 = a3;
  v16 = objc_alloc_init(BLTPBRemoveSectionRequest);
  -[BLTPBRemoveSectionRequest setSectionID:](v16, "setSectionID:", v7);
  -[BLTSettingSyncServer sectionInfoPreviouslySentMessageStore](self, "sectionInfoPreviouslySentMessageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".setSectionInfoIconsOnly"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDigestForKey:", v9);

  -[BLTSettingSyncServer sectionInfoPreviouslySentMessageStore](self, "sectionInfoPreviouslySentMessageStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".setSectionInfoWithoutIcons"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeDigestForKey:", v11);

  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.removeSectionRequest"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = 0;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v16, 19, v13, 0, v14, v6, 0, v15);

}

- (void)removeSectionWithSectionID:(id)a3
{
  -[BLTSettingSyncServer removeSectionWithSectionID:sent:](self, "removeSectionWithSectionID:sent:", a3, 0);
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5
{
  -[BLTSettingSyncServer setNotificationsLevel:sectionID:mirror:spoolToFile:](self, "setNotificationsLevel:sectionID:mirror:spoolToFile:", a3, a4, a5, 0);
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 spoolToFile:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  BLTPBSetNotificationsAlertLevelRequest *v11;
  uint64_t v12;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v14;
  void *v15;
  uint64_t v16;
  BLTPBSetNotificationsAlertLevelRequest *v17;

  v7 = a5;
  v10 = a4;
  v11 = objc_alloc_init(BLTPBSetNotificationsAlertLevelRequest);
  v17 = v11;
  if (a3 - 1 < 3)
    v12 = a3;
  else
    v12 = 0;
  -[BLTPBSetNotificationsAlertLevelRequest setLevel:](v11, "setLevel:", v12);
  -[BLTPBSetNotificationsAlertLevelRequest setSectionID:](v17, "setSectionID:", v10);
  -[BLTPBSetNotificationsAlertLevelRequest setMirror:](v17, "setMirror:", v7);
  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.setnotificationsalertlevel"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v16) = a6;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v17, 20, v14, 0, v15, 0, 0, v16);

}

- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4
{
  -[BLTSettingSyncServer setNotificationsGrouping:sectionID:spoolToFile:](self, "setNotificationsGrouping:sectionID:spoolToFile:", *(_QWORD *)&a3, a4, 0);
}

- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4 spoolToFile:(BOOL)a5
{
  uint64_t v6;
  id v8;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v10;
  void *v11;
  uint64_t v12;
  BLTPBSetNotificationsGroupingRequest *v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v13 = objc_alloc_init(BLTPBSetNotificationsGroupingRequest);
  -[BLTPBSetNotificationsGroupingRequest setGrouping:](v13, "setGrouping:", v6);
  -[BLTPBSetNotificationsGroupingRequest setSectionID:](v13, "setSectionID:", v8);
  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.setnotificationsgrouping"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = a5;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v13, 21, v10, 0, v11, 0, 0, v12);

}

- (void)setNotificationsSoundEnabled:(int)a3 sectionID:(id)a4
{
  uint64_t v4;
  id v6;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v8;
  void *v9;
  uint64_t v10;
  BLTPBSetNotificationsSoundRequest *v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11 = objc_alloc_init(BLTPBSetNotificationsSoundRequest);
  -[BLTPBSetNotificationsSoundRequest setSound:](v11, "setSound:", v4);
  -[BLTPBSetNotificationsSoundRequest setSectionID:](v11, "setSectionID:", v6);
  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.setnotificationssound"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 0;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v11, 22, v8, 0, v9, 0, 0, v10);

}

- (void)setNotificationsCriticalAlertEnabled:(int)a3 sectionID:(id)a4
{
  uint64_t v4;
  id v6;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v8;
  void *v9;
  uint64_t v10;
  BLTPBSetNotificationsCriticalAlertRequest *v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11 = objc_alloc_init(BLTPBSetNotificationsCriticalAlertRequest);
  -[BLTPBSetNotificationsCriticalAlertRequest setCriticalAlertSetting:](v11, "setCriticalAlertSetting:", v4);
  -[BLTPBSetNotificationsCriticalAlertRequest setSectionID:](v11, "setSectionID:", v6);
  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.setnotificationscriticalalert"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 0;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v11, 23, v8, 0, v9, 0, 0, v10);

}

- (void)sendRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v10;
  uint64_t v11;
  BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *v12;

  v4 = a3;
  v6 = a4;
  v12 = objc_alloc_init(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest);
  -[BLTPBSetRemoteGlobalSpokenSettingEnabledRequest setSettingEnabled:](v12, "setSettingEnabled:", v4);
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  -[BLTPBSetRemoteGlobalSpokenSettingEnabledRequest setSettingDate:](v12, "setSettingDate:", v8);
  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v12, 24, v10, 0, CFSTR("remoteGlobalSpokenSettingEnabled"), 0, 0, v11);

}

- (void)remoteGlobalSettingsSyncServer:(id)a3 sendChangeset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BLTSettingsSendSerializerPassthrough *settingSendSerializer;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  BLTSettingSyncServer *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "blt_protobuf");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  blt_global_settings_sync_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "%@ remoteGlobalSettingsSyncServer: %@ sendChangeset: %@", buf, 0x20u);
  }

  settingSendSerializer = self->_settingSendSerializer;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 0;
  -[BLTSettingsSendSerializerPassthrough sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:](settingSendSerializer, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:spoolToFile:", v8, 25, v11, 0, v13, 0, 0, v14);

}

- (void)handleSetSectionInfoRequest:(id)a3
{
  id v4;
  BLTPBSetSectionInfoRequest *v5;
  void *v6;
  BLTPBSetSectionInfoRequest *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetSectionInfoRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLTPBSetSectionInfoRequest initWithData:](v5, "initWithData:", v6);

  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[BLTSettingSyncServer handleSetSectionInfoRequest:]";
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  if (-[BLTPBSetSectionInfoRequest keypathsCount](v7, "keypathsCount"))
  {
    v11 = (void *)MEMORY[0x24BDBCF20];
    -[BLTPBSetSectionInfoRequest keypaths](v7, "keypaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetSectionInfoRequest sectionInfo](v7, "sectionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__BLTSettingSyncServer_handleSetSectionInfoRequest___block_invoke;
  v17[3] = &unk_24D761AA8;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v14, "setSectionInfo:keypaths:completion:", v15, v13, v17);

}

void __52__BLTSettingSyncServer_handleSetSectionInfoRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  BLTPBSetSectionInfoResponse *v5;

  v5 = objc_alloc_init(BLTPBSetSectionInfoResponse);
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendResponse:type:withRequest:withTimeout:withDescription:onlyOneFor:didSend:", v5, 13, v2, v4, CFSTR("sectionInfo response"), 0, 0);

}

- (void)handleSetSectionSubtypeParametersIconRequest:(id)a3
{
  id v4;
  BLTPBSetSectionSubtypeParametersIconRequest *v5;
  void *v6;
  BLTPBSetSectionSubtypeParametersIconRequest *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BLTPBSetSectionSubtypeParametersIconResponse *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetSectionSubtypeParametersIconRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLTPBSetSectionSubtypeParametersIconRequest initWithData:](v5, "initWithData:", v6);

  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v18 = "-[BLTSettingSyncServer handleSetSectionSubtypeParametersIconRequest:]";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", buf, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetSectionSubtypeParametersIconRequest icon](v7, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetSectionSubtypeParametersIconRequest sectionID](v7, "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BLTPBSetSectionSubtypeParametersIconRequest defaultSubtype](v7, "defaultSubtype"))
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = -[BLTPBSetSectionSubtypeParametersIconRequest subtypeID](v7, "subtypeID");
  objc_msgSend(v11, "setSectionSubtypeParametersIcon:forSectionID:forSubtypeID:", v12, v13, v14);

  v15 = objc_alloc_init(BLTPBSetSectionSubtypeParametersIconResponse);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteObject sendResponse:type:withRequest:withTimeout:withDescription:onlyOneFor:didSend:](self, "sendResponse:type:withRequest:withTimeout:withDescription:onlyOneFor:didSend:", v15, 14, v4, v16, CFSTR("subtypeParemetersIcon response"), 0, 0);

}

- (void)handleRemoveSectionRequest:(id)a3
{
  id v4;
  BLTPBRemoveSectionRequest *v5;
  void *v6;
  BLTPBRemoveSectionRequest *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBRemoveSectionRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBRemoveSectionRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[BLTSettingSyncServer handleRemoveSectionRequest:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBRemoveSectionRequest sectionID](v7, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeSectionWithSectionID:", v12);

}

- (void)handleSetSectionSubtypeParametersIconResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  BLTPBSetSectionSubtypeParametersIconResponse *v7;
  void *v8;
  BLTPBSetSectionSubtypeParametersIconResponse *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  blt_settings_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    v7 = [BLTPBSetSectionSubtypeParametersIconResponse alloc];
    objc_msgSend(v4, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BLTPBSetSectionSubtypeParametersIconResponse initWithData:](v7, "initWithData:", v8);

    blt_settings_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PBCodable redact](v9, "redact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[BLTSettingSyncServer handleSetSectionSubtypeParametersIconResponse:]";
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2173D9000, v10, OS_LOG_TYPE_DEFAULT, "Received response %s encapsulating %@", (uint8_t *)&v14, 0x16u);

    }
  }
  objc_msgSend(v4, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "incomingResponseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSettingSyncServer _handleResponse:](self, "_handleResponse:", v13);

}

- (void)handleSetNotificationsAlertLevelRequest:(id)a3
{
  id v4;
  BLTPBSetNotificationsAlertLevelRequest *v5;
  void *v6;
  BLTPBSetNotificationsAlertLevelRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetNotificationsAlertLevelRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBSetNotificationsAlertLevelRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[BLTSettingSyncServer handleSetNotificationsAlertLevelRequest:]";
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v14, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLTPBSetNotificationsAlertLevelRequest level](v7, "level") - 1;
  if (v11 < 3)
    v12 = v11 + 1;
  else
    v12 = 0;
  -[BLTPBSetNotificationsAlertLevelRequest sectionID](v7, "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationsLevel:sectionID:mirror:fromRemote:", v12, v13, -[BLTPBSetNotificationsAlertLevelRequest mirror](v7, "mirror"), 1);

}

- (void)handleSetNotificationsGroupingRequest:(id)a3
{
  id v4;
  BLTPBSetNotificationsGroupingRequest *v5;
  void *v6;
  BLTPBSetNotificationsGroupingRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetNotificationsGroupingRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBSetNotificationsGroupingRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[BLTSettingSyncServer handleSetNotificationsGroupingRequest:]";
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLTPBSetNotificationsGroupingRequest grouping](v7, "grouping");
  -[BLTPBSetNotificationsGroupingRequest sectionID](v7, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationsGrouping:sectionID:", v11, v12);

}

- (void)handleSetNotificationsSoundRequest:(id)a3
{
  id v4;
  BLTPBSetNotificationsSoundRequest *v5;
  void *v6;
  BLTPBSetNotificationsSoundRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetNotificationsSoundRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBSetNotificationsSoundRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[BLTSettingSyncServer handleSetNotificationsSoundRequest:]";
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLTPBSetNotificationsSoundRequest sound](v7, "sound");
  -[BLTPBSetNotificationsSoundRequest sectionID](v7, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationsSoundEnabled:sectionID:", v11, v12);

}

- (void)handleSetNotificationsCriticalAlertRequest:(id)a3
{
  id v4;
  BLTPBSetNotificationsCriticalAlertRequest *v5;
  void *v6;
  BLTPBSetNotificationsCriticalAlertRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetNotificationsCriticalAlertRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBSetNotificationsCriticalAlertRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[BLTSettingSyncServer handleSetNotificationsCriticalAlertRequest:]";
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v13, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLTPBSetNotificationsCriticalAlertRequest criticalAlertSetting](v7, "criticalAlertSetting");
  -[BLTPBSetNotificationsCriticalAlertRequest sectionID](v7, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationsCriticalAlertEnabled:sectionID:", v11, v12);

}

- (void)handleSetRemoteGlobalSpokenSettingEnabledRequest:(id)a3
{
  id v4;
  BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *v5;
  void *v6;
  BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetRemoteGlobalSpokenSettingEnabledRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBSetRemoteGlobalSpokenSettingEnabledRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[BLTSettingSyncServer handleSetRemoteGlobalSpokenSettingEnabledRequest:]";
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v14, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLTPBSetRemoteGlobalSpokenSettingEnabledRequest settingEnabled](v7, "settingEnabled");
  v12 = (void *)MEMORY[0x24BDBCE60];
  -[BLTPBSetRemoteGlobalSpokenSettingEnabledRequest settingDate](v7, "settingDate");
  objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transportUpdateRemoteGlobalSpokenSettingEnabled:date:", v11, v13);

}

- (void)handleSetRemoteGlobalSettingsRequest:(id)a3
{
  id v4;
  BLTPBSetRemoteGlobalSettingsRequest *v5;
  void *v6;
  BLTPBSetRemoteGlobalSettingsRequest *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [BLTPBSetRemoteGlobalSettingsRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BLTPBSetRemoteGlobalSettingsRequest initWithData:](v5, "initWithData:", v6);
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PBCodable redact](v7, "redact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[BLTSettingSyncServer handleSetRemoteGlobalSettingsRequest:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Received %s encapsulating %@", (uint8_t *)&v11, 0x16u);

  }
  -[BLTSettingSyncServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateGlobalSettings:", v7);

}

- (BLTSettingSyncingClient)delegate
{
  return (BLTSettingSyncingClient *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLTPreviouslySentMessageStore)sectionInfoPreviouslySentMessageStore
{
  return self->_sectionInfoPreviouslySentMessageStore;
}

- (void)setSectionInfoPreviouslySentMessageStore:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfoPreviouslySentMessageStore, a3);
}

- (BLTPreviouslySentMessageStore)sectionSubtypeParametersIconsPreviouslySentMessageStore
{
  return self->_sectionSubtypeParametersIconsPreviouslySentMessageStore;
}

- (void)setSectionSubtypeParametersIconsPreviouslySentMessageStore:(id)a3
{
  objc_storeStrong((id *)&self->_sectionSubtypeParametersIconsPreviouslySentMessageStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSubtypeParametersIconsPreviouslySentMessageStore, 0);
  objc_storeStrong((id *)&self->_sectionInfoPreviouslySentMessageStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingSendSerializer, 0);
}

void __28__BLTSettingSyncServer_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Could not create %@", (uint8_t *)&v2, 0xCu);
}

@end
