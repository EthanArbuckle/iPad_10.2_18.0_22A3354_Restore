@implementation MPAVOutputDeviceRoutingDataSourceAccessibility

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPAVOutputDeviceRoutingDataSource");
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVOutputDeviceRoutingDataSource"), CFSTR("setPickedRoute:withPassword:completion:"), "v", "@", "@", "@?", 0);
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFNotificationName *v12;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v12 = (CFNotificationName *)getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0;
  v18 = getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0;
  if (!getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke;
    v14[3] = &unk_24FED6130;
    v14[4] = &v15;
    __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke((uint64_t)v14);
    v12 = (CFNotificationName *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v12)
    -[MPAVOutputDeviceRoutingDataSourceAccessibility setPickedRoute:withPassword:completion:].cold.1();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, *v12, 0, 0, 1u);
  v13.receiver = self;
  v13.super_class = (Class)MPAVOutputDeviceRoutingDataSourceAccessibility;
  -[MPAVOutputDeviceRoutingDataSourceAccessibility setPickedRoute:withPassword:completion:](&v13, sel_setPickedRoute_withPassword_completion_, v8, v9, v10);

}

- (void)setPickedRoute:withPassword:completion:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAXSpringBoardUserChangedAudioRouteNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MPAVRoutingControllerAccessibility.m"), 13, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
