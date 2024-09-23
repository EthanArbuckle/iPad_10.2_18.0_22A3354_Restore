@implementation AVHUDStringGenerator

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVHUDStringGenerator;
  -[AVHUDStringGenerator dealloc](&v3, sel_dealloc);
}

+ (id)descriptionStringForFormatOfTrack:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const opaqueCMFormatDescription *v10;
  CMMediaType MediaType;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  const __CFDictionary *Extensions;
  const void *Value;
  const void *v17;
  const AudioFormatListItem *RichestDecodableFormat;
  double *p_mSampleRate;
  void *key;
  unsigned int v22;

  v4 = 0;
  if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("formatDescriptions"), 0) == 2)
  {
    v5 = (void *)objc_msgSend(a3, "formatDescriptions");
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "count");
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        key = (void *)*MEMORY[0x1E0CA4A00];
        while (1)
        {
          v10 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "objectAtIndex:", v9);
          MediaType = CMFormatDescriptionGetMediaType(v10);
          v22 = 0;
          v22 = bswap32(CMFormatDescriptionGetMediaSubType(v10));
          v12 = 0;
          if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("languageCode"), 0) == 2)
            v12 = objc_msgSend(a3, "languageCode");
          v13 = CFSTR("video format desc ");
          if (MediaType != 1986618469)
          {
            v13 = CFSTR("audio format desc ");
            if (MediaType != 1936684398)
              break;
          }
          v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v13);
          v4 = v14;
          if (v12)
            objc_msgSend(v14, "appendFormat:", CFSTR("(%@) "), v12);
          if (v8 != 1)
            objc_msgSend(v4, "appendFormat:", CFSTR("%d "), v9 + 1);
          objc_msgSend(v4, "appendFormat:", CFSTR("- codec:%.4s "), &v22);
          if (MediaType == 1986618469)
          {
            objc_msgSend(v4, "appendFormat:", CFSTR("video-range:%@"), +[AVHUDStringGenerator descriptionStringForVideoRangeOfFormatDescription:](AVHUDStringGenerator, "descriptionStringForVideoRangeOfFormatDescription:", v10));
            Extensions = CMFormatDescriptionGetExtensions(v10);
            if (Extensions)
            {
              Value = CFDictionaryGetValue(Extensions, key);
              if (Value)
              {
                v17 = Value;
                if (runningAnInternalBuild_onceToken != -1)
                  dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
                if (runningAnInternalBuild_internalBuild)
                  objc_msgSend(v4, "appendFormat:", CFSTR(", bit-depth:%@"), v17);
              }
            }
          }
          else
          {
            RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(v10);
            if (RichestDecodableFormat)
            {
              p_mSampleRate = &RichestDecodableFormat->mASBD.mSampleRate;
              objc_msgSend(v4, "appendFormat:", CFSTR(", channels:%u"), RichestDecodableFormat->mASBD.mChannelsPerFrame);
              objc_msgSend(v4, "appendFormat:", CFSTR(", sample-rate:%uHz"), *p_mSampleRate);
            }
          }
          objc_msgSend(v4, "appendString:", CFSTR("\n"));
          if (v8 == ++v9)
            return v4;
        }
      }
    }
    return 0;
  }
  return v4;
}

