@implementation CSAsset(SmartSiriVolume)

- (id)_adaptiveSiriVolumeDictionary
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "resourcePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("siriVolume.json"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D18FC0], "decodeJson:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)SSVEnergyBufferSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("energyBufferSize"), CFSTR("smartSiriVolume"), &unk_1E7C634D0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVNoiseLowerPercentile
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseLowerPercentile"), CFSTR("smartSiriVolume"), &unk_1E7C634E8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVNoiseUpperPercentile
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseUpperPercentile"), CFSTR("smartSiriVolume"), &unk_1E7C63500);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVLKFSLowerPercentile
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSLowerPercentile"), CFSTR("smartSiriVolume"), &unk_1E7C634E8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVLKFSUpperPercentile
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSUpperPercentile"), CFSTR("smartSiriVolume"), &unk_1E7C63500);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVNoiseTimeConstant
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseTimeConstant"), CFSTR("smartSiriVolume"), &unk_1E7C63F70);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVNoiseMicSensitivityOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseMicSensitivityOffset"), CFSTR("smartSiriVolume"), &unk_1E7C63F80);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVNoiseMicSensitivityOffsetDeviceSimple
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseMicSensitivityOffsetDeviceSimple"), CFSTR("smartSiriVolume"), &unk_1E7C63F90);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVLKFSTimeConstant
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSTimeConstant"), CFSTR("smartSiriVolume"), &unk_1E7C63FA0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVLKFSMicSensitivityOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSMicSensitivityOffset"), CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingInputRangeLow
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseTTSMappingInputRangeLow"), CFSTR("smartSiriVolume"), &unk_1E7C63FC0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingInputRangeHigh
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseTTSMappingInputRangeHigh"), CFSTR("smartSiriVolume"), &unk_1E7C63FD0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingOutputRangeLow
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseTTSMappingOutputRangeLow"), CFSTR("smartSiriVolume"), &unk_1E7C63FE0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingOutputRangeHigh
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseTTSMappingOutputRangeHigh"), CFSTR("smartSiriVolume"), &unk_1E7C63FF0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingInputRangeLow
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSTTSMappingInputRangeLow"), CFSTR("smartSiriVolume"), &unk_1E7C64000);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingInputRangeHigh
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSTTSMappingInputRangeHigh"), CFSTR("smartSiriVolume"), &unk_1E7C64010);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingOutputRangeLow
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSTTSMappingOutputRangeLow"), CFSTR("smartSiriVolume"), &unk_1E7C64020);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingOutputRangeHigh
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSTTSMappingOutputRangeHigh"), CFSTR("smartSiriVolume"), &unk_1E7C64030);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVUserOffsetInputRangeLow
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("userOffsetInputRangeLow"), CFSTR("smartSiriVolume"), &unk_1E7C64040);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVUserOffsetInputRangeHigh
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("userOffsetInputRangeHigh"), CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVUserOffsetOutputRangeLow
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("userOffsetOutputRangeLow"), CFSTR("smartSiriVolume"), &unk_1E7C64050);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVUserOffsetOutputRangeHigh
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("userOffsetOutputRangeHigh"), CFSTR("smartSiriVolume"), &unk_1E7C64060);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVTTSVolumeLowerLimitDB
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("TTSVolumeLowerLimitDB"), CFSTR("smartSiriVolume"), &unk_1E7C64070);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVTTSVolumeUpperLimitDB
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("TTSVolumeUpperLimitDB"), CFSTR("smartSiriVolume"), &unk_1E7C64060);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVNoiseWeight
{
  void *v1;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseWeight"), CFSTR("smartSiriVolume"), &unk_1E7C64080);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");

}

