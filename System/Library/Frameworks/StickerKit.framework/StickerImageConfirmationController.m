@implementation StickerImageConfirmationController

- (_TtC10StickerKit34StickerImageConfirmationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2345F0FF8();
}

- (void)loadView
{
  _TtC10StickerKit34StickerImageConfirmationController *v2;

  v2 = self;
  sub_2345EF96C();

}

- (void)didTapImageView:(id)a3
{
  id v4;
  _TtC10StickerKit34StickerImageConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_2345F0364(v4);

}

- (_TtC10StickerKit34StickerImageConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10StickerKit34StickerImageConfirmationController *result;

  v4 = a4;
  result = (_TtC10StickerKit34StickerImageConfirmationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController_image));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController____lazy_storage___addStickerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController____lazy_storage___imageAnalysisInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34StickerImageConfirmationController____lazy_storage___imageAnalyzer));
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  return 0;
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4;
  _TtC10StickerKit34StickerImageConfirmationController *v5;

  v4 = a3;
  v5 = self;
  sub_2345F0B20(v4);

}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  return 0;
}

@end
