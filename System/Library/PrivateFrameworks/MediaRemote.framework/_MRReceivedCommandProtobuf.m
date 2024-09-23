@implementation _MRReceivedCommandProtobuf

- (int)command
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_command;
  else
    return 0;
}

- (void)setCommand:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommand
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)commandAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("Unknown");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("Play");
      return v3;
    case 2:
      return CFSTR("Pause");
    case 3:
      return CFSTR("TogglePlayPause");
    case 4:
      return CFSTR("Stop");
    case 5:
      return CFSTR("NextTrack");
    case 6:
      return CFSTR("PreviousTrack");
    case 7:
      return CFSTR("AdvanceShuffleMode");
    case 8:
      return CFSTR("AdvanceRepeatMode");
    case 9:
      return CFSTR("BeginFastForward");
    case 10:
      return CFSTR("EndFastForward");
    case 11:
      return CFSTR("BeginRewind");
    case 12:
      return CFSTR("EndRewind");
    case 13:
      return CFSTR("Rewind15Seconds");
    case 14:
      return CFSTR("FastForward15Seconds");
    case 15:
      return CFSTR("Rewind30Seconds");
    case 16:
      return CFSTR("FastForward30Seconds");
    case 18:
      return CFSTR("SkipForward");
    case 19:
      return CFSTR("SkipBackward");
    case 20:
      return CFSTR("ChangePlaybackRate");
    case 21:
      return CFSTR("RateTrack");
    case 22:
      return CFSTR("LikeTrack");
    case 23:
      return CFSTR("DislikeTrack");
    case 24:
      return CFSTR("BookmarkTrack");
    case 25:
      return CFSTR("NextChapter");
    case 26:
      return CFSTR("PreviousChapter");
    case 27:
      return CFSTR("NextAlbum");
    case 28:
      return CFSTR("PreviousAlbum");
    case 29:
      return CFSTR("NextPlaylist");
    case 30:
      return CFSTR("PreviousPlaylist");
    case 31:
      return CFSTR("BanTrack");
    case 32:
      return CFSTR("AddTrackToWishList");
    case 33:
      return CFSTR("RemoveTrackFromWishList");
    case 34:
      return CFSTR("NextInContext");
    case 35:
      return CFSTR("PreviousInContext");
    case 41:
      return CFSTR("ResetPlaybackTimeout");
    case 45:
      return CFSTR("SeekToPlaybackPosition");
    case 46:
      return CFSTR("ChangeRepeatMode");
    case 47:
      return CFSTR("ChangeShuffleMode");
    case 48:
      return CFSTR("SetPlaybackQueue");
    case 49:
      return CFSTR("AddNowPlayingItemToLibrary");
    case 50:
      return CFSTR("CreateRadioStation");
    case 51:
      return CFSTR("AddItemToLibrary");
    case 52:
      return CFSTR("InsertIntoPlaybackQueue");
    case 53:
      return CFSTR("EnableLanguageOption");
    case 54:
      return CFSTR("DisableLanguageOption");
    case 55:
      return CFSTR("ReorderPlaybackQueue");
    case 56:
      return CFSTR("RemoveFromPlaybackQueue");
    case 57:
      return CFSTR("PlayItemInPlaybackQueue");
    case 58:
      return CFSTR("PrepareForSetQueue");
    case 59:
      return CFSTR("SetPlaybackSession");
    case 60:
      return CFSTR("PreloadPlaybackSession");
    case 61:
      return CFSTR("SetPriorityForPlaybackSession");
    case 62:
      return CFSTR("DiscardPlaybackSession");
    case 63:
      return CFSTR("Reshuffle");
    case 64:
      return CFSTR("LeaveSharedPlaybackSession");
    case 65:
      return CFSTR("PostEventNotice");
    case 124:
      return CFSTR("SetSleepTimer");
    case 135:
      return CFSTR("ChangeQueueEndAction");
    case 142:
      return CFSTR("VocalsControl");
    case 143:
      return CFSTR("PrepareVocalsControl");
    case 144:
      return CFSTR("ClearUpNextQueue");
    case 145:
      return CFSTR("PerformDialogAction");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsCommand:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Play")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pause")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TogglePlayPause")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stop")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NextTrack")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreviousTrack")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdvanceShuffleMode")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdvanceRepeatMode")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BeginFastForward")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EndFastForward")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BeginRewind")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EndRewind")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rewind15Seconds")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastForward15Seconds")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rewind30Seconds")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastForward30Seconds")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipForward")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipBackward")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChangePlaybackRate")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RateTrack")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LikeTrack")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DislikeTrack")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BookmarkTrack")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SeekToPlaybackPosition")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChangeRepeatMode")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChangeShuffleMode")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EnableLanguageOption")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DisableLanguageOption")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NextChapter")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreviousChapter")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NextAlbum")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreviousAlbum")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NextPlaylist")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreviousPlaylist")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BanTrack")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AddTrackToWishList")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveTrackFromWishList")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NextInContext")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreviousInContext")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResetPlaybackTimeout")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetPlaybackQueue")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AddNowPlayingItemToLibrary")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreateRadioStation")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AddItemToLibrary")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InsertIntoPlaybackQueue")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReorderPlaybackQueue")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveFromPlaybackQueue")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayItemInPlaybackQueue")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrepareForSetQueue")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetPlaybackSession")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreloadPlaybackSession")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetPriorityForPlaybackSession")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiscardPlaybackSession")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reshuffle")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LeaveSharedPlaybackSession")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PostEventNotice")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetSleepTimer")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChangeQueueEndAction")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VocalsControl")) & 1) != 0)
  {
    v4 = 142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrepareVocalsControl")) & 1) != 0)
  {
    v4 = 143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClearUpNextQueue")) & 1) != 0)
  {
    v4 = 144;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PerformDialogAction")))
  {
    v4 = 145;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasOptions
{
  return self->_options != 0;
}

- (void)setOriginUID:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_originUID = a3;
}

- (void)setHasOriginUID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginUID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSenderAppDisplayID
{
  return self->_senderAppDisplayID != 0;
}

- (BOOL)hasDestinationAppDisplayID
{
  return self->_destinationAppDisplayID != 0;
}

- (void)setDestinationAppProcessID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_destinationAppProcessID = a3;
}

- (void)setHasDestinationAppProcessID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestinationAppProcessID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRemoteControlInterfaceID
{
  return self->_remoteControlInterfaceID != 0;
}

- (BOOL)hasAppOptions
{
  return self->_appOptions != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
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
  v8.super_class = (Class)_MRReceivedCommandProtobuf;
  -[_MRReceivedCommandProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRReceivedCommandProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __CFString *v4;
  _MRCommandOptionsProtobuf *options;
  void *v6;
  void *v7;
  NSString *senderAppDisplayID;
  NSString *destinationAppDisplayID;
  void *v10;
  NSString *remoteControlInterfaceID;
  _MRReceivedCommandAppOptionsProtobuf *appOptions;
  void *v13;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = CFSTR("Unknown");
    switch(self->_command)
    {
      case 0:
        break;
      case 1:
        v4 = CFSTR("Play");
        break;
      case 2:
        v4 = CFSTR("Pause");
        break;
      case 3:
        v4 = CFSTR("TogglePlayPause");
        break;
      case 4:
        v4 = CFSTR("Stop");
        break;
      case 5:
        v4 = CFSTR("NextTrack");
        break;
      case 6:
        v4 = CFSTR("PreviousTrack");
        break;
      case 7:
        v4 = CFSTR("AdvanceShuffleMode");
        break;
      case 8:
        v4 = CFSTR("AdvanceRepeatMode");
        break;
      case 9:
        v4 = CFSTR("BeginFastForward");
        break;
      case 0xA:
        v4 = CFSTR("EndFastForward");
        break;
      case 0xB:
        v4 = CFSTR("BeginRewind");
        break;
      case 0xC:
        v4 = CFSTR("EndRewind");
        break;
      case 0xD:
        v4 = CFSTR("Rewind15Seconds");
        break;
      case 0xE:
        v4 = CFSTR("FastForward15Seconds");
        break;
      case 0xF:
        v4 = CFSTR("Rewind30Seconds");
        break;
      case 0x10:
        v4 = CFSTR("FastForward30Seconds");
        break;
      case 0x12:
        v4 = CFSTR("SkipForward");
        break;
      case 0x13:
        v4 = CFSTR("SkipBackward");
        break;
      case 0x14:
        v4 = CFSTR("ChangePlaybackRate");
        break;
      case 0x15:
        v4 = CFSTR("RateTrack");
        break;
      case 0x16:
        v4 = CFSTR("LikeTrack");
        break;
      case 0x17:
        v4 = CFSTR("DislikeTrack");
        break;
      case 0x18:
        v4 = CFSTR("BookmarkTrack");
        break;
      case 0x19:
        v4 = CFSTR("NextChapter");
        break;
      case 0x1A:
        v4 = CFSTR("PreviousChapter");
        break;
      case 0x1B:
        v4 = CFSTR("NextAlbum");
        break;
      case 0x1C:
        v4 = CFSTR("PreviousAlbum");
        break;
      case 0x1D:
        v4 = CFSTR("NextPlaylist");
        break;
      case 0x1E:
        v4 = CFSTR("PreviousPlaylist");
        break;
      case 0x1F:
        v4 = CFSTR("BanTrack");
        break;
      case 0x20:
        v4 = CFSTR("AddTrackToWishList");
        break;
      case 0x21:
        v4 = CFSTR("RemoveTrackFromWishList");
        break;
      case 0x22:
        v4 = CFSTR("NextInContext");
        break;
      case 0x23:
        v4 = CFSTR("PreviousInContext");
        break;
      case 0x29:
        v4 = CFSTR("ResetPlaybackTimeout");
        break;
      case 0x2D:
        v4 = CFSTR("SeekToPlaybackPosition");
        break;
      case 0x2E:
        v4 = CFSTR("ChangeRepeatMode");
        break;
      case 0x2F:
        v4 = CFSTR("ChangeShuffleMode");
        break;
      case 0x30:
        v4 = CFSTR("SetPlaybackQueue");
        break;
      case 0x31:
        v4 = CFSTR("AddNowPlayingItemToLibrary");
        break;
      case 0x32:
        v4 = CFSTR("CreateRadioStation");
        break;
      case 0x33:
        v4 = CFSTR("AddItemToLibrary");
        break;
      case 0x34:
        v4 = CFSTR("InsertIntoPlaybackQueue");
        break;
      case 0x35:
        v4 = CFSTR("EnableLanguageOption");
        break;
      case 0x36:
        v4 = CFSTR("DisableLanguageOption");
        break;
      case 0x37:
        v4 = CFSTR("ReorderPlaybackQueue");
        break;
      case 0x38:
        v4 = CFSTR("RemoveFromPlaybackQueue");
        break;
      case 0x39:
        v4 = CFSTR("PlayItemInPlaybackQueue");
        break;
      case 0x3A:
        v4 = CFSTR("PrepareForSetQueue");
        break;
      case 0x3B:
        v4 = CFSTR("SetPlaybackSession");
        break;
      case 0x3C:
        v4 = CFSTR("PreloadPlaybackSession");
        break;
      case 0x3D:
        v4 = CFSTR("SetPriorityForPlaybackSession");
        break;
      case 0x3E:
        v4 = CFSTR("DiscardPlaybackSession");
        break;
      case 0x3F:
        v4 = CFSTR("Reshuffle");
        break;
      case 0x40:
        v4 = CFSTR("LeaveSharedPlaybackSession");
        break;
      case 0x41:
        v4 = CFSTR("PostEventNotice");
        break;
      case 0x7C:
        v4 = CFSTR("SetSleepTimer");
        break;
      case 0x87:
        v4 = CFSTR("ChangeQueueEndAction");
        break;
      case 0x8E:
        v4 = CFSTR("VocalsControl");
        break;
      case 0x8F:
        v4 = CFSTR("PrepareVocalsControl");
        break;
      case 0x90:
        v4 = CFSTR("ClearUpNextQueue");
        break;
      case 0x91:
        v4 = CFSTR("PerformDialogAction");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_command);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("command"));

  }
  options = self->_options;
  if (options)
  {
    -[_MRCommandOptionsProtobuf dictionaryRepresentation](options, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("options"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_originUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("originUID"));

  }
  senderAppDisplayID = self->_senderAppDisplayID;
  if (senderAppDisplayID)
    objc_msgSend(v3, "setObject:forKey:", senderAppDisplayID, CFSTR("senderAppDisplayID"));
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if (destinationAppDisplayID)
    objc_msgSend(v3, "setObject:forKey:", destinationAppDisplayID, CFSTR("destinationAppDisplayID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_destinationAppProcessID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("destinationAppProcessID"));

  }
  remoteControlInterfaceID = self->_remoteControlInterfaceID;
  if (remoteControlInterfaceID)
    objc_msgSend(v3, "setObject:forKey:", remoteControlInterfaceID, CFSTR("remoteControlInterfaceID"));
  appOptions = self->_appOptions;
  if (appOptions)
  {
    -[_MRReceivedCommandAppOptionsProtobuf dictionaryRepresentation](appOptions, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("appOptions"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("playerPath"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRReceivedCommandProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_options)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_senderAppDisplayID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_destinationAppDisplayID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_remoteControlInterfaceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_appOptions)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[6] = self->_command;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  v5 = v4;
  if (self->_options)
  {
    objc_msgSend(v4, "setOptions:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[12] = self->_originUID;
    *((_BYTE *)v4 + 80) |= 4u;
  }
  if (self->_senderAppDisplayID)
  {
    objc_msgSend(v5, "setSenderAppDisplayID:");
    v4 = v5;
  }
  if (self->_destinationAppDisplayID)
  {
    objc_msgSend(v5, "setDestinationAppDisplayID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_destinationAppProcessID;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (self->_remoteControlInterfaceID)
  {
    objc_msgSend(v5, "setRemoteControlInterfaceID:");
    v4 = v5;
  }
  if (self->_appOptions)
  {
    objc_msgSend(v5, "setAppOptions:");
    v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_command;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v7 = -[_MRCommandOptionsProtobuf copyWithZone:](self->_options, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_originUID;
    *(_BYTE *)(v6 + 80) |= 4u;
  }
  v9 = -[NSString copyWithZone:](self->_senderAppDisplayID, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v9;

  v11 = -[NSString copyWithZone:](self->_destinationAppDisplayID, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_destinationAppProcessID;
    *(_BYTE *)(v6 + 80) |= 1u;
  }
  v13 = -[NSString copyWithZone:](self->_remoteControlInterfaceID, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = -[_MRReceivedCommandAppOptionsProtobuf copyWithZone:](self->_appOptions, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v15;

  v17 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  _MRCommandOptionsProtobuf *options;
  NSString *senderAppDisplayID;
  NSString *destinationAppDisplayID;
  NSString *remoteControlInterfaceID;
  _MRReceivedCommandAppOptionsProtobuf *appOptions;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_command != *((_DWORD *)v4 + 6))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_30;
  }
  options = self->_options;
  if ((unint64_t)options | *((_QWORD *)v4 + 5))
  {
    if (!-[_MRCommandOptionsProtobuf isEqual:](options, "isEqual:"))
    {
LABEL_30:
      v12 = 0;
      goto LABEL_31;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_originUID != *((_DWORD *)v4 + 12))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_30;
  }
  senderAppDisplayID = self->_senderAppDisplayID;
  if ((unint64_t)senderAppDisplayID | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](senderAppDisplayID, "isEqual:"))
  {
    goto LABEL_30;
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if ((unint64_t)destinationAppDisplayID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](destinationAppDisplayID, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_destinationAppProcessID != *((_QWORD *)v4 + 1))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_30;
  }
  remoteControlInterfaceID = self->_remoteControlInterfaceID;
  if ((unint64_t)remoteControlInterfaceID | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](remoteControlInterfaceID, "isEqual:"))
  {
    goto LABEL_30;
  }
  appOptions = self->_appOptions;
  if ((unint64_t)appOptions | *((_QWORD *)v4 + 2))
  {
    if (!-[_MRReceivedCommandAppOptionsProtobuf isEqual:](appOptions, "isEqual:"))
      goto LABEL_30;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 7))
    v12 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
  else
    v12 = 1;
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_command;
  else
    v3 = 0;
  v4 = -[_MRCommandOptionsProtobuf hash](self->_options, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v5 = 2654435761 * self->_originUID;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_senderAppDisplayID, "hash");
  v7 = -[NSString hash](self->_destinationAppDisplayID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_destinationAppProcessID;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_remoteControlInterfaceID, "hash");
  v10 = -[_MRReceivedCommandAppOptionsProtobuf hash](self->_appOptions, "hash");
  return v9 ^ v10 ^ -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  _MRCommandOptionsProtobuf *options;
  uint64_t v7;
  _MRReceivedCommandAppOptionsProtobuf *appOptions;
  uint64_t v9;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if ((v4[20] & 2) != 0)
  {
    self->_command = v4[6];
    *(_BYTE *)&self->_has |= 2u;
  }
  options = self->_options;
  v7 = *((_QWORD *)v5 + 5);
  v12 = v5;
  if (options)
  {
    if (!v7)
      goto LABEL_9;
    -[_MRCommandOptionsProtobuf mergeFrom:](options, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[_MRReceivedCommandProtobuf setOptions:](self, "setOptions:");
  }
  v5 = v12;
LABEL_9:
  if ((*((_BYTE *)v5 + 80) & 4) != 0)
  {
    self->_originUID = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 9))
  {
    -[_MRReceivedCommandProtobuf setSenderAppDisplayID:](self, "setSenderAppDisplayID:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[_MRReceivedCommandProtobuf setDestinationAppDisplayID:](self, "setDestinationAppDisplayID:");
    v5 = v12;
  }
  if ((*((_BYTE *)v5 + 80) & 1) != 0)
  {
    self->_destinationAppProcessID = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 8))
  {
    -[_MRReceivedCommandProtobuf setRemoteControlInterfaceID:](self, "setRemoteControlInterfaceID:");
    v5 = v12;
  }
  appOptions = self->_appOptions;
  v9 = *((_QWORD *)v5 + 2);
  if (appOptions)
  {
    if (!v9)
      goto LABEL_25;
    -[_MRReceivedCommandAppOptionsProtobuf mergeFrom:](appOptions, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_25;
    -[_MRReceivedCommandProtobuf setAppOptions:](self, "setAppOptions:");
  }
  v5 = v12;
LABEL_25:
  playerPath = self->_playerPath;
  v11 = *((_QWORD *)v5 + 7);
  if (playerPath)
  {
    if (v11)
    {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
LABEL_30:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[_MRReceivedCommandProtobuf setPlayerPath:](self, "setPlayerPath:");
    goto LABEL_30;
  }

}

- (_MRCommandOptionsProtobuf)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (int)originUID
{
  return self->_originUID;
}

- (NSString)senderAppDisplayID
{
  return self->_senderAppDisplayID;
}

- (void)setSenderAppDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_senderAppDisplayID, a3);
}

- (NSString)destinationAppDisplayID
{
  return self->_destinationAppDisplayID;
}

- (void)setDestinationAppDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationAppDisplayID, a3);
}

- (int64_t)destinationAppProcessID
{
  return self->_destinationAppProcessID;
}

- (NSString)remoteControlInterfaceID
{
  return self->_remoteControlInterfaceID;
}

- (void)setRemoteControlInterfaceID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteControlInterfaceID, a3);
}

- (_MRReceivedCommandAppOptionsProtobuf)appOptions
{
  return self->_appOptions;
}

- (void)setAppOptions:(id)a3
{
  objc_storeStrong((id *)&self->_appOptions, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAppDisplayID, 0);
  objc_storeStrong((id *)&self->_remoteControlInterfaceID, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationAppDisplayID, 0);
  objc_storeStrong((id *)&self->_appOptions, 0);
}

@end
