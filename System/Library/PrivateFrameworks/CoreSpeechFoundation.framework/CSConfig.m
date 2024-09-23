@implementation CSConfig

+ (float)inputRecordingSampleRate
{
  return 16000.0;
}

+ (float)inputRecordingSampleRateNarrowBand
{
  return 8000.0;
}

+ (unsigned)inputRecordingFramesPerPacket
{
  return 1;
}

+ (unsigned)inputRecordingBytesPerFrame
{
  return +[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth");
}

+ (unsigned)inputRecordingBytesPerPacket
{
  unsigned int v2;

  v2 = +[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth");
  return +[CSConfig inputRecordingFramesPerPacket](CSConfig, "inputRecordingFramesPerPacket") * v2;
}

+ (unsigned)hearstNumberOfBytesPerChunk
{
  return 320;
}

+ (unsigned)hearstNumberOfSamplesPerChunk
{
  return 160;
}

+ (unsigned)inputRecordingNumberOfChannels
{
  void *v3;
  int v4;
  unint64_t v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 2;
  if (CSIsTorpedo_onceToken != -1)
    dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2532);
  if (CSIsTorpedo_isTorpedo)
    return 34;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileLoggingIsEnabled");

    v5 = +[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType");
    if (v5 == 3)
    {
      v6 = v4 == 0;
      v7 = 21;
      v8 = 29;
    }
    else
    {
      v6 = v4 == 0;
      if (v5 == 2)
      {
        v7 = 10;
        v8 = 23;
      }
      else
      {
        v7 = 14;
        v8 = 34;
      }
    }
    if (v6)
      return v7;
    else
      return v8;
  }
  else
  {
    if (+[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable")
      && +[CSUtils isIOSDeviceSupportingBargeIn](CSUtils, "isIOSDeviceSupportingBargeIn"))
    {
      return 2;
    }
    return 1;
  }
}

+ (float)inputRecordingDurationInSecs
{
  float result;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  result = 5.0;
  if (!CSIsHorseman_isHorseman)
    return 4.0;
  return result;
}

+ (float)inputRecordingDurationInSecsExtended
{
  float result;

  if (+[CSUtils allowExtendedRingBufferSize](CSUtils, "allowExtendedRingBufferSize"))
    return 6.0;
  objc_msgSend(a1, "inputRecordingDurationInSecs");
  return result;
}

+ (unsigned)inputRecordingSampleBitDepth
{
  return 8 * +[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth");
}

+ (unsigned)inputRecordingSampleByteDepth
{
  return 2;
}

+ (BOOL)inputRecordingIsFloat
{
  return 0;
}

+ (unsigned)EncryptionAudioSampleByteDepth
{
  return 2;
}

+ (int64_t)inputRecordingEncoderAudioQuality
{
  return 64;
}

+ (id)inputRecordingSampleRateConverterAlgorithm
{
  return (id)*MEMORY[0x1E0C89950];
}

+ (double)inputRecordingBufferDuration
{
  return 0.04;
}

+ (unsigned)audioConverterBitrate
{
  return 32000;
}

+ (unint64_t)channelForOutputReference
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    return 1;
  if (CSIsTorpedo_onceToken != -1)
    dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2532);
  if (CSIsTorpedo_isTorpedo)
    return 11;
  if (+[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") == 3)
    return 20;
  return 4;
}

+ (unint64_t)channelForProcessedInput
{
  return 0;
}

+ (unint64_t)zeroFilterWindowSizeInMs
{
  return 10;
}

+ (unint64_t)zeroFilterWindowSizeInMsForReport
{
  return 100;
}

+ (unint64_t)zeroFilterWindowSizeInMsForCSLogging
{
  return 1000;
}

+ (unint64_t)zeroFilterCSLoggingHeartBeatThresholdInMS
{
  return 1000;
}

+ (unsigned)zeroFilterApproxAbsSpeechThreshold
{
  return 1000;
}

+ (float)daysBeforeRemovingLogFiles
{
  return 15.0;
}

+ (float)remoteVADDuration
{
  return *(float *)"\nף<(knN";
}

+ (unint64_t)serverLoggingChannelBitset
{
  unint64_t v2;
  unint64_t v3;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
  {
    v2 = +[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType");
    v3 = 2093311;
    if (v2 != 3)
      v3 = 67092735;
    if (v2 == 2)
      return 261183;
    else
      return v3;
  }
  else
  {
    if (CSIsTorpedo_onceToken != -1)
      dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2532);
    if (CSIsTorpedo_isTorpedo)
      return 0x3FFC0780FLL;
    else
      return 67092735;
  }
}

+ (double)defaultContinuousFingerprintBufferDuration
{
  return 12.0;
}

+ (double)defaultContinuousFingerprintBufferDurationForRemora
{
  return 6.0;
}

+ (unint64_t)exclaveRecordingNumSamples
{
  return 1024;
}

+ (unint64_t)exclaveRecordingNumChannels
{
  return 1;
}

+ (unint64_t)exclaveHALInputNumChannelsWithoutDSP
{
  return 4;
}

+ (unint64_t)exclaveHALInputNumChannelsWithDSP
{
  return 2;
}

@end
