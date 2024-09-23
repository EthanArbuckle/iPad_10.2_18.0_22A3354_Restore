@implementation AssetMovieViewController

- (void)viewDidLoad
{
  _TtC16ProductKitViewer24AssetMovieViewController *v2;

  v2 = self;
  sub_10000A618();

}

- (_TtC16ProductKitViewer24AssetMovieViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC16ProductKitViewer24AssetMovieViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
    *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) = 1;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) = 1;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for AssetMovieViewController();
  v11 = -[AssetMovieViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC16ProductKitViewer24AssetMovieViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AssetMovieViewController();
  return -[AssetMovieViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
