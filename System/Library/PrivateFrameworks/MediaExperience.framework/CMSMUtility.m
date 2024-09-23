@implementation CMSMUtility

uint64_t __CMSMUtility_CopyPrioritizedListBasedOnPlayingAndActiveState_block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!objc_msgSend(a2, "isPlaying") || objc_msgSend(a3, "isPlaying"))
    {
      if ((objc_msgSend(a2, "isPlaying") & 1) == 0 && (objc_msgSend(a3, "isPlaying") & 1) != 0)
        return 1;
      if (!objc_msgSend(a2, "isActive") || objc_msgSend(a3, "isActive"))
        return (objc_msgSend(a2, "isActive") & 1) == 0 && objc_msgSend(a3, "isActive");
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    if (!objc_msgSend(a2, "getIsPlaying") || objc_msgSend(a3, "getIsPlaying"))
      return (objc_msgSend(a2, "getIsPlaying") & 1) == 0 && objc_msgSend(a3, "getIsPlaying");
  }
  return -1;
}

uint64_t __CMSMUtility_PostInterruptionEndedNotificationForAudioSessionID_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postInterruptionEndedNotificationForAudioSessionID:resumable:", *(unsigned int *)(a1 + 40), *(_BYTE *)(a1 + 44) != 0);
}

uint64_t __CMSMUtility_CopyMappedMXSessionAudioCategory_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("AmbientSound"), CFSTR("AVAudioSessionCategoryAmbient"), CFSTR("SoloAmbientSound"), CFSTR("AVAudioSessionCategorySoloAmbient"), CFSTR("MediaPlayback"), CFSTR("AVAudioSessionCategoryPlayback"), CFSTR("MediaPlaybackNoSpeaker"), CFSTR("AVAudioSessionCategoryPlaybackNoSpeaker"), CFSTR("VoiceOver"), CFSTR("AVAudioSessionCategoryVoiceOver"), CFSTR("AudioProcessing"), CFSTR("AVAudioSessionCategoryAudioProcessing"), CFSTR("Multi"), CFSTR("AVAudioSessionCategoryMultiRoute"), CFSTR("Ringtone"), CFSTR("AVAudioSessionCategoryRingtone"), CFSTR("RingtonePreview"),
             CFSTR("AVAudioSessionCategoryRingtonePreview"),
             CFSTR("PhoneCall"),
             CFSTR("AVAudioSessionCategoryPhoneCall"),
             CFSTR("TTYCall"),
             CFSTR("AVAudioSessionCategoryTTYCall"),
             CFSTR("Voicemail"),
             CFSTR("AVAudioSessionCategoryVoiceMail"),
             CFSTR("Alarm"),
             CFSTR("AVAudioSessionCategoryAlarm"),
             CFSTR("Record"),
             CFSTR("AVAudioSessionCategoryRecord"),
             CFSTR("PlayAndRecord"),
             CFSTR("AVAudioSessionCategoryPlayAndRecord"),
             CFSTR("FindMyPhone"),
             CFSTR("AVAudioSessionCategoryFindMyPhone"),
             CFSTR("EmergencyAlert"),
             CFSTR("AVAudioSessionCategoryEmergencyAlert"),
             CFSTR("EmergencyAlert_Muteable"),
             CFSTR("AVAudioSessionCategoryEmergencyAlert_CanBeMuted"),
             CFSTR("WaterEjection"),
             CFSTR("AVAudioSessionCategoryWaterEjection"),
             CFSTR("FindMyAudioDevice"),
             CFSTR("AVAudioSessionCategoryFindMyDevice"),
             CFSTR("SystemSoundsAndHaptics"),
             CFSTR("AVAudioSessionCategorySystemSoundsAndHaptics"),
             CFSTR("VoiceCommand"),
             CFSTR("AVAudioSessionCategoryVoiceCommand"),
             CFSTR("eARC"),
             CFSTR("AVAudioSessionCategoryEARC"),
             CFSTR("SpeechDetect"),
             CFSTR("AVAudioSessionCategorySpeechDetect"),
             0);
  CMSMUtility_CopyMappedMXSessionAudioCategory_sAudioSessionToMXCategoryMap = result;
  return result;
}

