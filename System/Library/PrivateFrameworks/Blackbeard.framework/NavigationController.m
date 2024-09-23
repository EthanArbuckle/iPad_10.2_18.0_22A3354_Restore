@implementation NavigationController

- (_TtC10Blackbeard20NavigationController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10Blackbeard20NavigationController_pictureInPictureSurrogate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10Blackbeard20NavigationController_palette) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[NavigationController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC10Blackbeard20NavigationController)initWithCoder:(id)a3
{
  id v5;
  _TtC10Blackbeard20NavigationController *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10Blackbeard20NavigationController_pictureInPictureSurrogate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10Blackbeard20NavigationController_palette) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController) = 0;
  v5 = a3;

  result = (_TtC10Blackbeard20NavigationController *)sub_23732087C();
  __break(1u);
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v9.receiver;
  -[NavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController];
  if (v8)
    objc_msgSend(v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height, v9.receiver, v9.super_class);
  swift_unknownObjectRelease();

}

- (_TtC10Blackbeard20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC10Blackbeard20NavigationController *result;

  result = (_TtC10Blackbeard20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10Blackbeard20NavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC10Blackbeard20NavigationController *result;

  v3 = a3;
  result = (_TtC10Blackbeard20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10Blackbeard20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10Blackbeard20NavigationController *result;

  v4 = a4;
  result = (_TtC10Blackbeard20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236EA954C((uint64_t)self + OBJC_IVAR____TtC10Blackbeard20NavigationController_pictureInPictureSurrogate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard20NavigationController_palette));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard20NavigationController_paletteViewController));
}

@end
