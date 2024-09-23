@implementation CardStackViewController

- (void)viewDidLoad
{
  _TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController *v2;

  v2 = self;
  sub_1005C53F0();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1005C58B0();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4;
  _TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005C5998(v4);

}

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController *)sub_1005C68B8(v5, v7, a4);
}

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  double v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_cardStackView) = 0;
  v6 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_delegate;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v7 = swift_unknownObjectWeakInit(v6, 0).n128_u64[0];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_maximumNumberOfCards) = (Class)3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[CardStackViewController initWithCoder:](&v9, "initWithCoder:", a3, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_cardStackView));
  sub_100010E34((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_delegate);
}

@end
