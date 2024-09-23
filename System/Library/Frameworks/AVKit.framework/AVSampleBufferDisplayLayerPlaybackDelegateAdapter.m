@implementation AVSampleBufferDisplayLayerPlaybackDelegateAdapter

+ (id)playbackDelegateAdapterWithDelegate:(id)a3
{
  id v3;
  id v4;
  id *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AVSampleBufferDisplayLayerPlaybackDelegateAdapter;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v7, sel_alloc);
  v5 = (id *)objc_msgSend(v4, "init", v7.receiver, v7.super_class);
  objc_storeWeak(v5 + 1, v3);

  return v5;
}

- (void)pictureInPictureController:(id)a3 setPlaying:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v7 & 1) != 0 || (v9 & 1) != 0)
  {
    if (v4)
    {
      if ((v7 & 1) != 0)
        objc_msgSend(v10, "pictureInPictureControllerStartPlayback:", v12);
    }
    else if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "pictureInPictureControllerStopPlayback:", v12);
    }
  }
  else
  {
    objc_msgSend(v10, "pictureInPictureController:setPlaying:", v12, v4);
  }

}

- ($008D8879F9973785877FFE498A5CE36E)pictureInPictureControllerTimeRangeForPlayback:(SEL)a3
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  $008D8879F9973785877FFE498A5CE36E *result;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a4;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11)
    {
      objc_msgSend(v11, "pictureInPictureControllerTimeRangeForPlayback:", v6);
      goto LABEL_7;
    }
LABEL_6:
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    goto LABEL_7;
  }
  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v9, "pictureInPictureControllerPlaybackTimeRange:", v6);
LABEL_7:
  *(_OWORD *)&retstr->var0.var0 = v13;
  *(_OWORD *)&retstr->var0.var3 = v14;
  *(_OWORD *)&retstr->var1.var1 = v15;

  return result;
}

- (BOOL)pictureInPictureControllerIsPlaybackPaused:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    v9 = objc_msgSend(v7, "pictureInPictureControllerPlaybackPaused:", v4);
  else
    v9 = objc_msgSend(v7, "pictureInPictureControllerIsPlaybackPaused:", v4);
  v10 = v9;

  return v10;
}

- (void)pictureInPictureController:(id)a3 didTransitionToRenderSize:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pictureInPictureController:didTransitionToRenderSize:", v6, a4);

}

- (void)pictureInPictureController:(id)a3 skipByInterval:(id *)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v8 = a5;
  v9 = a3;
  -[AVSampleBufferDisplayLayerPlaybackDelegateAdapter playbackDelegate](self, "playbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *a4;
  objc_msgSend(v10, "pictureInPictureController:skipByInterval:completionHandler:", v9, &v11, v8);

}

- (AVPictureInPictureSampleBufferPlaybackDelegate)playbackDelegate
{
  return (AVPictureInPictureSampleBufferPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_playbackDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playbackDelegate);
}

@end
