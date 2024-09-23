@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void (*v8)(char *, uint64_t);
  id v9;
  id v10;
  _TtC20PeopleMessageService13SceneDelegate *v11;

  v8 = (void (*)(char *, uint64_t))a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100008538(v8, v10);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC20PeopleMessageService13SceneDelegate *v11;

  v7 = sub_100006E20();
  v8 = sub_100006754(&qword_100019A50, (uint64_t (*)(uint64_t))sub_100006E20, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_1000075B0(v9);

  swift_bridgeObjectRelease(v9);
}

- (_TtC20PeopleMessageService13SceneDelegate)init
{
  return (_TtC20PeopleMessageService13SceneDelegate *)sub_100006CB8();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer));
}

@end
