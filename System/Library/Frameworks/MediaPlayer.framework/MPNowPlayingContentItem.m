@implementation MPNowPlayingContentItem

- (void)setExternalContentIdentifier:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem externalContentIdentifier](self, "externalContentIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetContentIdentifier();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__MPNowPlayingContentItem_setExternalContentIdentifier___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)externalContentIdentifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetContentIdentifier();
}

- (void)setSharableItem:(BOOL)a3
{
  self->_sharableItem = a3;
}

- (void)setDuration:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  MPNowPlayingContentItem *v9;
  _QWORD v10[5];

  -[MPNowPlayingContentItem duration](self, "duration");
  v6 = -v5;
  if (v5 >= 0.0)
    v6 = v5;
  if (v6 > 2.22044605e-16)
    goto LABEL_7;
  v7 = -a3;
  if (a3 >= 0.0)
    v7 = a3;
  if (v7 > 2.22044605e-16)
  {
LABEL_7:
    v8 = v5 - a3;
    if (v8 < 0.0)
      v8 = -v8;
    if (v8 > 2.22044605e-16)
    {
      v9 = objc_retainAutorelease(self);
      -[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem");
      MRContentItemSetDuration();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __39__MPNowPlayingContentItem_setDuration___block_invoke;
      v10[3] = &__block_descriptor_40_e9_v16__0_v8l;
      *(double *)&v10[4] = a3;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v9, "_postItemChangedNotificationWithDeltaBlock:", v10);
    }
  }
}

- (double)duration
{
  double result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetDuration();
  return result;
}

- (void)setAlbumName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem albumName](self, "albumName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetAlbumName();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__MPNowPlayingContentItem_setAlbumName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)albumName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetAlbumName();
}

- (unint64_t)mediaType
{
  MPNowPlayingContentItem *v2;
  uint64_t MediaType;
  uint64_t v4;
  unint64_t result;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  v2 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v2, "_mediaRemoteContentItem");
  MediaType = MRContentItemGetMediaType();
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(v2), "_mediaRemoteContentItem");
  v4 = MRContentItemGetMediaSubType() - 1;
  result = 512;
  switch(v4)
  {
    case 0:
      if (MediaType == 1)
        return 1;
      else
        return (unint64_t)(MediaType == 2) << 11;
    case 1:
      return result;
    case 2:
      return 256;
    case 3:
      v6 = (unint64_t)(MediaType == 2) << 10;
      v7 = MediaType == 1;
      v8 = 2;
      goto LABEL_9;
    case 4:
      return 4;
    case 5:
      v6 = (unint64_t)(MediaType == 2) << 12;
      v7 = MediaType == 1;
      v8 = 8;
LABEL_9:
      if (v7)
        return v8;
      else
        return v6;
    case 6:
      if (MediaType != 2)
        goto LABEL_14;
      result = 0x2000;
      break;
    default:
LABEL_14:
      result = 0;
      break;
  }
  return result;
}

- (NSDictionary)userInfo
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSDictionary *)(id)MRContentItemCopyUserInfo();
}

- (NSDictionary)deviceSpecificUserInfo
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSDictionary *)(id)MRContentItemCopyDeviceSpecificUserInfo();
}

- (int64_t)storeID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetITunesStoreIdentifier();
}

- (int64_t)storeSubscriptionID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetITunesStoreSubscriptionIdentifier();
}

- (int64_t)reportingAdamID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetReportingAdamID();
}

- (int64_t)lyricsAdamID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetLyricsAdamID();
}

- (void)setUserInfo:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetUserInfo();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__MPNowPlayingContentItem_setUserInfo___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (void)setStoreID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem storeID](self, "storeID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetITunesStoreIdentifier();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__MPNowPlayingContentItem_setStoreID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (void)setMediaType:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MPNowPlayingContentItem *v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[6];

  if (-[MPNowPlayingContentItem mediaType](self, "mediaType") != a3)
  {
    if ((_BYTE)a3)
      v5 = 1;
    else
      v5 = 2 * ((a3 & 0xFF00) != 0);
    v6 = 1;
    if ((uint64_t)a3 <= 511)
    {
      switch(a3)
      {
        case 1uLL:
          goto LABEL_21;
        case 2uLL:
          goto LABEL_15;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_20;
        case 4uLL:
          v6 = 5;
          break;
        case 8uLL:
          goto LABEL_16;
        default:
          if (a3 != 256)
            goto LABEL_20;
          v6 = 3;
          break;
      }
      goto LABEL_21;
    }
    if ((uint64_t)a3 <= 2047)
    {
      if (a3 == 512)
      {
        v6 = 2;
        goto LABEL_21;
      }
      if (a3 == 1024)
      {
LABEL_15:
        v6 = 4;
        goto LABEL_21;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x800uLL:
LABEL_21:
          v7 = objc_retainAutorelease(self);
          -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
          MRContentItemSetMediaType();
          v8 = objc_retainAutorelease(v7);
          -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
          MRContentItemSetMediaSubType();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __40__MPNowPlayingContentItem_setMediaType___block_invoke;
          v9[3] = &__block_descriptor_48_e9_v16__0_v8l;
          v9[4] = v5;
          v9[5] = v6;
          -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);
          return;
        case 0x1000uLL:
LABEL_16:
          v6 = 6;
          goto LABEL_21;
        case 0x2000uLL:
          v6 = 7;
          goto LABEL_21;
      }
    }
LABEL_20:
    v5 = 0;
    v6 = 0;
    goto LABEL_21;
  }
}

- (void)setHasDescription:(BOOL)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPNowPlayingContentItem hasDescription](self, "hasDescription") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetHasInfo();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__MPNowPlayingContentItem_setHasDescription___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)hasDescription
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetHasInfo();
}

- (void)setHasArtwork:(BOOL)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPNowPlayingContentItem hasArtwork](self, "hasArtwork") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetHasArtworkData();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__MPNowPlayingContentItem_setHasArtwork___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)hasArtwork
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetHasArtworkData();
}

- (void)setElapsedTime:(double)a3
{
  double v5;
  double v6;
  uint64_t v7;
  MPNowPlayingContentItem *v8;
  MPNowPlayingContentItem *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  -[MPNowPlayingContentItem elapsedTime](self, "elapsedTime");
  v6 = v5 - a3;
  if (v6 < 0.0)
    v6 = -v6;
  v7 = MEMORY[0x1E0C809B0];
  if (v6 > 2.22044605e-16
    || (v8 = objc_retainAutorelease(self),
        -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem"),
        !MRContentItemGetHasElapsedTime())
    || !v8->_didSetElapsedTime)
  {
    v9 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem");
    MRContentItemSetElapsedTime();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __42__MPNowPlayingContentItem_setElapsedTime___block_invoke;
    v11[3] = &__block_descriptor_40_e9_v16__0_v8l;
    *(double *)&v11[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v9, "_postItemChangedNotificationWithDeltaBlock:", v11);
  }
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __42__MPNowPlayingContentItem_setElapsedTime___block_invoke_2;
  v10[3] = &unk_1E315EE38;
  v10[4] = self;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](self, "_postItemChangedNotificationWithDeltaBlock:", v10);
}

- (double)elapsedTime
{
  double result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetElapsedTime();
  return result;
}

