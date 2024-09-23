@implementation SearchHomeViewController

- (_TtC7NewsUI224SearchHomeViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC7NewsUI224SearchHomeViewController *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI224SearchHomeViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7NewsUI224SearchHomeViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI224SearchHomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI224SearchHomeViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI224SearchHomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI224SearchHomeViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224SearchHomeViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224SearchHomeViewController_blueprintViewController));
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  _TtC7NewsUI224SearchHomeViewController *v2;

  v2 = self;
  sub_1D6CD6E24();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[SearchHomeViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI224SearchHomeViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
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
  -[SearchHomeViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6CD7E4C();

}

- (id)contentScrollView
{
  _TtC7NewsUI224SearchHomeViewController *v2;
  void *v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (void *)sub_1D6E1E224();

  swift_release();
  return v3;
}

@end
