@implementation MPCAudioAssetTypeSelector

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCAudioAssetTypeSelector outcomeGenerator](self, "outcomeGenerator");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("-");
  -[MPCAudioAssetTypeSelector trialExperiment](self, "trialExperiment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "treatmentID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("N/A");
  if (v9)
    v11 = (const __CFString *)v9;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ experimentTreatmentID:%@>"), v4, self, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MSVTrialExperiment)trialExperiment
{
  return self->_trialExperiment;
}

- (MSVABTestGenerator)outcomeGenerator
{
  return self->_outcomeGenerator;
}

- (MPCAudioAssetTypeSelector)initWithPlaybackEngine:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  MPCAudioAssetTypeSelector *v8;

  v4 = (void *)MEMORY[0x24BDDCB28];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPCAudioAssetTypeSelector initWithPlaybackEngine:userDefaults:environmentMonitor:](self, "initWithPlaybackEngine:userDefaults:environmentMonitor:", v5, v6, v7);

  return v8;
}

- (MPCAudioAssetTypeSelector)initWithPlaybackEngine:(id)a3 userDefaults:(id)a4 environmentMonitor:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCAudioAssetTypeSelector *v11;
  MPCAudioAssetTypeSelector *v12;
  void *v13;
  uint64_t v14;
  MSVTrialExperiment *trialExperiment;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPCAudioAssetTypeSelector;
  v11 = -[MPCAudioAssetTypeSelector init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    objc_storeStrong((id *)&v12->_defaults, a4);
    objc_storeStrong((id *)&v12->_environmentMonitor, a5);
    +[MPCPlaybackPerformanceController sharedController](MPCPlaybackPerformanceController, "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trialExperimentWithNamespaceName:", CFSTR("MUSIC_PLAYBACK_PERFORMANCE_STEREO_HLS"));
    v14 = objc_claimAutoreleasedReturnValue();
    trialExperiment = v12->_trialExperiment;
    v12->_trialExperiment = (MSVTrialExperiment *)v14;

    if (v12->_trialExperiment)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v12, sel_handleExperimentDidReceiveUpdateNotification_, *MEMORY[0x24BE65C08], v12->_trialExperiment);

    }
    -[MPCAudioAssetTypeSelector updateOutcomeGenerator](v12, "updateOutcomeGenerator");
  }

  return v12;
}

- (void)updateOutcomeGenerator
{
  void *v3;
  double v4;
  id v5;
  double v6;
  id v7;
  double v8;
  MSVABTestGenerator *v9;
  MSVABTestGenerator *outcomeGenerator;
  NSObject *v11;
  int v12;
  MPCAudioAssetTypeSelector *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MPPlaybackUserDefaults progressiveDownloadAssetRatio](self->_defaults, "progressiveDownloadAssetRatio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVTrialExperiment doubleForFactor:](self->_trialExperiment, "doubleForFactor:", CFSTR("StereoHLSAssetRatio"));
  if (v4 > 1.0)
    v4 = 1.0;
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x24BE65C28]);
    objc_msgSend(v3, "floatValue");
    v7 = v5;
LABEL_7:
    v9 = (MSVABTestGenerator *)objc_msgSend(v7, "initWithProbabilityForOutcomeA:", v6);
    outcomeGenerator = self->_outcomeGenerator;
    self->_outcomeGenerator = v9;
    goto LABEL_8;
  }
  if (v4 > 0.0)
  {
    v8 = 1.0 - v4;
    v7 = objc_alloc(MEMORY[0x24BE65C28]);
    *(float *)&v6 = v8;
    goto LABEL_7;
  }
  outcomeGenerator = self->_outcomeGenerator;
  self->_outcomeGenerator = 0;
LABEL_8:

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updated AB Test Outcome Generator", (uint8_t *)&v12, 0xCu);
  }

}

- (BOOL)spatialIsAlwaysOn
{
  void *v3;
  BOOL v4;

  if (!MSVDeviceSupportsMultiChannelMusic())
    return 0;
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spatialAudioPreference") == 1;

  return v4;
}

- (BOOL)spatialIsOff
{
  void *v3;
  BOOL v4;

  if (!MSVDeviceSupportsMultiChannelMusic())
    return 1;
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spatialAudioPreference") == 0;

  return v4;
}

- (MPPlaybackUserDefaults)defaults
{
  return self->_defaults;
}

- (void)handleExperimentDidReceiveUpdateNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__MPCAudioAssetTypeSelector_handleExperimentDidReceiveUpdateNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)updateProbabilityOfProgressiveDownloadAssets:(float)a3
{
  MSVABTestGenerator *outcomeGenerator;
  float v6;
  id v7;
  double v8;
  MSVABTestGenerator *v9;
  MSVABTestGenerator *v10;

  outcomeGenerator = self->_outcomeGenerator;
  if (!outcomeGenerator
    || (-[MSVABTestGenerator probabilityForOutcomeA](outcomeGenerator, "probabilityForOutcomeA"), v6 != a3))
  {
    v7 = objc_alloc(MEMORY[0x24BE65C28]);
    *(float *)&v8 = a3;
    v9 = (MSVABTestGenerator *)objc_msgSend(v7, "initWithProbabilityForOutcomeA:", v8);
    v10 = self->_outcomeGenerator;
    self->_outcomeGenerator = v9;

  }
}

- (unint64_t)audioFormatPreference
{
  unint64_t v3;

  if (-[MPCAudioAssetTypeSelector prefersHighResolutionLossless](self, "prefersHighResolutionLossless"))
  {
    v3 = 8;
  }
  else if (-[MPCAudioAssetTypeSelector prefersLossless](self, "prefersLossless"))
  {
    v3 = 4;
  }
  else if (-[MPCAudioAssetTypeSelector prefersHighQualityStereo](self, "prefersHighQualityStereo"))
  {
    v3 = 2;
  }
  else
  {
    v3 = -[MPCAudioAssetTypeSelector prefersLowQualityStereo](self, "prefersLowQualityStereo");
  }
  if (-[MPCAudioAssetTypeSelector spatialIsOff](self, "spatialIsOff"))
    return v3;
  else
    return v3 | 0x10;
}

- (id)preferredAudioAssetTypeForItem:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isAlwaysLive") & 1) != 0 || objc_msgSend(v4, "isRadioStreamPlayback"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 0);
    v6 = CFSTR("Live or radio streaming playback");
