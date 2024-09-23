@implementation AudioPlayerImpl

- (AudioPlayerImpl)init
{
  AudioPlayerImpl *v2;
  AudioPlayerImpl *v3;
  AVAudioSession *v4;
  AVAudioSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AudioPlayerImpl;
  v2 = -[AudioPlayerImpl init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_delegate, 0);
    v3->_channelAssignments = 0;
    *(_OWORD *)&v3->_data = 0u;
    *(_OWORD *)&v3->_actualSettings = 0u;
    v4 = (AVAudioSession *)objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
    v3->_audioSession = v4;
    v5 = v4;
    v3->_localPlayer = 0;
    v3->_playRetain = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *localPlayer;
  OpaqueAudioFileID *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  NSObject *gcd;
  objc_super v9;

  localPlayer = self->_localPlayer;
  self->_localPlayer = 0;
  __dmb(0xBu);
  if (localPlayer)
  {
    *((_BYTE *)localPlayer + 313) = 1;
    pthread_mutex_lock(&avap_mutex);
    AVAudioPlayerCpp::disposeQueue((AVAudioPlayerCpp *)localPlayer, 1);
    v4 = (OpaqueAudioFileID *)*((_QWORD *)localPlayer + 20);
    if (v4)
      AudioFileClose(v4);
    AVAudioPlayerCpp::freeChannelAssignments((AVAudioPlayerCpp *)localPlayer);
    free(*((void **)localPlayer + 48));
    free(*((void **)localPlayer + 16));
    free(*((void **)localPlayer + 18));

    *((_QWORD *)localPlayer + 64) = 0;
    if (*(_QWORD *)localPlayer)
      CFRelease(*(CFTypeRef *)localPlayer);
    v5 = (const void *)*((_QWORD *)localPlayer + 1);
    if (v5)
      CFRelease(v5);
    v6 = (const void *)*((_QWORD *)localPlayer + 2);
    if (v6)
      CFRelease(v6);
    pthread_mutex_unlock(&avap_mutex);
    v7 = (const void *)*((_QWORD *)localPlayer + 67);
    if (v7)
      CFRelease(v7);
    MEMORY[0x1A1AC5BD4](localPlayer, 0x10F0C4015DEEB49);
  }
  objc_storeWeak((id *)&self->_delegate, 0);

  self->_data = 0;
  self->_url = 0;

  self->_actualSettings = 0;
  self->_format = 0;

  self->_channelAssignments = 0;
  self->_audioSession = 0;
  gcd = self->_gcd;
  if (gcd)
  {
    dispatch_release(gcd);
    self->_gcd = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)AudioPlayerImpl;
  -[AudioPlayerImpl dealloc](&v9, sel_dealloc);
}

@end
