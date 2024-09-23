@implementation MPCMediaRemoteMiddleware

- (void)setInvalidationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationObservers, a3);
}

- (int64_t)playerShuffleType:(int64_t)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = *MEMORY[0x24BE65678];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 26, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "unsignedIntegerValue");
    a3 = MPShuffleTypeFromMediaRemoteShuffleMode();
  }
  objc_msgSend(v7, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerShuffleType:chain:", a3, v7);

  return v10;
}

- (int64_t)playerExplicitContentState:(int64_t)a3 chain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v6 = a4;
  -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDDC498]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v12, "integerValue");

  }
  objc_msgSend(v6, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "playerExplicitContentState:chain:", a3, v6);

  return v14;
}

- (BOOL)playerIsSharedListeningSession:(BOOL)a3 chain:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[MPCMediaRemoteMiddleware supportedCommands](self, "supportedCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "commandInfoForCommand:", 139);

  v8 = v7 != 0;
  objc_msgSend(v5, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "playerIsSharedListeningSession:chain:", v8, v5);

  return v8;
}

- (int64_t)playerState:(int64_t)a3 chain:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playerState:chain:", -[MPCMediaRemoteMiddleware playerState](self, "playerState"), v5);

  return v7;
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (int64_t)playerRepeatType:(int64_t)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = *MEMORY[0x24BE65670];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 25, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "unsignedIntegerValue");
    a3 = MPRepeatTypeFromMediaRemoteRepeatMode();
  }
  objc_msgSend(v7, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerRepeatType:chain:", a3, v7);

  return v10;
}

- (id)_supportedCommands:(unsigned int)a3 infoValueForKey:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[MPCMediaRemoteMiddleware supportedCommands](self, "supportedCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "commandInfoForCommand:", v4);

  if (v8)
    v8 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();

  return v8;
}

- (BOOL)playerCommandEnabled:(BOOL)a3 command:(unsigned int)a4 chain:(id)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = a5;
  -[MPCMediaRemoteMiddleware supportedCommands](self, "supportedCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "commandInfoForCommand:", v5);

  if (v10)
    v6 = MRMediaRemoteCommandInfoGetEnabled() != 0;
  objc_msgSend(v8, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "playerCommandEnabled:command:chain:", v6, v5, v8);

  return v12;
}

- (MPCSupportedCommands)supportedCommands
{
  return self->_supportedCommands;
}

- (id)tracklistUniqueIdentifier:(id)a3 chain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[MPCMediaRemoteMiddleware queueIdentifier](self, "queueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 133, *MEMORY[0x24BE65630]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v6;
    v10 = v13;

  }
  objc_msgSend(v7, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tracklistUniqueIdentifier:chain:", v10, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)playerUpNextItemCount:(int64_t)a3 chain:(id)a4
{
  id v5;
  void *v6;
  uint64_t IntegerValueForKey;
  void *v8;
  int64_t v9;

  v5 = a4;
  -[MPCMediaRemoteMiddleware supportedCommands](self, "supportedCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IntegerValueForKey = objc_msgSend(v6, "commandInfoForCommand:", 122);

  if (IntegerValueForKey)
    IntegerValueForKey = (int)MRMediaRemoteCommandInfoGetIntegerValueForKey();
  objc_msgSend(v5, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "playerUpNextItemCount:chain:", IntegerValueForKey, v5);

  return v9;
}

- (int64_t)playerQueueEndAction:(int64_t)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = *MEMORY[0x24BE655F0];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 135, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    a3 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v7, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerQueueEndAction:chain:", a3, v7);

  return v10;
}

- (int64_t)playerLastChangeDirection:(int64_t)a3 chain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v6 = a4;
  -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDDC4B8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = objc_msgSend(v12, "integerValue");
  }
  objc_msgSend(v6, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "playerLastChangeDirection:chain:", a3, v6);

  return v14;
}

- (int64_t)playerGlobalItemCount:(int64_t)a3 chain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;

  v6 = a4;
  -[MPCMediaRemoteMiddleware queueProperties](self, "queueProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("totalItemCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    a3 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemAtIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "auxiliaryNowPlayingInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE65868]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v14, "integerValue");

    }
  }
  objc_msgSend(v6, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "playerGlobalItemCount:chain:", a3, v6);

  return v16;
}

- (int64_t)playerPlayingItemGlobalIndex:(int64_t)a3 chain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v6 = a4;
  -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "auxiliaryNowPlayingInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE65820]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v12, "integerValue");

  }
  objc_msgSend(v6, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "playerPlayingItemGlobalIndex:chain:", a3, v6);

  return v14;
}

