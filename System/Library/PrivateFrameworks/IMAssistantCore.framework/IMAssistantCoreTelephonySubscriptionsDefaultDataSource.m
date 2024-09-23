@implementation IMAssistantCoreTelephonySubscriptionsDefaultDataSource

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EDAE94C;
  block[3] = &unk_24E3960E0;
  block[4] = a1;
  if (qword_25548BA18 != -1)
    dispatch_once(&qword_25548BA18, block);
  return (id)qword_25548BA10;
}

- (BOOL)deviceHasMultipleSubscriptions
{
  int HasMultipleSubscriptions;

  HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  if (HasMultipleSubscriptions)
    LOBYTE(HasMultipleSubscriptions) = MEMORY[0x24BEDD108](MEMORY[0x24BDBAD28], sel_deviceSupportsGemini);
  return HasMultipleSubscriptions;
}

- (id)bestSenderIdentityForChatWithHandleIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE51288];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestSenderIdentityForHandleIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)handleIDForSenderIdentity:(id)a3
{
  void *v3;
  void *v4;

  -[IMAssistantCoreTelephonySubscriptionsDefaultDataSource subscriptionContextForSenderIdentity:](self, "subscriptionContextForSenderIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)simIDForSenderIdentity:(id)a3
{
  void *v3;
  void *v4;

  -[IMAssistantCoreTelephonySubscriptionsDefaultDataSource subscriptionContextForSenderIdentity:](self, "subscriptionContextForSenderIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subscriptionContextForSenderIdentity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "accountUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ctSubscriptionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "labelID", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "isEqualToString:", v13);

        if (v14)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

@end
