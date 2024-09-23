@implementation FloatingContentView

- (_TtC13FitnessCoreUI19FloatingContentView)initWithFrame:(CGRect)a3
{
  return (_TtC13FitnessCoreUI19FloatingContentView *)FloatingContentView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FitnessCoreUI19FloatingContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23C03A7A8();
}

- (void)layoutSubviews
{
  _TtC13FitnessCoreUI19FloatingContentView *v2;

  v2 = self;
  sub_23C036B90();

}

- (void).cxx_destruct
{
  sub_23C0338B4((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_selectionView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI19FloatingContentView_heightConstraint));
  swift_bridgeObjectRelease();
}

@end
