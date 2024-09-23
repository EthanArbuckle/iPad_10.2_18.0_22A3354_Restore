@implementation VSPrivacyService

- (VSPrivacyService)init
{
  VSPrivacyService *v2;
  void *v3;
  void *v4;
  VSPrivacyVoucherLockbox *v5;
  VSPrivacyFacade *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VSPrivacyService;
  v2 = -[VSServiceListener init](&v8, sel_init);
  if (v2)
  {
    v9[0] = CFSTR("com.apple.VideoSubscriberAccount.PrivacyService");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSServiceListener setEntitlementNames:](v2, "setEntitlementNames:", v3);

    VSPrivacyServiceInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSServiceListener setExportedInterface:](v2, "setExportedInterface:", v4);

    v5 = objc_alloc_init(VSPrivacyVoucherLockbox);
    v6 = -[VSPrivacyFacade initWithVoucherLockbox:]([VSPrivacyFacade alloc], "initWithVoucherLockbox:", v5);
    -[VSServiceListener setExportedObject:](v2, "setExportedObject:", v6);

  }
  return v2;
}

@end
