@implementation OverlayMetalView

- (_TtC17MeasureFoundation16OverlayMetalView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2215DD250();
}

- (_TtC17MeasureFoundation16OverlayMetalView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectRetain();
  return (_TtC17MeasureFoundation16OverlayMetalView *)sub_2215DB7DC((uint64_t)a4, x, y, width, height);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation16OverlayMetalView_adWindow));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation16OverlayMetalView_swipeUpRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation16OverlayMetalView_swipeDownRecognizer));
}

- (void)drawInMTKView:(id)a3
{
  MTKView *v4;
  _TtC17MeasureFoundation16OverlayMetalView *v5;

  v4 = (MTKView *)a3;
  v5 = self;
  OverlayMetalView.draw(in:)(v4);

}

- (void)didSwipeWithSender:(id)a3
{
  id v4;
  _TtC17MeasureFoundation16OverlayMetalView *v5;

  v4 = a3;
  v5 = self;
  sub_2215DC640(v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC17MeasureFoundation16OverlayMetalView *v13;
  id v14;
  _TtC17MeasureFoundation16OverlayMetalView *v15;
  _OWORD v16[2];

  if (a3)
  {
    v9 = sub_2216531B0();
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v16, 0, sizeof(v16));
    v14 = a5;
    v15 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_221653768();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_2215BB99C(&qword_2556D91B0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_221655EC4);
    sub_2216530A8();

  }
LABEL_7:
  _s17MeasureFoundation16OverlayMetalViewC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyg6ChangeI0aypGSgSvSgtF_0(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2215DDB1C((uint64_t)v16);
}

@end