uint64_t __CMSMUtility_CopyMappedMXSessionAudioMode_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), CFSTR("AVAudioSessionModeDefault"), CFSTR("VoiceChat"), CFSTR("AVAudioSessionModeVoiceChat"), CFSTR("VideoChat"), CFSTR("AVAudioSessionModeVideoChat"), CFSTR("VideoRecording"), CFSTR("AVAudioSessionModeVideoRecording"), CFSTR("SpeechRecognition"), CFSTR("AVAudioSessionModeSpeechRecognition"), CFSTR("Measurement"), CFSTR("AVAudioSessionModeMeasurement"), CFSTR("Raw"), CFSTR("AVAudioSessionModeRaw"), CFSTR("GameChat"), CFSTR("AVAudioSessionModeGameChat"), CFSTR("MoviePlayback"),
             CFSTR("AVAudioSessionModeMoviePlayback"),
             CFSTR("SpokenAudio"),
             CFSTR("AVAudioSessionModeSpokenAudio"),
             CFSTR("VoicePrompt"),
             CFSTR("AVAudioSessionModeVoicePrompt"),
             CFSTR("VoiceMessages"),
             CFSTR("AVAudioSessionModeVoiceMessages"),
             CFSTR("FindMyPhone"),
             CFSTR("AVAudioSessionModeLocatePhone"),
             CFSTR("LivePhoto"),
             CFSTR("AVAudioSessionModeLivePhoto"),
             CFSTR("HearingAccessibility"),
             CFSTR("AVAudioSessionModeHearingAccessibility"),
             CFSTR("SpatialRecording"),
             CFSTR("AVAudioSessionModeSpatialRecording"),
             CFSTR("SOSNotification"),
             CFSTR("AVAudioSessionModeSOS"),
             CFSTR("VideoChatForMedia"),
             CFSTR("AVAudioSessionModeVideoChatForMedia"),
             CFSTR("CustomVolume"),
             CFSTR("AVAudioSessionModeHapticsConstantVolume"),
             CFSTR("LowLatency"),
             CFSTR("AVAudioSessionModeLowLatency"),
             CFSTR("Beacon"),
             CFSTR("AVAudioSessionModeBeacon"),
             0);
  CMSMUtility_CopyMappedMXSessionAudioMode_sAudioSessionToMXModeMap = result;
  return result;
}

void __CMSMUtility_ApplyPIDToInheritAppStateFrom_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  CMSMUtility_ApplyForEachMatchingSessionGuts(0, (unsigned int (*)(uint64_t, _QWORD, uint64_t))CMSUtilityPredicate_IsSameClient, *(_QWORD *)(a1 + 32), (unint64_t)CMSUtilityApplier_InheritApplicationStateAndPostApplicationStateDidChangeNotification, 0, *(_QWORD *)(a1 + 40), 0);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

uint64_t __CMSMUtility_UpdateSharePlayVolumeBehaviours_block_invoke()
{
  void *SharePlayCapableActiveMediaSession;
  uint64_t result;
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;

  SharePlayCapableActiveMediaSession = CMSMUtility_GetSharePlayCapableActiveMediaSession();
  result = (uint64_t)CMSMUtility_GetSharePlayCapableActiveCallSession();
  if (result)
  {
    v2 = (void *)result;
    result = objc_msgSend((id)result, "currentlyControllingFlags");
    if (SharePlayCapableActiveMediaSession)
    {
      if ((result & 0x10) != 0)
      {
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CMSMUtility_SetMediaPlaybackVolumeToCurrentPhoneCallVolume();
        return CMSMUtility_TransferVolumeControlFlagToSharePlayCapableMediaSession();
      }
    }
    else if ((result & 0x10) == 0)
    {
      if (dword_1EE2B3F38)
      {
        v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSMUtility_SetPhoneCallVolumeToCurrentMediaPlaybackVolume();
      CMSMUtility_TransferVolumeControlFlagToSharePlayCapableCallSession();
      return cmsTryToTakeControl(v2);
    }
  }
  return result;
}

@end
