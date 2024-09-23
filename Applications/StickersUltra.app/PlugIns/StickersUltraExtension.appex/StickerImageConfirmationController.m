@implementation StickerImageConfirmationController

- (_TtC22StickersUltraExtension34StickerImageConfirmationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000CFDC();
}

- (void)loadView
{
  _TtC22StickersUltraExtension34StickerImageConfirmationController *v2;

  v2 = self;
  sub_10000B378();

}

- (void)didTapImageView:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension34StickerImageConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_10000BBA0(v4);

}

- (_TtC22StickersUltraExtension34StickerImageConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22StickersUltraExtension34StickerImageConfirmationController *result;

  v4 = a4;
  result = (_TtC22StickersUltraExtension34StickerImageConfirmationController *)_swift_stdlib_reportUnimplementedInitializer("StickersUltraExtension.StickerImageConfirmationController", 57, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_10000D10C((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_image));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_localIdentifier]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_previewCache), v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController_util));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___imageAnalysisInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension34StickerImageConfirmationController____lazy_storage___imageAnalyzer));
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  return 0;
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension34StickerImageConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_10000C440(v4);

}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  return 0;
}

@end
