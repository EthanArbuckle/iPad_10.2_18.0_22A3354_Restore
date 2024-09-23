@implementation SearchResultsContainerViewController

- (_TtC20ProductPageExtension36SearchResultsContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004FDBC0();
}

- (void)as_viewDidBecomeFullyVisible
{
  sub_1004FCD60(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomeFullyVisible, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1004FCDDC(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, 0);
}

- (void)as_viewDidBecomePartiallyVisible
{
  sub_1004FCD60(self, (uint64_t)a2, (const char **)&selRef_as_viewDidBecomePartiallyVisible, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1004FCDDC(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, 1);
}

- (_TtC20ProductPageExtension36SearchResultsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension36SearchResultsContainerViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension36SearchResultsContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.SearchResultsContainerViewController", 57, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchFocusViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchHintsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchResultsViewController));
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_searchResultsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36SearchResultsContainerViewController_activeSearchSectionViewController));
  swift_release();
}

@end