- (NSIndexPath)playingIndexPath
{
  return self->_playingIndexPath;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (BOOL)sectionIsAutoPlaySection:(BOOL)a3 atIndex:(int64_t)a4 chain:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v8 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDDC4A0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v8, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v14, "sectionIsAutoPlaySection:atIndex:chain:", v13 | v6, a4, v8);

  return a4;
}

- (void)setQueueParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_queueParticipants, a3);
}

- (id)preferredAudioFormat:(id)a3 chain:(id)a4
{
  MPCPlayerAudioFormat *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerAudioFormat *v12;
  MPCPlayerAudioFormat *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = (MPCPlayerAudioFormat *)a3;
  v8 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndexPath:", self->_playingIndexPath);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 429, CFSTR("Could not find content item at indexPath: %@"), self->_playingIndexPath);

  }
  objc_msgSend(v10, "preferredFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v7;
  if (v11)
  {
    v13 = [MPCPlayerAudioFormat alloc];
    objc_msgSend(v10, "preferredFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCPlayerAudioFormat initWithNowPlayingInfoAudioFormat:](v13, "initWithNowPlayingInfoAudioFormat:", v14);

  }
  objc_msgSend(v8, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredAudioFormat:chain:", v12, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)playerItemLanguageOptionGroups:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v8 = a4;
  v9 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemAtIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 316, CFSTR("Could not find content item at indexPath: %@"), v8);

  }
  objc_msgSend(v9, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "availableLanguageOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v12, "playerItemLanguageOptionGroups:atIndexPath:chain:", v14, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- ($04B05C73ED6AEEF31C5815932084562D)playerItemDuration:(SEL)a3 atIndexPath:(id *)a4 chain:(id)a5
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  char v32;
  int64_t v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  $04B05C73ED6AEEF31C5815932084562D *result;
  void *v39;
  char v40;
  _QWORD v41[5];
  int v42;
  int v43;
  char v44;
  char v45;
  char v46;
  int v47;
  char v48;

  v10 = a5;
  v11 = a6;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemAtIndexPath:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("MPCMediaRemoteMiddleware.m"), 198, CFSTR("Could not find content item at indexPath: %@"), v10);

  }
  if ((objc_msgSend(v13, "isLoading") & 1) != 0)
  {
    v40 = 1;
  }
  else
  {
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDDC4A8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v15, "BOOLValue");

  }
  objc_msgSend(v13, "elapsedTimeTimestamp");
  v17 = v16;
  objc_msgSend(v13, "startTime");
  v19 = v18;
  objc_msgSend(v13, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDDC488]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;
  objc_msgSend(v13, "duration");
  v25 = v24;
  objc_msgSend(v13, "elapsedTime");
  v27 = v26;
  -[MPCMediaRemoteMiddleware _playbackRateForContentItem:](self, "_playbackRateForContentItem:", v13);
  v29 = v28;
  objc_msgSend(v13, "defaultPlaybackRate");
  v31 = v30;
  v32 = objc_msgSend(v13, "isAlwaysLiveItem");
  v33 = -[MPCMediaRemoteMiddleware playerState](self, "playerState");
  v34 = objc_msgSend(v13, "isInTransition");

  objc_msgSend(v11, "nextObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v40;
    if (v33 != 2)
      v37 = 0;
    v41[0] = v17;
    v41[1] = v19;
    v41[2] = v23;
    v41[3] = v25;
    v41[4] = v27;
    v42 = v29;
    v43 = v31;
    v44 = v32;
    v45 = v37;
    v46 = v34;
    v47 = 0;
    v48 = 0;
    objc_msgSend(v35, "playerItemDuration:atIndexPath:chain:", v41, v10, v11);
  }
  else
  {
    *(_QWORD *)&retstr->var7 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  return result;
}

