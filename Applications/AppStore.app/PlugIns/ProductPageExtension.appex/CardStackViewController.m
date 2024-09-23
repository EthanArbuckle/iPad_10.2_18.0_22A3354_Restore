@implementation CardStackViewController

- (void)viewDidLoad
{
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController *v2;

  v2 = self;
  sub_1004F7D38();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1004F81F8();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4;
  _TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004F82D8(v4);

}

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController *)sub_1004F91F8(v5, v7, a4);
}

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  double v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController_cardStackView) = 0;
  v6 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController_delegate;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v7 = swift_unknownObjectWeakInit(v6, 0).n128_u64[0];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController_maximumNumberOfCards) = (Class)3;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[CardStackViewController initWithCoder:](&v9, "initWithCoder:", a3, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController_cardStackView));
  sub_100010D1C((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF8423CardStackViewController_delegate);
}

@end
