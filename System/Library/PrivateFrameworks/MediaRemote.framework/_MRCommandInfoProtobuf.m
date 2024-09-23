@implementation _MRCommandInfoProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRCommandInfoProtobuf;
  -[_MRCommandInfoProtobuf dealloc](&v3, sel_dealloc);
}

- (int)command
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_command;
  else
    return 0;
}

- (void)setCommand:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCommand
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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

- (void)setEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_active = a3;
}

- (void)setHasActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasActive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (unint64_t)preferredIntervalsCount
{
  return self->_preferredIntervals.count;
}

- (double)preferredIntervals
{
  return self->_preferredIntervals.list;
}

- (void)clearPreferredIntervals
{
  PBRepeatedDoubleClear();
}

- (void)addPreferredInterval:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)preferredIntervalAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_preferredIntervals;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_preferredIntervals = &self->_preferredIntervals;
  count = self->_preferredIntervals.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_preferredIntervals->list[a3];
}

- (void)setPreferredIntervals:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (BOOL)hasLocalizedTitle
{
  return self->_localizedTitle != 0;
}

- (BOOL)hasLocalizedShortTitle
{
  return self->_localizedShortTitle != 0;
}

- (void)setMinimumRating:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_minimumRating = a3;
}

- (void)setHasMinimumRating:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMinimumRating
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMaximumRating:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_maximumRating = a3;
}

- (void)setHasMaximumRating:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMaximumRating
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (unint64_t)supportedRatesCount
{
  return self->_supportedRates.count;
}

- (float)supportedRates
{
  return self->_supportedRates.list;
}

- (void)clearSupportedRates
{
  PBRepeatedFloatClear();
}

- (void)addSupportedRate:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)supportedRateAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_supportedRates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedRates = &self->_supportedRates;
  count = self->_supportedRates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedRates->list[a3];
}

- (void)setSupportedRates:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (int)repeatMode
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_repeatMode;
  else
    return 0;
}

- (void)setRepeatMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRepeatMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CC230[a3];
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
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_shuffleMode;
  else
    return 0;
}

- (void)setShuffleMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasShuffleMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CC250[a3];
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

- (void)setPresentationStyle:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_presentationStyle = a3;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPresentationStyle
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSkipInterval:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_skipInterval = a3;
}

- (void)setHasSkipInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSkipInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNumAvailableSkips:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numAvailableSkips = a3;
}

- (void)setHasNumAvailableSkips:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumAvailableSkips
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setSkipFrequency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_skipFrequency = a3;
}

- (void)setHasSkipFrequency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSkipFrequency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCanScrub:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_canScrub = a3;
}

- (void)setHasCanScrub:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCanScrub
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)supportedPlaybackQueueTypesCount
{
  return self->_supportedPlaybackQueueTypes.count;
}

- (int)supportedPlaybackQueueTypes
{
  return self->_supportedPlaybackQueueTypes.list;
}

- (void)clearSupportedPlaybackQueueTypes
{
  PBRepeatedInt32Clear();
}

- (void)addSupportedPlaybackQueueTypes:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)supportedPlaybackQueueTypesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedPlaybackQueueTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedPlaybackQueueTypes = &self->_supportedPlaybackQueueTypes;
  count = self->_supportedPlaybackQueueTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedPlaybackQueueTypes->list[a3];
}

- (void)setSupportedPlaybackQueueTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)clearSupportedCustomQueueIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_supportedCustomQueueIdentifiers, "removeAllObjects");
}

- (void)addSupportedCustomQueueIdentifier:(id)a3
{
  id v4;
  NSMutableArray *supportedCustomQueueIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  v8 = v4;
  if (!supportedCustomQueueIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supportedCustomQueueIdentifiers;
    self->_supportedCustomQueueIdentifiers = v6;

    v4 = v8;
    supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  }
  -[NSMutableArray addObject:](supportedCustomQueueIdentifiers, "addObject:", v4);

}

- (unint64_t)supportedCustomQueueIdentifiersCount
{
  return -[NSMutableArray count](self->_supportedCustomQueueIdentifiers, "count");
}

- (id)supportedCustomQueueIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedCustomQueueIdentifiers, "objectAtIndex:", a3);
}

+ (Class)supportedCustomQueueIdentifierType
{
  return (Class)objc_opt_class();
}

- (unint64_t)supportedInsertionPositionsCount
{
  return self->_supportedInsertionPositions.count;
}

- (int)supportedInsertionPositions
{
  return self->_supportedInsertionPositions.list;
}

- (void)clearSupportedInsertionPositions
{
  PBRepeatedInt32Clear();
}

- (void)addSupportedInsertionPositions:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)supportedInsertionPositionsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedInsertionPositions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedInsertionPositions = &self->_supportedInsertionPositions;
  count = self->_supportedInsertionPositions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedInsertionPositions->list[a3];
}

- (void)setSupportedInsertionPositions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setUpNextItemCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_upNextItemCount = a3;
}

- (void)setHasUpNextItemCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUpNextItemCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_preferredPlaybackRate = a3;
}

- (void)setHasPreferredPlaybackRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPreferredPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)clearSupportedPlaybackSessionTypes
{
  -[NSMutableArray removeAllObjects](self->_supportedPlaybackSessionTypes, "removeAllObjects");
}

- (void)addSupportedPlaybackSessionTypes:(id)a3
{
  id v4;
  NSMutableArray *supportedPlaybackSessionTypes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  v8 = v4;
  if (!supportedPlaybackSessionTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supportedPlaybackSessionTypes;
    self->_supportedPlaybackSessionTypes = v6;

    v4 = v8;
    supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  }
  -[NSMutableArray addObject:](supportedPlaybackSessionTypes, "addObject:", v4);

}

- (unint64_t)supportedPlaybackSessionTypesCount
{
  return -[NSMutableArray count](self->_supportedPlaybackSessionTypes, "count");
}

- (id)supportedPlaybackSessionTypesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedPlaybackSessionTypes, "objectAtIndex:", a3);
}

+ (Class)supportedPlaybackSessionTypesType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentPlaybackSessionTypes
{
  -[NSMutableArray removeAllObjects](self->_currentPlaybackSessionTypes, "removeAllObjects");
}

- (void)addCurrentPlaybackSessionTypes:(id)a3
{
  id v4;
  NSMutableArray *currentPlaybackSessionTypes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  v8 = v4;
  if (!currentPlaybackSessionTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_currentPlaybackSessionTypes;
    self->_currentPlaybackSessionTypes = v6;

    v4 = v8;
    currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  }
  -[NSMutableArray addObject:](currentPlaybackSessionTypes, "addObject:", v4);

}

- (unint64_t)currentPlaybackSessionTypesCount
{
  return -[NSMutableArray count](self->_currentPlaybackSessionTypes, "count");
}

- (id)currentPlaybackSessionTypesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentPlaybackSessionTypes, "objectAtIndex:", a3);
}

+ (Class)currentPlaybackSessionTypesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPlaybackSessionIdentifier
{
  return self->_playbackSessionIdentifier != 0;
}

- (int)currentQueueEndAction
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_currentQueueEndAction;
  else
    return 0;
}

- (void)setCurrentQueueEndAction:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_currentQueueEndAction = a3;
}

- (void)setHasCurrentQueueEndAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCurrentQueueEndAction
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)currentQueueEndActionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CC270[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrentQueueEndAction:(id)a3
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

- (unint64_t)supportedQueueEndActionsCount
{
  return self->_supportedQueueEndActions.count;
}

- (int)supportedQueueEndActions
{
  return self->_supportedQueueEndActions.list;
}

- (void)clearSupportedQueueEndActions
{
  PBRepeatedInt32Clear();
}

- (void)addSupportedQueueEndActions:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)supportedQueueEndActionsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedQueueEndActions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  count = self->_supportedQueueEndActions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedQueueEndActions->list[a3];
}

- (void)setSupportedQueueEndActions:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)supportedQueueEndActionsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CC270[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedQueueEndActions:(id)a3
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

- (int)disabledReason
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_disabledReason;
  else
    return 0;
}

- (void)setDisabledReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_disabledReason = a3;
}

- (void)setHasDisabledReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDisabledReason
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)disabledReasonAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CC290[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisabledReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdPlayback")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipLimitReached")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("InvalidAdRanges")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearSupportedPlaybackSessionIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_supportedPlaybackSessionIdentifiers, "removeAllObjects");
}

- (void)addSupportedPlaybackSessionIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *supportedPlaybackSessionIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedPlaybackSessionIdentifiers = self->_supportedPlaybackSessionIdentifiers;
  v8 = v4;
  if (!supportedPlaybackSessionIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supportedPlaybackSessionIdentifiers;
    self->_supportedPlaybackSessionIdentifiers = v6;

    v4 = v8;
    supportedPlaybackSessionIdentifiers = self->_supportedPlaybackSessionIdentifiers;
  }
  -[NSMutableArray addObject:](supportedPlaybackSessionIdentifiers, "addObject:", v4);

}

- (unint64_t)supportedPlaybackSessionIdentifiersCount
{
  return -[NSMutableArray count](self->_supportedPlaybackSessionIdentifiers, "count");
}

- (id)supportedPlaybackSessionIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedPlaybackSessionIdentifiers, "objectAtIndex:", a3);
}

+ (Class)supportedPlaybackSessionIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProactiveCommandOptions
{
  return self->_proactiveCommandOptions != 0;
}

- (void)setVocalsControlActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_vocalsControlActive = a3;
}

- (void)setHasVocalsControlActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVocalsControlActive
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setVocalsControlLevel:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_vocalsControlLevel = a3;
}

- (void)setHasVocalsControlLevel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVocalsControlLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setVocalsControlMaxLevel:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_vocalsControlMaxLevel = a3;
}