- (id)playerItemCurrentLanguageOptions:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v8 = a4;
  v9 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemAtIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 322, CFSTR("Could not find content item at indexPath: %@"), v8);

  }
  objc_msgSend(v9, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentLanguageOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v12, "playerItemCurrentLanguageOptions:atIndexPath:chain:", v14, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)activeAudioFormat:(id)a3 chain:(id)a4
{
  MPCPlayerAudioFormat *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerAudioFormat *v12;
  MPCPlayerAudioFormat *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = (MPCPlayerAudioFormat *)a3;
  v8 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndexPath:", self->_playingIndexPath);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 439, CFSTR("Could not find content item at indexPath: %@"), self->_playingIndexPath);

  }
  objc_msgSend(v10, "activeFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v7;
  if (v11)
  {
    v13 = [MPCPlayerAudioFormat alloc];
    objc_msgSend(v10, "activeFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCPlayerAudioFormat initWithNowPlayingInfoAudioFormat:](v13, "initWithNowPlayingInfoAudioFormat:", v14);

  }
  objc_msgSend(v8, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeAudioFormat:chain:", v12, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (float)_playbackRateForContentItem:(id)a3
{
  id v4;
  float v5;
  float v6;

  v4 = a3;
  objc_msgSend(v4, "playbackRate");
  v6 = v5;
  switch(-[MPCMediaRemoteMiddleware playerState](self, "playerState"))
  {
    case 1:
    case 4:
    case 6:
      v6 = 0.0;
      break;
    case 2:
      objc_msgSend(objc_retainAutorelease(v4), "_mediaRemoteContentItem");
      if (!MRContentItemHasPlaybackRate())
        v6 = 1.0;
      break;
    default:
      break;
  }

  return v6;
}

- (id)participant:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "associatedParticipantIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MPCMediaRemoteMiddleware queueParticipants](self, "queueParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v8, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "participant:atIndexPath:chain:", v13, v7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  if (objc_msgSend(v11, "length") == 1)
  {
    -[MPSectionedCollection sectionAtIndex:](self->_queueModelObjects, "sectionAtIndex:", objc_msgSend(v11, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v11, "length") != 2)
    {
      if (objc_msgSend(0, "type"))
      {
LABEL_11:
        v15 = v10;
        goto LABEL_12;
      }
      v15 = 0;
LABEL_10:

      goto LABEL_11;
    }
    -[MPSectionedCollection itemAtIndexPath:](self->_queueModelObjects, "itemAtIndexPath:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if (!objc_msgSend(v14, "type"))
    goto LABEL_10;
  if (!v15)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v12, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerModelObject:propertySet:atIndexPath:chain:", v15, v13, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MPCFuture)controllerFuture
{
  return self->_controllerFuture;
}

- (void)setControllerFuture:(id)a3
{
  objc_storeStrong((id *)&self->_controllerFuture, a3);
}

- (void)setPlayerState:(int64_t)a3
{
  self->_playerState = a3;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void)setSupportedCommands:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCommands, a3);
}

- (MPCMediaRemoteController)controller
{
  return self->_controller;
}

- (void)setQueueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)playerItemIsFavoritable:(BOOL)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  char v14;
  void *v16;

  v8 = a4;
  v9 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemAtIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 421, CFSTR("Could not find content item at indexPath: %@"), v8);

  }
  if ((objc_msgSend(v11, "mediaType") & 1) != 0)
    v12 = 1;
  else
    v12 = ((unint64_t)objc_msgSend(v11, "mediaType") >> 11) & 1;
  objc_msgSend(v9, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "playerItemIsFavoritable:atIndexPath:chain:", v12, v8, v9);

  return v14;
}

- (void)setQueueModelObjects:(id)a3
{
  objc_storeStrong((id *)&self->_queueModelObjects, a3);
}

- (void)setQueueContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_queueContentItems, a3);
}

