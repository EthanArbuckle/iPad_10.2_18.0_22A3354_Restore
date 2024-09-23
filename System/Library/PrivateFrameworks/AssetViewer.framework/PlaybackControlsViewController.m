@implementation PlaybackControlsViewController

- (_TtC11AssetViewer30PlaybackControlsViewController)init
{
  return (_TtC11AssetViewer30PlaybackControlsViewController *)sub_1D940B1EC();
}

- (_TtC11AssetViewer30PlaybackControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D94103BC();
}

- (void)viewDidLayoutSubviews
{
  _TtC11AssetViewer30PlaybackControlsViewController *v2;

  v2 = self;
  sub_1D940B3BC();

}

- (_TtC11AssetViewer30PlaybackControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11AssetViewer30PlaybackControlsViewController *result;

  v4 = a4;
  result = (_TtC11AssetViewer30PlaybackControlsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer30PlaybackControlsViewController_scrubberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer30PlaybackControlsViewController_backgroundView));
}

@end
