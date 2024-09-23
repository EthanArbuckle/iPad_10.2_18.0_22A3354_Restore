@implementation NPKContactlessPaymentSessionAnalyticsManager

- (NPKContactlessPaymentSessionAnalyticsManager)init
{
  NPKContactlessPaymentSessionAnalyticsManager *v2;
  NPKContactlessPaymentSessionState *v3;
  NPKContactlessPaymentSessionState *previousState;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *analyticsQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPKContactlessPaymentSessionAnalyticsManager;
  v2 = -[NPKContactlessPaymentSessionAnalyticsManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NPKContactlessPaymentSessionState);
    previousState = v2->_previousState;
    v2->_previousState = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.NanoPassKit.NPKContactlessPaymentSessionAnalyticsManager", v5);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)contactlessPaymentSessionManager:(id)a3 didChangeSessionState:(id)a4
{
  id v5;
  NSObject *analyticsQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  NPKContactlessPaymentSessionAnalyticsManager *v10;

  v5 = a4;
  analyticsQueue = self->_analyticsQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __103__NPKContactlessPaymentSessionAnalyticsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke;
  v8[3] = &unk_24CFE7E40;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(analyticsQueue, v8);

}

void __103__NPKContactlessPaymentSessionAnalyticsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t IsTinker;
  id *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[2];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  if (NPKIsRunningInCarousel())
    v2 = 0;
  else
    v2 = 2;
  v3 = (id)*MEMORY[0x24BE6F090];
  objc_msgSend(*(id *)(a1 + 32), "transactionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "releaseDataStatus") == 6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "transactionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "releaseDataStatus");

    if (v6 != 6)
    {
      v7 = (void *)MEMORY[0x24BE6E9C8];
      v8 = *MEMORY[0x24BE6F178];
      v42[0] = *MEMORY[0x24BE6F158];
      v42[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BE6F020];
      v11 = *MEMORY[0x24BE6F000];
      v40[0] = *MEMORY[0x24BE6F018];
      v40[1] = v11;
      v41[0] = v10;
      v41[1] = CFSTR("userCancelled");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subjects:sendEvent:", v9, v12);
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "failureType")
    || !objc_msgSend(*(id *)(a1 + 32), "failureType"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "transactionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "transactionStatus") == 2)
    {
LABEL_14:

LABEL_15:
      v13 = CFSTR("other");
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "transactionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "transactionStatus") == 2)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "completionReason") == 3)
      {

      }
      else
      {
        v15 = objc_msgSend(*(id *)(a1 + 32), "completionReason");

        if (v15)
          goto LABEL_15;
      }
      v16 = (void *)MEMORY[0x24BE6E9C8];
      v17 = *MEMORY[0x24BE6F178];
      v36[0] = *MEMORY[0x24BE6F158];
      v36[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BE6F120];
      v34[0] = *MEMORY[0x24BE6F018];
      v34[1] = v19;
      v35[0] = v3;
      v35[1] = CFSTR("success");
      v20 = *MEMORY[0x24BE6F000];
      v34[2] = *MEMORY[0x24BE6F0E8];
      v34[3] = v20;
      v35[2] = v19;
      v35[3] = CFSTR("unknown");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subjects:sendEvent:", v18, v21);

      objc_msgSend(*(id *)(a1 + 32), "currentPass");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = NPKIsValidVASPass(v22);

      if ((_DWORD)v18)
      {
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isLowPowerModeEnabled");

        IsTinker = NPKPairedOrPairingDeviceIsTinker();
        NPKTrackSETransactionDetails(v2, 5, v24, IsTinker);
      }
      goto LABEL_15;
    }
LABEL_13:

    goto LABEL_14;
  }
  switch(objc_msgSend(*(id *)(a1 + 32), "failureType"))
  {
    case 1:
    case 5:
      v14 = CFSTR("failure");
      v13 = CFSTR("sessionFailed");
      break;
    case 2:
    case 6:
    case 8:
    case 9:
      v14 = CFSTR("failure");
      v13 = CFSTR("transactionFailed");
      break;
    case 3:
    case 4:
    case 7:
      v14 = CFSTR("failure");
      v13 = CFSTR("userCancelled");
      break;
    case 10:
      v13 = (__CFString *)(id)*MEMORY[0x24BE6F010];
      v26 = (id *)MEMORY[0x24BE6F098];
      goto LABEL_27;
    case 11:
      v13 = CFSTR("unlockIPhone");
      v26 = (id *)MEMORY[0x24BE6F028];
LABEL_27:
      v27 = *v26;

      v14 = CFSTR("failure");
      v3 = v27;
      break;
    default:
      v14 = CFSTR("unknown");
      v13 = CFSTR("other");
      break;
  }
  v28 = (void *)MEMORY[0x24BE6E9C8];
  v29 = *MEMORY[0x24BE6F178];
  v39[0] = *MEMORY[0x24BE6F158];
  v39[1] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x24BE6F120];
  v37[0] = *MEMORY[0x24BE6F018];
  v37[1] = v31;
  v38[0] = v3;
  v38[1] = v14;
  v32 = *MEMORY[0x24BE6F000];
  v37[2] = *MEMORY[0x24BE6F0E8];
  v37[3] = v32;
  v38[2] = v31;
  v38[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "subjects:sendEvent:", v30, v33);

LABEL_16:
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));

}

- (NPKContactlessPaymentSessionState)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
  objc_storeStrong((id *)&self->_previousState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end
