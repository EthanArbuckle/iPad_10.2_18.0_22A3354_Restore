@implementation SearchHintsViewController

- (void)viewDidLoad
{
  _TtC8AppStore25SearchHintsViewController *v2;

  v2 = self;
  sub_100251AA8();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8AppStore25SearchHintsViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100252074(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore25SearchHintsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100252208((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore25SearchHintsViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25SearchHintsViewController_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25SearchHintsViewController_searchHintsCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25SearchHintsViewController_searchHintsCollectionViewDelegate));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore25SearchHintsViewController_impressionsCalculator));
}

@end
