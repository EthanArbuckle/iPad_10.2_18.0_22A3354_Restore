@implementation IMBWebViewController

- (_TtC8Business20IMBWebViewController)initWithCallbackURI:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC8Business20IMBWebViewController *)sub_10007378C(v3, v4);
}

- (_TtC8Business20IMBWebViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100074F2C();
}

- (void)loadURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC8Business20IMBWebViewController *v10;
  NSURL *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  objc_super v15;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for IMBWebViewController();
  v15.receiver = v10;
  v15.super_class = v14;
  -[IMBWebViewController loadURL:](&v15, "loadURL:", v13);

  sub_1000739B8();
  -[IMBWebViewController updateNavigationBar](v10, "updateNavigationBar");

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)setupSubviews
{
  _TtC8Business20IMBWebViewController *v2;

  v2 = self;
  sub_100073C18();

}

- (void)setupConstraints
{
  _TtC8Business20IMBWebViewController *v2;

  v2 = self;
  sub_100073E90();

}

- (void)updateNavigationBar
{
  _TtC8Business20IMBWebViewController *v2;

  v2 = self;
  sub_100074B90();

}

- (_TtC8Business20IMBWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business20IMBWebViewController *result;

  v4 = a4;
  result = (_TtC8Business20IMBWebViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBWebViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC8Business20IMBWebViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100075000(v6);

}

@end
