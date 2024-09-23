@implementation ACCAudioManager

+ (id)sharedACCAudioManager
{
  if (sharedACCAudioManager_once != -1)
    dispatch_once(&sharedACCAudioManager_once, &__block_literal_global);
  return (id)sharedACCAudioManager_sharedInstance;
}

void __40__ACCAudioManager_sharedACCAudioManager__block_invoke()
{
  ACCAudioManager *v0;
  void *v1;

  v0 = objc_alloc_init(ACCAudioManager);
  v1 = (void *)sharedACCAudioManager_sharedInstance;
  sharedACCAudioManager_sharedInstance = (uint64_t)v0;

}

- (ACCAudioManager)init
{
  ACCAudioManager *v2;
  ACCAudioClient *v3;
  ACCAudioClient *audioClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACCAudioManager;
  v2 = -[ACCAudioManager init](&v6, sel_init);
  if (v2)
  {
    v3 = -[ACCAudioClient initWithDelegate:]([ACCAudioClient alloc], "initWithDelegate:", v2);
    audioClient = v2->_audioClient;
    v2->_audioClient = v3;

  }
  return v2;
}

- (BOOL)setDigitalAudioSampleRate:(unsigned int)a3
{
  return -[ACCAudioClient setDigitalAudioSampleRate:](self->_audioClient, "setDigitalAudioSampleRate:", *(_QWORD *)&a3);
}

- (unsigned)supportedDigitalAudioSampleRate:(unsigned int)a3
{
  return -[ACCAudioClient supportedDigitalAudioSampleRate:](self->_audioClient, "supportedDigitalAudioSampleRate:", *(_QWORD *)&a3);
}

- (id)supportedDigitalAudioSampleRates
{
  return -[ACCAudioClient supportedDigitalAudioSampleRates](self->_audioClient, "supportedDigitalAudioSampleRates");
}

- (id)deviceAudioStates
{
  return -[ACCAudioClient deviceAudioStates](self->_audioClient, "deviceAudioStates");
}

- (BOOL)allowBackgroundAudioForClient:(id)a3
{
  return -[ACCAudioClient allowBackgroundAudioForClient:](self->_audioClient, "allowBackgroundAudioForClient:", a3);
}

- (ACCAudioClient)audioClient
{
  return self->_audioClient;
}

- (void)setAudioClient:(id)a3
{
  objc_storeStrong((id *)&self->_audioClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioClient, 0);
}

@end
