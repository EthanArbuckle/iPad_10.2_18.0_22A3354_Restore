@implementation DebugPersonalizationSubmitView

- (_TtC8NewsFeed30DebugPersonalizationSubmitView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed30DebugPersonalizationSubmitView *)sub_1BA8FF81C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed30DebugPersonalizationSubmitView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _TtC8NewsFeed30DebugPersonalizationSubmitView *result;

  v4 = OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitButton;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1BA8FF46C();
  v6 = OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitText;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_1BA8FF680();

  result = (_TtC8NewsFeed30DebugPersonalizationSubmitView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugPersonalizationSubmitView_submitText));
}

@end
