@implementation RemoteViewController

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC16EventViewService20RemoteViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10014DC30, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_1000364FC;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100035080(a3, v6, v7);
  sub_100007604((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(const void *);
  void (**v7)(const void *);
  void (*v8)(const void *);
  id v9;
  _TtC16EventViewService20RemoteViewController *v10;

  v6 = (void (**)(const void *))_Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = v6[2];
    v9 = a3;
    v10 = self;
    v8(v7);
    _Block_release(v7);

  }
  else
  {
    __break(1u);
  }
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC16EventViewService20RemoteViewController *v8;

  if (a3)
  {
    v5 = sub_1000363A0(0, &qword_10015EAB8, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_1000363D8();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000358B0(v7);

  swift_bridgeObjectRelease(v7);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC16EventViewService20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC16EventViewService20RemoteViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RemoteViewController();
  v11 = -[RemoteViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC16EventViewService20RemoteViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteViewController();
  return -[RemoteViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
