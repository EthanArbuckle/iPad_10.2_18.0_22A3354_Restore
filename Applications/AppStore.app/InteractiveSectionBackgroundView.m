@implementation InteractiveSectionBackgroundView

- (_TtC8AppStore32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32InteractiveSectionBackgroundView *)sub_100380C74((__n128)a3.origin, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  return (_TtC8AppStore32InteractiveSectionBackgroundView *)sub_100382B10(v4);
}

- (void)layoutSubviews
{
  _TtC8AppStore32InteractiveSectionBackgroundView *v2;

  v2 = self;
  sub_100380F50();

}

- (void)prepareForReuse
{
  _TtC8AppStore32InteractiveSectionBackgroundView *v2;

  v2 = self;
  sub_10038103C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_100839290);
}

@end
