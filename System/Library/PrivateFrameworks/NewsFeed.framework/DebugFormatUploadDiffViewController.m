@implementation DebugFormatUploadDiffViewController

- (_TtC8NewsFeed35DebugFormatUploadDiffViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA970B00();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed35DebugFormatUploadDiffViewController *v2;

  v2 = self;
  sub_1BA96E4E8();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed35DebugFormatUploadDiffViewController *v2;

  v2 = self;
  sub_1BA96F520();

}

- (void)doDismiss
{
  -[DebugFormatUploadDiffViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)doToggleSidebar
{
  _TtC8NewsFeed35DebugFormatUploadDiffViewController *v2;

  v2 = self;
  sub_1BA96F908();

}

- (_TtC8NewsFeed35DebugFormatUploadDiffViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed35DebugFormatUploadDiffViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed35DebugFormatUploadDiffViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_remoteDiffView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_remoteDiffGutterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_localDiffView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_localDiffGutterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController_changeSetLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadDiffViewController____lazy_storage___chaneSetBarButtonItem));
}

@end
