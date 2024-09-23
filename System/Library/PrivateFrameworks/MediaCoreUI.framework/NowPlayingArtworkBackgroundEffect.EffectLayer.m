@implementation NowPlayingArtworkBackgroundEffect.EffectLayer

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)init
{
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer *)sub_2413DB9FC();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_2414B544C();
  swift_unknownObjectRelease();
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer *)sub_2413DBB14(v4);
}

- (void)layoutSublayers
{
  _TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer *v2;

  v2 = self;
  sub_2413DBC5C();

}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2413DD394();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer_blurLayer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29111EffectLayer_colorAdjustmentLayer));
}

@end