+ (id)descriptionStringForBitRate:(double)a3
{
  double v3;
  const __CFString *v4;

  v3 = a3 / 1000.0;
  if (a3 / 1000.0 <= 1.0)
  {
    v4 = CFSTR("bps");
  }
  else
  {
    a3 = v3 / 1000.0;
    if (v3 / 1000.0 <= 1.0)
    {
      v4 = CFSTR("kbps");
      a3 = v3;
    }
    else
    {
      v4 = CFSTR("Mbps");
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f%@"), *(_QWORD *)&a3, v4);
}

+ (id)descriptionStringForVideoRangeOfFormatDescription:(opaqueCMFormatDescription *)a3
{
  unsigned int v3;

  v3 = CMVideoFormatDescriptionGetVideoDynamicRange() - 1;
  if (v3 > 8)
    return CFSTR("Unknown");
  else
    return off_1E3035988[v3];
}

+ (id)descriptionStringForTracksOfPlayerItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  const __CFString *v14;
  int v15;
  float v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v4, "setString:", CFSTR("average bitrate "));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_msgSend(a3, "tracks");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "assetTrack");
        if (objc_msgSend(v10, "isEnabled"))
        {
          if (objc_msgSend(v11, "statusOfValueForKey:error:", CFSTR("mediaType"), 0) == 2
            && objc_msgSend(v11, "statusOfValueForKey:error:", CFSTR("estimatedDataRate"), 0) == 2)
          {
            v12 = (void *)objc_msgSend(v11, "mediaType");
            v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("vide"));
            v14 = CFSTR("video:");
            if ((v13 & 1) != 0
              || (v15 = objc_msgSend(v12, "isEqualToString:", CFSTR("soun")), v14 = CFSTR("audio:"), v15))
            {
              objc_msgSend(v4, "appendFormat:", v14);
              objc_msgSend(v11, "estimatedDataRate");
              v17 = CFSTR(" -");
              if (v16 > 0.0)
                v17 = +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v16);
              objc_msgSend(v4, "appendFormat:", CFSTR("%@  "), v17);
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  return v4;
}

- (void)updateFromPlayer
{
  AVPlayer **p_player;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  double v7;
  double v8;
  const __CFDictionary *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CGSize v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGSize size;
  id v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  p_player = &self->_player;
  v4 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_player), "_copyPerformanceDataForCurrentItem");
  if (!self->_spatialDiagnostics)
    goto LABEL_8;
  if (runningAnInternalBuild_onceToken != -1)
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
  if (runningAnInternalBuild_internalBuild)
  {
    if (v4)
    {
      v5 = (objc_class *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC55F0]);
      if (v5)
      {
        v6 = 16;
LABEL_32:
        *(Class *)((char *)&self->super.isa + v6) = v5;
      }
    }
  }
  else
  {
LABEL_8:
    v32 = 0;
    v24 = (CGSize)*MEMORY[0x1E0C9D820];
    v31 = *MEMORY[0x1E0C9D820];
    v30 = 0;
    if (objc_msgSend(objc_loadWeak((id *)p_player), "_getDisplayVideoRange:displaySize:refreshRate:", &v32, &v31, &v30))
    {
      HIDWORD(v7) = HIDWORD(v31);
      *(float *)&v7 = *((double *)&v31 + 1);
      self->_displayResolutionHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), "copy");
      HIDWORD(v8) = DWORD1(v31);
      *(float *)&v8 = *(double *)&v31;
      self->_displayResolutionWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), "copy");
      self->_refreshRate = (NSNumber *)objc_msgSend(v30, "copy");
      self->_videoRange = (NSString *)objc_msgSend(v32, "copy");
    }
    if (v4)
    {
      v9 = (const __CFDictionary *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC55F8]);
      if (v9)
      {
        size = v24;
        CGSizeMakeWithDictionaryRepresentation(v9, &size);
        HIDWORD(v10) = HIDWORD(size.height);
        *(float *)&v10 = size.height;
        self->_videoApproximateDisplaySizeHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), "copy");
        HIDWORD(v11) = HIDWORD(size.width);
        *(float *)&v11 = size.width;
        self->_videoApproximateDisplaySizeWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11), "copy");
      }
      if (runningAnInternalBuild_onceToken != -1)
        dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
      if (runningAnInternalBuild_internalBuild)
      {
        v12 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC5600]), "firstObject");
        if (v12)
        {
          v13 = v12;
          v14 = (void *)objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CC6398]);
          v15 = (void *)objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CC6360]);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            v19 = *MEMORY[0x1E0CC6368];
