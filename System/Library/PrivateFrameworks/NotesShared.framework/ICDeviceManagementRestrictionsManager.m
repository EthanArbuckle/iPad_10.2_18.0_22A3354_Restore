@implementation ICDeviceManagementRestrictionsManager

- (void)dealloc
{
  ICDeviceManagementRestrictionsManager *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = sub_1BDB4EB98();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_unregisterObserver_, v2);

  }
  v5.receiver = v2;
  v5.super_class = (Class)ICDeviceManagementRestrictionsManager;
  -[ICDeviceManagementRestrictionsManager dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1BDB4F424(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR___ICDeviceManagementRestrictionsManager____lazy_storage___connection));
}

+ (ICDeviceManagementRestrictionsManager)sharedManager
{
  if (qword_1ED23AEE8 != -1)
    swift_once();
  return (ICDeviceManagementRestrictionsManager *)(id)qword_1ED23B070;
}

- (void)registerObserver
{
  id v2;
  void *v3;
  ICDeviceManagementRestrictionsManager *v4;

  v4 = self;
  v2 = sub_1BDB4EB98();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_registerObserver_, v4);

  }
  -[ICDeviceManagementRestrictionsManager updateRestrictions](v4, sel_updateRestrictions);

}

- (void)updateRestrictions
{
  ICDeviceManagementRestrictionsManager *v2;

  v2 = self;
  ICDeviceManagementRestrictionsManager.updateRestrictions()();

}

- (BOOL)isMathPaperSolvingAllowed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMathPaperSolvingAllowed:(BOOL)a3
{
  sub_1BDB4F020((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ICDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, "Device restriction for Math Paper solving did change {allowed: %{BOOL}d}");
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3
{
  sub_1BDB4F020((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ICDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, "Device restriction for keyboard math solving did change {allowed: %{BOOL}d}");
}

- (ICDeviceManagementRestrictionsManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICDeviceManagementRestrictionsManager____lazy_storage___connection) = (Class)1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed) = 1;
  v3.receiver = self;
  v3.super_class = (Class)ICDeviceManagementRestrictionsManager;
  return -[ICDeviceManagementRestrictionsManager init](&v3, sel_init);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  ICDeviceManagementRestrictionsManager *v7;

  if (a4)
    sub_1BDBFD5C0();
  v6 = a3;
  v7 = self;
  -[ICDeviceManagementRestrictionsManager updateRestrictions](v7, sel_updateRestrictions);

  swift_bridgeObjectRelease();
}

@end