- (void)setHasVocalsControlMaxLevel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVocalsControlMaxLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setVocalsControlMinLevel:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_vocalsControlMinLevel = a3;
}

- (void)setHasVocalsControlMinLevel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVocalsControlMinLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setVocalsControlContinuous:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_vocalsControlContinuous = a3;
}

- (void)setHasVocalsControlContinuous:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasVocalsControlContinuous
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSleepTimerTime:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_sleepTimerTime = a3;
}

- (void)setHasSleepTimerTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasSleepTimerTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)sleepTimerStopMode
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_sleepTimerStopMode;
  else
    return 0;
}

- (void)setSleepTimerStopMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_sleepTimerStopMode = a3;
}

- (void)setHasSleepTimerStopMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSleepTimerStopMode
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)sleepTimerStopModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CC2B0[a3];
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

- (void)setSleepTimerFireDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_sleepTimerFireDate = a3;
}

- (void)setHasSleepTimerFireDate:(BOOL)a3
{
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasSleepTimerFireDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDialogOptions
{
  return self->_dialogOptions != 0;
}

- (BOOL)hasLastSectionContentItemID
{
  return self->_lastSectionContentItemID != 0;
}

- (void)setSupportsReferencePosition:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_supportsReferencePosition = a3;
}

- (void)setHasSupportsReferencePosition:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($AF98D11BA0603040132F42F0933BF992)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSupportsReferencePosition
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  v8.super_class = (Class)_MRCommandInfoProtobuf;
  -[_MRCommandInfoProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRCommandInfoProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $AF98D11BA0603040132F42F0933BF992 has;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSString *localizedTitle;
  NSString *localizedShortTitle;
  $AF98D11BA0603040132F42F0933BF992 v12;
  void *v13;
  void *v14;
  void *v15;
  $AF98D11BA0603040132F42F0933BF992 v16;
  void *v17;
  void *v18;
  NSMutableArray *supportedCustomQueueIdentifiers;
  void *v20;
  double v21;
  $AF98D11BA0603040132F42F0933BF992 v22;
  void *v23;
  void *v24;
  NSMutableArray *supportedPlaybackSessionTypes;
  NSMutableArray *currentPlaybackSessionTypes;
  NSString *playbackSessionIdentifier;
  uint64_t currentQueueEndAction;
  __CFString *v29;
  uint64_t repeatMode;
  __CFString *v31;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedQueueEndActions;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t disabledReason;
  __CFString *v38;
  uint64_t shuffleMode;
  __CFString *v40;
  double v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  _MRCommandOptionsProtobuf *proactiveCommandOptions;
  void *v50;
  $AF98D11BA0603040132F42F0933BF992 v51;
  void *v52;
  _MRDictionaryProtobuf *dialogOptions;
  void *v54;
  NSString *lastSectionContentItemID;
  void *v56;
  id v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t sleepTimerStopMode;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v5 = CFSTR("Unknown");
    switch(self->_command)
    {
      case 0:
        break;
      case 1:
        v5 = CFSTR("Play");
        break;
      case 2:
        v5 = CFSTR("Pause");
        break;
      case 3:
        v5 = CFSTR("TogglePlayPause");
        break;
      case 4:
        v5 = CFSTR("Stop");
        break;
      case 5:
        v5 = CFSTR("NextTrack");
        break;
      case 6:
        v5 = CFSTR("PreviousTrack");
        break;
      case 7:
        v5 = CFSTR("AdvanceShuffleMode");
        break;
      case 8:
        v5 = CFSTR("AdvanceRepeatMode");
        break;
      case 9:
        v5 = CFSTR("BeginFastForward");
        break;
      case 0xA:
        v5 = CFSTR("EndFastForward");
        break;
      case 0xB:
        v5 = CFSTR("BeginRewind");
        break;
      case 0xC:
        v5 = CFSTR("EndRewind");
        break;
      case 0xD:
        v5 = CFSTR("Rewind15Seconds");
        break;
      case 0xE:
        v5 = CFSTR("FastForward15Seconds");
        break;
      case 0xF:
        v5 = CFSTR("Rewind30Seconds");
        break;
      case 0x10:
        v5 = CFSTR("FastForward30Seconds");
        break;
      case 0x12:
        v5 = CFSTR("SkipForward");
        break;
      case 0x13:
        v5 = CFSTR("SkipBackward");
        break;
      case 0x14:
        v5 = CFSTR("ChangePlaybackRate");
        break;
      case 0x15:
        v5 = CFSTR("RateTrack");
        break;
      case 0x16:
        v5 = CFSTR("LikeTrack");
        break;
      case 0x17:
        v5 = CFSTR("DislikeTrack");
        break;
      case 0x18:
        v5 = CFSTR("BookmarkTrack");
        break;
      case 0x19:
        v5 = CFSTR("NextChapter");
        break;
      case 0x1A:
        v5 = CFSTR("PreviousChapter");
        break;
      case 0x1B:
        v5 = CFSTR("NextAlbum");
        break;
      case 0x1C:
        v5 = CFSTR("PreviousAlbum");
        break;
      case 0x1D:
        v5 = CFSTR("NextPlaylist");
        break;
      case 0x1E:
        v5 = CFSTR("PreviousPlaylist");
        break;
      case 0x1F:
        v5 = CFSTR("BanTrack");
        break;
      case 0x20:
        v5 = CFSTR("AddTrackToWishList");
        break;
      case 0x21:
        v5 = CFSTR("RemoveTrackFromWishList");
        break;
      case 0x22:
        v5 = CFSTR("NextInContext");
        break;
      case 0x23:
        v5 = CFSTR("PreviousInContext");
        break;
      case 0x29:
        v5 = CFSTR("ResetPlaybackTimeout");
        break;
      case 0x2D:
        v5 = CFSTR("SeekToPlaybackPosition");
        break;
      case 0x2E:
        v5 = CFSTR("ChangeRepeatMode");
        break;
      case 0x2F:
        v5 = CFSTR("ChangeShuffleMode");
        break;
      case 0x30:
        v5 = CFSTR("SetPlaybackQueue");
        break;
      case 0x31:
        v5 = CFSTR("AddNowPlayingItemToLibrary");
        break;
      case 0x32:
        v5 = CFSTR("CreateRadioStation");
        break;
      case 0x33:
        v5 = CFSTR("AddItemToLibrary");
        break;
      case 0x34:
        v5 = CFSTR("InsertIntoPlaybackQueue");
        break;
      case 0x35:
        v5 = CFSTR("EnableLanguageOption");
        break;
      case 0x36:
        v5 = CFSTR("DisableLanguageOption");
        break;
      case 0x37:
        v5 = CFSTR("ReorderPlaybackQueue");
        break;
      case 0x38:
        v5 = CFSTR("RemoveFromPlaybackQueue");
        break;
      case 0x39:
        v5 = CFSTR("PlayItemInPlaybackQueue");
        break;
      case 0x3A:
        v5 = CFSTR("PrepareForSetQueue");
        break;
      case 0x3B:
        v5 = CFSTR("SetPlaybackSession");
        break;
      case 0x3C:
        v5 = CFSTR("PreloadPlaybackSession");
        break;
      case 0x3D:
        v5 = CFSTR("SetPriorityForPlaybackSession");
        break;
      case 0x3E:
        v5 = CFSTR("DiscardPlaybackSession");
        break;
      case 0x3F:
        v5 = CFSTR("Reshuffle");
        break;
      case 0x40:
        v5 = CFSTR("LeaveSharedPlaybackSession");
        break;
      case 0x41:
        v5 = CFSTR("PostEventNotice");
        break;
      case 0x7C:
        v5 = CFSTR("SetSleepTimer");
        break;
      case 0x87:
        v5 = CFSTR("ChangeQueueEndAction");
        break;
      case 0x8E:
        v5 = CFSTR("VocalsControl");
        break;
      case 0x8F:
        v5 = CFSTR("PrepareVocalsControl");
        break;
      case 0x90:
        v5 = CFSTR("ClearUpNextQueue");
        break;
      case 0x91:
        v5 = CFSTR("PerformDialogAction");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_command);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("command"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("enabled"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("active"));

  }
  PBRepeatedDoubleNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("preferredInterval"));

  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
    objc_msgSend(v3, "setObject:forKey:", localizedTitle, CFSTR("localizedTitle"));
  localizedShortTitle = self->_localizedShortTitle;
  if (localizedShortTitle)
    objc_msgSend(v3, "setObject:forKey:", localizedShortTitle, CFSTR("localizedShortTitle"));
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    *(float *)&v9 = self->_minimumRating;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("minimumRating"));

    v12 = self->_has;
  }
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    *(float *)&v9 = self->_maximumRating;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("maximumRating"));

  }
  PBRepeatedFloatNSArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("supportedRate"));

  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x800) != 0)
  {
    repeatMode = self->_repeatMode;
    if (repeatMode >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_repeatMode);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E30CC230[repeatMode];
    }
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("repeatMode"));

    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x1000) == 0)
    {
LABEL_81:
      if ((*(_WORD *)&v16 & 0x400) == 0)
        goto LABEL_82;
      goto LABEL_160;
    }
  }
  else if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
    goto LABEL_81;
  }
  shuffleMode = self->_shuffleMode;
  if (shuffleMode >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_shuffleMode);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = off_1E30CC250[shuffleMode];
  }
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("shuffleMode"));

  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x400) == 0)
  {
LABEL_82:
    if ((*(_WORD *)&v16 & 0x4000) == 0)
      goto LABEL_83;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_presentationStyle);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("presentationStyle"));

  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_83:
    if ((*(_WORD *)&v16 & 0x100) == 0)
      goto LABEL_84;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_skipInterval);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("skipInterval"));

  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_84:
    if ((*(_WORD *)&v16 & 0x2000) == 0)
      goto LABEL_85;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numAvailableSkips);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("numAvailableSkips"));

  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_85:
    if ((*(_BYTE *)&v16 & 4) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_skipFrequency);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("skipFrequency"));

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_86:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_canScrub);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("canScrub"));

  }
