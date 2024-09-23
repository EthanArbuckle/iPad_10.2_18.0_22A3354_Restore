@implementation InteractiveSectionBackgroundView

- (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView *)sub_100396C98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC22SubscribePageExtension32InteractiveSectionBackgroundView *)sub_100398BF0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension32InteractiveSectionBackgroundView *v2;

  v2 = self;
  sub_100396F74();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension32InteractiveSectionBackgroundView *v2;

  v2 = self;
  sub_100397060();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_topBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_bottomBackgroundView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32InteractiveSectionBackgroundView_currentState, (uint64_t *)&unk_1007F6040);
}

@end
