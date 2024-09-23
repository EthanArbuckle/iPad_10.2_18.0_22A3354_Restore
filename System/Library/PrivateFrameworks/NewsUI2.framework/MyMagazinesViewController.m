@implementation MyMagazinesViewController

- (_TtC7NewsUI225MyMagazinesViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  _TtC7NewsUI225MyMagazinesViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_isBeingUsedAsPlugin) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_lastComputedSize);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_eventManager;
  sub_1D68BAF78();
  swift_allocObject();
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_1D6E19EC8();

  result = (_TtC7NewsUI225MyMagazinesViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI225MyMagazinesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI225MyMagazinesViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI225MyMagazinesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_blueprintViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI225MyMagazinesViewController_offlineAlertControllerFactory);
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI225MyMagazinesViewController *v2;

  v2 = self;
  sub_1D68B91D0();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1D68B9580(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1D68B9580(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_);
}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI225MyMagazinesViewController *v2;

  v2 = self;
  sub_1D68B95F8();

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
  -[MyMagazinesViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D68BADCC();

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC7NewsUI225MyMagazinesViewController *v3;

  v3 = self;
  sub_1D6E1E9D4();

}

- (void)deselect
{
  _TtC7NewsUI225MyMagazinesViewController *v2;
  id v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);

}

@end
