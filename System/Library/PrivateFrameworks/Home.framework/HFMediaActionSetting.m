@implementation HFMediaActionSetting

- (HFMediaActionSetting)initWithActionBuilder:(id)a3
{
  id v5;
  HFMediaActionSetting *v6;
  HFMediaActionSetting *v7;
  HFPlaybackArchive *v8;
  HFPlaybackArchive *playbackArchive;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMediaActionSetting;
  v6 = -[HFMediaActionSetting init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaActionBuilder, a3);
    if (objc_msgSend(v5, "targetPlayState") != 2)
    {
      v7->_originalHMNonPausePlaybackState = objc_msgSend(v5, "targetPlayState");
      objc_msgSend(v5, "playbackArchive");
      v8 = (HFPlaybackArchive *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v7->_originalHMNonPausePlaybackState = 1;
    if (!+[HFUtilities isAMac](HFUtilities, "isAMac"))
    {
      v8 = -[HFPlaybackArchive initWithMediaPlayerPlaybackArchive:]([HFPlaybackArchive alloc], "initWithMediaPlayerPlaybackArchive:", 0);
LABEL_6:
      playbackArchive = v7->_playbackArchive;
      v7->_playbackArchive = v8;

    }
  }

  return v7;
}

- (void)updatePlaybackState:(int64_t)a3
{
  void *v4;
  id v5;

  if (a3 != 2)
  {
    -[HFMediaActionSetting setOriginalHMNonPausePlaybackState:](self, "setOriginalHMNonPausePlaybackState:");
    -[HFMediaActionSetting mediaActionBuilder](self, "mediaActionBuilder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackArchive");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaActionSetting setPlaybackArchive:](self, "setPlaybackArchive:", v4);

  }
}

- (HFMediaPlaybackActionBuilder)mediaActionBuilder
{
  return self->_mediaActionBuilder;
}

- (int64_t)originalHMNonPausePlaybackState
{
  return self->_originalHMNonPausePlaybackState;
}

- (void)setOriginalHMNonPausePlaybackState:(int64_t)a3
{
  self->_originalHMNonPausePlaybackState = a3;
}

- (HFPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_playbackArchive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_mediaActionBuilder, 0);
}

@end