- (void)setEditingStyleFlags:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem editingStyleFlags](self, "editingStyleFlags") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetEditingStyleFlags();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__MPNowPlayingContentItem_setEditingStyleFlags___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)editingStyleFlags
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetEditingStyleFlags() & 3;
}

- (void)setDeviceSpecificUserInfo:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetDeviceSpecificUserInfo();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__MPNowPlayingContentItem_setDeviceSpecificUserInfo___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (void)setLegacyUniqueID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem legacyUniqueID](self, "legacyUniqueID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetLegacyUniqueIdentifier();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__MPNowPlayingContentItem_setLegacyUniqueID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)legacyUniqueID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetLegacyUniqueIdentifier();
}

- (void)setPlaybackRate:(float)a3
{
  float v5;
  float v6;
  MPNowPlayingContentItem *v7;
  _QWORD v8[4];
  float v9;

  -[MPNowPlayingContentItem playbackRate](self, "playbackRate");
  v6 = v5 - a3;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 0.00000011921
    || (-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"),
        (MRContentItemHasPlaybackRate() & 1) == 0))
  {
    v7 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
    MRContentItemSetPlaybackRate();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__MPNowPlayingContentItem_setPlaybackRate___block_invoke;
    v8[3] = &__block_descriptor_36_e9_v16__0_v8l;
    v9 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v7, "_postItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (float)playbackRate
{
  float result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetPlaybackRate();
  return result;
}

- (void)setTrackArtistName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem trackArtistName](self, "trackArtistName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetTrackArtistName();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__MPNowPlayingContentItem_setTrackArtistName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)trackArtistName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetTrackArtistName();
}

- (void)setAlbumArtistName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem albumArtistName](self, "albumArtistName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetAlbumArtistName();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__MPNowPlayingContentItem_setAlbumArtistName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)albumArtistName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetAlbumArtistName();
}

- (void)setStoreAlbumID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem storeAlbumID](self, "storeAlbumID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetITunesStoreAlbumIdentifier();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setStoreAlbumID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)storeAlbumID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetITunesStoreAlbumIdentifier();
}

- (void)setInfo:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem info](self, "info");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetInfo();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__MPNowPlayingContentItem_setInfo___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)info
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetInfo();
}

- (void)setDefaultPlaybackRate:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  MPNowPlayingContentItem *v9;
  _QWORD v10[4];
  float v11;

  -[MPNowPlayingContentItem defaultPlaybackRate](self, "defaultPlaybackRate");
  v6 = -v5;
  if (v5 >= 0.0)
    v6 = v5;
  if (v6 > 0.00000011921)
    goto LABEL_7;
  v7 = -a3;
  if (a3 >= 0.0)
    v7 = a3;
  if (v7 > 0.00000011921)
  {
LABEL_7:
    v8 = v5 - a3;
    if (v8 < 0.0)
      v8 = -v8;
    if (v8 > 0.00000011921)
    {
      v9 = objc_retainAutorelease(self);
      -[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem");
      MRContentItemSetDefaultPlaybackRate();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __50__MPNowPlayingContentItem_setDefaultPlaybackRate___block_invoke;
      v10[3] = &__block_descriptor_36_e9_v16__0_v8l;
      v11 = a3;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v9, "_postItemChangedNotificationWithDeltaBlock:", v10);
    }
  }
}

- (float)defaultPlaybackRate
{
  float result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetDefaultPlaybackRate();
  return result;
}

uint64_t __48__MPNowPlayingContentItem_setArtworkIdentifier___block_invoke()
{
  return MRContentItemSetArtworkIdentifier();
}

uint64_t __45__MPNowPlayingContentItem_setNowPlayingInfo___block_invoke()
{
  return MRContentItemSetNowPlayingInfo();
}

uint64_t __40__MPNowPlayingContentItem_setAlbumName___block_invoke()
{
  return MRContentItemSetAlbumName();
}

- (void)setStoreSubscriptionID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem storeSubscriptionID](self, "storeSubscriptionID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetITunesStoreSubscriptionIdentifier();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__MPNowPlayingContentItem_setStoreSubscriptionID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (void)setReportingAdamID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem reportingAdamID](self, "reportingAdamID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetReportingAdamID();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__MPNowPlayingContentItem_setReportingAdamID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (void)setLyricsAdamID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem lyricsAdamID](self, "lyricsAdamID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetLyricsAdamID();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setLyricsAdamID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (void)setHasLyrics:(BOOL)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPNowPlayingContentItem hasLyrics](self, "hasLyrics") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetHasLyrics();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__MPNowPlayingContentItem_setHasLyrics___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)hasLyrics
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetHasLyrics();
}

uint64_t __56__MPNowPlayingContentItem_setExternalContentIdentifier___block_invoke()
{
  return MRContentItemSetContentIdentifier();
}

uint64_t __53__MPNowPlayingContentItem_setDeviceSpecificUserInfo___block_invoke()
{
  return MRContentItemSetDeviceSpecificUserInfo();
}

uint64_t __51__MPNowPlayingContentItem_setCollectionIdentifier___block_invoke()
{
  return MRContentItemSetCollectionIdentifier();
}

uint64_t __50__MPNowPlayingContentItem_setDefaultPlaybackRate___block_invoke()
{
  return MRContentItemSetDefaultPlaybackRate();
}

uint64_t __46__MPNowPlayingContentItem_setTrackArtistName___block_invoke()
{
  return MRContentItemSetTrackArtistName();
}

uint64_t __46__MPNowPlayingContentItem_setAlbumArtistName___block_invoke()
{
  return MRContentItemSetAlbumArtistName();
}

uint64_t __45__MPNowPlayingContentItem_setLegacyUniqueID___block_invoke()
{
  return MRContentItemSetLegacyUniqueIdentifier();
}

uint64_t __45__MPNowPlayingContentItem_setHasDescription___block_invoke()
{
  return MRContentItemSetHasInfo();
}

uint64_t __43__MPNowPlayingContentItem_setStoreAlbumID___block_invoke()
{
  return MRContentItemSetITunesStoreAlbumIdentifier();
}

uint64_t __43__MPNowPlayingContentItem_setPlaybackRate___block_invoke()
{
  return MRContentItemSetPlaybackRate();
}

uint64_t __42__MPNowPlayingContentItem_setReleaseDate___block_invoke()
{
  return MRContentItemSetReleaseDate();
}

uint64_t __42__MPNowPlayingContentItem_setEpisodeType___block_invoke_2()
{
  return MRContentItemSetEpisodeType();
}

uint64_t __42__MPNowPlayingContentItem_setElapsedTime___block_invoke_2(uint64_t a1)
{
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "_mediaRemoteContentItem");
  MRContentItemGetElapsedTimeTimestamp();
  return MRContentItemSetElapsedTimeTimestamp();
}

uint64_t __42__MPNowPlayingContentItem_setElapsedTime___block_invoke()
{
  return MRContentItemSetElapsedTime();
}

uint64_t __41__MPNowPlayingContentItem_setHasArtwork___block_invoke()
{
  return MRContentItemSetHasArtworkData();
}

uint64_t __40__MPNowPlayingContentItem_setMediaType___block_invoke()
{
  MRContentItemSetMediaType();
  return MRContentItemSetMediaSubType();
}

uint64_t __39__MPNowPlayingContentItem_setUserInfo___block_invoke()
{
  return MRContentItemSetUserInfo();
}