LABEL_19:
            v20 = 0;
            while (1)
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v15);
              v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
              v22 = (void *)objc_msgSend(v21, "objectForKey:", v19, v24);
              if (v22)
              {
                if (!objc_msgSend(v22, "intValue"))
                  break;
              }
              if (v17 == ++v20)
              {
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                if (v17)
                  goto LABEL_19;
                goto LABEL_29;
              }
            }
            if (!v21)
              goto LABEL_29;
            v23 = (void *)objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CC63A0]);
          }
          else
          {
LABEL_29:
            v23 = 0;
          }
          self->_decoderFrameDrops = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "intValue", v24)), "copy");
          if (v23)
          {
            v5 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "intValue")), "copy");
            v6 = 216;
            goto LABEL_32;
          }
        }
      }
    }
  }

}

- (void)updateFromPlayerItem
{
  AVHUDStringGenerator *v2;
  AVPlayer **p_player;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 captureCompleteURI;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double Seconds;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  float v21;
  float v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  void *v33;
  float v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  void *v59;
  void *v60;
  AVPlayer **v61;
  AVHUDStringGenerator *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CMTime v67;
  CMTime time;
  __int128 v69;
  _OWORD v70[2];
  _BYTE v71[128];
  uint64_t v72;

  v2 = self;
  v72 = *MEMORY[0x1E0C80C00];
  p_player = &self->_player;
  v4 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_player), "currentItem");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "accessLog"), "events"), "lastObject");
    if (runningAnInternalBuild_onceToken != -1)
      dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
    if (runningAnInternalBuild_internalBuild)
    {
      if (objc_msgSend(v6, "URI"))
      {
        captureCompleteURI = v2->_captureCompleteURI;
        v8 = (void *)objc_msgSend(v6, "URI");
        if (!captureCompleteURI)
          v8 = (void *)objc_msgSend((id)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("?")), "objectAtIndex:", 0);
      }
      else
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "asset"), "_absoluteURL"), "absoluteString");
      }
      v2->_playerItemURL = (NSString *)objc_msgSend(v8, "copy");
      if (objc_msgSend((id)objc_msgSend(v5, "asset"), "statusOfValueForKey:error:", CFSTR("streaming"), 0) == 2)
      {
        if ((objc_msgSend((id)objc_msgSend(v5, "asset"), "_isStreaming") & 1) != 0)
        {
          v9 = CFSTR("streaming (HLS)");
        }
        else
        {
          v10 = (void *)objc_msgSend((id)objc_msgSend(v5, "asset"), "_absoluteURL");
          v11 = objc_msgSend(v10, "scheme");
          if (v10)
          {
            v12 = (void *)v11;
            if ((objc_msgSend(v10, "isFileURL") & 1) != 0)
            {
              v9 = CFSTR("local file");
            }
            else
            {
              v9 = CFSTR("progressive download (CRABS)");
              if ((objc_msgSend(v12, "isEqualToString:", CFSTR("http")) & 1) == 0
                && !objc_msgSend(v12, "isEqualToString:", CFSTR("https")))
              {
                v9 = CFSTR("custom-loaded");
              }
            }
          }
          else
          {
            v9 = CFSTR("unknown");
          }
        }
        v2->_assetType = &v9->isa;
      }
      if (objc_msgSend(v6, "playbackSessionID"))
        v2->_sessionID = (NSString *)objc_msgSend((id)objc_msgSend(v6, "playbackSessionID"), "copy");
      v2->_configurationGroup = (NSString *)objc_msgSend((id)objc_msgSend(v5, "configurationGroup"), "copy");
      if (v6)
        v2->_totalFrameDrops = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v6, "numberOfDroppedVideoFrames")), "copy");
      v13 = (void *)objc_msgSend((id)objc_msgSend(v5, "loadedTimeRanges"), "firstObject");
      if (v13)
      {
        memset(v70, 0, sizeof(v70));
        v69 = 0u;
        objc_msgSend(v13, "CMTimeRangeValue");
        objc_msgSend(v5, "currentTime");
        Seconds = CMTimeGetSeconds(&time);
        *(_OWORD *)&v67.value = v69;
        v67.epoch = *(_QWORD *)&v70[0];
        v15 = CMTimeGetSeconds(&v67);
        v67 = *(CMTime *)((char *)v70 + 8);
        v16 = CMTimeGetSeconds(&v67);
        v2->_bufferedVideoPlayed = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Seconds - v15), "copy");
        v2->_bufferedVideoRemaining = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 + v16 - Seconds), "copy");
      }
    }
    v18 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v19 = objc_msgSend((id)objc_msgSend(v5, "asset"), "statusOfValueForKey:error:", CFSTR("tracks"), 0);
    v21 = 0.0;
    v22 = 0.0;
    v23 = v18;
    v24 = v17;
    if (v19 == 2)
    {
      v60 = v6;
      v61 = p_player;
      v62 = v2;
      v25 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v26 = (void *)objc_msgSend(v5, "tracks");
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v64;
        v23 = v18;
        v24 = v17;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v64 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            if (objc_msgSend(v31, "isEnabled"))
            {
              v32 = +[AVHUDStringGenerator descriptionStringForFormatOfTrack:](AVHUDStringGenerator, "descriptionStringForFormatOfTrack:", objc_msgSend(v31, "assetTrack"));
              if (v32)
                objc_msgSend(v25, "appendString:", v32);
              v33 = (void *)objc_msgSend(v31, "assetTrack");
              if (objc_msgSend(v33, "statusOfValueForKey:error:", CFSTR("mediaType"), 0) == 2
                && objc_msgSend(v33, "statusOfValueForKey:error:", CFSTR("nominalFrameRate"), 0) == 2
                && objc_msgSend(v33, "statusOfValueForKey:error:", CFSTR("naturalSize"), 0) == 2
                && objc_msgSend((id)objc_msgSend(v33, "mediaType"), "isEqualToString:", CFSTR("vide")))
              {
                objc_msgSend(v31, "currentVideoFrameRate");
                v21 = v34;
                objc_msgSend(v33, "nominalFrameRate");
                v22 = v35;
                objc_msgSend(v33, "naturalSize");
                v23 = v36;
                v24 = v37;
              }
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        }
        while (v28);
      }
      else
      {
        v23 = v18;
        v24 = v17;
      }
      v19 = 2;
      v2 = v62;
      if (objc_msgSend(v25, "length"))
        v62->_trackFormatDescriptions = (NSString *)objc_msgSend(v25, "copy");
      v6 = v60;
      p_player = v61;
    }
    if (v18 == v23 && v17 == v24)
    {
      objc_msgSend(v5, "presentationSize");
      v23 = v20;
      v24 = v38;
    }
    *(float *)&v20 = v24;
    v2->_presentationSizeHeight = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20), "copy");
    *(float *)&v39 = v23;
    v2->_presentationSizeWidth = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39), "copy");
    if (v21 >= 0.5)
    {
      *(float *)&v40 = v21;
      v2->_currentFrameRate = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40), "copy");
    }
    if (v22 >= 0.5)
    {
      *(float *)&v40 = v22;
      v2->_nominalFrameRate = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40), "copy");
    }
    if (!v6)
      goto LABEL_71;
    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "observedBitrate");
    v2->_networkBandiwdth = (NSNumber *)objc_msgSend((id)objc_msgSend(v41, "numberWithDouble:"), "copy");
    objc_msgSend(v6, "averageVideoBitrate");
    if (v42 <= 0.0 || (objc_msgSend(v6, "averageAudioBitrate"), v43 <= 0.0))
    {
      if (v19 != 2)
        goto LABEL_61;
      v46 = +[AVHUDStringGenerator descriptionStringForTracksOfPlayerItem:](AVHUDStringGenerator, "descriptionStringForTracksOfPlayerItem:", v5);
      v47 = 168;
    }
    else
    {
      v44 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "averageVideoBitrate");
      v2->_averageVideoBitrate = (NSNumber *)objc_msgSend((id)objc_msgSend(v44, "numberWithDouble:"), "copy");
      v45 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "averageAudioBitrate");
      v46 = (id)objc_msgSend(v45, "numberWithDouble:");
      v47 = 160;
    }
    *(Class *)((char *)&v2->super.isa + v47) = (Class)objc_msgSend(v46, "copy");