- (uint64_t)SSVNoiseLevelChannelBitset
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if ((CSIsTorpedo() & 1) != 0)
  {
    v2 = &unk_1E7C63518;
  }
  else
  {
    v2 = &unk_1E7C63560;
    if (CSIsHorseman())
    {
      v3 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
      v4 = &unk_1E7C63548;
      if (v3 != 3)
        v4 = &unk_1E7C63560;
      if (v3 == 2)
        v2 = &unk_1E7C63530;
      else
        v2 = v4;
    }
  }
  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("noiseLevelChannelBitset"), CFSTR("smartSiriVolume"), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  return v6;
}

- (uint64_t)SSVLKFSChannelBitset
{
  void *v2;
  void *v3;
  uint64_t v4;

  if ((CSIsTorpedo() & 1) != 0)
  {
    v2 = &unk_1E7C63578;
  }
  else
  {
    v2 = &unk_1E7C63590;
    if (CSIsHorseman() && objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 3)
      v2 = &unk_1E7C635A8;
  }
  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("LKFSChannelBitset"), CFSTR("smartSiriVolume"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (uint64_t)SSVDistanceChannelBitset
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if ((CSIsTorpedo() & 1) != 0)
  {
    v2 = &unk_1E7C635C0;
  }
  else
  {
    v2 = &unk_1E7C63560;
    if (CSIsHorseman())
    {
      v3 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
      v4 = &unk_1E7C63548;
      if (v3 != 3)
        v4 = &unk_1E7C63560;
      if (v3 == 2)
        v2 = &unk_1E7C635D8;
      else
        v2 = v4;
    }
  }
  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("DistanceChannelBitset"), CFSTR("smartSiriVolume"), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  return v6;
}

- (uint64_t)SSVCAMaxFrameSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMaxFrameSize"), CFSTR("smartSiriVolume"), &unk_1E7C635F0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCAVoiceTriggerBasedTTSValidForSeconds
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAVoiceTriggerBasedTTSValidForSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C64090);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain"), CFSTR("smartSiriVolume"), &unk_1E7C63608);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (uint64_t)SSVCASmartSiriVolumeSyncedMetricLogsToRetain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASmartSiriVolumeSyncedMetricLogsToRetain"), CFSTR("smartSiriVolume"), &unk_1E7C63608);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (float)SSVCAVoiceTriggerInitialSilenceDurationSeconds
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAVoiceTriggerInitialSilenceDurationSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C64080);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCADistanceInputBufferDurationSeconds
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADistanceInputBufferDurationSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C63620);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (float)SSVCAListenPollingIntervalAtStartInSeconds
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAListenPollingIntervalAtStartInSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C640A0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADefaultZeroFloatingPointValue
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADefaultZeroFloatingPointValue"), CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCAAnnouncementStatusFetchTimeoutMs
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAAnnouncementStatusFetchTimeoutMs"), CFSTR("smartSiriVolume"), &unk_1E7C63638);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCADefaultOutputTTSVolume
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADefaultOutputTTSVolume"), CFSTR("smartSiriVolume"), &unk_1E7C640B0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCANoiseActivityCountThreshold
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCANoiseActivityCountThreshold"), CFSTR("smartSiriVolume"), &unk_1E7C63650);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (float)SSVCASpeakerDistanceFarBoostFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASpeakerDistanceFarBoostFactor"), CFSTR("smartSiriVolume"), &unk_1E7C640C0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASpeakerDistanceMidBoostFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASpeakerDistanceMidBoostFactor"), CFSTR("smartSiriVolume"), &unk_1E7C640D0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASpeakerDistanceNearBoostFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASpeakerDistanceNearBoostFactor"), CFSTR("smartSiriVolume"), &unk_1E7C640E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (double)SSVCADistanceModelConfidenceThreshold
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADistanceModelConfidenceThreshold"), CFSTR("smartSiriVolume"), &unk_1E7C63ED0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAMinimumLinearSoundLevel
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMinimumLinearSoundLevel"), CFSTR("smartSiriVolume"), &unk_1E7C640F0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAMaximumLinearSoundLevel
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMaximumLinearSoundLevel"), CFSTR("smartSiriVolume"), &unk_1E7C64100);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCALinearToDecibelConstantMultiplier
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCALinearToDecibelConstantMultiplier"), CFSTR("smartSiriVolume"), &unk_1E7C64110);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADecibelToLinearLogBase
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADecibelToLinearLogBase"), CFSTR("smartSiriVolume"), &unk_1E7C64120);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseDilationFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidNoiseDilationFactor"), CFSTR("smartSiriVolume"), &unk_1E7C64130);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceDefault
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidMusicDilationFactorDeviceDefault"), CFSTR("smartSiriVolume"), &unk_1E7C64140);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicDilationFactorDeviceSimple");
    v5 = &unk_1E7C64150;
