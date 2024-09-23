@implementation DebugJournalTableViewCell

- (_TtC8NewsFeed25DebugJournalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1BB8729A0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC8NewsFeed25DebugJournalTableViewCell *)sub_1BB86B6D8(v4, v5);
}

- (_TtC8NewsFeed25DebugJournalTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8NewsFeed25DebugJournalTableViewCell *result;

  v5 = OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_stripView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3438]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed25DebugJournalTableViewCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[DebugJournalTableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_stripView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0, 4.0, CGRectGetHeight(v6));
  v4 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[DebugJournalTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView];
  objc_msgSend(v3, sel_setHidden_, 1, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_stopAnimating);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_stripView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugJournalTableViewCell_activityIndicatorView));
}

@end
