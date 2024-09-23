@implementation ProximityCardSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI26ProximityCardSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100013E20(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  void *v4;
  id v5;
  _TtC13MediaRemoteUI26ProximityCardSceneDelegate *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = 0;
  v5 = a3;
  v6 = self;

  v7 = *(Class *)((char *)&v6->super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController) = 0;

}

- (void)proxCardFlowDidDismiss
{
  void *v2;
  _TtC13MediaRemoteUI26ProximityCardSceneDelegate *v3;
  _TtC13MediaRemoteUI26ProximityCardSceneDelegate *v4;
  uint64_t v5;
  void *v6;
  _TtC13MediaRemoteUI26ProximityCardSceneDelegate *v7;
  _TtC13MediaRemoteUI26ProximityCardSceneDelegate *v8;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
  if (v2)
  {
    v3 = self;
    v4 = (_TtC13MediaRemoteUI26ProximityCardSceneDelegate *)objc_msgSend(v2, "windowScene");
    if (v4)
    {
      v8 = v4;
      v5 = objc_opt_self(SBSUIRemoteAlertScene);
      v6 = (void *)swift_dynamicCastObjCClass(v8, v5);
      if (v6)
        objc_msgSend(v6, "invalidate");

      v7 = v8;
    }
    else
    {
      v7 = v3;
    }

  }
}

- (_TtC13MediaRemoteUI26ProximityCardSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProximityCardSceneDelegate();
  return -[ProximityCardSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController));
}

@end