- (void)setPlayingIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)operationsForPlayerRequest:(id)a3
{
  id v4;
  id v5;
  MPCMediaRemoteMiddlewareControllerOperation *v6;
  void *v7;
  MPCMediaRemoteMiddlewareControllerOperation *v8;
  void *v9;
  MPCMediaRemoteMiddlewareMetadataOperation *v10;
  MPCMediaRemoteMiddlewareParticipantsOperation *v11;
  MPCMediaRemoteMiddlewareCommandsOperation *v12;
  MPCMediaRemoteMiddlewarePlaybackStateOperation *v13;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = [MPCMediaRemoteMiddlewareControllerOperation alloc];
  objc_msgSend(v4, "playerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPCMediaRemoteMiddlewareControllerOperation initWithMiddleware:playerPath:](v6, "initWithMiddleware:playerPath:", self, v7);

  objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(v4, "playingItemProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v4, "queueSectionProperties"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v4, "queueItemProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      self->_skippedMetadata = 1;
      goto LABEL_5;
    }
  }
  v10 = -[MPCMediaRemoteMiddlewareMetadataOperation initWithMiddleware:request:]([MPCMediaRemoteMiddlewareMetadataOperation alloc], "initWithMiddleware:request:", self, v4);
  -[MPCMediaRemoteMiddlewareMetadataOperation addDependency:](v10, "addDependency:", v8);
  objc_msgSend(v5, "addObject:", v10);
  v11 = -[MPCMediaRemoteMiddlewareParticipantsOperation initWithMiddleware:]([MPCMediaRemoteMiddlewareParticipantsOperation alloc], "initWithMiddleware:", self);
  -[MPCMediaRemoteMiddlewareParticipantsOperation addDependency:](v11, "addDependency:", v8);
  objc_msgSend(v5, "addObject:", v11);

LABEL_5:
  v12 = -[MPCMediaRemoteMiddlewareCommandsOperation initWithMiddleware:]([MPCMediaRemoteMiddlewareCommandsOperation alloc], "initWithMiddleware:", self);
  -[MPCMediaRemoteMiddlewareCommandsOperation addDependency:](v12, "addDependency:", v8);
  objc_msgSend(v5, "addObject:", v12);
  v13 = -[MPCMediaRemoteMiddlewarePlaybackStateOperation initWithMiddleware:]([MPCMediaRemoteMiddlewarePlaybackStateOperation alloc], "initWithMiddleware:", self);
  -[MPCMediaRemoteMiddlewarePlaybackStateOperation addDependency:](v13, "addDependency:", v8);
  objc_msgSend(v5, "addObject:", v13);

  return v5;
}

- (unint64_t)playerNumberOfSections:(unint64_t)a3 chain:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v5 = a4;
  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "playerNumberOfSections:chain:", objc_msgSend(v7, "numberOfSections"), v5);

  return v8;
}

- (int64_t)activeAudioFormatJustification:(int64_t)a3 chain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v13;

  v6 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemAtIndexPath:", self->_playingIndexPath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 449, CFSTR("Could not find content item at indexPath: %@"), self->_playingIndexPath);

  }
  v9 = objc_msgSend(v8, "activeFormatJustification");
  objc_msgSend(v6, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "activeAudioFormatJustification:chain:", v9, v6);

  return v11;
}

- (id)alternateAudioFormats:(id)a3 chain:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndexPath:", self->_playingIndexPath);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 465, CFSTR("Could not find content item at indexPath: %@"), self->_playingIndexPath);

  }
  objc_msgSend(v10, "alternativeFormats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "msv_map:", &__block_literal_global_11599);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alternateAudioFormats:chain:", v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)playerItemIsPlaceholder:(BOOL)a3 atIndexPath:(id)a4 chain:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemAtIndexPath:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 247, CFSTR("Could not find content item at indexPath: %@"), v9);

  }
  objc_msgSend(v12, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDDC4B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v6 = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v10, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "playerItemIsPlaceholder:atIndexPath:chain:", v6, v9, v10);

  return v16;
}

- (id)playerItemExplicitBadge:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 231, CFSTR("Could not find content item at indexPath: %@"), v7);

  }
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDDC490]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)audioFormatPreference:(unint64_t)a3 chain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v13;

  v6 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemAtIndexPath:", self->_playingIndexPath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 457, CFSTR("Could not find content item at indexPath: %@"), self->_playingIndexPath);

  }
  v9 = objc_msgSend(v8, "formatTierPreference");
  objc_msgSend(v6, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "audioFormatPreference:chain:", v9, v6);

  return v11;
}

- (id)playerItemLocalizedDurationString:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemAtIndexPath:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 223, CFSTR("Could not find content item at indexPath: %@"), v10);

  }
  objc_msgSend(v13, "localizedDurationString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playerItemLocalizedDurationString:atIndexPath:chain:", v14, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)audioRoute:(id)a3 chain:(id)a4
{
  MPCPlayerAudioRoute *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerAudioRoute *v12;
  MPCPlayerAudioRoute *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = (MPCPlayerAudioRoute *)a3;
  v8 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndexPath:", self->_playingIndexPath);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 475, CFSTR("Could not find content item at indexPath: %@"), self->_playingIndexPath);

  }
  objc_msgSend(v10, "audioRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v7;
  if (v11)
  {
    v13 = [MPCPlayerAudioRoute alloc];
    objc_msgSend(v10, "audioRoute");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCPlayerAudioRoute initWithNowPlayingInfoAudioRoute:](v13, "initWithNowPlayingInfoAudioRoute:", v14);

  }
  objc_msgSend(v8, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "audioRoute:chain:", v12, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)playerNumberOfItems:(unint64_t)a3 inSection:(unint64_t)a4 chain:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v8 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v10, "numberOfItemsInSection:", a4);

  }
  objc_msgSend(v8, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "playerNumberOfItems:inSection:chain:", a3, a4, v8);

  return v12;
}

