@implementation CardStackViewController

- (void)viewDidLoad
{
  _TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController *v2;

  v2 = self;
  sub_1002FE26C();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1002FE72C();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4;
  _TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002FE81C(v4);

}

- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController *)sub_1002FF73C(v5, v7, a4);
}

- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  double v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_cardStackView) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_delegate;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v7 = swift_unknownObjectWeakInit(v6, 0).n128_u64[0];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_maximumNumberOfCards) = (Class)3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[CardStackViewController initWithCoder:](&v9, "initWithCoder:", a3, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_cardStackView));
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F23CardStackViewController_delegate);
}

@end