LABEL_8:
    objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v4, CFSTR("smartSiriVolume"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");

    return;
  }
  if (v2 != 1)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicDilationFactorDeviceSimple2");
    v5 = &unk_1E7C64140;
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicDilationFactorDeviceSimple]";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Dilation factor requested for device default!", (uint8_t *)&v7, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidSpeechDilationFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidSpeechDilationFactor"), CFSTR("smartSiriVolume"), &unk_1E7C64030);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseVSpread
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidNoiseVSpread"), CFSTR("smartSiriVolume"), &unk_1E7C64160);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidMusicVSpreadDeviceDefault"), CFSTR("smartSiriVolume"), &unk_1E7C64110);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicVSpreadDeviceSimple
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicVSpreadDeviceSimple");
LABEL_8:
    objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v4, CFSTR("smartSiriVolume"), &unk_1E7C64110);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");

    return;
  }
  if (v2 != 1)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicVSpreadDeviceSimple2");
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVSpreadDeviceSimple]";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s V Spread requested for device default!", (uint8_t *)&v6, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidSpeechVSpread
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidSpeechVSpread"), CFSTR("smartSiriVolume"), &unk_1E7C64170);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseVOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidNoiseVOffset"), CFSTR("smartSiriVolume"), &unk_1E7C64180);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidMusicVOffsetDeviceDefault"), CFSTR("smartSiriVolume"), &unk_1E7C63FE0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicVOffsetDeviceSimple
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicVOffsetDeviceSimple");
LABEL_8:
    objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v4, CFSTR("smartSiriVolume"), &unk_1E7C63FE0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");

    return;
  }
  if (v2 != 1)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicVOffsetDeviceSimple2");
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVOffsetDeviceSimple]";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s V Offset requested for device default!", (uint8_t *)&v6, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidSpeechVOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidSpeechVOffset"), CFSTR("smartSiriVolume"), &unk_1E7C64180);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseHOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidNoiseHOffset"), CFSTR("smartSiriVolume"), &unk_1E7C64190);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidMusicHOffsetDeviceDefault"), CFSTR("smartSiriVolume"), &unk_1E7C641A0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicHOffsetDeviceSimple
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicHOffsetDeviceSimple");
    v5 = &unk_1E7C641B0;
