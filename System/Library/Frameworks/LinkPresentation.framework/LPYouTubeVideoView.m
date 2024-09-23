@implementation LPYouTubeVideoView

- (LPYouTubeVideoView)initWithHost:(id)a3 video:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  LPYouTubeVideoView *v20;
  LPYouTubePlayerView *v21;
  LPYouTubePlayerView *platformYouTubeView;
  LPYouTubeVideoView *v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)LPYouTubeVideoView;
  v20 = -[LPVisualMediaView initWithHost:media:style:posterFrame:posterFrameStyle:configuration:](&v25, sel_initWithHost_media_style_posterFrame_posterFrameStyle_configuration_, v14, v15, v16, v17, v18, v19);
  if (v20)
  {
    v21 = objc_alloc_init(LPYouTubePlayerView);
    platformYouTubeView = v20->_platformYouTubeView;
    v20->_platformYouTubeView = v21;

    -[LPYouTubePlayerView setDelegate:](v20->_platformYouTubeView, "setDelegate:", v20);
    -[LPYouTubePlayerView setShowsControls:](v20->_platformYouTubeView, "setShowsControls:", 0);
    v23 = v20;
  }

  return v20;
}

- (BOOL)usesSharedAudioSession
{
  return 0;
}

- (BOOL)shouldShowMuteButton
{
  return 1;
}

- (BOOL)isMuted
{
  return -[LPYouTubePlayerView isMuted](self->_platformYouTubeView, "isMuted");
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[LPYouTubePlayerView setMuted:](self->_platformYouTubeView, "setMuted:");
  -[LPVisualMediaView didChangeMutedState:](self, "didChangeMutedState:", v3);
}

- (double)volume
{
  return 1.0;
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  LPYouTubePlayerView *platformYouTubeView;

  v3 = a3;
  if (-[LPVisualMediaView isPlaying](self, "isPlaying") != a3)
  {
    -[LPVisualMediaView swapVideoPlaceholderForPlaybackIfNeeded](self, "swapVideoPlaceholderForPlaybackIfNeeded");
    platformYouTubeView = self->_platformYouTubeView;
    if (v3)
      -[LPYouTubePlayerView play](platformYouTubeView, "play");
    else
      -[LPYouTubePlayerView pause](platformYouTubeView, "pause");
    -[LPVisualMediaView setWaitingForPlayback:](self, "setWaitingForPlayback:", v3);
  }
}

- (id)createVideoPlayerView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  LPYouTubePlayerView *platformYouTubeView;
  void *v8;
  LPYouTubePlayerView *v9;

  -[LPVisualMediaView media](self, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "youTubeURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPPresentationSpecializations youTubeVideoComponentsForEmbedURL:](LPPresentationSpecializations, "youTubeVideoComponentsForEmbedURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startTime");
  if (v6 != 0.0)
  {
    objc_msgSend(v5, "startTime");
    -[LPYouTubePlayerView setStartTime:](self->_platformYouTubeView, "setStartTime:");
  }
  -[LPYouTubePlayerView setMuted:](self->_platformYouTubeView, "setMuted:", 1);
  platformYouTubeView = self->_platformYouTubeView;
  objc_msgSend(v5, "videoID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPYouTubePlayerView loadVideoWithID:](platformYouTubeView, "loadVideoWithID:", v8);

  v9 = self->_platformYouTubeView;
  return v9;
}

- (void)setAllowsUserInteractionWithVideoPlayer:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPYouTubeVideoView;
  -[LPVisualMediaView setAllowsUserInteractionWithVideoPlayer:](&v5, sel_setAllowsUserInteractionWithVideoPlayer_);
  -[LPYouTubePlayerView setUserInteractionEnabled:](self->_platformYouTubeView, "setUserInteractionEnabled:", v3);
}

- (void)youTubePlayer:(id)a3 didChangeToState:(int64_t)a4
{
  dispatch_time_t v6;
  _QWORD block[5];

  if (!-[LPVisualMediaView hasEverPlayed](self, "hasEverPlayed", a3) && a4 == 2)
  {
    -[LPYouTubeVideoView setAllowsUserInteractionWithVideoPlayer:](self, "setAllowsUserInteractionWithVideoPlayer:", 1);
    v6 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__LPYouTubeVideoView_youTubePlayer_didChangeToState___block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
    -[LPVisualMediaView setHasEverPlayed:](self, "setHasEverPlayed:", 1);
  }
  -[LPVisualMediaView didChangePlayingState:](self, "didChangePlayingState:", a4 == 2);
  if (a4 == 2)
  {
    -[LPVisualMediaView setWaitingForPlayback:](self, "setWaitingForPlayback:", 0);
    if (self->_allowingInteractionUntilPlaybackResumes)
    {
      self->_allowingInteractionUntilPlaybackResumes = 0;
      -[LPYouTubeVideoView setAllowsUserInteractionWithVideoPlayer:](self, "setAllowsUserInteractionWithVideoPlayer:", 0);
    }
  }
  else if (a4 == 1)
  {
    -[LPVisualMediaView resetToPlaceholderView](self, "resetToPlaceholderView");
  }
}

uint64_t __53__LPYouTubeVideoView_youTubePlayer_didChangeToState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsUserInteractionWithVideoPlayer:", 0);
}

- (void)youTubePlayer:(id)a3 didReceiveError:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "code") == 7)
    -[LPVisualMediaView didEncounterPossiblyTransientPlaybackError](self, "didEncounterPossiblyTransientPlaybackError");
  else
    -[LPVisualMediaView didEncounterPlaybackError](self, "didEncounterPlaybackError");

}

- (void)youTubePlayer:(id)a3 didChangeToFullScreen:(BOOL)a4
{
  -[LPVisualMediaView setFullScreen:](self, "setFullScreen:", a4);
  if (a4)
  {
    -[LPVisualMediaView fullScreenVideoDidPresent](self, "fullScreenVideoDidPresent");
  }
  else
  {
    -[LPVisualMediaView fullScreenVideoWillDismiss](self, "fullScreenVideoWillDismiss");
    -[LPVisualMediaView fullScreenVideoDidDismiss](self, "fullScreenVideoDidDismiss");
    self->_allowingInteractionUntilPlaybackResumes = 1;
    -[LPYouTubeVideoView setAllowsUserInteractionWithVideoPlayer:](self, "setAllowsUserInteractionWithVideoPlayer:", 1);
  }
}

- (BOOL)usesCustomFullScreenImplementation
{
  return 1;
}

- (void)enterCustomFullScreen
{
  -[LPYouTubePlayerView enterFullScreen](self->_platformYouTubeView, "enterFullScreen");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformYouTubeView, 0);
}

@end