LABEL_87:
  PBRepeatedInt32NSArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("supportedPlaybackQueueTypes"));

  supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  if (supportedCustomQueueIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", supportedCustomQueueIdentifiers, CFSTR("supportedCustomQueueIdentifier"));
  PBRepeatedInt32NSArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("supportedInsertionPositions"));

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_upNextItemCount);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("upNextItemCount"));

    v22 = self->_has;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    *(float *)&v21 = self->_preferredPlaybackRate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("preferredPlaybackRate"));

  }
  supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  if (supportedPlaybackSessionTypes)
    objc_msgSend(v3, "setObject:forKey:", supportedPlaybackSessionTypes, CFSTR("supportedPlaybackSessionTypes"));
  currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  if (currentPlaybackSessionTypes)
    objc_msgSend(v3, "setObject:forKey:", currentPlaybackSessionTypes, CFSTR("currentPlaybackSessionTypes"));
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if (playbackSessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", playbackSessionIdentifier, CFSTR("playbackSessionIdentifier"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    currentQueueEndAction = self->_currentQueueEndAction;
    if (currentQueueEndAction >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentQueueEndAction);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E30CC270[currentQueueEndAction];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("currentQueueEndAction"));

  }
  p_supportedQueueEndActions = &self->_supportedQueueEndActions;
  if (self->_supportedQueueEndActions.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_supportedQueueEndActions.count)
    {
      v34 = 0;
      do
      {
        v35 = p_supportedQueueEndActions->list[v34];
        if (v35 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_supportedQueueEndActions->list[v34]);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E30CC270[v35];
        }
        objc_msgSend(v33, "addObject:", v36);

        ++v34;
      }
      while (v34 < self->_supportedQueueEndActions.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("supportedQueueEndActions"));

  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    disabledReason = self->_disabledReason;
    if (disabledReason >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_disabledReason);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E30CC290[disabledReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("disabledReason"));

  }
  if (-[NSMutableArray count](self->_supportedPlaybackSessionIdentifiers, "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_supportedPlaybackSessionIdentifiers, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v43 = self->_supportedPlaybackSessionIdentifiers;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v72 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "dictionaryRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

        }
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v45);
    }

    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("supportedPlaybackSessionIdentifiers"));
  }
  proactiveCommandOptions = self->_proactiveCommandOptions;
  if (proactiveCommandOptions)
  {
    -[_MRCommandOptionsProtobuf dictionaryRepresentation](proactiveCommandOptions, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("proactiveCommandOptions"));

  }
  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_vocalsControlActive);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("vocalsControlActive"));

    v51 = self->_has;
    if ((*(_DWORD *)&v51 & 0x20000) == 0)
    {
LABEL_136:
      if ((*(_DWORD *)&v51 & 0x40000) == 0)
        goto LABEL_137;
      goto LABEL_152;
    }
  }
  else if ((*(_DWORD *)&v51 & 0x20000) == 0)
  {
    goto LABEL_136;
  }
  *(float *)&v41 = self->_vocalsControlLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("vocalsControlLevel"));

  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x40000) == 0)
  {
LABEL_137:
    if ((*(_DWORD *)&v51 & 0x80000) == 0)
      goto LABEL_138;
    goto LABEL_153;
  }
LABEL_152:
  *(float *)&v41 = self->_vocalsControlMaxLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("vocalsControlMaxLevel"));

  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x80000) == 0)
  {
LABEL_138:
    if ((*(_DWORD *)&v51 & 0x1000000) == 0)
      goto LABEL_139;
    goto LABEL_154;
  }
LABEL_153:
  *(float *)&v41 = self->_vocalsControlMinLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("vocalsControlMinLevel"));

  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x1000000) == 0)
  {
LABEL_139:
    if ((*(_BYTE *)&v51 & 2) == 0)
      goto LABEL_140;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_vocalsControlContinuous);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("vocalsControlContinuous"));

  v51 = self->_has;
  if ((*(_BYTE *)&v51 & 2) == 0)
  {
LABEL_140:
    if ((*(_WORD *)&v51 & 0x8000) == 0)
      goto LABEL_141;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sleepTimerTime);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("sleepTimerTime"));

  v51 = self->_has;
  if ((*(_WORD *)&v51 & 0x8000) == 0)
  {
LABEL_141:
    if ((*(_BYTE *)&v51 & 1) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
LABEL_156:
  sleepTimerStopMode = self->_sleepTimerStopMode;
  if (sleepTimerStopMode >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sleepTimerStopMode);
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = off_1E30CC2B0[sleepTimerStopMode];
  }
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("sleepTimerStopMode"));

  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_142:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sleepTimerFireDate);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("sleepTimerFireDate"));

  }
LABEL_143:
  dialogOptions = self->_dialogOptions;
  if (dialogOptions)
  {
    -[_MRDictionaryProtobuf dictionaryRepresentation](dialogOptions, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("dialogOptions"));

  }
  lastSectionContentItemID = self->_lastSectionContentItemID;
  if (lastSectionContentItemID)
    objc_msgSend(v3, "setObject:forKey:", lastSectionContentItemID, CFSTR("lastSectionContentItemID"));
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsReferencePosition);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("supportsReferencePosition"));

  }
  v57 = v3;

  return v57;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCommandInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $AF98D11BA0603040132F42F0933BF992 has;
  unint64_t v6;
  $AF98D11BA0603040132F42F0933BF992 v7;
  unint64_t v8;
  $AF98D11BA0603040132F42F0933BF992 v9;
  unint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  $AF98D11BA0603040132F42F0933BF992 v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  $AF98D11BA0603040132F42F0933BF992 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x200000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_preferredIntervals.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v6;
    }
    while (v6 < self->_preferredIntervals.count);
  }
  if (self->_localizedTitle)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) != 0)
  {
    PBDataWriterWriteFloatField();
    v7 = self->_has;
  }
  if ((*(_BYTE *)&v7 & 0x40) != 0)
    PBDataWriterWriteFloatField();
  if (self->_supportedRates.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v8;
    }
    while (v8 < self->_supportedRates.count);
  }
  if (self->_localizedShortTitle)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x1000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v9 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v9 & 4) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_26:
    PBDataWriterWriteInt32Field();
LABEL_27:
  if (self->_supportedPlaybackQueueTypes.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_supportedPlaybackQueueTypes.count);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v11 = self->_supportedCustomQueueIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v13);
  }

  if (self->_supportedInsertionPositions.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v16;
    }
    while (v16 < self->_supportedInsertionPositions.count);
  }
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = self->_has;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
    PBDataWriterWriteFloatField();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = self->_supportedPlaybackSessionTypes;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteStringField();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v20);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = self->_currentPlaybackSessionTypes;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v40;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteStringField();
        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v25);
  }

  if (self->_playbackSessionIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_supportedQueueEndActions.count)
  {
    v28 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v28;
    }
    while (v28 < self->_supportedQueueEndActions.count);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = self->_supportedPlaybackSessionIdentifiers;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v36;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v31);
  }

  if (self->_proactiveCommandOptions)
    PBDataWriterWriteSubmessage();
  v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x20000) == 0)
    {
LABEL_78:
      if ((*(_DWORD *)&v34 & 0x40000) == 0)
        goto LABEL_79;
      goto LABEL_104;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x20000) == 0)
  {
    goto LABEL_78;
  }
  PBDataWriterWriteFloatField();
  v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x40000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v34 & 0x80000) == 0)
      goto LABEL_80;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteFloatField();
  v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x80000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v34 & 0x1000000) == 0)
      goto LABEL_81;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteFloatField();
  v34 = self->_has;
  if ((*(_DWORD *)&v34 & 0x1000000) == 0)
  {
LABEL_81:
    if ((*(_BYTE *)&v34 & 2) == 0)
      goto LABEL_82;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  v34 = self->_has;
  if ((*(_BYTE *)&v34 & 2) == 0)
  {
LABEL_82:
    if ((*(_WORD *)&v34 & 0x8000) == 0)
      goto LABEL_83;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteDoubleField();
  v34 = self->_has;
  if ((*(_WORD *)&v34 & 0x8000) == 0)
  {
LABEL_83:
    if ((*(_BYTE *)&v34 & 1) == 0)
      goto LABEL_85;
    goto LABEL_84;
  }
LABEL_108:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 1) != 0)
LABEL_84:
    PBDataWriterWriteDoubleField();
LABEL_85:
  if (self->_dialogOptions)
    PBDataWriterWriteSubmessage();
  if (self->_lastSectionContentItemID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  $AF98D11BA0603040132F42F0933BF992 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $AF98D11BA0603040132F42F0933BF992 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  $AF98D11BA0603040132F42F0933BF992 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  $AF98D11BA0603040132F42F0933BF992 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  unint64_t v36;
  unint64_t v37;
  uint64_t mm;
  void *v39;
  $AF98D11BA0603040132F42F0933BF992 v40;
  _BYTE *v41;
  id v42;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_3;
LABEL_86:
    v4[313] = self->_enabled;
    *((_DWORD *)v4 + 80) |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 37) = self->_command;
  *((_DWORD *)v4 + 80) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_86;
LABEL_3:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    v4[312] = self->_active;
    *((_DWORD *)v4 + 80) |= 0x100000u;
  }
