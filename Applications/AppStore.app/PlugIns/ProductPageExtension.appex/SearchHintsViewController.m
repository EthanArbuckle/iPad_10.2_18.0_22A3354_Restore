@implementation SearchHintsViewController

- (void)viewDidLoad
{
  _TtC20ProductPageExtension25SearchHintsViewController *v2;

  v2 = self;
  sub_1004FDE60();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension25SearchHintsViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1004FE42C(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension25SearchHintsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1004FE5C0((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension25SearchHintsViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25SearchHintsViewController_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25SearchHintsViewController_searchHintsCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25SearchHintsViewController_searchHintsCollectionViewDelegate));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension25SearchHintsViewController_impressionsCalculator));
}

@end
