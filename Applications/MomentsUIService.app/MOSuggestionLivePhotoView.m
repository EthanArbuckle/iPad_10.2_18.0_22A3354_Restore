@implementation MOSuggestionLivePhotoView

- (_TtC16MomentsUIService25MOSuggestionLivePhotoView)initWithCoder:(id)a3
{
  id v5;
  _TtC16MomentsUIService25MOSuggestionLivePhotoView *result;

  *(_QWORD *)&self->livePhotoView[OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC16MomentsUIService25MOSuggestionLivePhotoView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionLivePhotoView.swift", 48, 2, 66, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLivePhotoView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService25MOSuggestionLivePhotoView *result;

  result = (_TtC16MomentsUIService25MOSuggestionLivePhotoView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionLivePhotoView", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_iconView));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_delegate);
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  id v5;
  _TtC16MomentsUIService25MOSuggestionLivePhotoView *v6;

  v5 = a3;
  v6 = self;
  specialized MOSuggestionLivePhotoView.livePhotoView(_:willBeginPlaybackWith:)();

}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  id v5;
  _TtC16MomentsUIService25MOSuggestionLivePhotoView *v6;

  v5 = a3;
  v6 = self;
  specialized MOSuggestionLivePhotoView.livePhotoView(_:didEndPlaybackWith:)();

}

@end
