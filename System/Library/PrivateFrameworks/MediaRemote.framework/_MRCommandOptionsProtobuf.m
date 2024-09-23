@implementation _MRCommandOptionsProtobuf

- (BOOL)hasSourceID
{
  return self->_sourceID != 0;
}

- (BOOL)hasMediaType
{
  return self->_mediaType != 0;
}

- (void)setExternalPlayerCommand:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_externalPlayerCommand = a3;
}

- (void)setHasExternalPlayerCommand:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasExternalPlayerCommand
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSkipInterval:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_skipInterval = a3;
}

- (void)setHasSkipInterval:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSkipInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPlaybackRate:(float)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRating:(float)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_rating = a3;
}

- (void)setHasRating:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRating
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNegative:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_negative = a3;
}

- (void)setHasNegative:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasNegative
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPlaybackPosition:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_playbackPosition = a3;
}

- (void)setHasPlaybackPosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasPlaybackPosition
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)repeatMode
{
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    return self->_repeatMode;
  else
    return 0;
}

- (void)setRepeatMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasRepeatMode
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CEDD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRepeatMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("One")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("All")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)shuffleMode
{
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    return self->_shuffleMode;
  else
    return 0;
}

- (void)setShuffleMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasShuffleMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CEDF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsShuffleMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Off")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Albums")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Songs")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasContextID
{
  return self->_contextID != 0;
}

- (void)setTrackID:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_trackID = a3;
}

- (void)setHasTrackID:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTrackID
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRadioStationID:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_radioStationID = a3;
}

- (void)setHasRadioStationID:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasRadioStationID
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasRadioStationHash
{
  return self->_radioStationHash != 0;
}

- (BOOL)hasSystemAppPlaybackQueueData
{
  return self->_systemAppPlaybackQueueData != 0;
}

- (BOOL)hasDestinationAppDisplayID
{
  return self->_destinationAppDisplayID != 0;
}

- (int)sendOptions
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_sendOptions;
  else
    return 0;
}

- (void)setSendOptions:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_sendOptions = a3;
}

- (void)setHasSendOptions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSendOptions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)sendOptionsAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("None");
  if (a3 == 1)
  {
    v3 = CFSTR("LaunchApplication");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSendOptions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LaunchApplication"));

  return v4;
}

- (void)setRequestDefermentToPlaybackQueuePosition:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_requestDefermentToPlaybackQueuePosition = a3;
}

- (void)setHasRequestDefermentToPlaybackQueuePosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRequestDefermentToPlaybackQueuePosition
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_shouldOverrideManuallyCuratedQueue = a3;
}

- (void)setHasShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasShouldOverrideManuallyCuratedQueue
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasStationURL
{
  return self->_stationURL != 0;
}

- (void)setShouldBeginRadioPlayback:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_shouldBeginRadioPlayback = a3;
}

- (void)setHasShouldBeginRadioPlayback:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasShouldBeginRadioPlayback
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setPlaybackQueueInsertionPosition:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_playbackQueueInsertionPosition = a3;
}

- (void)setHasPlaybackQueueInsertionPosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasPlaybackQueueInsertionPosition
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasContentItemID
{
  return self->_contentItemID != 0;
}

- (void)setPlaybackQueueOffset:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_playbackQueueOffset = a3;
}

- (void)setHasPlaybackQueueOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasPlaybackQueueOffset
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setPlaybackQueueDestinationOffset:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_playbackQueueDestinationOffset = a3;
}

- (void)setHasPlaybackQueueDestinationOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPlaybackQueueDestinationOffset
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasLanguageOption
{
  return self->_languageOption != 0;
}

- (BOOL)hasPlaybackQueueContext
{
  return self->_playbackQueueContext != 0;
}

- (BOOL)hasInsertAfterContentItemID
{
  return self->_insertAfterContentItemID != 0;
}

- (BOOL)hasNowPlayingContentItemID
{
  return self->_nowPlayingContentItemID != 0;
}

- (int)replaceIntent
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_replaceIntent;
  else
    return 0;
}

- (void)setReplaceIntent:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_replaceIntent = a3;
}

- (void)setHasReplaceIntent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasReplaceIntent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)replaceIntentAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CEE18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReplaceIntent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NonDestructive")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClearUpNext")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KeepUpNext")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LeaveSharedSession")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCommandID
{
  return self->_commandID != 0;
}

- (BOOL)hasSenderID
{
  return self->_senderID != 0;
}

- (BOOL)hasRemoteControlInterface
{
  return self->_remoteControlInterface != 0;
}

- (void)setBeginSeek:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_beginSeek = a3;
}

- (void)setHasBeginSeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasBeginSeek
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setEndSeek:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_endSeek = a3;
}

- (void)setHasEndSeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasEndSeek
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasPlaybackSession
{
  return self->_playbackSession != 0;
}

- (BOOL)hasUserIdentityData
{
  return self->_userIdentityData != 0;
}

- (BOOL)hasInsertBeforeContentItemID
{
  return self->_insertBeforeContentItemID != 0;
}

- (int)queueEndAction
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_queueEndAction;
  else
    return 0;
}

- (void)setQueueEndAction:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_queueEndAction = a3;
}

- (void)setHasQueueEndAction:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasQueueEndAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)queueEndActionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CEE38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQueueEndAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Clear")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reset")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AutoPlay")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPreservesRepeatMode:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_preservesRepeatMode = a3;
}

- (void)setHasPreservesRepeatMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasPreservesRepeatMode
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setPreservesShuffleMode:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_preservesShuffleMode = a3;
}

- (void)setHasPreservesShuffleMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPreservesShuffleMode
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setPreservesQueueEndAction:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_preservesQueueEndAction = a3;
}

- (void)setHasPreservesQueueEndAction:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasPreservesQueueEndAction
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (BOOL)hasHomeKitUserIdentifier
{
  return self->_homeKitUserIdentifier != 0;
}

- (void)setVerifySupportedCommands:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_verifySupportedCommands = a3;
}

- (void)setHasVerifySupportedCommands:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasVerifySupportedCommands
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (BOOL)hasPlaybackSessionIdentifier
{
  return self->_playbackSessionIdentifier != 0;
}

- (int)playbackSessionPriority
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_playbackSessionPriority;
  else
    return 0;
}

- (void)setPlaybackSessionPriority:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_playbackSessionPriority = a3;
}

- (void)setHasPlaybackSessionPriority:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasPlaybackSessionPriority
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)playbackSessionPriorityAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("Low");
    case 1024:
      return CFSTR("Immediate");
    case 512:
      v3 = CFSTR("High");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsPlaybackSessionPriority:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Low")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("High")) & 1) != 0)
  {
    v4 = 512;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Immediate")))
  {
    v4 = 1024;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPlaybackSessionFilePath
{
  return self->_playbackSessionFilePath != 0;
}

- (BOOL)hasPlaybackSessionRevision
{
  return self->_playbackSessionRevision != 0;
}

- (BOOL)hasPlaybackSessionMetadata
{
  return self->_playbackSessionMetadata != 0;
}

- (BOOL)hasPlaybackSessionType
{
  return self->_playbackSessionType != 0;
}

- (void)setTrueCompletion:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_trueCompletion = a3;
}

- (void)setHasTrueCompletion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTrueCompletion
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (BOOL)hasPlaybackAuthorizationToken
{
  return self->_playbackAuthorizationToken != 0;
}

- (BOOL)hasEventNoticeType
{
  return self->_eventNoticeType != 0;
}

- (BOOL)hasEventNoticeIdentifier
{
  return self->_eventNoticeIdentifier != 0;
}

- (BOOL)hasSharedPlaybackSessionIdentifier
{
  return self->_sharedPlaybackSessionIdentifier != 0;
}

- (void)setCommandTimeout:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_commandTimeout = a3;
}

- (void)setHasCommandTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCommandTimeout
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAssistantTTSEndTimestamp:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_assistantTTSEndTimestamp = a3;
}

- (void)setHasAssistantTTSEndTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAssistantTTSEndTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAssistantCommandSendTimestamp:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_assistantCommandSendTimestamp = a3;
}

- (void)setHasAssistantCommandSendTimestamp:(BOOL)a3
{
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAssistantCommandSendTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasOriginatingDeviceUID
{
  return self->_originatingDeviceUID != 0;
}

- (BOOL)hasDestinationDeviceUIDs
{
  return self->_destinationDeviceUIDs != 0;
}

- (BOOL)hasDesiredSessionID
{
  return self->_desiredSessionID != 0;
}

- (void)setAlwaysIgnoreDuringCall:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_alwaysIgnoreDuringCall = a3;
}

- (void)setHasAlwaysIgnoreDuringCall:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasAlwaysIgnoreDuringCall
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setAlwaysIgnoreDuringSharePlay:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_alwaysIgnoreDuringSharePlay = a3;
}

- (void)setHasAlwaysIgnoreDuringSharePlay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasAlwaysIgnoreDuringSharePlay
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasCommandSequenceUUID
{
  return self->_commandSequenceUUID != 0;
}

- (void)setOriginatedFromRemoteDevice:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_originatedFromRemoteDevice = a3;
}

- (void)setHasOriginatedFromRemoteDevice:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOriginatedFromRemoteDevice
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (BOOL)hasSiriTurnIdentifier
{
  return self->_siriTurnIdentifier != 0;
}

- (BOOL)hasSiriSearchDataSetIdentifier
{
  return self->_siriSearchDataSetIdentifier != 0;
}

- (void)setPrepareForSetQueueIsProactive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_prepareForSetQueueIsProactive = a3;
}

- (void)setHasPrepareForSetQueueIsProactive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasPrepareForSetQueueIsProactive
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (BOOL)hasPrepareForSetQueueProactiveReason
{
  return self->_prepareForSetQueueProactiveReason != 0;
}

- (int)prepareForSetQueueProactiveReasonType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_prepareForSetQueueProactiveReasonType;
  else
    return 0;
}

- (void)setPrepareForSetQueueProactiveReasonType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_prepareForSetQueueProactiveReasonType = a3;
}

- (void)setHasPrepareForSetQueueProactiveReasonType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPrepareForSetQueueProactiveReasonType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)prepareForSetQueueProactiveReasonTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CEE58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrepareForSetQueueProactiveReasonType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Boot")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SiriActivation")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasApplicationUserIdentity
{
  return self->_applicationUserIdentity != 0;
}

- (BOOL)hasSystemAppPlaybackQueue
{
  return self->_systemAppPlaybackQueue != 0;
}

- (void)setVocalsControlActive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_vocalsControlActive = a3;
}

- (void)setHasVocalsControlActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasVocalsControlActive
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setVocalsControlLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_vocalsControlLevel = a3;
}

- (void)setHasVocalsControlLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasVocalsControlLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setVocalsControlMinLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_vocalsControlMinLevel = a3;
}

- (void)setHasVocalsControlMinLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasVocalsControlMinLevel
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setVocalsControlMaxLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_vocalsControlMaxLevel = a3;
}

- (void)setHasVocalsControlMaxLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasVocalsControlMaxLevel
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setVocalsControlContinuous:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_vocalsControlContinuous = a3;
}

- (void)setHasVocalsControlContinuous:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasVocalsControlContinuous
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (BOOL)hasAssociatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier != 0;
}

- (void)setSleepTimerTime:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_sleepTimerTime = a3;
}

- (void)setHasSleepTimerTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasSleepTimerTime
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)sleepTimerStopMode
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_sleepTimerStopMode;
  else
    return 0;
}

- (void)setSleepTimerStopMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_sleepTimerStopMode = a3;
}

- (void)setHasSleepTimerStopMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSleepTimerStopMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)sleepTimerStopModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CEE78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSleepTimerStopMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Off")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Time")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChapterEnd")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ItemEnd")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDialogOptions
{
  return self->_dialogOptions != 0;
}

- (BOOL)hasClientPreferredLanguages
{
  return self->_clientPreferredLanguages != 0;
}

- (void)setReferencePosition:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_referencePosition = a3;
}

- (void)setHasReferencePosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasReferencePosition
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRCommandOptionsProtobuf;
  -[_MRCommandOptionsProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRCommandOptionsProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *sourceID;
  NSString *mediaType;
  $D356D6608A0B9B449BA135355957D2E8 has;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t repeatMode;
  __CFString *v16;
  uint64_t shuffleMode;
  __CFString *v18;
  NSString *contextID;
  $D356D6608A0B9B449BA135355957D2E8 v20;
  void *v21;
  void *v22;
  NSString *radioStationHash;
  NSData *systemAppPlaybackQueueData;
  NSString *destinationAppDisplayID;
  $D356D6608A0B9B449BA135355957D2E8 v26;
  void *v27;
  NSString *stationURL;
  $D356D6608A0B9B449BA135355957D2E8 v29;
  void *v30;
  void *v31;
  NSString *contentItemID;
  $D356D6608A0B9B449BA135355957D2E8 v33;
  void *v34;
  void *v35;
  NSData *languageOption;
  NSData *playbackQueueContext;
  NSString *insertAfterContentItemID;
  NSString *nowPlayingContentItemID;
  uint64_t replaceIntent;
  __CFString *v41;
  int sendOptions;
  __CFString *v43;
  NSString *commandID;
  NSString *senderID;
  NSString *remoteControlInterface;
  $D356D6608A0B9B449BA135355957D2E8 v47;
  void *v48;
  void *v49;
  NSData *playbackSession;
  NSData *userIdentityData;
  NSString *insertBeforeContentItemID;
  $D356D6608A0B9B449BA135355957D2E8 v53;
  void *v54;
  NSString *homeKitUserIdentifier;
  void *v56;
  NSString *playbackSessionIdentifier;
  int playbackSessionPriority;
  __CFString *v59;
  uint64_t queueEndAction;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  NSString *playbackSessionFilePath;
  NSString *playbackSessionRevision;
  NSData *playbackSessionMetadata;
  NSString *playbackSessionType;
  void *v69;
  NSString *playbackAuthorizationToken;
  NSString *eventNoticeType;
  NSString *eventNoticeIdentifier;
  NSString *sharedPlaybackSessionIdentifier;
  $D356D6608A0B9B449BA135355957D2E8 v74;
  void *v75;
  NSString *originatingDeviceUID;
  NSData *destinationDeviceUIDs;
  NSString *desiredSessionID;
  $D356D6608A0B9B449BA135355957D2E8 v79;
  void *v80;
  void *v81;
  NSString *commandSequenceUUID;
  void *v83;
  NSString *siriTurnIdentifier;
  NSString *siriSearchDataSetIdentifier;
  void *v86;
  NSString *prepareForSetQueueProactiveReason;
  uint64_t prepareForSetQueueProactiveReasonType;
  __CFString *v89;
  void *v90;
  void *v91;
  NSData *applicationUserIdentity;
  _MRSystemPlaybackQueueProtobuf *systemAppPlaybackQueue;
  void *v94;
  $D356D6608A0B9B449BA135355957D2E8 v95;
  void *v96;
  NSString *associatedParticipantIdentifier;
  $D356D6608A0B9B449BA135355957D2E8 v98;
  void *v99;
  uint64_t sleepTimerStopMode;
  __CFString *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _MRDictionaryProtobuf *dialogOptions;
  void *v107;
  NSString *clientPreferredLanguages;
  void *v109;
  id v110;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  sourceID = self->_sourceID;
  if (sourceID)
    objc_msgSend(v3, "setObject:forKey:", sourceID, CFSTR("sourceID"));
  mediaType = self->_mediaType;
  if (mediaType)
    objc_msgSend(v5, "setObject:forKey:", mediaType, CFSTR("mediaType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_externalPlayerCommand);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("externalPlayerCommand"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  *(float *)&v4 = self->_skipInterval;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("skipInterval"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  *(float *)&v4 = self->_playbackRate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("playbackRate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  *(float *)&v4 = self->_rating;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("rating"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_negative);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("negative"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playbackPosition);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("playbackPosition"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
LABEL_20:
  repeatMode = self->_repeatMode;
  if (repeatMode >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_repeatMode);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E30CEDD8[repeatMode];
  }
  objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("repeatMode"));

  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_24:
    shuffleMode = self->_shuffleMode;
    if (shuffleMode >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_shuffleMode);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E30CEDF8[shuffleMode];
    }
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("shuffleMode"));

  }
