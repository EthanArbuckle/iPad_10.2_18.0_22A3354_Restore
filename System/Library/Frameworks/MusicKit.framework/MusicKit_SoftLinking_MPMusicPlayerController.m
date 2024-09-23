@implementation MusicKit_SoftLinking_MPMusicPlayerController

+ (MusicKit_SoftLinking_MPMusicPlayerController)systemMusicPlayer
{
  if (systemMusicPlayer_sSystemMusicPlayerOnceToken[0] != -1)
    dispatch_once(systemMusicPlayer_sSystemMusicPlayerOnceToken, &__block_literal_global_9);
  return (MusicKit_SoftLinking_MPMusicPlayerController *)(id)systemMusicPlayer_sSystemMusicPlayer;
}

+ (MusicKit_SoftLinking_MPMusicPlayerController)applicationMusicPlayer
{
  if (applicationMusicPlayer_sApplicationMusicPlayerOnceToken != -1)
    dispatch_once(&applicationMusicPlayer_sApplicationMusicPlayerOnceToken, &__block_literal_global_6_0);
  return (MusicKit_SoftLinking_MPMusicPlayerController *)(id)applicationMusicPlayer_sApplicationMusicPlayer;
}

- (id)_initWithUnderlyingPlayerController:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPMusicPlayerController *v6;
  MusicKit_SoftLinking_MPMusicPlayerController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerController;
  v6 = -[MusicKit_SoftLinking_MPMusicPlayerController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingPlayerController, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPMusicPlayerControllerNowPlayingItemDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleNowPlayingItemDidChangeNotification_, v9, v7->_underlyingPlayerController);

    getMPMusicPlayerControllerPlaybackStateDidChangeNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handlePlaybackStateDidChangeNotification_, v10, v7->_underlyingPlayerController);

    get_MPMusicPlayerControllerQueueDidChangeNotification();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleQueueDidChangeNotification_, v11, v7->_underlyingPlayerController);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMusicPlayerControllerNowPlayingItemDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingPlayerController);

  getMPMusicPlayerControllerPlaybackStateDidChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, self->_underlyingPlayerController);

  get_MPMusicPlayerControllerQueueDidChangeNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v6, self->_underlyingPlayerController);

  v7.receiver = self;
  v7.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerController;
  -[MusicKit_SoftLinking_MPMusicPlayerController dealloc](&v7, sel_dealloc);
}

- (MusicKit_SoftLinking_MPMusicPlayerItem)nowPlayingItem
{
  void *v2;
  void *v3;

  -[MPMusicPlayerController nowPlayingItem](self->_underlyingPlayerController, "nowPlayingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MusicKit_SoftLinking_MPMusicPlayerItem playerItemForMediaItem:](MusicKit_SoftLinking_MPMusicPlayerItem, "playerItemForMediaItem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MusicKit_SoftLinking_MPMusicPlayerItem *)v3;
}

