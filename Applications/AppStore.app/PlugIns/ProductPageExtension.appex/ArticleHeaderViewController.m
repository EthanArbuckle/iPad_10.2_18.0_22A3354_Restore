@implementation ArticleHeaderViewController

- (_TtC20ProductPageExtension27ArticleHeaderViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension27ArticleHeaderViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isDisappearing) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isAppearing) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isCardModeEnabled) = 1;
  v4 = a3;

  result = (_TtC20ProductPageExtension27ArticleHeaderViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ArticleHeaderViewController.swift", 54, 2, 68, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC20ProductPageExtension27ArticleHeaderViewController *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _TtC20ProductPageExtension27ArticleHeaderViewController *v12;
  _TtC20ProductPageExtension27ArticleHeaderViewController *v13;

  v13 = self;
  if ((-[ArticleHeaderViewController isViewLoaded](v13, "isViewLoaded") & 1) != 0)
  {
    v2 = v13;
  }
  else
  {
    v3 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = (_TtC20ProductPageExtension27ArticleHeaderViewController *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ArticleHeaderViewController.ContentView()), "initWithFrame:", v5, v7, v9, v11);
    -[ArticleHeaderViewController setView:](v13, "setView:", v12);

    v2 = v12;
  }

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20ProductPageExtension27ArticleHeaderViewController *v3;

  v3 = self;
  sub_1002AFE54((uint64_t)v3, v2);

}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1002AFFC4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, &OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isDisappearing, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1002AFFC4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, &OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isDisappearing, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1002AFFC4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, &OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isAppearing, 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1002AFFC4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, &OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_isAppearing, 0);
}

- (void)viewDidLayoutSubviews
{
  _TtC20ProductPageExtension27ArticleHeaderViewController *v2;

  v2 = self;
  sub_1002B0038();

}

- (void)viewSafeAreaInsetsDidChange
{
  uint64_t v2;
  _TtC20ProductPageExtension27ArticleHeaderViewController *v3;

  v3 = self;
  sub_1002B06F4((uint64_t)v3, v2);

}

- (_TtC20ProductPageExtension27ArticleHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension27ArticleHeaderViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension27ArticleHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.ArticleHeaderViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_todayCard));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_cell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27ArticleHeaderViewController_alternateCell));
}

@end
