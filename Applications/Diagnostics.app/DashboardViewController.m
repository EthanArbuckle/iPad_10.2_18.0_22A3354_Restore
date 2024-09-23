@implementation DashboardViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DashboardViewController();
  v2 = v3.receiver;
  -[BaseTableViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10005DE28();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11Diagnostics23DashboardViewController *v4;

  v4 = self;
  sub_10005D478(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11Diagnostics23DashboardViewController *v4;

  v4 = self;
  sub_10005EEEC(a3);

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC11Diagnostics23DashboardViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_100060508(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC11Diagnostics23DashboardViewController *v7;
  _BYTE *v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10005F32C(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC11Diagnostics23DashboardViewController *v7;
  DARootViewController *v8;
  DARootViewController *v9;
  id v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE *v16;
  double v17;
  double v18;

  v6 = a3;
  v7 = self;
  sub_10005F144(a4);
  v9 = v8;
  swift_bridgeObjectRelease(v8, (SEL)v8, v10, v11, v12, v13, v14, v15);
  if (v9)
  {
    v16 = sub_10005F32C(a4);
    objc_msgSend(v16, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v18 = v17;

  }
  else
  {

    return 2.22507386e-308;
  }
  return v18;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  id v8;
  _TtC11Diagnostics23DashboardViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1000605DC(v8);

}

- (void)barButtonItemTappedWithSender:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _TtC11Diagnostics23DashboardViewController *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v12 = self;
  if (objc_msgSend(v4, "style") == (id)2)
    sub_100098BDC(4u, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  else
    sub_100066B64(0);

}

- (_TtC11Diagnostics23DashboardViewController)initWithStyle:(int64_t)a3
{
  return (_TtC11Diagnostics23DashboardViewController *)sub_10005FDFC(a3);
}

- (_TtC11Diagnostics23DashboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  DARootViewController *v6;
  DARootViewController *v7;
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
  return (_TtC11Diagnostics23DashboardViewController *)sub_10005FF1C(v5, v7, a4);
}

- (_TtC11Diagnostics23DashboardViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics23DashboardViewController *)sub_1000600BC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics23DashboardViewController_cardManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics23DashboardViewController_leftBarButtonItem));
}

@end
