@implementation FollowingDislikedViewController

- (_TtC7NewsUI231FollowingDislikedViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7NewsUI231FollowingDislikedViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI231FollowingDislikedViewController_prewarm) = (Class)1;
  v4 = a3;

  result = (_TtC7NewsUI231FollowingDislikedViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231FollowingDislikedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI231FollowingDislikedViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI231FollowingDislikedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231FollowingDislikedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231FollowingDislikedViewController_blueprintViewController));
  sub_1D65E6260(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7NewsUI231FollowingDislikedViewController_prewarm));
}

- (void)viewDidLoad
{
  _TtC7NewsUI231FollowingDislikedViewController *v2;

  v2 = self;
  sub_1D6E0EB4C();

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
  -[FollowingDislikedViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI231FollowingDislikedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)viewWillAppear:(BOOL)a3
{
  sub_1D6E0EF6C(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1D6E0EF6C(self, (uint64_t)a2, a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI231FollowingDislikedViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D6E0EFB8((uint64_t)a3);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  -[FollowingDislikedViewController setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
  sub_1D6E1E9B0();

}

@end
