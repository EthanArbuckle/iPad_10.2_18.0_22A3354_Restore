@implementation AVPictureInPicturePrerollAttributes

- (AVPictureInPicturePrerollAttributes)initWithPlaybackStatePrerollAttributes:(id)a3 requiredLinearPlaybackEndTime:(id *)a4
{
  id v7;
  AVPictureInPicturePrerollAttributes *v8;
  AVPictureInPicturePrerollAttributes *v9;
  __int128 v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVPictureInPicturePrerollAttributes;
  v8 = -[AVPictureInPicturePrerollAttributes init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pegasusAttributes, a3);
    v10 = *(_OWORD *)&a4->var0;
    v9->_requiredLinearPlaybackEndTime.epoch = a4->var3;
    *(_OWORD *)&v9->_requiredLinearPlaybackEndTime.value = v10;
  }

  return v9;
}

- (UIColor)preferredTintColor
{
  void *v2;
  void *v3;

  -[AVPictureInPicturePrerollAttributes pegasusAttributes](self, "pegasusAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requiredLinearPlaybackEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (PGPlaybackStatePrerollAttributes)pegasusAttributes
{
  return self->_pegasusAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusAttributes, 0);
}

+ (id)prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:(id *)a3 preferredTintColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CMTime v11;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v11 = *(CMTime *)a3;
  objc_msgSend(MEMORY[0x1E0D6C9D0], "prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:preferredTintColor:", v6, CMTimeGetSeconds(&v11));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(CMTime *)a3;
  v9 = (void *)objc_msgSend(v7, "initWithPlaybackStatePrerollAttributes:requiredLinearPlaybackEndTime:", v8, &v11);

  return v9;
}

+ (id)prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:(id *)a3 preferredTintColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CMTime v11;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v11 = *(CMTime *)a3;
  objc_msgSend(MEMORY[0x1E0D6C9D0], "prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:preferredTintColor:", v6, CMTimeGetSeconds(&v11));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(CMTime *)a3;
  v9 = (void *)objc_msgSend(v7, "initWithPlaybackStatePrerollAttributes:requiredLinearPlaybackEndTime:", v8, &v11);

  return v9;
}

@end
