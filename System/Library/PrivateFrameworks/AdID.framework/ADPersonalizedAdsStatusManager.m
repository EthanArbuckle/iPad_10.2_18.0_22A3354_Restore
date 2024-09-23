@implementation ADPersonalizedAdsStatusManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ADPersonalizedAdsStatusManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_1 != -1)
    dispatch_once(&sharedInstance__onceToken_1, block);
  return (id)sharedInstance__instance_1;
}

void __48__ADPersonalizedAdsStatusManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_1;
  sharedInstance__instance_1 = (uint64_t)v0;

}

- (void)sendPersonalizedAdsStatusToAdPlatforms:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  ADPersonalizedAdsStatusManager *v42;
  id v43;
  char v44;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeDSIDRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPersonalizedAdsEnabled");

  objc_msgSend(v9, "DSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
  {
    if (self->_sendingPersonalizedAdsToAdPlatforms)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v36 = objc_opt_class();
      v15 = CFSTR("[%@]: Not sending Personalized Ads status to AdPlatforms - request already in-flight.");
LABEL_4:
      objc_msgSend(v14, "stringWithFormat:", v15, v36, v37);
LABEL_5:
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();
      goto LABEL_8;
    }
    if (objc_msgSend(v9, "isPlaceholderAccount"))
    {
      objc_msgSend(v9, "idForClientType:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iAdIDBeforeReset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v16);

      v22 = (void *)MEMORY[0x24BDD17C8];
      v23 = objc_opt_class();
      if (v21 && (v11 & 1) != 0)
      {
        objc_msgSend(v22, "stringWithFormat:", CFSTR("[%@]: Not sending ADOptOutRequest to AdPlatforms for what is now the old iAdID: %@."), v23, v16, v38);
        goto LABEL_7;
      }
      v25 = CFSTR("Out");
      if ((_DWORD)v11)
        v25 = CFSTR("In");
      objc_msgSend(v22, "stringWithFormat:", CFSTR("[%@]: Sending Opted-%@ Personalized Ads status to AdPlatforms for logged out iTunes user (DSID 0) - Backend needs knowledge of iAdID's Personalized Ads status."), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else
    {
      if ((_DWORD)v11)
      {
        objc_msgSend(v9, "idForClientType:", 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          v36 = objc_opt_class();
          v15 = CFSTR("[%@]: Not sending Personalized Ads status to AdPlatforms - Personalized Ads is on with no DPID. FILE A RADAR.");
          goto LABEL_4;
        }
      }
      if (llround((double)(int)objc_msgSend(v9, "lastSentPersonalizedAdsTimestamp")))
      {
        if ((_DWORD)v11 == objc_msgSend(v9, "lastSentPersonalizedAdsStatus")
          && (int)objc_msgSend(v9, "lastSentPersonalizedAdsTimestamp") >= 1)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Not sending Personalized Ads status to AdPlatforms - Personalized Ads status has not changed (%d)."), objc_opt_class(), v11);
          goto LABEL_5;
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x24BDD17C8];
        v28 = objc_opt_class();
        objc_msgSend(v9, "idForClientType:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("[%@]: Personalized Ads status for %@ (%d) has never been sent to AdPlatforms. Sending now."), v28, v29, v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

      }
    }
    v31 = (void *)MEMORY[0x24BDD17C8];
    v32 = objc_opt_class();
    objc_msgSend(v9, "idForClientType:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("[%@]: Sending current Personalized Ads status (%d) for %@ to AdPlatforms."), v32, v11, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    self->_sendingPersonalizedAdsToAdPlatforms = 1;
    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke;
    v39[3] = &unk_24D710C50;
    v40 = v9;
    v44 = v11;
    v41 = v6;
    v42 = self;
    v43 = v7;
    objc_msgSend(v35, "addOperationWithBlock:", v39);

    goto LABEL_10;
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_opt_class();
  objc_msgSend(v9, "DSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("[%@]: Not sending Personalized Ads status to AdPlatforms - invalid argument. %@ is not the current DSID (%@)."), v18, v6, v16);
LABEL_7:
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

LABEL_8:
  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_10:

}

void __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  char v15;
  _QWORD v16[5];
  id v17;

  v2 = objc_alloc_init(MEMORY[0x24BE021F8]);
  objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatusChangeTimestamp:", (double)(int)objc_msgSend(*(id *)(a1 + 32), "personalizedAdsTimestamp"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransmitTimestamp:", (double)(int)objc_msgSend(v4, "AD_toServerTime"));

  objc_msgSend(*(id *)(a1 + 32), "encryptedIDForClientType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDPID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "encryptedIDForClientType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIAdID:", v6);

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timezone");
  objc_msgSend(v2, "setTimezone:");

  objc_msgSend(v2, "setOptedOutStatus:", *(_BYTE *)(a1 + 64) == 0);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__2;
  v16[4] = __Block_byref_object_dispose__2;
  v17 = *(id *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultServerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke_27;
  v11[3] = &unk_24D710C28;
  v11[4] = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 64);
  v12 = v10;
  v14 = v16;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v3, "handleRequest:serverURL:responseHandler:", v2, v9, v11);

  _Block_object_dispose(v16, 8);
}

void __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_opt_class();
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    ClientTypeToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "code");
    objc_msgSend(v8, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[%@] Error sending segments to AdPlatforms for %@ %@. Error %ld - %@"), v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE02200]), "initWithData:", v19);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Received opt-out response: %@"), objc_opt_class(), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLastSentPersonalizedAdsTimestamp:", objc_msgSend(v17, "AD_toServerTime"));

    objc_msgSend(*(id *)(a1 + 40), "setLastSentPersonalizedAdsStatus:", *(unsigned __int8 *)(a1 + 64));
  }

  objc_msgSend(*(id *)(a1 + 32), "setSendingPersonalizedAdsToAdPlatforms:", 0);
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(uint64_t, id, uint64_t))(v18 + 16))(v18, v8, 1);

}

- (BOOL)sendingPersonalizedAdsToAdPlatforms
{
  return self->_sendingPersonalizedAdsToAdPlatforms;
}

- (void)setSendingPersonalizedAdsToAdPlatforms:(BOOL)a3
{
  self->_sendingPersonalizedAdsToAdPlatforms = a3;
}

- (NSNumber)pendingJingleRequestToken
{
  return self->_pendingJingleRequestToken;
}

- (void)setPendingJingleRequestToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingJingleRequestToken, 0);
}

@end
