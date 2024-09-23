@implementation AVControlCenterVideoEffectsObserveGesturesDefaultDisabled

id __AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0DE7910]);
  AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_sObserver = (uint64_t)result;
  return result;
}

void __AVControlCenterVideoEffectsObserveGesturesDefaultDisabled_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t HaveShownGesturesDefaultDisabledNotificationPreferenceKey;
  id v6;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[25];

  v15[23] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      HaveShownGesturesDefaultDisabledNotificationPreferenceKey = AVControlCenterVideoEffectsHaveShownGesturesDefaultDisabledNotificationPreferenceKey(a3);
      v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", HaveShownGesturesDefaultDisabledNotificationPreferenceKey);
      if (v6
        && (v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && objc_msgSend(v7, "BOOLValue"))
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v15[0] = 0;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", a3, 1, v15);
        if (!v9)
        {
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v11 = (*(uint64_t (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3, objc_msgSend(v9, "localizedName", v13, v14));
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (v11)
          +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", MEMORY[0x1E0C9AAB0], HaveShownGesturesDefaultDisabledNotificationPreferenceKey);

      }
    }
  }
}

@end
