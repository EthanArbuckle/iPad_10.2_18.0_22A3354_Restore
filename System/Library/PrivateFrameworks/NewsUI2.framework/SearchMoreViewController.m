@implementation SearchMoreViewController

- (_TtC7NewsUI224SearchMoreViewController)initWithCoder:(id)a3
{
  _TtC7NewsUI224SearchMoreViewController *result;

  result = (_TtC7NewsUI224SearchMoreViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI224SearchMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI224SearchMoreViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI224SearchMoreViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224SearchMoreViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224SearchMoreViewController_blueprintViewController));
  swift_unknownObjectRelease();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI224SearchMoreViewController *v2;

  v2 = self;
  sub_1D65361F4();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI224SearchMoreViewController *v2;

  v2 = self;
  sub_1D6536410();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI224SearchMoreViewController *v4;

  v4 = self;
  sub_1D6536700(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[SearchMoreViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  swift_getObjectType();
  sub_1D6E1DD44();

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
  -[SearchMoreViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6537238();

}

@end
