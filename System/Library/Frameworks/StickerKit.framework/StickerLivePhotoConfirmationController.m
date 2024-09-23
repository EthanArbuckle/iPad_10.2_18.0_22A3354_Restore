@implementation StickerLivePhotoConfirmationController

- (void)updateDimmingColor
{
  _TtC10StickerKit38StickerLivePhotoConfirmationController *v2;

  v2 = self;
  sub_23466DF98();

}

- (_TtC10StickerKit38StickerLivePhotoConfirmationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_234674298();
}

- (void)loadView
{
  _TtC10StickerKit38StickerLivePhotoConfirmationController *v2;

  v2 = self;
  sub_23466E664();

}

- (void)didTapLivePhotoView:(id)a3
{
  id v4;
  _TtC10StickerKit38StickerLivePhotoConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_23466EEE4(v4);

}

- (void)handleLiveButton
{
  _TtC10StickerKit38StickerLivePhotoConfirmationController *v2;

  v2 = self;
  sub_23466F154();

}

- (_TtC10StickerKit38StickerLivePhotoConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10StickerKit38StickerLivePhotoConfirmationController *result;

  v4 = a4;
  result = (_TtC10StickerKit38StickerLivePhotoConfirmationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_livePhoto));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_livePhotoSticker));
  sub_2345B0988((uint64_t)self + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_livePhotoStickerRecentUUID, (uint64_t *)&unk_2561716C0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_asset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_assetTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_assetTrackFormatDescription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_lightAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_darkAppearanceDimmingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_lightAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_darkAppearanceComposition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___imageAnalysisInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38StickerLivePhotoConfirmationController____lazy_storage___imageAnalyzer));
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
  _TtC10StickerKit38StickerLivePhotoConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_234672AB8(v4);

}

- (void)videoPreviewAvailableForImageAnalysisInteraction:(id)a3
{
  id v4;
  _TtC10StickerKit38StickerLivePhotoConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_2346748AC();

}

@end