LABEL_28:
  contextID = self->_contextID;
  if (contextID)
    objc_msgSend(v5, "setObject:forKey:", contextID, CFSTR("contextID"));
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_trackID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("trackID"));

    v20 = self->_has;
  }
  if ((*(_BYTE *)&v20 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_radioStationID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("radioStationID"));

  }
  radioStationHash = self->_radioStationHash;
  if (radioStationHash)
    objc_msgSend(v5, "setObject:forKey:", radioStationHash, CFSTR("radioStationHash"));
  systemAppPlaybackQueueData = self->_systemAppPlaybackQueueData;
  if (systemAppPlaybackQueueData)
    objc_msgSend(v5, "setObject:forKey:", systemAppPlaybackQueueData, CFSTR("systemAppPlaybackQueueData"));
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if (destinationAppDisplayID)
    objc_msgSend(v5, "setObject:forKey:", destinationAppDisplayID, CFSTR("destinationAppDisplayID"));
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
    sendOptions = self->_sendOptions;
    if (sendOptions)
    {
      if (sendOptions == 1)
      {
        v43 = CFSTR("LaunchApplication");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sendOptions);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v43 = CFSTR("None");
    }
    objc_msgSend(v5, "setObject:forKey:", v43, CFSTR("sendOptions"));

    v26 = self->_has;
    if ((*(_QWORD *)&v26 & 0x1000000000) == 0)
    {
LABEL_42:
      if ((*(_QWORD *)&v26 & 0x4000000000) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((*(_QWORD *)&v26 & 0x1000000000) == 0)
  {
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requestDefermentToPlaybackQueuePosition);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v64, CFSTR("requestDefermentToPlaybackQueuePosition"));

  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
  {
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldOverrideManuallyCuratedQueue);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("shouldOverrideManuallyCuratedQueue"));

  }
LABEL_44:
  stationURL = self->_stationURL;
  if (stationURL)
    objc_msgSend(v5, "setObject:forKey:", stationURL, CFSTR("stationURL"));
  v29 = self->_has;
  if ((*(_QWORD *)&v29 & 0x2000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldBeginRadioPlayback);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("shouldBeginRadioPlayback"));

    v29 = self->_has;
  }
  if ((*(_WORD *)&v29 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playbackQueueInsertionPosition);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("playbackQueueInsertionPosition"));

  }
  contentItemID = self->_contentItemID;
  if (contentItemID)
    objc_msgSend(v5, "setObject:forKey:", contentItemID, CFSTR("contentItemID"));
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playbackQueueOffset);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("playbackQueueOffset"));

    v33 = self->_has;
  }
  if ((*(_WORD *)&v33 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playbackQueueDestinationOffset);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v35, CFSTR("playbackQueueDestinationOffset"));

  }
  languageOption = self->_languageOption;
  if (languageOption)
    objc_msgSend(v5, "setObject:forKey:", languageOption, CFSTR("languageOption"));
  playbackQueueContext = self->_playbackQueueContext;
  if (playbackQueueContext)
    objc_msgSend(v5, "setObject:forKey:", playbackQueueContext, CFSTR("playbackQueueContext"));
  insertAfterContentItemID = self->_insertAfterContentItemID;
  if (insertAfterContentItemID)
    objc_msgSend(v5, "setObject:forKey:", insertAfterContentItemID, CFSTR("insertAfterContentItemID"));
  nowPlayingContentItemID = self->_nowPlayingContentItemID;
  if (nowPlayingContentItemID)
    objc_msgSend(v5, "setObject:forKey:", nowPlayingContentItemID, CFSTR("nowPlayingContentItemID"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    replaceIntent = self->_replaceIntent;
    if (replaceIntent >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_replaceIntent);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E30CEE18[replaceIntent];
    }
    objc_msgSend(v5, "setObject:forKey:", v41, CFSTR("replaceIntent"));

  }
  commandID = self->_commandID;
  if (commandID)
    objc_msgSend(v5, "setObject:forKey:", commandID, CFSTR("commandID"));
  senderID = self->_senderID;
  if (senderID)
    objc_msgSend(v5, "setObject:forKey:", senderID, CFSTR("senderID"));
  remoteControlInterface = self->_remoteControlInterface;
  if (remoteControlInterface)
    objc_msgSend(v5, "setObject:forKey:", remoteControlInterface, CFSTR("remoteControlInterface"));
  v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x8000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_beginSeek);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("beginSeek"));

    v47 = self->_has;
  }
  if ((*(_DWORD *)&v47 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_endSeek);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v49, CFSTR("endSeek"));

  }
  playbackSession = self->_playbackSession;
  if (playbackSession)
    objc_msgSend(v5, "setObject:forKey:", playbackSession, CFSTR("playbackSession"));
  userIdentityData = self->_userIdentityData;
  if (userIdentityData)
    objc_msgSend(v5, "setObject:forKey:", userIdentityData, CFSTR("userIdentityData"));
  insertBeforeContentItemID = self->_insertBeforeContentItemID;
  if (insertBeforeContentItemID)
    objc_msgSend(v5, "setObject:forKey:", insertBeforeContentItemID, CFSTR("insertBeforeContentItemID"));
  v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x4000) != 0)
  {
    queueEndAction = self->_queueEndAction;
    if (queueEndAction >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_queueEndAction);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E30CEE38[queueEndAction];
    }
    objc_msgSend(v5, "setObject:forKey:", v61, CFSTR("queueEndAction"));

    v53 = self->_has;
    if ((*(_QWORD *)&v53 & 0x400000000) == 0)
    {
LABEL_90:
      if ((*(_QWORD *)&v53 & 0x800000000) == 0)
        goto LABEL_91;
      goto LABEL_109;
    }
  }
  else if ((*(_QWORD *)&v53 & 0x400000000) == 0)
  {
    goto LABEL_90;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preservesRepeatMode);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v62, CFSTR("preservesRepeatMode"));

  v53 = self->_has;
  if ((*(_QWORD *)&v53 & 0x800000000) == 0)
  {
LABEL_91:
    if ((*(_QWORD *)&v53 & 0x200000000) == 0)
      goto LABEL_93;
    goto LABEL_92;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preservesShuffleMode);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v63, CFSTR("preservesShuffleMode"));

  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
  {
LABEL_92:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preservesQueueEndAction);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v54, CFSTR("preservesQueueEndAction"));

  }
LABEL_93:
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if (homeKitUserIdentifier)
    objc_msgSend(v5, "setObject:forKey:", homeKitUserIdentifier, CFSTR("homeKitUserIdentifier"));
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_verifySupportedCommands);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v56, CFSTR("verifySupportedCommands"));

  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if (playbackSessionIdentifier)
    objc_msgSend(v5, "setObject:forKey:", playbackSessionIdentifier, CFSTR("playbackSessionIdentifier"));
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    playbackSessionPriority = self->_playbackSessionPriority;
    if (playbackSessionPriority)
    {
      if (playbackSessionPriority == 1024)
      {
        v59 = CFSTR("Immediate");
      }
      else if (playbackSessionPriority == 512)
      {
        v59 = CFSTR("High");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_playbackSessionPriority);
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v59 = CFSTR("Low");
    }
    objc_msgSend(v5, "setObject:forKey:", v59, CFSTR("playbackSessionPriority"));

  }
  playbackSessionFilePath = self->_playbackSessionFilePath;
  if (playbackSessionFilePath)
    objc_msgSend(v5, "setObject:forKey:", playbackSessionFilePath, CFSTR("playbackSessionFilePath"));
  playbackSessionRevision = self->_playbackSessionRevision;
  if (playbackSessionRevision)
    objc_msgSend(v5, "setObject:forKey:", playbackSessionRevision, CFSTR("playbackSessionRevision"));
  playbackSessionMetadata = self->_playbackSessionMetadata;
  if (playbackSessionMetadata)
    objc_msgSend(v5, "setObject:forKey:", playbackSessionMetadata, CFSTR("playbackSessionMetadata"));
  playbackSessionType = self->_playbackSessionType;
  if (playbackSessionType)
    objc_msgSend(v5, "setObject:forKey:", playbackSessionType, CFSTR("playbackSessionType"));
  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_trueCompletion);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v69, CFSTR("trueCompletion"));

  }
  playbackAuthorizationToken = self->_playbackAuthorizationToken;
  if (playbackAuthorizationToken)
    objc_msgSend(v5, "setObject:forKey:", playbackAuthorizationToken, CFSTR("playbackAuthorizationToken"));
  eventNoticeType = self->_eventNoticeType;
  if (eventNoticeType)
    objc_msgSend(v5, "setObject:forKey:", eventNoticeType, CFSTR("eventNoticeType"));
  eventNoticeIdentifier = self->_eventNoticeIdentifier;
  if (eventNoticeIdentifier)
    objc_msgSend(v5, "setObject:forKey:", eventNoticeIdentifier, CFSTR("eventNoticeIdentifier"));
  sharedPlaybackSessionIdentifier = self->_sharedPlaybackSessionIdentifier;
  if (sharedPlaybackSessionIdentifier)
    objc_msgSend(v5, "setObject:forKey:", sharedPlaybackSessionIdentifier, CFSTR("sharedPlaybackSessionIdentifier"));
  v74 = self->_has;
  if ((*(_BYTE *)&v74 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_commandTimeout);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v90, CFSTR("commandTimeout"));

    v74 = self->_has;
    if ((*(_BYTE *)&v74 & 2) == 0)
    {
LABEL_140:
      if ((*(_BYTE *)&v74 & 1) == 0)
        goto LABEL_142;
      goto LABEL_141;
    }
  }
  else if ((*(_BYTE *)&v74 & 2) == 0)
  {
    goto LABEL_140;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assistantTTSEndTimestamp);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v91, CFSTR("assistantTTSEndTimestamp"));

  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_141:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assistantCommandSendTimestamp);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v75, CFSTR("assistantCommandSendTimestamp"));

  }
LABEL_142:
  originatingDeviceUID = self->_originatingDeviceUID;
  if (originatingDeviceUID)
    objc_msgSend(v5, "setObject:forKey:", originatingDeviceUID, CFSTR("originatingDeviceUID"));
  destinationDeviceUIDs = self->_destinationDeviceUIDs;
  if (destinationDeviceUIDs)
    objc_msgSend(v5, "setObject:forKey:", destinationDeviceUIDs, CFSTR("destinationDeviceUIDs"));
  desiredSessionID = self->_desiredSessionID;
  if (desiredSessionID)
    objc_msgSend(v5, "setObject:forKey:", desiredSessionID, CFSTR("desiredSessionID"));
  v79 = self->_has;
  if ((*(_DWORD *)&v79 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_alwaysIgnoreDuringCall);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v80, CFSTR("alwaysIgnoreDuringCall"));

    v79 = self->_has;
  }
  if ((*(_DWORD *)&v79 & 0x4000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_alwaysIgnoreDuringSharePlay);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v81, CFSTR("alwaysIgnoreDuringSharePlay"));

  }
  commandSequenceUUID = self->_commandSequenceUUID;
  if (commandSequenceUUID)
    objc_msgSend(v5, "setObject:forKey:", commandSequenceUUID, CFSTR("commandSequenceUUID"));
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_originatedFromRemoteDevice);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v83, CFSTR("originatedFromRemoteDevice"));

  }
  siriTurnIdentifier = self->_siriTurnIdentifier;
  if (siriTurnIdentifier)
    objc_msgSend(v5, "setObject:forKey:", siriTurnIdentifier, CFSTR("siriTurnIdentifier"));
  siriSearchDataSetIdentifier = self->_siriSearchDataSetIdentifier;
  if (siriSearchDataSetIdentifier)
    objc_msgSend(v5, "setObject:forKey:", siriSearchDataSetIdentifier, CFSTR("siriSearchDataSetIdentifier"));
  if ((*((_BYTE *)&self->_has + 4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prepareForSetQueueIsProactive);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v86, CFSTR("prepareForSetQueueIsProactive"));

  }
  prepareForSetQueueProactiveReason = self->_prepareForSetQueueProactiveReason;
  if (prepareForSetQueueProactiveReason)
    objc_msgSend(v5, "setObject:forKey:", prepareForSetQueueProactiveReason, CFSTR("prepareForSetQueueProactiveReason"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    prepareForSetQueueProactiveReasonType = self->_prepareForSetQueueProactiveReasonType;
    if (prepareForSetQueueProactiveReasonType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prepareForSetQueueProactiveReasonType);
      v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v89 = off_1E30CEE58[prepareForSetQueueProactiveReasonType];
    }
    objc_msgSend(v5, "setObject:forKey:", v89, CFSTR("prepareForSetQueueProactiveReasonType"));

  }
  applicationUserIdentity = self->_applicationUserIdentity;
  if (applicationUserIdentity)
    objc_msgSend(v5, "setObject:forKey:", applicationUserIdentity, CFSTR("applicationUserIdentity"));
  systemAppPlaybackQueue = self->_systemAppPlaybackQueue;
  if (systemAppPlaybackQueue)
  {
    -[_MRSystemPlaybackQueueProtobuf dictionaryRepresentation](systemAppPlaybackQueue, "dictionaryRepresentation");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v94, CFSTR("systemAppPlaybackQueue"));

  }
  v95 = self->_has;
  if ((*(_QWORD *)&v95 & 0x20000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_vocalsControlActive);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v102, CFSTR("vocalsControlActive"));

    v95 = self->_has;
    if ((*(_DWORD *)&v95 & 0x400000) == 0)
    {
LABEL_178:
      if ((*(_DWORD *)&v95 & 0x1000000) == 0)
        goto LABEL_179;
      goto LABEL_191;
    }
  }
  else if ((*(_DWORD *)&v95 & 0x400000) == 0)
  {
    goto LABEL_178;
  }
  *(float *)&v4 = self->_vocalsControlLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v103, CFSTR("vocalsControlLevel"));

  v95 = self->_has;
  if ((*(_DWORD *)&v95 & 0x1000000) == 0)
  {
LABEL_179:
    if ((*(_DWORD *)&v95 & 0x800000) == 0)
      goto LABEL_180;
    goto LABEL_192;
  }
LABEL_191:
  *(float *)&v4 = self->_vocalsControlMinLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v104, CFSTR("vocalsControlMinLevel"));

  v95 = self->_has;
  if ((*(_DWORD *)&v95 & 0x800000) == 0)
  {
LABEL_180:
    if ((*(_QWORD *)&v95 & 0x40000000000) == 0)
      goto LABEL_182;
    goto LABEL_181;
  }
LABEL_192:
  *(float *)&v4 = self->_vocalsControlMaxLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v105, CFSTR("vocalsControlMaxLevel"));

  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_181:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_vocalsControlContinuous);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v96, CFSTR("vocalsControlContinuous"));

  }
LABEL_182:
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if (associatedParticipantIdentifier)
    objc_msgSend(v5, "setObject:forKey:", associatedParticipantIdentifier, CFSTR("associatedParticipantIdentifier"));
  v98 = self->_has;
  if ((*(_BYTE *)&v98 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sleepTimerTime);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v99, CFSTR("sleepTimerTime"));

    v98 = self->_has;
  }
  if ((*(_DWORD *)&v98 & 0x200000) != 0)
  {
    sleepTimerStopMode = self->_sleepTimerStopMode;
    if (sleepTimerStopMode >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sleepTimerStopMode);
      v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v101 = off_1E30CEE78[sleepTimerStopMode];
    }
    objc_msgSend(v5, "setObject:forKey:", v101, CFSTR("sleepTimerStopMode"));

  }
  dialogOptions = self->_dialogOptions;
  if (dialogOptions)
  {
    -[_MRDictionaryProtobuf dictionaryRepresentation](dialogOptions, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v107, CFSTR("dialogOptions"));

  }
  clientPreferredLanguages = self->_clientPreferredLanguages;
  if (clientPreferredLanguages)
    objc_msgSend(v5, "setObject:forKey:", clientPreferredLanguages, CFSTR("clientPreferredLanguages"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referencePosition);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v109, CFSTR("referencePosition"));

  }
  v110 = v5;

  return v110;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCommandOptionsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $D356D6608A0B9B449BA135355957D2E8 has;
  $D356D6608A0B9B449BA135355957D2E8 v6;
  $D356D6608A0B9B449BA135355957D2E8 v7;
  $D356D6608A0B9B449BA135355957D2E8 v8;
  $D356D6608A0B9B449BA135355957D2E8 v9;
  $D356D6608A0B9B449BA135355957D2E8 v10;
  $D356D6608A0B9B449BA135355957D2E8 v11;
  $D356D6608A0B9B449BA135355957D2E8 v12;
  $D356D6608A0B9B449BA135355957D2E8 v13;
  $D356D6608A0B9B449BA135355957D2E8 v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_mediaType)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_152;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  v4 = v15;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteFloatField();
  v4 = v15;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_10;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteFloatField();
  v4 = v15;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteBOOLField();
  v4 = v15;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteDoubleField();
  v4 = v15;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteInt32Field();
  v4 = v15;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteInt32Field();
  v4 = v15;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_158:
  PBDataWriterWriteUint64Field();
  v4 = v15;
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    v4 = v15;
  }
