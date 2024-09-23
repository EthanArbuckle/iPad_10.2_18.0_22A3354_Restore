@implementation WindowWidthReaderViewController

- (_TtC11MediaCoreUI31WindowWidthReaderViewController)initWithCoder:(id)a3
{
  _TtC11MediaCoreUI31WindowWidthReaderViewController *result;

  result = (_TtC11MediaCoreUI31WindowWidthReaderViewController *)sub_2414B5674();
  __break(1u);
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC11MediaCoreUI31WindowWidthReaderViewController *v4;

  v4 = self;
  sub_2413BA330(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC11MediaCoreUI31WindowWidthReaderViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_2413BA49C((uint64_t)a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC11MediaCoreUI31WindowWidthReaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11MediaCoreUI31WindowWidthReaderViewController *result;

  v4 = a4;
  result = (_TtC11MediaCoreUI31WindowWidthReaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
