@implementation MRCommandInfo

- (void)setCommand:(unsigned int)a3
{
  self->_command = a3;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (id)commandInfosFromData:(id)a3
{
  if (!a3)
    return 0;
  MRCreateArrayFromData(a3, &__block_literal_global_67);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v3 = MRMediaRemoteCopyCommandDescription(-[MRCommandInfo command](self, "command"));
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_opt_class();
  v6 = -[MRCommandInfo isEnabled](self, "isEnabled");
  -[MRCommandInfo options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %p, %@, enabled = %d, options = %@>"), v5, self, v3, v6, v7);

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = MRMediaRemoteCopyCommandDescription(-[MRCommandInfo command](self, "command"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("command"));

  if (-[MRCommandInfo isEnabled](self, "isEnabled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("enabled"));
  -[MRCommandInfo options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("options"));

  return (NSDictionary *)v3;
}

- (NSData)propertyListData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MRCommandInfo command](self, "command"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kCommandInfoCommandKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRCommandInfo isEnabled](self, "isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kCommandInfoEnabledKey"));

  -[MRCommandInfo options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[MRCommandInfo options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kCommandInfoOptionsKey"));

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (unsigned)command
{
  return self->_command;
}

- (NSDictionary)options
{
  return self->_options;
}

+ (id)dataFromCommandInfos:(id)a3
{
  if (!a3)
    return 0;
  MRCreateDataFromArray(a3, &__block_literal_global_12_0);
  return (id)objc_claimAutoreleasedReturnValue();
}

MRCommandInfo *__38__MRCommandInfo_commandInfosFromData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRCommandInfo *v3;

  v2 = a2;
  v3 = -[MRCommandInfo initWithPropertyListData:]([MRCommandInfo alloc], "initWithPropertyListData:", v2);

  return v3;
}

- (MRCommandInfo)initWithPropertyListData:(id)a3
{
  id v4;
  MRCommandInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *options;
  MRCommandInfo *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRCommandInfo;
    v5 = -[MRCommandInfo init](&v15, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCommandInfoCommandKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_command = objc_msgSend(v7, "integerValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCommandInfoEnabledKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enabled = objc_msgSend(v8, "BOOLValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCommandInfoOptionsKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "copy");
        options = v5->_options;
        v5->_options = (NSDictionary *)v11;

      }
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __38__MRCommandInfo_dataFromCommandInfos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "propertyListData");
}

- (MRCommandInfo)initWithProtobuf:(id)a3
{
  id v4;
  MRCommandInfo *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSDictionary *options;
  MRCommandInfo *v76;
  void *v78;
  MRCommandInfo *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v85.receiver = self;
    v85.super_class = (Class)MRCommandInfo;
    v5 = -[MRCommandInfo init](&v85, sel_init);

    if (v5)
    {
      v5->_command = MRMediaRemoteCommandFromProtobuf(objc_msgSend(v4, "command"));
      v5->_enabled = objc_msgSend(v4, "enabled");
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v4, "preferredIntervalsCount"))
      {
        PBRepeatedDoubleNSArray();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kMRMediaRemoteCommandInfoPreferredIntervalsKey"));

      }
      if (objc_msgSend(v4, "hasActive"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "active"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteCommandInfoIsActiveKey"));

      }
      if (objc_msgSend(v4, "hasLocalizedTitle"))
      {
        objc_msgSend(v4, "localizedTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("kMRMediaRemoteCommandInfoLocalizedTitleKey"));

      }
      if (objc_msgSend(v4, "hasLocalizedShortTitle"))
      {
        objc_msgSend(v4, "localizedShortTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("kMRMediaRemoteCommandInfoLocalizedShortTitleKey"));

      }
      if (objc_msgSend(v4, "hasMinimumRating"))
      {
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "minimumRating");
        objc_msgSend(v11, "numberWithFloat:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("kMRMediaRemoteCommandInfoMinimumRatingKey"));

      }
      if (objc_msgSend(v4, "hasMaximumRating"))
      {
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "maximumRating");
        objc_msgSend(v13, "numberWithFloat:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("kMRMediaRemoteCommandInfoMaximumRatingKey"));

      }
      if (objc_msgSend(v4, "supportedRatesCount"))
      {
        PBRepeatedFloatNSArray();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackRates"));

      }
      if (objc_msgSend(v4, "hasRepeatMode"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "repeatMode"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("kMRMediaRemoteCommandInfoRepeatMode"));

      }
      if (objc_msgSend(v4, "hasShuffleMode"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "shuffleMode"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("kMRMediaRemoteCommandInfoShuffleMode"));

      }
      if (objc_msgSend(v4, "hasPresentationStyle"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "presentationStyle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("kMRMediaRemoteCommandInfoPresentationStyleKey"));

      }
      if (objc_msgSend(v4, "hasSkipInterval"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "skipInterval"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("kMRMediaRemoteCommandInfoSkipInterval"));

      }
      if (objc_msgSend(v4, "hasNumAvailableSkips"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "numAvailableSkips"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("kMRMediaRemoteCommandInfoNumberOfAvailableSkips"));

      }
      if (objc_msgSend(v4, "hasSkipFrequency"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "skipFrequency"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("kMRMediaRemoteCommandInfoSkipFrequency"));

      }
      if (objc_msgSend(v4, "hasCanScrub"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "canScrub"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("kMRMediaRemoteCommandInfoCanBeControlledByScrubbingKey"));

      }
      if (objc_msgSend(v4, "supportedPlaybackQueueTypes"))
      {
        PBRepeatedInt32NSArray();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackQueueTypes"));

      }
      objc_msgSend(v4, "supportedCustomQueueIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v4, "supportedCustomQueueIdentifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("kMRMediaRemoteCommandInfoSupportedCustomPlaybackQueueIdentifiers"));

      }
      if (objc_msgSend(v4, "supportedInsertionPositions"))
      {
        PBRepeatedInt32NSArray();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("kMRMediaRemoteCommandInfoSupportedInsertionPositions"));

      }
      if (objc_msgSend(v4, "hasUpNextItemCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "upNextItemCount"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("kMRMediaRemoteCommandInfoUpNextItemCount"));

      }
      if (objc_msgSend(v4, "hasPreferredPlaybackRate"))
      {
        v28 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "preferredPlaybackRate");
        objc_msgSend(v28, "numberWithFloat:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("kMRMediaRemoteCommandInfoPreferredPlaybackRate"));

      }
      objc_msgSend(v4, "supportedPlaybackSessionTypes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v4, "supportedPlaybackSessionTypes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackSessionTypes"));

      }
      objc_msgSend(v4, "currentPlaybackSessionTypes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v4, "currentPlaybackSessionTypes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("kMRMediaRemoteCommandInfoCurrentPlaybackSessionTypes"));

      }
      objc_msgSend(v4, "playbackSessionIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v4, "playbackSessionIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("kMRMediaRemoteCommandInfoPlaybackSessionIdentifier"));

      }
      if (objc_msgSend(v4, "currentQueueEndAction"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "currentQueueEndAction"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("kMRMediaRemoteCommandInfoCurrentQueueEndAction"));

      }
      if (objc_msgSend(v4, "supportedQueueEndActions"))
      {
        PBRepeatedInt32NSArray();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("kMRMediaRemoteCommandInfoSupportedQueueEndActions"));

      }
      objc_msgSend(v4, "proactiveCommandOptions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v4, "proactiveCommandOptions");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        MRMediaRemoteCommandOptionsFromProtobuf(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("kMRMediaRemoteCommandInfoProactiveCommandOptions"));

      }
      if (objc_msgSend(v4, "hasDisabledReason"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "disabledReason"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("kMRMediaRemoteCommandInfoDisabledReason"));

      }
      if (objc_msgSend(v4, "hasVocalsControlActive"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "vocalsControlActive"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("kMRMediaRemoteCommandInfoVocalsControlActive"));

      }
      if (objc_msgSend(v4, "hasVocalsControlLevel"))
      {
        v43 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "vocalsControlLevel");
        objc_msgSend(v43, "numberWithFloat:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("kMRMediaRemoteCommandInfoVocalsControlLevel"));

      }
      if (objc_msgSend(v4, "hasVocalsControlContinuous"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "vocalsControlContinuous"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("kMRMediaRemoteCommandInfoVocalsControlContinuous"));

      }
      if (objc_msgSend(v4, "hasVocalsControlMaxLevel"))
      {
        v46 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "vocalsControlMaxLevel");
        objc_msgSend(v46, "numberWithFloat:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("kMRMediaRemoteCommandInfoVocalsControlMaxLevel"));

      }
      if (objc_msgSend(v4, "hasVocalsControlMinLevel"))
      {
        v48 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "vocalsControlMinLevel");
        objc_msgSend(v48, "numberWithFloat:");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("kMRMediaRemoteCommandInfoVocalsControlMinLevel"));

      }
      if (objc_msgSend(v4, "hasSleepTimerTime"))
      {
        v50 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "sleepTimerTime");
        objc_msgSend(v50, "numberWithDouble:");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("kMRMediaRemoteCommandInfoSleepTimerTime"));

      }
      if (objc_msgSend(v4, "hasSleepTimerStopMode"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "sleepTimerStopMode"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("kMRMediaRemoteCommandInfoSleepTimerStopMode"));

      }
      if (objc_msgSend(v4, "hasSleepTimerFireDate"))
      {
        v53 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "sleepTimerFireDate");
        objc_msgSend(v53, "numberWithDouble:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("kMRMediaRemoteCommandInfoSleepTimerFireDate"));

      }
      if (objc_msgSend(v4, "hasLastSectionContentItemID"))
      {
        objc_msgSend(v4, "lastSectionContentItemID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("kMRMediaRemoteCommandInfoLastSectionContentItemID"));

      }
      if (objc_msgSend(v4, "hasDialogOptions"))
      {
        objc_msgSend(v4, "dialogOptions");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        _MRProtoUtilsNSDictionaryFromProtoDictionary(v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v57, CFSTR("kMRMediaRemoteCommandInfoDialogOptions"));

      }
      if (objc_msgSend(v4, "hasSupportsReferencePosition"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "supportsReferencePosition"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("kMRMediaRemoteCommandInfoSupportsReferencePosition"));

      }
      objc_msgSend(v4, "supportedPlaybackSessionIdentifiers");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v78 = v6;
        v79 = v5;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v80 = v4;
        objc_msgSend(v4, "supportedPlaybackSessionIdentifiers");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v82 != v64)
                objc_enumerationMutation(v61);
              v66 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              objc_msgSend(v66, "playbackSessionIdentifier");
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (v67)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v66, "playbackSessionPriority"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "setObject:forKeyedSubscript:", v69, CFSTR("kMRMediaRemoteCommandInfoPlaybackSessionPriority"));

                objc_msgSend(v66, "playbackSessionRevision");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "setObject:forKeyedSubscript:", v70, CFSTR("kMRMediaRemoteCommandInfoPlaybackSessionRevision"));

                v71 = (void *)objc_msgSend(v68, "copy");
                objc_msgSend(v66, "playbackSessionIdentifier");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "setObject:forKeyedSubscript:", v71, v72);

              }
            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
          }
          while (v63);
        }

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v60);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v78;
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v73, CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackSessionIdentifiers"));

        v5 = v79;
        v4 = v80;
      }
      if (objc_msgSend(v6, "count"))
      {
        v74 = objc_msgSend(v6, "copy");
        options = v5->_options;
        v5->_options = (NSDictionary *)v74;

      }
    }
    self = v5;
    v76 = self;
  }
  else
  {
    v76 = 0;
  }

  return v76;
}

