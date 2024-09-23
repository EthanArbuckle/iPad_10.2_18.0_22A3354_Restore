@implementation IMBJITAppKitErrorViewController

- (void)viewDidLoad
{
  _TtC8Business31IMBJITAppKitErrorViewController *v2;

  v2 = self;
  sub_10007CB8C();

}

- (_TtC8Business31IMBJITAppKitErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSString v10;
  char *v11;
  id v12;
  _TtC8Business31IMBJITAppKitErrorViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate;
    *((_QWORD *)v8 + 1) = 0;
    swift_unknownObjectWeakInit(v8, 0);
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = (char *)self + OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate;
    *((_QWORD *)v11 + 1) = 0;
    swift_unknownObjectWeakInit(v11, 0);
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for IMBJITAppKitErrorViewController();
  v13 = -[IMBJITAppKitErrorViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC8Business31IMBJITAppKitErrorViewController)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IMBJITAppKitErrorViewController();
  return -[IMBJITAppKitErrorViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate);
}

@end