LABEL_16:
  if (self->_radioStationHash)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_systemAppPlaybackQueueData)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_destinationAppDisplayID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
    v6 = self->_has;
  }
  if ((*(_QWORD *)&v6 & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 4) & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_stationURL)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x2000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
    v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
  }
  if (self->_contentItemID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
    v8 = self->_has;
  }
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
  }
  if (self->_languageOption)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_playbackQueueContext)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_insertAfterContentItemID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_nowPlayingContentItemID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
  }
  if (self->_commandID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_senderID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_remoteControlInterface)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
    v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_playbackSession)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_userIdentityData)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_insertBeforeContentItemID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x400000000) == 0)
    {
LABEL_70:
      if ((*(_QWORD *)&v10 & 0x800000000) == 0)
        goto LABEL_71;
      goto LABEL_162;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  PBDataWriterWriteBOOLField();
  v4 = v15;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x800000000) == 0)
  {
LABEL_71:
    if ((*(_QWORD *)&v10 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
LABEL_162:
  PBDataWriterWriteBOOLField();
  v4 = v15;
  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
  {
LABEL_72:
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
LABEL_73:
  if (self->_homeKitUserIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_playbackSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
  }
  if (self->_playbackSessionFilePath)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_playbackSessionRevision)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_playbackSessionMetadata)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_playbackSessionType)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_playbackAuthorizationToken)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_eventNoticeType)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_eventNoticeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_sharedPlaybackSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v15;
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 2) == 0)
    {
LABEL_101:
      if ((*(_BYTE *)&v11 & 1) == 0)
        goto LABEL_103;
      goto LABEL_102;
    }
  }
  else if ((*(_BYTE *)&v11 & 2) == 0)
  {
    goto LABEL_101;
  }
  PBDataWriterWriteDoubleField();
  v4 = v15;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_102:
    PBDataWriterWriteDoubleField();
    v4 = v15;
  }
LABEL_103:
  if (self->_originatingDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_destinationDeviceUIDs)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_desiredSessionID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
    v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_commandSequenceUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_siriTurnIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if (self->_siriSearchDataSetIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 4) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
  if (self->_prepareForSetQueueProactiveReason)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
  }
  if (self->_applicationUserIdentity)
  {
    PBDataWriterWriteDataField();
    v4 = v15;
  }
  if (self->_systemAppPlaybackQueue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v15;
  }
  v13 = self->_has;
  if ((*(_QWORD *)&v13 & 0x20000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v15;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_133:
      if ((*(_DWORD *)&v13 & 0x1000000) == 0)
        goto LABEL_134;
      goto LABEL_169;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_133;
  }
  PBDataWriterWriteFloatField();
  v4 = v15;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_134:
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
      goto LABEL_135;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteFloatField();
  v4 = v15;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_135:
    if ((*(_QWORD *)&v13 & 0x40000000000) == 0)
      goto LABEL_137;
    goto LABEL_136;
  }
LABEL_170:
  PBDataWriterWriteFloatField();
  v4 = v15;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_136:
    PBDataWriterWriteBOOLField();
    v4 = v15;
  }
LABEL_137:
  if (self->_associatedParticipantIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v15;
    v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v15;
  }
  if (self->_dialogOptions)
  {
    PBDataWriterWriteSubmessage();
    v4 = v15;
  }
  if (self->_clientPreferredLanguages)
  {
    PBDataWriterWriteStringField();
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v15;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  $D356D6608A0B9B449BA135355957D2E8 has;
  $D356D6608A0B9B449BA135355957D2E8 v6;
  $D356D6608A0B9B449BA135355957D2E8 v7;
  $D356D6608A0B9B449BA135355957D2E8 v8;
  $D356D6608A0B9B449BA135355957D2E8 v9;
  $D356D6608A0B9B449BA135355957D2E8 v10;
  $D356D6608A0B9B449BA135355957D2E8 v11;
  $D356D6608A0B9B449BA135355957D2E8 v12;
  $D356D6608A0B9B449BA135355957D2E8 v13;
  $D356D6608A0B9B449BA135355957D2E8 v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_sourceID)
  {
    objc_msgSend(v4, "setSourceID:");
    v4 = v15;
  }
  if (self->_mediaType)
  {
    objc_msgSend(v15, "setMediaType:");
    v4 = v15;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *((_BYTE *)v4 + 480) = self->_externalPlayerCommand;
    *((_QWORD *)v4 + 62) |= 0x20000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_152;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 104) = LODWORD(self->_skipInterval);
  *((_QWORD *)v4 + 62) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_153;
  }
LABEL_152:
  *((_DWORD *)v4 + 65) = LODWORD(self->_playbackRate);
  *((_QWORD *)v4 + 62) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_10;
    goto LABEL_154;
  }
LABEL_153:
  *((_DWORD *)v4 + 86) = LODWORD(self->_rating);
  *((_QWORD *)v4 + 62) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_155;
  }
LABEL_154:
  *((_BYTE *)v4 + 481) = self->_negative;
  *((_QWORD *)v4 + 62) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_156;
  }
LABEL_155:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_playbackPosition;
  *((_QWORD *)v4 + 62) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_157;
  }
LABEL_156:
  *((_DWORD *)v4 + 90) = self->_repeatMode;
  *((_QWORD *)v4 + 62) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_158;
  }
LABEL_157:
  *((_DWORD *)v4 + 98) = self->_shuffleMode;
  *((_QWORD *)v4 + 62) |= 0x80000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_158:
  *((_QWORD *)v4 + 8) = self->_trackID;
  *((_QWORD *)v4 + 62) |= 0x80uLL;
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *((_QWORD *)v4 + 5) = self->_radioStationID;
    *((_QWORD *)v4 + 62) |= 0x10uLL;
  }
LABEL_16:
  if (self->_radioStationHash)
  {
    objc_msgSend(v15, "setRadioStationHash:");
    v4 = v15;
  }
  if (self->_systemAppPlaybackQueueData)
  {
    objc_msgSend(v15, "setSystemAppPlaybackQueueData:");
    v4 = v15;
  }
  if (self->_destinationAppDisplayID)
  {
    objc_msgSend(v15, "setDestinationAppDisplayID:");
    v4 = v15;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    *((_DWORD *)v4 + 92) = self->_sendOptions;
    *((_QWORD *)v4 + 62) |= 0x40000uLL;
    v6 = self->_has;
  }
  if ((*(_QWORD *)&v6 & 0x1000000000) != 0)
  {
    *((_BYTE *)v4 + 487) = self->_requestDefermentToPlaybackQueuePosition;
    *((_QWORD *)v4 + 62) |= 0x1000000000uLL;
  }
  if (self->_contextID)
  {
    objc_msgSend(v15, "setContextID:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 4) & 0x40) != 0)
  {
    *((_BYTE *)v4 + 489) = self->_shouldOverrideManuallyCuratedQueue;
    *((_QWORD *)v4 + 62) |= 0x4000000000uLL;
  }
  if (self->_stationURL)
  {
    objc_msgSend(v15, "setStationURL:");
    v4 = v15;
  }
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x2000000000) != 0)
  {
    *((_BYTE *)v4 + 488) = self->_shouldBeginRadioPlayback;
    *((_QWORD *)v4 + 62) |= 0x2000000000uLL;
    v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 63) = self->_playbackQueueInsertionPosition;
    *((_QWORD *)v4 + 62) |= 0x200uLL;
  }
  if (self->_contentItemID)
  {
    objc_msgSend(v15, "setContentItemID:");
    v4 = v15;
  }
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 64) = self->_playbackQueueOffset;
    *((_QWORD *)v4 + 62) |= 0x400uLL;
    v8 = self->_has;
  }
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 62) = self->_playbackQueueDestinationOffset;
    *((_QWORD *)v4 + 62) |= 0x100uLL;
  }
  if (self->_languageOption)
  {
    objc_msgSend(v15, "setLanguageOption:");
    v4 = v15;
  }
  if (self->_playbackQueueContext)
  {
    objc_msgSend(v15, "setPlaybackQueueContext:");
    v4 = v15;
  }
  if (self->_insertAfterContentItemID)
  {
    objc_msgSend(v15, "setInsertAfterContentItemID:");
    v4 = v15;
  }
  if (self->_nowPlayingContentItemID)
  {
    objc_msgSend(v15, "setNowPlayingContentItemID:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *((_DWORD *)v4 + 91) = self->_replaceIntent;
    *((_QWORD *)v4 + 62) |= 0x20000uLL;
  }
  if (self->_commandID)
  {
    objc_msgSend(v15, "setCommandID:");
    v4 = v15;
  }
  if (self->_senderID)
  {
    objc_msgSend(v15, "setSenderID:");
    v4 = v15;
  }
  if (self->_remoteControlInterface)
  {
    objc_msgSend(v15, "setRemoteControlInterface:");
    v4 = v15;
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
    *((_BYTE *)v4 + 478) = self->_beginSeek;
    *((_QWORD *)v4 + 62) |= 0x8000000uLL;
    v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
    *((_BYTE *)v4 + 479) = self->_endSeek;
    *((_QWORD *)v4 + 62) |= 0x10000000uLL;
  }
  if (self->_playbackSession)
  {
    objc_msgSend(v15, "setPlaybackSession:");
    v4 = v15;
  }
  if (self->_userIdentityData)
  {
    objc_msgSend(v15, "setUserIdentityData:");
    v4 = v15;
  }
  if (self->_insertBeforeContentItemID)
  {
    objc_msgSend(v15, "setInsertBeforeContentItemID:");
    v4 = v15;
  }
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 83) = self->_queueEndAction;
    *((_QWORD *)v4 + 62) |= 0x4000uLL;
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x400000000) == 0)
    {
LABEL_70:
      if ((*(_QWORD *)&v10 & 0x800000000) == 0)
        goto LABEL_71;
      goto LABEL_162;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  *((_BYTE *)v4 + 485) = self->_preservesRepeatMode;
  *((_QWORD *)v4 + 62) |= 0x400000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x800000000) == 0)
  {
LABEL_71:
    if ((*(_QWORD *)&v10 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
LABEL_162:
  *((_BYTE *)v4 + 486) = self->_preservesShuffleMode;
  *((_QWORD *)v4 + 62) |= 0x800000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
  {
LABEL_72:
    *((_BYTE *)v4 + 484) = self->_preservesQueueEndAction;
    *((_QWORD *)v4 + 62) |= 0x200000000uLL;
  }
LABEL_73:
  if (self->_homeKitUserIdentifier)
  {
    objc_msgSend(v15, "setHomeKitUserIdentifier:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    *((_BYTE *)v4 + 491) = self->_verifySupportedCommands;
    *((_QWORD *)v4 + 62) |= 0x10000000000uLL;
  }
  if (self->_playbackSessionIdentifier)
  {
    objc_msgSend(v15, "setPlaybackSessionIdentifier:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *((_DWORD *)v4 + 74) = self->_playbackSessionPriority;
    *((_QWORD *)v4 + 62) |= 0x1000uLL;
  }
  if (self->_playbackSessionFilePath)
  {
    objc_msgSend(v15, "setPlaybackSessionFilePath:");
    v4 = v15;
  }
  if (self->_playbackSessionRevision)
  {
    objc_msgSend(v15, "setPlaybackSessionRevision:");
    v4 = v15;
  }
  if (self->_playbackSessionMetadata)
  {
    objc_msgSend(v15, "setPlaybackSessionMetadata:");
    v4 = v15;
  }
  if (self->_playbackSessionType)
  {
    objc_msgSend(v15, "setPlaybackSessionType:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
  {
    *((_BYTE *)v4 + 490) = self->_trueCompletion;
    *((_QWORD *)v4 + 62) |= 0x8000000000uLL;
  }
  if (self->_playbackAuthorizationToken)
  {
    objc_msgSend(v15, "setPlaybackAuthorizationToken:");
    v4 = v15;
  }
  if (self->_eventNoticeType)
  {
    objc_msgSend(v15, "setEventNoticeType:");
    v4 = v15;
  }
  if (self->_eventNoticeIdentifier)
  {
    objc_msgSend(v15, "setEventNoticeIdentifier:");
    v4 = v15;
  }
  if (self->_sharedPlaybackSessionIdentifier)
  {
    objc_msgSend(v15, "setSharedPlaybackSessionIdentifier:");
    v4 = v15;
  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_commandTimeout;
    *((_QWORD *)v4 + 62) |= 4uLL;
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 2) == 0)
    {
LABEL_101:
      if ((*(_BYTE *)&v11 & 1) == 0)
        goto LABEL_103;
      goto LABEL_102;
    }
  }
  else if ((*(_BYTE *)&v11 & 2) == 0)
  {
    goto LABEL_101;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_assistantTTSEndTimestamp;
  *((_QWORD *)v4 + 62) |= 2uLL;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_102:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_assistantCommandSendTimestamp;
    *((_QWORD *)v4 + 62) |= 1uLL;
  }
LABEL_103:
  if (self->_originatingDeviceUID)
  {
    objc_msgSend(v15, "setOriginatingDeviceUID:");
    v4 = v15;
  }
  if (self->_destinationDeviceUIDs)
  {
    objc_msgSend(v15, "setDestinationDeviceUIDs:");
    v4 = v15;
  }
  if (self->_desiredSessionID)
  {
    objc_msgSend(v15, "setDesiredSessionID:");
    v4 = v15;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
    *((_BYTE *)v4 + 476) = self->_alwaysIgnoreDuringCall;
    *((_QWORD *)v4 + 62) |= 0x2000000uLL;
    v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x4000000) != 0)
  {
    *((_BYTE *)v4 + 477) = self->_alwaysIgnoreDuringSharePlay;
    *((_QWORD *)v4 + 62) |= 0x4000000uLL;
  }
  if (self->_commandSequenceUUID)
  {
    objc_msgSend(v15, "setCommandSequenceUUID:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    *((_BYTE *)v4 + 482) = self->_originatedFromRemoteDevice;
    *((_QWORD *)v4 + 62) |= 0x80000000uLL;
  }
  if (self->_siriTurnIdentifier)
  {
    objc_msgSend(v15, "setSiriTurnIdentifier:");
    v4 = v15;
  }
  if (self->_siriSearchDataSetIdentifier)
  {
    objc_msgSend(v15, "setSiriSearchDataSetIdentifier:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 4) & 1) != 0)
  {
    *((_BYTE *)v4 + 483) = self->_prepareForSetQueueIsProactive;
    *((_QWORD *)v4 + 62) |= 0x100000000uLL;
  }
  if (self->_prepareForSetQueueProactiveReason)
  {
    objc_msgSend(v15, "setPrepareForSetQueueProactiveReason:");
    v4 = v15;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *((_DWORD *)v4 + 82) = self->_prepareForSetQueueProactiveReasonType;
    *((_QWORD *)v4 + 62) |= 0x2000uLL;
  }
  if (self->_applicationUserIdentity)
  {
    objc_msgSend(v15, "setApplicationUserIdentity:");
    v4 = v15;
  }
  if (self->_systemAppPlaybackQueue)
  {
    objc_msgSend(v15, "setSystemAppPlaybackQueue:");
    v4 = v15;
  }
  v13 = self->_has;
  if ((*(_QWORD *)&v13 & 0x20000000000) != 0)
  {
    *((_BYTE *)v4 + 492) = self->_vocalsControlActive;
    *((_QWORD *)v4 + 62) |= 0x20000000000uLL;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_133:
      if ((*(_DWORD *)&v13 & 0x1000000) == 0)
        goto LABEL_134;
      goto LABEL_169;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_133;
  }
  *((_DWORD *)v4 + 116) = LODWORD(self->_vocalsControlLevel);
  *((_QWORD *)v4 + 62) |= 0x400000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_134:
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
      goto LABEL_135;
    goto LABEL_170;
  }
LABEL_169:
  *((_DWORD *)v4 + 118) = LODWORD(self->_vocalsControlMinLevel);
  *((_QWORD *)v4 + 62) |= 0x1000000uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_135:
    if ((*(_QWORD *)&v13 & 0x40000000000) == 0)
      goto LABEL_137;
    goto LABEL_136;
  }
LABEL_170:
  *((_DWORD *)v4 + 117) = LODWORD(self->_vocalsControlMaxLevel);
  *((_QWORD *)v4 + 62) |= 0x800000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_136:
    *((_BYTE *)v4 + 493) = self->_vocalsControlContinuous;
    *((_QWORD *)v4 + 62) |= 0x40000000000uLL;
  }
LABEL_137:
  if (self->_associatedParticipantIdentifier)
  {
    objc_msgSend(v15, "setAssociatedParticipantIdentifier:");
    v4 = v15;
  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_sleepTimerTime;
    *((_QWORD *)v4 + 62) |= 0x40uLL;
    v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 105) = self->_sleepTimerStopMode;
    *((_QWORD *)v4 + 62) |= 0x200000uLL;
  }
  if (self->_dialogOptions)
  {
    objc_msgSend(v15, "setDialogOptions:");
    v4 = v15;
  }
  if (self->_clientPreferredLanguages)
  {
    objc_msgSend(v15, "setClientPreferredLanguages:");
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_referencePosition;
    *((_QWORD *)v4 + 62) |= 0x20uLL;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $D356D6608A0B9B449BA135355957D2E8 has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  $D356D6608A0B9B449BA135355957D2E8 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  $D356D6608A0B9B449BA135355957D2E8 v22;
  uint64_t v23;
  void *v24;
  $D356D6608A0B9B449BA135355957D2E8 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $D356D6608A0B9B449BA135355957D2E8 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  $D356D6608A0B9B449BA135355957D2E8 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  $D356D6608A0B9B449BA135355957D2E8 v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  $D356D6608A0B9B449BA135355957D2E8 v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  $D356D6608A0B9B449BA135355957D2E8 v88;
  uint64_t v89;
  void *v90;
  $D356D6608A0B9B449BA135355957D2E8 v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  id v96;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourceID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v6;

  v8 = -[NSString copyWithZone:](self->_mediaType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v8;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *(_BYTE *)(v5 + 480) = self->_externalPlayerCommand;
    *(_QWORD *)(v5 + 496) |= 0x20000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 416) = self->_skipInterval;
  *(_QWORD *)(v5 + 496) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_73;
  }
LABEL_72:
  *(float *)(v5 + 260) = self->_playbackRate;
  *(_QWORD *)(v5 + 496) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_6;
    goto LABEL_74;
  }
LABEL_73:
  *(float *)(v5 + 344) = self->_rating;
  *(_QWORD *)(v5 + 496) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_75;
  }
LABEL_74:
  *(_BYTE *)(v5 + 481) = self->_negative;
  *(_QWORD *)(v5 + 496) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_76;
  }
