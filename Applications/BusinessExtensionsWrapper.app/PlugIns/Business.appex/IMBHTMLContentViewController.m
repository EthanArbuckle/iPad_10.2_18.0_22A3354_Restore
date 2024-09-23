@implementation IMBHTMLContentViewController

- (void)viewDidLoad
{
  _TtC8Business28IMBHTMLContentViewController *v2;

  v2 = self;
  sub_10002E4D8();

}

- (void)shareButtonTapped:(id)a3
{
  id v4;
  _TtC8Business28IMBHTMLContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100030CCC();

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8Business28IMBHTMLContentViewController *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100030DCC(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (_TtC8Business28IMBHTMLContentViewController)initWithCoder:(id)a3
{
  return (_TtC8Business28IMBHTMLContentViewController *)sub_100030944(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_scrollview));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_footerToolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_toolbarBorder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_shareButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_webview));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_contentHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_webviewHeightConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business28IMBHTMLContentViewController_content));
}

@end