LABEL_5:
  v42 = v4;
  if (-[_MRCommandInfoProtobuf preferredIntervalsCount](self, "preferredIntervalsCount"))
  {
    objc_msgSend(v42, "clearPreferredIntervals");
    v6 = -[_MRCommandInfoProtobuf preferredIntervalsCount](self, "preferredIntervalsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRCommandInfoProtobuf preferredIntervalAtIndex:](self, "preferredIntervalAtIndex:", i);
        objc_msgSend(v42, "addPreferredInterval:");
      }
    }
  }
  if (self->_localizedTitle)
    objc_msgSend(v42, "setLocalizedTitle:");
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    *((_DWORD *)v42 + 53) = LODWORD(self->_minimumRating);
    *((_DWORD *)v42 + 80) |= 0x80u;
    v9 = self->_has;
  }
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    *((_DWORD *)v42 + 52) = LODWORD(self->_maximumRating);
    *((_DWORD *)v42 + 80) |= 0x40u;
  }
  if (-[_MRCommandInfoProtobuf supportedRatesCount](self, "supportedRatesCount"))
  {
    objc_msgSend(v42, "clearSupportedRates");
    v10 = -[_MRCommandInfoProtobuf supportedRatesCount](self, "supportedRatesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[_MRCommandInfoProtobuf supportedRateAtIndex:](self, "supportedRateAtIndex:", j);
        objc_msgSend(v42, "addSupportedRate:");
      }
    }
  }
  if (self->_localizedShortTitle)
    objc_msgSend(v42, "setLocalizedShortTitle:");
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    *((_DWORD *)v42 + 62) = self->_repeatMode;
    *((_DWORD *)v42 + 80) |= 0x800u;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v13 & 0x400) == 0)
        goto LABEL_24;
      goto LABEL_90;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v42 + 63) = self->_shuffleMode;
  *((_DWORD *)v42 + 80) |= 0x1000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v13 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v42 + 59) = self->_presentationStyle;
  *((_DWORD *)v42 + 80) |= 0x400u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_26;
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v42 + 65) = self->_skipInterval;
  *((_DWORD *)v42 + 80) |= 0x4000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v13 & 0x2000) == 0)
      goto LABEL_27;
LABEL_93:
    *((_DWORD *)v42 + 64) = self->_skipFrequency;
    *((_DWORD *)v42 + 80) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_92:
  *((_DWORD *)v42 + 54) = self->_numAvailableSkips;
  *((_DWORD *)v42 + 80) |= 0x100u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) != 0)
    goto LABEL_93;
LABEL_27:
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
LABEL_28:
    *((_DWORD *)v42 + 36) = self->_canScrub;
    *((_DWORD *)v42 + 80) |= 4u;
  }
LABEL_29:
  if (-[_MRCommandInfoProtobuf supportedPlaybackQueueTypesCount](self, "supportedPlaybackQueueTypesCount"))
  {
    objc_msgSend(v42, "clearSupportedPlaybackQueueTypes");
    v14 = -[_MRCommandInfoProtobuf supportedPlaybackQueueTypesCount](self, "supportedPlaybackQueueTypesCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
        objc_msgSend(v42, "addSupportedPlaybackQueueTypes:", -[_MRCommandInfoProtobuf supportedPlaybackQueueTypesAtIndex:](self, "supportedPlaybackQueueTypesAtIndex:", k));
    }
  }
  if (-[_MRCommandInfoProtobuf supportedCustomQueueIdentifiersCount](self, "supportedCustomQueueIdentifiersCount"))
  {
    objc_msgSend(v42, "clearSupportedCustomQueueIdentifiers");
    v17 = -[_MRCommandInfoProtobuf supportedCustomQueueIdentifiersCount](self, "supportedCustomQueueIdentifiersCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[_MRCommandInfoProtobuf supportedCustomQueueIdentifierAtIndex:](self, "supportedCustomQueueIdentifierAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addSupportedCustomQueueIdentifier:", v20);

      }
    }
  }
  if (-[_MRCommandInfoProtobuf supportedInsertionPositionsCount](self, "supportedInsertionPositionsCount"))
  {
    objc_msgSend(v42, "clearSupportedInsertionPositions");
    v21 = -[_MRCommandInfoProtobuf supportedInsertionPositionsCount](self, "supportedInsertionPositionsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
        objc_msgSend(v42, "addSupportedInsertionPositions:", -[_MRCommandInfoProtobuf supportedInsertionPositionsAtIndex:](self, "supportedInsertionPositionsAtIndex:", n));
    }
  }
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    *((_DWORD *)v42 + 74) = self->_upNextItemCount;
    *((_DWORD *)v42 + 80) |= 0x10000u;
    v24 = self->_has;
  }
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    *((_DWORD *)v42 + 58) = LODWORD(self->_preferredPlaybackRate);
    *((_DWORD *)v42 + 80) |= 0x200u;
  }
  if (-[_MRCommandInfoProtobuf supportedPlaybackSessionTypesCount](self, "supportedPlaybackSessionTypesCount"))
  {
    objc_msgSend(v42, "clearSupportedPlaybackSessionTypes");
    v25 = -[_MRCommandInfoProtobuf supportedPlaybackSessionTypesCount](self, "supportedPlaybackSessionTypesCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[_MRCommandInfoProtobuf supportedPlaybackSessionTypesAtIndex:](self, "supportedPlaybackSessionTypesAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addSupportedPlaybackSessionTypes:", v28);

      }
    }
  }
  if (-[_MRCommandInfoProtobuf currentPlaybackSessionTypesCount](self, "currentPlaybackSessionTypesCount"))
  {
    objc_msgSend(v42, "clearCurrentPlaybackSessionTypes");
    v29 = -[_MRCommandInfoProtobuf currentPlaybackSessionTypesCount](self, "currentPlaybackSessionTypesCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[_MRCommandInfoProtobuf currentPlaybackSessionTypesAtIndex:](self, "currentPlaybackSessionTypesAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addCurrentPlaybackSessionTypes:", v32);

      }
    }
  }
  if (self->_playbackSessionIdentifier)
    objc_msgSend(v42, "setPlaybackSessionIdentifier:");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v42 + 40) = self->_currentQueueEndAction;
    *((_DWORD *)v42 + 80) |= 0x10u;
  }
  if (-[_MRCommandInfoProtobuf supportedQueueEndActionsCount](self, "supportedQueueEndActionsCount"))
  {
    objc_msgSend(v42, "clearSupportedQueueEndActions");
    v33 = -[_MRCommandInfoProtobuf supportedQueueEndActionsCount](self, "supportedQueueEndActionsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
        objc_msgSend(v42, "addSupportedQueueEndActions:", -[_MRCommandInfoProtobuf supportedQueueEndActionsAtIndex:](self, "supportedQueueEndActionsAtIndex:", kk));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v42 + 44) = self->_disabledReason;
    *((_DWORD *)v42 + 80) |= 0x20u;
  }
  if (-[_MRCommandInfoProtobuf supportedPlaybackSessionIdentifiersCount](self, "supportedPlaybackSessionIdentifiersCount"))
  {
    objc_msgSend(v42, "clearSupportedPlaybackSessionIdentifiers");
    v36 = -[_MRCommandInfoProtobuf supportedPlaybackSessionIdentifiersCount](self, "supportedPlaybackSessionIdentifiersCount");
    if (v36)
    {
      v37 = v36;
      for (mm = 0; mm != v37; ++mm)
      {
        -[_MRCommandInfoProtobuf supportedPlaybackSessionIdentifiersAtIndex:](self, "supportedPlaybackSessionIdentifiersAtIndex:", mm);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addSupportedPlaybackSessionIdentifiers:", v39);

      }
    }
  }
  if (self->_proactiveCommandOptions)
    objc_msgSend(v42, "setProactiveCommandOptions:");
  v40 = self->_has;
  v41 = v42;
  if ((*(_DWORD *)&v40 & 0x800000) != 0)
  {
    *((_BYTE *)v42 + 315) = self->_vocalsControlActive;
    *((_DWORD *)v42 + 80) |= 0x800000u;
    v40 = self->_has;
    if ((*(_DWORD *)&v40 & 0x20000) == 0)
    {
LABEL_71:
      if ((*(_DWORD *)&v40 & 0x40000) == 0)
        goto LABEL_72;
      goto LABEL_97;
    }
  }
  else if ((*(_DWORD *)&v40 & 0x20000) == 0)
  {
    goto LABEL_71;
  }
  *((_DWORD *)v42 + 75) = LODWORD(self->_vocalsControlLevel);
  *((_DWORD *)v42 + 80) |= 0x20000u;
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x40000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v40 & 0x80000) == 0)
      goto LABEL_73;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v42 + 76) = LODWORD(self->_vocalsControlMaxLevel);
  *((_DWORD *)v42 + 80) |= 0x40000u;
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x80000) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v40 & 0x1000000) == 0)
      goto LABEL_74;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v42 + 77) = LODWORD(self->_vocalsControlMinLevel);
  *((_DWORD *)v42 + 80) |= 0x80000u;
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x1000000) == 0)
  {
LABEL_74:
    if ((*(_BYTE *)&v40 & 2) == 0)
      goto LABEL_75;
    goto LABEL_100;
  }
LABEL_99:
  *((_BYTE *)v42 + 316) = self->_vocalsControlContinuous;
  *((_DWORD *)v42 + 80) |= 0x1000000u;
  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 2) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&v40 & 0x8000) == 0)
      goto LABEL_76;
    goto LABEL_101;
  }