- (MPSectionedCollection)queueContentItems
{
  return self->_queueContentItems;
}

- (id)playerPlayingItemIndexPath:(id)a3 chain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[MPCMediaRemoteMiddleware playingIndexPath](self, "playingIndexPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  objc_msgSend(v6, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerPlayingItemIndexPath:chain:", v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)controller:(id)a3 chain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[MPCMediaRemoteMiddleware controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  if (v8)
  {
    -[MPCMediaRemoteMiddleware controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controller:chain:", v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)operationsForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCMediaRemoteMiddleware operationsForPlayerRequest:](self, "operationsForPlayerRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueProperties, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_playingIndexPath, 0);
  objc_storeStrong((id *)&self->_lastSectionContentItem, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_queueModelObjects, 0);
  objc_storeStrong((id *)&self->_queueParticipants, 0);
  objc_storeStrong((id *)&self->_queueContentItems, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_controllerFuture, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)playerCommandOptionValue:(id)a3 forKey:(id)a4 command:(unsigned int)a5 chain:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a6;
  v12 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v10;
  if (v13)
  {
    v15 = v13;

  }
  objc_msgSend(v11, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerCommandOptionValue:forKey:command:chain:", v15, v12, v7, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("_skippedMetadata");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_skippedMetadata);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("controller");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self->_controller);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("invalidationObservers");
  -[MPCMediaRemoteMiddleware invalidationObservers](self, "invalidationObservers");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("<NULL>");
  if (v6)
    v8 = (const __CFString *)v6;
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (NSDictionary)queueParticipants
{
  return self->_queueParticipants;
}

- (MPSectionedCollection)queueModelObjects
{
  return self->_queueModelObjects;
}

- (MPNowPlayingContentItem)lastSectionContentItem
{
  return self->_lastSectionContentItem;
}

- (void)setLastSectionContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastSectionContentItem, a3);
}

- (NSDictionary)queueProperties
{
  return self->_queueProperties;
}

- (void)setQueueProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)skippedMetadata
{
  return self->_skippedMetadata;
}

- (int64_t)playerItemEditingStyleFlags:(int64_t)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  void *v16;

  v8 = a4;
  v9 = a5;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemAtIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 239, CFSTR("Could not find content item at indexPath: %@"), v8);

  }
  v12 = objc_msgSend(v11, "editingStyleFlags");
  objc_msgSend(v9, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "playerItemEditingStyleFlags:atIndexPath:chain:", v12, v8, v9);

  return v14;
}

- (id)playerItemContentID:(id)a3 atIndexPath:(id)a4 chain:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playerItemContentID:atIndexPath:chain:", v12, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)playerItemShouldDisableJumpToItem:(BOOL)a3 atIndexPath:(id)a4 boundsCheck:(BOOL)a5 chain:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;
  void *v20;

  v7 = a5;
  v8 = a3;
  v11 = a4;
  v12 = a6;
  -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemAtIndexPath:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCMediaRemoteMiddleware queueContentItems](self, "queueContentItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaRemoteMiddleware.m"), 286, CFSTR("Could not find content item at indexPath: %@ queueContentItems: %p queueContentItems.totalItemCount: %ld"), v11, v19, objc_msgSend(v20, "totalItemCount"));

  }
  objc_msgSend(v12, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "playerItemShouldDisableJumpToItem:atIndexPath:boundsCheck:chain:", v8, v11, v7, v12);

  return v16;
}

- (BOOL)playerCommandSupported:(BOOL)a3 command:(unsigned int)a4 chain:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = *(_QWORD *)&a4;
  LODWORD(v6) = a3;
  v8 = a5;
  -[MPCMediaRemoteMiddleware supportedCommands](self, "supportedCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "commandInfoForCommand:", v5);

  if (v10)
    v6 = 1;
  else
    v6 = v6;
  objc_msgSend(v8, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "playerCommandSupported:command:chain:", v6, v5, v8);

  return v12;
}

