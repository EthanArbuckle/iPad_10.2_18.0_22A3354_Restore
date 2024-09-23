@implementation ShortcutsViewController

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7NewsUI223ShortcutsViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1D6E1C874();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[ShortcutsViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_blueprintViewController));
  swift_release();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_selectionProvider);
  swift_release();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI223ShortcutsViewController_pluggableDelegate);
}

- (_TtC7NewsUI223ShortcutsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6D7A8B8();
}

- (_TtC7NewsUI223ShortcutsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI223ShortcutsViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI223ShortcutsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsUI223ShortcutsViewController *v2;

  v2 = self;
  sub_1D6D78574();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI223ShortcutsViewController *v2;

  v2 = self;
  sub_1D6D78B78();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1D6D78DE4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))MEMORY[0x1E0DB6960]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1D6D78DE4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (void (*)(id))MEMORY[0x1E0DB6930]);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[ShortcutsViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6D7A9A0();

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI223ShortcutsViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

@end
