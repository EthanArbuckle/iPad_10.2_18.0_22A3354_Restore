@implementation MainTabBarController

- (_TtC7NewsUI220MainTabBarController)initWithCoder:(id)a3
{
  _TtC7NewsUI220MainTabBarController *result;

  result = (_TtC7NewsUI220MainTabBarController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7NewsUI220MainTabBarController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1D6E1C874();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[MainTabBarController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MainTabBarController_styler);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI220MainTabBarController *v2;

  v2 = self;
  sub_1D601AE54();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v10.receiver;
  -[MainTabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = *(_QWORD *)&v7[OBJC_IVAR____TtC7NewsUI220MainTabBarController_eventHandler + 8];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(ObjectType, v8);
  swift_unknownObjectRelease();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1D601B2FC(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))MEMORY[0x1E0DB6960]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1D601B2FC(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (void (*)(id))MEMORY[0x1E0DB6930]);
}

- (void)accessibilityReduceTransparencyDidChange
{
  _TtC7NewsUI220MainTabBarController *v3;
  id v4;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI220MainTabBarController_styler), *(uint64_t *)((char *)&self->super.super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7NewsUI220MainTabBarController_styler));
  v3 = self;
  v4 = -[MainTabBarController tabBar](v3, sel_tabBar);
  sub_1D6E1D780();

}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI220MainTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D601B444((uint64_t)v6, v7);

}

@end
