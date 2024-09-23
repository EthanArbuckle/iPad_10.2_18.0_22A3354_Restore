@implementation NANowPlayingVolumeSlider

- (NANowPlayingVolumeSlider)initWithFrame:(CGRect)a3
{
  return (NANowPlayingVolumeSlider *)sub_1B9F0E65C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NANowPlayingVolumeSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9F0FEC8();
}

- (void)didMoveToWindow
{
  NANowPlayingVolumeSlider *v2;

  v2 = self;
  sub_1B9F0F9D0();

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___NANowPlayingVolumeSlider_volumeChangeHandler));
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5;
  NANowPlayingVolumeSlider *v6;

  v5 = a3;
  v6 = self;
  sub_1B9F0EF94();

}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5;
  NANowPlayingVolumeSlider *v6;

  v5 = a3;
  v6 = self;
  sub_1B9F0FFF4();

}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  NANowPlayingVolumeSlider *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[NANowPlayingVolumeSlider window](v2, sel_window);
  v4 = objc_msgSend(v3, sel_windowScene);

  return (UIWindowScene *)v4;
}

- (NSString)volumeAudioCategory
{
  NANowPlayingVolumeSlider *v2;
  void *v3;

  v2 = self;
  sub_1B9F0FC90();

  v3 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  NANowPlayingVolumeSlider *v2;
  double v4;
  double v5;

  v2 = self;
  if (-[NANowPlayingVolumeSlider isHidden](v2, sel_isHidden))
  {

    return 0;
  }
  else
  {
    -[NANowPlayingVolumeSlider alpha](v2, sel_alpha);
    v5 = v4;

    return v5 > 0.0;
  }
}

- (NSString)accessibilityValue
{
  void *v2;

  sub_1BA0BEBC4();
  v2 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGPoint)accessibilityActivationPoint
{
  char *v2;
  void *v3;
  NANowPlayingVolumeSlider *v4;
  CGFloat MaxX;
  CGFloat MidY;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  v2 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_slider);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NewsArticles10SliderView_elapsedTrack];
  v4 = self;
  objc_msgSend(v3, sel_accessibilityFrame);
  MaxX = CGRectGetMaxX(v10);
  objc_msgSend(v2, sel_accessibilityFrame);
  MidY = CGRectGetMidY(v11);

  v7 = MaxX;
  v8 = MidY;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)accessibilityIncrement
{
  double v2;

  LODWORD(v2) = 1036831949;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_volumeController), sel_adjustVolumeValue_, v2);
}

- (void)accessibilityDecrement
{
  double v2;

  LODWORD(v2) = -1110651699;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NANowPlayingVolumeSlider_volumeController), sel_adjustVolumeValue_, v2);
}

@end
