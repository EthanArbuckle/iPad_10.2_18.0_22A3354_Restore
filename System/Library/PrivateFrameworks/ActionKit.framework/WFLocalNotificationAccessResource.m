@implementation WFLocalNotificationAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

+ (void)requestLocalNotificationsAuthorizationWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF88B8], "workflowNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __97__WFLocalNotificationAccessResource_requestLocalNotificationsAuthorizationWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F8B4CD0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestAuthorizationWithOptions:completionHandler:", 6, v6);

}

uint64_t __97__WFLocalNotificationAccessResource_requestLocalNotificationsAuthorizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Notifications"));
}

- (id)icon
{
  return (id)objc_msgSend(MEMORY[0x24BEC14E0], "workflowKitImageNamed:", CFSTR("Notification"));
}

- (unint64_t)status
{
  return 4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8FC0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "requestLocalNotificationsAuthorizationWithCompletionHandler:", v8);

}

void __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  v8[3] = &unk_24F8B3990;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __86__WFLocalNotificationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