- (int64_t)playerCommandDisabledReason:(int64_t)a3 command:(unsigned int)a4 chain:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  -[MPCMediaRemoteMiddleware supportedCommands](self, "supportedCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "commandInfoForCommand:", v5);

  if (v10)
  {
    v11 = MRMediaRemoteCommandInfoGetIntegerValueForKey() - 1;
    if (v11 > 5)
      a3 = 0;
    else
      a3 = v11 + 1;
  }
  objc_msgSend(v8, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "playerCommandDisabledReason:command:chain:", a3, v5, v8);

  return v13;
}

- (id)lastSectionModelObject:(id)a3 propertySet:(id)a4 chain:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[MPCMediaRemoteMiddleware lastSectionContentItem](self, "lastSectionContentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDDC820], "translatorForMPModelClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BDDC828]);
    -[MPCMediaRemoteMiddleware controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setArtworkGenerator:", v10);

    if (!v6)
    {
      v11 = (void *)MEMORY[0x24BDDCB30];
      v17[0] = *MEMORY[0x24BDDC278];
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      v17[1] = *MEMORY[0x24BDDC2B8];
      objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "propertySetWithRelationships:", v14);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "sectionObjectForPropertySet:contentItem:context:", v6, v7, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)tracklistProperties:(id)a3 chain:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[MPCMediaRemoteMiddleware queueProperties](self, "queueProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tracklistProperties:chain:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)playerVocalsControlActive:(BOOL)a3 chain:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v6 = *MEMORY[0x24BE656F8];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 142, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v4 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(v7, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerVocalsControlActive:chain:", v4, v7);

  return v10;
}

- (float)playerVocalsLevel:(float)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  double v11;
  float v12;
  float v13;

  v6 = *MEMORY[0x24BE65708];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 142, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "floatValue");
    a3 = v9;
  }
  objc_msgSend(v7, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = a3;
  objc_msgSend(v10, "playerVocalsLevel:chain:", v7, v11);
  v13 = v12;

  return v13;
}

- (float)playerMinVocalsLevel:(float)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  double v11;
  float v12;
  float v13;

  v6 = *MEMORY[0x24BE65718];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 142, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "floatValue");
    a3 = v9;
  }
  objc_msgSend(v7, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = a3;
  objc_msgSend(v10, "playerMinVocalsLevel:chain:", v7, v11);
  v13 = v12;

  return v13;
}

- (float)playerMaxVocalsLevel:(float)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  double v11;
  float v12;
  float v13;

  v6 = *MEMORY[0x24BE65710];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 142, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "floatValue");
    a3 = v9;
  }
  objc_msgSend(v7, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = (float)(uint64_t)a3;
  objc_msgSend(v10, "playerMaxVocalsLevel:chain:", v7, v11);
  v13 = v12;

  return v13;
}

- (BOOL)playerVocalsControlContinuous:(BOOL)a3 chain:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v6 = *MEMORY[0x24BE65700];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 142, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v4 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(v7, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerVocalsControlContinuous:chain:", v4, v7);

  return v10;
}

- (double)playerSleepTimerTime:(double)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v6 = *MEMORY[0x24BE65690];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 124, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "doubleValue");
    a3 = v9;
  }
  objc_msgSend(v7, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerSleepTimerTime:chain:", v7, a3);
  v12 = v11;

  return v12;
}

- (double)playerSleepTimerFireDate:(double)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v6 = *MEMORY[0x24BE65680];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 124, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "doubleValue");
    a3 = v9;
  }
  objc_msgSend(v7, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerSleepTimerFireDate:chain:", v7, a3);
  v12 = v11;

  return v12;
}

- (int64_t)playerSleepTimerStopMode:(int64_t)a3 chain:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = *MEMORY[0x24BE65688];
  v7 = a4;
  -[MPCMediaRemoteMiddleware _supportedCommands:infoValueForKey:](self, "_supportedCommands:infoValueForKey:", 124, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    objc_msgSend(v8, "unsignedIntegerValue");
    a3 = MPSleepTimerStopModeFromMediaRemoteSleepTimerStopMode();
  }
  objc_msgSend(v7, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerSleepTimerStopMode:chain:", a3, v7);

  return v10;
}

MPCPlayerAudioFormat *__82__MPCMediaRemoteMiddleware_MPCPlayerResponseBuilder__alternateAudioFormats_chain___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MPCPlayerAudioFormat *v3;

  v2 = a2;
  v3 = -[MPCPlayerAudioFormat initWithNowPlayingInfoAudioFormat:]([MPCPlayerAudioFormat alloc], "initWithNowPlayingInfoAudioFormat:", v2);

  return v3;
}

@end
