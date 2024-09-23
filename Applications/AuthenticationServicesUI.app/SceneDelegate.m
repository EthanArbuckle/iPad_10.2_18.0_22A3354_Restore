@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC24AuthenticationServicesUI13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100006A4C(v8, v10);

}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC24AuthenticationServicesUI13SceneDelegate *v17;
  uint64_t v18;
  Class isa;

  v11 = sub_100007A58(0, &qword_100011BD0, BSAction_ptr);
  v12 = sub_100007990(&qword_100011BD8, &qword_100011BD0, BSAction_ptr);
  v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = self;
  v18 = sub_100006CCC(v13, v15);

  swift_bridgeObjectRelease(v13);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  return isa;
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC24AuthenticationServicesUI13SceneDelegate *v11;

  v7 = sub_100007A58(0, &qword_100011BB8, UIOpenURLContext_ptr);
  v8 = sub_100007990(&qword_100011BC0, &qword_100011BB8, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_100007748(v9);

  swift_bridgeObjectRelease(v9);
}

- (_TtC24AuthenticationServicesUI13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_windows) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_windows));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController));
}

@end
