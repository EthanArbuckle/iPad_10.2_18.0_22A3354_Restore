@implementation SearchResultsContainerViewController

- (_TtC22SubscribePageExtension36SearchResultsContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100590B00();
}

- (void)as_viewDidBecomeFullyVisible
{
  sub_10058FCA0(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomeFullyVisible, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_10058FD1C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, 0);
}

- (void)as_viewDidBecomePartiallyVisible
{
  sub_10058FCA0(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomePartiallyVisible, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_10058FD1C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, 1);
}

- (_TtC22SubscribePageExtension36SearchResultsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension36SearchResultsContainerViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension36SearchResultsContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.SearchResultsContainerViewController", 59, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_artworkLoader));
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_searchFocusViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_searchHintsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_searchResultsViewController));
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_searchResultsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_activeSearchSectionViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension36SearchResultsContainerViewController_facetsPresenter));
}

@end