LABEL_75:
  *(double *)(v5 + 32) = self->_playbackPosition;
  *(_QWORD *)(v5 + 496) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 360) = self->_repeatMode;
  *(_QWORD *)(v5 + 496) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 392) = self->_shuffleMode;
  *(_QWORD *)(v5 + 496) |= 0x80000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_78:
  *(_QWORD *)(v5 + 64) = self->_trackID;
  *(_QWORD *)(v5 + 496) |= 0x80uLL;
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 40) = self->_radioStationID;
    *(_QWORD *)(v5 + 496) |= 0x10uLL;
  }
LABEL_12:
  v11 = -[NSString copyWithZone:](self->_radioStationHash, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v11;

  v13 = -[NSData copyWithZone:](self->_systemAppPlaybackQueueData, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v13;

  v15 = -[NSString copyWithZone:](self->_destinationAppDisplayID, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v15;

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 368) = self->_sendOptions;
    *(_QWORD *)(v5 + 496) |= 0x40000uLL;
    v17 = self->_has;
  }
  if ((*(_QWORD *)&v17 & 0x1000000000) != 0)
  {
    *(_BYTE *)(v5 + 487) = self->_requestDefermentToPlaybackQueuePosition;
    *(_QWORD *)(v5 + 496) |= 0x1000000000uLL;
  }
  v18 = -[NSString copyWithZone:](self->_contextID, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v18;

  if ((*((_BYTE *)&self->_has + 4) & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 489) = self->_shouldOverrideManuallyCuratedQueue;
    *(_QWORD *)(v5 + 496) |= 0x4000000000uLL;
  }
  v20 = -[NSString copyWithZone:](self->_stationURL, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v20;

  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x2000000000) != 0)
  {
    *(_BYTE *)(v5 + 488) = self->_shouldBeginRadioPlayback;
    *(_QWORD *)(v5 + 496) |= 0x2000000000uLL;
    v22 = self->_has;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 252) = self->_playbackQueueInsertionPosition;
    *(_QWORD *)(v5 + 496) |= 0x200uLL;
  }
  v23 = -[NSString copyWithZone:](self->_contentItemID, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v23;

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_playbackQueueOffset;
    *(_QWORD *)(v5 + 496) |= 0x400uLL;
    v25 = self->_has;
  }
  if ((*(_WORD *)&v25 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 248) = self->_playbackQueueDestinationOffset;
    *(_QWORD *)(v5 + 496) |= 0x100uLL;
  }
  v26 = -[NSData copyWithZone:](self->_languageOption, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v26;

  v28 = -[NSData copyWithZone:](self->_playbackQueueContext, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v28;

  v30 = -[NSString copyWithZone:](self->_insertAfterContentItemID, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v30;

  v32 = -[NSString copyWithZone:](self->_nowPlayingContentItemID, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v32;

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 364) = self->_replaceIntent;
    *(_QWORD *)(v5 + 496) |= 0x20000uLL;
  }
  v34 = -[NSString copyWithZone:](self->_commandID, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v34;

  v36 = -[NSString copyWithZone:](self->_senderID, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v36;

  v38 = -[NSString copyWithZone:](self->_remoteControlInterface, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v38;

  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x8000000) != 0)
  {
    *(_BYTE *)(v5 + 478) = self->_beginSeek;
    *(_QWORD *)(v5 + 496) |= 0x8000000uLL;
    v40 = self->_has;
  }
  if ((*(_DWORD *)&v40 & 0x10000000) != 0)
  {
    *(_BYTE *)(v5 + 479) = self->_endSeek;
    *(_QWORD *)(v5 + 496) |= 0x10000000uLL;
  }
  v41 = -[NSData copyWithZone:](self->_playbackSession, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v41;

  v43 = -[NSData copyWithZone:](self->_userIdentityData, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v43;

  v45 = -[NSString copyWithZone:](self->_insertBeforeContentItemID, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v45;

  v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 332) = self->_queueEndAction;
    *(_QWORD *)(v5 + 496) |= 0x4000uLL;
    v47 = self->_has;
    if ((*(_QWORD *)&v47 & 0x400000000) == 0)
    {
LABEL_34:
      if ((*(_QWORD *)&v47 & 0x800000000) == 0)
        goto LABEL_35;
      goto LABEL_82;
    }
  }
  else if ((*(_QWORD *)&v47 & 0x400000000) == 0)
  {
    goto LABEL_34;
  }
  *(_BYTE *)(v5 + 485) = self->_preservesRepeatMode;
  *(_QWORD *)(v5 + 496) |= 0x400000000uLL;
  v47 = self->_has;
  if ((*(_QWORD *)&v47 & 0x800000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v47 & 0x200000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_82:
  *(_BYTE *)(v5 + 486) = self->_preservesShuffleMode;
  *(_QWORD *)(v5 + 496) |= 0x800000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000) != 0)
  {
LABEL_36:
    *(_BYTE *)(v5 + 484) = self->_preservesQueueEndAction;
    *(_QWORD *)(v5 + 496) |= 0x200000000uLL;
  }
LABEL_37:
  v48 = -[NSString copyWithZone:](self->_homeKitUserIdentifier, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v48;

  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
  {
    *(_BYTE *)(v5 + 491) = self->_verifySupportedCommands;
    *(_QWORD *)(v5 + 496) |= 0x10000000000uLL;
  }
  v50 = -[NSString copyWithZone:](self->_playbackSessionIdentifier, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v50;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_playbackSessionPriority;
    *(_QWORD *)(v5 + 496) |= 0x1000uLL;
  }
  v52 = -[NSString copyWithZone:](self->_playbackSessionFilePath, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v52;

  v54 = -[NSString copyWithZone:](self->_playbackSessionRevision, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v54;

  v56 = -[NSData copyWithZone:](self->_playbackSessionMetadata, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v56;

  v58 = -[NSString copyWithZone:](self->_playbackSessionType, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v58;

  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 490) = self->_trueCompletion;
    *(_QWORD *)(v5 + 496) |= 0x8000000000uLL;
  }
  v60 = -[NSString copyWithZone:](self->_playbackAuthorizationToken, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v60;

  v62 = -[NSString copyWithZone:](self->_eventNoticeType, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v62;

  v64 = -[NSString copyWithZone:](self->_eventNoticeIdentifier, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v64;

  v66 = -[NSString copyWithZone:](self->_sharedPlaybackSessionIdentifier, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v66;

  v68 = self->_has;
  if ((*(_BYTE *)&v68 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_commandTimeout;
    *(_QWORD *)(v5 + 496) |= 4uLL;
    v68 = self->_has;
    if ((*(_BYTE *)&v68 & 2) == 0)
    {
LABEL_45:
      if ((*(_BYTE *)&v68 & 1) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((*(_BYTE *)&v68 & 2) == 0)
  {
    goto LABEL_45;
  }
  *(double *)(v5 + 16) = self->_assistantTTSEndTimestamp;
  *(_QWORD *)(v5 + 496) |= 2uLL;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_46:
    *(double *)(v5 + 8) = self->_assistantCommandSendTimestamp;
    *(_QWORD *)(v5 + 496) |= 1uLL;
  }
LABEL_47:
  v69 = -[NSString copyWithZone:](self->_originatingDeviceUID, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v69;

  v71 = -[NSData copyWithZone:](self->_destinationDeviceUIDs, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v71;

  v73 = -[NSString copyWithZone:](self->_desiredSessionID, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v73;

  v75 = self->_has;
  if ((*(_DWORD *)&v75 & 0x2000000) != 0)
  {
    *(_BYTE *)(v5 + 476) = self->_alwaysIgnoreDuringCall;
    *(_QWORD *)(v5 + 496) |= 0x2000000uLL;
    v75 = self->_has;
  }
  if ((*(_DWORD *)&v75 & 0x4000000) != 0)
  {
    *(_BYTE *)(v5 + 477) = self->_alwaysIgnoreDuringSharePlay;
    *(_QWORD *)(v5 + 496) |= 0x4000000uLL;
  }
  v76 = -[NSString copyWithZone:](self->_commandSequenceUUID, "copyWithZone:", a3);
  v77 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v76;

  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 482) = self->_originatedFromRemoteDevice;
    *(_QWORD *)(v5 + 496) |= 0x80000000uLL;
  }
  v78 = -[NSString copyWithZone:](self->_siriTurnIdentifier, "copyWithZone:", a3);
  v79 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v78;

  v80 = -[NSString copyWithZone:](self->_siriSearchDataSetIdentifier, "copyWithZone:", a3);
  v81 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v80;

  if ((*((_BYTE *)&self->_has + 4) & 1) != 0)
  {
    *(_BYTE *)(v5 + 483) = self->_prepareForSetQueueIsProactive;
    *(_QWORD *)(v5 + 496) |= 0x100000000uLL;
  }
  v82 = -[NSString copyWithZone:](self->_prepareForSetQueueProactiveReason, "copyWithZone:", a3);
  v83 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v82;

  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_prepareForSetQueueProactiveReasonType;
    *(_QWORD *)(v5 + 496) |= 0x2000uLL;
  }
  v84 = -[NSData copyWithZone:](self->_applicationUserIdentity, "copyWithZone:", a3);
  v85 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v84;

  v86 = -[_MRSystemPlaybackQueueProtobuf copyWithZone:](self->_systemAppPlaybackQueue, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v86;

  v88 = self->_has;
  if ((*(_QWORD *)&v88 & 0x20000000000) != 0)
  {
    *(_BYTE *)(v5 + 492) = self->_vocalsControlActive;
    *(_QWORD *)(v5 + 496) |= 0x20000000000uLL;
    v88 = self->_has;
    if ((*(_DWORD *)&v88 & 0x400000) == 0)
    {
LABEL_59:
      if ((*(_DWORD *)&v88 & 0x1000000) == 0)
        goto LABEL_60;
      goto LABEL_89;
    }
  }
  else if ((*(_DWORD *)&v88 & 0x400000) == 0)
  {
    goto LABEL_59;
  }
  *(float *)(v5 + 464) = self->_vocalsControlLevel;
  *(_QWORD *)(v5 + 496) |= 0x400000uLL;
  v88 = self->_has;
  if ((*(_DWORD *)&v88 & 0x1000000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v88 & 0x800000) == 0)
      goto LABEL_61;
    goto LABEL_90;
  }
LABEL_89:
  *(float *)(v5 + 472) = self->_vocalsControlMinLevel;
  *(_QWORD *)(v5 + 496) |= 0x1000000uLL;
  v88 = self->_has;
  if ((*(_DWORD *)&v88 & 0x800000) == 0)
  {
LABEL_61:
    if ((*(_QWORD *)&v88 & 0x40000000000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_90:
  *(float *)(v5 + 468) = self->_vocalsControlMaxLevel;
  *(_QWORD *)(v5 + 496) |= 0x800000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_62:
    *(_BYTE *)(v5 + 493) = self->_vocalsControlContinuous;
    *(_QWORD *)(v5 + 496) |= 0x40000000000uLL;
  }
LABEL_63:
  v89 = -[NSString copyWithZone:](self->_associatedParticipantIdentifier, "copyWithZone:", a3);
  v90 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v89;

  v91 = self->_has;
  if ((*(_BYTE *)&v91 & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_sleepTimerTime;
    *(_QWORD *)(v5 + 496) |= 0x40uLL;
    v91 = self->_has;
  }
  if ((*(_DWORD *)&v91 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 420) = self->_sleepTimerStopMode;
    *(_QWORD *)(v5 + 496) |= 0x200000uLL;
  }
  v92 = -[_MRDictionaryProtobuf copyWithZone:](self->_dialogOptions, "copyWithZone:", a3);
  v93 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v92;

  v94 = -[NSString copyWithZone:](self->_clientPreferredLanguages, "copyWithZone:", a3);
  v95 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v94;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_referencePosition;
    *(_QWORD *)(v5 + 496) |= 0x20uLL;
  }
  v96 = (id)v5;

  return v96;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceID;
  NSString *mediaType;
  $D356D6608A0B9B449BA135355957D2E8 has;
  uint64_t v8;
  NSString *radioStationHash;
  NSData *systemAppPlaybackQueueData;
  NSString *destinationAppDisplayID;
  $D356D6608A0B9B449BA135355957D2E8 v12;
  uint64_t v13;
  NSString *contextID;
  uint64_t v15;
  NSString *stationURL;
  uint64_t v17;
  NSString *contentItemID;
  uint64_t v19;
  NSData *languageOption;
  NSData *playbackQueueContext;
  NSString *insertAfterContentItemID;
  NSString *nowPlayingContentItemID;
  uint64_t v24;
  NSString *commandID;
  NSString *senderID;
  NSString *remoteControlInterface;
  $D356D6608A0B9B449BA135355957D2E8 v28;
  uint64_t v29;
  NSData *playbackSession;
  NSData *userIdentityData;
  NSString *insertBeforeContentItemID;
  $D356D6608A0B9B449BA135355957D2E8 v33;
  uint64_t v34;
  NSString *homeKitUserIdentifier;
  uint64_t v36;
  NSString *playbackSessionIdentifier;
  uint64_t v38;
  NSString *playbackSessionFilePath;
  NSString *playbackSessionRevision;
  NSData *playbackSessionMetadata;
  NSString *playbackSessionType;
  uint64_t v43;
  NSString *playbackAuthorizationToken;
  NSString *eventNoticeType;
  NSString *eventNoticeIdentifier;
  NSString *sharedPlaybackSessionIdentifier;
  $D356D6608A0B9B449BA135355957D2E8 v48;
  uint64_t v49;
  NSString *originatingDeviceUID;
  NSData *destinationDeviceUIDs;
  NSString *desiredSessionID;
  $D356D6608A0B9B449BA135355957D2E8 v53;
  uint64_t v54;
  NSString *commandSequenceUUID;
  uint64_t v56;
  NSString *siriTurnIdentifier;
  NSString *siriSearchDataSetIdentifier;
  $D356D6608A0B9B449BA135355957D2E8 v59;
  uint64_t v60;
  NSString *prepareForSetQueueProactiveReason;
  uint64_t v62;
  NSData *applicationUserIdentity;
  _MRSystemPlaybackQueueProtobuf *systemAppPlaybackQueue;
  $D356D6608A0B9B449BA135355957D2E8 v65;
  uint64_t v66;
  NSString *associatedParticipantIdentifier;
  uint64_t v68;
  _MRDictionaryProtobuf *dialogOptions;
  NSString *clientPreferredLanguages;
  BOOL v71;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_359;
  sourceID = self->_sourceID;
  if ((unint64_t)sourceID | *((_QWORD *)v4 + 53))
  {
    if (!-[NSString isEqual:](sourceID, "isEqual:"))
      goto LABEL_359;
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](mediaType, "isEqual:"))
      goto LABEL_359;
  }
  has = self->_has;
  v8 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0)
      goto LABEL_359;
    if (self->_externalPlayerCommand)
    {
      if (!*((_BYTE *)v4 + 480))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 480))
    {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_skipInterval != *((float *)v4 + 104))
      goto LABEL_359;
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_playbackRate != *((float *)v4 + 65))
      goto LABEL_359;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_rating != *((float *)v4 + 86))
      goto LABEL_359;
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0)
      goto LABEL_359;
    if (self->_negative)
    {
      if (!*((_BYTE *)v4 + 481))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 481))
    {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_playbackPosition != *((double *)v4 + 4))
      goto LABEL_359;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_repeatMode != *((_DWORD *)v4 + 90))
      goto LABEL_359;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 98))
      goto LABEL_359;
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_trackID != *((_QWORD *)v4 + 8))
      goto LABEL_359;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_radioStationID != *((_QWORD *)v4 + 5))
      goto LABEL_359;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_359;
  }
  radioStationHash = self->_radioStationHash;
  if ((unint64_t)radioStationHash | *((_QWORD *)v4 + 42)
    && !-[NSString isEqual:](radioStationHash, "isEqual:"))
  {
    goto LABEL_359;
  }
  systemAppPlaybackQueueData = self->_systemAppPlaybackQueueData;
  if ((unint64_t)systemAppPlaybackQueueData | *((_QWORD *)v4 + 56))
  {
    if (!-[NSData isEqual:](systemAppPlaybackQueueData, "isEqual:"))
      goto LABEL_359;
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if ((unint64_t)destinationAppDisplayID | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](destinationAppDisplayID, "isEqual:"))
      goto LABEL_359;
  }
  v12 = self->_has;
  v13 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    if ((v13 & 0x40000) == 0 || self->_sendOptions != *((_DWORD *)v4 + 92))
      goto LABEL_359;
  }
  else if ((v13 & 0x40000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_QWORD *)&v12 & 0x1000000000) != 0)
  {
    if ((v13 & 0x1000000000) == 0)
      goto LABEL_359;
    if (self->_requestDefermentToPlaybackQueuePosition)
    {
      if (!*((_BYTE *)v4 + 487))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 487))
    {
      goto LABEL_359;
    }
  }
  else if ((v13 & 0x1000000000) != 0)
  {
    goto LABEL_359;
  }
  contextID = self->_contextID;
  if ((unint64_t)contextID | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](contextID, "isEqual:"))
      goto LABEL_359;
    v12 = self->_has;
  }
  v15 = *((_QWORD *)v4 + 62);
  if ((*(_QWORD *)&v12 & 0x4000000000) != 0)
  {
    if ((v15 & 0x4000000000) == 0)
      goto LABEL_359;
    if (self->_shouldOverrideManuallyCuratedQueue)
    {
      if (!*((_BYTE *)v4 + 489))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 489))
    {
      goto LABEL_359;
    }
  }
  else if ((v15 & 0x4000000000) != 0)
  {
    goto LABEL_359;
  }
  stationURL = self->_stationURL;
  if ((unint64_t)stationURL | *((_QWORD *)v4 + 54))
  {
    if (!-[NSString isEqual:](stationURL, "isEqual:"))
      goto LABEL_359;
    v12 = self->_has;
  }
  v17 = *((_QWORD *)v4 + 62);
  if ((*(_QWORD *)&v12 & 0x2000000000) != 0)
  {
    if ((v17 & 0x2000000000) == 0)
      goto LABEL_359;
    if (self->_shouldBeginRadioPlayback)
    {
      if (!*((_BYTE *)v4 + 488))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 488))
    {
      goto LABEL_359;
    }
  }
  else if ((v17 & 0x2000000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_playbackQueueInsertionPosition != *((_DWORD *)v4 + 63))
      goto LABEL_359;
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_359;
  }
  contentItemID = self->_contentItemID;
  if ((unint64_t)contentItemID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](contentItemID, "isEqual:"))
      goto LABEL_359;
    v12 = self->_has;
  }
  v19 = *((_QWORD *)v4 + 62);
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0 || self->_playbackQueueOffset != *((_DWORD *)v4 + 64))
      goto LABEL_359;
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_playbackQueueDestinationOffset != *((_DWORD *)v4 + 62))
      goto LABEL_359;
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_359;
  }
  languageOption = self->_languageOption;
  if ((unint64_t)languageOption | *((_QWORD *)v4 + 25)
    && !-[NSData isEqual:](languageOption, "isEqual:"))
  {
    goto LABEL_359;
  }
  playbackQueueContext = self->_playbackQueueContext;
  if ((unint64_t)playbackQueueContext | *((_QWORD *)v4 + 30))
  {
    if (!-[NSData isEqual:](playbackQueueContext, "isEqual:"))
      goto LABEL_359;
  }
  insertAfterContentItemID = self->_insertAfterContentItemID;
  if ((unint64_t)insertAfterContentItemID | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](insertAfterContentItemID, "isEqual:"))
      goto LABEL_359;
  }
  nowPlayingContentItemID = self->_nowPlayingContentItemID;
  if ((unint64_t)nowPlayingContentItemID | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](nowPlayingContentItemID, "isEqual:"))
      goto LABEL_359;
  }
  v24 = *((_QWORD *)v4 + 62);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    if ((v24 & 0x20000) == 0 || self->_replaceIntent != *((_DWORD *)v4 + 91))
      goto LABEL_359;
  }
  else if ((v24 & 0x20000) != 0)
  {
    goto LABEL_359;
  }
  commandID = self->_commandID;
  if ((unint64_t)commandID | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](commandID, "isEqual:"))
    goto LABEL_359;
  senderID = self->_senderID;
  if ((unint64_t)senderID | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](senderID, "isEqual:"))
      goto LABEL_359;
  }
  remoteControlInterface = self->_remoteControlInterface;
  if ((unint64_t)remoteControlInterface | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](remoteControlInterface, "isEqual:"))
      goto LABEL_359;
  }
  v28 = self->_has;
  v29 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&v28 & 0x8000000) != 0)
  {
    if ((v29 & 0x8000000) == 0)
      goto LABEL_359;
    if (self->_beginSeek)
    {
      if (!*((_BYTE *)v4 + 478))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 478))
    {
      goto LABEL_359;
    }
  }
  else if ((v29 & 0x8000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v28 & 0x10000000) != 0)
  {
    if ((v29 & 0x10000000) == 0)
      goto LABEL_359;
    if (self->_endSeek)
    {
      if (!*((_BYTE *)v4 + 479))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 479))
    {
      goto LABEL_359;
    }
  }
  else if ((v29 & 0x10000000) != 0)
  {
    goto LABEL_359;
  }
  playbackSession = self->_playbackSession;
  if ((unint64_t)playbackSession | *((_QWORD *)v4 + 33)
    && !-[NSData isEqual:](playbackSession, "isEqual:"))
  {
    goto LABEL_359;
  }
  userIdentityData = self->_userIdentityData;
  if ((unint64_t)userIdentityData | *((_QWORD *)v4 + 57))
  {
    if (!-[NSData isEqual:](userIdentityData, "isEqual:"))
      goto LABEL_359;
  }
  insertBeforeContentItemID = self->_insertBeforeContentItemID;
  if ((unint64_t)insertBeforeContentItemID | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](insertBeforeContentItemID, "isEqual:"))
      goto LABEL_359;
  }
  v33 = self->_has;
  v34 = *((_QWORD *)v4 + 62);
  if ((*(_WORD *)&v33 & 0x4000) != 0)
  {
    if ((v34 & 0x4000) == 0 || self->_queueEndAction != *((_DWORD *)v4 + 83))
      goto LABEL_359;
  }
  else if ((v34 & 0x4000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_QWORD *)&v33 & 0x400000000) != 0)
  {
    if ((v34 & 0x400000000) == 0)
      goto LABEL_359;
    if (self->_preservesRepeatMode)
    {
      if (!*((_BYTE *)v4 + 485))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 485))
    {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x400000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_QWORD *)&v33 & 0x800000000) != 0)
  {
    if ((v34 & 0x800000000) == 0)
      goto LABEL_359;
    if (self->_preservesShuffleMode)
    {
      if (!*((_BYTE *)v4 + 486))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 486))
    {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x800000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_QWORD *)&v33 & 0x200000000) != 0)
  {
    if ((v34 & 0x200000000) == 0)
      goto LABEL_359;
    if (self->_preservesQueueEndAction)
    {
      if (!*((_BYTE *)v4 + 484))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 484))
    {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x200000000) != 0)
  {
    goto LABEL_359;
  }
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if ((unint64_t)homeKitUserIdentifier | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](homeKitUserIdentifier, "isEqual:"))
      goto LABEL_359;
    v33 = self->_has;
  }
  v36 = *((_QWORD *)v4 + 62);
  if ((*(_QWORD *)&v33 & 0x10000000000) != 0)
  {
    if ((v36 & 0x10000000000) == 0)
      goto LABEL_359;
    if (self->_verifySupportedCommands)
    {
      if (!*((_BYTE *)v4 + 491))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 491))
    {
      goto LABEL_359;
    }
  }
  else if ((v36 & 0x10000000000) != 0)
  {
    goto LABEL_359;
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if ((unint64_t)playbackSessionIdentifier | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](playbackSessionIdentifier, "isEqual:"))
      goto LABEL_359;
    v33 = self->_has;
  }
  v38 = *((_QWORD *)v4 + 62);
  if ((*(_WORD *)&v33 & 0x1000) != 0)
  {
    if ((v38 & 0x1000) == 0 || self->_playbackSessionPriority != *((_DWORD *)v4 + 74))
      goto LABEL_359;
  }
  else if ((v38 & 0x1000) != 0)
  {
    goto LABEL_359;
  }
  playbackSessionFilePath = self->_playbackSessionFilePath;
  if ((unint64_t)playbackSessionFilePath | *((_QWORD *)v4 + 34)
    && !-[NSString isEqual:](playbackSessionFilePath, "isEqual:"))
  {
    goto LABEL_359;
  }
  playbackSessionRevision = self->_playbackSessionRevision;
  if ((unint64_t)playbackSessionRevision | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](playbackSessionRevision, "isEqual:"))
      goto LABEL_359;
  }
  playbackSessionMetadata = self->_playbackSessionMetadata;
  if ((unint64_t)playbackSessionMetadata | *((_QWORD *)v4 + 36))
  {
    if (!-[NSData isEqual:](playbackSessionMetadata, "isEqual:"))
      goto LABEL_359;
  }
  playbackSessionType = self->_playbackSessionType;
  if ((unint64_t)playbackSessionType | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](playbackSessionType, "isEqual:"))
      goto LABEL_359;
  }
  v43 = *((_QWORD *)v4 + 62);
  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
  {
    if ((v43 & 0x8000000000) == 0)
      goto LABEL_359;
    if (self->_trueCompletion)
    {
      if (!*((_BYTE *)v4 + 490))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 490))
    {
      goto LABEL_359;
    }
  }
  else if ((v43 & 0x8000000000) != 0)
  {
    goto LABEL_359;
  }
  playbackAuthorizationToken = self->_playbackAuthorizationToken;
  if ((unint64_t)playbackAuthorizationToken | *((_QWORD *)v4 + 29)
    && !-[NSString isEqual:](playbackAuthorizationToken, "isEqual:"))
  {
    goto LABEL_359;
  }
  eventNoticeType = self->_eventNoticeType;
  if ((unint64_t)eventNoticeType | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](eventNoticeType, "isEqual:"))
      goto LABEL_359;
  }
  eventNoticeIdentifier = self->_eventNoticeIdentifier;
  if ((unint64_t)eventNoticeIdentifier | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](eventNoticeIdentifier, "isEqual:"))
      goto LABEL_359;
  }
  sharedPlaybackSessionIdentifier = self->_sharedPlaybackSessionIdentifier;
  if ((unint64_t)sharedPlaybackSessionIdentifier | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](sharedPlaybackSessionIdentifier, "isEqual:"))
      goto LABEL_359;
  }
  v48 = self->_has;
  v49 = *((_QWORD *)v4 + 62);
  if ((*(_BYTE *)&v48 & 4) != 0)
  {
    if ((v49 & 4) == 0 || self->_commandTimeout != *((double *)v4 + 3))
      goto LABEL_359;
  }
  else if ((v49 & 4) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_BYTE *)&v48 & 2) != 0)
  {
    if ((v49 & 2) == 0 || self->_assistantTTSEndTimestamp != *((double *)v4 + 2))
      goto LABEL_359;
  }
  else if ((v49 & 2) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_BYTE *)&v48 & 1) != 0)
  {
    if ((v49 & 1) == 0 || self->_assistantCommandSendTimestamp != *((double *)v4 + 1))
      goto LABEL_359;
  }
  else if ((v49 & 1) != 0)
  {
    goto LABEL_359;
  }
  originatingDeviceUID = self->_originatingDeviceUID;
  if ((unint64_t)originatingDeviceUID | *((_QWORD *)v4 + 28)
    && !-[NSString isEqual:](originatingDeviceUID, "isEqual:"))
  {
    goto LABEL_359;
  }
  destinationDeviceUIDs = self->_destinationDeviceUIDs;
  if ((unint64_t)destinationDeviceUIDs | *((_QWORD *)v4 + 18))
  {
    if (!-[NSData isEqual:](destinationDeviceUIDs, "isEqual:"))
      goto LABEL_359;
  }
  desiredSessionID = self->_desiredSessionID;
  if ((unint64_t)desiredSessionID | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](desiredSessionID, "isEqual:"))
      goto LABEL_359;
  }
  v53 = self->_has;
  v54 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&v53 & 0x2000000) != 0)
  {
    if ((v54 & 0x2000000) == 0)
      goto LABEL_359;
    if (self->_alwaysIgnoreDuringCall)
    {
      if (!*((_BYTE *)v4 + 476))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 476))
    {
      goto LABEL_359;
    }
  }
  else if ((v54 & 0x2000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v53 & 0x4000000) != 0)
  {
    if ((v54 & 0x4000000) == 0)
      goto LABEL_359;
    if (self->_alwaysIgnoreDuringSharePlay)
    {
      if (!*((_BYTE *)v4 + 477))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 477))
    {
      goto LABEL_359;
    }
  }
  else if ((v54 & 0x4000000) != 0)
  {
    goto LABEL_359;
  }
  commandSequenceUUID = self->_commandSequenceUUID;
  if ((unint64_t)commandSequenceUUID | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](commandSequenceUUID, "isEqual:"))
      goto LABEL_359;
    v53 = self->_has;
  }
  v56 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&v53 & 0x80000000) != 0)
  {
    if ((v56 & 0x80000000) == 0)
      goto LABEL_359;
    if (self->_originatedFromRemoteDevice)
    {
      if (!*((_BYTE *)v4 + 482))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 482))
    {
      goto LABEL_359;
    }
  }
  else if ((v56 & 0x80000000) != 0)
  {
    goto LABEL_359;
  }
  siriTurnIdentifier = self->_siriTurnIdentifier;
  if ((unint64_t)siriTurnIdentifier | *((_QWORD *)v4 + 51)
    && !-[NSString isEqual:](siriTurnIdentifier, "isEqual:"))
  {
    goto LABEL_359;
  }
  siriSearchDataSetIdentifier = self->_siriSearchDataSetIdentifier;
  if ((unint64_t)siriSearchDataSetIdentifier | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](siriSearchDataSetIdentifier, "isEqual:"))
      goto LABEL_359;
  }
  v59 = self->_has;
  v60 = *((_QWORD *)v4 + 62);
  if ((*(_QWORD *)&v59 & 0x100000000) != 0)
  {
    if ((v60 & 0x100000000) == 0)
      goto LABEL_359;
    if (self->_prepareForSetQueueIsProactive)
    {
      if (!*((_BYTE *)v4 + 483))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 483))
    {
      goto LABEL_359;
    }
  }
  else if ((v60 & 0x100000000) != 0)
  {
    goto LABEL_359;
  }
  prepareForSetQueueProactiveReason = self->_prepareForSetQueueProactiveReason;
  if ((unint64_t)prepareForSetQueueProactiveReason | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](prepareForSetQueueProactiveReason, "isEqual:"))
      goto LABEL_359;
    v59 = self->_has;
  }
  v62 = *((_QWORD *)v4 + 62);
  if ((*(_WORD *)&v59 & 0x2000) != 0)
  {
    if ((v62 & 0x2000) == 0 || self->_prepareForSetQueueProactiveReasonType != *((_DWORD *)v4 + 82))
      goto LABEL_359;
  }
  else if ((v62 & 0x2000) != 0)
  {
    goto LABEL_359;
  }
  applicationUserIdentity = self->_applicationUserIdentity;
  if ((unint64_t)applicationUserIdentity | *((_QWORD *)v4 + 9)
    && !-[NSData isEqual:](applicationUserIdentity, "isEqual:"))
  {
    goto LABEL_359;
  }
  systemAppPlaybackQueue = self->_systemAppPlaybackQueue;
  if ((unint64_t)systemAppPlaybackQueue | *((_QWORD *)v4 + 55))
  {
    if (!-[_MRSystemPlaybackQueueProtobuf isEqual:](systemAppPlaybackQueue, "isEqual:"))
      goto LABEL_359;
  }
  v65 = self->_has;
  v66 = *((_QWORD *)v4 + 62);
  if ((*(_QWORD *)&v65 & 0x20000000000) != 0)
  {
    if ((v66 & 0x20000000000) == 0)
      goto LABEL_359;
    if (self->_vocalsControlActive)
    {
      if (!*((_BYTE *)v4 + 492))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 492))
    {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x20000000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x400000) != 0)
  {
    if ((v66 & 0x400000) == 0 || self->_vocalsControlLevel != *((float *)v4 + 116))
      goto LABEL_359;
  }
  else if ((v66 & 0x400000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x1000000) != 0)
  {
    if ((v66 & 0x1000000) == 0 || self->_vocalsControlMinLevel != *((float *)v4 + 118))
      goto LABEL_359;
  }
  else if ((v66 & 0x1000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x800000) != 0)
  {
    if ((v66 & 0x800000) == 0 || self->_vocalsControlMaxLevel != *((float *)v4 + 117))
      goto LABEL_359;
  }
  else if ((v66 & 0x800000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_QWORD *)&v65 & 0x40000000000) != 0)
  {
    if ((v66 & 0x40000000000) == 0)
      goto LABEL_359;
    if (self->_vocalsControlContinuous)
    {
      if (!*((_BYTE *)v4 + 493))
        goto LABEL_359;
    }
    else if (*((_BYTE *)v4 + 493))
    {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x40000000000) != 0)
  {
    goto LABEL_359;
  }
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if ((unint64_t)associatedParticipantIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](associatedParticipantIdentifier, "isEqual:"))
      goto LABEL_359;
    v65 = self->_has;
  }
  v68 = *((_QWORD *)v4 + 62);
  if ((*(_BYTE *)&v65 & 0x40) != 0)
  {
    if ((v68 & 0x40) == 0 || self->_sleepTimerTime != *((double *)v4 + 7))
      goto LABEL_359;
  }
  else if ((v68 & 0x40) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x200000) == 0)
  {
    if ((v68 & 0x200000) == 0)
      goto LABEL_350;
LABEL_359:
    v71 = 0;
    goto LABEL_360;
  }
  if ((v68 & 0x200000) == 0 || self->_sleepTimerStopMode != *((_DWORD *)v4 + 105))
    goto LABEL_359;
