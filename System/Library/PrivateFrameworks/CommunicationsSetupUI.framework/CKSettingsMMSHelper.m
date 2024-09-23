@implementation CKSettingsMMSHelper

+ (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReadMMSDefaultFromCBEnabled");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ctSubscriptionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_3;
    if ((IMSharedHelperDeviceHasMultipleActiveSubscriptions() & 1) != 0)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ctSubscriptionInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subscriptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_24D094178, 0, 0);

      if (v13)
      {
        objc_msgSend(v13, "valueForKey:", CFSTR("MMSDefaultEnabled"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          v16 = objc_msgSend(v14, "BOOLValue");
        else
          v16 = 1;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
LABEL_9:
      v16 = 0;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

@end
