@implementation DebugJournalHeaderView

- (_TtC8NewsFeed22DebugJournalHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1BB8729A0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC8NewsFeed22DebugJournalHeaderView *)sub_1BB8425BC(v3, v4);
}

- (_TtC8NewsFeed22DebugJournalHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC8NewsFeed22DebugJournalHeaderView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed22DebugJournalHeaderView_showHideLabel;
  sub_1BB86F8A4();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1BB86F880();

  result = (_TtC8NewsFeed22DebugJournalHeaderView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed22DebugJournalHeaderView *v2;

  v2 = self;
  sub_1BB842790();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[DebugJournalHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  sub_1BB86F88C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22DebugJournalHeaderView_showHideLabel));
}

@end
