@implementation MOSuggestionSheetVideoPlaybackView

- (void)dealloc
{
  void *v3;
  _TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetVideoPlaybackView();
  -[MOSuggestionSheetVideoPlaybackView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_baseVideoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_config));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_muteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_muteButtonConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_unMutedImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_mutedImage));
}

- (void)didReceiveInteruptionWithNote:(id)a3
{
  void (*v4)(_QWORD);
  id v5;
  _TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView *v6;

  v4 = *(void (**)(_QWORD))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x118);
  v5 = a3;
  v6 = self;
  v4(0);

}

- (void)finishedPlayingWithNote:(id)a3
{
  id v4;
  _TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView *v5;

  v4 = a3;
  v5 = self;
  specialized MOSuggestionSheetVideoPlaybackView.finishedPlaying(note:)();

}

- (_TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetVideoPlaybackView.init(coder:)();
}

- (void)touchMute:(id)a3
{
  id v4;
  _TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView *v5;

  v4 = a3;
  v5 = self;
  specialized MOSuggestionSheetVideoPlaybackView.touchMute(_:)();

}

- (_TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOSuggestionSheetVideoPlaybackView", 51);
}

@end