LABEL_350:
  dialogOptions = self->_dialogOptions;
  if ((unint64_t)dialogOptions | *((_QWORD *)v4 + 19)
    && !-[_MRDictionaryProtobuf isEqual:](dialogOptions, "isEqual:"))
  {
    goto LABEL_359;
  }
  clientPreferredLanguages = self->_clientPreferredLanguages;
  if ((unint64_t)clientPreferredLanguages | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](clientPreferredLanguages, "isEqual:"))
      goto LABEL_359;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_QWORD *)v4 + 62) & 0x20) == 0 || self->_referencePosition != *((double *)v4 + 6))
      goto LABEL_359;
    v71 = 1;
  }
  else
  {
    v71 = (*((_QWORD *)v4 + 62) & 0x20) == 0;
  }
LABEL_360:

  return v71;
}

- (unint64_t)hash
{
  $D356D6608A0B9B449BA135355957D2E8 has;
  float skipInterval;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float playbackRate;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float rating;
  float v16;
  float v17;
  float v18;
  double playbackPosition;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  $D356D6608A0B9B449BA135355957D2E8 v24;
  $D356D6608A0B9B449BA135355957D2E8 v25;
  $D356D6608A0B9B449BA135355957D2E8 v26;
  $D356D6608A0B9B449BA135355957D2E8 v27;
  $D356D6608A0B9B449BA135355957D2E8 v28;
  $D356D6608A0B9B449BA135355957D2E8 v29;
  unint64_t v30;
  double commandTimeout;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  double assistantTTSEndTimestamp;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  double assistantCommandSendTimestamp;
  double v42;
  long double v43;
  double v44;
  $D356D6608A0B9B449BA135355957D2E8 v45;
  $D356D6608A0B9B449BA135355957D2E8 v46;
  float vocalsControlLevel;
  float v48;
  float v49;
  float v50;
  unint64_t v51;
  unint64_t v52;
  float vocalsControlMinLevel;
  float v54;
  float v55;
  float v56;
  unint64_t v57;
  float vocalsControlMaxLevel;
  float v59;
  float v60;
  float v61;
  $D356D6608A0B9B449BA135355957D2E8 v62;
  unint64_t v63;
  double sleepTimerTime;
  double v65;
  long double v66;
  double v67;
  uint64_t v68;
  unint64_t v69;
  NSUInteger v70;
  unint64_t v71;
  double referencePosition;
  double v73;
  long double v74;
  double v75;
  NSUInteger v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSUInteger v85;
  uint64_t v86;
  NSUInteger v87;
  NSUInteger v88;
  uint64_t v89;
  NSUInteger v90;
  uint64_t v91;
  uint64_t v92;
  NSUInteger v93;
  uint64_t v94;
  NSUInteger v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  NSUInteger v99;
  NSUInteger v100;
  NSUInteger v101;
  NSUInteger v102;
  uint64_t v103;
  NSUInteger v104;
  uint64_t v105;
  NSUInteger v106;
  NSUInteger v107;
  uint64_t v108;
  NSUInteger v109;
  uint64_t v110;
  NSUInteger v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSUInteger v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSUInteger v121;
  NSUInteger v122;
  NSUInteger v123;
  uint64_t v124;
  NSUInteger v125;
  NSUInteger v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  NSUInteger v131;
  uint64_t v132;
  uint64_t v133;
  NSUInteger v134;
  uint64_t v135;
  NSUInteger v136;
  uint64_t v137;
  uint64_t v138;
  NSUInteger v139;
  uint64_t v140;
  NSUInteger v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  NSUInteger v150;
  NSUInteger v151;

  v151 = -[NSString hash](self->_sourceID, "hash");
  v150 = -[NSString hash](self->_mediaType, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    v149 = 2654435761 * self->_externalPlayerCommand;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v149 = 0;
  if ((*(_DWORD *)&has & 0x100000) == 0)
    goto LABEL_8;
LABEL_3:
  skipInterval = self->_skipInterval;
  v5 = -skipInterval;
  if (skipInterval >= 0.0)
    v5 = self->_skipInterval;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_11:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    playbackRate = self->_playbackRate;
    v11 = -playbackRate;
    if (playbackRate >= 0.0)
      v11 = self->_playbackRate;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    rating = self->_rating;
    v16 = -rating;
    if (rating >= 0.0)
      v16 = self->_rating;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    v147 = 2654435761 * self->_negative;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_29;
LABEL_34:
    v23 = 0;
    goto LABEL_37;
  }
  v147 = 0;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_34;
LABEL_29:
  playbackPosition = self->_playbackPosition;
  v20 = -playbackPosition;
  if (playbackPosition >= 0.0)
    v20 = self->_playbackPosition;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0)
      v23 += (unint64_t)v22;
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_37:
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    v145 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_39;
LABEL_42:
    v144 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_40;
    goto LABEL_43;
  }
  v145 = 2654435761 * self->_repeatMode;
  if ((*(_DWORD *)&has & 0x80000) == 0)
    goto LABEL_42;
