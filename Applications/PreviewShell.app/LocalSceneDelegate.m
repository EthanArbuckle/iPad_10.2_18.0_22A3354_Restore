@implementation LocalSceneDelegate

- (_TtC12PreviewShell18LocalSceneDelegate)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[SceneDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC12PreviewShell18LocalSceneDelegate_previewShellScene));
}

@end
