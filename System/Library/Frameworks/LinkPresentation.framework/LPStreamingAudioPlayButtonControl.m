@implementation LPStreamingAudioPlayButtonControl

- (LPStreamingAudioPlayButtonControl)initWithAudio:(id)a3 style:(id)a4 theme:(id)a5 player:(id)a6
{
  id v9;
  id v10;
  id v11;
  LPStreamingAudioPlayButtonControl *v12;
  LPStreamingAudioPlayButtonControl *v13;
  id *p_player;
  LPAudioPlayerMediaPlayableAdaptor *v15;
  LPAudioPlayerMediaPlayableAdaptor *playableAdaptor;
  id v17;
  LPStreamingAudioPlayButtonControl *v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = -[LPPlayButtonControl initWithStyle:theme:](self, "initWithStyle:theme:", v9, v10);
  v13 = v12;
  if (v12)
  {
    p_player = (id *)&v12->_player;
    objc_storeStrong((id *)&v12->_player, a6);
    v15 = -[LPAudioPlayerMediaPlayableAdaptor initWithPlayer:]([LPAudioPlayerMediaPlayableAdaptor alloc], "initWithPlayer:", *p_player);
    playableAdaptor = v13->_playableAdaptor;
    v13->_playableAdaptor = v15;

    objc_msgSend(*p_player, "addClient:", v13);
    v17 = *p_player;
    objc_msgSend(*p_player, "progress");
    -[LPStreamingAudioPlayButtonControl audioPlayer:didChangeProgress:](v13, "audioPlayer:didChangeProgress:", v17);
    -[LPStreamingAudioPlayButtonControl audioPlayer:didTransitionToState:](v13, "audioPlayer:didTransitionToState:", *p_player, objc_msgSend(*p_player, "state"));
    v18 = v13;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[LPAudioPlayer removeClient:](self->_player, "removeClient:", self);
  v3.receiver = self;
  v3.super_class = (Class)LPStreamingAudioPlayButtonControl;
  -[LPStreamingAudioPlayButtonControl dealloc](&v3, sel_dealloc);
}

- (void)audioPlayer:(id)a3 didTransitionToState:(unint64_t)a4
{
  -[LPPlayButtonControl setPlayButtonState:](self, "setPlayButtonState:", (a4 & 0xFFFFFFFFFFFFFFFBLL) != 0);
  -[LPPlayButtonControl showPlayIndicator:](self, "showPlayIndicator:", a4 - 3 < 0xFFFFFFFFFFFFFFFELL);
  if (a4 == 1)
    -[LPPlayButtonControl beginIndeterminateAnimation](self, "beginIndeterminateAnimation");
  else
    -[LPPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation");
}

- (void)audioPlayer:(id)a3 didChangeProgress:(float)a4
{
  -[LPAudioPlayer progress](self->_player, "progress", a3);
  -[LPPlayButtonControl setProgress:animated:](self, "setProgress:animated:", 1);
}

- (void)buttonPressed:(id)a3
{
  if (-[LPAudioPlayer state](self->_player, "state", a3) == 1 || -[LPAudioPlayer state](self->_player, "state") == 2)
    -[LPAudioPlayer pause](self->_player, "pause");
  else
    -[LPAudioPlayer play](self->_player, "play");
}

- (id)playable
{
  return self->_playableAdaptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playableAdaptor, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
