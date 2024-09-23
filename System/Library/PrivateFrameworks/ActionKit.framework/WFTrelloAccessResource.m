@implementation WFTrelloAccessResource

+ (id)userInterfaceProtocol
{
  return &unk_255DFC880;
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
  v5[0] = CFSTR("WFTrelloAccessResourceUserInterface");
  v5[1] = CFSTR("WFTrelloAccessResourceUserInterface");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.fogcreek.trello");
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
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
  v8[2] = __77__WFTrelloAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_24F8B8FC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "authorizeWithCompletionHandler:", v8);

}

void __77__WFTrelloAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "refreshAvailabilityWithForcedNotification");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
