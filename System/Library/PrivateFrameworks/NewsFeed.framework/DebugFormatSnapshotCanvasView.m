@implementation DebugFormatSnapshotCanvasView

- (_TtC8NewsFeed29DebugFormatSnapshotCanvasView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed29DebugFormatSnapshotCanvasView *)sub_1BB82DC34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed29DebugFormatSnapshotCanvasView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB830080();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v2;

  v2 = self;
  sub_1BB82E4E8();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1BB82E650((uint64_t)a4, x, y);

  return v10;
}

- (void)doRotateWithGesture:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB82F304(v4);

}

- (void)doTranslateWithGesture:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB82F4AC(v4);

}

- (void)doZoomWithGesture:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB82F600(v4);

}

- (void)doPerspectiveWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB82F748(v4);

}

- (void)doDepthChangedWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB82D764();

}

- (void)doHiddenChangedWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB82FA00(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView_contentView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView____lazy_storage___rotateGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView____lazy_storage___translateGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView____lazy_storage___zoomGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView_hiddenSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView_depthSlider));
  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed29DebugFormatSnapshotCanvasView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1BB82FCA0();

  return v9 & 1;
}

@end
