@implementation NSError(MPCDialogs)

- (id)mpc_remoteCommandStatus
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  objc_msgSend(a1, "msv_firstValueForUserInfoKey:", CFSTR("MPCErrorUserInfoKeyRemoteCommandStatusCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 200;
  objc_msgSend(a1, "msv_firstValueForUserInfoKey:", CFSTR("MPCErrorUserInfoKeyRemoteDialog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_12;
  if (a1)
  {
    objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BE65BE0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDDCB70];
      objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_TITLE"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dialogWithTitle:message:", v9, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDDCB78];
      objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_ACTION"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:type:commandEvent:", v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v14);
    }
    else
    {
      objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BEC85D0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v5 = 0;
LABEL_11:

        if (v5)
        {
LABEL_12:
          objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:dialog:", v4, v5);
          v22 = objc_claimAutoreleasedReturnValue();
LABEL_13:
          v23 = (void *)v22;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      v15 = (void *)MEMORY[0x24BDDCB70];
      objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_TITLE"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dialogWithTitle:message:", v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDDCB78], "actionWithTitle:type:commandEvent:", CFSTR("MPC_PLAY_ONLY_FOR_ME"), 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v19);

      v20 = (void *)MEMORY[0x24BDDCB78];
      objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_ACTION"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:type:commandEvent:", v14, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v21);

    }
    goto LABEL_11;
  }
LABEL_15:
  objc_msgSend(a1, "msv_firstValueForUserInfoKey:", CFSTR("MPCErrorUserInfoKeyCustomDataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", v4, a1);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(a1, "msv_firstValueForUserInfoKey:", CFSTR("MPCErrorUserInfoKeyCustomData"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:customData:type:", v4, v28, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v23;
}

@end
