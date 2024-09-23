@implementation AudioDrainOperation

- (AudioDrainOperation)initWithAudioFileURL:(id)a3 volume:(float)a4 responder:(id)a5
{
  id v9;
  id v10;
  AudioDrainOperation *v11;
  AudioDrainOperation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AudioDrainOperation;
  v11 = -[AudioDrainOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_audioFileURL, a3);
    objc_storeWeak((id *)&v12->_responder, v10);
    v12->_requestedVolume = a4;
  }

  return v12;
}

- (void)main
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = objc_alloc((Class)AVAudioPlayer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioFileURL](self, "audioFileURL"));
  v15 = 0;
  v5 = objc_msgSend(v3, "initWithContentsOfURL:error:", v4, &v15);
  v6 = v15;
  -[AudioDrainOperation setAudioPlayer:](self, "setAudioPlayer:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioPlayer](self, "audioPlayer"));
  if (v7)
  {
    if (!v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation responder](self, "responder"));
      objc_msgSend(v8, "enableVolumeHUD:", 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      objc_msgSend(v9, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeRaw, 1, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      objc_msgSend(v10, "getActiveCategoryVolume:andName:", &self->_originalVolume, 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      -[AudioDrainOperation requestedVolume](self, "requestedVolume");
      objc_msgSend(v11, "setActiveCategoryVolumeTo:");

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioPlayer](self, "audioPlayer"));
      objc_msgSend(v12, "setNumberOfLoops:", -1);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioPlayer](self, "audioPlayer"));
      objc_msgSend(v13, "setDelegate:", self);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioPlayer](self, "audioPlayer"));
      objc_msgSend(v14, "play");

    }
  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioPlayer](self, "audioPlayer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    -[AudioDrainOperation originalVolume](self, "originalVolume");
    objc_msgSend(v4, "setActiveCategoryVolumeTo:");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation responder](self, "responder"));
    objc_msgSend(v5, "enableVolumeHUD:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioDrainOperation audioPlayer](self, "audioPlayer"));
    objc_msgSend(v6, "stop");

    -[AudioDrainOperation setAudioPlayer:](self, "setAudioPlayer:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)AudioDrainOperation;
  -[DrainOperation cancel](&v7, "cancel");
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileURL, a3);
}

- (DKResponder)responder
{
  return (DKResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (float)requestedVolume
{
  return self->_requestedVolume;
}

- (void)setRequestedVolume:(float)a3
{
  self->_requestedVolume = a3;
}

- (float)originalVolume
{
  return self->_originalVolume;
}

- (void)setOriginalVolume:(float)a3
{
  self->_originalVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_responder);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
}

@end
