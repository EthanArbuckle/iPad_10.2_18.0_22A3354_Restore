@implementation MOSuggestionSheetPrivacyOverlayView

- (_TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView_clientIconView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView_clientLabel) = 0;
  v4 = a3;

  result = (_TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetPrivacyOverlayView.swift", 58, 2, 86, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView *result;

  result = (_TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionSheetPrivacyOverlayView", 52, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView_clientIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView_clientLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->clientIconView[OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetPrivacyOverlayView_currentClientIdentifier]);
}

@end
