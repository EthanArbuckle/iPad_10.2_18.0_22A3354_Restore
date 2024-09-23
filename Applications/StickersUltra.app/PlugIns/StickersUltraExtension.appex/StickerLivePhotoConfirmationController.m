@implementation StickerLivePhotoConfirmationController

- (void)updateDimmingColor
{
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v2;

  v2 = self;
  sub_10004C8CC();

}

- (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100052C88();
}

- (void)loadView
{
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v2;

  v2 = self;
  sub_10004D510();

}

- (void)didTapLivePhotoView:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_10004DDA0(v4);

}

- (void)handleLiveButton
{
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v2;

  v2 = self;
  sub_10004E020();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v4;

  v4 = self;
  sub_10004E2A8(a3);

}

- (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *result;

  v4 = a4;
  result = (_TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *)_swift_stdlib_reportUnimplementedInitializer("StickersUltraExtension.StickerLivePhotoConfirmationController", 61, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_10000D10C((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_livePhoto));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_localIdentifier]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_previewCache), v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_livePhotoSticker));
  sub_10002E2B4((uint64_t)self+ OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_livePhotoStickerRecentUUID, &qword_10009CAB0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_asset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_assetTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_assetTrackFormatDescription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_lightAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_darkAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_lightAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_darkAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController_util));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___imageAnalysisInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension38StickerLivePhotoConfirmationController____lazy_storage___imageAnalyzer));
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  return 1;
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  return 0;
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_100051714(v4);

}

- (void)videoPreviewAvailableForImageAnalysisInteraction:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension38StickerLivePhotoConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_1000534C8();

}

@end
