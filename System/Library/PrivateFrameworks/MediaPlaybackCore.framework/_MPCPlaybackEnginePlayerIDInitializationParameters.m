@implementation _MPCPlaybackEnginePlayerIDInitializationParameters

- (_MPCPlaybackEnginePlayerIDInitializationParameters)initWithPlayerID:(id)a3
{
  id v4;
  _MPCPlaybackEnginePlayerIDInitializationParameters *v5;
  uint64_t v6;
  NSString *playerID;
  uint64_t v8;
  MPRemoteCommandCenter *remoteCommandCenter;
  uint64_t v10;
  MPNowPlayingInfoCenter *nowPlayingInfoCenter;
  AVAudioSession *audioSession;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPCPlaybackEnginePlayerIDInitializationParameters;
  v5 = -[_MPCPlaybackEnginePlayerIDInitializationParameters init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playerID = v5->_playerID;
    v5->_playerID = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDDCB60]), "initWithPlayerID:", v4);
    remoteCommandCenter = v5->_remoteCommandCenter;
    v5->_remoteCommandCenter = (MPRemoteCommandCenter *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDDCAC8]), "initWithPlayerID:", v4);
    nowPlayingInfoCenter = v5->_nowPlayingInfoCenter;
    v5->_nowPlayingInfoCenter = (MPNowPlayingInfoCenter *)v10;

    audioSession = v5->_audioSession;
    v5->_audioSession = 0;

  }
  return v5;
}

- (MPNowPlayingInfoCenter)nowPlayingInfoCenter
{
  return self->_nowPlayingInfoCenter;
}

- (MPRemoteCommandCenter)remoteCommandCenter
{
  return self->_remoteCommandCenter;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_remoteCommandCenter, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoCenter, 0);
}

@end