- (id)itemsForContentItemIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[MPMusicPlayerController _mediaItemsForContentItemIDs:](self->_underlyingPlayerController, "_mediaItemsForContentItemIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MusicKit_SoftLinking_MPMusicPlayerItem playerItemForMediaItem:](MusicKit_SoftLinking_MPMusicPlayerItem, "playerItemForMediaItem:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v5, "setObject:forKey:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)setNowPlayingItemWithIdentifier:(id)a3
{
  -[MPMusicPlayerController _setNowPlayingItemWithIdentifier:](self->_underlyingPlayerController, "_setNowPlayingItemWithIdentifier:", a3);
}

- (void)setQueueWithDescriptor:(id)a3
{
  id v4;

  objc_msgSend(a3, "_underlyingQueueDescriptor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerController setQueueWithDescriptor:](self->_underlyingPlayerController, "setQueueWithDescriptor:", v4);

}

- (void)prependQueueDescriptor:(id)a3
{
  id v4;

  objc_msgSend(a3, "_underlyingQueueDescriptor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerController prependQueueDescriptor:](self->_underlyingPlayerController, "prependQueueDescriptor:", v4);

}

- (void)appendQueueDescriptor:(id)a3
{
  id v4;

  objc_msgSend(a3, "_underlyingQueueDescriptor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerController appendQueueDescriptor:](self->_underlyingPlayerController, "appendQueueDescriptor:", v4);

}

- (void)performQueueTransaction:(id)a3
{
  id v4;
  MPMusicPlayerController *underlyingPlayerController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingPlayerController = self->_underlyingPlayerController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__MusicKit_SoftLinking_MPMusicPlayerController_performQueueTransaction___block_invoke;
  v7[3] = &unk_24CD1D6B8;
  v8 = v4;
  v6 = v4;
  -[MPMusicPlayerController performQueueTransaction:completionHandler:](underlyingPlayerController, "performQueueTransaction:completionHandler:", v7, &__block_literal_global_21);

}

- (int64_t)playbackState
{
  int64_t result;

  result = -[MPMusicPlayerController playbackState](self->_underlyingPlayerController, "playbackState");
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

- (int64_t)repeatMode
{
  int64_t result;

  result = -[MPMusicPlayerController repeatMode](self->_underlyingPlayerController, "repeatMode");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (void)setRepeatMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    a3 = 0;
  -[MPMusicPlayerController setRepeatMode:](self->_underlyingPlayerController, "setRepeatMode:", a3);
}

- (int64_t)shuffleMode
{
  int64_t result;

  result = -[MPMusicPlayerController shuffleMode](self->_underlyingPlayerController, "shuffleMode");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (void)setShuffleMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    a3 = 0;
  -[MPMusicPlayerController setShuffleMode:](self->_underlyingPlayerController, "setShuffleMode:", a3);
}

- (MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  return (MusicKit_SoftLinking_MPNowPlayingInfoAudioFormat *)-[MPMusicPlayerController nowPlayingAudioFormat](self->_underlyingPlayerController, "nowPlayingAudioFormat");
}

- (BOOL)isPreparedToPlay
{
  return -[MPMusicPlayerController isPreparedToPlay](self->_underlyingPlayerController, "isPreparedToPlay");
}

- (void)prepareToPlayWithCompletionHandler:(id)a3
{
  -[MPMusicPlayerController prepareToPlayWithCompletionHandler:](self->_underlyingPlayerController, "prepareToPlayWithCompletionHandler:", a3);
}

- (void)play
{
  -[MPMusicPlayerController play](self->_underlyingPlayerController, "play");
}

- (void)pause
{
  -[MPMusicPlayerController pause](self->_underlyingPlayerController, "pause");
}

- (void)stop
{
  -[MPMusicPlayerController stop](self->_underlyingPlayerController, "stop");
}

- (double)currentPlaybackTime
{
  double result;

  -[MPMusicPlayerController currentPlaybackTime](self->_underlyingPlayerController, "currentPlaybackTime");
  return result;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  -[MPMusicPlayerController setCurrentPlaybackTime:](self->_underlyingPlayerController, "setCurrentPlaybackTime:", a3);
}

- (float)currentPlaybackRate
{
  float result;

  -[MPMusicPlayerController currentPlaybackRate](self->_underlyingPlayerController, "currentPlaybackRate");
  return result;
}

- (void)setCurrentPlaybackRate:(float)a3
{
  -[MPMusicPlayerController setCurrentPlaybackRate:](self->_underlyingPlayerController, "setCurrentPlaybackRate:");
}

- (void)beginSeekingForward
{
  -[MPMusicPlayerController beginSeekingForward](self->_underlyingPlayerController, "beginSeekingForward");
}

- (void)beginSeekingBackward
{
  -[MPMusicPlayerController beginSeekingBackward](self->_underlyingPlayerController, "beginSeekingBackward");
}

- (void)endSeeking
{
  -[MPMusicPlayerController endSeeking](self->_underlyingPlayerController, "endSeeking");
}

- (void)skipToNextItem
{
  -[MPMusicPlayerController skipToNextItem](self->_underlyingPlayerController, "skipToNextItem");
}

- (void)skipToBeginning
{
  -[MPMusicPlayerController skipToBeginning](self->_underlyingPlayerController, "skipToBeginning");
}

- (void)skipToPreviousItem
{
  -[MPMusicPlayerController skipToPreviousItem](self->_underlyingPlayerController, "skipToPreviousItem");
}

- (void)beginGeneratingPlaybackNotifications
{
  -[MPMusicPlayerController beginGeneratingPlaybackNotifications](self->_underlyingPlayerController, "beginGeneratingPlaybackNotifications");
}

- (void)endGeneratingPlaybackNotifications
{
  -[MPMusicPlayerController endGeneratingPlaybackNotifications](self->_underlyingPlayerController, "endGeneratingPlaybackNotifications");
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  MPMusicPlayerController *v6;
  MPMusicPlayerController *v7;

  v6 = self->_underlyingPlayerController;
  if (a3 == 1)
  {
    v7 = v6;
    -[MPMusicPlayerController _setApplicationMusicPlayerTransitionType:withDuration:](v6, "_setApplicationMusicPlayerTransitionType:withDuration:", 1, a4);
    goto LABEL_5;
  }
  if (!a3)
  {
    v7 = v6;
    -[MPMusicPlayerController _setApplicationMusicPlayerTransitionType:](v6, "_setApplicationMusicPlayerTransitionType:", 0);
LABEL_5:
    v6 = v7;
  }

}

+ (NSString)nowPlayingItemDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMusicPlayerControllerNowPlayingItemDidChangeNotification");
}

+ (NSString)playbackQueueDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackQueueDidChangeNotification");
}

+ (NSString)playbackStateDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackStateDidChangeNotification");
}

+ (NSString)notificationUserInfoKeyContentItemIDs
{
  id *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (id *)get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr;
  v9 = get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr;
  if (!get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_9();
    v2 = (id *)dlsym(v3, "_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDs");
    v7[3] = (uint64_t)v2;
    get_MPMusicPlayerControllerNotificationUserInfoKeyContentItemIDsSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return (NSString *)*v2;
}

- (void)_handleNowPlayingItemDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMusicPlayerControllerNowPlayingItemDidChangeNotification"), self, v6);
}

- (void)_handleQueueDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackQueueDidChangeNotification"), self, v6);
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMusicPlayerControllerPlaybackStateDidChangeNotification"), self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlayerController, 0);
}

@end
