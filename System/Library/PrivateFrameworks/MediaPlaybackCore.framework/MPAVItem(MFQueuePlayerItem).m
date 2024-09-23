@implementation MPAVItem(MFQueuePlayerItem)

- (double)effectivePlaybackStartTime
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "initialPlaybackStartTime");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)setCurrentItemTransition:()MFQueuePlayerItem
{
  uint64_t v3;

  if ((unint64_t)(a3 + 1) > 6)
    v3 = -2;
  else
    v3 = qword_210ED9380[a3 + 1];
  return objc_msgSend(a1, "setLastChangeDirection:", v3);
}

- (uint64_t)hasLoadableAsset
{
  return objc_msgSend(a1, "isPlaceholder") ^ 1;
}

- (BOOL)isSpokenAudio
{
  return objc_msgSend(a1, "mediaType") == 2 || objc_msgSend(a1, "mediaType") == 1024;
}

- (BOOL)isMovieOrTVShow
{
  return (objc_msgSend(a1, "mediaType") & 0x300) != 0;
}

- (id)avPlayerItem
{
  return *(id *)(a1 + (int)*MEMORY[0x24BDDCD10]);
}

- (double)time
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double Seconds;
  CMTime v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!objc_msgSend(a1, "isAssetLoaded") || !objc_msgSend(a1, "canUseLoadedAsset"))
    goto LABEL_11;
  v2 = (int)*MEMORY[0x24BDDCD10];
  v3 = *(id *)&a1[v2];
  objc_msgSend(v3, "contentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", v5))
  {

    goto LABEL_10;
  }
  v6 = objc_msgSend(a1, "canReusePlayerItem");

  if ((v6 & 1) != 0)
    goto LABEL_10;
  if (!v3)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "currentTime");
  if ((v13 & 0x100000000) == 0)
  {
LABEL_10:

LABEL_11:
    objc_msgSend(a1, "effectivePlaybackStartTime");
    return v8;
  }
  v7 = *(void **)&a1[v2];
  if (v7)
    objc_msgSend(v7, "currentTime");
  else
    memset(&v11, 0, sizeof(v11));
  Seconds = CMTimeGetSeconds(&v11);

  return Seconds;
}

- (uint64_t)isFullyDownloaded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "isAssetLoaded"))
    return 0;
  objc_msgSend(a1, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFileURL");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isVideoContent
{
  return objc_msgSend(a1, "type") == 2;
}

- (double)playbackStartTimeOverride
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "initialPlaybackStartTimeOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (void)setPlaybackStartTimeOverride:()MFQueuePlayerItem
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setInitialPlaybackStartTimeOverride:", v2);

}

- (double)playbackStartTime
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "playbackInfoStartTime");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (uint64_t)reset
{
  uint64_t result;

  result = objc_msgSend(a1, "isPreloadedAsset");
  if ((result & 1) == 0)
    return objc_msgSend(a1, "_clearAssetNow");
  return result;
}

- (uint64_t)prepareForReuse
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "resetPlaybackStartTimeForReuse");
  return result;
}

- (id)gaplessParameters
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "gaplessInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)shouldPerformGaplessTransitionWith:()MFQueuePlayerItem
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "_isInContiguousAlbumWith:"))
    return 0;
  objc_msgSend(a1, "gaplessParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (uint64_t)shouldPerformOverlappingTransitionWith:()MFQueuePlayerItem
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (!_os_feature_enabled_impl()
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(a1, "isConfiguredForVocalAttenuation") & 1) != 0
    || (objc_msgSend(v4, "isConfiguredForVocalAttenuation") & 1) != 0
    || (objc_msgSend(a1, "isVideoContent") & 1) != 0
    || (objc_msgSend(v4, "isVideoContent") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(a1, "_isInContiguousAlbumWith:", v4) ^ 1;
  }

  return v5;
}

- (id)activeFormat
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "activeFormat");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_isInContiguousAlbumWith:()MFQueuePlayerItem
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(a1, "modelGenericObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flattenedGenericObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "modelGenericObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flattenedGenericObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "type") == 1 && objc_msgSend(v9, "type") == 1)
    {
      objc_msgSend(v7, "song");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "song");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "album");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v10;
      objc_msgSend(v10, "album");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v13, "intersectsSet:", v15);

      if ((_DWORD)v10)
      {
        v16 = objc_msgSend(v11, "discNumber");
        v17 = v21;
        if (v16 == objc_msgSend(v21, "discNumber"))
        {
          v18 = objc_msgSend(v11, "trackNumber");
          v19 = v18 == objc_msgSend(v21, "trackNumber") + 1;
        }
        else
        {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
        v17 = v21;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)playbackRequestUserIdentity
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "playbackRequestUserIdentity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)playerItemType
{
  return 2;
}

@end
