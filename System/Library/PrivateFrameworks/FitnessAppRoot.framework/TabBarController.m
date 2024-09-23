@implementation TabBarController

- (int64_t)selectedIndex
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TabBarController selectedIndex](&v3, sel_selectedIndex);
}

- (void)setSelectedIndex:(int64_t)a3
{
  _BYTE *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TabBarController setSelectedIndex:](&v5, sel_setSelectedIndex_, a3);
  v4[OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout] = 1;

}

- (_TtC14FitnessAppRoot16TabBarController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC14FitnessAppRoot16TabBarController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_needsSegmentedControlLayout) = 0;
  v5 = OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_topConstraint;
  v6 = objc_allocWithZone(MEMORY[0x24BDD1628]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  swift_unknownObjectWeakInit();

  result = (_TtC14FitnessAppRoot16TabBarController *)sub_23BCD84AC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC14FitnessAppRoot16TabBarController *v2;

  v2 = self;
  TabBarController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  _TtC14FitnessAppRoot16TabBarController *v2;

  v2 = self;
  TabBarController.viewWillLayoutSubviews()();

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  void *v5;
  _TtC14FitnessAppRoot16TabBarController *v7;
  Swift::Bool v8;
  Swift::OpaquePointer_optional v9;

  v5 = a3;
  if (a3)
  {
    sub_23BCA3724(0, qword_256A94FD0);
    v5 = (void *)sub_23BCD81B8();
  }
  v7 = self;
  v9.value._rawValue = v5;
  v9.is_nil = a4;
  TabBarController.setViewControllers(_:animated:)(v9, v8);

  swift_bridgeObjectRelease();
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  id v7;
  _TtC14FitnessAppRoot16TabBarController *v8;

  v7 = a3;
  v8 = self;
  TabBarController._setSelectedViewController(_:performUpdates:)((UIViewController_optional *)a3, a4);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[TabBarController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, v4);
  sub_23BCB8138();

}

- (_TtC14FitnessAppRoot16TabBarController)initWithTabs:(id)a3
{
  _TtC14FitnessAppRoot16TabBarController *result;

  result = (_TtC14FitnessAppRoot16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14FitnessAppRoot16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14FitnessAppRoot16TabBarController *result;

  v4 = a4;
  result = (_TtC14FitnessAppRoot16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_floatingTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot16TabBarController_topConstraint));
  swift_unknownObjectWeakDestroy();
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  _TtC14FitnessAppRoot16TabBarController *v4;
  _TtC14FitnessAppRoot16TabBarController *v5;
  _TtC14FitnessAppRoot16TabBarController *v6;
  void *v7;
  _TtC14FitnessAppRoot16TabBarController *v8;
  _TtC14FitnessAppRoot16TabBarController *v9;

  v4 = self;
  v5 = (_TtC14FitnessAppRoot16TabBarController *)a3;
  v6 = (_TtC14FitnessAppRoot16TabBarController *)-[TabBarController selectedViewController](v4, sel_selectedViewController);
  if (v6)
  {
    v9 = v6;
    objc_opt_self();
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7)
    {
      v8 = (_TtC14FitnessAppRoot16TabBarController *)objc_msgSend(v7, sel_topViewController);

      v5 = v4;
      v4 = v8;
    }

    v5 = v4;
  }
  else
  {
    v9 = v4;
  }

}

@end