LABEL_39:
  v144 = 2654435761 * self->_shuffleMode;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_40:
    v143 = 2654435761u * self->_trackID;
    goto LABEL_44;
  }
LABEL_43:
  v143 = 0;
LABEL_44:
  v146 = v23;
  if ((*(_BYTE *)&has & 0x10) != 0)
    v142 = 2654435761 * self->_radioStationID;
  else
    v142 = 0;
  v141 = -[NSString hash](self->_radioStationHash, "hash");
  v140 = -[NSData hash](self->_systemAppPlaybackQueueData, "hash");
  v139 = -[NSString hash](self->_destinationAppDisplayID, "hash");
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    v138 = 2654435761 * self->_sendOptions;
    if ((*(_QWORD *)&v24 & 0x1000000000) != 0)
      goto LABEL_49;
  }
  else
  {
    v138 = 0;
    if ((*(_QWORD *)&v24 & 0x1000000000) != 0)
    {
LABEL_49:
      v137 = 2654435761 * self->_requestDefermentToPlaybackQueuePosition;
      goto LABEL_52;
    }
  }
  v137 = 0;
LABEL_52:
  v136 = -[NSString hash](self->_contextID, "hash");
  if ((*((_BYTE *)&self->_has + 4) & 0x40) != 0)
    v135 = 2654435761 * self->_shouldOverrideManuallyCuratedQueue;
  else
    v135 = 0;
  v134 = -[NSString hash](self->_stationURL, "hash");
  v25 = self->_has;
  if ((*(_QWORD *)&v25 & 0x2000000000) != 0)
  {
    v133 = 2654435761 * self->_shouldBeginRadioPlayback;
    if ((*(_WORD *)&v25 & 0x200) != 0)
      goto LABEL_57;
  }
  else
  {
    v133 = 0;
    if ((*(_WORD *)&v25 & 0x200) != 0)
    {
LABEL_57:
      v132 = 2654435761 * self->_playbackQueueInsertionPosition;
      goto LABEL_60;
    }
  }
  v132 = 0;
LABEL_60:
  v131 = -[NSString hash](self->_contentItemID, "hash");
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x400) != 0)
  {
    v130 = 2654435761 * self->_playbackQueueOffset;
    if ((*(_WORD *)&v26 & 0x100) != 0)
      goto LABEL_62;
  }
  else
  {
    v130 = 0;
    if ((*(_WORD *)&v26 & 0x100) != 0)
    {
LABEL_62:
      v129 = 2654435761 * self->_playbackQueueDestinationOffset;
      goto LABEL_65;
    }
  }
  v129 = 0;
LABEL_65:
  v128 = -[NSData hash](self->_languageOption, "hash");
  v127 = -[NSData hash](self->_playbackQueueContext, "hash");
  v126 = -[NSString hash](self->_insertAfterContentItemID, "hash");
  v125 = -[NSString hash](self->_nowPlayingContentItemID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v124 = 2654435761 * self->_replaceIntent;
  else
    v124 = 0;
  v123 = -[NSString hash](self->_commandID, "hash");
  v122 = -[NSString hash](self->_senderID, "hash");
  v121 = -[NSString hash](self->_remoteControlInterface, "hash");
  v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x8000000) != 0)
  {
    v120 = 2654435761 * self->_beginSeek;
    if ((*(_DWORD *)&v27 & 0x10000000) != 0)
      goto LABEL_70;
  }
  else
  {
    v120 = 0;
    if ((*(_DWORD *)&v27 & 0x10000000) != 0)
    {
LABEL_70:
      v119 = 2654435761 * self->_endSeek;
      goto LABEL_73;
    }
  }
  v119 = 0;
LABEL_73:
  v118 = -[NSData hash](self->_playbackSession, "hash");
  v117 = -[NSData hash](self->_userIdentityData, "hash");
  v116 = -[NSString hash](self->_insertBeforeContentItemID, "hash");
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) != 0)
  {
    v115 = 2654435761 * self->_queueEndAction;
    if ((*(_QWORD *)&v28 & 0x400000000) != 0)
    {
LABEL_75:
      v114 = 2654435761 * self->_preservesRepeatMode;
      if ((*(_QWORD *)&v28 & 0x800000000) != 0)
        goto LABEL_76;
LABEL_80:
      v113 = 0;
      if ((*(_QWORD *)&v28 & 0x200000000) != 0)
        goto LABEL_77;
      goto LABEL_81;
    }
  }
  else
  {
    v115 = 0;
    if ((*(_QWORD *)&v28 & 0x400000000) != 0)
      goto LABEL_75;
  }
  v114 = 0;
  if ((*(_QWORD *)&v28 & 0x800000000) == 0)
    goto LABEL_80;
LABEL_76:
  v113 = 2654435761 * self->_preservesShuffleMode;
  if ((*(_QWORD *)&v28 & 0x200000000) != 0)
  {
LABEL_77:
    v112 = 2654435761 * self->_preservesQueueEndAction;
    goto LABEL_82;
  }
LABEL_81:
  v112 = 0;
