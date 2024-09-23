@implementation MOSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MomentsUIService15MOSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  MOSceneDelegate.scene(_:willConnectTo:options:)((UIScene)v8, (UISceneSession)v9, (UISceneConnectionOptions)v10);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC16MomentsUIService15MOSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  MOSceneDelegate.sceneDidDisconnect(_:)((UIScene)v4);

}

- (_TtC16MomentsUIService15MOSceneDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MomentsUIService15MOSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[MOSceneDelegate init](&v5, "init");
}

- (void).cxx_destruct
{

}

@end
