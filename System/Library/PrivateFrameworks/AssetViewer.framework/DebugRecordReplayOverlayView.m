@implementation DebugRecordReplayOverlayView

- (_TtC11AssetViewer28DebugRecordReplayOverlayView)init
{
  return (_TtC11AssetViewer28DebugRecordReplayOverlayView *)sub_1D943C42C();
}

- (_TtC11AssetViewer28DebugRecordReplayOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D943D4E8();
}

- (void)bottomButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC11AssetViewer28DebugRecordReplayOverlayView *v6;

  v4 = a3;
  v6 = self;
  v5 = objc_msgSend(v4, sel_isSelected) ^ 1;
  objc_msgSend(v4, sel_setSelected_, v5);
  if (MEMORY[0x1DF08DD88]((char *)v6 + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_delegate))
  {
    sub_1D945EAB8((uint64_t)objc_msgSend(v4, sel_tag), v5);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (_TtC11AssetViewer28DebugRecordReplayOverlayView)initWithFrame:(CGRect)a3
{
  _TtC11AssetViewer28DebugRecordReplayOverlayView *result;

  result = (_TtC11AssetViewer28DebugRecordReplayOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_topControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_recordButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_resetButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_blinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_backButtonColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_bottomBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_bottomControlsStackView));
  sub_1D93D6F14((uint64_t)self + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_delegate);
}

@end