LABEL_82:
  v111 = -[NSString hash](self->_homeKitUserIdentifier, "hash");
  if ((*((_BYTE *)&self->_has + 5) & 1) != 0)
    v110 = 2654435761 * self->_verifySupportedCommands;
  else
    v110 = 0;
  v109 = -[NSString hash](self->_playbackSessionIdentifier, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v108 = 2654435761 * self->_playbackSessionPriority;
  else
    v108 = 0;
  v107 = -[NSString hash](self->_playbackSessionFilePath, "hash");
  v106 = -[NSString hash](self->_playbackSessionRevision, "hash");
  v105 = -[NSData hash](self->_playbackSessionMetadata, "hash");
  v104 = -[NSString hash](self->_playbackSessionType, "hash");
  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
    v103 = 2654435761 * self->_trueCompletion;
  else
    v103 = 0;
  v102 = -[NSString hash](self->_playbackAuthorizationToken, "hash");
  v101 = -[NSString hash](self->_eventNoticeType, "hash");
  v100 = -[NSString hash](self->_eventNoticeIdentifier, "hash");
  v99 = -[NSString hash](self->_sharedPlaybackSessionIdentifier, "hash");
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 4) != 0)
  {
    commandTimeout = self->_commandTimeout;
    v32 = -commandTimeout;
    if (commandTimeout >= 0.0)
      v32 = self->_commandTimeout;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((*(_BYTE *)&v29 & 2) != 0)
  {
    assistantTTSEndTimestamp = self->_assistantTTSEndTimestamp;
    v37 = -assistantTTSEndTimestamp;
    if (assistantTTSEndTimestamp >= 0.0)
      v37 = self->_assistantTTSEndTimestamp;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  v97 = v35;
  if ((*(_BYTE *)&v29 & 1) != 0)
  {
    assistantCommandSendTimestamp = self->_assistantCommandSendTimestamp;
    v42 = -assistantCommandSendTimestamp;
    if (assistantCommandSendTimestamp >= 0.0)
      v42 = self->_assistantCommandSendTimestamp;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  v96 = v40;
  v95 = -[NSString hash](self->_originatingDeviceUID, "hash");
  v94 = -[NSData hash](self->_destinationDeviceUIDs, "hash");
  v93 = -[NSString hash](self->_desiredSessionID, "hash");
  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x2000000) != 0)
  {
    v92 = 2654435761 * self->_alwaysIgnoreDuringCall;
    if ((*(_DWORD *)&v45 & 0x4000000) != 0)
      goto LABEL_117;
  }
  else
  {
    v92 = 0;
    if ((*(_DWORD *)&v45 & 0x4000000) != 0)
    {
LABEL_117:
      v91 = 2654435761 * self->_alwaysIgnoreDuringSharePlay;
      goto LABEL_120;
    }
  }
  v91 = 0;
LABEL_120:
  v90 = -[NSString hash](self->_commandSequenceUUID, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    v89 = 2654435761 * self->_originatedFromRemoteDevice;
  else
    v89 = 0;
  v88 = -[NSString hash](self->_siriTurnIdentifier, "hash");
  v87 = -[NSString hash](self->_siriSearchDataSetIdentifier, "hash");
  if ((*((_BYTE *)&self->_has + 4) & 1) != 0)
    v86 = 2654435761 * self->_prepareForSetQueueIsProactive;
  else
    v86 = 0;
  v85 = -[NSString hash](self->_prepareForSetQueueProactiveReason, "hash");
  v148 = v8;
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v84 = 2654435761 * self->_prepareForSetQueueProactiveReasonType;
  else
    v84 = 0;
  v83 = -[NSData hash](self->_applicationUserIdentity, "hash");
  v82 = -[_MRSystemPlaybackQueueProtobuf hash](self->_systemAppPlaybackQueue, "hash");
  v46 = self->_has;
  if ((*(_QWORD *)&v46 & 0x20000000000) != 0)
  {
    v81 = 2654435761 * self->_vocalsControlActive;
    if ((*(_DWORD *)&v46 & 0x400000) != 0)
      goto LABEL_131;
LABEL_136:
    v51 = 0;
    goto LABEL_139;
  }
  v81 = 0;
  if ((*(_DWORD *)&v46 & 0x400000) == 0)
    goto LABEL_136;
LABEL_131:
  vocalsControlLevel = self->_vocalsControlLevel;
  v48 = -vocalsControlLevel;
  if (vocalsControlLevel >= 0.0)
    v48 = self->_vocalsControlLevel;
  v49 = floorf(v48 + 0.5);
  v50 = (float)(v48 - v49) * 1.8447e19;
  v51 = 2654435761u * (unint64_t)fmodf(v49, 1.8447e19);
  if (v50 >= 0.0)
  {
    if (v50 > 0.0)
      v51 += (unint64_t)v50;
  }
  else
  {
    v51 -= (unint64_t)fabsf(v50);
  }
LABEL_139:
  if ((*(_DWORD *)&v46 & 0x1000000) != 0)
  {
    vocalsControlMinLevel = self->_vocalsControlMinLevel;
    v54 = -vocalsControlMinLevel;
    if (vocalsControlMinLevel >= 0.0)
      v54 = self->_vocalsControlMinLevel;
    v55 = floorf(v54 + 0.5);
    v56 = (float)(v54 - v55) * 1.8447e19;
    v52 = 2654435761u * (unint64_t)fmodf(v55, 1.8447e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0)
        v52 += (unint64_t)v56;
    }
    else
    {
      v52 -= (unint64_t)fabsf(v56);
    }
  }
  else
  {
    v52 = 0;
  }
  if ((*(_DWORD *)&v46 & 0x800000) != 0)
  {
    vocalsControlMaxLevel = self->_vocalsControlMaxLevel;
    v59 = -vocalsControlMaxLevel;
    if (vocalsControlMaxLevel >= 0.0)
      v59 = self->_vocalsControlMaxLevel;
    v60 = floorf(v59 + 0.5);
    v61 = (float)(v59 - v60) * 1.8447e19;
    v57 = 2654435761u * (unint64_t)fmodf(v60, 1.8447e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabsf(v61);
    }
  }
  else
  {
    v57 = 0;
  }
  v80 = v57;
  if ((*(_QWORD *)&v46 & 0x40000000000) != 0)
    v79 = 2654435761 * self->_vocalsControlContinuous;
  else
    v79 = 0;
  v98 = v30;
  v77 = -[NSString hash](self->_associatedParticipantIdentifier, "hash");
  v62 = self->_has;
  if ((*(_BYTE *)&v62 & 0x40) != 0)
  {
    sleepTimerTime = self->_sleepTimerTime;
    v65 = -sleepTimerTime;
    if (sleepTimerTime >= 0.0)
      v65 = self->_sleepTimerTime;
    v66 = floor(v65 + 0.5);
    v67 = (v65 - v66) * 1.84467441e19;
    v63 = 2654435761u * (unint64_t)fmod(v66, 1.84467441e19);
    if (v67 >= 0.0)
    {
      if (v67 > 0.0)
        v63 += (unint64_t)v67;
    }
    else
    {
      v63 -= (unint64_t)fabs(v67);
    }
  }
  else
  {
    v63 = 0;
  }
  if ((*(_DWORD *)&v62 & 0x200000) != 0)
    v68 = 2654435761 * self->_sleepTimerStopMode;
  else
    v68 = 0;
  v69 = -[_MRDictionaryProtobuf hash](self->_dialogOptions, "hash", v77);
  v70 = -[NSString hash](self->_clientPreferredLanguages, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    referencePosition = self->_referencePosition;
    v73 = -referencePosition;
    if (referencePosition >= 0.0)
      v73 = self->_referencePosition;
    v74 = floor(v73 + 0.5);
    v75 = (v73 - v74) * 1.84467441e19;
    v71 = 2654435761u * (unint64_t)fmod(v74, 1.84467441e19);
    if (v75 >= 0.0)
    {
      if (v75 > 0.0)
        v71 += (unint64_t)v75;
    }
    else
    {
      v71 -= (unint64_t)fabs(v75);
    }
  }
  else
  {
    v71 = 0;
  }
  return v150 ^ v151 ^ v149 ^ v148 ^ v9 ^ v14 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v51 ^ v52 ^ v80 ^ v79 ^ v78 ^ v63 ^ v68 ^ v69 ^ v70 ^ v71;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _MRSystemPlaybackQueueProtobuf *systemAppPlaybackQueue;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _MRDictionaryProtobuf *dialogOptions;
  uint64_t v18;
  id v19;

  v4 = a3;
  v19 = v4;
  if (*((_QWORD *)v4 + 53))
  {
    -[_MRCommandOptionsProtobuf setSourceID:](self, "setSourceID:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 26))
  {
    -[_MRCommandOptionsProtobuf setMediaType:](self, "setMediaType:");
    v4 = v19;
  }
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x20000000) != 0)
  {
    self->_externalPlayerCommand = *((_BYTE *)v4 + 480);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    v5 = *((_QWORD *)v4 + 62);
    if ((v5 & 0x100000) == 0)
    {
LABEL_7:
      if ((v5 & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_134;
    }
  }
  else if ((v5 & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  self->_skipInterval = *((float *)v4 + 104);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_135;
  }
LABEL_134:
  self->_playbackRate = *((float *)v4 + 65);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_10;
    goto LABEL_136;
  }
LABEL_135:
  self->_rating = *((float *)v4 + 86);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_137;
  }
LABEL_136:
  self->_negative = *((_BYTE *)v4 + 481);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_138;
  }
LABEL_137:
  self->_playbackPosition = *((double *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x10000) == 0)
  {
LABEL_12:
    if ((v5 & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_139;
  }
LABEL_138:
  self->_repeatMode = *((_DWORD *)v4 + 90);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x80000) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_140;
  }
LABEL_139:
  self->_shuffleMode = *((_DWORD *)v4 + 98);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *((_QWORD *)v4 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_140:
  self->_trackID = *((_QWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  if ((*((_QWORD *)v4 + 62) & 0x10) != 0)
  {
LABEL_15:
    self->_radioStationID = *((_QWORD *)v4 + 5);
    *(_QWORD *)&self->_has |= 0x10uLL;
  }
LABEL_16:
  if (*((_QWORD *)v4 + 42))
  {
    -[_MRCommandOptionsProtobuf setRadioStationHash:](self, "setRadioStationHash:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 56))
  {
    -[_MRCommandOptionsProtobuf setSystemAppPlaybackQueueData:](self, "setSystemAppPlaybackQueueData:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[_MRCommandOptionsProtobuf setDestinationAppDisplayID:](self, "setDestinationAppDisplayID:");
    v4 = v19;
  }
  v6 = *((_QWORD *)v4 + 62);
  if ((v6 & 0x40000) != 0)
  {
    self->_sendOptions = *((_DWORD *)v4 + 92);
    *(_QWORD *)&self->_has |= 0x40000uLL;
    v6 = *((_QWORD *)v4 + 62);
  }
  if ((v6 & 0x1000000000) != 0)
  {
    self->_requestDefermentToPlaybackQueuePosition = *((_BYTE *)v4 + 487);
    *(_QWORD *)&self->_has |= 0x1000000000uLL;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[_MRCommandOptionsProtobuf setContextID:](self, "setContextID:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 500) & 0x40) != 0)
  {
    self->_shouldOverrideManuallyCuratedQueue = *((_BYTE *)v4 + 489);
    *(_QWORD *)&self->_has |= 0x4000000000uLL;
  }
  if (*((_QWORD *)v4 + 54))
  {
    -[_MRCommandOptionsProtobuf setStationURL:](self, "setStationURL:");
    v4 = v19;
  }
  v7 = *((_QWORD *)v4 + 62);
  if ((v7 & 0x2000000000) != 0)
  {
    self->_shouldBeginRadioPlayback = *((_BYTE *)v4 + 488);
    *(_QWORD *)&self->_has |= 0x2000000000uLL;
    v7 = *((_QWORD *)v4 + 62);
  }
  if ((v7 & 0x200) != 0)
  {
    self->_playbackQueueInsertionPosition = *((_DWORD *)v4 + 63);
    *(_QWORD *)&self->_has |= 0x200uLL;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[_MRCommandOptionsProtobuf setContentItemID:](self, "setContentItemID:");
    v4 = v19;
  }
  v8 = *((_QWORD *)v4 + 62);
  if ((v8 & 0x400) != 0)
  {
    self->_playbackQueueOffset = *((_DWORD *)v4 + 64);
    *(_QWORD *)&self->_has |= 0x400uLL;
    v8 = *((_QWORD *)v4 + 62);
  }
  if ((v8 & 0x100) != 0)
  {
    self->_playbackQueueDestinationOffset = *((_DWORD *)v4 + 62);
    *(_QWORD *)&self->_has |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 25))
  {
    -[_MRCommandOptionsProtobuf setLanguageOption:](self, "setLanguageOption:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 30))
  {
    -[_MRCommandOptionsProtobuf setPlaybackQueueContext:](self, "setPlaybackQueueContext:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 23))
  {
    -[_MRCommandOptionsProtobuf setInsertAfterContentItemID:](self, "setInsertAfterContentItemID:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 27))
  {
    -[_MRCommandOptionsProtobuf setNowPlayingContentItemID:](self, "setNowPlayingContentItemID:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 498) & 2) != 0)
  {
    self->_replaceIntent = *((_DWORD *)v4 + 91);
    *(_QWORD *)&self->_has |= 0x20000uLL;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[_MRCommandOptionsProtobuf setCommandID:](self, "setCommandID:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 47))
  {
    -[_MRCommandOptionsProtobuf setSenderID:](self, "setSenderID:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 44))
  {
    -[_MRCommandOptionsProtobuf setRemoteControlInterface:](self, "setRemoteControlInterface:");
    v4 = v19;
  }
  v9 = *((_QWORD *)v4 + 62);
  if ((v9 & 0x8000000) != 0)
  {
    self->_beginSeek = *((_BYTE *)v4 + 478);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
    v9 = *((_QWORD *)v4 + 62);
  }
  if ((v9 & 0x10000000) != 0)
  {
    self->_endSeek = *((_BYTE *)v4 + 479);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
  if (*((_QWORD *)v4 + 33))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSession:](self, "setPlaybackSession:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 57))
  {
    -[_MRCommandOptionsProtobuf setUserIdentityData:](self, "setUserIdentityData:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 24))
  {
    -[_MRCommandOptionsProtobuf setInsertBeforeContentItemID:](self, "setInsertBeforeContentItemID:");
    v4 = v19;
  }
  v10 = *((_QWORD *)v4 + 62);
  if ((v10 & 0x4000) != 0)
  {
    self->_queueEndAction = *((_DWORD *)v4 + 83);
    *(_QWORD *)&self->_has |= 0x4000uLL;
    v10 = *((_QWORD *)v4 + 62);
    if ((v10 & 0x400000000) == 0)
    {
LABEL_70:
      if ((v10 & 0x800000000) == 0)
        goto LABEL_71;
      goto LABEL_144;
    }
  }
  else if ((v10 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  self->_preservesRepeatMode = *((_BYTE *)v4 + 485);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v10 = *((_QWORD *)v4 + 62);
  if ((v10 & 0x800000000) == 0)
  {
LABEL_71:
    if ((v10 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
LABEL_144:
  self->_preservesShuffleMode = *((_BYTE *)v4 + 486);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  if ((*((_QWORD *)v4 + 62) & 0x200000000) != 0)
  {
LABEL_72:
    self->_preservesQueueEndAction = *((_BYTE *)v4 + 484);
    *(_QWORD *)&self->_has |= 0x200000000uLL;
  }
LABEL_73:
  if (*((_QWORD *)v4 + 22))
  {
    -[_MRCommandOptionsProtobuf setHomeKitUserIdentifier:](self, "setHomeKitUserIdentifier:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 501) & 1) != 0)
  {
    self->_verifySupportedCommands = *((_BYTE *)v4 + 491);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
  }
  if (*((_QWORD *)v4 + 35))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionIdentifier:](self, "setPlaybackSessionIdentifier:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 497) & 0x10) != 0)
  {
    self->_playbackSessionPriority = *((_DWORD *)v4 + 74);
    *(_QWORD *)&self->_has |= 0x1000uLL;
  }
  if (*((_QWORD *)v4 + 34))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionFilePath:](self, "setPlaybackSessionFilePath:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 38))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionRevision:](self, "setPlaybackSessionRevision:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 36))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionMetadata:](self, "setPlaybackSessionMetadata:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 39))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionType:](self, "setPlaybackSessionType:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 500) & 0x80) != 0)
  {
    self->_trueCompletion = *((_BYTE *)v4 + 490);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
  }
  if (*((_QWORD *)v4 + 29))
  {
    -[_MRCommandOptionsProtobuf setPlaybackAuthorizationToken:](self, "setPlaybackAuthorizationToken:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 21))
  {
    -[_MRCommandOptionsProtobuf setEventNoticeType:](self, "setEventNoticeType:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[_MRCommandOptionsProtobuf setEventNoticeIdentifier:](self, "setEventNoticeIdentifier:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 48))
  {
    -[_MRCommandOptionsProtobuf setSharedPlaybackSessionIdentifier:](self, "setSharedPlaybackSessionIdentifier:");
    v4 = v19;
  }
  v11 = *((_QWORD *)v4 + 62);
  if ((v11 & 4) != 0)
  {
    self->_commandTimeout = *((double *)v4 + 3);
    *(_QWORD *)&self->_has |= 4uLL;
    v11 = *((_QWORD *)v4 + 62);
    if ((v11 & 2) == 0)
    {
LABEL_101:
      if ((v11 & 1) == 0)
        goto LABEL_103;
      goto LABEL_102;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_101;
  }
  self->_assistantTTSEndTimestamp = *((double *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  if ((*((_QWORD *)v4 + 62) & 1) != 0)
  {
LABEL_102:
    self->_assistantCommandSendTimestamp = *((double *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
  }
LABEL_103:
  if (*((_QWORD *)v4 + 28))
  {
    -[_MRCommandOptionsProtobuf setOriginatingDeviceUID:](self, "setOriginatingDeviceUID:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[_MRCommandOptionsProtobuf setDestinationDeviceUIDs:](self, "setDestinationDeviceUIDs:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[_MRCommandOptionsProtobuf setDesiredSessionID:](self, "setDesiredSessionID:");
    v4 = v19;
  }
  v12 = *((_QWORD *)v4 + 62);
  if ((v12 & 0x2000000) != 0)
  {
    self->_alwaysIgnoreDuringCall = *((_BYTE *)v4 + 476);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v12 = *((_QWORD *)v4 + 62);
  }
  if ((v12 & 0x4000000) != 0)
  {
    self->_alwaysIgnoreDuringSharePlay = *((_BYTE *)v4 + 477);
    *(_QWORD *)&self->_has |= 0x4000000uLL;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[_MRCommandOptionsProtobuf setCommandSequenceUUID:](self, "setCommandSequenceUUID:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 499) & 0x80) != 0)
  {
    self->_originatedFromRemoteDevice = *((_BYTE *)v4 + 482);
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
  if (*((_QWORD *)v4 + 51))
  {
    -[_MRCommandOptionsProtobuf setSiriTurnIdentifier:](self, "setSiriTurnIdentifier:");
    v4 = v19;
  }
  if (*((_QWORD *)v4 + 50))
  {
    -[_MRCommandOptionsProtobuf setSiriSearchDataSetIdentifier:](self, "setSiriSearchDataSetIdentifier:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 500) & 1) != 0)
  {
    self->_prepareForSetQueueIsProactive = *((_BYTE *)v4 + 483);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
  }
  if (*((_QWORD *)v4 + 40))
  {
    -[_MRCommandOptionsProtobuf setPrepareForSetQueueProactiveReason:](self, "setPrepareForSetQueueProactiveReason:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 497) & 0x20) != 0)
  {
    self->_prepareForSetQueueProactiveReasonType = *((_DWORD *)v4 + 82);
    *(_QWORD *)&self->_has |= 0x2000uLL;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[_MRCommandOptionsProtobuf setApplicationUserIdentity:](self, "setApplicationUserIdentity:");
    v4 = v19;
  }
  systemAppPlaybackQueue = self->_systemAppPlaybackQueue;
  v14 = *((_QWORD *)v4 + 55);
  if (systemAppPlaybackQueue)
  {
    if (!v14)
      goto LABEL_152;
    -[_MRSystemPlaybackQueueProtobuf mergeFrom:](systemAppPlaybackQueue, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_152;
    -[_MRCommandOptionsProtobuf setSystemAppPlaybackQueue:](self, "setSystemAppPlaybackQueue:");
  }
  v4 = v19;
LABEL_152:
  v15 = *((_QWORD *)v4 + 62);
  if ((v15 & 0x20000000000) != 0)
  {
    self->_vocalsControlActive = *((_BYTE *)v4 + 492);
    *(_QWORD *)&self->_has |= 0x20000000000uLL;
    v15 = *((_QWORD *)v4 + 62);
    if ((v15 & 0x400000) == 0)
    {
LABEL_154:
      if ((v15 & 0x1000000) == 0)
        goto LABEL_155;
      goto LABEL_169;
    }
  }
  else if ((v15 & 0x400000) == 0)
  {
    goto LABEL_154;
  }
  self->_vocalsControlLevel = *((float *)v4 + 116);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v15 = *((_QWORD *)v4 + 62);
  if ((v15 & 0x1000000) == 0)
  {
LABEL_155:
    if ((v15 & 0x800000) == 0)
      goto LABEL_156;
    goto LABEL_170;
  }
LABEL_169:
  self->_vocalsControlMinLevel = *((float *)v4 + 118);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v15 = *((_QWORD *)v4 + 62);
  if ((v15 & 0x800000) == 0)
  {
LABEL_156:
    if ((v15 & 0x40000000000) == 0)
      goto LABEL_158;
    goto LABEL_157;
  }
LABEL_170:
  self->_vocalsControlMaxLevel = *((float *)v4 + 117);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  if ((*((_QWORD *)v4 + 62) & 0x40000000000) != 0)
  {
LABEL_157:
    self->_vocalsControlContinuous = *((_BYTE *)v4 + 493);
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
  }
LABEL_158:
  if (*((_QWORD *)v4 + 10))
  {
    -[_MRCommandOptionsProtobuf setAssociatedParticipantIdentifier:](self, "setAssociatedParticipantIdentifier:");
    v4 = v19;
  }
  v16 = *((_QWORD *)v4 + 62);
  if ((v16 & 0x40) != 0)
  {
    self->_sleepTimerTime = *((double *)v4 + 7);
    *(_QWORD *)&self->_has |= 0x40uLL;
    v16 = *((_QWORD *)v4 + 62);
  }
  if ((v16 & 0x200000) != 0)
  {
    self->_sleepTimerStopMode = *((_DWORD *)v4 + 105);
    *(_QWORD *)&self->_has |= 0x200000uLL;
  }
  dialogOptions = self->_dialogOptions;
  v18 = *((_QWORD *)v4 + 19);
  if (dialogOptions)
  {
    if (!v18)
      goto LABEL_175;
    -[_MRDictionaryProtobuf mergeFrom:](dialogOptions, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_175;
    -[_MRCommandOptionsProtobuf setDialogOptions:](self, "setDialogOptions:");
  }
  v4 = v19;
LABEL_175:
  if (*((_QWORD *)v4 + 11))
  {
    -[_MRCommandOptionsProtobuf setClientPreferredLanguages:](self, "setClientPreferredLanguages:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 496) & 0x20) != 0)
  {
    self->_referencePosition = *((double *)v4 + 6);
    *(_QWORD *)&self->_has |= 0x20uLL;
  }

}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceID, a3);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (BOOL)externalPlayerCommand
{
  return self->_externalPlayerCommand;
}

- (float)skipInterval
{
  return self->_skipInterval;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (float)rating
{
  return self->_rating;
}

- (BOOL)negative
{
  return self->_negative;
}

- (double)playbackPosition
{
  return self->_playbackPosition;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (int64_t)radioStationID
{
  return self->_radioStationID;
}

- (NSString)radioStationHash
{
  return self->_radioStationHash;
}

- (void)setRadioStationHash:(id)a3
{
  objc_storeStrong((id *)&self->_radioStationHash, a3);
}

- (NSData)systemAppPlaybackQueueData
{
  return self->_systemAppPlaybackQueueData;
}

- (void)setSystemAppPlaybackQueueData:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppPlaybackQueueData, a3);
}

- (NSString)destinationAppDisplayID
{
  return self->_destinationAppDisplayID;
}

- (void)setDestinationAppDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationAppDisplayID, a3);
}

- (BOOL)requestDefermentToPlaybackQueuePosition
{
  return self->_requestDefermentToPlaybackQueuePosition;
}

- (BOOL)shouldOverrideManuallyCuratedQueue
{
  return self->_shouldOverrideManuallyCuratedQueue;
}

- (NSString)stationURL
{
  return self->_stationURL;
}

- (void)setStationURL:(id)a3
{
  objc_storeStrong((id *)&self->_stationURL, a3);
}

- (BOOL)shouldBeginRadioPlayback
{
  return self->_shouldBeginRadioPlayback;
}

- (int)playbackQueueInsertionPosition
{
  return self->_playbackQueueInsertionPosition;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (void)setContentItemID:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemID, a3);
}

- (int)playbackQueueOffset
{
  return self->_playbackQueueOffset;
}

- (int)playbackQueueDestinationOffset
{
  return self->_playbackQueueDestinationOffset;
}

- (NSData)languageOption
{
  return self->_languageOption;
}

- (void)setLanguageOption:(id)a3
{
  objc_storeStrong((id *)&self->_languageOption, a3);
}

- (NSData)playbackQueueContext
{
  return self->_playbackQueueContext;
}

- (void)setPlaybackQueueContext:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueContext, a3);
}

- (NSString)insertAfterContentItemID
{
  return self->_insertAfterContentItemID;
}

- (void)setInsertAfterContentItemID:(id)a3
{
  objc_storeStrong((id *)&self->_insertAfterContentItemID, a3);
}

- (NSString)nowPlayingContentItemID
{
  return self->_nowPlayingContentItemID;
}

- (void)setNowPlayingContentItemID:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingContentItemID, a3);
}

- (NSString)commandID
{
  return self->_commandID;
}

- (void)setCommandID:(id)a3
{
  objc_storeStrong((id *)&self->_commandID, a3);
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
  objc_storeStrong((id *)&self->_senderID, a3);
}

- (NSString)remoteControlInterface
{
  return self->_remoteControlInterface;
}

- (void)setRemoteControlInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteControlInterface, a3);
}

- (BOOL)beginSeek
{
  return self->_beginSeek;
}

- (BOOL)endSeek
{
  return self->_endSeek;
}

- (NSData)playbackSession
{
  return self->_playbackSession;
}

- (void)setPlaybackSession:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSession, a3);
}

- (NSData)userIdentityData
{
  return self->_userIdentityData;
}

- (void)setUserIdentityData:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentityData, a3);
}

- (NSString)insertBeforeContentItemID
{
  return self->_insertBeforeContentItemID;
}

- (void)setInsertBeforeContentItemID:(id)a3
{
  objc_storeStrong((id *)&self->_insertBeforeContentItemID, a3);
}

- (BOOL)preservesRepeatMode
{
  return self->_preservesRepeatMode;
}

- (BOOL)preservesShuffleMode
{
  return self->_preservesShuffleMode;
}

- (BOOL)preservesQueueEndAction
{
  return self->_preservesQueueEndAction;
}

- (NSString)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, a3);
}

- (BOOL)verifySupportedCommands
{
  return self->_verifySupportedCommands;
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (void)setPlaybackSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, a3);
}

- (NSString)playbackSessionFilePath
{
  return self->_playbackSessionFilePath;
}

- (void)setPlaybackSessionFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionFilePath, a3);
}

- (NSString)playbackSessionRevision
{
  return self->_playbackSessionRevision;
}

- (void)setPlaybackSessionRevision:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionRevision, a3);
}

- (NSData)playbackSessionMetadata
{
  return self->_playbackSessionMetadata;
}

- (void)setPlaybackSessionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionMetadata, a3);
}

- (NSString)playbackSessionType
{
  return self->_playbackSessionType;
}

- (void)setPlaybackSessionType:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionType, a3);
}

- (BOOL)trueCompletion
{
  return self->_trueCompletion;
}

- (NSString)playbackAuthorizationToken
{
  return self->_playbackAuthorizationToken;
}

- (void)setPlaybackAuthorizationToken:(id)a3
{
  objc_storeStrong((id *)&self->_playbackAuthorizationToken, a3);
}

- (NSString)eventNoticeType
{
  return self->_eventNoticeType;
}

- (void)setEventNoticeType:(id)a3
{
  objc_storeStrong((id *)&self->_eventNoticeType, a3);
}

- (NSString)eventNoticeIdentifier
{
  return self->_eventNoticeIdentifier;
}

- (void)setEventNoticeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventNoticeIdentifier, a3);
}

- (NSString)sharedPlaybackSessionIdentifier
{
  return self->_sharedPlaybackSessionIdentifier;
}

- (void)setSharedPlaybackSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharedPlaybackSessionIdentifier, a3);
}

- (double)commandTimeout
{
  return self->_commandTimeout;
}

- (double)assistantTTSEndTimestamp
{
  return self->_assistantTTSEndTimestamp;
}

- (double)assistantCommandSendTimestamp
{
  return self->_assistantCommandSendTimestamp;
}

- (NSString)originatingDeviceUID
{
  return self->_originatingDeviceUID;
}

- (void)setOriginatingDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_originatingDeviceUID, a3);
}

- (NSData)destinationDeviceUIDs
{
  return self->_destinationDeviceUIDs;
}

- (void)setDestinationDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDeviceUIDs, a3);
}

- (NSString)desiredSessionID
{
  return self->_desiredSessionID;
}

- (void)setDesiredSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_desiredSessionID, a3);
}

- (BOOL)alwaysIgnoreDuringCall
{
  return self->_alwaysIgnoreDuringCall;
}

- (BOOL)alwaysIgnoreDuringSharePlay
{
  return self->_alwaysIgnoreDuringSharePlay;
}

- (NSString)commandSequenceUUID
{
  return self->_commandSequenceUUID;
}

- (void)setCommandSequenceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_commandSequenceUUID, a3);
}

- (BOOL)originatedFromRemoteDevice
{
  return self->_originatedFromRemoteDevice;
}

- (NSString)siriTurnIdentifier
{
  return self->_siriTurnIdentifier;
}

- (void)setSiriTurnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_siriTurnIdentifier, a3);
}

- (NSString)siriSearchDataSetIdentifier
{
  return self->_siriSearchDataSetIdentifier;
}

- (void)setSiriSearchDataSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_siriSearchDataSetIdentifier, a3);
}

- (BOOL)prepareForSetQueueIsProactive
{
  return self->_prepareForSetQueueIsProactive;
}

- (NSString)prepareForSetQueueProactiveReason
{
  return self->_prepareForSetQueueProactiveReason;
}

- (void)setPrepareForSetQueueProactiveReason:(id)a3
{
  objc_storeStrong((id *)&self->_prepareForSetQueueProactiveReason, a3);
}

- (NSData)applicationUserIdentity
{
  return self->_applicationUserIdentity;
}

- (void)setApplicationUserIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_applicationUserIdentity, a3);
}