uint64_t __39__MPNowPlayingContentItem_setDuration___block_invoke()
{
  return MRContentItemSetDuration();
}

uint64_t __38__MPNowPlayingContentItem_setStoreID___block_invoke()
{
  return MRContentItemSetITunesStoreIdentifier();
}

- (MPNowPlayingInfoLyricsItem)lyrics
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return -[MPNowPlayingInfoLyricsItem initWithMediaRemoteLyricsItem:]([MPNowPlayingInfoLyricsItem alloc], "initWithMediaRemoteLyricsItem:", MRContentItemGetLyrics());
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

- (void)setNumberOfChildren:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem numberOfChildren](self, "numberOfChildren") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetNumberOfSections();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__MPNowPlayingContentItem_setNumberOfChildren___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
  -[MPNowPlayingContentItem invalidateSections](self, "invalidateSections");
}

- (int64_t)numberOfChildren
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetNumberOfSections();
}

- (void)setSeasonNumber:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem seasonNumber](self, "seasonNumber") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetSeasonNumber();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setSeasonNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)seasonNumber
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetSeasonNumber();
}

- (void)setEpisodeNumber:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem episodeNumber](self, "episodeNumber") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetEpisodeNumber();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__MPNowPlayingContentItem_setEpisodeNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)episodeNumber
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetEpisodeNumber();
}

- (void)setCollectionIdentifier:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem collectionIdentifier](self, "collectionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetCollectionIdentifier();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MPNowPlayingContentItem_setCollectionIdentifier___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)collectionIdentifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetCollectionIdentifier();
}

- (void)setPlayCount:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem playCount](self, "playCount") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetPlayCount();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__MPNowPlayingContentItem_setPlayCount___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)playCount
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetPlayCount();
}

- (void)setEpisodeType:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem episodeType](self, "episodeType") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetEpisodeType();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__MPNowPlayingContentItem_setEpisodeType___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)episodeType
{
  int64_t result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  result = MRContentItemGetEpisodeType();
  if ((unint64_t)(result - 1) >= 6)
    return 0;
  return result;
}

- (NSString)localizedDurationString
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetLocalizedDurationString();
}

- (double)elapsedTimeTimestamp
{
  double result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetElapsedTimeTimestamp();
  return result;
}

- (void)setReleaseDate:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem releaseDate](self, "releaseDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetReleaseDate();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__MPNowPlayingContentItem_setReleaseDate___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSDate)releaseDate
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSDate *)MRContentItemGetReleaseDate();
}

- (void)setLoading:(BOOL)a3
{
  void *v5;
  char v6;
  MPNowPlayingContentItem *v7;
  _QWORD v8[4];
  BOOL v9;

  if (-[MPNowPlayingContentItem isLoading](self, "isLoading") != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasLoading"), v5, (v6 & 1) == 0))
  {
    v7 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
    MRContentItemSetIsLoading();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__MPNowPlayingContentItem_setLoading___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v9 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v7, "_postItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (BOOL)isLoading
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsLoading();
}

- (void)setAlwaysLiveItem:(BOOL)a3
{
  void *v5;
  char v6;
  MPNowPlayingContentItem *v7;
  _QWORD v8[4];
  BOOL v9;

  if (-[MPNowPlayingContentItem isAlwaysLiveItem](self, "isAlwaysLiveItem") != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasAlwaysLive"), v5, (v6 & 1) == 0))
  {
    v7 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
    MRContentItemSetIsAlwaysLive();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__MPNowPlayingContentItem_setAlwaysLiveItem___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v9 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v7, "_postItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (BOOL)isAlwaysLiveItem
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsAlwaysLive();
}

- (void)setSongTraits:(unint64_t)a3
{
  MPNowPlayingContentItem *v5;
  void *v6;
  _QWORD v7[5];

  if (-[MPNowPlayingContentItem songTraits](self, "songTraits") != a3)
  {
    v5 = objc_retainAutorelease(self);
    objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSongTraits:", a3 & 0x3F);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__MPNowPlayingContentItem_setSongTraits___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v7);
  }
}

- (NSArray)alternativeFormats
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternativeFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "msv_map:", &__block_literal_global_124_37438);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (MPNowPlayingInfoAudioRoute)audioRoute
{
  void *v2;
  void *v3;
  id v4;
  MPNowPlayingInfoAudioRoute *v5;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  v5 = -[MPNowPlayingInfoAudioRoute initWithMediaRemoteAudioRoute:]([MPNowPlayingInfoAudioRoute alloc], "initWithMediaRemoteAudioRoute:", v4);

  return v5;
}

- (int64_t)activeFormatJustification
{
  void *v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeFormatJustification");

  if (v3 == 1000)
    v4 = 1000;
  else
    v4 = 0;
  if (v3 == 501)
    v4 = 501;
  if (v3 == 500)
    v4 = 500;
  if (v3 == 101)
    v5 = 101;
  else
    v5 = 0;
  if (v3 == 100)
    v5 = 100;
  if (v3 == 1)
    v5 = 1;
  if (v3 <= 499)
    return v5;
  else
    return v4;
}

- (void)setFormatTierPreference:(unint64_t)a3
{
  MPNowPlayingContentItem *v5;
  void *v6;
  _QWORD v7[5];

  if (-[MPNowPlayingContentItem formatTierPreference](self, "formatTierPreference") != a3)
  {
    v5 = objc_retainAutorelease(self);
    objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFormatTierPreference:", a3 & 0x1F);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__MPNowPlayingContentItem_setFormatTierPreference___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v7);
  }
}

- (unint64_t)formatTierPreference
{
  void *v2;
  char v3;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "formatTierPreference");

  return v3 & 0x1F;
}

- (MPNowPlayingInfoAudioFormat)preferredFormat
{
  void *v2;
  void *v3;
  id v4;
  MPNowPlayingInfoAudioFormat *v5;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  v5 = -[MPNowPlayingInfoAudioFormat initWithMediaRemoteAudioFormat:]([MPNowPlayingInfoAudioFormat alloc], "initWithMediaRemoteAudioFormat:", v4);

  return v5;
}

- (MPNowPlayingInfoAudioFormat)activeFormat
{
  void *v2;
  void *v3;
  id v4;
  MPNowPlayingInfoAudioFormat *v5;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  v5 = -[MPNowPlayingInfoAudioFormat initWithMediaRemoteAudioFormat:]([MPNowPlayingInfoAudioFormat alloc], "initWithMediaRemoteAudioFormat:", v4);

  return v5;
}

- (unint64_t)songTraits
{
  void *v2;
  char v3;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "songTraits");

  return v3 & 0x3F;
}

- (void)setArtworkIdentifier:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem artworkIdentifier](self, "artworkIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetArtworkIdentifier();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MPNowPlayingContentItem_setArtworkIdentifier___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)artworkIdentifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetArtworkIdentifier();
}

- (void)_mergeContentItem:(id)a3
{
  MPNowPlayingContentItem *v4;
  id v5;
  id v6;

  v4 = objc_retainAutorelease(self);
  v5 = a3;
  -[MPContentItem _mediaRemoteContentItem](v4, "_mediaRemoteContentItem");
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "_mediaRemoteContentItem");

  MRContentItemMerge();
}

