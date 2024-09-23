@implementation DebugPersonalizationHeaderView

- (_TtC8NewsFeed30DebugPersonalizationHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed30DebugPersonalizationHeaderView *)sub_1BB05D76C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed30DebugPersonalizationHeaderView)initWithCoder:(id)a3
{
  return (_TtC8NewsFeed30DebugPersonalizationHeaderView *)sub_1BB05DCD8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationHeaderView_subHeaderLabel));
}

@end