- (_MRSystemPlaybackQueueProtobuf)systemAppPlaybackQueue
{
  return self->_systemAppPlaybackQueue;
}

- (void)setSystemAppPlaybackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppPlaybackQueue, a3);
}

- (BOOL)vocalsControlActive
{
  return self->_vocalsControlActive;
}

- (float)vocalsControlLevel
{
  return self->_vocalsControlLevel;
}

- (float)vocalsControlMinLevel
{
  return self->_vocalsControlMinLevel;
}

- (float)vocalsControlMaxLevel
{
  return self->_vocalsControlMaxLevel;
}

- (BOOL)vocalsControlContinuous
{
  return self->_vocalsControlContinuous;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, a3);
}

- (double)sleepTimerTime
{
  return self->_sleepTimerTime;
}

- (_MRDictionaryProtobuf)dialogOptions
{
  return self->_dialogOptions;
}

- (void)setDialogOptions:(id)a3
{
  objc_storeStrong((id *)&self->_dialogOptions, a3);
}

- (NSString)clientPreferredLanguages
{
  return self->_clientPreferredLanguages;
}

- (void)setClientPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_clientPreferredLanguages, a3);
}

- (double)referencePosition
{
  return self->_referencePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityData, 0);
  objc_storeStrong((id *)&self->_systemAppPlaybackQueueData, 0);
  objc_storeStrong((id *)&self->_systemAppPlaybackQueue, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_siriTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_siriSearchDataSetIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedPlaybackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_remoteControlInterface, 0);
  objc_storeStrong((id *)&self->_radioStationHash, 0);
  objc_storeStrong((id *)&self->_prepareForSetQueueProactiveReason, 0);
  objc_storeStrong((id *)&self->_playbackSessionType, 0);
  objc_storeStrong((id *)&self->_playbackSessionRevision, 0);
  objc_storeStrong((id *)&self->_playbackSessionMetadata, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackSessionFilePath, 0);
  objc_storeStrong((id *)&self->_playbackSession, 0);
  objc_storeStrong((id *)&self->_playbackQueueContext, 0);
  objc_storeStrong((id *)&self->_playbackAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_originatingDeviceUID, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentItemID, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_languageOption, 0);
  objc_storeStrong((id *)&self->_insertBeforeContentItemID, 0);
  objc_storeStrong((id *)&self->_insertAfterContentItemID, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_eventNoticeType, 0);
  objc_storeStrong((id *)&self->_eventNoticeIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogOptions, 0);
  objc_storeStrong((id *)&self->_destinationDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_destinationAppDisplayID, 0);
  objc_storeStrong((id *)&self->_desiredSessionID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_commandSequenceUUID, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_clientPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationUserIdentity, 0);
}

@end
