@implementation _MRSendCommandMessageProtobuf

- (int)command
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_command;
  else
    return 0;
}

- (void)setCommand:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommand
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRSendCommandMessageProtobuf;
  -[_MRSendCommandMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("playerPath"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_options)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_command;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_options)
  {
    objc_msgSend(v4, "setOptions:");
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
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_command;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[_MRCommandOptionsProtobuf copyWithZone:](self->_options, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRCommandOptionsProtobuf *options;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_command != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  options = self->_options;
  if ((unint64_t)options | *((_QWORD *)v4 + 2) && !-[_MRCommandOptionsProtobuf isEqual:](options, "isEqual:"))
    goto LABEL_11;
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((_QWORD *)v4 + 3))
    v7 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_command;
  else
    v3 = 0;
  v4 = -[_MRCommandOptionsProtobuf hash](self->_options, "hash") ^ v3;
  return v4 ^ -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  _MRCommandOptionsProtobuf *options;
  uint64_t v7;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_command = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  options = self->_options;
  v7 = v5[2];
  v10 = v5;
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
    -[_MRSendCommandMessageProtobuf setOptions:](self, "setOptions:");
  }
  v5 = v10;
LABEL_9:
  playerPath = self->_playerPath;
  v9 = v5[3];
  if (playerPath)
  {
    if (v9)
    {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
LABEL_14:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[_MRSendCommandMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
    goto LABEL_14;
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
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
