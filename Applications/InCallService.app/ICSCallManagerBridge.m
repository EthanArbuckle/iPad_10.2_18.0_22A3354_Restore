@implementation ICSCallManagerBridge

- (TUCall)presentedFullScreenedCall
{
  ICSCallManagerBridge *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10019F1B0();
  v4 = v3;

  return (TUCall *)v4;
}

- (BOOL)ignoreUpdates
{
  return sub_10019F308() & 1;
}

- (void)setIgnoreUpdates:(BOOL)a3
{
  sub_10019F33C(a3);
}

- (BOOL)isInBackground
{
  ICSCallManagerBridge *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10019F37C();
  v4 = v3;

  return v4 & 1;
}

- (void)setIsInBackground:(BOOL)a3
{
  _BOOL8 v3;
  ICSCallManagerBridge *v4;

  v3 = a3;
  v4 = self;
  sub_10019F3FC(v3);

}

- (PHAudioCallViewController)audioCallViewController
{
  ICSCallManagerBridge *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10019F468();
  v4 = v3;

  return (PHAudioCallViewController *)v4;
}

- (UINavigationController)audioCallNavController
{
  ICSCallManagerBridge *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10019F56C();
  v4 = v3;

  return (UINavigationController *)v4;
}

- (ICSCallManagerBridge)initWithRootController:(id)a3 callDisplayStyleManager:(id)a4 flags:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  return (ICSCallManagerBridge *)sub_10019F5E8();
}

- (void)updateWithCall:(id)a3
{
  id v4;
  ICSCallManagerBridge *v5;

  v4 = a3;
  v5 = self;
  sub_10019FC1C(v4);

}

- (void)prioritizeCall:(id)a3
{
  id v4;
  ICSCallManagerBridge *v5;

  v4 = a3;
  v5 = self;
  sub_10019FDF8(v4);

}

- (void)cleanUp
{
  ICSCallManagerBridge *v2;

  v2 = self;
  sub_10019FEAC();

}

- (void)createAudioCallViewController
{
  ICSCallManagerBridge *v2;

  v2 = self;
  sub_1001A1718();

}

- (ICSCallManagerBridge)init
{
  sub_1001A321C();
}

- (void).cxx_destruct
{

  sub_100123A08((uint64_t)self + OBJC_IVAR___ICSCallManagerBridge_inCallRootViewController);
  sub_1001A3CD8((uint64_t)self + OBJC_IVAR___ICSCallManagerBridge_stream, &qword_1002DC288);
  sub_1001A3CD8((uint64_t)self + OBJC_IVAR___ICSCallManagerBridge_continuation, &qword_1002DC268);
  sub_1001A3F54(OBJC_IVAR___ICSCallManagerBridge_callManager);
  sub_1001A3F54(OBJC_IVAR___ICSCallManagerBridge_calls);
  sub_1001A3F54(OBJC_IVAR___ICSCallManagerBridge_jindoActivity);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICSCallManagerBridge_warmedAudioCallNavController);
}

@end