LABEL_61:
    objc_msgSend(v6, "indicatedBitrate");
    if (v48 > 0.0 || (objc_msgSend(v6, "indicatedAverageBitrate"), v49 > 0.0))
    {
      objc_msgSend(v6, "indicatedBitrate");
      if (v50 > 0.0)
      {
        v51 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "indicatedBitrate");
        *(float *)&v52 = v52;
        v2->_peakIndicatedBitrate = (NSNumber *)objc_msgSend((id)objc_msgSend(v51, "numberWithFloat:", v52), "copy");
      }
      objc_msgSend(v6, "indicatedAverageBitrate");
      if (v53 > 0.0)
      {
        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "indicatedAverageBitrate");
        *(float *)&v55 = v55;
        v2->_averageIndicatedBitrate = (NSNumber *)objc_msgSend((id)objc_msgSend(v54, "numberWithFloat:", v55), "copy");
      }
    }
    v56 = objc_msgSend(v5, "variantIndex");
    v57 = v56;
    if (v2->_prevVariantIdx != v56)
    {
      v2->_prevVariantIdx = v56;
      v2->_prevStallCount = 0;
    }
    v2->_totalStallCount += objc_msgSend(v6, "numberOfStalls") - v2->_prevStallCount;
    v2->_prevStallCount = objc_msgSend(v6, "numberOfStalls");
    v2->_totalStalls = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v2->_totalStallCount), "copy");
    v2->_variantIndex = (NSNumber *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v57), "copy");
    if (v2->_startupTime == 0.0)
    {
      objc_msgSend(v6, "startupTime");
      v2->_startupTime = v58;
    }