- (id)copyWithZone:(_NSZone *)a3
{
  const void *v3;
  void *v4;

  v3 = (const void *)MEMORY[0x1940378DC](-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"));
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithMediaRemoteContentItem:", v3);
  CFRelease(v3);
  return v4;
}

- (NSDictionary)auxiliaryNowPlayingInfo
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSDictionary *)(id)MRContentItemCopyAuxiliaryNowPlayingInfo();
}

- (void)setStoreArtistID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem storeArtistID](self, "storeArtistID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetITunesStoreArtistIdentifier();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__MPNowPlayingContentItem_setStoreArtistID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)storeArtistID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetITunesStoreArtistIdentifier();
}

- (void)setCollectionInfo:(id)a3
{
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[MPNowPlayingContentItem collectionInfo](self, "collectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  MPNowPlayingCollectionInfoToMediaRemote(v4);
  MRContentItemSetCollectionInfo();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MPNowPlayingContentItem_setCollectionInfo___block_invoke_2;
  v8[3] = &unk_1E315EE38;
  v9 = v4;
  v7 = v4;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v6, "_postItemChangedNotificationWithDeltaBlock:", v8);

}

- (NSDictionary)collectionInfo
{
  void *v2;
  void *v3;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  v2 = (void *)MRContentItemCopyCollectionInfo();
  MPMediaRemoteCollectionInfoToNowPlaying(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setTotalTrackCount:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem totalTrackCount](self, "totalTrackCount") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetTotalTrackCount();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__MPNowPlayingContentItem_setTotalTrackCount___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)totalTrackCount
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetTotalTrackCount();
}

- (NSArray)currentLanguageOptions
{
  const __CFArray *CurrentLanguageOptions;
  id v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  MPNowPlayingInfoLanguageOption *v7;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  CurrentLanguageOptions = (const __CFArray *)MRContentItemGetCurrentLanguageOptions();
  if (CurrentLanguageOptions)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    Count = CFArrayGetCount(CurrentLanguageOptions);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        v7 = -[MPNowPlayingInfoLanguageOption initWithMRLanguageOption:]([MPNowPlayingInfoLanguageOption alloc], "initWithMRLanguageOption:", CFArrayGetValueAtIndex(CurrentLanguageOptions, i));
        objc_msgSend(v3, "addObject:", v7);

      }
    }
    CurrentLanguageOptions = (const __CFArray *)objc_msgSend(v3, "copy");

  }
  return (NSArray *)CurrentLanguageOptions;
}

- (NSArray)availableLanguageOptions
{
  const __CFArray *AvailableLanguageOptions;
  id v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  MPNowPlayingInfoLanguageOptionGroup *v7;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  AvailableLanguageOptions = (const __CFArray *)MRContentItemGetAvailableLanguageOptions();
  if (AvailableLanguageOptions)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    Count = CFArrayGetCount(AvailableLanguageOptions);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        v7 = -[MPNowPlayingInfoLanguageOptionGroup initWithMRLanguageOptionGroup:]([MPNowPlayingInfoLanguageOptionGroup alloc], "initWithMRLanguageOptionGroup:", CFArrayGetValueAtIndex(AvailableLanguageOptions, i));
        objc_msgSend(v3, "addObject:", v7);

      }
    }
    AvailableLanguageOptions = (const __CFArray *)objc_msgSend(v3, "copy");

  }
  return (NSArray *)AvailableLanguageOptions;
}

- (NSDictionary)nowPlayingInfo
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSDictionary *)(id)MRContentItemCopyNowPlayingInfo();
}

- (void)setAlbumYear:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem albumYear](self, "albumYear");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetAlbumYear();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__MPNowPlayingContentItem_setAlbumYear___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)albumYear
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)(id)MRContentItemCopyAlbumYear();
}

- (void)setStartTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  MPNowPlayingContentItem *v9;
  _QWORD v10[5];

  -[MPNowPlayingContentItem startTime](self, "startTime");
  v6 = -v5;
  if (v5 >= 0.0)
    v6 = v5;
  if (v6 > 2.22044605e-16)
    goto LABEL_7;
  v7 = -a3;
  if (a3 >= 0.0)
    v7 = a3;
  if (v7 > 2.22044605e-16)
  {
LABEL_7:
    v8 = v5 - a3;
    if (v8 < 0.0)
      v8 = -v8;
    if (v8 > 2.22044605e-16)
    {
      v9 = objc_retainAutorelease(self);
      -[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem");
      MRContentItemSetStartTime();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40__MPNowPlayingContentItem_setStartTime___block_invoke;
      v10[3] = &__block_descriptor_40_e9_v16__0_v8l;
      *(double *)&v10[4] = a3;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v9, "_postItemChangedNotificationWithDeltaBlock:", v10);
    }
  }
}

- (double)startTime
{
  double result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetStartTime();
  return result;
}

- (void)setComposerName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem composerName](self, "composerName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetComposer();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__MPNowPlayingContentItem_setComposerName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)composerName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetComposer();
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MPNowPlayingContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = objc_retainAutorelease(self);
      objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem"), "setAssociatedParticipantIdentifier:", v4);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62__MPNowPlayingContentItem_setAssociatedParticipantIdentifier___block_invoke;
      v9[3] = &unk_1E315EE38;
      v10 = v4;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

    }
  }

}

- (NSString)associatedParticipantIdentifier
{
  return (NSString *)objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "associatedParticipantIdentifier");
}

- (void)setStoreAlbumArtistID:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem storeAlbumArtistID](self, "storeAlbumArtistID") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetITunesStoreAlbumArtistIdentifier();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__MPNowPlayingContentItem_setStoreAlbumArtistID___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)storeAlbumArtistID
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetITunesStoreAlbumArtistIdentifier();
}

- (void)setDiscNumber:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem discNumber](self, "discNumber") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetDiscNumber();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__MPNowPlayingContentItem_setDiscNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)discNumber
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetDiscNumber();
}

- (void)setTrackNumber:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem trackNumber](self, "trackNumber") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetTrackNumber();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__MPNowPlayingContentItem_setTrackNumber___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)trackNumber
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetTrackNumber();
}

- (void)setTotalDiscCount:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem totalDiscCount](self, "totalDiscCount") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetTotalDiscCount();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__MPNowPlayingContentItem_setTotalDiscCount___block_invoke;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)totalDiscCount
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetTotalDiscCount();
}

- (void)setLyrics:(id)a3
{
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[MPNowPlayingContentItem lyrics](self, "lyrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  objc_msgSend(v4, "mediaRemoteLyricsItem");
  MRContentItemSetLyrics();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__MPNowPlayingContentItem_setLyrics___block_invoke_2;
  v8[3] = &unk_1E315EE38;
  v9 = v4;
  v7 = v4;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v6, "_postItemChangedNotificationWithDeltaBlock:", v8);

}

- (void)setRadioStationStringIdentifier:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem radioStationStringIdentifier](self, "radioStationStringIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetRadioStationString();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__MPNowPlayingContentItem_setRadioStationStringIdentifier___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)radioStationStringIdentifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetRadioStationString();
}

- (void)setRadioStationName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem radioStationName](self, "radioStationName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetRadioStationName();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__MPNowPlayingContentItem_setRadioStationName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)radioStationName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetRadioStationName();
}

- (void)setGenreName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem genreName](self, "genreName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetGenre();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__MPNowPlayingContentItem_setGenreName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)genreName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetGenre();
}

