@implementation DebugFormatOverlayView

- (BOOL)isUserInteractionEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[DebugFormatOverlayView isUserInteractionEnabled](&v3, sel_isUserInteractionEnabled);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC8NewsFeed22DebugFormatOverlayView *v6;
  _OWORD *v7;
  _OWORD *v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  -[DebugFormatOverlayView setUserInteractionEnabled:](&v10, sel_setUserInteractionEnabled_, v3);
  v9.receiver = v6;
  v9.super_class = ObjectType;
  if (!-[DebugFormatOverlayView isUserInteractionEnabled](&v9, sel_isUserInteractionEnabled))
  {
    v7 = (_OWORD *)((char *)v6 + OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_selectionFrame);
    *v7 = 0u;
    v7[1] = 0u;
    sub_1BB2E207C(&OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_selectionView, &OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_selectionFrame, &OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_selectionFrame, &OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_selectionFrame);
    v8 = (_OWORD *)((char *)v6 + OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_metricSelectionFrame);
    *v8 = 0u;
    v8[1] = 0u;
    sub_1BB2E207C(&OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_metricSelectionView, &OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_metricSelectionFrame, &OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_metricSelectionFrame, &OBJC_IVAR____TtC8NewsFeed24DebugFormatRulerEdgeView_metricSelectionFrame);
  }

}

- (_TtC8NewsFeed22DebugFormatOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB2E284C();
}

- (_TtC8NewsFeed22DebugFormatOverlayView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed22DebugFormatOverlayView *result;

  result = (_TtC8NewsFeed22DebugFormatOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_selectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22DebugFormatOverlayView_metricSelectionView));
  swift_unknownObjectWeakDestroy();
}

@end
