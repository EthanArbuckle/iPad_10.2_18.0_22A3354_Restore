@implementation LPAudioPlayerMediaPlayableAdaptor

- (LPAudioPlayerMediaPlayableAdaptor)initWithPlayer:(id)a3
{
  id v4;
  LPAudioPlayerMediaPlayableAdaptor *v5;
  LPAudioPlayerMediaPlayableAdaptor *v6;
  LPAudioPlayerMediaPlayableAdaptor *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPAudioPlayerMediaPlayableAdaptor;
  v5 = -[LPAudioPlayerMediaPlayableAdaptor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_player, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isPlaying
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  v3 = objc_msgSend(WeakRetained, "state") == 2;

  return v3;
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  id v5;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "play");
  else
    objc_msgSend(WeakRetained, "pause");

}

- (void)resetPlaybackState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  objc_msgSend(WeakRetained, "reset");

}

- (BOOL)hasMuteControl
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
}

@end
