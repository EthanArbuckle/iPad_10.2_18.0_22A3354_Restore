@implementation BuddyCameraButtonController

- (_TtC5Setup27BuddyCameraButtonController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_deviceProvider) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_delegate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_cachedViewController) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController____lazy_storage___cachedWrapper) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyCameraButtonController();
  return -[BuddyCameraButtonController init](&v3, "init");
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences));
}

- (void)setBuddyPreferences:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences) = (Class)a3;
  v3 = a3;

}

- (BYDeviceProvider)deviceProvider
{
  return (BYDeviceProvider *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_deviceProvider), a2);
}

- (void)setDeviceProvider:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_deviceProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_deviceProvider) = (Class)a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_delegate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_delegate) = (Class)a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kCCSkipKeyCameraButton);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup27BuddyCameraButtonController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10000E484();

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void *v4;
  _TtC5Setup27BuddyCameraButtonController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000EE48((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (id)viewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_cachedViewController));
}

- (BOOL)hasBlackBackground
{
  return 1;
}

- (void)controllerWasPopped
{
  void *v2;
  _TtC5Setup27BuddyCameraButtonController *v3;
  id v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "removeObjectForKey:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)cameraButtonViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC5Setup27BuddyCameraButtonController *v5;

  v4 = a3;
  v5 = self;
  sub_10000EFF0();

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_deviceProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_delegate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_cachedViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController____lazy_storage___cachedWrapper));
}

@end