LABEL_100:
  *((_QWORD *)v42 + 17) = *(_QWORD *)&self->_sleepTimerTime;
  *((_DWORD *)v42 + 80) |= 2u;
  v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x8000) == 0)
  {
LABEL_76:
    if ((*(_BYTE *)&v40 & 1) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_101:
  *((_DWORD *)v42 + 66) = self->_sleepTimerStopMode;
  *((_DWORD *)v42 + 80) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_77:
    *((_QWORD *)v42 + 16) = *(_QWORD *)&self->_sleepTimerFireDate;
    *((_DWORD *)v42 + 80) |= 1u;
  }
LABEL_78:
  if (self->_dialogOptions)
  {
    objc_msgSend(v42, "setDialogOptions:");
    v41 = v42;
  }
  if (self->_lastSectionContentItemID)
  {
    objc_msgSend(v42, "setLastSectionContentItemID:");
    v41 = v42;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    v41[314] = self->_supportsReferencePosition;
    *((_DWORD *)v41 + 80) |= 0x400000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $AF98D11BA0603040132F42F0933BF992 has;
  uint64_t v8;
  void *v9;
  $AF98D11BA0603040132F42F0933BF992 v10;
  uint64_t v11;
  void *v12;
  $AF98D11BA0603040132F42F0933BF992 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  $AF98D11BA0603040132F42F0933BF992 v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  $AF98D11BA0603040132F42F0933BF992 v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_command;
    *(_DWORD *)(v5 + 320) |= 8u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x200000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 313) = self->_enabled;
  *(_DWORD *)(v5 + 320) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 312) = self->_active;
    *(_DWORD *)(v5 + 320) |= 0x100000u;
  }
LABEL_5:
  PBRepeatedDoubleCopy();
  v8 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v8;

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) != 0)
  {
    *(float *)(v6 + 212) = self->_minimumRating;
    *(_DWORD *)(v6 + 320) |= 0x80u;
    v10 = self->_has;
  }
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    *(float *)(v6 + 208) = self->_maximumRating;
    *(_DWORD *)(v6 + 320) |= 0x40u;
  }
  PBRepeatedFloatCopy();
  v11 = -[NSString copyWithZone:](self->_localizedShortTitle, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v11;

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 248) = self->_repeatMode;
    *(_DWORD *)(v6 + 320) |= 0x800u;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v13 & 0x400) == 0)
        goto LABEL_12;
      goto LABEL_70;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 252) = self->_shuffleMode;
  *(_DWORD *)(v6 + 320) |= 0x1000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v13 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v6 + 236) = self->_presentationStyle;
  *(_DWORD *)(v6 + 320) |= 0x400u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v6 + 260) = self->_skipInterval;
  *(_DWORD *)(v6 + 320) |= 0x4000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v13 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v6 + 216) = self->_numAvailableSkips;
  *(_DWORD *)(v6 + 320) |= 0x100u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v13 & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_73:
  *(_DWORD *)(v6 + 256) = self->_skipFrequency;
  *(_DWORD *)(v6 + 320) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 144) = self->_canScrub;
    *(_DWORD *)(v6 + 320) |= 4u;
  }
LABEL_17:
  PBRepeatedInt32Copy();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v14 = self->_supportedCustomQueueIdentifiers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v62;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v62 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSupportedCustomQueueIdentifier:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v16);
  }

  PBRepeatedInt32Copy();
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    *(_DWORD *)(v6 + 296) = self->_upNextItemCount;
    *(_DWORD *)(v6 + 320) |= 0x10000u;
    v20 = self->_has;
  }
  if ((*(_WORD *)&v20 & 0x200) != 0)
  {
    *(float *)(v6 + 232) = self->_preferredPlaybackRate;
    *(_DWORD *)(v6 + 320) |= 0x200u;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v21 = self->_supportedPlaybackSessionTypes;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v58;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v25), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSupportedPlaybackSessionTypes:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v23);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = self->_currentPlaybackSessionTypes;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v54;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v31), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCurrentPlaybackSessionTypes:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v29);
  }

  v33 = -[NSString copyWithZone:](self->_playbackSessionIdentifier, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v33;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_currentQueueEndAction;
    *(_DWORD *)(v6 + 320) |= 0x10u;
  }
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_disabledReason;
    *(_DWORD *)(v6 + 320) |= 0x20u;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = self->_supportedPlaybackSessionIdentifiers;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v50;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v39), "copyWithZone:", a3, (_QWORD)v49);
        objc_msgSend((id)v6, "addSupportedPlaybackSessionIdentifiers:", v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v37);
  }

  v41 = -[_MRCommandOptionsProtobuf copyWithZone:](self->_proactiveCommandOptions, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 240);
  *(_QWORD *)(v6 + 240) = v41;

  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x800000) != 0)
  {
    *(_BYTE *)(v6 + 315) = self->_vocalsControlActive;
    *(_DWORD *)(v6 + 320) |= 0x800000u;
    v43 = self->_has;
    if ((*(_DWORD *)&v43 & 0x20000) == 0)
    {
LABEL_55:
      if ((*(_DWORD *)&v43 & 0x40000) == 0)
        goto LABEL_56;
      goto LABEL_77;
    }
  }
  else if ((*(_DWORD *)&v43 & 0x20000) == 0)
  {
    goto LABEL_55;
  }
  *(float *)(v6 + 300) = self->_vocalsControlLevel;
  *(_DWORD *)(v6 + 320) |= 0x20000u;
  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x40000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v43 & 0x80000) == 0)
      goto LABEL_57;
    goto LABEL_78;
  }
LABEL_77:
  *(float *)(v6 + 304) = self->_vocalsControlMaxLevel;
  *(_DWORD *)(v6 + 320) |= 0x40000u;
  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x80000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v43 & 0x1000000) == 0)
      goto LABEL_58;
    goto LABEL_79;
  }
LABEL_78:
  *(float *)(v6 + 308) = self->_vocalsControlMinLevel;
  *(_DWORD *)(v6 + 320) |= 0x80000u;
  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x1000000) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v43 & 2) == 0)
      goto LABEL_59;
    goto LABEL_80;
  }
LABEL_79:
  *(_BYTE *)(v6 + 316) = self->_vocalsControlContinuous;
  *(_DWORD *)(v6 + 320) |= 0x1000000u;
  v43 = self->_has;
  if ((*(_BYTE *)&v43 & 2) == 0)
  {
LABEL_59:
    if ((*(_WORD *)&v43 & 0x8000) == 0)
      goto LABEL_60;
    goto LABEL_81;
  }
LABEL_80:
  *(double *)(v6 + 136) = self->_sleepTimerTime;
  *(_DWORD *)(v6 + 320) |= 2u;
  v43 = self->_has;
  if ((*(_WORD *)&v43 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&v43 & 1) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_81:
  *(_DWORD *)(v6 + 264) = self->_sleepTimerStopMode;
  *(_DWORD *)(v6 + 320) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_61:
    *(double *)(v6 + 128) = self->_sleepTimerFireDate;
    *(_DWORD *)(v6 + 320) |= 1u;
  }
