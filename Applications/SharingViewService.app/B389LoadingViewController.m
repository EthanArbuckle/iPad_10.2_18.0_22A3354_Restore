@implementation B389LoadingViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService25B389LoadingViewController *v4;

  v4 = self;
  sub_100016698(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for B389LoadingViewController();
  -[B389LoadingViewController viewDidDisappear:](&v4, "viewDidDisappear:", v3);
}

- (void)dismissPressed:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC18SharingViewService25B389LoadingViewController *v6;

  v4 = a3;
  v6 = self;
  sub_10001737C((uint64_t)v6, v5);

}

- (_TtC18SharingViewService25B389LoadingViewController)initWithMainController:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC18SharingViewService25B389LoadingViewController *v8;
  _TtC18SharingViewService25B389LoadingViewController *v9;
  objc_super v11;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_titleLabel) = 0;
  v5 = OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_connectingLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_spinner) = 0;
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_player) = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for B389LoadingViewController();
  v9 = -[SVSBaseViewController initWithMainController:](&v11, "initWithMainController:", v7);

  return v9;
}

- (_TtC18SharingViewService25B389LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18SharingViewService25B389LoadingViewController *)sub_100016F60(v5, v7, a4);
}

- (_TtC18SharingViewService25B389LoadingViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService25B389LoadingViewController *)sub_1000170B0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_connectingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389LoadingViewController_player));
}

@end
