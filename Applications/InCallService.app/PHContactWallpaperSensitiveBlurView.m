@implementation PHContactWallpaperSensitiveBlurView

- (id)didTapRevealButton
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;

  v2 = sub_100157014();
  if (!v2)
    return 0;
  v6[4] = v2;
  v7 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100112054;
  v6[3] = &unk_10028AC98;
  v4 = _Block_copy(v6);
  swift_release(v7);
  return v4;
}

- (void)setDidTapRevealButton:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13InCallService35PHContactWallpaperSensitiveBlurView *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_10028AC80, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_100108BB8;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1001570D8((uint64_t)v4, v5);

}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithIsCommunicationSafety:(BOOL)a3
{
  return (_TtC13InCallService35PHContactWallpaperSensitiveBlurView *)sub_1001570F8(a3);
}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)init
{
  sub_100157E90();
}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100157EFC();
}

- (void)didTapButton
{
  _TtC13InCallService35PHContactWallpaperSensitiveBlurView *v2;

  v2 = self;
  sub_100157F6C();

}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithFrame:(CGRect)a3
{
  sub_1001580AC();
}

- (void).cxx_destruct
{
  sub_100158160(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_didTapRevealButton), *(_QWORD *)&self->didTapRevealButton[OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_didTapRevealButton]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_revealButton));
}

@end
