@implementation AudioTemplateSceneDelegate

- (_TtC7NewsUI226AudioTemplateSceneDelegate)init
{
  objc_class *ObjectType;
  char *v4;
  _QWORD *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___resolver;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___container) = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___commandCenter);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate_interfaceController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate_audioTemplateController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[AudioTemplateSceneDelegate init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_1D65FBCD4((uint64_t)self + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___resolver);
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate_interfaceController));
  swift_release();
}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI226AudioTemplateSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D65FB674(v7);

}

- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI226AudioTemplateSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D65FBB68();

}

@end
