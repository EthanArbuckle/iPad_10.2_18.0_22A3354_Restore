@implementation AVAUVoiceIOInitializeListenersForBundleID

uint64_t __AVAUVoiceIOInitializeListenersForBundleID_block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v6;
  const __CFString *v7;
  int v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t type[8];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[18];

  v24[16] = *MEMORY[0x1E0C80C00];
  v3 = *(__CFString **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __vpio_bundleIDsForTranslatedBundleID_block_invoke;
  v24[3] = &unk_1E4216720;
  v24[4] = v3;
  v4 = (void *)objc_msgSend((id)sBundleIDTranslationMap, "keysOfEntriesPassingTest:", v24);
  os_unfair_lock_unlock((os_unfair_lock_t)&sBundleIDTranslationMapLock);
  if (dword_1EE53AB08)
  {
    LODWORD(v19) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend(a2, "isEqualToString:", AVControlCenterAudioPreferredMicrophoneModePreferenceKeyForTranslatedBundleID(v3)) & 1) != 0)
  {
    v6 = 0;
    v7 = CFSTR("AVAUVoiceIOPreferredChatFlavorDidChangeNotification");
  }
  else
  {
    v8 = objc_msgSend(a2, "isEqualToString:", AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKeyForTranslatedBundleID(v3));
    v6 = v8 ^ 1;
    if (v8)
      v7 = CFSTR("AVAUVoiceIOAutoChatFlavorEnabledDidChangeNotification");
    else
      v7 = 0;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (void *)objc_msgSend(v4, "allObjects", v16, v17);
  result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (result)
  {
    v11 = result;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        if ((v6 & 1) == 0)
        {
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          *(_QWORD *)type = CFSTR("AVAUVoiceIONotificationBundleIdentifierKey");
          v19 = v14;
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, type, 1);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", v7, 0, v15);
        }
        ++v13;
      }
      while (v11 != v13);
      result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v11 = result;
    }
    while (result);
  }
  return result;
}

@end