- (void)setNowPlayingInfo:(id)a3
{
  NSDictionary *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  MPNowPlayingContentItem *v8;
  NSDictionary *v9;
  NSDictionary *nowPlayingInfo;
  _QWORD v11[4];
  NSDictionary *v12;

  v5 = self->_nowPlayingInfo;
  v6 = objc_retainAutorelease(self);
  v7 = a3;
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  MRContentItemSetNowPlayingInfo();

  v8 = objc_retainAutorelease(v6);
  -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
  v9 = (NSDictionary *)MRContentItemCopyAuxiliaryNowPlayingInfo();
  if (!-[NSDictionary isEqualToDictionary:](v5, "isEqualToDictionary:", v9))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__MPNowPlayingContentItem_setNowPlayingInfo___block_invoke;
    v11[3] = &unk_1E315EE38;
    v12 = v9;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v11);

  }
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = v9;

}

- (void)invalidateArtwork
{
  void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPContentItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeArtwork();
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)MRContentItemCreate();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest");
  v9[1] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v8);

  CFRelease(v4);
  CFRelease(v6);
}

- (id)copyWithNewIdentifier:(id)a3
{
  MPNowPlayingContentItem *v4;
  id v5;
  const void *v6;
  void *v7;

  v4 = objc_retainAutorelease(self);
  v5 = a3;
  -[MPContentItem _mediaRemoteContentItem](v4, "_mediaRemoteContentItem");
  v6 = (const void *)MRContentItemCopyWithIdentifier();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithMediaRemoteContentItem:", v6);
  CFRelease(v6);
  return v7;
}

- (NSString)directorName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetDirectorName();
}

- (void)setDirectorName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem directorName](self, "directorName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetDirectorName();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__MPNowPlayingContentItem_setDirectorName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)localizedContentRating
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetLocalizedContentRating();
}

- (void)setLocalizedContentRating:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem localizedContentRating](self, "localizedContentRating");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetLocalizedContentRating();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__MPNowPlayingContentItem_setLocalizedContentRating___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)profileIdentifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetProfileIdentifier();
}

- (void)setProfileIdentifier:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem profileIdentifier](self, "profileIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetProfileIdentifier();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MPNowPlayingContentItem_setProfileIdentifier___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)seriesName
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetSeriesName();
}

- (void)setSeriesName:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem seriesName](self, "seriesName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetSeriesName();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__MPNowPlayingContentItem_setSeriesName___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)artworkURL
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetArtworkURL();
}

- (void)setArtworkURL:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem artworkURL](self, "artworkURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetArtworkURL();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__MPNowPlayingContentItem_setArtworkURL___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSArray)artworkURLTemplates
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSArray *)MRContentItemGetArtworkURLTemplates();
}

- (void)setArtworkURLTemplates:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem artworkURLTemplates](self, "artworkURLTemplates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetArtworkURLTemplates();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__MPNowPlayingContentItem_setArtworkURLTemplates___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (void)setLocalizedDurationString:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem localizedDurationString](self, "localizedDurationString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetLocalizedDurationString();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__MPNowPlayingContentItem_setLocalizedDurationString___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)durationStringLocalizationKey
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetDurationStringLocalizationKey();
}

- (void)setDurationStringLocalizationKey:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem durationStringLocalizationKey](self, "durationStringLocalizationKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetDurationStringLocalizationKey();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__MPNowPlayingContentItem_setDurationStringLocalizationKey___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)serviceIdentifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetServiceIdentifier();
}

- (void)setServiceIdentifier:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  int v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = (unint64_t)a3;
  -[MPNowPlayingContentItem serviceIdentifier](self, "serviceIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == (id)v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!(v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetServiceIdentifier();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MPNowPlayingContentItem_setServiceIdentifier___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = (id)v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (BOOL)isAdvertisement
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsAdvertisement();
}

- (void)setAdvertisement:(BOOL)a3
{
  void *v5;
  char v6;
  MPNowPlayingContentItem *v7;
  _QWORD v8[4];
  BOOL v9;

  if (-[MPNowPlayingContentItem isAdvertisement](self, "isAdvertisement") != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasAdvertisement"), v5, (v6 & 1) == 0))
  {
    v7 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
    MRContentItemSetIsAdvertisement();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__MPNowPlayingContentItem_setAdvertisement___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v9 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v7, "_postItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (BOOL)isSteerable
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsSteerable();
}

- (void)setSteerable:(BOOL)a3
{
  void *v5;
  char v6;
  MPNowPlayingContentItem *v7;
  _QWORD v8[4];
  BOOL v9;

  if (-[MPNowPlayingContentItem isSteerable](self, "isSteerable") != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasSteerable"), v5, (v6 & 1) == 0))
  {
    v7 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
    MRContentItemSetIsSteerable();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__MPNowPlayingContentItem_setSteerable___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v9 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v7, "_postItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (BOOL)isInTransition
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsInTransition();
}

- (void)setInTransition:(BOOL)a3
{
  void *v5;
  char v6;
  MPNowPlayingContentItem *v7;
  _QWORD v8[4];
  BOOL v9;

  if (-[MPNowPlayingContentItem isInTransition](self, "isInTransition") != a3
    || (objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasInTransition"), v5, (v6 & 1) == 0))
  {
    v7 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v7, "_mediaRemoteContentItem");
    MRContentItemSetIsInTransition();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__MPNowPlayingContentItem_setInTransition___block_invoke;
    v8[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v9 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v7, "_postItemChangedNotificationWithDeltaBlock:", v8);
  }
}

- (NSArray)supportedRemoteArtworkFormats
{
  return (NSArray *)objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "availableRemoteArtworkFormats");
}

- (void)setSupportedRemoteArtworkFormats:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  MPNowPlayingContentItem *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MPNowPlayingContentItem supportedRemoteArtworkFormats](self, "supportedRemoteArtworkFormats");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = objc_retainAutorelease(self);
      objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem"), "setAvailableRemoteArtworkFormats:", v4);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__MPNowPlayingContentItem_setSupportedRemoteArtworkFormats___block_invoke;
      v9[3] = &unk_1E315EE38;
      v10 = v4;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

    }
  }

}

- (NSDictionary)remoteArtworks
{
  void *v2;
  void *v3;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "remoteArtworks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_mapValues:", &__block_literal_global_37462);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setRemoteArtworks:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  MPNowPlayingContentItem *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[MPNowPlayingContentItem remoteArtworks](self, "remoteArtworks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v4, "msv_mapValues:", &__block_literal_global_5_37460);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_retainAutorelease(self);
      objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem"), "setRemoteArtworks:", v8);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__MPNowPlayingContentItem_setRemoteArtworks___block_invoke_2;
      v11[3] = &unk_1E315EE38;
      v12 = v8;
      v10 = v8;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v9, "_postItemChangedNotificationWithDeltaBlock:", v11);

    }
  }

}

- (int64_t)playlistType
{
  int64_t result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  result = MRContentItemGetPlaylistType();
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

- (void)setPlaylistType:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem playlistType](self, "playlistType") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetPlaylistType();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__MPNowPlayingContentItem_setPlaylistType___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (int64_t)radioStationType
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetRadioStationType() == 1;
}

