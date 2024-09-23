@implementation MOPlayPauseButton

- (_TtC16MomentsUIService17MOPlayPauseButton)init
{
  return (_TtC16MomentsUIService17MOPlayPauseButton *)MOPlayPauseButton.init()();
}

- (void)touchPlayPause:(id)a3
{
  id v4;
  _TtC16MomentsUIService17MOPlayPauseButton *v5;

  v4 = a3;
  v5 = self;
  specialized MOPlayPauseButton.touchPlayPause(_:)();

}

- (_TtC16MomentsUIService17MOPlayPauseButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOPlayPauseButton.init(coder:)();
}

- (_TtC16MomentsUIService17MOPlayPauseButton)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOPlayPauseButton", 34);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_playButtonConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_pauseImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_playImage));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_delegate);
}

@end
