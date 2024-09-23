@implementation HMDTTRManager

+ (HMMRadarRequestFilter)defaultFilter
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  sub_22259699C();
  swift_allocObject();
  v3 = sub_222596990();
  v4 = (void *)sub_221921DF8(v2, v3);
  swift_release();

  return (HMMRadarRequestFilter *)v4;
}

- (HMDTTRManager)initWithDialog:(id)a3 requestFilter:(id)a4
{
  id v7;
  id v8;
  HMDTTRManager *v9;
  void *v10;
  id v11;
  uint64_t v12;
  TapToRadarService *ttrService;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDTTRManager;
  v9 = -[HMDTTRManager init](&v15, sel_init);
  if (v9 && TapToRadarKitLibraryCore())
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v10 = (void *)getTapToRadarServiceClass_softClass;
    v20 = getTapToRadarServiceClass_softClass;
    if (!getTapToRadarServiceClass_softClass)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getTapToRadarServiceClass_block_invoke;
      v16[3] = &unk_24E797578;
      v16[4] = &v17;
      __getTapToRadarServiceClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v11, "shared");
    v12 = objc_claimAutoreleasedReturnValue();
    ttrService = v9->_ttrService;
    v9->_ttrService = (TapToRadarService *)v12;

    objc_storeStrong((id *)&v9->_dialog, a3);
    objc_storeStrong((id *)&v9->_requestFilter, a4);
  }

  return v9;
}

- (void)requestRadarWithMessage:(id)a3 radarTitle:(id)a4
{
  -[HMDTTRManager requestRadarWithMessage:radarTitle:waitForResponse:](self, "requestRadarWithMessage:radarTitle:waitForResponse:", a3, a4, 0);
}

- (void)requestRadarWithMessage:(id)a3 radarTitle:(id)a4 waitForResponse:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", 590644);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTTRManager requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:waitForResponse:](self, "requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:waitForResponse:", v10, v9, CFSTR("HomeKit"), CFSTR("New Bugs"), v11, v5);

}

- (void)requestRadarWithMessage:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7
{
  -[HMDTTRManager requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:waitForResponse:](self, "requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:waitForResponse:", a3, a4, a5, a6, a7, 0);
}

- (void)requestRadarWithMessage:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 waitForResponse:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (isInternalBuild())
  {
    objc_msgSend((id)objc_opt_class(), "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __111__HMDTTRManager_requestRadarWithMessage_radarTitle_componentName_componentVersion_componentID_waitForResponse___block_invoke;
    block[3] = &unk_24E7974C0;
    block[4] = self;
    v21 = v15;
    v22 = v14;
    v26 = a8;
    v23 = v16;
    v24 = v17;
    v25 = v18;
    dispatch_async(v19, block);

  }
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[HMDTTRManager requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:waitForResponse:](self, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:waitForResponse:", a3, a4, CFSTR("HomeKit"), CFSTR("New Bugs"), 590644, 0, v4);
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[HMDTTRManager requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:waitForResponse:](self, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:waitForResponse:", a3, a4, a5, a6, a7, 0, v7);
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 attachments:(id)a8
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  -[HMDTTRManager requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:waitForResponse:](self, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:waitForResponse:", a3, a4, a5, a6, a7, a8, v8);
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 attachments:(id)a8 waitForResponse:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;
  BOOL v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (isInternalBuild() && -[HMDTTRManager isTTRServiceAuthorized](self, "isTTRServiceAuthorized"))
  {
    objc_msgSend((id)objc_opt_class(), "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke;
    block[3] = &unk_24E797510;
    block[4] = self;
    v20 = v14;
    v25 = a9;
    v21 = v15;
    v22 = v16;
    v23 = v17;
    v24 = a7;
    dispatch_async(v18, block);

  }
}

- (BOOL)isTTRServiceAuthorized
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDTTRManager *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  HMDTTRManager *v12;
  HMDTTRManager *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDTTRManager ttrService](self, "ttrService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    _HMFPreconditionFailure();
  -[HMDTTRManager ttrService](self, "ttrService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authorizationStatus");

  switch(v6)
  {
    case 2:
      v7 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v10;
        v11 = "%{public}@Failing to initiate a radar: TapToRadarService is rate-limiting us";
        goto LABEL_11;
      }
LABEL_12:

      objc_autoreleasePoolPop(v7);
      return 0;
    case 1:
      v7 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v10;
        v11 = "%{public}@Failing to initiate a radar: TapToRadarService has been disallowed by the user";
        goto LABEL_11;
      }
      goto LABEL_12;
    case 0:
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v10;
        v11 = "%{public}@Failing to initiate a radar: TapToRadarService is not authorized";
LABEL_11:
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0xCu);

        goto LABEL_12;
      }
      goto LABEL_12;
  }
  return 1;
}