LABEL_62:
  v44 = -[_MRDictionaryProtobuf copyWithZone:](self->_dialogOptions, "copyWithZone:", a3, (_QWORD)v49);
  v45 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v44;

  v46 = -[NSString copyWithZone:](self->_lastSectionContentItemID, "copyWithZone:", a3);
  v47 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v46;

  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 314) = self->_supportsReferencePosition;
    *(_DWORD *)(v6 + 320) |= 0x400000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $AF98D11BA0603040132F42F0933BF992 has;
  int v6;
  NSString *localizedTitle;
  $AF98D11BA0603040132F42F0933BF992 v8;
  int v9;
  NSString *localizedShortTitle;
  $AF98D11BA0603040132F42F0933BF992 v11;
  int v12;
  NSMutableArray *supportedCustomQueueIdentifiers;
  $AF98D11BA0603040132F42F0933BF992 v14;
  int v15;
  NSMutableArray *supportedPlaybackSessionTypes;
  NSMutableArray *currentPlaybackSessionTypes;
  NSString *playbackSessionIdentifier;
  int v19;
  int v20;
  NSMutableArray *supportedPlaybackSessionIdentifiers;
  _MRCommandOptionsProtobuf *proactiveCommandOptions;
  $AF98D11BA0603040132F42F0933BF992 v23;
  int v24;
  _MRDictionaryProtobuf *dialogOptions;
  NSString *lastSectionContentItemID;
  int v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_162;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 80);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_command != *((_DWORD *)v4 + 37))
      goto LABEL_162;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0)
      goto LABEL_162;
    if (self->_enabled)
    {
      if (!*((_BYTE *)v4 + 313))
        goto LABEL_162;
    }
    else if (*((_BYTE *)v4 + 313))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0)
      goto LABEL_162;
    if (self->_active)
    {
      if (!*((_BYTE *)v4 + 312))
        goto LABEL_162;
    }
    else if (*((_BYTE *)v4 + 312))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_162;
  localizedTitle = self->_localizedTitle;
  if ((unint64_t)localizedTitle | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](localizedTitle, "isEqual:"))
      goto LABEL_162;
  }
  v8 = self->_has;
  v9 = *((_DWORD *)v4 + 80);
  if ((*(_BYTE *)&v8 & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_minimumRating != *((float *)v4 + 53))
      goto LABEL_162;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v8 & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_maximumRating != *((float *)v4 + 52))
      goto LABEL_162;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_162;
  localizedShortTitle = self->_localizedShortTitle;
  if ((unint64_t)localizedShortTitle | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](localizedShortTitle, "isEqual:"))
      goto LABEL_162;
  }
  v11 = self->_has;
  v12 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_repeatMode != *((_DWORD *)v4 + 62))
      goto LABEL_162;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 63))
      goto LABEL_162;
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_presentationStyle != *((_DWORD *)v4 + 59))
      goto LABEL_162;
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_skipInterval != *((_DWORD *)v4 + 65))
      goto LABEL_162;
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_numAvailableSkips != *((_DWORD *)v4 + 54))
      goto LABEL_162;
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_skipFrequency != *((_DWORD *)v4 + 64))
      goto LABEL_162;
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_canScrub != *((_DWORD *)v4 + 36))
      goto LABEL_162;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_162;
  supportedCustomQueueIdentifiers = self->_supportedCustomQueueIdentifiers;
  if ((unint64_t)supportedCustomQueueIdentifiers | *((_QWORD *)v4 + 34))
  {
    if (!-[NSMutableArray isEqual:](supportedCustomQueueIdentifiers, "isEqual:"))
      goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_162;
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_upNextItemCount != *((_DWORD *)v4 + 74))
      goto LABEL_162;
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_preferredPlaybackRate != *((float *)v4 + 58))
      goto LABEL_162;
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
  if ((unint64_t)supportedPlaybackSessionTypes | *((_QWORD *)v4 + 36)
    && !-[NSMutableArray isEqual:](supportedPlaybackSessionTypes, "isEqual:"))
  {
    goto LABEL_162;
  }
  currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
  if ((unint64_t)currentPlaybackSessionTypes | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](currentPlaybackSessionTypes, "isEqual:"))
      goto LABEL_162;
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if ((unint64_t)playbackSessionIdentifier | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](playbackSessionIdentifier, "isEqual:"))
      goto LABEL_162;
  }
  v19 = *((_DWORD *)v4 + 80);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_currentQueueEndAction != *((_DWORD *)v4 + 40))
      goto LABEL_162;
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_162:
    v28 = 0;
    goto LABEL_163;
  }
  v20 = *((_DWORD *)v4 + 80);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0 || self->_disabledReason != *((_DWORD *)v4 + 44))
      goto LABEL_162;
  }
  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  supportedPlaybackSessionIdentifiers = self->_supportedPlaybackSessionIdentifiers;
  if ((unint64_t)supportedPlaybackSessionIdentifiers | *((_QWORD *)v4 + 35)
    && !-[NSMutableArray isEqual:](supportedPlaybackSessionIdentifiers, "isEqual:"))
  {
    goto LABEL_162;
  }
  proactiveCommandOptions = self->_proactiveCommandOptions;
  if ((unint64_t)proactiveCommandOptions | *((_QWORD *)v4 + 30))
  {
    if (!-[_MRCommandOptionsProtobuf isEqual:](proactiveCommandOptions, "isEqual:"))
      goto LABEL_162;
  }
  v23 = self->_has;
  v24 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&v23 & 0x800000) != 0)
  {
    if ((v24 & 0x800000) == 0)
      goto LABEL_162;
    if (self->_vocalsControlActive)
    {
      if (!*((_BYTE *)v4 + 315))
        goto LABEL_162;
    }
    else if (*((_BYTE *)v4 + 315))
    {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x20000) != 0)
  {
    if ((v24 & 0x20000) == 0 || self->_vocalsControlLevel != *((float *)v4 + 75))
      goto LABEL_162;
  }
  else if ((v24 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x40000) != 0)
  {
    if ((v24 & 0x40000) == 0 || self->_vocalsControlMaxLevel != *((float *)v4 + 76))
      goto LABEL_162;
  }
  else if ((v24 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    if ((v24 & 0x80000) == 0 || self->_vocalsControlMinLevel != *((float *)v4 + 77))
      goto LABEL_162;
  }
  else if ((v24 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v23 & 0x1000000) != 0)
  {
    if ((v24 & 0x1000000) == 0)
      goto LABEL_162;
    if (self->_vocalsControlContinuous)
    {
      if (!*((_BYTE *)v4 + 316))
        goto LABEL_162;
    }
    else if (*((_BYTE *)v4 + 316))
    {
      goto LABEL_162;
    }
  }
  else if ((v24 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_sleepTimerTime != *((double *)v4 + 17))
      goto LABEL_162;
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v23 & 0x8000) != 0)
  {
    if ((v24 & 0x8000) == 0 || self->_sleepTimerStopMode != *((_DWORD *)v4 + 66))
      goto LABEL_162;
  }
  else if ((v24 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v23 & 1) != 0)
  {
    if ((v24 & 1) == 0 || self->_sleepTimerFireDate != *((double *)v4 + 16))
      goto LABEL_162;
  }
  else if ((v24 & 1) != 0)
  {
    goto LABEL_162;
  }
  dialogOptions = self->_dialogOptions;
  if ((unint64_t)dialogOptions | *((_QWORD *)v4 + 21)
    && !-[_MRDictionaryProtobuf isEqual:](dialogOptions, "isEqual:"))
  {
    goto LABEL_162;
  }
  lastSectionContentItemID = self->_lastSectionContentItemID;
  if ((unint64_t)lastSectionContentItemID | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](lastSectionContentItemID, "isEqual:"))
      goto LABEL_162;
  }
  v27 = *((_DWORD *)v4 + 80);
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    if ((v27 & 0x400000) != 0)
    {
      if (self->_supportsReferencePosition)
      {
        if (!*((_BYTE *)v4 + 314))
          goto LABEL_162;
      }
      else if (*((_BYTE *)v4 + 314))
      {
        goto LABEL_162;
      }
      v28 = 1;
      goto LABEL_163;
    }
    goto LABEL_162;
  }
  v28 = (v27 & 0x400000) == 0;
LABEL_163:

  return v28;
}

- (unint64_t)hash
{
  $AF98D11BA0603040132F42F0933BF992 has;
  $AF98D11BA0603040132F42F0933BF992 v4;
  float maximumRating;
  float v6;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float minimumRating;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  $AF98D11BA0603040132F42F0933BF992 v18;
  $AF98D11BA0603040132F42F0933BF992 v19;
  float preferredPlaybackRate;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  $AF98D11BA0603040132F42F0933BF992 v28;
  float vocalsControlLevel;
  float v30;
  float v31;
  float v32;
  unint64_t v33;
  unint64_t v34;
  float vocalsControlMaxLevel;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  float vocalsControlMinLevel;
  float v41;
  float v42;
  float v43;
  double sleepTimerTime;
  double v45;
  long double v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  double sleepTimerFireDate;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  unint64_t v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSUInteger v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  NSUInteger v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
    v90 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_3;
LABEL_6:
    v89 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v90 = 2654435761 * self->_command;
  if ((*(_DWORD *)&has & 0x200000) == 0)
    goto LABEL_6;
LABEL_3:
  v89 = 2654435761 * self->_enabled;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    v88 = 2654435761 * self->_active;
    goto LABEL_8;
  }
LABEL_7:
  v88 = 0;
LABEL_8:
  v87 = PBRepeatedDoubleHash();
  v86 = -[NSString hash](self->_localizedTitle, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
    minimumRating = self->_minimumRating;
    v14 = -minimumRating;
    if (minimumRating >= 0.0)
      v14 = self->_minimumRating;
    v15 = floorf(v14 + 0.5);
    v16 = (float)(v14 - v15) * 1.8447e19;
    v17 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v17 += (unint64_t)v16;
    }
    else
    {
      v17 -= (unint64_t)fabsf(v16);
    }
    v85 = v17;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_10;
LABEL_24:
    v84 = 0;
    goto LABEL_25;
  }
  v85 = 0;
  if ((*(_BYTE *)&v4 & 0x40) == 0)
    goto LABEL_24;
LABEL_10:
  maximumRating = self->_maximumRating;
  v6 = -maximumRating;
  if (maximumRating >= 0.0)
    v6 = self->_maximumRating;
  v7 = floorf(v6 + 0.5);
  v8 = (float)(v6 - v7) * 1.8447e19;
  v9 = fmodf(v7, 1.8447e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabsf(v8);
  if (v8 >= 0.0)
    v12 = v11;
  v84 = v12;
LABEL_25:
  v83 = PBRepeatedFloatHash();
  v82 = -[NSString hash](self->_localizedShortTitle, "hash");
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
    v81 = 2654435761 * self->_repeatMode;
    if ((*(_WORD *)&v18 & 0x1000) != 0)
    {
LABEL_27:
      v80 = 2654435761 * self->_shuffleMode;
      if ((*(_WORD *)&v18 & 0x400) != 0)
        goto LABEL_28;
      goto LABEL_35;
    }
  }
  else
  {
    v81 = 0;
    if ((*(_WORD *)&v18 & 0x1000) != 0)
      goto LABEL_27;
  }
  v80 = 0;
  if ((*(_WORD *)&v18 & 0x400) != 0)
  {
LABEL_28:
    v79 = 2654435761 * self->_presentationStyle;
    if ((*(_WORD *)&v18 & 0x4000) != 0)
      goto LABEL_29;
    goto LABEL_36;
  }
LABEL_35:
  v79 = 0;
  if ((*(_WORD *)&v18 & 0x4000) != 0)
  {
LABEL_29:
    v78 = 2654435761 * self->_skipInterval;
    if ((*(_WORD *)&v18 & 0x100) != 0)
      goto LABEL_30;
    goto LABEL_37;
  }
LABEL_36:
  v78 = 0;
  if ((*(_WORD *)&v18 & 0x100) != 0)
  {
LABEL_30:
    v77 = 2654435761 * self->_numAvailableSkips;
    if ((*(_WORD *)&v18 & 0x2000) != 0)
      goto LABEL_31;
LABEL_38:
    v76 = 0;
    if ((*(_BYTE *)&v18 & 4) != 0)
      goto LABEL_32;
    goto LABEL_39;
  }
LABEL_37:
  v77 = 0;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
    goto LABEL_38;
LABEL_31:
  v76 = 2654435761 * self->_skipFrequency;
  if ((*(_BYTE *)&v18 & 4) != 0)
  {
LABEL_32:
    v75 = 2654435761 * self->_canScrub;
    goto LABEL_40;
  }
LABEL_39:
  v75 = 0;
LABEL_40:
  v74 = PBRepeatedInt32Hash();
  v73 = -[NSMutableArray hash](self->_supportedCustomQueueIdentifiers, "hash");
  v72 = PBRepeatedInt32Hash();
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x10000) != 0)
  {
    v71 = 2654435761 * self->_upNextItemCount;
    if ((*(_WORD *)&v19 & 0x200) != 0)
      goto LABEL_42;
LABEL_50:
    v70 = 0;
    goto LABEL_51;
  }
  v71 = 0;
  if ((*(_WORD *)&v19 & 0x200) == 0)
    goto LABEL_50;
