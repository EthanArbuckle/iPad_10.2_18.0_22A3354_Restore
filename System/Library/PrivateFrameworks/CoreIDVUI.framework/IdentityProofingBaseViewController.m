@implementation IdentityProofingBaseViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingBaseViewController();
  v2 = v3.receiver;
  -[IdentityProofingBaseViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_213FA1578();

}

- (_TtC9CoreIDVUI34IdentityProofingBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_213FF9458();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9CoreIDVUI34IdentityProofingBaseViewController *)sub_213FA20C8(v5, v7, a4);
}

- (_TtC9CoreIDVUI34IdentityProofingBaseViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI34IdentityProofingBaseViewController *)sub_213FA21DC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController_bottomTrayBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI34IdentityProofingBaseViewController____lazy_storage___bottomTray));
}

@end
