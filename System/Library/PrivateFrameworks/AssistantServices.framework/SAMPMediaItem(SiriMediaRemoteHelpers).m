@implementation SAMPMediaItem(SiriMediaRemoteHelpers)

+ (id)_af_mediaItemWithMRContentItemRef:()SiriMediaRemoteHelpers
{
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t ITunesStoreIdentifier;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D88248]);
    v4 = objc_alloc_init(MEMORY[0x1E0D88270]);
    MRContentItemGetDuration();
    objc_msgSend(v4, "setDurationMillis:", (uint64_t)(v5 * 1000.0));
    MRContentItemGetCalculatedPlaybackPosition();
    if (v6 == 0.0)
      MRContentItemGetElapsedTime();
    objc_msgSend(v4, "setPlaybackPositionMillis:", (uint64_t)(v6 * 1000.0));
    objc_msgSend(v4, "setPlays:", MRContentItemGetPlayCount());
    objc_msgSend(v3, "setPlaybackInfo:", v4);
    objc_msgSend(v3, "setTitle:", MRContentItemGetTitle());
    objc_msgSend(v3, "setAlbum:", MRContentItemGetAlbumName());
    MRContentItemGetTrackArtistName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
      MRContentItemGetAlbumArtistName();
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    objc_msgSend(v3, "setArtist:", v7);
    MRContentItemGetReleaseDate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D88298], "_af_releaseInfoWithReleaseDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReleaseInfo:", v10);

    ITunesStoreIdentifier = MRContentItemGetITunesStoreIdentifier();
    if (ITunesStoreIdentifier > 0
      || (ITunesStoreIdentifier = MRContentItemGetITunesStoreSubscriptionIdentifier(), ITunesStoreIdentifier >= 1))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", ITunesStoreIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _AFMediaIdURLFromHostAndIdentifier(CFSTR("store"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setIdentifier:", v14);

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_af_mediaItemWithMRContentItem:()SiriMediaRemoteHelpers
{
  void *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (a3)
  {
    objc_msgSend(a3, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0D88248]);
    v5 = objc_alloc_init(MEMORY[0x1E0D88270]);
    objc_msgSend(v3, "duration");
    objc_msgSend(v5, "setDurationMillis:", (uint64_t)(v6 * 1000.0));
    objc_msgSend(v3, "calculatedPlaybackPosition");
    if (v7 == 0.0)
      objc_msgSend(v3, "elapsedTime");
    objc_msgSend(v5, "setPlaybackPositionMillis:", (uint64_t)(v7 * 1000.0));
    objc_msgSend(v5, "setPlays:", objc_msgSend(v3, "playCount"));
    objc_msgSend(v4, "setPlaybackInfo:", v5);
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v8);

    objc_msgSend(v3, "albumName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlbum:", v9);

    objc_msgSend(v3, "trackArtistName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {
      objc_msgSend(v3, "albumArtistName");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    objc_msgSend(v4, "setArtist:", v10);
    objc_msgSend(v3, "releaseDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D88298], "_af_releaseInfoWithReleaseDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReleaseInfo:", v13);

    v14 = objc_msgSend(v3, "iTunesStoreIdentifier");
    if (v14 > 0 || (v14 = objc_msgSend(v3, "iTunesStoreSubscriptionIdentifier", v14), v14 >= 1))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _AFMediaIdURLFromHostAndIdentifier(CFSTR("store"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIdentifier:", v17);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
