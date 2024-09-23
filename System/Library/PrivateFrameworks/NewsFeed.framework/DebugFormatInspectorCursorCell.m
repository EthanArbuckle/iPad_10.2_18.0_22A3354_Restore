@implementation DebugFormatInspectorCursorCell

- (_TtC8NewsFeed30DebugFormatInspectorCursorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed30DebugFormatInspectorCursorCell *)sub_1BAA41FB0(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed30DebugFormatInspectorCursorCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAA43690();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed30DebugFormatInspectorCursorCell *v2;

  v2 = self;
  sub_1BAA428FC();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_frameLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_frameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_widthSizingConstraintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_heightSizingConstraintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_filledAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_passLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_resizingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_positionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInspectorCursorCell_directionLayer));
}

@end
