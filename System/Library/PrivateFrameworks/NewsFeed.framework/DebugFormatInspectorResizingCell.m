@implementation DebugFormatInspectorResizingCell

- (_TtC8NewsFeed32DebugFormatInspectorResizingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BB8729A0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8NewsFeed32DebugFormatInspectorResizingCell *)sub_1BA959C4C(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed32DebugFormatInspectorResizingCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA95B744();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed32DebugFormatInspectorResizingCell *v2;

  v2 = self;
  sub_1BA95A220();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_frameLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_widthLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_heightLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_leftMarginLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_rightMarginLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_topMarginLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatInspectorResizingCell_bottomMarginLayer));
}

@end
