@implementation LoadingView

- (_TtC13FTMInternal_411LoadingView)initWithCoder:(id)a3
{
  id v4;
  _TtC13FTMInternal_411LoadingView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_411LoadingView_shouldHideLoadingView) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___activityIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___loadingLabel) = 0;
  v4 = a3;

  result = (_TtC13FTMInternal_411LoadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/LoadingView.swift", 31, 2, 64, 0);
  __break(1u);
  return result;
}

- (_TtC13FTMInternal_411LoadingView)initWithFrame:(CGRect)a3
{
  _TtC13FTMInternal_411LoadingView *result;

  result = (_TtC13FTMInternal_411LoadingView *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.LoadingView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_411LoadingView____lazy_storage___loadingLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->shouldHideLoadingView[OBJC_IVAR____TtC13FTMInternal_411LoadingView_loadingLabelText]);
}

@end