LABEL_42:
  preferredPlaybackRate = self->_preferredPlaybackRate;
  v21 = -preferredPlaybackRate;
  if (preferredPlaybackRate >= 0.0)
    v21 = self->_preferredPlaybackRate;
  v22 = floorf(v21 + 0.5);
  v23 = (float)(v21 - v22) * 1.8447e19;
  v24 = fmodf(v22, 1.8447e19);
  v25 = 2654435761u * (unint64_t)v24;
  v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0)
    v26 = 2654435761u * (unint64_t)v24;
  v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 >= 0.0)
    v27 = v26;
  v70 = v27;
LABEL_51:
  v69 = -[NSMutableArray hash](self->_supportedPlaybackSessionTypes, "hash");
  v68 = -[NSMutableArray hash](self->_currentPlaybackSessionTypes, "hash");
  v67 = -[NSString hash](self->_playbackSessionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v66 = 2654435761 * self->_currentQueueEndAction;
  else
    v66 = 0;
  v65 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v64 = 2654435761 * self->_disabledReason;
  else
    v64 = 0;
  v63 = -[NSMutableArray hash](self->_supportedPlaybackSessionIdentifiers, "hash");
  v62 = -[_MRCommandOptionsProtobuf hash](self->_proactiveCommandOptions, "hash");
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x800000) != 0)
  {
    v61 = 2654435761 * self->_vocalsControlActive;
    if ((*(_DWORD *)&v28 & 0x20000) != 0)
      goto LABEL_59;
LABEL_64:
    v33 = 0;
    goto LABEL_67;
  }
  v61 = 0;
  if ((*(_DWORD *)&v28 & 0x20000) == 0)
    goto LABEL_64;
LABEL_59:
  vocalsControlLevel = self->_vocalsControlLevel;
  v30 = -vocalsControlLevel;
  if (vocalsControlLevel >= 0.0)
    v30 = self->_vocalsControlLevel;
  v31 = floorf(v30 + 0.5);
  v32 = (float)(v30 - v31) * 1.8447e19;
  v33 = 2654435761u * (unint64_t)fmodf(v31, 1.8447e19);
  if (v32 >= 0.0)
  {
    if (v32 > 0.0)
      v33 += (unint64_t)v32;
  }
  else
  {
    v33 -= (unint64_t)fabsf(v32);
  }
LABEL_67:
  if ((*(_DWORD *)&v28 & 0x40000) != 0)
  {
    vocalsControlMaxLevel = self->_vocalsControlMaxLevel;
    v36 = -vocalsControlMaxLevel;
    if (vocalsControlMaxLevel >= 0.0)
      v36 = self->_vocalsControlMaxLevel;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_DWORD *)&v28 & 0x80000) != 0)
  {
    vocalsControlMinLevel = self->_vocalsControlMinLevel;
    v41 = -vocalsControlMinLevel;
    if (vocalsControlMinLevel >= 0.0)
      v41 = self->_vocalsControlMinLevel;
    v42 = floorf(v41 + 0.5);
    v43 = (float)(v41 - v42) * 1.8447e19;
    v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((*(_DWORD *)&v28 & 0x1000000) != 0)
  {
    v59 = 2654435761 * self->_vocalsControlContinuous;
    if ((*(_BYTE *)&v28 & 2) != 0)
      goto LABEL_85;
LABEL_90:
    v48 = 0;
    goto LABEL_93;
  }
  v59 = 0;
  if ((*(_BYTE *)&v28 & 2) == 0)
    goto LABEL_90;
LABEL_85:
  sleepTimerTime = self->_sleepTimerTime;
  v45 = -sleepTimerTime;
  if (sleepTimerTime >= 0.0)
    v45 = self->_sleepTimerTime;
  v46 = floor(v45 + 0.5);
  v47 = (v45 - v46) * 1.84467441e19;
  v48 = 2654435761u * (unint64_t)fmod(v46, 1.84467441e19);
  if (v47 >= 0.0)
  {
    if (v47 > 0.0)
      v48 += (unint64_t)v47;
  }
  else
  {
    v48 -= (unint64_t)fabs(v47);
  }
LABEL_93:
  if ((*(_WORD *)&v28 & 0x8000) != 0)
  {
    v49 = 2654435761 * self->_sleepTimerStopMode;
    if ((*(_BYTE *)&v28 & 1) != 0)
      goto LABEL_95;
LABEL_100:
    v54 = 0;
    goto LABEL_103;
  }
  v49 = 0;
  if ((*(_BYTE *)&v28 & 1) == 0)
    goto LABEL_100;
LABEL_95:
  sleepTimerFireDate = self->_sleepTimerFireDate;
  v51 = -sleepTimerFireDate;
  if (sleepTimerFireDate >= 0.0)
    v51 = self->_sleepTimerFireDate;
  v52 = floor(v51 + 0.5);
  v53 = (v51 - v52) * 1.84467441e19;
  v54 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
  if (v53 >= 0.0)
  {
    if (v53 > 0.0)
      v54 += (unint64_t)v53;
  }
  else
  {
    v54 -= (unint64_t)fabs(v53);
  }
LABEL_103:
  v55 = -[_MRDictionaryProtobuf hash](self->_dialogOptions, "hash", v59);
  v56 = -[NSString hash](self->_lastSectionContentItemID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    v57 = 2654435761 * self->_supportsReferencePosition;
  else
    v57 = 0;
  return v89 ^ v90 ^ v88 ^ v87 ^ v85 ^ v84 ^ v83 ^ v86 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v33 ^ v34 ^ v39 ^ v60 ^ v48 ^ v49 ^ v54 ^ v55 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ii;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t jj;
  uint64_t v37;
  uint64_t v38;
  uint64_t kk;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t mm;
  _MRCommandOptionsProtobuf *proactiveCommandOptions;
  uint64_t v46;
  int v47;
  _MRDictionaryProtobuf *dialogOptions;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 80);
  if ((v6 & 8) != 0)
  {
    self->_command = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_has |= 8u;
    v6 = *((_DWORD *)v4 + 80);
    if ((v6 & 0x200000) == 0)
    {
LABEL_3:
      if ((v6 & 0x100000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_3;
  }
  self->_enabled = *((_BYTE *)v4 + 313);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)v4 + 80) & 0x100000) != 0)
  {
LABEL_4:
    self->_active = *((_BYTE *)v4 + 312);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_5:
  v7 = objc_msgSend(v4, "preferredIntervalsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "preferredIntervalAtIndex:", i);
      -[_MRCommandInfoProtobuf addPreferredInterval:](self, "addPreferredInterval:");
    }
  }
  if (*((_QWORD *)v5 + 25))
    -[_MRCommandInfoProtobuf setLocalizedTitle:](self, "setLocalizedTitle:");
  v10 = *((_DWORD *)v5 + 80);
  if ((v10 & 0x80) != 0)
  {
    self->_minimumRating = *((float *)v5 + 53);
    *(_DWORD *)&self->_has |= 0x80u;
    v10 = *((_DWORD *)v5 + 80);
  }
  if ((v10 & 0x40) != 0)
  {
    self->_maximumRating = *((float *)v5 + 52);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  v11 = objc_msgSend(v5, "supportedRatesCount");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
    {
      objc_msgSend(v5, "supportedRateAtIndex:", j);
      -[_MRCommandInfoProtobuf addSupportedRate:](self, "addSupportedRate:");
    }
  }
  if (*((_QWORD *)v5 + 24))
    -[_MRCommandInfoProtobuf setLocalizedShortTitle:](self, "setLocalizedShortTitle:");
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x800) != 0)
  {
    self->_repeatMode = *((_DWORD *)v5 + 62);
    *(_DWORD *)&self->_has |= 0x800u;
    v14 = *((_DWORD *)v5 + 80);
    if ((v14 & 0x1000) == 0)
    {
LABEL_21:
      if ((v14 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_82;
    }
  }
  else if ((v14 & 0x1000) == 0)
  {
    goto LABEL_21;
  }
  self->_shuffleMode = *((_DWORD *)v5 + 63);
  *(_DWORD *)&self->_has |= 0x1000u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x400) == 0)
  {
LABEL_22:
    if ((v14 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_83;
  }
LABEL_82:
  self->_presentationStyle = *((_DWORD *)v5 + 59);
  *(_DWORD *)&self->_has |= 0x400u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x4000) == 0)
  {
LABEL_23:
    if ((v14 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_84;
  }
LABEL_83:
  self->_skipInterval = *((_DWORD *)v5 + 65);
  *(_DWORD *)&self->_has |= 0x4000u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x100) == 0)
  {
LABEL_24:
    if ((v14 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_85;
  }
LABEL_84:
  self->_numAvailableSkips = *((_DWORD *)v5 + 54);
  *(_DWORD *)&self->_has |= 0x100u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x2000) == 0)
  {
LABEL_25:
    if ((v14 & 4) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_85:
  self->_skipFrequency = *((_DWORD *)v5 + 64);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 80) & 4) != 0)
  {
LABEL_26:
    self->_canScrub = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_27:
  v15 = objc_msgSend(v5, "supportedPlaybackQueueTypesCount");
  if (v15)
  {
    v16 = v15;
    for (k = 0; k != v16; ++k)
      -[_MRCommandInfoProtobuf addSupportedPlaybackQueueTypes:](self, "addSupportedPlaybackQueueTypes:", objc_msgSend(v5, "supportedPlaybackQueueTypesAtIndex:", k));
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v18 = *((id *)v5 + 34);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v63 != v21)
          objc_enumerationMutation(v18);
        -[_MRCommandInfoProtobuf addSupportedCustomQueueIdentifier:](self, "addSupportedCustomQueueIdentifier:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v20);
  }

  v23 = objc_msgSend(v5, "supportedInsertionPositionsCount");
  if (v23)
  {
    v24 = v23;
    for (n = 0; n != v24; ++n)
      -[_MRCommandInfoProtobuf addSupportedInsertionPositions:](self, "addSupportedInsertionPositions:", objc_msgSend(v5, "supportedInsertionPositionsAtIndex:", n));
  }
  v26 = *((_DWORD *)v5 + 80);
  if ((v26 & 0x10000) != 0)
  {
    self->_upNextItemCount = *((_DWORD *)v5 + 74);
    *(_DWORD *)&self->_has |= 0x10000u;
    v26 = *((_DWORD *)v5 + 80);
  }
  if ((v26 & 0x200) != 0)
  {
    self->_preferredPlaybackRate = *((float *)v5 + 58);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v27 = *((id *)v5 + 36);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v29; ++ii)
      {
        if (*(_QWORD *)v59 != v30)
          objc_enumerationMutation(v27);
        -[_MRCommandInfoProtobuf addSupportedPlaybackSessionTypes:](self, "addSupportedPlaybackSessionTypes:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * ii));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v29);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v32 = *((id *)v5 + 19);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v55;
    do
    {
      for (jj = 0; jj != v34; ++jj)
      {
        if (*(_QWORD *)v55 != v35)
          objc_enumerationMutation(v32);
        -[_MRCommandInfoProtobuf addCurrentPlaybackSessionTypes:](self, "addCurrentPlaybackSessionTypes:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * jj));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v34);
  }

  if (*((_QWORD *)v5 + 28))
    -[_MRCommandInfoProtobuf setPlaybackSessionIdentifier:](self, "setPlaybackSessionIdentifier:");
  if ((*((_BYTE *)v5 + 320) & 0x10) != 0)
  {
    self->_currentQueueEndAction = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  v37 = objc_msgSend(v5, "supportedQueueEndActionsCount");
  if (v37)
  {
    v38 = v37;
    for (kk = 0; kk != v38; ++kk)
      -[_MRCommandInfoProtobuf addSupportedQueueEndActions:](self, "addSupportedQueueEndActions:", objc_msgSend(v5, "supportedQueueEndActionsAtIndex:", kk));
  }
  if ((*((_BYTE *)v5 + 320) & 0x20) != 0)
  {
    self->_disabledReason = *((_DWORD *)v5 + 44);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v40 = *((id *)v5 + 35);
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v51;
    do
    {
      for (mm = 0; mm != v42; ++mm)
      {
        if (*(_QWORD *)v51 != v43)
          objc_enumerationMutation(v40);
        -[_MRCommandInfoProtobuf addSupportedPlaybackSessionIdentifiers:](self, "addSupportedPlaybackSessionIdentifiers:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * mm), (_QWORD)v50);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v42);
  }

  proactiveCommandOptions = self->_proactiveCommandOptions;
  v46 = *((_QWORD *)v5 + 30);
  if (proactiveCommandOptions)
  {
    if (v46)
      -[_MRCommandOptionsProtobuf mergeFrom:](proactiveCommandOptions, "mergeFrom:");
  }
  else if (v46)
  {
    -[_MRCommandInfoProtobuf setProactiveCommandOptions:](self, "setProactiveCommandOptions:");
  }
  v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x800000) != 0)
  {
    self->_vocalsControlActive = *((_BYTE *)v5 + 315);
    *(_DWORD *)&self->_has |= 0x800000u;
    v47 = *((_DWORD *)v5 + 80);
    if ((v47 & 0x20000) == 0)
    {
LABEL_91:
      if ((v47 & 0x40000) == 0)
        goto LABEL_92;
      goto LABEL_103;
    }
  }
  else if ((v47 & 0x20000) == 0)
  {
    goto LABEL_91;
  }
  self->_vocalsControlLevel = *((float *)v5 + 75);
  *(_DWORD *)&self->_has |= 0x20000u;
  v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x40000) == 0)
  {
LABEL_92:
    if ((v47 & 0x80000) == 0)
      goto LABEL_93;
    goto LABEL_104;
  }
LABEL_103:
  self->_vocalsControlMaxLevel = *((float *)v5 + 76);
  *(_DWORD *)&self->_has |= 0x40000u;
  v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x80000) == 0)
  {
LABEL_93:
    if ((v47 & 0x1000000) == 0)
      goto LABEL_94;
    goto LABEL_105;
  }
LABEL_104:
  self->_vocalsControlMinLevel = *((float *)v5 + 77);
  *(_DWORD *)&self->_has |= 0x80000u;
  v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x1000000) == 0)
  {
LABEL_94:
    if ((v47 & 2) == 0)
      goto LABEL_95;
    goto LABEL_106;
  }
LABEL_105:
  self->_vocalsControlContinuous = *((_BYTE *)v5 + 316);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 2) == 0)
  {
LABEL_95:
    if ((v47 & 0x8000) == 0)
      goto LABEL_96;
    goto LABEL_107;
  }
