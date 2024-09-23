@implementation WFPinboardAccessResource

+ (id)pinboardUsername
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFPinboardUsername"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pinboardPassword
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "pinboardUsername");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    WFPinboardGetSecretForUsername(v2, (uint64_t)CFSTR("password"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pinboardToken
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "pinboardUsername");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    WFPinboardGetSecretForUsername(v2, (uint64_t)CFSTR("token"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFCB80;
}

+ (id)userInterfaceClasses
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE19938];
  v4[0] = *MEMORY[0x24BE19950];
  v4[1] = v2;
  v5[0] = CFSTR("WFPinboardAccessResourceUserInterface");
  v5[1] = CFSTR("WFPinboardAccessResourceUserInterface");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)name
{
  return WFLocalizedString(CFSTR("Pinboard"));
}

- (id)icon
{
  return (id)objc_msgSend(MEMORY[0x24BEC14E0], "workflowKitImageNamed:", CFSTR("Pinboard"));
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Pinboard account"), CFSTR("your Pinboard account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "pinboardUsername");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "pinboardPassword");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v5 = 4;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend((id)objc_opt_class(), "pinboardToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    v5 = 4;
  else
    v5 = 1;

  if (v4)
    goto LABEL_8;
LABEL_9:

  return v5;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__WFPinboardAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8FC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "authorizeWithCompletionHandler:", v8);

}

- (id)resourceName
{
  return CFSTR("Pinboard");
}

- (id)username
{
  return (id)objc_msgSend((id)objc_opt_class(), "pinboardUsername");
}

- (BOOL)canLogOut
{
  return 1;
}

- (void)logOut
{
  void *v3;
  id v4;

  -[WFPinboardAccessResource username](self, "username");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("WFPinboardUsername"));

  WFPinboardStoreSecretForUsername(v4, 0, (uint64_t)CFSTR("password"));
  WFPinboardStoreSecretForUsername(v4, 0, (uint64_t)CFSTR("token"));
  -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");

}

void __79__WFPinboardAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "refreshAvailabilityWithForcedNotification");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