- (void)setRadioStationType:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[5];

  if (-[MPNowPlayingContentItem radioStationType](self, "radioStationType") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetRadioStationType();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__MPNowPlayingContentItem_setRadioStationType___block_invoke_2;
    v6[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v6[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (double)calculatedElapsedTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[MPNowPlayingContentItem elapsedTime](self, "elapsedTime");
  v6 = v5;
  -[MPNowPlayingContentItem elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
  v8 = v4 - v7;
  -[MPNowPlayingContentItem playbackRate](self, "playbackRate");
  v10 = v6 + v8 * v9;
  -[MPNowPlayingContentItem duration](self, "duration");
  if (v10 < result)
    return v10;
  return result;
}

- (void)setElapsedTime:(double)a3 playbackRate:(float)a4
{
  int v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;

  v7 = _AXSHapticMusicEnabled();
  -[MPNowPlayingContentItem playbackRate](self, "playbackRate");
  v9 = v8 - a4;
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = -v9;
  -[MPNowPlayingContentItem calculatedElapsedTime](self, "calculatedElapsedTime");
  if (v10 > 2.2204e-16)
    goto LABEL_9;
  v12 = v11 - a3;
  if (v12 < 0.0)
    v12 = -v12;
  if (v12 > dbl_193F0CB30[v7 == 0] || !self->_didSetElapsedTime)
  {
LABEL_9:
    -[MPNowPlayingContentItem setElapsedTime:](self, "setElapsedTime:", a3);
    *(float *)&v13 = a4;
    -[MPNowPlayingContentItem setPlaybackRate:](self, "setPlaybackRate:", v13);
    self->_didSetElapsedTime = 1;
  }
}

- (BOOL)hasTranscriptAlignments
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetHasTranscriptAlignments();
}

- (void)setHasTranscriptAlignments:(BOOL)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPNowPlayingContentItem hasTranscriptAlignments](self, "hasTranscriptAlignments") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetHasTranscriptAlignments();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MPNowPlayingContentItem_setHasTranscriptAlignments___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (NSArray)transcriptAlignments
{
  const __CFArray *TranscriptAlignments;
  id v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  void *v7;
  MPNowPlayingInfoTranscriptAlignment *v8;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  TranscriptAlignments = (const __CFArray *)MRContentItemGetTranscriptAlignments();
  if (TranscriptAlignments)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    Count = CFArrayGetCount(TranscriptAlignments);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        CFArrayGetValueAtIndex(TranscriptAlignments, i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = -[MPNowPlayingInfoTranscriptAlignment initWithMRTranscriptAlignment:]([MPNowPlayingInfoTranscriptAlignment alloc], "initWithMRTranscriptAlignment:", v7);
          objc_msgSend(v3, "addObject:", v8);

        }
      }
    }
    TranscriptAlignments = (const __CFArray *)objc_msgSend(v3, "copy");

  }
  return (NSArray *)TranscriptAlignments;
}

- (void)setTranscriptAlignments:(id)a3
{
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[MPNowPlayingContentItem transcriptAlignments](self, "transcriptAlignments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  objc_msgSend(v4, "msv_map:", &__block_literal_global_33_37454);
  MRContentItemSetTranscriptAlignments();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_3;
  v8[3] = &unk_1E315EE38;
  v9 = v4;
  v7 = v4;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v6, "_postItemChangedNotificationWithDeltaBlock:", v8);

}

- (void)invalidateTranscriptAlignments
{
  void *v3;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPContentItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  objc_msgSend(v4, "setIncludeAlignments:", 1);
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)MRContentItemCreate();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest");
  v9[1] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v8);

  CFRelease(v4);
  CFRelease(v6);
}

- (BOOL)hasLanguageOptions
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetHasLanguageOptions();
}

- (void)setHasLanguageOptions:(BOOL)a3
{
  MPNowPlayingContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPNowPlayingContentItem hasLanguageOptions](self, "hasLanguageOptions") != a3)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetHasLanguageOptions();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__MPNowPlayingContentItem_setHasLanguageOptions___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (void)setAvailableLanguageOptions:(id)a3
{
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPNowPlayingContentItem availableLanguageOptions](self, "availableLanguageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  v7 = v4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13++), "mrLanguageOptionGroup"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  v15 = v14;
  MRContentItemSetAvailableLanguageOptions();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__MPNowPlayingContentItem_setAvailableLanguageOptions___block_invoke_2;
  v17[3] = &unk_1E315EE38;
  v18 = v9;
  v16 = v9;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v6, "_postItemChangedNotificationWithDeltaBlock:", v17);

}

- (void)setCurrentLanguageOptions:(id)a3
{
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPNowPlayingContentItem currentLanguageOptions](self, "currentLanguageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  v7 = v4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13++), "mrLanguageOption"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  v15 = v14;
  MRContentItemSetCurrentLanguageOptions();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__MPNowPlayingContentItem_setCurrentLanguageOptions___block_invoke_2;
  v17[3] = &unk_1E315EE38;
  v18 = v9;
  v16 = v9;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v6, "_postItemChangedNotificationWithDeltaBlock:", v17);

}

- (void)invalidateLanguageOptions
{
  void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPContentItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeLanguageOptions();
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)MRContentItemCreate();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest");
  v9[1] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v8);

  CFRelease(v4);
  CFRelease(v6);
}

- (void)invalidateSections
{
  void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPContentItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeSections();
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)MRContentItemCreate();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest");
  v9[1] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v8);

  CFRelease(v4);
  CFRelease(v6);
}

- (NSArray)sections
{
  id v2;
  id v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  v2 = (id)MRContentItemGetSections();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = -[MPContentItem _initWithMediaRemoteContentItem:]([MPNowPlayingContentItem alloc], "_initWithMediaRemoteContentItem:", v5);
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 < objc_msgSend(v2, "count"));
  }

  return (NSArray *)v3;
}

- (void)setSections:(id)a3
{
  id v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPNowPlayingContentItem sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(self);
  -[MPContentItem _mediaRemoteContentItem](v6, "_mediaRemoteContentItem");
  v7 = v4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++)), "_mediaRemoteContentItem"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  MRContentItemSetSections();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__MPNowPlayingContentItem_setSections___block_invoke_2;
  v15[3] = &unk_1E315EE38;
  v16 = v9;
  v14 = v9;
  -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v6, "_postItemChangedNotificationWithDeltaBlock:", v15);

}

- (void)invalidateDescription
{
  void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPContentItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeInfo();
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)MRContentItemCreate();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest");
  v9[1] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v8);

  CFRelease(v4);
  CFRelease(v6);
}

- (void)invalidateLyrics
{
  void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MPContentItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();

  MRPlaybackQueueRequestSetIncludeLyrics();
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)MRContentItemCreate();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaRequest");
  v9[1] = CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v8);

  CFRelease(v4);
  CFRelease(v6);
}

- (void)setArtwork:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPNowPlayingContentItem;
  -[MPContentItem setArtwork:](&v5, sel_setArtwork_);
  -[MPNowPlayingContentItem setHasArtwork:](self, "setHasArtwork:", a3 != 0);
}

- (unint64_t)albumTraits
{
  void *v2;
  char v3;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "albumTraits");

  return v3 & 0x3F;
}

