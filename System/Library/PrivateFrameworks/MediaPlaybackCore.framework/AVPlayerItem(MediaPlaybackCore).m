@implementation AVPlayerItem(MediaPlaybackCore)

- (uint64_t)mpc_setupWithAudioAssetType:()MediaPlaybackCore forceSpatial:
{
  objc_msgSend(a1, "mpc_updateAVAudioSpatializationFormatsForAudioAssetType:");
  objc_msgSend(a1, "mpc_updateAVVariantPreferenceForAudioAssetType:forceSpatial:", a3, a4);
  objc_msgSend(a1, "mpc_updatePreferredMaximumAudioSampleRateForAudioAssetType:", a3);
  return objc_msgSend(a1, "mpc_updatePreferredForwardBufferDurationForAudioAssetType:", a3);
}

- (void)mpc_setupWithPlayerAudioFormat:()MediaPlaybackCore forceSpatial:downloadedAsset:
{
  id v8;

  v8 = a3;
  objc_msgSend(a1, "mpc_updateAVAudioSpatializationFormatsForPlayerAudioFormat:", v8);
  objc_msgSend(a1, "mpc_updateAVVariantPreferenceForPlayerAudioFormat:forceSpatial:", v8, a4);
  objc_msgSend(a1, "mpc_updatePreferredMaximumAudioSampleRateForPlayerAudioFormat:", v8);
  objc_msgSend(a1, "mpc_updatePrefersOfflinePlayableVariantForPlayerAudioFormat:isDownloadedAsset:", v8, a5);
  objc_msgSend(a1, "mpc_updatePreferredForwardBufferDurationForPlayerAudioFormat:", v8);

}

- (void)mpc_setupWithSpatialPreference:()MediaPlaybackCore maxResolution:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (MSVDeviceIsHomePod())
    objc_msgSend(a1, "setAutoSwitchAtmosStreamVariants:", 0);
  v7 = 20;
  if (a3 == 1)
    v7 = 28;
  if (a4 <= 47999)
    v8 = v7;
  else
    v8 = v7 | 3;
  objc_msgSend(a1, "setVariantPreferences:", v8);
  if (a3 == 1)
  {
    v9 = 4;
    goto LABEL_12;
  }
  if (a3)
  {
    v9 = 7;
LABEL_12:
    objc_msgSend(a1, "setAllowedAudioSpatializationFormats:", v9);
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forwardBufferDuration");
    objc_msgSend(a1, "setPreferredForwardBufferDuration:");

    if (a4 <= 47999)
      return;
LABEL_16:
    objc_msgSend(a1, "setPreferredMaximumAudioSampleRate:", (double)a4);
    return;
  }
  objc_msgSend(a1, "setAllowedAudioSpatializationFormats:", 3);
  if (a4 > 47999)
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forwardBufferDuration");
    objc_msgSend(a1, "setPreferredForwardBufferDuration:");

    goto LABEL_16;
  }
}

- (uint64_t)mpc_updateAVVariantPreferenceForAudioAssetType:()MediaPlaybackCore forceSpatial:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 20;
  v5 = 20;
  if (a4)
    v5 = 28;
  if (a3 == 3)
    v4 = v5;
  if ((unint64_t)(a3 - 4) >= 2)
    v6 = v4;
  else
    v6 = 23;
  return objc_msgSend(a1, "setVariantPreferences:", v6);
}

- (uint64_t)mpc_updateAVAudioSpatializationFormatsForAudioAssetType:()MediaPlaybackCore
{
  if (MSVDeviceIsHomePod())
    objc_msgSend(a1, "setAutoSwitchAtmosStreamVariants:", 0);
  return objc_msgSend(a1, "setAllowedAudioSpatializationFormats:", 4 * (a3 == 3));
}

- (uint64_t)mpc_updatePreferredMaximumAudioSampleRateForAudioAssetType:()MediaPlaybackCore
{
  double v3;

  v3 = 48000.0;
  if (a3 != 4)
    v3 = 0.0;
  if (a3 == 5)
    v3 = 192000.0;
  return objc_msgSend(a1, "setPreferredMaximumAudioSampleRate:", v3);
}