LABEL_106:
  self->_sleepTimerTime = *((double *)v5 + 17);
  *(_DWORD *)&self->_has |= 2u;
  v47 = *((_DWORD *)v5 + 80);
  if ((v47 & 0x8000) == 0)
  {
LABEL_96:
    if ((v47 & 1) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_107:
  self->_sleepTimerStopMode = *((_DWORD *)v5 + 66);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 80) & 1) != 0)
  {
LABEL_97:
    self->_sleepTimerFireDate = *((double *)v5 + 16);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_98:
  dialogOptions = self->_dialogOptions;
  v49 = *((_QWORD *)v5 + 21);
  if (dialogOptions)
  {
    if (v49)
      -[_MRDictionaryProtobuf mergeFrom:](dialogOptions, "mergeFrom:");
  }
  else if (v49)
  {
    -[_MRCommandInfoProtobuf setDialogOptions:](self, "setDialogOptions:");
  }
  if (*((_QWORD *)v5 + 23))
    -[_MRCommandInfoProtobuf setLastSectionContentItemID:](self, "setLastSectionContentItemID:");
  if ((*((_BYTE *)v5 + 322) & 0x40) != 0)
  {
    self->_supportsReferencePosition = *((_BYTE *)v5 + 314);
    *(_DWORD *)&self->_has |= 0x400000u;
  }

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)active
{
  return self->_active;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (void)setLocalizedShortTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedShortTitle, a3);
}

- (float)minimumRating
{
  return self->_minimumRating;
}

- (float)maximumRating
{
  return self->_maximumRating;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (int)skipInterval
{
  return self->_skipInterval;
}

- (int)numAvailableSkips
{
  return self->_numAvailableSkips;
}

- (int)skipFrequency
{
  return self->_skipFrequency;
}

- (int)canScrub
{
  return self->_canScrub;
}

- (NSMutableArray)supportedCustomQueueIdentifiers
{
  return self->_supportedCustomQueueIdentifiers;
}

- (void)setSupportedCustomQueueIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCustomQueueIdentifiers, a3);
}

- (int)upNextItemCount
{
  return self->_upNextItemCount;
}

- (float)preferredPlaybackRate
{
  return self->_preferredPlaybackRate;
}

- (NSMutableArray)supportedPlaybackSessionTypes
{
  return self->_supportedPlaybackSessionTypes;
}

- (void)setSupportedPlaybackSessionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPlaybackSessionTypes, a3);
}

- (NSMutableArray)currentPlaybackSessionTypes
{
  return self->_currentPlaybackSessionTypes;
}

- (void)setCurrentPlaybackSessionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlaybackSessionTypes, a3);
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (void)setPlaybackSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, a3);
}

- (NSMutableArray)supportedPlaybackSessionIdentifiers
{
  return self->_supportedPlaybackSessionIdentifiers;
}

- (void)setSupportedPlaybackSessionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPlaybackSessionIdentifiers, a3);
}

- (_MRCommandOptionsProtobuf)proactiveCommandOptions
{
  return self->_proactiveCommandOptions;
}

- (void)setProactiveCommandOptions:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveCommandOptions, a3);
}

- (BOOL)vocalsControlActive
{
  return self->_vocalsControlActive;
}

- (float)vocalsControlLevel
{
  return self->_vocalsControlLevel;
}

- (float)vocalsControlMaxLevel
{
  return self->_vocalsControlMaxLevel;
}

- (float)vocalsControlMinLevel
{
  return self->_vocalsControlMinLevel;
}

- (BOOL)vocalsControlContinuous
{
  return self->_vocalsControlContinuous;
}

- (double)sleepTimerTime
{
  return self->_sleepTimerTime;
}

- (double)sleepTimerFireDate
{
  return self->_sleepTimerFireDate;
}

- (_MRDictionaryProtobuf)dialogOptions
{
  return self->_dialogOptions;
}

- (void)setDialogOptions:(id)a3
{
  objc_storeStrong((id *)&self->_dialogOptions, a3);
}

- (NSString)lastSectionContentItemID
{
  return self->_lastSectionContentItemID;
}

- (void)setLastSectionContentItemID:(id)a3
{
  objc_storeStrong((id *)&self->_lastSectionContentItemID, a3);
}

- (BOOL)supportsReferencePosition
{
  return self->_supportsReferencePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlaybackSessionTypes, 0);
  objc_storeStrong((id *)&self->_supportedPlaybackSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedCustomQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_proactiveCommandOptions, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
  objc_storeStrong((id *)&self->_lastSectionContentItemID, 0);
  objc_storeStrong((id *)&self->_dialogOptions, 0);
  objc_storeStrong((id *)&self->_currentPlaybackSessionTypes, 0);
}

@end