- (void)initiateRadarWithTitle:(id)a3 componentName:(id)a4 componentVersion:(id)a5 componentID:(int64_t)a6 displayReason:(id)a7 attachments:(id)a8 isUserInitiated:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _Unwind_Exception *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t v37;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  -[HMDTTRManager ttrService](self, "ttrService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v34 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v41, 8);
    _Unwind_Resume(v34);
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v21 = (void *)getRadarDraftClass_softClass;
  v44 = getRadarDraftClass_softClass;
  if (!getRadarDraftClass_softClass)
  {
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __getRadarDraftClass_block_invoke;
    v39 = &unk_24E797578;
    v40 = &v41;
    __getRadarDraftClass_block_invoke((uint64_t)&v36);
    v21 = (void *)v42[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v41, 8);
  v23 = objc_alloc_init(v22);
  v24 = objc_msgSend(v15, "length");
  if (v24 >= 0xF0)
    v25 = 240;
  else
    v25 = v24;
  objc_msgSend(v15, "substringToIndex:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:", v26);

  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v27 = (void *)getRadarComponentClass_softClass;
  v44 = getRadarComponentClass_softClass;
  if (!getRadarComponentClass_softClass)
  {
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __getRadarComponentClass_block_invoke;
    v39 = &unk_24E797578;
    v40 = &v41;
    __getRadarComponentClass_block_invoke((uint64_t)&v36);
    v27 = (void *)v42[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v41, 8);
  v29 = (void *)objc_msgSend([v28 alloc], "initWithName:version:identifier:", v16, v17, a6);
  objc_msgSend(v23, "setComponent:", v29);

  objc_msgSend(v23, "setAttachments:", v19);
  objc_msgSend(v23, "setIsUserInitiated:", a9);
  objc_msgSend(v23, "setDiagnosticExtensionIDs:", &unk_24E971288);
  v30 = objc_msgSend(v18, "length");
  if (v30 >= 0x4B)
    v31 = 75;
  else
    v31 = v30;
  objc_msgSend(v18, "substringToIndex:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTTRManager ttrService](self, "ttrService");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __125__HMDTTRManager_initiateRadarWithTitle_componentName_componentVersion_componentID_displayReason_attachments_isUserInitiated___block_invoke;
  v35[3] = &unk_24E79BD80;
  v35[4] = self;
  objc_msgSend(v33, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v23, CFSTR("HomeKit"), v32, v35);

}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend((id)objc_opt_class(), "namespaceUUID");
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDTTRManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return (OS_dispatch_queue *)objc_msgSend((id)objc_opt_class(), "queue");
}

- (void)handlePresentTTRDialog:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  __CFString *v8;

  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = CFSTR("homeutil");
  v8 = (__CFString *)v7;
  -[HMDTTRManager requestRadarWithMessage:radarTitle:](self, "requestRadarWithMessage:radarTitle:", v7, v7);
  objc_msgSend(v4, "respondWithSuccess");

}

- (void)handleResetLastTTRTime:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMDTTRManager requestFilter](self, "requestFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radarRequestedForDisplayReason:", &stru_24E79DB48);

  objc_msgSend(v5, "respondWithSuccess");
}

- (TapToRadarService)ttrService
{
  return self->_ttrService;
}

- (HMDUIDialogPresenter)dialog
{
  return self->_dialog;
}

- (HMMRadarRequestFilter)requestFilter
{
  return self->_requestFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestFilter, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_ttrService, 0);
}