- (void)mpc_updatePreferredForwardBufferDurationForAudioAssetType:()MediaPlaybackCore
{
  id v4;

  if ((unint64_t)(a3 - 2) <= 3)
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardBufferDuration");
    objc_msgSend(a1, "setPreferredForwardBufferDuration:");

  }
}

- (uint64_t)mpc_updateAVVariantPreferenceForPlayerAudioFormat:()MediaPlaybackCore forceSpatial:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend(a3, "tier");
  v7 = 4;
  v8 = 4;
  if (a4)
    v8 = 12;
  if (v6 == 4)
    v7 = v8;
  if ((unint64_t)(v6 - 2) >= 2)
    v9 = v7;
  else
    v9 = 7;
  return objc_msgSend(a1, "setVariantPreferences:", v9);
}

- (void)mpc_updateAVAudioSpatializationFormatsForPlayerAudioFormat:()MediaPlaybackCore
{
  id v4;

  v4 = a3;
  if (MSVDeviceIsHomePod())
    objc_msgSend(a1, "setAutoSwitchAtmosStreamVariants:", 0);
  objc_msgSend(a1, "setAllowedAudioSpatializationFormats:", 4 * (objc_msgSend(v4, "tier") == 4));

}

- (uint64_t)mpc_updatePreferredMaximumAudioSampleRateForPlayerAudioFormat:()MediaPlaybackCore
{
  uint64_t v4;
  double v5;

  v4 = objc_msgSend(a3, "tier");
  v5 = 48000.0;
  if (v4 != 2)
    v5 = 0.0;
  if (v4 == 3)
    v5 = 192000.0;
  return objc_msgSend(a1, "setPreferredMaximumAudioSampleRate:", v5);
}

- (uint64_t)mpc_updatePrefersOfflinePlayableVariantForPlayerAudioFormat:()MediaPlaybackCore isDownloadedAsset:
{
  uint64_t result;

  result = objc_msgSend(a3, "tier");
  if ((unint64_t)(result - 2) <= 2)
    return objc_msgSend(a1, "setPrefersOfflinePlayableVariants:", a4);
  return result;
}

- (void)mpc_updatePreferredForwardBufferDurationForPlayerAudioFormat:()MediaPlaybackCore
{
  id v4;

  if ((unint64_t)(objc_msgSend(a3, "tier") - 2) <= 2)
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardBufferDuration");
    objc_msgSend(a1, "setPreferredForwardBufferDuration:");

  }
}

- (id)mpc_setupDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "prefersOfflinePlayableVariants"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("prefersOfflinePlayableVariants"));

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "preferredMaximumAudioSampleRate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("preferredMaximumAudioSampleRate"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "preferredForwardBufferDuration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("preferredForwardBufferDuration"));

  if (objc_msgSend(a1, "allowedAudioSpatializationFormats") == 4)
  {
    v8 = CFSTR("Multichannel");
  }
  else if (objc_msgSend(a1, "allowedAudioSpatializationFormats"))
  {
    if (objc_msgSend(a1, "allowedAudioSpatializationFormats") == 3)
    {
      v8 = CFSTR("MonoAndStereo");
    }
    else
    {
      if (objc_msgSend(a1, "allowedAudioSpatializationFormats") != 7)
        goto LABEL_10;
      v8 = CFSTR("MonoStereoAndMultichannel");
    }
  }
  else
  {
    v8 = CFSTR("None");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("allowedAudioSpatializationFormats"));
LABEL_10:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  if ((objc_msgSend(a1, "variantPreferences") & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GaplessAudioTransitions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  if ((objc_msgSend(a1, "variantPreferences") & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BinauralAudioForUnknownAudioDeviceTypes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  if ((objc_msgSend(a1, "variantPreferences") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ScalabilityToLosslessAudio"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  if ((objc_msgSend(a1, "variantPreferences") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnconstrainedAudioSampleRate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("[%@]"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("variantPreferences"));

  objc_msgSend(v2, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)mpc_playerItemIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ %p"), v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)mpc_setReportingValue:()MediaPlaybackCore forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (_NSIsNSNumber())
  {
    objc_msgSend(a1, "setReportingValueWithNumber:forKey:", v7, v6);
  }
  else if (_NSIsNSString())
  {
    objc_msgSend(a1, "setReportingValueWithString:forKey:", v7, v6);
  }

}

@end
