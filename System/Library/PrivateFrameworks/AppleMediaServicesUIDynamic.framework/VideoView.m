@implementation VideoView

- (UIColor)backgroundColor
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v2;
  id v3;

  v2 = self;
  v3 = VideoView.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC27AppleMediaServicesUIDynamic9VideoView *v6;

  v5 = a3;
  v6 = self;
  VideoView.backgroundColor.setter(a3);

}

- (CGRect)frame
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  VideoView.frame.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v3;

  v3 = self;
  VideoView.frame.setter();

}

- (_TtC27AppleMediaServicesUIDynamic9VideoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9DD4358();
}

- (void)didChangeAutoPlayVideoSetting
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v2;

  v2 = self;
  OUTLINED_FUNCTION_74_4();

}

- (void)layoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v2;

  v2 = self;
  VideoView.layoutSubviews()();

}

- (void)updateAudioSessionCategoryWithIsAudioOn:(BOOL)a3
{
  _BOOL8 v3;
  _TtC27AppleMediaServicesUIDynamic9VideoView *v4;

  v3 = a3;
  v4 = self;
  sub_1B9DD6954(v3);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B9DD7AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))VideoView.touchesBegan(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B9DD7AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))VideoView.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1B9DD7AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))VideoView.touchesCancelled(_:with:));
}

- (void)handleMediaServicesReset
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v2;

  v2 = self;
  sub_1B9DD7B80();

}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain();
  self;
  VideoView.playerViewController(_:willBeginFullScreenPresentationWithAnimationCoordinator:)();
}

- (AVPlayerViewController)accessibilityPlayerViewController
{
  id v2;

  sub_1B9DD7D28();
  return (AVPlayerViewController *)v2;
}

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)accessibilityPlayButton
{
  return (_TtC27AppleMediaServicesUIDynamic10PlayButton *)sub_1B9DD7D70();
}

- (BOOL)accessibilityIsPlaying
{
  _TtC27AppleMediaServicesUIDynamic9VideoView *v2;
  char v3;

  v2 = self;
  v3 = j___s27AppleMediaServicesUIDynamic9VideoViewC9isPlayingSbvg();

  return v3 & 1;
}

- (BOOL)accessibilityShouldBePlaying
{
  return j___s27AppleMediaServicesUIDynamic9VideoViewC15shouldBePlayingSbvg() & 1;
}

- (_TtC27AppleMediaServicesUIDynamic9VideoView)initWithFrame:(CGRect)a3
{
  VideoView.init(frame:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_weakDestroy();
  OUTLINED_FUNCTION_101_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate);
  OUTLINED_FUNCTION_101_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate);
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork);
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer);
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController);
  OUTLINED_FUNCTION_73_4((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateMediaEvent);
  OUTLINED_FUNCTION_73_4((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateClickEvent);
  sub_1B9D6B278((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_networkInquiry, &qword_1EF242B60);
  swift_release();
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton);
  v3 = (char *)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoUrl;
  v4 = OUTLINED_FUNCTION_2_4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_101_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate);
  sub_1B9D6B30C((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration, (uint64_t (*)(_QWORD))type metadata accessor for VideoConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch));
}

@end