- (void)setAlbumTraits:(unint64_t)a3
{
  MPNowPlayingContentItem *v5;
  void *v6;
  _QWORD v7[5];

  if (-[MPNowPlayingContentItem albumTraits](self, "albumTraits") != a3)
  {
    v5 = objc_retainAutorelease(self);
    objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlbumTraits:", a3 & 0x3F);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__MPNowPlayingContentItem_setAlbumTraits___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v7);
  }
}

- (unint64_t)playlistTraits
{
  void *v2;
  __int16 v3;

  objc_msgSend(-[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem"), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playlistTraits");

  return v3 & 0x138;
}

- (void)setPlaylistTraits:(unint64_t)a3
{
  MPNowPlayingContentItem *v5;
  void *v6;
  _QWORD v7[5];

  if (-[MPNowPlayingContentItem playlistTraits](self, "playlistTraits") != a3)
  {
    v5 = objc_retainAutorelease(self);
    objc_msgSend(-[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem"), "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaylistTraits:", a3 & 0x138);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__MPNowPlayingContentItem_setPlaylistTraits___block_invoke_3;
    v7[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v7[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v7);
  }
}

- (void)setPreferredFormat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  MPNowPlayingContentItem *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[MPNowPlayingContentItem preferredFormat](self, "preferredFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = objc_retainAutorelease(self);
      v9 = -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
      objc_msgSend(v4, "mediaRemoteAudioFormat");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPreferredFormat:", v10);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__MPNowPlayingContentItem_setPreferredFormat___block_invoke_3;
      v12[3] = &unk_1E315EE38;
      v13 = v4;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v12);

    }
  }

}

- (void)setActiveFormat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  MPNowPlayingContentItem *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[MPNowPlayingContentItem activeFormat](self, "activeFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = objc_retainAutorelease(self);
      v9 = -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
      objc_msgSend(v4, "mediaRemoteAudioFormat");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActiveFormat:", v10);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __43__MPNowPlayingContentItem_setActiveFormat___block_invoke_3;
      v12[3] = &unk_1E315EE38;
      v13 = v4;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v12);

    }
  }

}

- (void)setActiveFormatJustification:(int64_t)a3
{
  MPNowPlayingContentItem *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  if (-[MPNowPlayingContentItem activeFormatJustification](self, "activeFormatJustification") != a3)
  {
    v5 = objc_retainAutorelease(self);
    v6 = -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    if (a3 == 1000)
      v7 = 1000;
    else
      v7 = 0;
    if (a3 == 501)
      v7 = 501;
    if (a3 == 500)
      v7 = 500;
    if (a3 == 101)
      v8 = 101;
    else
      v8 = 0;
    if (a3 == 100)
      v8 = 100;
    if (a3 == 1)
      v8 = 1;
    if (a3 <= 499)
      v9 = v8;
    else
      v9 = v7;
    objc_msgSend(v6, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActiveFormatJustification:", v9);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__MPNowPlayingContentItem_setActiveFormatJustification___block_invoke_3;
    v11[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v11[4] = a3;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v11);
  }
}

- (void)setAudioRoute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  MPNowPlayingContentItem *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[MPNowPlayingContentItem audioRoute](self, "audioRoute");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = objc_retainAutorelease(self);
      v9 = -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
      objc_msgSend(v4, "mediaRemoteAudioRoute");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAudioRoute:", v10);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41__MPNowPlayingContentItem_setAudioRoute___block_invoke_3;
      v12[3] = &unk_1E315EE38;
      v13 = v4;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v12);

    }
  }

}

- (void)setAlternativeFormats:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  MPNowPlayingContentItem *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[MPNowPlayingContentItem alternativeFormats](self, "alternativeFormats");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == v4)
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = objc_retainAutorelease(self);
      v9 = -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
      objc_msgSend(v4, "msv_map:", &__block_literal_global_130_37435);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlternativeFormats:", v10);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_4;
      v12[3] = &unk_1E315EE38;
      v13 = v4;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v12);

    }
  }

}

- (BOOL)isSharableItem
{
  return self->_sharableItem;
}

- (MPNowPlayingContentItemArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)setArtworkDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_artworkDataSource, a3);
}

void __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "msv_map:", &__block_literal_global_133);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlternativeFormats:", v4);

}

uint64_t __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaRemoteAudioFormat");
}

uint64_t __49__MPNowPlayingContentItem_setAlternativeFormats___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaRemoteAudioFormat");
}

MPNowPlayingInfoAudioFormat *__45__MPNowPlayingContentItem_alternativeFormats__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MPNowPlayingInfoAudioFormat *v3;

  v2 = a2;
  v3 = -[MPNowPlayingInfoAudioFormat initWithMediaRemoteAudioFormat:]([MPNowPlayingInfoAudioFormat alloc], "initWithMediaRemoteAudioFormat:", v2);

  return v3;
}

void __41__MPNowPlayingContentItem_setAudioRoute___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteAudioRoute");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAudioRoute:", v4);

}

void __51__MPNowPlayingContentItem_setFormatTierPreference___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32) & 0x1FLL;
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFormatTierPreference:", v2);

}

void __56__MPNowPlayingContentItem_setActiveFormatJustification___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == 1000)
    v3 = 1000;
  else
    v3 = 0;
  if (v2 == 501)
    v3 = 501;
  if (v2 == 500)
    v3 = 500;
  if (v2 == 101)
    v4 = 101;
  else
    v4 = 0;
  if (v2 == 100)
    v4 = 100;
  if (v2 == 1)
    v4 = 1;
  if (v2 <= 499)
    v5 = v4;
  else
    v5 = v3;
  objc_msgSend(a2, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveFormatJustification:", v5);

}

void __43__MPNowPlayingContentItem_setActiveFormat___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActiveFormat:", v4);

}

void __46__MPNowPlayingContentItem_setPreferredFormat___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteAudioFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredFormat:", v4);

}

void __45__MPNowPlayingContentItem_setPlaylistTraits___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32) & 0x138;
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaylistTraits:", v2);

}

void __42__MPNowPlayingContentItem_setAlbumTraits___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32) & 0x3FLL;
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlbumTraits:", v2);

}

void __41__MPNowPlayingContentItem_setSongTraits___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32) & 0x3FLL;
  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSongTraits:", v2);

}

uint64_t __37__MPNowPlayingContentItem_setLyrics___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteLyricsItem");
  return MRContentItemSetLyrics();
}

uint64_t __40__MPNowPlayingContentItem_setHasLyrics___block_invoke()
{
  return MRContentItemSetHasLyrics();
}

uint64_t __39__MPNowPlayingContentItem_setSections___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        objc_msgSend(v2, "addObject:", objc_msgSend(v8, "_mediaRemoteContentItem", (_QWORD)v10));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return MRContentItemSetSections();
}

uint64_t __53__MPNowPlayingContentItem_setCurrentLanguageOptions___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "mrLanguageOption", (_QWORD)v11));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_msgSend(v2, "copy");
  v9 = v8;
  return MRContentItemSetCurrentLanguageOptions();
}

uint64_t __55__MPNowPlayingContentItem_setAvailableLanguageOptions___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "mrLanguageOptionGroup", (_QWORD)v11));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_msgSend(v2, "copy");
  v9 = v8;
  return MRContentItemSetAvailableLanguageOptions();
}

uint64_t __49__MPNowPlayingContentItem_setHasLanguageOptions___block_invoke()
{
  return MRContentItemSetHasLanguageOptions();
}

