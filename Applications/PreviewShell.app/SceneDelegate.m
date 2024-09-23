@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12PreviewShell13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10003696C(v8, v9);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC12PreviewShell13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000335E0((uint64_t)v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC12PreviewShell13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100033974((uint64_t)v4);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC12PreviewShell13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100033C78((uint64_t)v4);

}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC12PreviewShell13SceneDelegate *v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  sub_100037644(a4, a7);

}

- (_TtC12PreviewShell13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_windowScene) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell13SceneDelegate_previewSceneSettings));
}

@end
