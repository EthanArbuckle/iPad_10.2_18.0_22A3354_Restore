@implementation DebugFormatInspectorFrameCell

- (_TtC8NewsFeed29DebugFormatInspectorFrameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed29DebugFormatInspectorFrameCell *)sub_1BB125F40(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed29DebugFormatInspectorFrameCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB129430();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed29DebugFormatInspectorFrameCell *v2;

  v2 = self;
  sub_1BB126A04();

}

- (void)didTapBorderButtonWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatInspectorFrameCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BB127B6C((uint64_t)v4);

}

- (void)didTapHiddenButtonWithSender:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC8NewsFeed29DebugFormatInspectorFrameCell *v7;

  swift_getObjectType();
  v5 = qword_1EF2A6D90;
  v6 = a3;
  v7 = self;
  if (v5 != -1)
    swift_once();
  sub_1BB1292CC(&qword_1EF2BBD30, (uint64_t)&unk_1BB8EE330);
  sub_1BB86D210();
  sub_1BB1292CC(&qword_1EF2BBD38, (uint64_t)&unk_1BB8EE2F0);
  sub_1BB86D3F0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_frameLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_frameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_zIndexLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_hiddenButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_leftBorderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_rightBorderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_topBorderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatInspectorFrameCell_bottomBorderButton));
}

@end