uint64_t __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "msv_map:", &__block_literal_global_35_37455);
  return MRContentItemSetTranscriptAlignments();
}

uint64_t __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mrTranscriptAlignment");
}

uint64_t __51__MPNowPlayingContentItem_setTranscriptAlignments___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mrTranscriptAlignment");
}

uint64_t __54__MPNowPlayingContentItem_setHasTranscriptAlignments___block_invoke()
{
  return MRContentItemSetHasTranscriptAlignments();
}

uint64_t __45__MPNowPlayingContentItem_setCollectionInfo___block_invoke_2(uint64_t a1)
{
  MPNowPlayingCollectionInfoToMediaRemote(*(void **)(a1 + 32));
  return MRContentItemSetCollectionInfo();
}

uint64_t __48__MPNowPlayingContentItem_setEditingStyleFlags___block_invoke_2()
{
  return MRContentItemSetEditingStyleFlags();
}

uint64_t __47__MPNowPlayingContentItem_setRadioStationType___block_invoke_2()
{
  return MRContentItemSetRadioStationType();
}

uint64_t __43__MPNowPlayingContentItem_setPlaylistType___block_invoke_2()
{
  return MRContentItemSetPlaylistType();
}

uint64_t __45__MPNowPlayingContentItem_setRemoteArtworks___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRemoteArtworks:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__MPNowPlayingContentItem_setRemoteArtworks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "mediaRemoteRemoteArtwork");
}

MPNowPlayingContentItemRemoteArtwork *__41__MPNowPlayingContentItem_remoteArtworks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  MPNowPlayingContentItemRemoteArtwork *v4;

  v3 = a3;
  v4 = -[MPNowPlayingContentItemRemoteArtwork initWithMediaRemoteRemoteArtwork:]([MPNowPlayingContentItemRemoteArtwork alloc], "initWithMediaRemoteRemoteArtwork:", v3);

  return v4;
}

uint64_t __60__MPNowPlayingContentItem_setSupportedRemoteArtworkFormats___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAvailableRemoteArtworkFormats:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__MPNowPlayingContentItem_setAssociatedParticipantIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssociatedParticipantIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __49__MPNowPlayingContentItem_setStoreAlbumArtistID___block_invoke()
{
  return MRContentItemSetITunesStoreAlbumArtistIdentifier();
}

uint64_t __43__MPNowPlayingContentItem_setLyricsAdamID___block_invoke()
{
  return MRContentItemSetLyricsAdamID();
}

uint64_t __46__MPNowPlayingContentItem_setReportingAdamID___block_invoke()
{
  return MRContentItemSetReportingAdamID();
}

uint64_t __50__MPNowPlayingContentItem_setStoreSubscriptionID___block_invoke()
{
  return MRContentItemSetITunesStoreSubscriptionIdentifier();
}

uint64_t __44__MPNowPlayingContentItem_setStoreArtistID___block_invoke()
{
  return MRContentItemSetITunesStoreArtistIdentifier();
}

uint64_t __47__MPNowPlayingContentItem_setNumberOfChildren___block_invoke()
{
  return MRContentItemSetNumberOfSections();
}

uint64_t __43__MPNowPlayingContentItem_setInTransition___block_invoke()
{
  return MRContentItemSetIsInTransition();
}

uint64_t __38__MPNowPlayingContentItem_setLoading___block_invoke()
{
  return MRContentItemSetIsLoading();
}

uint64_t __40__MPNowPlayingContentItem_setSteerable___block_invoke()
{
  return MRContentItemSetIsSteerable();
}

uint64_t __44__MPNowPlayingContentItem_setAdvertisement___block_invoke()
{
  return MRContentItemSetIsAdvertisement();
}

uint64_t __45__MPNowPlayingContentItem_setAlwaysLiveItem___block_invoke()
{
  return MRContentItemSetIsAlwaysLive();
}

uint64_t __48__MPNowPlayingContentItem_setServiceIdentifier___block_invoke()
{
  return MRContentItemSetServiceIdentifier();
}

uint64_t __59__MPNowPlayingContentItem_setRadioStationStringIdentifier___block_invoke()
{
  return MRContentItemSetRadioStationString();
}

uint64_t __40__MPNowPlayingContentItem_setGenreName___block_invoke()
{
  return MRContentItemSetGenre();
}

uint64_t __43__MPNowPlayingContentItem_setComposerName___block_invoke()
{
  return MRContentItemSetComposer();
}

uint64_t __42__MPNowPlayingContentItem_setTrackNumber___block_invoke()
{
  return MRContentItemSetTrackNumber();
}

uint64_t __46__MPNowPlayingContentItem_setTotalTrackCount___block_invoke()
{
  return MRContentItemSetTotalTrackCount();
}

uint64_t __45__MPNowPlayingContentItem_setTotalDiscCount___block_invoke()
{
  return MRContentItemSetTotalDiscCount();
}

uint64_t __43__MPNowPlayingContentItem_setSeasonNumber___block_invoke()
{
  return MRContentItemSetSeasonNumber();
}

uint64_t __40__MPNowPlayingContentItem_setPlayCount___block_invoke()
{
  return MRContentItemSetPlayCount();
}

uint64_t __44__MPNowPlayingContentItem_setEpisodeNumber___block_invoke()
{
  return MRContentItemSetEpisodeNumber();
}

uint64_t __41__MPNowPlayingContentItem_setDiscNumber___block_invoke()
{
  return MRContentItemSetDiscNumber();
}

uint64_t __40__MPNowPlayingContentItem_setStartTime___block_invoke()
{
  return MRContentItemSetStartTime();
}

uint64_t __60__MPNowPlayingContentItem_setDurationStringLocalizationKey___block_invoke()
{
  return MRContentItemSetDurationStringLocalizationKey();
}

uint64_t __54__MPNowPlayingContentItem_setLocalizedDurationString___block_invoke()
{
  return MRContentItemSetLocalizedDurationString();
}

uint64_t __50__MPNowPlayingContentItem_setArtworkURLTemplates___block_invoke()
{
  return MRContentItemSetArtworkURLTemplates();
}

uint64_t __41__MPNowPlayingContentItem_setArtworkURL___block_invoke()
{
  return MRContentItemSetArtworkURL();
}

uint64_t __41__MPNowPlayingContentItem_setSeriesName___block_invoke()
{
  return MRContentItemSetSeriesName();
}

uint64_t __47__MPNowPlayingContentItem_setRadioStationName___block_invoke()
{
  return MRContentItemSetRadioStationName();
}

uint64_t __48__MPNowPlayingContentItem_setProfileIdentifier___block_invoke()
{
  return MRContentItemSetProfileIdentifier();
}

uint64_t __53__MPNowPlayingContentItem_setLocalizedContentRating___block_invoke()
{
  return MRContentItemSetLocalizedContentRating();
}

uint64_t __35__MPNowPlayingContentItem_setInfo___block_invoke()
{
  return MRContentItemSetInfo();
}

uint64_t __43__MPNowPlayingContentItem_setDirectorName___block_invoke()
{
  return MRContentItemSetDirectorName();
}

uint64_t __40__MPNowPlayingContentItem_setAlbumYear___block_invoke()
{
  return MRContentItemSetAlbumYear();
}

+ (BOOL)shouldPushArtworkData
{
  return 0;
}

@end
