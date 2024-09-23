@implementation MessagesSearchViewController

- (void)viewDidLoad
{
  char *v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MessagesSearchViewController(0);
  v2 = (char *)v5.receiver;
  -[SearchViewController viewDidLoad](&v5, "viewDidLoad");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8AppStore20SearchViewController_searchController], "setObscuresBackgroundDuringPresentation:", 0, v5.receiver, v5.super_class);
  v3 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v4, "setHidesBackButton:", 1);

}

- (void)viewWillLayoutSubviews
{
  _TtC8AppStore28MessagesSearchViewController *v2;

  v2 = self;
  sub_1004C8AE8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  __n128 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MessagesSearchViewController(0);
  v4 = v6.receiver;
  -[SearchViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  type metadata accessor for MetricsActivity(0);
  static MetricsActivity.current.getter(v5);
  dispatch thunk of MetricsActivity.changeContext(_:)(0x686372616553);

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  __n128 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MessagesSearchViewController(0);
  v4 = v6.receiver;
  -[MessagesSearchViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  type metadata accessor for MetricsActivity(0);
  static MetricsActivity.current.getter(v5);
  dispatch thunk of MetricsActivity.changeContext(_:)(0x6465727574616546);

  swift_release();
}

@end
