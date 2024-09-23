@implementation NowPlayingArtworkBackgroundEffect.ColorAdjustmentsLayer

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer)init
{
  return (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer *)sub_2413DC114();
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer)initWithCoder:(id)a3
{
  _OWORD *v4;
  _OWORD *v5;
  id v6;
  _TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer_dimmingMatrix);
  *v4 = xmmword_2414C32E0;
  v4[1] = xmmword_2414C32F0;
  v4[2] = xmmword_2414C3300;
  v4[3] = xmmword_2414C3310;
  v4[4] = xmmword_2414BDDF0;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer_saturationMatrix);
  v6 = a3;
  CAColorMatrixMakeSaturation();
  *v5 = v8;
  v5[1] = v9;
  v5[2] = v10;
  v5[3] = v11;
  v5[4] = v12;

  result = (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer *)sub_2414B5674();
  __break(1u);
  return result;
}

- (_TtCV11MediaCoreUI33NowPlayingArtworkBackgroundEffectP33_0BADDE1E8FA0478530CC88B691A6D29121ColorAdjustmentsLayer)initWithLayer:(id)a3
{
  sub_2413DC9AC();
}

@end