LABEL_4:
    objc_msgSend(v5, "setExplanation:", v6);
    goto LABEL_5;
  }
  objc_msgSend(v4, "genericObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flattenedGenericObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v10 != 1)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 0);
    v6 = CFSTR("Object type is not a song");
    goto LABEL_4;
  }
  objc_msgSend(v4, "genericObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flattenedGenericObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "song");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "traits");

  if (MSVDeviceIsWatch())
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 1);
    v6 = CFSTR("Playback on watch only supports CRABS");
    goto LABEL_4;
  }
  if (!v14 && objc_msgSend(v4, "hasVideo"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 2);
    v6 = CFSTR("Object is a video without traits");
    goto LABEL_4;
  }
  if (objc_msgSend(v4, "prioritizeStartupOverQuality"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 1);
    v6 = CFSTR("Client requested to prioritize startup over quality");
    goto LABEL_4;
  }
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = objc_msgSend(v4, "supportsVocalAttenuation");
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Starting Audio type selection [from preferences - VA Supported: %{BOOL}u] - item:%{public}@", (uint8_t *)v16, 0x12u);
  }

  -[MPCAudioAssetTypeSelector preferredAudioAssetTypeForSongWithTrait:isStartItem:supportsVocalAttenuation:](self, "preferredAudioAssetTypeForSongWithTrait:isStartItem:supportsVocalAttenuation:", v14, objc_msgSend(v4, "isStartItem"), objc_msgSend(v4, "supportsVocalAttenuation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v5;
}

- (id)preferredAudioAssetTypeForSongWithTrait:(unint64_t)a3 isStartItem:(BOOL)a4 supportsVocalAttenuation:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];

  v5 = a4;
  if (a5
    && (-[MPCAudioAssetTypeSelector playbackEngine](self, "playbackEngine"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isVocalAttenuationEnabled"),
        v8,
        v9))
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Vocal attenuation is active and item supports it", v13, 2u);
    }

    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setType:", 1);
    objc_msgSend(v11, "setExplanation:", CFSTR("Vocal attenuation is active and item supports it"));
    return v11;
  }
  else
  {
    -[MPCAudioAssetTypeSelector preferredAudioAssetTypeForSongWithTrait:isStartItem:](self, "preferredAudioAssetTypeForSongWithTrait:isStartItem:", a3, v5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int64_t)nextAssetTypeOutcomeWithIsStartItem:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  -[MPCAudioAssetTypeSelector outcomeGenerator](self, "outcomeGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[MPCAudioAssetTypeSelector outcomeGenerator](self, "outcomeGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    v8 = objc_msgSend(v6, "nextOutcome");
  else
    v8 = objc_msgSend(v6, "lastOutcome");
  v10 = v8;

  if (v10)
    return 2;
  else
    return 1;
}

- (id)preferredAudioAssetTypeForSongWithTrait:(unint64_t)a3 isStartItem:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v4 = a4;
  v25[5] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnhancedAudioAvailable");

  if ((v9 & 1) != 0)
  {
    v10 = -[MPCAudioAssetTypeSelector prefersSpatialOverLossless](self, "prefersSpatialOverLossless");
    if ((a3 & 8) != 0 && v10)
    {
      v11 = 3;
    }
    else if ((a3 & 4) != 0
           && -[MPCAudioAssetTypeSelector prefersHighResolutionLossless](self, "prefersHighResolutionLossless"))
    {
      v11 = 5;
    }
    else if ((a3 & 2) != 0 && -[MPCAudioAssetTypeSelector prefersLossless](self, "prefersLossless"))
    {
      v11 = 4;
    }
    else
    {
      v11 = -[MPCAudioAssetTypeSelector nextAssetTypeOutcomeWithIsStartItem:](self, "nextAssetTypeOutcomeWithIsStartItem:", v4);
    }
    objc_msgSend(v7, "setType:", v11);
    objc_msgSend(v7, "setExplanation:", CFSTR("Audio type selected from traits & preferences"));
    v24[0] = CFSTR("0.Environment");
    -[MPCAudioAssetTypeSelector environmentDescription](self, "environmentDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v24[1] = CFSTR("1.Traits");
    -[MPCAudioAssetTypeSelector descriptionForTraits:](self, "descriptionForTraits:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    v24[2] = CFSTR("2.Preferences");
    -[MPCAudioAssetTypeSelector preferencesDescription](self, "preferencesDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v15;
    v24[3] = CFSTR("3.Experiment");
    -[MPCAudioAssetTypeSelector experimentDescription](self, "experimentDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v16;
    v24[4] = CFSTR("4.Outcome");
    if ((unint64_t)(v11 - 1) > 4)
      v17 = CFSTR("Unspecified");
    else
      v17 = off_24CAB6FF0[v11 - 1];
    v25[4] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setJustification:", v18);

    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "justification");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Audio type selection [from preferences]: %{public}@", (uint8_t *)&v22, 0xCu);

    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - No enhanced audio available on this store front", (uint8_t *)&v22, 2u);
    }

    objc_msgSend(v7, "setType:", -[MPCAudioAssetTypeSelector nextAssetTypeOutcomeWithIsStartItem:](self, "nextAssetTypeOutcomeWithIsStartItem:", v4));
    objc_msgSend(v7, "setExplanation:", CFSTR("Enhanced audio is not available - type selected randomly"));
    objc_msgSend(v7, "setJustification:", 0);
  }
  return v7;
}

- (id)preferredAudioFormatForAudioFormats:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setFormat:", 0);
  objc_msgSend(v8, "setExplanation:", &stru_24CABB5D0);
  objc_msgSend(v8, "setJustification:", 0);
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(v8, "setExplanation:", CFSTR("No available audio formats"));
LABEL_15:
    v18 = v8;
    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnhancedAudioAvailable");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "setExplanation:", CFSTR("No enhanced audio available on this store front"));
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - No enhanced audio available on this store front", buf, 2u);
    }

    goto LABEL_15;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        v14 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "tier");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  if (((v14 & 0x10) != 0 && (v14 & 0xC) != 0 || ((v14 & 0xC) == 0 ? (v19 = (v14 & 0x10) == 0) : (v19 = 1), !v19))
    && -[MPCAudioAssetTypeSelector prefersSpatialOverStereo:](self, "prefersSpatialOverStereo:", v7))
  {
    v20 = 4;
  }
  else if ((v14 & 8) != 0
         && -[MPCAudioAssetTypeSelector prefersHighResolutionLossless](self, "prefersHighResolutionLossless"))
  {
    v20 = 3;
  }
  else if ((v14 & 4) != 0 && -[MPCAudioAssetTypeSelector prefersLossless](self, "prefersLossless"))
  {
    v20 = 2;
  }
  else if ((v14 & 2) != 0 && -[MPCAudioAssetTypeSelector prefersHighQualityStereo](self, "prefersHighQualityStereo"))
  {
    v20 = 1;
  }
  else
  {
    if ((v14 & 1) != 0)
      -[MPCAudioAssetTypeSelector prefersLowQualityStereo](self, "prefersLowQualityStereo");
    v20 = 0;
  }
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __71__MPCAudioAssetTypeSelector_preferredAudioFormatForAudioFormats_route___block_invoke;
  v33[3] = &__block_descriptor_40_e30_B16__0__MPCPlayerAudioFormat_8l;
  v33[4] = v20;
  objc_msgSend(v11, "msv_firstWhere:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFormat:", v21);
  objc_msgSend(v8, "setExplanation:", CFSTR("Audio format selection [from preferences & route]"));
  v42[0] = CFSTR("0.Environment");
  -[MPCAudioAssetTypeSelector environmentDescription](self, "environmentDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v22;
  v42[1] = CFSTR("1.Formats");
  -[MPCAudioAssetTypeSelector descriptionForTiers:](self, "descriptionForTiers:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v23;
  v42[2] = CFSTR("2.Preferences");
  -[MPCAudioAssetTypeSelector preferencesDescription](self, "preferencesDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v24;
  v42[3] = CFSTR("3.Route");
  objc_msgSend(v7, "humanDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v25;
  v42[4] = CFSTR("4.Outcome");
  objc_msgSend(v21, "humanDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setJustification:", v27);

  v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "explanation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "justification");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v29;
    v40 = 2114;
    v41 = v30;
    _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - %{public}@: %{public}@", buf, 0x16u);

  }
  v31 = v8;

LABEL_40:
  return v8;
}

- (id)preferredPlayerAudioFormatForItem:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Starting audio format selection [from preferences & route] - item:%{public}@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v6, "availableSortedFormats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCAudioAssetTypeSelector preferredAudioFormatForAudioFormats:route:](self, "preferredAudioFormatForAudioFormats:route:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)audioFormatMatchingAudioAssetType:(int64_t)a3 formats:(id)a4 route:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[6];
  _QWORD v48[6];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setFormat:", 0);
  objc_msgSend(v10, "setJustification:", 0);
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v10, "setExplanation:", CFSTR("No available audio formats"));
LABEL_22:
    v22 = v10;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEnhancedAudioAvailable");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v10, "setExplanation:", CFSTR("No enhanced audio available on this store front"));
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - No enhanced audio available on this store front", buf, 2u);
    }

    goto LABEL_22;
  }
  v13 = -[MPCAudioAssetTypeSelector tierMatchingAudioAssetType:](self, "tierMatchingAudioAssetType:", a3);
  if (v13 == 4)
  {
    if (-[MPCAudioAssetTypeSelector prefersSpatialOverStereo:](self, "prefersSpatialOverStereo:", v9))
      v13 = 4;
    else
      v13 = 1;
  }
  v35 = v9;
  v14 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke;
  v42[3] = &__block_descriptor_40_e30_B16__0__MPCPlayerAudioFormat_8l;
  v42[4] = v13;
  objc_msgSend(v8, "msv_firstWhere:", v42);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    v41[0] = v14;
    v41[1] = 3221225472;
    v41[2] = __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke_2;
    v41[3] = &__block_descriptor_40_e30_B16__0__MPCPlayerAudioFormat_8l;
    v13 = 1;
    v41[4] = 1;
    objc_msgSend(v8, "msv_firstWhere:", v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(v8, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
    }
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v15);
        v18 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "tier");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(v10, "setFormat:", v36);
  objc_msgSend(v10, "setExplanation:", CFSTR("Audio format selection [from audio asset type & route]"));
  v47[0] = CFSTR("0.Environment");
  -[MPCAudioAssetTypeSelector environmentDescription](self, "environmentDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v23;
  v47[1] = CFSTR("1.Formats");
  -[MPCAudioAssetTypeSelector descriptionForTiers:](self, "descriptionForTiers:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v24;
  v47[2] = CFSTR("2.Audio type");
  if ((unint64_t)(a3 - 1) > 4)
    v25 = CFSTR("Unspecified");
  else
    v25 = off_24CAB6FF0[a3 - 1];
  v9 = v35;
  v48[2] = v25;
  v47[3] = CFSTR("3.Route");
  objc_msgSend(v35, "humanDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v26;
  v47[4] = CFSTR("4.Matched tier");
  NSStringFromMPCPlayerAudioFormatTier(v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v27;
  v47[5] = CFSTR("5.Outcome");
  objc_msgSend(v36, "humanDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setJustification:", v29);

  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "explanation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "justification");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v31;
    v45 = 2114;
    v46 = v32;
    v9 = v35;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - %{public}@: %{public}@", buf, 0x16u);

  }
  v33 = v10;

LABEL_30:
  return v10;
}

- (BOOL)spatialIsAutomatic
{
  void *v3;
  BOOL v4;

  if (!MSVDeviceSupportsMultiChannelMusic())
    return 0;
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spatialAudioPreference") == 2;

  return v4;
}

- (BOOL)prefersSpatialOverStereo:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[MPCAudioAssetTypeSelector spatialIsAlwaysOn](self, "spatialIsAlwaysOn"))
    goto LABEL_5;
  if (!-[MPCAudioAssetTypeSelector spatialIsOff](self, "spatialIsOff"))
  {
    if (objc_msgSend(v4, "type") != 1)
    {
      if (!objc_msgSend(v4, "multiChannelSupport")
        || (objc_msgSend(v4, "isSpatializationEnabled") & 1) != 0
        || objc_msgSend(v4, "canStreamSpatial") && (objc_msgSend(v4, "canRenderSpatial") & 1) == 0)
      {
        v5 = -[MPCAudioAssetTypeSelector spatialIsAutomatic](self, "spatialIsAutomatic");
        goto LABEL_6;
      }
      goto LABEL_3;
    }
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
LABEL_3:
  v5 = 0;
LABEL_6:

  return v5;
}

- (BOOL)prefersSpatialOverLossless
{
  return -[MPCAudioAssetTypeSelector spatialIsAutomatic](self, "spatialIsAutomatic")
      || -[MPCAudioAssetTypeSelector spatialIsAlwaysOn](self, "spatialIsAlwaysOn");
}

- (BOOL)prefersHighResolutionLossless
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  if (!MSVDeviceSupportsLosslessMusic())
    return 0;
  v3 = -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh");
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "preferredMusicHighBandwidthResolution");
  else
    v6 = objc_msgSend(v4, "preferredMusicLowBandwidthResolution");
  v7 = v6 == 192000;

  return v7;
}

