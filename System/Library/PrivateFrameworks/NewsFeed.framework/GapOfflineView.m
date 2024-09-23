@implementation GapOfflineView

- (_TtC8NewsFeed14GapOfflineView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed14GapOfflineView *)sub_1BAA3179C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed14GapOfflineView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed14GapOfflineView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed14GapOfflineView_offlineLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed14GapOfflineView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