LABEL_8:
    objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v4, CFSTR("smartSiriVolume"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");

    return;
  }
  if (v2 != 1)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicHOffsetDeviceSimple2");
    v5 = &unk_1E7C641A0;
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicHOffsetDeviceSimple]";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s H Offset requested for device default!", (uint8_t *)&v7, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidSpeechHOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidSpeechHOffset"), CFSTR("smartSiriVolume"), &unk_1E7C641C0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidMusicSteepnessDeviceDefault"), CFSTR("smartSiriVolume"), &unk_1E7C641D0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicSteepnessDeviceSimple
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicSteepnessDeviceSimple");
LABEL_8:
    objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v4, CFSTR("smartSiriVolume"), &unk_1E7C641D0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");

    return;
  }
  if (v2 != 1)
  {
    v4 = CFSTR("SSVCASignalToSigmoidMusicSteepnessDeviceSimple2");
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicSteepnessDeviceSimple]";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Music steepness requested for device default!", (uint8_t *)&v6, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidNoiseSteepness
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidNoiseSteepness"), CFSTR("smartSiriVolume"), &unk_1E7C641E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidSpeechSteepness
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCASignalToSigmoidSpeechSteepness"), CFSTR("smartSiriVolume"), &unk_1E7C641F0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSMinimumOutput
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSMinimumOutput"), CFSTR("smartSiriVolume"), &unk_1E7C64200);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSMaximumOutput
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSMaximumOutput"), CFSTR("smartSiriVolume"), &unk_1E7C64210);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSTransitionPoint
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSTransitionPoint"), CFSTR("smartSiriVolume"), &unk_1E7C63FE0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPreTransitionOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSPreTransitionOffset"), CFSTR("smartSiriVolume"), &unk_1E7C64220);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPreTransitionMultiplier
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSPreTransitionMultiplier"), CFSTR("smartSiriVolume"), &unk_1E7C64230);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPostTransitionOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSPostTransitionOffset"), CFSTR("smartSiriVolume"), &unk_1E7C64240);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPostTransitionDC
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSPostTransitionDC"), CFSTR("smartSiriVolume"), &unk_1E7C640B0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPostTransitionMultiplier
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADBToTTSPostTransitionMultiplier"), CFSTR("smartSiriVolume"), &unk_1E7C64250);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAMinimumDistanceUpdateWaitPeriodSeconds
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMinimumDistanceUpdateWaitPeriodSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C640A0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCANoiseActivityThreshold
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCANoiseActivityThreshold"), CFSTR("smartSiriVolume"), &unk_1E7C64260);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCANoiseResultsBufferSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCANoiseResultsBufferSize"), CFSTR("smartSiriVolume"), &unk_1E7C63668);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVCAMusicResultsBufferSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMusicResultsBufferSize"), CFSTR("smartSiriVolume"), &unk_1E7C63668);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCADefaultSpeechStrength
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADefaultSpeechStrength"), CFSTR("smartSiriVolume"), &unk_1E7C64270);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADefaultMusicStrength
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADefaultMusicStrength"), CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCANoiseActivityHistoricalSampleCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCANoiseActivityHistoricalSampleCount"), CFSTR("smartSiriVolume"), &unk_1E7C63680);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVCADspCoefsCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADspCoefsCount"), CFSTR("smartSiriVolume"), &unk_1E7C63698);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVCADspNumStages
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADspNumStages"), CFSTR("smartSiriVolume"), &unk_1E7C636B0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)SSVCADistanceResultsBufferSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADistanceResultsBufferSize"), CFSTR("smartSiriVolume"), &unk_1E7C636C8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCAExponentialDistanceHistoryDegradationFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAExponentialDistanceHistoryDegradationFactor"), CFSTR("smartSiriVolume"), &unk_1E7C64280);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCADistanceResultSampleCountTolerance
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADistanceResultSampleCountTolerance"), CFSTR("smartSiriVolume"), &unk_1E7C636E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCAMusicHistoricalSamplesInSeconds
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMusicHistoricalSamplesInSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C64090);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleOutputMinTargetDB
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
  {
    v2 = CFSTR("SSVCADeviceSimpleOutputMinTargetDB");
    v3 = &unk_1E7C64290;
  }
  else
  {
    v2 = CFSTR("SSVCADeviceSimple2OutputMinTargetDB");
    v3 = &unk_1E7C642A0;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleOutputMaxTargetDB
{
  const __CFString *v2;
  void *v3;
  float v4;
  float v5;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
    v2 = CFSTR("SSVCADeviceSimpleOutputMaxTargetDB");
  else
    v2 = CFSTR("SSVCADeviceSimple2OutputMaxTargetDB");
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (float)SSVCADeviceSimpleOutputSlope
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
  {
    v2 = CFSTR("SSVCADeviceSimpleOutputSlope");
    v3 = &unk_1E7C642B0;
  }
  else
  {
    v2 = CFSTR("SSVCADeviceSimple2OutputSlope");
    v3 = &unk_1E7C642C0;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleMinTargetDB
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceSimpleMinTargetDB"), CFSTR("smartSiriVolume"), &unk_1E7C64040);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleMaxTargetDB
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceSimpleMaxTargetDB"), CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleDBToSystemVolSlope
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceSimpleDBToSystemVolSlope"), CFSTR("smartSiriVolume"), &unk_1E7C642D0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleMicSensitivityOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceSimpleMicSensitivityOffset"), CFSTR("smartSiriVolume"), &unk_1E7C63F70);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceSimplePreTriggerSilenceSampleCount"), CFSTR("smartSiriVolume"), &unk_1E7C636F8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCAMinTTSSystemVolume
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
  {
    v2 = CFSTR("SSVCAMinTTSSystemVolume");
    v3 = &unk_1E7C63FB0;
  }
  else
  {
    v2 = CFSTR("SSVCAMinTTSSystemVolumeSimple2");
    v3 = &unk_1E7C641F0;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (float)SSVCAMaxTTSSystemVolume
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
  {
    v2 = CFSTR("SSVCAMaxTTSSystemVolume");
    v3 = &unk_1E7C640A0;
  }
  else
  {
    v2 = CFSTR("SSVCAMaxTTSSystemVolumeSimple2");
    v3 = &unk_1E7C642E0;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (uint64_t)SSVCAUserIntentValidForSeconds
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAUserIntentValidForSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C63710);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCAUserIntentVolumeIncreaseFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAUserIntentVolumeIncreaseFactor"), CFSTR("smartSiriVolume"), &unk_1E7C642F0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentVolumeDecreaseFactor
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAUserIntentVolumeDecreaseFactor"), CFSTR("smartSiriVolume"), &unk_1E7C64300);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentPermanentOffsetFactorDelta
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAUserIntentPermanentOffsetFactorDelta"), CFSTR("smartSiriVolume"), &unk_1E7C64310);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentPermanentOffsetFactorLowerBound
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAUserIntentPermanentOffsetFactorLowerBound"), CFSTR("smartSiriVolume"), &unk_1E7C64320);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentPermanentOffsetFactorUpperBound
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAUserIntentPermanentOffsetFactorUpperBound"), CFSTR("smartSiriVolume"), &unk_1E7C640E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleMinTTSVolume
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
  {
    v2 = CFSTR("SSVCADeviceSimpleMinTTSVolume");
    v3 = &unk_1E7C64330;
  }
  else
  {
    v2 = CFSTR("SSVCAMinTTSSystemVolumeSimple2");
    v3 = &unk_1E7C641F0;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleMaxTTSVolume
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 2)
  {
    v2 = CFSTR("SSVCADeviceSimpleMaxTTSVolume");
    v3 = &unk_1E7C64340;
  }
  else
  {
    v2 = CFSTR("SSVCAMaxTTSSystemVolumeSimple2");
    v3 = &unk_1E7C642E0;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v2, CFSTR("smartSiriVolume"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (float)SSVCADeviceDefaultMinTTSVolume
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMinTTSSystemVolumeSimple2"), CFSTR("smartSiriVolume"), &unk_1E7C641F0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceDefaultMaxTTSVolume
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMaxTTSSystemVolumeSimple2"), CFSTR("smartSiriVolume"), &unk_1E7C642E0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADeviceDefaultASVOffMinTTSVolume
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceDefaultASVOffMinTTSVolume"), CFSTR("smartSiriVolume"), &unk_1E7C64350);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)SSVCADeviceSimpleASVOffMinTTSVolume
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v4 = CFSTR("SSVCADeviceSimpleASVOffMinTTSVolume");
    v5 = &unk_1E7C64360;
LABEL_8:
    objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v4, CFSTR("smartSiriVolume"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");

    return;
  }
  if (v2 != 1)
  {
    v4 = CFSTR("SSVCADeviceSimple2ASVOffMinTTSVolume");
    v5 = &unk_1E7C64370;
    goto LABEL_8;
  }
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSAsset(SmartSiriVolume) SSVCADeviceSimpleASVOffMinTTSVolume]";
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Minimum TTS volume for ASV disabled case requested for device default!", (uint8_t *)&v7, 0xCu);
  }
}

- (float)SSVCADeviceDefaultMicSensitivityOffset
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCADeviceDefaultMicSensitivityOffset"), CFSTR("smartSiriVolume"), &unk_1E7C63FB0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCAVolumeHalfLifeSeconds
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAVolumeHalfLifeSeconds"), CFSTR("smartSiriVolume"), &unk_1E7C64380);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)SSVCAHistoricalVolumeBufferSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAHistoricalVolumeBufferSize"), CFSTR("smartSiriVolume"), &unk_1E7C63728);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (float)SSVCAMaximumCompensatedSpeechLevelNearField
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", CFSTR("SSVCAMaximumCompensatedSpeechLevelNearField"), CFSTR("smartSiriVolume"), &unk_1E7C64390);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (float)SSVCADropInCallAnnouncementMinTTSVolume
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  if (v2 == 2)
  {
    v3 = CFSTR("SSVCADeviceSimpleDropInCallAnnouncementMinTTSVolume");
    v4 = &unk_1E7C643A0;
  }
  else
  {
    if (v2 == 1)
      v3 = CFSTR("SSVCADeviceDefaultDropInCallAnnouncementMinTTSVolume");
    else
      v3 = CFSTR("SSVCADeviceSimple2DropInCallAnnouncementMinTTSVolume");
    v4 = &unk_1E7C64330;
  }
  objc_msgSend(a1, "_getNumberFromASVDictionaryForKey:category:default:", v3, CFSTR("smartSiriVolume"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (id)_getNumberFromASVDictionaryForKey:()SmartSiriVolume category:default:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_adaptiveSiriVolumeDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_5;
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_5;
  v14 = (void *)v13;
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v19 = *MEMORY[0x1E0D18F20];
    v18 = v10;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315906;
      v22 = "-[CSAsset(SmartSiriVolume) _getNumberFromASVDictionaryForKey:category:default:]";
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v8;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v21, 0x2Au);
      v18 = v10;
    }
  }

  return v18;
}

