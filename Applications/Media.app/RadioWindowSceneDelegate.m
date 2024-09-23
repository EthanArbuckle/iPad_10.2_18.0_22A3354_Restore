@implementation RadioWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Media24RadioWindowSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100024420(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _TtC5Media24RadioWindowSceneDelegate *v10;
  id v11;
  id v12;
  uint64_t v13;

  v5 = objc_opt_self(UIWindowScene);
  v6 = swift_dynamicCastObjCClass(a3, v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_opt_self(UIApplication);
    v9 = a3;
    v10 = self;
    v11 = objc_msgSend(v8, "sharedApplication");
    v12 = objc_msgSend(v11, "delegate");

    if (v12)
    {
      v13 = type metadata accessor for AppDelegate(0);
      swift_dynamicCastClassUnconditional(v12, v13, 0, 0, 0);
      sub_100071E58(v7);

      swift_unknownObjectRelease(v12);
    }
    else
    {
      __break(1u);
    }
  }
}

- (_TtC5Media24RadioWindowSceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioWindowSceneDelegate();
  return -[RadioWindowSceneDelegate init](&v3, "init");
}

@end