- (MRCommandInfo)initWithData:(id)a3
{
  id v4;
  _MRCommandInfoProtobuf *v5;
  MRCommandInfo *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[_MRCommandInfoProtobuf initWithData:]([_MRCommandInfoProtobuf alloc], "initWithData:", v4);
    v6 = -[MRCommandInfo initWithProtobuf:](self, "initWithProtobuf:", v5);

  }
  else
  {
    v6 = -[MRCommandInfo initWithProtobuf:](self, "initWithProtobuf:", 0);
  }

  return v6;
}

- (_MRCommandInfoProtobuf)protobuf
{
  _MRCommandInfoProtobuf *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t n;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t ii;
  uint64_t v135;
  void *v136;
  _MRPreloadedPlaybackSessionInfo *v137;
  void *v138;
  void *v139;
  _MRCommandInfoProtobuf *v140;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  uint64_t v206;

  v206 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_MRCommandInfoProtobuf);
  v4 = MRMediaRemoteCommandToProtobuf(-[MRCommandInfo command](self, "command"));
  if ((int)v4 >= 1)
    -[_MRCommandInfoProtobuf setCommand:](v3, "setCommand:", v4);
  if (-[MRCommandInfo isEnabled](self, "isEnabled"))
    -[_MRCommandInfoProtobuf setEnabled:](v3, "setEnabled:", 1);
  -[MRCommandInfo options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[MRCommandInfo options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoPreferredIntervalsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v196, v205, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v197;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v197 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * i), "doubleValue");
          -[_MRCommandInfoProtobuf addPreferredInterval:](v3, "addPreferredInterval:");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v196, v205, 16);
      }
      while (v11);
    }

    -[MRCommandInfo options](self, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoIsActiveKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[_MRCommandInfoProtobuf setActive:](v3, "setActive:", objc_msgSend(v15, "BOOLValue"));
    -[MRCommandInfo options](self, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoLocalizedShortTitleKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v174 = v17;
    if (objc_msgSend(v17, "length"))
    {
      -[_MRCommandInfoProtobuf setLocalizedShortTitle:](v3, "setLocalizedShortTitle:", v17);
    }
    else
    {
      -[MRCommandInfo options](self, "options");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoLocalizedTitleKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "length"))
        -[_MRCommandInfoProtobuf setLocalizedTitle:](v3, "setLocalizedTitle:", v19);

    }
    -[MRCommandInfo options](self, "options");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoMinimumRatingKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "floatValue");
      -[_MRCommandInfoProtobuf setMinimumRating:](v3, "setMinimumRating:");
    }
    -[MRCommandInfo options](self, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoMaximumRatingKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "floatValue");
      -[_MRCommandInfoProtobuf setMaximumRating:](v3, "setMaximumRating:");
    }
    -[MRCommandInfo options](self, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackRates"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v192, v204, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v193;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v193 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * j), "floatValue");
          -[_MRCommandInfoProtobuf addSupportedRate:](v3, "addSupportedRate:");
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v192, v204, 16);
      }
      while (v28);
    }

    -[MRCommandInfo options](self, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoShuffleMode"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      -[_MRCommandInfoProtobuf setShuffleMode:](v3, "setShuffleMode:", objc_msgSend(v32, "unsignedIntegerValue"));
    v166 = v32;
    -[MRCommandInfo options](self, "options");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoRepeatMode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      -[_MRCommandInfoProtobuf setRepeatMode:](v3, "setRepeatMode:", objc_msgSend(v34, "unsignedIntegerValue"));
    v165 = v34;
    -[MRCommandInfo options](self, "options");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoPresentationStyleKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      -[_MRCommandInfoProtobuf setPresentationStyle:](v3, "setPresentationStyle:", objc_msgSend(v36, "intValue"));
    v164 = v36;
    -[MRCommandInfo options](self, "options");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSkipInterval"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      -[_MRCommandInfoProtobuf setSkipInterval:](v3, "setSkipInterval:", objc_msgSend(v38, "intValue"));
    v163 = v38;
    -[MRCommandInfo options](self, "options");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoNumberOfAvailableSkips"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      -[_MRCommandInfoProtobuf setNumAvailableSkips:](v3, "setNumAvailableSkips:", objc_msgSend(v40, "intValue"));
    v162 = v40;
    -[MRCommandInfo options](self, "options");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSkipFrequency"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      -[_MRCommandInfoProtobuf setSkipFrequency:](v3, "setSkipFrequency:", objc_msgSend(v42, "intValue"));
    v161 = v42;
    -[MRCommandInfo options](self, "options");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoCanBeControlledByScrubbingKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      -[_MRCommandInfoProtobuf setCanScrub:](v3, "setCanScrub:", objc_msgSend(v44, "intValue"));
    v160 = v44;
    -[MRCommandInfo options](self, "options");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackQueueTypes"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v175 = v26;
    v171 = v46;
    if (v46)
    {
      v190 = 0u;
      v191 = 0u;
      v188 = 0u;
      v189 = 0u;
      v47 = v46;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v188, v203, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v189;
        do
        {
          for (k = 0; k != v49; ++k)
          {
            if (*(_QWORD *)v189 != v50)
              objc_enumerationMutation(v47);
            -[_MRCommandInfoProtobuf addSupportedPlaybackQueueTypes:](v3, "addSupportedPlaybackQueueTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v188 + 1) + 8 * k), "intValue"));
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v188, v203, 16);
        }
        while (v49);
      }

      v26 = v175;
    }
    -[MRCommandInfo options](self, "options");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedCustomPlaybackQueueIdentifiers"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v54 = (void *)objc_msgSend(v53, "mutableCopy");
      -[_MRCommandInfoProtobuf setSupportedCustomQueueIdentifiers:](v3, "setSupportedCustomQueueIdentifiers:", v54);

    }
    -[MRCommandInfo options](self, "options");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedInsertionPositions"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v159 = v53;
    v170 = v56;
    if (v56)
    {
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v57 = v56;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v184, v202, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v185;
        do
        {
          for (m = 0; m != v59; ++m)
          {
            if (*(_QWORD *)v185 != v60)
              objc_enumerationMutation(v57);
            -[_MRCommandInfoProtobuf addSupportedInsertionPositions:](v3, "addSupportedInsertionPositions:", objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * m), "intValue"));
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v184, v202, 16);
        }
        while (v59);
      }

      v26 = v175;
    }
    v172 = v23;
    v62 = v21;
    v63 = v15;
    -[MRCommandInfo options](self, "options");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoUpNextItemCount"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
      -[_MRCommandInfoProtobuf setUpNextItemCount:](v3, "setUpNextItemCount:", objc_msgSend(v65, "intValue"));
    -[MRCommandInfo options](self, "options");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoPreferredPlaybackRate"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(v67, "floatValue");
      -[_MRCommandInfoProtobuf setPreferredPlaybackRate:](v3, "setPreferredPlaybackRate:");
    }
    v157 = v67;
    -[MRCommandInfo options](self, "options");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackSessionTypes"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = v63;
    if (v69)
    {
      v71 = (void *)objc_msgSend(v69, "mutableCopy");
      -[_MRCommandInfoProtobuf setSupportedPlaybackSessionTypes:](v3, "setSupportedPlaybackSessionTypes:", v71);

    }
    v156 = v69;
    -[MRCommandInfo options](self, "options");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoCurrentPlaybackSessionTypes"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = v62;
    if (v73)
    {
      v75 = (void *)objc_msgSend(v73, "mutableCopy");
      -[_MRCommandInfoProtobuf setCurrentPlaybackSessionTypes:](v3, "setCurrentPlaybackSessionTypes:", v75);

    }
    v169 = v73;
    v76 = v70;
    -[MRCommandInfo options](self, "options");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoPlaybackSessionIdentifier"));
    v78 = objc_claimAutoreleasedReturnValue();

    if (v78)
      -[_MRCommandInfoProtobuf setPlaybackSessionIdentifier:](v3, "setPlaybackSessionIdentifier:", v78);
    v155 = (void *)v78;
    -[MRCommandInfo options](self, "options");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoProactiveCommandOptions"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      MRMediaRemoteCommandOptionsToProtobuf(v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MRCommandInfoProtobuf setProactiveCommandOptions:](v3, "setProactiveCommandOptions:", v81);

    }
    v154 = v80;
    v158 = v65;
    v167 = v76;
    if (-[MRCommandInfo command](self, "command") == 135)
    {
      v82 = v74;
      -[MRCommandInfo options](self, "options");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoCurrentQueueEndAction"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      -[_MRCommandInfoProtobuf setCurrentQueueEndAction:](v3, "setCurrentQueueEndAction:", objc_msgSend(v84, "intValue"));
      -[MRCommandInfo options](self, "options");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedQueueEndActions"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      v87 = v86;
      v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v180, v201, 16);
      if (v88)
      {
        v89 = v88;
        v90 = *(_QWORD *)v181;
        do
        {
          for (n = 0; n != v89; ++n)
          {
            if (*(_QWORD *)v181 != v90)
              objc_enumerationMutation(v87);
            -[_MRCommandInfoProtobuf addSupportedQueueEndActions:](v3, "addSupportedQueueEndActions:", objc_msgSend(*(id *)(*((_QWORD *)&v180 + 1) + 8 * n), "intValue"));
          }
          v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v180, v201, 16);
        }
        while (v89);
      }

      v74 = v82;
      v76 = v167;
      v26 = v175;
    }
    v173 = v74;
    -[MRCommandInfo options](self, "options");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoDisabledReason"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
      -[_MRCommandInfoProtobuf setDisabledReason:](v3, "setDisabledReason:", objc_msgSend(v93, "intValue"));
    -[MRCommandInfo options](self, "options");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoVocalsControlActive"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
      -[_MRCommandInfoProtobuf setVocalsControlActive:](v3, "setVocalsControlActive:", objc_msgSend(v95, "BOOLValue"));
    -[MRCommandInfo options](self, "options");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoVocalsControlLevel"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      objc_msgSend(v97, "floatValue");
      -[_MRCommandInfoProtobuf setVocalsControlLevel:](v3, "setVocalsControlLevel:");
    }
    v152 = v97;
    -[MRCommandInfo options](self, "options");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoVocalsControlMaxLevel"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      objc_msgSend(v99, "floatValue");
      -[_MRCommandInfoProtobuf setVocalsControlMaxLevel:](v3, "setVocalsControlMaxLevel:");
    }
    v151 = v99;
    -[MRCommandInfo options](self, "options");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoVocalsControlMinLevel"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      objc_msgSend(v101, "floatValue");
      -[_MRCommandInfoProtobuf setVocalsControlMinLevel:](v3, "setVocalsControlMinLevel:");
    }
    v168 = v93;
    v150 = v101;
    -[MRCommandInfo options](self, "options");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoVocalsControlContinuous"));
    v103 = objc_claimAutoreleasedReturnValue();

    v104 = (void *)v103;
    v105 = v76;
    if (v104)
      -[_MRCommandInfoProtobuf setVocalsControlContinuous:](v3, "setVocalsControlContinuous:", objc_msgSend(v104, "BOOLValue"));
    v149 = v104;
    -[MRCommandInfo options](self, "options");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSleepTimerTime"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v107)
    {
      objc_msgSend(v107, "doubleValue");
      -[_MRCommandInfoProtobuf setSleepTimerTime:](v3, "setSleepTimerTime:");
    }
    v153 = v95;
    v148 = v107;
    -[MRCommandInfo options](self, "options");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSleepTimerStopMode"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
      -[_MRCommandInfoProtobuf setSleepTimerStopMode:](v3, "setSleepTimerStopMode:", objc_msgSend(v109, "unsignedIntegerValue"));
    v110 = v105;
    v147 = v109;
    -[MRCommandInfo options](self, "options");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSleepTimerFireDate"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
    {
      objc_msgSend(v112, "doubleValue");
      -[_MRCommandInfoProtobuf setSleepTimerFireDate:](v3, "setSleepTimerFireDate:");
    }
    -[MRCommandInfo options](self, "options");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoLastSectionContentItemID"));
    v114 = objc_claimAutoreleasedReturnValue();

    if (v114)
      -[_MRCommandInfoProtobuf setLastSectionContentItemID:](v3, "setLastSectionContentItemID:", v114);
    v146 = (void *)v114;
    -[MRCommandInfo options](self, "options");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoDialogOptions"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = v110;
    if (v116)
    {
      _MRProtoUtilsProtoDictionaryFromNSDictionary(v116);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MRCommandInfoProtobuf setDialogOptions:](v3, "setDialogOptions:", v118);

    }
    v145 = v116;
    -[MRCommandInfo options](self, "options");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportsReferencePosition"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    v121 = v173;
    if (v120)
      -[_MRCommandInfoProtobuf setSupportsReferencePosition:](v3, "setSupportsReferencePosition:", objc_msgSend(v120, "BOOLValue"));
    v144 = v120;
    -[MRCommandInfo options](self, "options");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoSupportedPlaybackSessionIdentifiers"));
    v123 = objc_claimAutoreleasedReturnValue();

    v124 = (void *)v123;
    v125 = v174;
    v126 = v169;
    v127 = v172;
    if (v124)
    {
      v143 = v9;
      v128 = v124;
      v129 = (void *)objc_opt_new();
      v176 = 0u;
      v177 = 0u;
      v178 = 0u;
      v179 = 0u;
      v142 = v128;
      v130 = v128;
      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v176, v200, 16);
      if (v131)
      {
        v132 = v131;
        v133 = *(_QWORD *)v177;
        do
        {
          for (ii = 0; ii != v132; ++ii)
          {
            if (*(_QWORD *)v177 != v133)
              objc_enumerationMutation(v130);
            v135 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * ii);
            objc_msgSend(v130, "objectForKeyedSubscript:", v135, v142);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_alloc_init(_MRPreloadedPlaybackSessionInfo);
            -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionIdentifier:](v137, "setPlaybackSessionIdentifier:", v135);
            objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoPlaybackSessionPriority"));
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionPriority:](v137, "setPlaybackSessionPriority:", objc_msgSend(v138, "intValue"));

            objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoPlaybackSessionRevision"));
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionRevision:](v137, "setPlaybackSessionRevision:", v139);

            objc_msgSend(v129, "addObject:", v137);
          }
          v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v176, v200, 16);
        }
        while (v132);
      }

      -[_MRCommandInfoProtobuf setSupportedPlaybackSessionIdentifiers:](v3, "setSupportedPlaybackSessionIdentifiers:", v129);
      v9 = v143;
      v117 = v167;
      v93 = v168;
      v121 = v173;
      v125 = v174;
      v127 = v172;
      v26 = v175;
      v126 = v169;
      v124 = v142;
    }

  }
  v140 = v3;

  return v140;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRCommandInfo protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  MRCommandInfo *v4;
  MRCommandInfo *v5;
  unsigned int v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (MRCommandInfo *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MRCommandInfo command](v5, "command");
      if (v6 == -[MRCommandInfo command](self, "command")
        && (v7 = -[MRCommandInfo isEnabled](v5, "isEnabled"), v7 == -[MRCommandInfo isEnabled](self, "isEnabled")))
      {
        -[MRCommandInfo options](v5, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRCommandInfo options](self, "options");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {
          v8 = 1;
          v11 = v9;
        }
        else
        {
          v11 = (void *)v10;
          -[MRCommandInfo options](v5, "options");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRCommandInfo options](self, "options");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v12, "isEqualToDictionary:", v13);

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unsigned int v3;
  int v4;

  v3 = -[MRCommandInfo command](self, "command");
  if (-[MRCommandInfo isEnabled](self, "isEnabled"))
    v4 = 0x1000000;
  else
    v4 = 0;
  return v4 | v3;
}

+ (BOOL)isCommandActuallySupportedEvenWhenDisabled:(unsigned int)a3
{
  return a3 - 17 < 2;
}

@end