- (id)SSVParameterDirectionary
{
  void *v2;
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
  _QWORD v50[27];
  _QWORD v51[29];

  v51[27] = *MEMORY[0x1E0C80C00];
  v50[0] = CFSTR("noiseLevelChannelBitset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "SSVNoiseLevelChannelBitset"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v49;
  v50[1] = CFSTR("LKFSChannelBitset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "SSVLKFSChannelBitset"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v48;
  v50[2] = CFSTR("energyBufferSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "SSVEnergyBufferSize"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v47;
  v50[3] = CFSTR("noiseLowerPercentile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "SSVNoiseLowerPercentile"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v46;
  v50[4] = CFSTR("noiseUpperPercentile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "SSVNoiseUpperPercentile"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v45;
  v50[5] = CFSTR("LKFSLowerPercentile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "SSVLKFSLowerPercentile"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v44;
  v50[6] = CFSTR("LKFSUpperPercentile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "SSVLKFSUpperPercentile"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v43;
  v50[7] = CFSTR("noiseTimeConstant");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseTimeConstant");
  objc_msgSend(v2, "numberWithFloat:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v42;
  v50[8] = CFSTR("noiseMicSensitivityOffset");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseMicSensitivityOffset");
  objc_msgSend(v3, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v41;
  v50[9] = CFSTR("LKFSTimeConstant");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVLKFSTimeConstant");
  objc_msgSend(v4, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v40;
  v50[10] = CFSTR("LKFSMicSensitivityOffset");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVLKFSMicSensitivityOffset");
  objc_msgSend(v5, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v39;
  v50[11] = CFSTR("noiseTTSMappingInputRangeLow");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseTTSMappingInputRangeLow");
  objc_msgSend(v6, "numberWithFloat:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v38;
  v50[12] = CFSTR("noiseTTSMappingInputRangeHigh");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseTTSMappingInputRangeHigh");
  objc_msgSend(v7, "numberWithFloat:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[12] = v37;
  v50[13] = CFSTR("noiseTTSMappingOutputRangeLow");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseTTSMappingOutputRangeLow");
  objc_msgSend(v8, "numberWithFloat:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[13] = v36;
  v50[14] = CFSTR("noiseTTSMappingOutputRangeHigh");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseTTSMappingOutputRangeHigh");
  objc_msgSend(v9, "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[14] = v35;
  v50[15] = CFSTR("LKFSTTSMappingInputRangeLow");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVLKFSTTSMappingInputRangeLow");
  objc_msgSend(v10, "numberWithFloat:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[15] = v34;
  v50[16] = CFSTR("LKFSTTSMappingInputRangeHigh");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVLKFSTTSMappingInputRangeHigh");
  objc_msgSend(v11, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[16] = v33;
  v50[17] = CFSTR("LKFSTTSMappingOutputRangeLow");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVLKFSTTSMappingOutputRangeLow");
  objc_msgSend(v12, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[17] = v32;
  v50[18] = CFSTR("LKFSTTSMappingOutputRangeHigh");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVLKFSTTSMappingOutputRangeHigh");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51[18] = v14;
  v50[19] = CFSTR("userOffsetInputRangeLow");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVUserOffsetInputRangeLow");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[19] = v16;
  v50[20] = CFSTR("userOffsetInputRangeHigh");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVUserOffsetInputRangeHigh");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[20] = v18;
  v50[21] = CFSTR("userOffsetOutputRangeLow");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVUserOffsetOutputRangeLow");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[21] = v20;
  v50[22] = CFSTR("userOffsetOutputRangeHigh");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVUserOffsetOutputRangeHigh");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[22] = v22;
  v50[23] = CFSTR("TTSVolumeLowerLimitDB");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVTTSVolumeLowerLimitDB");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[23] = v24;
  v50[24] = CFSTR("TTSVolumeUpperLimitDB");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVTTSVolumeUpperLimitDB");
  objc_msgSend(v25, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[24] = v26;
  v50[25] = CFSTR("noiseWeight");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "SSVNoiseWeight");
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[25] = v28;
  v50[26] = CFSTR("DistanceChannelBitset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "SSVDistanceChannelBitset"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[26] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (uint64_t)SSVDefaultNoiseChannelCount
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((CSIsTorpedo() & 1) != 0)
  {
    v0 = 4128768;
  }
  else if (CSIsHorseman())
  {
    v1 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
    v2 = 16128;
    if (v1 == 3)
      v2 = 3840;
    if (v1 == 2)
      v0 = 960;
    else
      v0 = v2;
  }
  else
  {
    v0 = 16128;
  }
  return objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", v0);
}

+ (uint64_t)SSVDefaultLKFSChannelCount
{
  uint64_t v0;

  if ((CSIsTorpedo() & 1) != 0)
  {
    v0 = 2048;
  }
  else if (CSIsHorseman())
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType") == 3)
      v0 = 0x100000;
    else
      v0 = 16;
  }
  else
  {
    v0 = 16;
  }
  return objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", v0);
}

+ (uint64_t)SSVDefaultDistanceChannelCount
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((CSIsTorpedo() & 1) != 0)
  {
    v0 = 268369921;
  }
  else if (CSIsHorseman())
  {
    v1 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
    v2 = 16128;
    if (v1 == 3)
      v2 = 3840;
    if (v1 == 2)
      v0 = 896;
    else
      v0 = v2;
  }
  else
  {
    v0 = 16128;
  }
  return objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", v0);
}

+ (uint64_t)getSSVDeviceType
{
  if (CSIsHorsemanJunior())
    return 2;
  else
    return 1;
}

@end
