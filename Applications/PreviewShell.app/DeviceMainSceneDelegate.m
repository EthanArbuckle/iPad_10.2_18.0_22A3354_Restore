@implementation DeviceMainSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (_TtC12PreviewShell23DeviceMainSceneDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[SceneDelegate init](&v5, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_mainViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12PreviewShell23DeviceMainSceneDelegate_previewShellScene));
}

@end
