@implementation DebugFormatMarkdownHeaderFooterView

- (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView)initWithReuseIdentifier:(id)a3
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
  return (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView *)sub_1BB0F3B20(v3, v4);
}

- (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView *result;

  v5 = OBJC_IVAR____TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatMarkdownHeaderFooterView_label));
}

@end
