@implementation HMCameraAudioControl

- (HMCameraAudioControl)initWithAudioControl:(id)a3
{
  id v5;
  HMCameraAudioControl *v6;
  HMCameraAudioControl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraAudioControl;
  v6 = -[HMCameraControl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioControl, a3);

  return v7;
}

- (HMCharacteristic)mute
{
  void *v2;
  void *v3;

  -[HMCameraAudioControl audioControl](self, "audioControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)volume
{
  void *v2;
  void *v3;

  -[HMCameraAudioControl audioControl](self, "audioControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (_HMCameraAudioControl)audioControl
{
  return self->_audioControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioControl, 0);
}

@end