- (BOOL)prefersLossless
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  if (!MSVDeviceSupportsLosslessMusic())
    return 0;
  v3 = -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh");
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "preferredMusicHighBandwidthResolution");
  else
    v6 = objc_msgSend(v4, "preferredMusicLowBandwidthResolution");
  v7 = v6 > 47999;

  return v7;
}

- (BOOL)prefersHighQualityStereo
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh");
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "preferredMusicHighBandwidthResolution");
  else
    v6 = objc_msgSend(v4, "preferredMusicLowBandwidthResolution");
  v7 = v6;

  return v7 == 256;
}

- (BOOL)prefersLowQualityStereo
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh");
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "preferredMusicHighBandwidthResolution");
  else
    v6 = objc_msgSend(v4, "preferredMusicLowBandwidthResolution");
  v7 = v6;

  return v7 == 64;
}

- (BOOL)networkBandwidthIsHigh
{
  void *v3;
  uint64_t v4;
  int v5;
  char IsWiFi;
  void *v7;
  void *v8;
  char v9;

  -[MPCAudioAssetTypeSelector environmentMonitor](self, "environmentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "networkType");

  if ((ICEnvironmentNetworkTypeIsBluetooth() & 1) != 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((ICEnvironmentNetworkTypeIsWired() & 1) != 0)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  IsWiFi = ICEnvironmentNetworkTypeIsWiFi();
  -[MPCAudioAssetTypeSelector environmentMonitor](self, "environmentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((IsWiFi & 1) != 0)
  {
LABEL_9:
    v5 = objc_msgSend(v8, "isNetworkConstrained") ^ 1;

    return v5;
  }
  v9 = objc_msgSend(v7, "isCurrentNetworkLinkExpensive");

  LOBYTE(v5) = 0;
  if ((v9 & 1) == 0 && v4 >= 3)
  {
    -[MPCAudioAssetTypeSelector environmentMonitor](self, "environmentMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  return v5;
}

- (int64_t)maxResolution
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int v8;
  int v9;

  v3 = -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh");
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "preferredMusicHighBandwidthResolution");
  else
    v6 = objc_msgSend(v4, "preferredMusicLowBandwidthResolution");
  v7 = v6;

  v8 = MSVDeviceSupportsLosslessMusic();
  if (v7 < 48000)
    v9 = 1;
  else
    v9 = v8;
  if (v9)
    return v7;
  else
    return 256;
}

- (int64_t)spatialPreference
{
  void *v2;
  int64_t v3;

  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "spatialAudioPreference");

  return v3;
}

- (id)descriptionForTraits:(unint64_t)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v3 = a3;
  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (a3 >> 1) & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Lossless: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v3 >> 2) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("HRLossless: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v3 >> 3) & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Spatial: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" - "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)descriptionForTiers:(unint64_t)a3
{
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3 & 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("LQStereo: %@"), v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3 >> 1) & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("HQStereo: %@"), v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3 >> 2) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Lossless: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3 >> 3) & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("HighResLossless: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a3 >> 4) & 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Spatial: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" - "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)preferencesDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCAudioAssetTypeSelector prefersLowQualityStereo](self, "prefersLowQualityStereo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("LQStereo: %@"), v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCAudioAssetTypeSelector prefersHighQualityStereo](self, "prefersHighQualityStereo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("HQStereo: %@"), v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCAudioAssetTypeSelector prefersLossless](self, "prefersLossless"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Lossless: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCAudioAssetTypeSelector prefersHighResolutionLossless](self, "prefersHighResolutionLossless"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("HRLossless: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v10;
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[MPCAudioAssetTypeSelector defaults](self, "defaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "spatialAudioPreference");
  if (v13 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown preference:%ld"), v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24CAB7018[v13];
  }
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Spatial: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" - "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)experimentDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;

  -[MPCAudioAssetTypeSelector trialExperiment](self, "trialExperiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "treatmentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[MPCAudioAssetTypeSelector trialExperiment](self, "trialExperiment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAudioAssetTypeSelector trialExperiment](self, "trialExperiment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "treatmentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAudioAssetTypeSelector trialExperiment](self, "trialExperiment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deploymentID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@/%@"), v7, v9, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("None");
  }
  return v12;
}

- (id)environmentDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
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
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MPCAudioAssetTypeSelector environmentMonitor](self, "environmentMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "networkType");
  v6 = CFSTR("Unknown");
  v24 = v4;
  if (v5 > 99)
  {
    if (v5 > 1000)
    {
      switch(v5)
      {
        case 1001:
          v6 = CFSTR("Bridged WiFi");
          break;
        case 2000:
          v6 = CFSTR("Wired Ethernet");
          break;
        case 3000:
          v6 = CFSTR("Other");
          break;
      }
    }
    else
    {
      switch(v5)
      {
        case 100:
          goto LABEL_3;
        case 500:
          v6 = CFSTR("Bluetooth");
          break;
        case 1000:
          v6 = CFSTR("WiFi");
          break;
      }
    }
  }
  else if ((unint64_t)(v5 - 1) < 8)
  {
LABEL_3:
    v6 = CFSTR("Cellular");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Network: %@"), v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[MPCAudioAssetTypeSelector environmentMonitor](self, "environmentMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isCurrentNetworkLinkExpensive"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Expensive: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[MPCAudioAssetTypeSelector environmentMonitor](self, "environmentMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isNetworkConstrained"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Constrained: %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v16;
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("HighBandwidth: %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" - "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int64_t)tierMatchingAudioAssetType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      result = -[MPCAudioAssetTypeSelector prefersLowQualityStereo](self, "prefersLowQualityStereo", v3, v4) ^ 1;
      break;
    case 3:
      result = 4;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 3;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (ICEnvironmentMonitor)environmentMonitor
{
  return self->_environmentMonitor;
}

- (void)setEnvironmentMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_environmentMonitor, a3);
}

- (void)setTrialExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperiment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialExperiment, 0);
  objc_storeStrong((id *)&self->_outcomeGenerator, 0);
  objc_storeStrong((id *)&self->_environmentMonitor, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_defaults, 0);
}

BOOL __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tier") == *(_QWORD *)(a1 + 32);
}

BOOL __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tier") == *(_QWORD *)(a1 + 32);
}

BOOL __71__MPCAudioAssetTypeSelector_preferredAudioFormatForAudioFormats_route___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tier") == *(_QWORD *)(a1 + 32);
}

uint64_t __74__MPCAudioAssetTypeSelector_handleExperimentDidReceiveUpdateNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "refresh");
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Did update experiment: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "updateOutcomeGenerator");
}

@end