LABEL_71:
    v59 = (void *)objc_msgSend(objc_loadWeak((id *)p_player), "_ancillaryPerformanceInformationForDisplay");
    if (v59)
      v2->_customPerfInfo = (NSString *)objc_msgSend(v59, "copy");
  }
}

- (void)update
{
  -[AVHUDStringGenerator updateFromPlayer](self, "updateFromPlayer");
  -[AVHUDStringGenerator updateFromPlayerItem](self, "updateFromPlayerItem");
}

- (NSString)formattedDisplayString
{
  void *v3;
  NSNumber *audioSpatializationMode;
  const __CFString *v5;
  NSNumber *displayResolutionWidth;
  void *v7;
  float v8;
  double v9;
  float v10;
  NSNumber *refreshRate;
  uint64_t v12;
  NSNumber *videoApproximateDisplaySizeWidth;
  float v14;
  double v15;
  float v16;
  NSNumber *presentationSizeWidth;
  void *v18;
  float v19;
  double v20;
  float v21;
  NSNumber *currentFrameRate;
  float v23;
  NSNumber *nominalFrameRate;
  float v25;
  NSNumber *networkBandiwdth;
  float v27;
  float v28;
  float v29;
  NSNumber *peakIndicatedBitrate;
  float v31;
  NSNumber *averageIndicatedBitrate;
  float v33;
  NSNumber *totalStalls;
  NSNumber *decoderFrameDrops;
  NSNumber *imageQueueFrameDrops;
  NSNumber *bufferedVideoPlayed;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (!self->_spatialDiagnostics)
    goto LABEL_73;
  if (runningAnInternalBuild_onceToken != -1)
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_41);
  if (runningAnInternalBuild_internalBuild)
  {
    audioSpatializationMode = self->_audioSpatializationMode;
    if (audioSpatializationMode)
    {
      switch(-[NSNumber integerValue](audioSpatializationMode, "integerValue"))
      {
        case 0:
        case 1:
          v5 = CFSTR("[ M-Ch ]");
          break;
        case 2:
          v5 = CFSTR("[ 2-Ch ]");
          break;
        case 3:
          v5 = CFSTR("[ S-Ch ]");
          break;
        default:
          goto LABEL_66;
      }
    }
    else
    {
LABEL_66:
      v5 = CFSTR("[ ?-Ch ]");
    }
    objc_msgSend(v3, "appendString:", v5);
  }
  else
  {
LABEL_73:
    if (self->_playerItemURL)
      objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), self->_playerItemURL);
    if (self->_assetType)
      objc_msgSend(v3, "appendFormat:", CFSTR("asset type:%@\n"), self->_assetType);
    if (self->_sessionID)
      objc_msgSend(v3, "appendFormat:", CFSTR("session-id:%@\n"), self->_sessionID);
    if (self->_configurationGroup)
      objc_msgSend(v3, "appendFormat:", CFSTR("configurationGroup: %@\n"), self->_configurationGroup);
    if (self->_trackFormatDescriptions)
      objc_msgSend(v3, "appendFormat:", CFSTR("%@"), self->_trackFormatDescriptions);
    displayResolutionWidth = self->_displayResolutionWidth;
    if (displayResolutionWidth && self->_displayResolutionHeight)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[NSNumber floatValue](displayResolutionWidth, "floatValue");
      v9 = v8;
      -[NSNumber floatValue](self->_displayResolutionHeight, "floatValue");
      objc_msgSend(v3, "appendString:", objc_msgSend(v7, "stringWithFormat:", CFSTR("display resolution:%0.0f x %0.0f"), *(_QWORD *)&v9, v10));
    }
    refreshRate = self->_refreshRate;
    if (refreshRate)
    {
      -[NSNumber doubleValue](refreshRate, "doubleValue");
      objc_msgSend(v3, "appendFormat:", CFSTR(", refresh-rate:%0.2fHz"), v12);
    }
    if (self->_videoRange)
      objc_msgSend(v3, "appendFormat:", CFSTR(", video-range:%@\n"), self->_videoRange);
    videoApproximateDisplaySizeWidth = self->_videoApproximateDisplaySizeWidth;
    if (videoApproximateDisplaySizeWidth && self->_videoApproximateDisplaySizeHeight)
    {
      -[NSNumber floatValue](videoApproximateDisplaySizeWidth, "floatValue");
      v15 = v14;
      -[NSNumber floatValue](self->_videoApproximateDisplaySizeHeight, "floatValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("video approximate-display-size:%0.0f x %0.0f  "), *(_QWORD *)&v15, v16);
    }
    else
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("video approximate-display-size:-  "), v41, v42);
    }
    presentationSizeWidth = self->_presentationSizeWidth;
    if (presentationSizeWidth && self->_presentationSizeHeight)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[NSNumber floatValue](presentationSizeWidth, "floatValue");
      v20 = v19;
      -[NSNumber floatValue](self->_presentationSizeHeight, "floatValue");
      objc_msgSend(v3, "appendString:", objc_msgSend(v18, "stringWithFormat:", CFSTR("natural-size:%0.0f x %0.0f\n"), *(_QWORD *)&v20, v21));
    }
    currentFrameRate = self->_currentFrameRate;
    if (currentFrameRate)
    {
      -[NSNumber floatValue](currentFrameRate, "floatValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("current frame rate:%0.2f\n"), v23);
    }
    nominalFrameRate = self->_nominalFrameRate;
    if (nominalFrameRate)
    {
      -[NSNumber floatValue](nominalFrameRate, "floatValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("nominal frame rate:%0.2f\n"), v25);
    }
    networkBandiwdth = self->_networkBandiwdth;
    if (networkBandiwdth)
    {
      -[NSNumber floatValue](networkBandiwdth, "floatValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("network bandwidth:%@\n"), +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v27));
    }
    if (self->_averageAudioBitrate && self->_averageVideoBitrate)
    {
      objc_msgSend(v3, "appendString:", CFSTR("average bitrate "));
      -[NSNumber floatValue](self->_averageVideoBitrate, "floatValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("video:%@  "), +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v28));
      -[NSNumber floatValue](self->_averageAudioBitrate, "floatValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("audio:%@\n"), +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v29));
    }
    else if (self->_assetTrackInfo)
    {
      objc_msgSend(v3, "appendString:");
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
    }
    if (self->_peakIndicatedBitrate || self->_averageIndicatedBitrate)
    {
      objc_msgSend(v3, "appendString:", CFSTR("indicated bitrate "));
      peakIndicatedBitrate = self->_peakIndicatedBitrate;
      if (peakIndicatedBitrate)
      {
        -[NSNumber floatValue](peakIndicatedBitrate, "floatValue");
        objc_msgSend(v3, "appendFormat:", CFSTR("peak:%@  "), +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v31));
      }
      averageIndicatedBitrate = self->_averageIndicatedBitrate;
      if (averageIndicatedBitrate)
      {
        -[NSNumber floatValue](averageIndicatedBitrate, "floatValue");
        objc_msgSend(v3, "appendFormat:", CFSTR("average:%@  "), +[AVHUDStringGenerator descriptionStringForBitRate:](AVHUDStringGenerator, "descriptionStringForBitRate:", v33));
      }
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
    }
    if (self->_variantIndex)
    {
      totalStalls = self->_totalStalls;
      if (totalStalls)
        objc_msgSend(v3, "appendFormat:", CFSTR("stalls total:%ld  current-variant:%ld\n"), -[NSNumber longValue](totalStalls, "longValue"), -[NSNumber longValue](self->_variantIndex, "longValue"));
    }
    if (self->_totalFrameDrops)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("frame drops "));
      objc_msgSend(v3, "appendFormat:", CFSTR("total:%ld  "), -[NSNumber longValue](self->_totalFrameDrops, "longValue"));
      decoderFrameDrops = self->_decoderFrameDrops;
      if (decoderFrameDrops)
        objc_msgSend(v3, "appendFormat:", CFSTR("decode:%d  "), -[NSNumber intValue](decoderFrameDrops, "intValue"));
      imageQueueFrameDrops = self->_imageQueueFrameDrops;
      if (imageQueueFrameDrops)
        objc_msgSend(v3, "appendFormat:", CFSTR("imageQ:%d"), -[NSNumber intValue](imageQueueFrameDrops, "intValue"));
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
    }
    bufferedVideoPlayed = self->_bufferedVideoPlayed;
    if (bufferedVideoPlayed && self->_bufferedVideoRemaining)
    {
      -[NSNumber doubleValue](bufferedVideoPlayed, "doubleValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("buffered video before:%0.1fs  "), v38);
      -[NSNumber doubleValue](self->_bufferedVideoRemaining, "doubleValue");
      objc_msgSend(v3, "appendFormat:", CFSTR("after:%0.1fs\n"), v39);
    }
    if (self->_customPerfInfo)
      objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), self->_customPerfInfo);
    if (self->_startupTime > 0.0)
      objc_msgSend(v3, "appendFormat:", CFSTR("startupTime:%fs"), *(_QWORD *)&self->_startupTime);
  }
  return (NSString *)v3;
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (BOOL)spatialDiagnostics
{
  return self->_spatialDiagnostics;
}

- (void)setSpatialDiagnostics:(BOOL)a3
{
  self->_spatialDiagnostics = a3;
}

- (BOOL)captureCompleteURI
{
  return self->_captureCompleteURI;
}

- (void)setCaptureCompleteURI:(BOOL)a3
{
  self->_captureCompleteURI = a3;
}

- (int64_t)prevVariantIdx
{
  return self->_prevVariantIdx;
}

- (void)setPrevVariantIdx:(int64_t)a3
{
  self->_prevVariantIdx = a3;
}

- (int64_t)prevStallCount
{
  return self->_prevStallCount;
}

- (void)setPrevStallCount:(int64_t)a3
{
  self->_prevStallCount = a3;
}

- (int64_t)totalStallCount
{
  return self->_totalStallCount;
}

- (void)setTotalStallCount:(int64_t)a3
{
  self->_totalStallCount = a3;
}

- (NSNumber)displayResolutionWidth
{
  return self->_displayResolutionWidth;
}

- (NSNumber)displayResolutionHeight
{
  return self->_displayResolutionHeight;
}

- (NSNumber)audioSpatializationMode
{
  return self->_audioSpatializationMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
}

@end
