@implementation VSDeveloperService

- (VSDeveloperService)init
{
  VSDeveloperService *v2;
  void *v3;
  void *v4;
  VSDeveloperModeStore *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VSDeveloperService;
  v2 = -[VSServiceListener init](&v7, sel_init);
  if (v2)
  {
    v8[0] = CFSTR("com.apple.VideoSubscriberAccount.DeveloperService");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSServiceListener setEntitlementNames:](v2, "setEntitlementNames:", v3);

    VSDeveloperServiceInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSServiceListener setExportedInterface:](v2, "setExportedInterface:", v4);

    v5 = objc_alloc_init(VSDeveloperModeStore);
    -[VSServiceListener setExportedObject:](v2, "setExportedObject:", v5);

  }
  return v2;
}

@end
