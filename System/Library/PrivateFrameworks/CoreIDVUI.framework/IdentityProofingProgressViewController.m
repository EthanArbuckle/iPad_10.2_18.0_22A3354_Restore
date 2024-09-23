@implementation IdentityProofingProgressViewController

- (_TtC9CoreIDVUI38IdentityProofingProgressViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213FB6E10();
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI38IdentityProofingProgressViewController *v2;

  v2 = self;
  sub_213FB3B18();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityProofingProgressViewController();
  v4 = v7.receiver;
  -[IdentityProofingProgressViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationItem, v7.receiver, v7.super_class);
  objc_msgSend(v5, sel_setHidesBackButton_animated_, 1, 0);

  v6 = objc_msgSend(v4, sel_navigationItem);
  objc_msgSend(v6, sel_setLeftBarButtonItem_, 0);

  sub_213FB5814();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9CoreIDVUI38IdentityProofingProgressViewController *v4;

  v4 = self;
  sub_213FB3D38(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC9CoreIDVUI38IdentityProofingProgressViewController *v2;

  v2 = self;
  sub_213FB4A80();

}

- (void)updateUI
{
  _TtC9CoreIDVUI38IdentityProofingProgressViewController *v2;

  v2 = self;
  sub_213FB5608();

}

- (void)updateViews
{
  _TtC9CoreIDVUI38IdentityProofingProgressViewController *v2;

  v2 = self;
  sub_213FB5814();

}

- (_TtC9CoreIDVUI38IdentityProofingProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI38IdentityProofingProgressViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI38IdentityProofingProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_config));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI38IdentityProofingProgressViewController_imageView));
}

@end
