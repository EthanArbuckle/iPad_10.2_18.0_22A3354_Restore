@implementation FollowingNotificationsViewController

- (_TtC7NewsUI236FollowingNotificationsViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI236FollowingNotificationsViewController *result;

  v5 = OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintReadableContentGuide;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC39A0]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI236FollowingNotificationsViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI236FollowingNotificationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI236FollowingNotificationsViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI236FollowingNotificationsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintReadableContentGuide));
  sub_1D5FDD028((uint64_t)self + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_followingNotificationsPrewarm);
}

- (void)viewDidLoad
{
  _TtC7NewsUI236FollowingNotificationsViewController *v2;

  v2 = self;
  sub_1D60DC0AC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[FollowingNotificationsViewController viewWillAppear:](&v4, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI236FollowingNotificationsViewController *v4;

  v4 = self;
  sub_1D60DC408(a3);

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
  -[FollowingNotificationsViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  id v5;
  _TtC7NewsUI236FollowingNotificationsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D60DC84C((uint64_t)a3);

}

@end
