@implementation AVControlCenterModulesPrewarm

id __AVControlCenterModulesPrewarm_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  sModuleStatesByBundleID = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (dword_1ECFED5A0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  sCaptureDeviceWatcher = -[AVControlCenterCaptureDeviceWatcher initWithSupportedVideoEffectsDidChangeHandler:]([AVControlCenterCaptureDeviceWatcher alloc], "initWithSupportedVideoEffectsDidChangeHandler:", &__block_literal_global_376);
  return +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", CFSTR("warmup"));
}

void __AVControlCenterModulesPrewarm_block_invoke_374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sModuleStatesLock);
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)sModuleStatesByBundleID, "allValues"), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sModuleStatesLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "updateCenterStageSupported:backgroundBlurSupported:studioLightingSupported:reactionEffectsSupported:backgroundReplacementSupported:", a2, a3, a4, a5, a6);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

@end