void __125__HMDTTRManager_initiateRadarWithTitle_componentName_componentVersion_componentID_displayReason_attachments_isUserInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error trying to create radar draft: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "requestFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "shouldRequestRadarForDisplayReason:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v3 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "radarRequestedForDisplayReason:", *(_QWORD *)(a1 + 40)));
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting radar because %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "dialog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HomeKit requests you file a radar because %@."), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(unsigned __int8 *)(a1 + 80);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke_35;
    v19[3] = &unk_24E7974E8;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    v22 = v12;
    v24 = v13;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v8, "displayInternalTTRErrorWithContext:message:waitForResponse:completionHandler:", v9, v10, v11, v19);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Radar request filtered out: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

uint64_t __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke_35(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    LOBYTE(v2) = 1;
    return objc_msgSend(*(id *)(result + 32), "initiateRadarWithTitle:componentName:componentVersion:componentID:displayReason:attachments:isUserInitiated:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), *(_QWORD *)(result + 72), *(_QWORD *)(result + 64), 0, v2);
  }
  return result;
}

void __111__HMDTTRManager_requestRadarWithMessage_radarTitle_componentName_componentVersion_componentID_waitForResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "requestFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "shouldRequestRadarForDisplayReason:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v3 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "radarRequestedForDisplayReason:", *(_QWORD *)(a1 + 48)));
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting radar for: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "dialog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(unsigned __int8 *)(a1 + 80);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __111__HMDTTRManager_requestRadarWithMessage_radarTitle_componentName_componentVersion_componentID_waitForResponse___block_invoke_17;
    v17[3] = &unk_24E797498;
    v11 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 72);
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v8, "displayInternalTTRErrorWithContext:message:waitForResponse:completionHandler:", v9, v11, v10, v17);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Radar request filtered out: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __111__HMDTTRManager_requestRadarWithMessage_radarTitle_componentName_componentVersion_componentID_waitForResponse___block_invoke_17(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", CFSTR("tap-to-radar://new"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), a1[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), a1[7]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    objc_msgSend(v3, "setQueryItems:", v4);
    objc_msgSend(v3, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@TTR URL: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    launchURL((uint64_t)v9);

  }
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HMDTTRManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_231283 != -1)
    dispatch_once(&sharedManager_onceToken_231283, block);
  return (id)sharedManager_defaultManager;
}

+ (id)namespaceUUID
{
  if (namespaceUUID__hmf_once_t11 != -1)
    dispatch_once(&namespaceUUID__hmf_once_t11, &__block_literal_global_231281);
  return (id)namespaceUUID__hmf_once_v12;
}

+ (id)queue
{
  if (queue__hmf_once_t13 != -1)
    dispatch_once(&queue__hmf_once_t13, &__block_literal_global_44_231279);
  return (id)queue__hmf_once_v14;
}

void __22__HMDTTRManager_queue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.HomeKit.HMDTTRManager", v0);
  v2 = (void *)queue__hmf_once_v14;
  queue__hmf_once_v14 = (uint64_t)v1;

}

void __30__HMDTTRManager_namespaceUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("B4FFBCEC-B0A2-4660-B1B2-4B484FE76D74"));
  v1 = (void *)namespaceUUID__hmf_once_v12;
  namespaceUUID__hmf_once_v12 = v0;

}

void __30__HMDTTRManager_sharedManager__block_invoke(uint64_t a1)
{
  HMDTTRManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (isInternalBuild())
  {
    if (TapToRadarKitLibraryCore())
    {
      v2 = [HMDTTRManager alloc];
      +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "defaultFilter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HMDTTRManager initWithDialog:requestFilter:](v2, "initWithDialog:requestFilter:", v3, v4);
      v6 = (void *)sharedManager_defaultManager;
      sharedManager_defaultManager = v5;

      +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = sharedManager_defaultManager;
      +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("presentTTRDialog"), v8, v10, sel_handlePresentTTRDialog_);

      v11 = sharedManager_defaultManager;
      +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("resetLastTTRTime"), v11, v13, sel_handleResetLastTTRTime_);

    }
  }
}

@end
