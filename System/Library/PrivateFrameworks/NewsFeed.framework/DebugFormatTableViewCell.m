@implementation DebugFormatTableViewCell

- (_TtC8NewsFeed24DebugFormatTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed24DebugFormatTableViewCell *)sub_1BB82BA90(v4, v5);
}

- (_TtC8NewsFeed24DebugFormatTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed24DebugFormatTableViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_indicatorColor) = 0;
  v5 = OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_circleView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed24DebugFormatTableViewCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[DebugFormatTableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_circleView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  sub_1BB8735D0();
  objc_msgSend(v3, sel_setFrame_, 4.0);
  v4 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v4, sel_setCornerRadius_, 4.0);

}

- (void)prepareForReuse
{
  _TtC8NewsFeed24DebugFormatTableViewCell *v2;

  v2 = self;
  sub_1BB82B970();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_indicatorColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatTableViewCell_circleView));
}

@end
