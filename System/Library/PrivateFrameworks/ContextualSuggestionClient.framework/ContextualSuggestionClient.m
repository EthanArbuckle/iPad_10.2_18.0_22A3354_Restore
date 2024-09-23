void hashIt(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          hashIt(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(v3, "hash");
    objc_msgSend(v4, "appendBytes:length:", &v10, 8);
  }

}

void sub_2384B44B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_1);
  return (id)__atxlog_handle_default_log;
}

void ____atxlog_handle_default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  v1 = (void *)__atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1)
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_3);
  return (id)__atxlog_handle_xpc_log;
}

void ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  v1 = (void *)__atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_5);
  return (id)__atxlog_handle_heuristic_log;
}

void ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  v1 = (void *)__atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1)
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_7);
  return (id)__atxlog_handle_notifications_log;
}

void ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  v1 = (void *)__atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1)
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_9);
  return (id)__atxlog_handle_pmm_log;
}

void ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  v1 = (void *)__atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1)
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_12);
  return (id)__atxlog_handle_dailyroutines_log;
}

void ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  v1 = (void *)__atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1)
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_14);
  return (id)__atxlog_handle_feedback_log;
}

void ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  v1 = (void *)__atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1)
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_16);
  return (id)__atxlog_handle_modes_log;
}

void ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  v1 = (void *)__atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1)
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_18);
  return (id)__atxlog_handle_hero_log;
}

void ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  v1 = (void *)__atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1)
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_20);
  return (id)__atxlog_handle_deletions_log;
}

void ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  v1 = (void *)__atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1)
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_22);
  return (id)__atxlog_handle_gi_log;
}

void ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  v1 = (void *)__atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1)
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_24);
  return (id)__atxlog_handle_timeline_log;
}

void ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  v1 = (void *)__atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_26);
  return (id)__atxlog_handle_relevant_shortcut_log;
}

void ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  v1 = (void *)__atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_28);
  return (id)__atxlog_handle_relevance_model_log;
}

void ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  v1 = (void *)__atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1)
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_30);
  return (id)__atxlog_handle_watch_log;
}

void ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  v1 = (void *)__atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1)
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_32);
  return (id)__atxlog_handle_ui_log;
}

void ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  v1 = (void *)__atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_34);
  return (id)__atxlog_handle_blending_log;
}

void ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  v1 = (void *)__atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_36);
  return (id)__atxlog_handle_blending_internal_cache_log;
}

void ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  v1 = (void *)__atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_38);
  return (id)__atxlog_handle_blending_ecosystem_log;
}

void ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  v1 = (void *)__atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_40);
  return (id)__atxlog_handle_home_screen_log;
}

void ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  v1 = (void *)__atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1)
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_42);
  return (id)__atxlog_handle_sleep_schedule_log;
}

void ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  v1 = (void *)__atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_44);
  return (id)__atxlog_handle_lock_screen_log;
}

void ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  v1 = (void *)__atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1)
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_46);
  return (id)__atxlog_handle_anchor_log;
}

void ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  v1 = (void *)__atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_48);
  return (id)__atxlog_handle_app_prediction_log;
}

void ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  v1 = (void *)__atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_50);
  return (id)__atxlog_handle_action_prediction_log;
}

void ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  v1 = (void *)__atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_52);
  return (id)__atxlog_handle_app_library_log;
}

void ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  v1 = (void *)__atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_54);
  return (id)__atxlog_handle_app_install_log;
}

void ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  v1 = (void *)__atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1)
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_56);
  return (id)__atxlog_handle_backup_log;
}

void ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  v1 = (void *)__atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1)
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_58);
  return (id)__atxlog_handle_metrics_log;
}

void ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  v1 = (void *)__atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1)
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_60);
  return (id)__atxlog_handle_trial_assets_log;
}

void ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  v1 = (void *)__atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_62);
  return (id)__atxlog_handle_notification_management_log;
}

void ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  v1 = (void *)__atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_64);
  return (id)__atxlog_handle_contextual_actions_log;
}

void ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  v1 = (void *)__atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1)
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_66);
  return (id)__atxlog_handle_intents_helper_log;
}

void ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  v1 = (void *)__atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_68);
  return (id)__atxlog_handle_context_heuristic_log;
}

void ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  v1 = (void *)__atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1)
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_70);
  return (id)__atxlog_handle_zkw_hide_log;
}

void ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  v1 = (void *)__atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_72);
  return (id)__atxlog_handle_context_user_education_suggestions_log;
}

void ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  v1 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1)
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_74);
  return (id)__atxlog_handle_time_intelligence_log;
}

void ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  v1 = (void *)__atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_76);
  return (id)__atxlog_handle_contextual_engine_log;
}

void ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  v1 = (void *)__atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1)
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_78);
  return (id)__atxlog_handle_usage_insights_log;
}

void ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  v1 = (void *)__atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_80);
  return (id)__atxlog_handle_notification_categorization_log;
}

void ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  v1 = (void *)__atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken[0] != -1)
    dispatch_once(__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82);
  return (id)__atxlog_handle_settings_actions_log;
}

void ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  v1 = (void *)__atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

}

BOOL sub_2384B5958(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2384B5968()
{
  return sub_2384DFE44();
}

uint64_t sub_2384B5990()
{
  return 2;
}

uint64_t sub_2384B5998()
{
  sub_2384DFE38();
  sub_2384DFE44();
  return sub_2384DFE50();
}

uint64_t sub_2384B59DC()
{
  return 0;
}

uint64_t sub_2384B59E8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6974736567677573;
  else
    return 0x6E65736572706572;
}

BOOL sub_2384B5A34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2384B5A4C()
{
  sub_2384DFE38();
  sub_2384DFE44();
  return sub_2384DFE50();
}

uint64_t sub_2384B5A90()
{
  return sub_2384DFE44();
}

uint64_t sub_2384B5AB8()
{
  sub_2384DFE38();
  sub_2384DFE44();
  return sub_2384DFE50();
}

uint64_t sub_2384B5AF8()
{
  char *v0;

  return sub_2384B59E8(*v0);
}

uint64_t sub_2384B5B00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384B62AC(a1, a2);
  *a3 = result;
  return result;
}

void sub_2384B5B24(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2384B5B30()
{
  sub_2384B6710();
  return sub_2384DFE98();
}

uint64_t sub_2384B5B58()
{
  sub_2384B6710();
  return sub_2384DFEA4();
}

id ContextualSuggestionContext.representation.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation));
}

uint64_t ContextualSuggestionContext.suggestions.getter()
{
  return swift_bridgeObjectRetain();
}

id ContextualSuggestionContext.__allocating_init(representation:suggestions:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ContextualSuggestionContext.init(representation:suggestions:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ContextualSuggestionContext.__allocating_init(coder:)(NSObject *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextualSuggestionContext.init(coder:)(a1);
}

id ContextualSuggestionContext.init(coder:)(NSObject *a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  NSObject *v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v26;
  objc_super v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_2384DF9B8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - v9;
  type metadata accessor for ContextRepresentation();
  v11 = v1;
  v12 = sub_2384DFBBC();
  if (!v12)
  {

    v18 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v18, v4);
    v13 = sub_2384DF9AC();
    v19 = sub_2384DFB38();
    if (os_log_type_enabled(v13, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2384B0000, v13, v19, "coder missing representation", v20, 2u);
      MEMORY[0x23B836F18](v20, -1, -1);
    }
    v21 = a1;
    v8 = v10;
    goto LABEL_13;
  }
  v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912720);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2384E0E70;
  *(_QWORD *)(v14 + 32) = type metadata accessor for ContextualSuggestion();
  *(_QWORD *)(v14 + 40) = sub_2384B63FC();
  sub_2384DFBC8();
  swift_bridgeObjectRelease();
  if (!v30)
  {

    sub_2384B6438((uint64_t)v29);
LABEL_10:
    v22 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v22, v4);
    v21 = sub_2384DF9AC();
    v23 = sub_2384DFB38();
    if (os_log_type_enabled(v21, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2384B0000, v21, v23, "coder missing suggestions", v24, 2u);
      MEMORY[0x23B836F18](v24, -1, -1);
    }

LABEL_13:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912738);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_10;
  }
  v15 = v28;

  v16 = (char *)objc_allocWithZone(ObjectType);
  *(_QWORD *)&v16[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation] = v13;
  *(_QWORD *)&v16[OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions] = v15;
  v27.receiver = v16;
  v27.super_class = ObjectType;
  v17 = -[NSObject init](&v27, sel_init);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v17;
}

void *sub_2384B6028()
{
  return &unk_2384E0E8A;
}

uint64_t static ContextualSuggestionContext.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ContextualSuggestionContext.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation);
  v4 = (void *)sub_2384DFA18();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  type metadata accessor for ContextualSuggestion();
  v5 = (void *)sub_2384DFA84();
  v6 = (id)sub_2384DFA18();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

}

uint64_t sub_2384B6180(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)(*(_QWORD *)(a1
                            + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation)
                + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier);
  v3 = (_QWORD *)(*(_QWORD *)(a2
                            + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation)
                + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier);
  if (*v2 == *v3 && v2[1] == v3[1])
    return 1;
  else
    return sub_2384DFDD8();
}

id ContextualSuggestionContext.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ContextualSuggestionContext.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ContextualSuggestionContext.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2384B62AC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E65736572706572 && a2 == 0xEE006E6F69746174;
  if (v3 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B836E7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2384B63FC()
{
  unint64_t result;

  result = qword_2542CD5F0;
  if (!qword_2542CD5F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542CD5F0);
  }
  return result;
}

uint64_t sub_2384B6438(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912730);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2384B647C()
{
  unint64_t result;

  result = qword_256912740;
  if (!qword_256912740)
  {
    result = MEMORY[0x23B836E94](&unk_2384E0E8C, &type metadata for ContextualSuggestionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912740);
  }
  return result;
}

unint64_t sub_2384B64C4()
{
  unint64_t result;

  result = qword_256912748;
  if (!qword_256912748)
  {
    result = MEMORY[0x23B836E94](&unk_2384E0F6C, &type metadata for ContextualSuggestionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912748);
  }
  return result;
}

unint64_t sub_2384B650C()
{
  unint64_t result;

  result = qword_256912750;
  if (!qword_256912750)
  {
    result = MEMORY[0x23B836E94](&unk_2384E0F44, &type metadata for ContextualSuggestionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912750);
  }
  return result;
}

uint64_t type metadata accessor for ContextualSuggestionContext()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContextualSuggestionContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualSuggestionContext.__allocating_init(representation:suggestions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ContextualSuggestionContext.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContextualSuggestionContext.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextualSuggestionContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2384B6678 + 4 * byte_2384E0E85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2384B66AC + 4 * byte_2384E0E80[v4]))();
}

uint64_t sub_2384B66AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384B66B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384B66BCLL);
  return result;
}

uint64_t sub_2384B66C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384B66D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2384B66D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384B66DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384B66E8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2384B66F4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContextualSuggestionContext.CodingKeys()
{
  return &type metadata for ContextualSuggestionContext.CodingKeys;
}

unint64_t sub_2384B6710()
{
  unint64_t result;

  result = qword_2569127C0;
  if (!qword_2569127C0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E0EF4, &type metadata for ContextualSuggestionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569127C0);
  }
  return result;
}

id sub_2384B6764()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC26ContextualSuggestionClient30ContextualEngineInternalClient____lazy_storage___connection;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC26ContextualSuggestionClient30ContextualEngineInternalClient____lazy_storage___connection);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC26ContextualSuggestionClient30ContextualEngineInternalClient____lazy_storage___connection);
  }
  else
  {
    sub_2384CE704();
    v4 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    swift_bridgeObjectRetain();
    v5 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 0);

    v7 = (void *)contextualEngineInternalInterface.getter();
    objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

    objc_msgSend(v6, sel_resume);
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

uint64_t sub_2384B684C()
{
  return 0;
}

id sub_2384B6854()
{
  uint64_t v0;
  void **v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v8;
  _QWORD aBlock[6];

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  v1 = (void **)(v0 + 16);
  v2 = sub_2384B6764();
  aBlock[4] = sub_2384B878C;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384B6BD4;
  aBlock[3] = &block_descriptor_78;
  v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v4 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v3);
  _Block_release(v3);

  sub_2384DFC1C();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912980);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v2 = v8;
    swift_release();
  }
  else
  {
    swift_beginAccess();
    v5 = *v1;
    if (!*v1)
    {
      sub_2384B87AC();
      swift_allocError();
      v5 = 0;
    }
    v6 = v5;
    swift_willThrow();
    swift_release();
  }
  return v2;
}

id sub_2384B69EC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint8_t *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = sub_2384DF9B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2384D860C();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = sub_2384DF9AC();
  v11 = sub_2384DFB38();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v23 = a2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v22 = v4;
    v15 = (_QWORD *)v14;
    *(_DWORD *)v13 = 138412290;
    v16 = sub_2384DF8EC();
    v24 = v16;
    sub_2384DFC04();
    *v15 = v16;

    _os_log_impl(&dword_2384B0000, v10, v11, "ContextualEngineInternalClient: Error grabbing remote object proxy: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
    swift_arrayDestroy();
    v17 = v15;
    v4 = v22;
    MEMORY[0x23B836F18](v17, -1, -1);
    v18 = v13;
    a2 = v23;
    MEMORY[0x23B836F18](v18, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  v19 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  return a1;
}

void sub_2384B6BD4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2384B6C24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_2384B6C3C()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = sub_2384B6854();
  v0[17] = v1;
  v2 = v1;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2384B6D08;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_2384B6DE8;
  v4[3] = &block_descriptor;
  v4[4] = v3;
  objc_msgSend(v2, sel_fetchAllSnapshotsWithCompletion_, v4);
  return swift_continuation_await();
}

uint64_t sub_2384B6D08()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2384B6D68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2384B6DA4()
{
  uint64_t v0;

  swift_willThrow();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384B6DE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912978);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    type metadata accessor for ContextualSuggestionSnapshot();
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_2384DFA0C();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2384B6FAC(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_2384B7024;
  v5[16] = v4;
  return swift_task_switch();
}

uint64_t sub_2384B7024()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_2384DF8EC();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for ContextualSuggestionSnapshot();
    v7 = sub_2384DFA00();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2384B7100()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_2384B7118()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = sub_2384B6854();
  v0[17] = v1;
  v2 = v1;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2384B71E4;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_2384B7244;
  v4[3] = &block_descriptor_2;
  v4[4] = v3;
  objc_msgSend(v2, sel_fetchSnapshotOverrideWithCompletion_, v4);
  return swift_continuation_await();
}

uint64_t sub_2384B71E4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2384B7244(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912978);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2384B73EC(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_2384B7464;
  v5[16] = v4;
  return swift_task_switch();
}

uint64_t sub_2384B7464(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = v1;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();

  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 24);
  if (v3)
  {
    v8 = (void *)sub_2384DF8EC();

    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, a1, 0);
    _Block_release(v7);

  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_2384B7520(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch();
}

uint64_t sub_2384B7538()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = sub_2384B6854();
  v0[17] = v1;
  v2 = v1;
  v3 = v0[15];
  v0[2] = v0;
  v0[3] = sub_2384B7604;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_2384B7698;
  v5[3] = &block_descriptor_4;
  v5[4] = v4;
  objc_msgSend(v2, sel_overrideWithSnapshot_completion_, v3, v5);
  return swift_continuation_await();
}

uint64_t sub_2384B7604()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2384B7664()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384B7698(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912978);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_2384B783C(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2384B78CC;
  v8[15] = v6;
  v8[16] = v7;
  return swift_task_switch();
}

uint64_t sub_2384B78CC()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(*v1 + 16);
  v2 = *(void **)(*v1 + 24);
  v4 = *v1;
  swift_task_dealloc();

  v5 = *(_QWORD *)(v4 + 32);
  if (v0)
  {
    v6 = (void *)sub_2384DF8EC();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v4 + 32), 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_2384B7970()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_2384B7988()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = sub_2384B6854();
  v0[16] = v1;
  v2 = v1;
  v0[2] = v0;
  v0[3] = sub_2384B7A4C;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_2384B7698;
  v4[3] = &block_descriptor_6;
  v4[4] = v3;
  objc_msgSend(v2, sel_updateWithCompletion_, v4);
  return swift_continuation_await();
}

uint64_t sub_2384B7A4C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2384B7AAC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384B7AE0()
{
  uint64_t v0;

  swift_willThrow();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384B7C40(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_2384B7CB8;
  v5[15] = v4;
  return swift_task_switch();
}

uint64_t sub_2384B7CB8()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)sub_2384DF8EC();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

id ContextualEngineInternalClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ContextualEngineInternalClient.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC26ContextualSuggestionClient30ContextualEngineInternalClient____lazy_storage___connection] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualEngineInternalClient();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ContextualEngineInternalClient()
{
  return objc_opt_self();
}

id ContextualEngineInternalClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualEngineInternalClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ContextualEngineInternalClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualEngineInternalClient.fetchAllSnapshots()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2384B7ED0;
  return v5();
}

uint64_t sub_2384B7ED0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of ContextualEngineInternalClient.fetchSnapshotOverride()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2384B881C;
  return v5();
}

uint64_t dispatch thunk of ContextualEngineInternalClient.override(with:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8814;
  return v7(a1);
}

uint64_t dispatch thunk of ContextualEngineInternalClient.update()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2384B8064;
  return v5();
}

uint64_t sub_2384B8064()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2384B80B0()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8814;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_2569128D8 + dword_2569128D8))(v2, v3);
}

uint64_t sub_2384B8114(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2384B8814;
  return v6();
}

uint64_t sub_2384B816C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2384B8814;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2569128E8 + dword_2569128E8))(v2, v3, v4);
}

uint64_t sub_2384B81E4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2384B8814;
  return v7();
}

uint64_t sub_2384B823C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2384B8814;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2569128F8 + dword_2569128F8))(a1, v4, v5, v6);
}

uint64_t sub_2384B82C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2384DFAF0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2384DFAE4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2384B8404(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2384DFAD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2384B8404(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2384B8444(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2384B84A8;
  return v6(a1);
}

uint64_t sub_2384B84A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2384B84F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384B8518(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8814;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256912908 + dword_256912908))(a1, v4);
}

uint64_t sub_2384B8588()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2384B85BC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2384B8814;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_256912918 + dword_256912918))(v2, v3, v4);
}

uint64_t sub_2384B8634()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8814;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256912938 + dword_256912938))(v2, v3);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_2384B86D0()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8064;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256912958 + dword_256912958))(v2, v3);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384B8768()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2384B878C(void *a1)
{
  uint64_t v1;

  return sub_2384B69EC(a1, v1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_2384B87AC()
{
  unint64_t result;

  result = qword_2569135D0[0];
  if (!qword_2569135D0[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E1078, &type metadata for UnknownXPCError);
    atomic_store(result, qword_2569135D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UnknownXPCError()
{
  return &type metadata for UnknownXPCError;
}

void sub_2384B8800()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_2384B8820()
{
  return 1;
}

uint64_t sub_2384B8828()
{
  return sub_2384DFE44();
}

uint64_t sub_2384B884C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2384B88DC()
{
  sub_2384DFE38();
  sub_2384DFE44();
  return sub_2384DFE50();
}

uint64_t sub_2384B891C()
{
  return 0x696669746E656469;
}

uint64_t sub_2384B8938()
{
  sub_2384DFE38();
  sub_2384DFE44();
  return sub_2384DFE50();
}

uint64_t sub_2384B8974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2384DFDD8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_2384B8A14(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2384B8A20()
{
  sub_2384B9114();
  return sub_2384DFE98();
}

uint64_t sub_2384B8A48()
{
  sub_2384B9114();
  return sub_2384DFEA4();
}

uint64_t ContextualSuggestion.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient20ContextualSuggestion_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

id ContextualSuggestion.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR____TtC26ContextualSuggestionClient20ContextualSuggestion_identifier];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ContextualSuggestion.init(identifier:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_super v5;

  v3 = &v2[OBJC_IVAR____TtC26ContextualSuggestionClient20ContextualSuggestion_identifier];
  *(_QWORD *)v3 = a1;
  *((_QWORD *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ContextualSuggestion();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for ContextualSuggestion()
{
  return objc_opt_self();
}

uint64_t sub_2384B8B64()
{
  return 0;
}

uint64_t ContextualSuggestion.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextualSuggestion.init(coder:)(a1);
}

uint64_t ContextualSuggestion.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  void *v5;

  sub_2384B8CAC();
  v3 = v1;
  v4 = sub_2384DFBBC();
  if (v4)
  {
    v5 = (void *)v4;
    sub_2384DFA24();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

unint64_t sub_2384B8CAC()
{
  unint64_t result;

  result = qword_256912EF0;
  if (!qword_256912EF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256912EF0);
  }
  return result;
}

void sub_2384B8D0C(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_2384DFA18();
  v3 = (id)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);

}

id ContextualSuggestion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ContextualSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ContextualSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2384B8EEC()
{
  unint64_t result;

  result = qword_2569129A0;
  if (!qword_2569129A0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E10CC, &type metadata for ContextualSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569129A0);
  }
  return result;
}

unint64_t sub_2384B8F34()
{
  unint64_t result;

  result = qword_2569129A8;
  if (!qword_2569129A8)
  {
    result = MEMORY[0x23B836E94](&unk_2384E11AC, &type metadata for ContextualSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569129A8);
  }
  return result;
}

unint64_t sub_2384B8F7C()
{
  unint64_t result;

  result = qword_2569129B0;
  if (!qword_2569129B0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1184, &type metadata for ContextualSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569129B0);
  }
  return result;
}

uint64_t method lookup function for ContextualSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualSuggestion.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ContextualSuggestion.associatedBundleId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of static ContextualSuggestion.supportsSecureCoding.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ContextualSuggestion.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ContextualSuggestion.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t getEnumTagSinglePayload for ContextualSuggestion.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for ContextualSuggestion.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_2384B90B0 + 4 * byte_2384E10C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2384B90D0 + 4 * byte_2384E10C5[v4]))();
}

_BYTE *sub_2384B90B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2384B90D0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2384B90D8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2384B90E0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2384B90E8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2384B90F0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2384B90FC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ContextualSuggestion.CodingKeys()
{
  return &type metadata for ContextualSuggestion.CodingKeys;
}

unint64_t sub_2384B9114()
{
  unint64_t result;

  result = qword_2569129C0;
  if (!qword_2569129C0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1134, &type metadata for ContextualSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569129C0);
  }
  return result;
}

uint64_t sub_2384B9158()
{
  return swift_task_switch();
}

uint64_t sub_2384B916C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = sub_2384CA0E0();
  v2 = *v1;
  *(_QWORD *)(v0 + 16) = *v1;
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)v2 + 240);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2384B91C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = (*(uint64_t (**)(void))(v0 + 24))();
  *(_QWORD *)(v0 + 32) = 0;
  v2 = v1;
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_2384B923C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384B938C(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_2384B93D4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = sub_2384CA0E0();
  v2 = *v1;
  *(_QWORD *)(v0 + 32) = *v1;
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)v2 + 240);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2384B9428()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  v1 = (*(uint64_t (**)(void))(v0 + 40))();
  *(_QWORD *)(v0 + 48) = 0;
  v2 = v1;
  v3 = *(void **)(v0 + 16);
  swift_release();

  if (v2)
  {
    sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
    v4 = (void *)sub_2384DFA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v4, 0);

  _Block_release(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384B9504()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);

  v1 = *(void **)(v0 + 48);
  v2 = *(void **)(v0 + 16);
  swift_release();

  v3 = (void *)sub_2384DF8EC();
  v4 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v3);

  _Block_release(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

ATXAmbientConfigurationReader __swiftcall ATXAmbientConfigurationReader.init()()
{
  return (ATXAmbientConfigurationReader)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id ATXAmbientConfigurationReader.init()()
{
  objc_super v1;

  v1.super_class = (Class)ATXAmbientConfigurationReader;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for ATXAmbientConfigurationReader(uint64_t a1)
{
  return sub_2384B97C8(a1, (unint64_t *)&unk_2569138E0);
}

uint64_t sub_2384B9618()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_2384B9644()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8814;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_2569129D8 + dword_2569129D8))(v2, v3);
}

uint64_t sub_2384B96B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2384B8064;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2569128F8 + dword_2569128F8))(a1, v4, v5, v6);
}

uint64_t sub_2384B9734()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384B9758(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8064;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256912908 + dword_256912908))(a1, v4);
}

uint64_t sub_2384B97C8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_2384B9800()
{
  qword_2569138F8 = (uint64_t)&unk_250A2BE08;
}

uint64_t sub_2384B9818()
{
  return swift_bridgeObjectRetain();
}

void sub_2384B9838(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  unint64_t v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v3 = *(void **)(v1 + 16);
  if (!objc_msgSend(v3, sel_allowsSmartRotate))
  {
    v12 = 0;
LABEL_7:
    sub_2384C2E30();
    swift_allocError();
    *v13 = v12;
    swift_willThrow();
    return;
  }
  v4 = objc_msgSend(v3, sel_widgets);
  sub_2384C071C();
  v5 = sub_2384DFA90();

  v6 = a1;
  v7 = sub_2384C22DC(v5, (uint64_t)v6);

  swift_bridgeObjectRelease();
  if (!v7)
  {
    v12 = 1;
    goto LABEL_7;
  }
  v8 = objc_msgSend(v3, sel_identifier);
  sub_2384DFA30();

  v9 = *(void **)&v6[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification];
  if (v9)
  {
    v10 = objc_msgSend(v9, sel_clientModelId);
    sub_2384DFA30();

    v11 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v14 = objc_msgSend(v7, sel_copyWithSource_, v11);

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
  {
    if (sub_2384DFD3C())
      sub_2384C2A90(MEMORY[0x24BEE4AF8]);
  }
  v15 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
  v16 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  sub_2384C2DE8();
  v17 = (void *)sub_2384DFAFC();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v15, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v16, v14, v17);

  v19 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = v18;

}

void sub_2384B9AA0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char **v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  char *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t inited;
  unint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69[2];
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  unint64_t v79;

  v78 = a2;
  v5 = sub_2384DF958();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
  MEMORY[0x24BDAC7A8](v12);
  v13 = *(void **)(v2 + 16);
  if (!objc_msgSend(v13, sel_allowsNewWidget))
  {
    sub_2384C06D8();
    swift_allocError();
    *v31 = 0;
    goto LABEL_18;
  }
  v74 = v3;
  v75 = v2;
  v14 = objc_msgSend(v13, sel_widgets);
  v73 = sub_2384C071C();
  v15 = sub_2384DFA90();

  v76 = v13;
  v77 = a1;
  v71 = v6;
  v72 = v5;
  v70 = v8;
  if (v15 >> 62)
    goto LABEL_39;
  v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v16)
  {
    v17 = 4;
    while (1)
    {
      v18 = (v15 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x23B8366E4](v17 - 4, v15)
          : *(id *)(v15 + 8 * v17);
      v19 = v18;
      v20 = v17 - 3;
      if (__OFADD__(v17 - 4, 1))
        break;
      if (objc_msgSend(v18, sel_isSuggestedWidget))
      {
        swift_bridgeObjectRelease();
        sub_2384C06D8();
        swift_allocError();
        *v32 = 3;
        swift_willThrow();

        return;
      }

      ++v17;
      if (v20 == v16)
        goto LABEL_11;
    }
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    v16 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  type metadata accessor for WidgetPersonality();
  v22 = *(_QWORD *)(v77
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
  v21 = *(_QWORD *)(v77
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                  + 8);
  v23 = *(void **)(v77 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
  v24 = *(_QWORD *)(v77 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v69[1] = v23;
  v25 = sub_2384CF2EC(v22, v21, (uint64_t)v23, v24);
  v26 = objc_msgSend(v78, sel_descriptorForPersonality_, v25);
  if (!v26)
  {
    type metadata accessor for SpecialWidgetDescriptor();
    v27 = (char *)v25;
    v28 = sub_2384D2734(v27);
    if (v28)
    {
      v26 = (id)v28;
      goto LABEL_14;
    }
    sub_2384C06D8();
    swift_allocError();
    *v37 = v27;
LABEL_18:
    swift_willThrow();
    return;
  }
LABEL_14:
  objc_msgSend(v76, sel_family);
  v29 = CHSWidgetFamilyMaskFromWidgetFamily();
  if ((v29 & ~(unint64_t)objc_msgSend(v26, sel_supportedFamilies)) != 0)
  {
    sub_2384C06D8();
    swift_allocError();
    v34 = 2;
LABEL_24:
    *v33 = v34;
    swift_willThrow();

    return;
  }
  if ((*(_BYTE *)(v75 + 24) & 1) != 0)
    v30 = sub_2384D2698();
  else
    v30 = sub_2384D26B0();
  if ((v29 & ~(unint64_t)objc_msgSend(v26, sel_disfavoredFamiliesForLocation_, *v30)) == 0)
  {
    sub_2384C06D8();
    swift_allocError();
    v34 = 5;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  sub_2384DF994();
  v35 = *(_QWORD *)(v77
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier
                  + 8);
  v69[0] = v25;
  if (v35)
  {
    swift_bridgeObjectRetain_n();
    sub_2384DF994();
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v11, 0, 1, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A38);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v11, 1, 1, v38);
  }
  sub_2384DFBA4();
  v39 = (void *)sub_2384DFB98();
  swift_bridgeObjectRetain();
  v40 = objc_msgSend(v76, sel_family);
  v41 = v77;
  v42 = *(void **)(v77 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  v43 = objc_allocWithZone(MEMORY[0x24BE16A18]);
  v44 = v42;
  v45 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v46 = objc_msgSend(v43, sel_initWithExtensionIdentity_kind_family_intent_activityIdentifier_, v39, v45, v40, v44, 0);

  v47 = v70;
  sub_2384DF94C();
  sub_2384DF940();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v47, v72);
  v48 = *(void **)(v41
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
  if (v48)
  {
    v49 = objc_msgSend(v48, sel_clientModelId, v69[0]);
    sub_2384DFA30();
    v51 = v50;

  }
  else
  {
    v51 = 0;
  }
  v52 = v46;
  v53 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (v51)
  {
    v54 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v54 = 0;
  }
  v55 = v26;
  v56 = objc_msgSend(objc_allocWithZone((Class)ATXWidget), sel_initWithIdentifier_chsWidget_suggestedWidget_source_, v53, v52, 1, v54);

  v57 = objc_msgSend(v76, sel_identifier);
  sub_2384DFA30();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2384E1240;
  *(_QWORD *)(inited + 32) = v56;
  v79 = inited;
  sub_2384DFAA8();
  v59 = v79;
  if (v79 >> 62)
  {
    v62 = v56;
    swift_bridgeObjectRetain();
    v63 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (!v63)
      goto LABEL_42;
    goto LABEL_37;
  }
  v60 = *(_QWORD *)((v79 & 0xFFFFFFFFFFFFF8) + 0x10);
  v61 = v56;
  if (v60)
LABEL_37:
    sub_2384C2A90(v59);
LABEL_42:
  swift_bridgeObjectRelease();
  v64 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
  v65 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  sub_2384C2DE8();
  v66 = (void *)sub_2384DFAFC();
  swift_bridgeObjectRelease();
  v67 = objc_msgSend(v64, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v65, v56, v66);

  v68 = *(void **)(v75 + 32);
  *(_QWORD *)(v75 + 32) = v67;

}

uint64_t sub_2384BA280()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id sub_2384BA2AC()
{
  return objc_msgSend(objc_allocWithZone((Class)ATXWidgetLocationAuthorizationTracker), sel_init);
}

uint64_t sub_2384BA2D0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_2384BA2D8@<X0>(char a1@<W0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9;
  id v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v9 = a1 & 1;
  v10 = objc_msgSend(objc_allocWithZone((Class)ATXWidgetLocationAuthorizationTracker), sel_init);
  if (!(a2 >> 62))
  {
    v11 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
      goto LABEL_3;
LABEL_12:
    result = swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
LABEL_13:
    *(_QWORD *)a5 = v21;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = 0;
    *(_QWORD *)(a5 + 24) = 0;
    *(_QWORD *)(a5 + 32) = a4;
    *(_QWORD *)(a5 + 40) = v10;
    *(_BYTE *)(a5 + 48) = v9;
    return result;
  }
  swift_bridgeObjectRetain();
  v11 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  if (!v11)
    goto LABEL_12;
LABEL_3:
  v23 = MEMORY[0x24BEE4AF8];
  result = sub_2384DFCF4();
  if ((v11 & 0x8000000000000000) == 0)
  {
    v22 = a4;
    if ((a2 & 0xC000000000000001) != 0)
    {
      v13 = 0;
      do
      {
        v14 = v13 + 1;
        v15 = MEMORY[0x23B8366E4]();
        type metadata accessor for WidgetStackSuggestionGenerator.StackState();
        v16 = swift_allocObject();
        *(_QWORD *)(v16 + 32) = 0;
        *(_QWORD *)(v16 + 16) = v15;
        *(_BYTE *)(v16 + 24) = v9;
        sub_2384DFCDC();
        sub_2384DFD00();
        sub_2384DFD0C();
        sub_2384DFCE8();
        v13 = v14;
      }
      while (v11 != v14);
    }
    else
    {
      v17 = (void **)(a2 + 32);
      type metadata accessor for WidgetStackSuggestionGenerator.StackState();
      do
      {
        v18 = *v17++;
        v19 = swift_allocObject();
        *(_QWORD *)(v19 + 32) = 0;
        *(_QWORD *)(v19 + 16) = v18;
        *(_BYTE *)(v19 + 24) = v9;
        v20 = v18;
        sub_2384DFCDC();
        sub_2384DFD00();
        sub_2384DFD0C();
        sub_2384DFCE8();
        --v11;
      }
      while (v11);
    }
    v21 = v23;
    result = swift_bridgeObjectRelease();
    a4 = v22;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WidgetStackSuggestionGenerator.StackState()
{
  return objc_opt_self();
}

uint64_t sub_2384BA4F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    v3 = v0;
    sub_2384BA594();
    v2 = v4;
    v5 = sub_2384BC450();
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  sub_2384BD020(v1);
  return v2;
}

void sub_2384BA594()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  unint64_t v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t i;
  id v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t, char *);
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint8_t *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *);
  unint64_t v58;
  __int128 v59;
  uint64_t v60;
  char **v61;
  uint64_t v62;
  BOOL v63;
  id v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  unsigned __int8 v93;
  id v94;
  uint64_t inited;
  unint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  _QWORD *v100;
  id v101;
  id v102;
  char *v103;
  unint64_t v104;
  NSObject *v105;
  os_log_type_t v106;
  id v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t *v113;
  id *v114;
  char *v115;
  char *v116;
  id v117;
  unint64_t v118;
  id v119;
  NSObject *v120;
  os_log_type_t v121;
  _QWORD *v122;
  id v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  id v127;
  void *v128;
  _QWORD *v129;
  id *v130;
  char *v131;
  id v132;
  uint64_t v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  char *v139;
  __int128 v140;
  char *v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  id v149;
  id v150;
  int v151;
  char *v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  NSObject *v156;
  os_log_type_t v157;
  uint64_t v158;
  _QWORD *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  char *v166;
  NSObject *v167;
  os_log_type_t v168;
  uint8_t *v169;
  uint64_t v170;
  _QWORD *v171;
  char *v172;
  _QWORD *v173;
  unint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  id v179;
  uint64_t v180;
  void *v181;
  id v182;
  id v183;
  void *v184;
  void *v185;
  unint64_t v186;
  _QWORD v187[4];
  uint64_t v188;
  char *v189;
  uint64_t v190;
  uint64_t *v191;
  char *v192;
  unint64_t v193;
  __int128 v194;
  __int128 v195;
  char *v196;
  char *v197;
  void (*v198)(char *, char *);
  void (*v199)(char *, uint64_t, char *);
  uint64_t v200;
  id v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  __int128 v205;
  __int128 v206;
  uint64_t *v207;
  uint64_t *v208;
  id *v209;
  char *v210;
  uint64_t v211;
  unint64_t v212;
  id *v213;
  unint64_t v214;
  unint64_t v215;
  uint64_t v216;
  uint64_t v217;
  id *v218;
  id v219;
  char v220;
  unint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  unsigned __int8 v227;
  uint64_t v228;
  _QWORD v229[2];

  v0 = sub_2384DF9B8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v187 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (unint64_t)v187 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v187 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (uint64_t)v187 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v187 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v187 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v187 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v187 - v23;
  sub_2384BD0DC((uint64_t)&v221);
  v210 = (char *)v0;
  if (v222)
  {
    v25 = v222;
    v215 = v221;
    v26 = v223;
    v27 = v224;
    v28 = v225;
    v29 = v226;
    LODWORD(v216) = v227;
    LODWORD(v214) = v227 & 1;
    v30 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v24, v30, v0);
    v31 = sub_2384DF9AC();
    v32 = sub_2384DFB44();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = v1;
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2384B0000, v31, v32, "Loaded debug rotation", v34, 2u);
      v35 = v34;
      v1 = v33;
      MEMORY[0x23B836F18](v35, -1, -1);
    }

    (*(void (**)(char *, char *))(v1 + 8))(v24, v210);
    v36 = v215;
    v221 = v215;
    v222 = v25;
    v223 = v26;
    v224 = v27;
    v225 = v28;
    v226 = v29;
    v227 = v214;
    sub_2384BD46C((uint64_t)&v221);
    sub_2384C31B4(v36, v25);
    return;
  }
  v197 = v16;
  v187[3] = v4;
  v214 = v1;
  v215 = (unint64_t)v22;
  v188 = v13;
  v189 = v10;
  v187[2] = v7;
  v37 = v207[1];
  v229[0] = v37;
  v221 = MEMORY[0x24BEE4AF8];
  if (v37 >> 62)
    goto LABEL_140;
  v38 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
LABEL_7:
  v196 = v19;
  if (v38)
  {
    if (v38 < 1)
    {
      __break(1u);
LABEL_168:
      v139 = (char *)MEMORY[0x23B8366E4](0);
      goto LABEL_98;
    }
    for (i = 0; i != v38; ++i)
    {
      if ((v37 & 0xC000000000000001) != 0)
        v40 = (id)MEMORY[0x23B8366E4](i, v37);
      else
        v40 = *(id *)(v37 + 8 * i + 32);
      v41 = v40;
      type metadata accessor for ContextualWidgetSuggestion();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x23B8364A4]();
        if (*(_QWORD *)((v221 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v221 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2384DFAB4();
        sub_2384DFAC0();
        sub_2384DFAA8();
      }
      else
      {

      }
    }
    sub_2384C2E74((uint64_t)v229);
    v42 = v221;
  }
  else
  {
    sub_2384C2E74((uint64_t)v229);
    v42 = MEMORY[0x24BEE4AF8];
  }
  sub_2384C2E74((uint64_t)v229);
  v43 = sub_2384C78FC();
  v44 = v214;
  v37 = v215;
  v45 = *(void (**)(char *, uint64_t, char *))(v214 + 16);
  v200 = v43;
  v22 = v210;
  v199 = v45;
  ((void (*)(unint64_t))v45)(v215);
  swift_bridgeObjectRetain_n();
  v46 = sub_2384DF9AC();
  v47 = sub_2384DFB44();
  v7 = v47;
  v48 = os_log_type_enabled(v46, v47);
  v216 = v42;
  if (v48)
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    v221 = v50;
    *(_DWORD *)v49 = 136315138;
    v37 = (unint64_t)(v49 + 12);
    v51 = type metadata accessor for ContextualWidgetSuggestion();
    v52 = swift_bridgeObjectRetain();
    v53 = MEMORY[0x23B8364C8](v52, v51);
    v55 = v54;
    swift_bridgeObjectRelease();
    v56 = v53;
    v22 = v210;
    v228 = sub_2384C1184(v56, v55, (uint64_t *)&v221);
    sub_2384DFC04();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v46, (os_log_type_t)v7, "Suggestions: %s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v50, -1, -1);
    MEMORY[0x23B836F18](v49, -1, -1);

    v57 = *(void (**)(char *, char *))(v44 + 8);
    v58 = v215;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v57 = *(void (**)(char *, char *))(v44 + 8);
    v58 = v37;
  }
  v198 = v57;
  v57((char *)v58, v22);
  v13 = *v207;
  v228 = v13;
  v193 = (unint64_t)v13 >> 62;
  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0)
      v37 = v13;
    else
      v37 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v19 = (char *)sub_2384DFD3C();
  }
  else
  {
    v19 = *(char **)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)&v206 = (unint64_t)v216 >> 62;
  v211 = v13;
  v203 = v19;
  if (v19)
  {
    v37 = 0;
    v201 = 0;
    v212 = v13 & 0xC000000000000001;
    *(_QWORD *)&v205 = v13 & 0xFFFFFFFFFFFFFF8;
    v204 = v13 + 32;
    v60 = v216 & 0xFFFFFFFFFFFFFF8;
    v202 = v216 & 0xFFFFFFFFFFFFFF8;
    if (v216 < 0)
      v60 = v216;
    v187[1] = v60;
    v215 = v216 & 0xC000000000000001;
    v192 = &v220;
    v191 = (uint64_t *)&v218;
    v61 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
    *(_QWORD *)&v59 = 136315394;
    v194 = v59;
    v190 = MEMORY[0x24BEE4AD8] + 8;
    v195 = xmmword_2384E1240;
LABEL_32:
    if (v212)
    {
      v62 = MEMORY[0x23B8366E4](v37, v13);
      v63 = __OFADD__(v37++, 1);
      if (v63)
        goto LABEL_136;
    }
    else
    {
      if (v37 >= *(_QWORD *)(v205 + 16))
        goto LABEL_138;
      v62 = swift_retain();
      v63 = __OFADD__(v37++, 1);
      if (v63)
        goto LABEL_136;
    }
    v213 = (id *)v37;
    v214 = v62;
    v7 = *(_QWORD *)(v62 + 16);
    v64 = objc_msgSend((id)v7, sel_widgets);
    v65 = sub_2384C071C();
    v66 = sub_2384DFA90();

    if (v66 >> 62)
    {
      swift_bridgeObjectRetain();
      v67 = sub_2384DFD3C();
      if (!v67)
      {
LABEL_30:
        swift_bridgeObjectRelease_n();
        swift_release();
        goto LABEL_31;
      }
    }
    else
    {
      v67 = *(_QWORD *)((v66 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v67)
        goto LABEL_30;
    }
    v208 = (uint64_t *)v7;
    v209 = (id *)v65;
    v68 = 4;
    while (1)
    {
      v69 = (v66 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x23B8366E4](v68 - 4, v66)
          : *(id *)(v66 + 8 * v68);
      v7 = (unint64_t)v69;
      v37 = v68 - 3;
      if (__OFADD__(v68 - 4, 1))
        break;
      if ((objc_msgSend(v69, v61[13]) & 1) != 0)
      {
        swift_bridgeObjectRelease_n();
        if (!(_QWORD)v206)
        {
          v70 = *(_QWORD *)(v202 + 16);
          v71 = v216;
          swift_bridgeObjectRetain();
          if (v70)
            goto LABEL_50;
LABEL_79:
          swift_bridgeObjectRelease();
          sub_2384C06D8();
          v99 = (void *)swift_allocError();
          *v100 = 4;
          swift_willThrow();
          v201 = 0;

          v221 = (unint64_t)v99;
          v101 = v99;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256912978);
          if ((swift_dynamicCast() & 1) != 0)
          {

            v102 = v219;
            v103 = v196;
            v22 = v210;
            v199(v196, v200, v210);
            v104 = v214;
            swift_retain();
            sub_2384C3194(v102);
            swift_retain();
            sub_2384C3194(v102);
            v105 = sub_2384DF9AC();
            v106 = sub_2384DFB44();
            if (os_log_type_enabled(v105, v106))
            {
              v7 = swift_slowAlloc();
              v208 = (uint64_t *)swift_slowAlloc();
              v209 = (id *)swift_slowAlloc();
              v218 = v209;
              *(_DWORD *)v7 = v194;
              v107 = objc_msgSend(*(id *)(v104 + 16), sel_identifier);
              v108 = sub_2384DFA30();
              v110 = v109;

              v217 = sub_2384C1184(v108, v110, (uint64_t *)&v218);
              sub_2384DFC04();
              swift_release_n();
              v61 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
              swift_bridgeObjectRelease();
              *(_WORD *)(v7 + 12) = 2112;
              swift_allocError();
              *v111 = v102;
              sub_2384C3194(v102);
              v112 = _swift_stdlib_bridgeErrorToNSError();
              v217 = v112;
              sub_2384DFC04();
              v113 = v208;
              *v208 = v112;
              sub_2384C31A4(v102);
              sub_2384C31A4(v102);
              _os_log_impl(&dword_2384B0000, v105, v106, "Removing previously suggested new widget in stack <%s>: %@", (uint8_t *)v7, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
              swift_arrayDestroy();
              MEMORY[0x23B836F18](v113, -1, -1);
              v114 = v209;
              swift_arrayDestroy();
              MEMORY[0x23B836F18](v114, -1, -1);
              MEMORY[0x23B836F18](v7, -1, -1);

              sub_2384C31A4(v102);
              swift_release();
              v115 = v196;
              v22 = v210;
            }
            else
            {
              swift_release();
              sub_2384C31A4(v102);
              swift_release_n();
              sub_2384C31A4(v102);
              sub_2384C31A4(v102);

              v115 = v103;
            }
            v198(v115, v22);

          }
          else
          {

            v116 = v197;
            v22 = v210;
            v199(v197, v200, v210);
            v117 = v99;
            v118 = v214;
            swift_retain();
            v119 = v99;
            swift_retain();
            v120 = sub_2384DF9AC();
            v121 = sub_2384DFB38();
            if (os_log_type_enabled(v120, v121))
            {
              v7 = swift_slowAlloc();
              v122 = (_QWORD *)swift_slowAlloc();
              v209 = (id *)swift_slowAlloc();
              v221 = (unint64_t)v209;
              *(_DWORD *)v7 = v194;
              v123 = objc_msgSend(*(id *)(v118 + 16), sel_identifier);
              v124 = sub_2384DFA30();
              v126 = v125;

              v22 = v210;
              v219 = (id)sub_2384C1184(v124, v126, (uint64_t *)&v221);
              sub_2384DFC04();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v7 + 12) = 2112;
              v127 = v99;
              v128 = (void *)_swift_stdlib_bridgeErrorToNSError();
              v219 = v128;
              sub_2384DFC04();
              *v122 = v128;

              _os_log_impl(&dword_2384B0000, v120, v121, "Removing previously suggested new widget in stack <%s>: unknown failure: %@", (uint8_t *)v7, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
              swift_arrayDestroy();
              v129 = v122;
              v61 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
              MEMORY[0x23B836F18](v129, -1, -1);
              v130 = v209;
              swift_arrayDestroy();
              MEMORY[0x23B836F18](v130, -1, -1);
              MEMORY[0x23B836F18](v7, -1, -1);

              swift_release();
              v131 = v197;
            }
            else
            {
              swift_release();

              swift_release_n();
              v131 = v116;
            }
            v198(v131, v22);
          }
          v13 = v211;
          v19 = v203;
          goto LABEL_31;
        }
        v71 = v216;
        swift_bridgeObjectRetain();
        v70 = sub_2384DFD3C();
        if (!v70)
          goto LABEL_79;
LABEL_50:
        v13 = 4;
        while (2)
        {
          v37 = v13 - 4;
          if (v215)
            v72 = (char *)MEMORY[0x23B8366E4](v13 - 4, v71);
          else
            v72 = (char *)*(id *)(v71 + 8 * v13);
          v19 = v72;
          v73 = v13 - 3;
          if (__OFADD__(v37, 1))
            goto LABEL_135;
          v74 = *(_QWORD *)&v72[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier];
          v75 = *(_QWORD *)&v72[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                              + 8];
          v76 = objc_msgSend((id)v7, sel_chsWidget);
          v22 = (char *)objc_msgSend(v76, sel_extensionIdentity);

          swift_beginAccess();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
          v77 = sub_2384DF9A0();
          v79 = v78;
          swift_endAccess();

          if (v74 != v77 || v75 != v79)
          {
            v81 = sub_2384DFDD8();
            swift_bridgeObjectRelease();
            v61 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
            if ((v81 & 1) != 0)
              goto LABEL_63;
LABEL_51:

            ++v13;
            v71 = v216;
            if (v73 == v70)
              goto LABEL_79;
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_63:
        v83 = *(_QWORD *)&v19[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind];
        v82 = *(_QWORD *)&v19[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind + 8];
        v84 = objc_msgSend((id)v7, sel_chsWidget);
        v22 = (char *)objc_msgSend(v84, sel_kind);

        v85 = sub_2384DFA30();
        v87 = v86;

        if (v83 == v85 && v82 == v87)
        {
          swift_bridgeObjectRelease();
          v61 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
        }
        else
        {
          v88 = sub_2384DFDD8();
          swift_bridgeObjectRelease();
          v61 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
          if ((v88 & 1) == 0)
            goto LABEL_51;
        }
        v89 = objc_msgSend((id)v7, sel_chsWidget);
        v90 = objc_msgSend(v89, sel_intentReference);

        if (!v90 || (v91 = objc_msgSend(v90, sel_intent), v90, !v91))
        {
LABEL_71:

          swift_bridgeObjectRelease();
          goto LABEL_73;
        }
        v92 = *(_QWORD *)&v19[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent];
        if (v92)
        {
          v93 = objc_msgSend((id)objc_opt_self(), sel_intent_isEqualToIntent_, v91, v92);

          if ((v93 & 1) != 0)
            goto LABEL_71;
          goto LABEL_51;
        }

        swift_bridgeObjectRelease();
LABEL_73:
        v94 = objc_msgSend(v208, sel_identifier);
        sub_2384DFA30();

        __swift_instantiateConcreteTypeFromMangledName(&qword_256912A40);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v195;
        *(_QWORD *)(inited + 32) = v7;
        v221 = inited;
        sub_2384DFAA8();
        v96 = v221;
        v22 = v210;
        v13 = v211;
        v19 = v203;
        if (v221 >> 62)
        {
          v132 = (id)v7;
          swift_bridgeObjectRetain();
          v133 = sub_2384DFD3C();
          swift_bridgeObjectRelease();
          if (v133)
LABEL_75:
            sub_2384C2A90(v96);
        }
        else
        {
          v97 = *(_QWORD *)((v221 & 0xFFFFFFFFFFFFF8) + 0x10);
          v98 = (id)v7;
          if (v97)
            goto LABEL_75;
        }
        swift_bridgeObjectRelease();
        v134 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
        v135 = (void *)sub_2384DFA18();
        swift_bridgeObjectRelease();
        sub_2384C2DE8();
        v136 = (void *)sub_2384DFAFC();
        swift_bridgeObjectRelease();
        v137 = objc_msgSend(v134, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v135, v7, v136);

        v138 = *(void **)(v214 + 32);
        *(_QWORD *)(v214 + 32) = v137;
        swift_release();

LABEL_31:
        v37 = (unint64_t)v213;
        if (v213 == (id *)v19)
        {
          sub_2384C2E74((uint64_t)&v228);
          goto LABEL_93;
        }
        goto LABEL_32;
      }

      ++v68;
      if (v37 == v67)
        goto LABEL_30;
    }
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
    goto LABEL_139;
  }
  sub_2384C2E74((uint64_t)&v228);
  v201 = 0;
LABEL_93:
  if ((_QWORD)v206)
  {
    if (v216 < 0)
      v37 = v216;
    else
      v37 = v216 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v38 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (!v38)
    {
LABEL_149:
      swift_bridgeObjectRelease();
      goto LABEL_150;
    }
  }
  else
  {
    v38 = *(_QWORD *)((v216 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v38)
      goto LABEL_149;
  }
  v7 = v216 & 0xC000000000000001;
  if ((v216 & 0xC000000000000001) != 0)
    goto LABEL_168;
  if (!*(_QWORD *)((v216 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_170;
  }
  v139 = (char *)*(id *)(v216 + 32);
LABEL_98:
  v141 = v139;
  if (!v19)
    goto LABEL_133;
  v142 = v13 & 0xC000000000000001;
  v143 = v13 + 32;
  v208 = &v222;
  v213 = &v219;
  v212 = v216 & 0xFFFFFFFFFFFFFF8;
  v209 = (id *)(v216 + 32);
  v215 = 1;
  *(_QWORD *)&v140 = 138412546;
  v206 = v140;
  *(_QWORD *)&v140 = 138412290;
  v205 = v140;
  v214 = v13 & 0xC000000000000001;
  do
  {
    if (!v142)
    {
      v147 = 0;
      while (1)
      {
        v148 = (char *)(v147 + 1);
        if (__OFADD__(v147, 1))
          break;
        if (!*(_QWORD *)(*(_QWORD *)(v143 + 8 * v147) + 32))
          goto LABEL_112;
        ++v147;
        if (v148 == v19)
          goto LABEL_133;
      }
LABEL_139:
      __break(1u);
LABEL_140:
      swift_bridgeObjectRetain_n();
      v38 = sub_2384DFD3C();
      goto LABEL_7;
    }
    swift_bridgeObjectRetain_n();
    v37 = 0;
    while (1)
    {
      v144 = MEMORY[0x23B8366E4](v37, v13);
      v145 = (char *)(v37 + 1);
      if (__OFADD__(v37, 1))
        goto LABEL_137;
      v146 = *(_QWORD *)(v144 + 32);
      swift_unknownObjectRelease();
      if (!v146)
        break;
      ++v37;
      if (v145 == v19)
        goto LABEL_132;
    }
    sub_2384C2E74((uint64_t)&v228);
    sub_2384C2E74((uint64_t)&v228);
LABEL_112:
    v149 = v201;
    sub_2384BD8FC(v141);
    if (v149)
    {
      v219 = v149;
      v150 = v149;
      v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912978);
      v151 = swift_dynamicCast();
      v152 = v189;
      if (v151)
      {

        v153 = v221;
        LODWORD(v201) = v222;
        v154 = v188;
        v199((char *)v188, v200, v22);
        v155 = v141;
        v156 = sub_2384DF9AC();
        v157 = sub_2384DFB44();
        LODWORD(v197) = v157;
        if (os_log_type_enabled(v156, v157))
        {
          v158 = swift_slowAlloc();
          v159 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v158 = v206;
          v196 = (char *)v153;
          v218 = (id *)v155;
          v160 = v155;
          v204 = v38;
          v161 = v160;
          sub_2384DFC04();
          *v159 = v155;

          *(_WORD *)(v158 + 12) = 2112;
          sub_2384BD098();
          swift_allocError();
          *(_QWORD *)v162 = v196;
          *(_BYTE *)(v162 + 8) = (_BYTE)v201;
          v163 = _swift_stdlib_bridgeErrorToNSError();
          v218 = (id *)v163;
          sub_2384DFC04();
          v159[1] = v163;
          v38 = v204;
          _os_log_impl(&dword_2384B0000, v156, (os_log_type_t)v197, "Can't smart rotate to suggestion: %@: %@", (uint8_t *)v158, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
          swift_arrayDestroy();
          v164 = v159;
          v19 = v203;
          v22 = v210;
          MEMORY[0x23B836F18](v164, -1, -1);
          v165 = v158;
          v154 = v188;
          MEMORY[0x23B836F18](v165, -1, -1);
        }
        else
        {

          v156 = v155;
        }

        v198((char *)v154, v22);
      }
      else
      {
        v201 = v149;

        v199(v152, v200, v22);
        v166 = v141;
        v167 = sub_2384DF9AC();
        v168 = sub_2384DFB38();
        if (os_log_type_enabled(v167, v168))
        {
          v169 = (uint8_t *)swift_slowAlloc();
          v170 = swift_slowAlloc();
          v204 = v38;
          v171 = (_QWORD *)v170;
          v197 = (char *)v7;
          *(_DWORD *)v169 = v205;
          v221 = (unint64_t)v166;
          v172 = v166;
          v7 = (unint64_t)v197;
          sub_2384DFC04();
          *v171 = v166;

          v19 = v203;
          v22 = v210;
          _os_log_impl(&dword_2384B0000, v167, v168, "Can't smart rotate to suggestion: %@: unknown failure", v169, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
          swift_arrayDestroy();
          v173 = v171;
          v38 = v204;
          MEMORY[0x23B836F18](v173, -1, -1);
          MEMORY[0x23B836F18](v169, -1, -1);
        }
        else
        {

        }
        v198(v189, v22);
      }
      sub_2384BE9E8((uint64_t)v141);

      v201 = 0;
      v13 = v211;
    }
    else
    {
      v201 = 0;

    }
    v174 = v215;
    if (v215 == v38)
      goto LABEL_149;
    if (v7)
    {
      v175 = (char *)MEMORY[0x23B8366E4](v215, v216);
    }
    else
    {
      if (v215 >= *(_QWORD *)(v212 + 16))
        goto LABEL_171;
      v175 = (char *)v209[v215];
    }
    v141 = v175;
    v63 = __OFADD__(v174, 1);
    v37 = v174 + 1;
    v215 = v37;
    v142 = v214;
  }
  while (!v63);
  __break(1u);
LABEL_132:
  sub_2384C2E74((uint64_t)&v228);
  sub_2384C2E74((uint64_t)&v228);
LABEL_133:
  swift_bridgeObjectRelease();

LABEL_150:
  if (v193)
  {
    swift_bridgeObjectRetain();
    v176 = sub_2384DFD3C();
  }
  else
  {
    v176 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v176)
  {
LABEL_166:
    sub_2384C2E74((uint64_t)&v228);
    return;
  }
  v221 = MEMORY[0x24BEE4AF8];
  sub_2384DFCF4();
  if ((v176 & 0x8000000000000000) == 0)
  {
    v177 = 0;
    v178 = v13 & 0xC000000000000001;
    while (1)
    {
      if (v178)
      {
        v180 = MEMORY[0x23B8366E4](v177, v13);
        v181 = *(void **)(v180 + 32);
        if (!v181)
          goto LABEL_161;
      }
      else
      {
        v180 = *(_QWORD *)(v13 + 8 * v177 + 32);
        swift_retain();
        v181 = *(void **)(v180 + 32);
        if (!v181)
        {
LABEL_161:
          v182 = objc_msgSend(*(id *)(v180 + 16), sel_identifier);
          sub_2384DFA30();

          if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
          {
            v186 = MEMORY[0x24BEE4AF8];
            if (sub_2384DFD3C())
              sub_2384C2A90(v186);
          }
          v183 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
          v184 = (void *)sub_2384DFA18();
          swift_bridgeObjectRelease();
          sub_2384C071C();
          sub_2384C2DE8();
          v185 = (void *)sub_2384DFAFC();
          swift_bridgeObjectRelease();
          objc_msgSend(v183, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v184, 0, v185);

          v181 = 0;
          v13 = v211;
        }
      }
      ++v177;
      v179 = v181;
      swift_release();
      sub_2384DFCDC();
      sub_2384DFD00();
      sub_2384DFD0C();
      sub_2384DFCE8();
      if (v176 == v177)
        goto LABEL_166;
    }
  }
LABEL_170:
  __break(1u);
LABEL_171:
  __break(1u);
}

uint64_t sub_2384BC450()
{
  void **v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void **v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char **v16;
  char **v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  void (*v55)(_QWORD *);
  _QWORD *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char isUniquelyReferenced_nonNull_native;
  char v73;
  unint64_t v74;
  uint64_t v75;
  _BOOL8 v76;
  uint64_t v77;
  char v78;
  unint64_t v79;
  char v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t result;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  __int128 v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  _QWORD v108[4];
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  _QWORD v112[2];

  v1 = v0;
  v2 = sub_2384DF9B8();
  v100 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v99 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (unint64_t)v0[1];
  v112[0] = v5;
  v108[0] = MEMORY[0x24BEE4AF8];
  v94 = v3;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v6 = sub_2384DFD3C();
    if (!v6)
      goto LABEL_19;
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v6)
      goto LABEL_19;
  }
  if (v6 < 1)
    goto LABEL_125;
  if ((v5 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v6; ++i)
    {
      MEMORY[0x23B8366E4](i, v5);
      type metadata accessor for ContextualActionSuggestion();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x23B8364A4]();
        if (*(_QWORD *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2384DFAB4();
        sub_2384DFAC0();
        sub_2384DFAA8();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    v8 = (void **)(v5 + 32);
    type metadata accessor for ContextualActionSuggestion();
    do
    {
      v9 = *v8;
      if (swift_dynamicCastClass())
      {
        MEMORY[0x23B8364A4](v9);
        if (*(_QWORD *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2384DFAB4();
        sub_2384DFAC0();
        sub_2384DFAA8();
      }
      ++v8;
      --v6;
    }
    while (v6);
  }
LABEL_19:
  sub_2384C2E74((uint64_t)v112);
  v10 = v108[0];
  sub_2384C2E74((uint64_t)v112);
  v110 = v10;
  v109 = sub_2384BFD88(MEMORY[0x24BEE4AF8]);
  v111 = (unint64_t)*v1;
  v11 = v111;
  v12 = v111 & 0xFFFFFFFFFFFFFF8;
  if (v111 >> 62)
    goto LABEL_121;
  v13 = *(_QWORD *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_122:
    sub_2384C2E74((uint64_t)&v111);
    swift_bridgeObjectRelease();
    return v109;
  }
LABEL_21:
  v14 = 0;
  v15 = v11 & 0xC000000000000001;
  v93 = (char *)(v11 + 32);
  v105 = *MEMORY[0x24BE04288];
  v16 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
  v17 = &off_250A31000;
  v103 = xmmword_2384E1240;
  v97 = v12;
  v98 = v11;
  v96 = v13;
  v95 = v11 & 0xC000000000000001;
  while (1)
  {
    if (!v15)
    {
      if (v14 >= *(_QWORD *)(v12 + 16))
      {
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        result = sub_2384DFDF0();
        __break(1u);
        return result;
      }
      v18 = *(_QWORD *)&v93[8 * v14];
      swift_retain();
      v19 = __OFADD__(v14++, 1);
      if (!v19)
        goto LABEL_30;
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      swift_bridgeObjectRetain();
      v13 = sub_2384DFD3C();
      if (!v13)
        goto LABEL_122;
      goto LABEL_21;
    }
    v18 = MEMORY[0x23B8366E4](v14, v11);
    v19 = __OFADD__(v14++, 1);
    if (v19)
      goto LABEL_117;
LABEL_30:
    v20 = objc_msgSend(*(id *)(v18 + 16), v16[29], v93);
    sub_2384C071C();
    v21 = sub_2384DFA90();

    v104 = v21;
    if (!(v21 >> 62))
    {
      v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v22)
        break;
      goto LABEL_101;
    }
    swift_bridgeObjectRetain();
    v22 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (v22)
      break;
LABEL_101:
    swift_release();
LABEL_23:
    swift_bridgeObjectRelease();
    if (v14 == v13)
      goto LABEL_122;
  }
  v101 = v14;
  v102 = v18;
  v23 = v104;
  v106 = v22;
  v107 = v104 & 0xC000000000000001;
  v24 = 4;
  while (1)
  {
    if (v107)
      v25 = (id)MEMORY[0x23B8366E4](v24 - 4, v23);
    else
      v25 = *(id *)(v23 + 8 * v24);
    v11 = (unint64_t)v25;
    v26 = v24 - 3;
    if (__OFADD__(v24 - 4, 1))
    {
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
      goto LABEL_117;
    }
    v27 = objc_msgSend(v25, v17[486]);
    v28 = objc_msgSend(v27, sel_extensionIdentity);

    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
    v29 = sub_2384DF9A0();
    v31 = v30;
    swift_endAccess();

    if (v29 == sub_2384DFA30() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v12 = sub_2384DFDD8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {

        goto LABEL_34;
      }
    }
    v34 = objc_msgSend((id)v11, v17[486]);
    v35 = objc_msgSend(v34, sel_kind);

    v36 = sub_2384DFA30();
    v38 = v37;

    v39 = (id)ATXSpecialWidgetKindSiriSuggestions();
    v40 = sub_2384DFA30();
    v42 = v41;

    if (v36 == v40 && v38 == v42)
      break;
    v12 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      goto LABEL_50;

    v23 = v104;
LABEL_34:
    ++v24;
    if (v26 == v106)
    {
      swift_release();
      v12 = v97;
      v11 = v98;
      v13 = v96;
      v14 = v101;
      v15 = v95;
      v16 = &selRef_initWithEffectiveBundleIdentifier_delegate_onQueue_;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_50:
  v43 = v110;
  v44 = v110 >> 62;
  if (!(v110 >> 62))
  {
    if (!*(_QWORD *)((v110 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_102;
LABEL_52:
    v45 = objc_msgSend((id)v11, sel_identifier);
    v46 = sub_2384DFA30();
    v48 = v47;

    if (*(_QWORD *)(v109 + 16))
    {
      sub_2384C17C4(v46, v48);
      v50 = v49;
      swift_bridgeObjectRelease();
      if ((v50 & 1) != 0)
      {
        v51 = objc_msgSend((id)v11, sel_identifier);
        v52 = sub_2384DFA30();
        v12 = v53;

        v55 = sub_2384BFEA0(v108, v52, v12);
        if (*v54)
        {
          v56 = v54;
          if (v44)
          {
            swift_bridgeObjectRetain();
            v65 = sub_2384DFD3C();
            swift_bridgeObjectRelease();
            if (!v65)
              goto LABEL_119;
            swift_bridgeObjectRetain();
            v66 = sub_2384DFD3C();
            swift_bridgeObjectRelease();
            if (!v66)
              goto LABEL_115;
          }
          else if (!*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_118;
          }
          if ((v43 & 0xC000000000000001) != 0)
          {
            MEMORY[0x23B8366E4](0, v43);
            if (!v44)
            {
LABEL_75:
              v68 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_96:
              v23 = v104;
              if (!v68)
                goto LABEL_120;
              v86 = sub_2384C2E9C(0, 1);
              MEMORY[0x23B8364A4](v86);
              if (*(_QWORD *)((*v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_2384DFAB4();
              sub_2384DFAC0();
              sub_2384DFAA8();
              ((void (*)(_QWORD *, _QWORD))v55)(v108, 0);
              swift_bridgeObjectRelease();

              v17 = &off_250A31000;
              goto LABEL_34;
            }
          }
          else
          {
            if (!*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_116;
            v67 = *(id *)(v43 + 32);
            if (!v44)
              goto LABEL_75;
          }
          swift_bridgeObjectRetain();
          v68 = sub_2384DFD3C();
          swift_bridgeObjectRelease();
          goto LABEL_96;
        }
        ((void (*)(_QWORD *, _QWORD))v55)(v108, 0);
        swift_bridgeObjectRelease();

        goto LABEL_93;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v57 = objc_msgSend((id)v11, sel_identifier);
    v58 = sub_2384DFA30();
    v12 = v59;

    __swift_instantiateConcreteTypeFromMangledName(&qword_256912A40);
    v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = v103;
    if (v44)
    {
      swift_bridgeObjectRetain();
      v61 = sub_2384DFD3C();
      swift_bridgeObjectRelease();
      if (!v61)
        goto LABEL_112;
      swift_bridgeObjectRetain();
      v62 = sub_2384DFD3C();
      swift_bridgeObjectRelease();
      if (!v62)
        goto LABEL_108;
    }
    else if (!*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_111;
    }
    if ((v43 & 0xC000000000000001) != 0)
    {
      v63 = (id)MEMORY[0x23B8366E4](0, v43);
      if (!v44)
        goto LABEL_68;
    }
    else
    {
      if (!*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_109;
      v63 = *(id *)(v43 + 32);
      if (!v44)
      {
LABEL_68:
        v64 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_80;
      }
    }
    swift_bridgeObjectRetain();
    v64 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
LABEL_80:
    if (!v64)
      goto LABEL_113;
    sub_2384C2E9C(0, 1);
    *(_QWORD *)(v60 + 32) = v63;
    v108[0] = v60;
    sub_2384DFAA8();
    v70 = v108[0];
    v71 = v109;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v108[0] = v71;
    v109 = 0x8000000000000000;
    v74 = sub_2384C17C4(v58, v12);
    v75 = *(_QWORD *)(v71 + 16);
    v76 = (v73 & 1) == 0;
    v77 = v75 + v76;
    if (__OFADD__(v75, v76))
      goto LABEL_110;
    v78 = v73;
    if (*(_QWORD *)(v71 + 24) >= v77)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v81 = (_QWORD *)v108[0];
        if ((v73 & 1) == 0)
          goto LABEL_90;
      }
      else
      {
        sub_2384C1F54();
        v81 = (_QWORD *)v108[0];
        if ((v78 & 1) == 0)
          goto LABEL_90;
      }
    }
    else
    {
      sub_2384C1A9C(v77, isUniquelyReferenced_nonNull_native);
      v79 = sub_2384C17C4(v58, v12);
      if ((v78 & 1) != (v80 & 1))
        goto LABEL_126;
      v74 = v79;
      v81 = (_QWORD *)v108[0];
      if ((v78 & 1) == 0)
      {
LABEL_90:
        v81[(v74 >> 6) + 8] |= 1 << v74;
        v83 = (uint64_t *)(v81[6] + 16 * v74);
        *v83 = v58;
        v83[1] = v12;
        *(_QWORD *)(v81[7] + 8 * v74) = v70;
        v84 = v81[2];
        v19 = __OFADD__(v84, 1);
        v85 = v84 + 1;
        if (v19)
          goto LABEL_114;
        v81[2] = v85;
        swift_bridgeObjectRetain();
        goto LABEL_92;
      }
    }
    v82 = v81[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v82 + 8 * v74) = v70;
LABEL_92:
    v109 = (unint64_t)v81;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_93:
    v17 = &off_250A31000;
    v23 = v104;
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  v69 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  if (v69)
    goto LABEL_52;
LABEL_102:
  swift_bridgeObjectRelease();
  sub_2384C2E74((uint64_t)&v111);
  swift_bridgeObjectRelease();
  v87 = sub_2384C78FC();
  v88 = v94;
  (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v99, v87, v94);
  v89 = sub_2384DF9AC();
  v90 = sub_2384DFB38();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v91 = 0;
    _os_log_impl(&dword_2384B0000, v89, v90, "Ran out of action suggestions while assigning suggestions widgets", v91, 2u);
    MEMORY[0x23B836F18](v91, -1, -1);
    swift_release();

  }
  else
  {

    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v88);
  return v109;
}

uint64_t sub_2384BD020(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2384BD050()
{
  unint64_t result;

  result = qword_256912A00;
  if (!qword_256912A00)
  {
    result = MEMORY[0x23B836E94](&unk_2384E127C, &type metadata for WidgetStackSuggestionGenerator.Location);
    atomic_store(result, (unint64_t *)&qword_256912A00);
  }
  return result;
}

unint64_t sub_2384BD098()
{
  unint64_t result;

  result = qword_256912A08;
  if (!qword_256912A08)
  {
    result = MEMORY[0x23B836E94](&unk_2384E132C, &type metadata for WidgetStackSuggestionGenerator.SmartRotateFailure);
    atomic_store(result, (unint64_t *)&qword_256912A08);
  }
  return result;
}

double sub_2384BD0DC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double result;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v2 = sub_2384DF9B8();
  MEMORY[0x24BDAC7A8](v2);
  sub_2384DFA30();
  v3 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v4 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithSuiteName_, v4);

  if (v5)
  {
    sub_2384CD9DC();
    swift_bridgeObjectRetain();
    v6 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v5, sel_dataForKey_, v6);

    if (v7)
    {
      v8 = sub_2384DF910();
      v10 = v9;

      sub_2384DF88C();
      swift_allocObject();
      sub_2384DF880();
      sub_2384C32E0();
      sub_2384DF874();
      swift_release();

      sub_2384C3324(v8, v10);
      result = *(double *)&v12;
      *(_OWORD *)a1 = v12;
      *(_OWORD *)(a1 + 16) = v13;
      *(_QWORD *)(a1 + 32) = v14;
      *(_QWORD *)(a1 + 40) = v15;
      *(_BYTE *)(a1 + 48) = v16;
      return result;
    }

  }
  *(_BYTE *)(a1 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

NSObject *sub_2384BD46C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD *v33;
  uint8_t *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  char *v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  _OWORD v49[3];
  char v50;

  v3 = sub_2384DF9B8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v42 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v42 - v11;
  v13 = *(_OWORD *)(a1 + 16);
  v49[0] = *(_OWORD *)a1;
  v49[1] = v13;
  v49[2] = *(_OWORD *)(a1 + 32);
  v50 = *(_BYTE *)(a1 + 48);
  v14 = *v1;
  swift_bridgeObjectRetain();
  sub_2384C31F0((uint64_t)v49);
  v15 = sub_2384C28E4(v14, (uint64_t)v49);
  sub_2384C3238((uint64_t)v49);
  swift_bridgeObjectRelease();
  if (!v15)
  {
    v35 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v35, v3);
    v36 = sub_2384DF9AC();
    v37 = sub_2384DFB38();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_2384B0000, v36, v37, "Debug rotation didn't refer to an existing stack", v38, 2u);
      MEMORY[0x23B836F18](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return MEMORY[0x24BEE4AF8];
  }
  v16 = *(id *)(v15 + 16);
  v17 = objc_msgSend(v16, sel_widgets);
  sub_2384C071C();
  v18 = sub_2384DFA90();

  sub_2384C31F0((uint64_t)v49);
  v19 = sub_2384C2664(v18, (uint64_t *)v49);
  sub_2384C3238((uint64_t)v49);
  swift_bridgeObjectRelease();
  if (!v19 && (v50 & 1) == 0)
  {
    v20 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v20, v3);
    v21 = sub_2384DF9AC();
    v22 = sub_2384DFB38();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2384B0000, v21, v22, "Debug rotation didn't refer to an existing widget, and debug rotation doesn't allow for new widget suggestions", v23, 2u);
      MEMORY[0x23B836F18](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
    swift_release();

    return MEMORY[0x24BEE4AF8];
  }
  v24 = sub_2384C0758(v19, v16);
  v25 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, v25, v3);
  v26 = v24;
  v27 = sub_2384DF9AC();
  v28 = sub_2384DFB44();
  if (os_log_type_enabled(v27, v28))
  {
    v45 = v12;
    v29 = swift_slowAlloc();
    v46 = v16;
    v30 = (uint8_t *)v29;
    v43 = (_QWORD *)swift_slowAlloc();
    v47 = v4;
    v48 = v26;
    *(_DWORD *)v30 = 138412290;
    v31 = v26;
    v44 = v19;
    v32 = v31;
    v12 = v45;
    v4 = v47;
    sub_2384DFC04();
    v33 = v43;
    *v43 = v26;

    v19 = v44;
    _os_log_impl(&dword_2384B0000, v27, v28, "Applying ambient debug rotation suggestion: %@", v30, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v33, -1, -1);
    v34 = v30;
    v16 = v46;
    MEMORY[0x23B836F18](v34, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A40);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_2384E1240;
  *(_QWORD *)(v40 + 32) = v26;
  v48 = v40;
  sub_2384DFAA8();
  v39 = v48;
  swift_release();

  return v39;
}

void sub_2384BD8FC(char *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  os_log_t isa;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  BOOL v29;
  BOOL v30;
  char *v31;
  void *v32;
  id v33;
  uint64_t v34;
  objc_class *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  unsigned __int8 v57;
  void *v58;
  __int128 v59;
  void *v60;
  id v61;
  int v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  objc_class *v73;
  char *v74;
  _BYTE *v75;
  uint64_t v76;
  os_log_t v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  os_log_t v89;
  os_log_t v90;
  void *v91;
  uint64_t v92;
  os_log_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  char *v104;
  _QWORD *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  uint64_t *v112;
  _BYTE *v113;
  __int128 v114;
  uint64_t v115;
  objc_class *v116;
  os_log_t v117;
  unint64_t v118;
  os_log_t v119;
  void *v120;
  os_log_t v121;
  NSObject *v122;
  char *v123;
  void *v124;
  char *v125;
  uint64_t v126;
  _QWORD *v127;
  void *v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[8];
  id v133[4];
  unint64_t v134;

  v3 = v2;
  v5 = sub_2384DF9B8();
  isa = *(os_log_t *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v109 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t)&v109 - v13;
  v15 = *(void **)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification];
  v123 = v9;
  v125 = v12;
  if (v15)
  {
    v16 = objc_msgSend(v15, sel_clientModelId);
    v12 = (char *)sub_2384DFA30();
    v18 = v17;

    v19 = *(void **)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification];
    if (v19)
    {
      v20 = v19;
      if ((uint64_t)objc_msgSend(v20, sel_suggestedConfidenceCategory) <= 2)
      {
        swift_bridgeObjectRelease();
        sub_2384BD098();
        v21 = swift_allocError();
        *(_QWORD *)v22 = 2;
        *(_BYTE *)(v22 + 8) = 1;
        swift_willThrow();

        v23 = v21;
        v9 = v123;
        v12 = v125;
        if (v21)
          return;
        goto LABEL_18;
      }

    }
    if (qword_2569138F0 != -1)
      goto LABEL_94;
    goto LABEL_10;
  }
  sub_2384BD098();
  v24 = swift_allocError();
  *(_QWORD *)v25 = 0;
  *(_BYTE *)(v25 + 8) = 1;
  swift_willThrow();
  v23 = v24;
  if (v24)
    return;
LABEL_18:
  while (2)
  {
    v1 = *(_QWORD *)v1;
    v134 = v1;
    v3 = v1 & 0xFFFFFFFFFFFFFF8;
    v118 = v5;
    v121 = isa;
    v109 = v14;
    v124 = (void *)v23;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_2384DFD3C();
      if (v18)
        goto LABEL_20;
LABEL_96:
      sub_2384C2E74((uint64_t)&v134);
      sub_2384BD098();
      swift_allocError();
      *(_QWORD *)v108 = 3;
      *(_BYTE *)(v108 + 8) = 1;
      swift_willThrow();
      return;
    }
    v18 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v18)
      goto LABEL_96;
LABEL_20:
    v5 = 0;
    v128 = (void *)(v1 & 0xC000000000000001);
    v116 = (objc_class *)a1;
    v117 = (os_log_t)(v1 + 32);
    v122 = v1;
    v126 = v18;
    v115 = v1 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if (v128)
      {
        isa = (os_log_t)MEMORY[0x23B8366E4](v5, v1);
        v30 = __OFADD__(v5++, 1);
        if (v30)
          break;
        goto LABEL_29;
      }
      if (v5 >= *(_QWORD *)(v3 + 16))
        goto LABEL_93;
      isa = (os_log_t)v117[v5].isa;
      swift_retain();
      v30 = __OFADD__(v5++, 1);
      if (v30)
        break;
LABEL_29:
      if (isa[4].isa)
      {
        swift_release();
      }
      else
      {
        v31 = (char *)-[objc_class topWidgetIdentifier](isa[2].isa, sel_topWidgetIdentifier);
        if (v31)
        {
          v12 = v31;
          v18 = sub_2384DFA30();
          v129 = v32;

          v119 = isa;
          v33 = -[objc_class widgets](isa[2].isa, sel_widgets);
          sub_2384C071C();
          v1 = sub_2384DFA90();

          if (v1 >> 62)
          {
            swift_bridgeObjectRetain();
            v34 = sub_2384DFD3C();
            v120 = (void *)v5;
            if (v34)
            {
LABEL_33:
              v127 = (_QWORD *)(v1 & 0xC000000000000001);
              v5 = 4;
              do
              {
                v3 = v5 - 4;
                if (v127)
                {
                  v35 = (objc_class *)MEMORY[0x23B8366E4](v5 - 4, v1);
                  isa = (os_log_t)(v5 - 3);
                  if (__OFADD__(v3, 1))
                    goto LABEL_90;
                }
                else
                {
                  v35 = (objc_class *)*(id *)(v1 + 8 * v5);
                  isa = (os_log_t)(v5 - 3);
                  if (__OFADD__(v3, 1))
                  {
LABEL_90:
                    __break(1u);
                    goto LABEL_91;
                  }
                }
                v12 = (char *)v35;
                v36 = -[objc_class identifier](v35, sel_identifier, v109, v110);
                a1 = (char *)sub_2384DFA30();
                v38 = v37;

                if (a1 == (char *)v18 && v38 == v129)
                {
                  swift_bridgeObjectRelease();
LABEL_48:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a1 = (char *)v116;
                  v41 = *(NSObject **)((char *)v116
                                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
                  v40 = *(_QWORD *)((char *)v116
                                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                                  + 8);
                  v42 = objc_msgSend(v12, sel_chsWidget);
                  v14 = (uint64_t)objc_msgSend(v42, sel_extensionIdentity);

                  swift_beginAccess();
                  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
                  isa = (os_log_t)sub_2384DF9A0();
                  v44 = v43;
                  swift_endAccess();

                  v3 = v115;
                  v5 = (unint64_t)v120;
                  if (v41 == isa && v40 == v44)
                  {
                    swift_bridgeObjectRelease();
                    v45 = v12;
LABEL_52:
                    v48 = *(NSObject **)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind];
                    v47 = *(_QWORD *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind
                                       + 8];
                    v49 = objc_msgSend(v45, sel_chsWidget);
                    v14 = (uint64_t)objc_msgSend(v49, sel_kind);

                    isa = (os_log_t)sub_2384DFA30();
                    v51 = v50;

                    if (v48 == isa && v47 == v51)
                    {
                      swift_bridgeObjectRelease();
                      v45 = v12;
LABEL_56:
                      v53 = objc_msgSend(v45, sel_chsWidget);
                      v54 = objc_msgSend(v53, sel_intentReference);

                      if (v54)
                      {
                        v55 = objc_msgSend(v54, sel_intent);

                        if (v55)
                        {
                          v56 = *(_QWORD *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent];
                          if (v56)
                          {
                            v57 = objc_msgSend((id)objc_opt_self(), sel_intent_isEqualToIntent_, v55, v56);

                            if ((v57 & 1) == 0)
                              goto LABEL_60;
                          }
                          else
                          {

                          }
                        }
                      }
                      v58 = v124;
                      sub_2384B9838(a1);
                      if (v58)
                      {
                        sub_2384C2E74((uint64_t)&v134);
                        swift_release();

                        return;
                      }
                      v124 = 0;

LABEL_64:
                      swift_release();
                      v1 = (unint64_t)v122;
                      v9 = v123;
                      v12 = v125;
                      v18 = v126;
                      goto LABEL_22;
                    }
                    v52 = sub_2384DFDD8();
                    swift_bridgeObjectRelease();
                    v45 = v12;
                    if ((v52 & 1) != 0)
                      goto LABEL_56;
                  }
                  else
                  {
                    v46 = sub_2384DFDD8();
                    swift_bridgeObjectRelease();
                    v45 = v12;
                    if ((v46 & 1) != 0)
                      goto LABEL_52;
                  }
LABEL_60:

                  goto LABEL_64;
                }
                v14 = sub_2384DFDD8();
                swift_bridgeObjectRelease();
                if ((v14 & 1) != 0)
                  goto LABEL_48;

                ++v5;
              }
              while (isa != (os_log_t)v34);
            }
          }
          else
          {
            v34 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            v120 = (void *)v5;
            if (v34)
              goto LABEL_33;
          }
          swift_bridgeObjectRelease_n();
          swift_release();
          swift_bridgeObjectRelease();
          v3 = v115;
          a1 = (char *)v116;
          v1 = (unint64_t)v122;
          v9 = v123;
          v12 = v125;
          v18 = v126;
          v5 = (unint64_t)v120;
        }
        else
        {
          swift_release();
          v12 = v125;
        }
      }
LABEL_22:
      if (v5 == v18)
      {
        sub_2384C2E74((uint64_t)&v134);
        v113 = v132;
        v112 = &v131;
        swift_bridgeObjectRetain();
        v14 = 4;
        *(_QWORD *)&v59 = 136315650;
        v111 = v59;
        v110 = MEMORY[0x24BEE4AD8] + 8;
        *(_QWORD *)&v59 = 136315394;
        v114 = v59;
        while (1)
        {
          v18 = v14 - 4;
          if (v128)
          {
            v5 = MEMORY[0x23B8366E4](v14 - 4, v1);
            v3 = v14 - 3;
            if (__OFADD__(v18, 1))
              goto LABEL_92;
          }
          else
          {
            v5 = *(_QWORD *)(v1 + 8 * v14);
            swift_retain();
            v3 = v14 - 3;
            if (__OFADD__(v18, 1))
              goto LABEL_92;
          }
          if (*(_QWORD *)(v5 + 32))
          {
            swift_release();
          }
          else
          {
            v60 = v124;
            sub_2384B9838(a1);
            if (!v60)
            {
              v129 = 0;
              sub_2384C2E74((uint64_t)&v134);
              v92 = sub_2384C78FC();
              v93 = v121;
              v94 = v109;
              v95 = v118;
              ((void (*)(uint64_t, uint64_t, unint64_t))v121[2].isa)(v109, v92, v118);
              swift_retain_n();
              v96 = a1;
              v97 = sub_2384DF9AC();
              v98 = sub_2384DFB44();
              if (os_log_type_enabled(v97, v98))
              {
                v99 = swift_slowAlloc();
                v127 = (_QWORD *)swift_slowAlloc();
                v128 = (void *)swift_slowAlloc();
                v133[0] = v128;
                *(_DWORD *)v99 = v114;
                v126 = v99 + 4;
                v100 = objc_msgSend(*(id *)(v5 + 16), sel_identifier);
                v101 = sub_2384DFA30();
                v103 = v102;

                v131 = sub_2384C1184(v101, v103, (uint64_t *)v133);
                sub_2384DFC04();
                swift_release_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v99 + 12) = 2112;
                v131 = (uint64_t)v96;
                v104 = v96;
                sub_2384DFC04();
                v105 = v127;
                *v127 = v116;

                _os_log_impl(&dword_2384B0000, v97, v98, "Stack <%s> successfully smart rotated to %@", (uint8_t *)v99, 0x16u);
                __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
                swift_arrayDestroy();
                MEMORY[0x23B836F18](v105, -1, -1);
                v106 = v128;
                swift_arrayDestroy();
                MEMORY[0x23B836F18](v106, -1, -1);
                MEMORY[0x23B836F18](v99, -1, -1);
                swift_release();

                ((void (*)(uint64_t, unint64_t))v121[1].isa)(v94, v118);
              }
              else
              {

                swift_release_n();
                ((void (*)(uint64_t, unint64_t))v93[1].isa)(v94, v95);
              }
              return;
            }
            v133[0] = v60;
            v61 = v60;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256912978);
            v62 = swift_dynamicCast();
            v124 = 0;
            if (v62)
            {

              LODWORD(v129) = v132[7];
              v63 = sub_2384C78FC();
              isa = v121;
              v64 = v118;
              ((void (*)(char *, uint64_t, unint64_t))v121[2].isa)(v12, v63, v118);
              swift_retain_n();
              v65 = a1;
              v66 = sub_2384DF9AC();
              v67 = sub_2384DFB44();
              LODWORD(v127) = v67;
              if (os_log_type_enabled(v66, v67))
              {
                v68 = swift_slowAlloc();
                v117 = (os_log_t)swift_slowAlloc();
                v120 = (void *)swift_slowAlloc();
                v131 = (uint64_t)v120;
                *(_DWORD *)v68 = v111;
                v119 = v66;
                v115 = v68 + 4;
                v69 = objc_msgSend(*(id *)(v5 + 16), sel_identifier);
                v70 = sub_2384DFA30();
                v72 = v71;

                v73 = v116;
                v130 = sub_2384C1184(v70, v72, &v131);
                sub_2384DFC04();
                swift_release_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v68 + 12) = 2112;
                v130 = (uint64_t)v65;
                v74 = v65;
                sub_2384DFC04();
                isa = v117;
                v117->isa = v73;

                *(_WORD *)(v68 + 22) = 2112;
                sub_2384C2E30();
                swift_allocError();
                *v75 = (_BYTE)v129;
                v76 = _swift_stdlib_bridgeErrorToNSError();
                v130 = v76;
                a1 = (char *)v73;
                v12 = v125;
                sub_2384DFC04();
                isa[1].isa = (Class)v76;
                v77 = v119;
                _os_log_impl(&dword_2384B0000, v119, (os_log_type_t)v127, "Stack %s could not smart rotate to %@: %@", (uint8_t *)v68, 0x20u);
                __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
                swift_arrayDestroy();
                MEMORY[0x23B836F18](isa, -1, -1);
                v78 = v120;
                swift_arrayDestroy();
                MEMORY[0x23B836F18](v78, -1, -1);
                MEMORY[0x23B836F18](v68, -1, -1);
                swift_release();

                ((void (*)(char *, unint64_t))v121[1].isa)(v12, v118);
              }
              else
              {

                swift_release_n();
                ((void (*)(char *, unint64_t))isa[1].isa)(v12, v64);
              }

              v1 = (unint64_t)v122;
              v9 = v123;
            }
            else
            {
              v129 = v60;

              v79 = sub_2384C78FC();
              v80 = v118;
              ((void (*)(char *, uint64_t, unint64_t))v121[2].isa)(v9, v79, v118);
              swift_retain_n();
              isa = a1;
              v81 = sub_2384DF9AC();
              v82 = sub_2384DFB38();
              LODWORD(v127) = v82;
              if (os_log_type_enabled(v81, v82))
              {
                v83 = swift_slowAlloc();
                v119 = (os_log_t)swift_slowAlloc();
                v120 = (void *)swift_slowAlloc();
                v133[0] = v120;
                *(_DWORD *)v83 = v114;
                v115 = v83 + 4;
                v84 = objc_msgSend(*(id *)(v5 + 16), sel_identifier);
                v85 = sub_2384DFA30();
                v117 = v81;
                v86 = v85;
                v88 = v87;

                v131 = sub_2384C1184(v86, v88, (uint64_t *)v133);
                sub_2384DFC04();
                swift_release_n();
                a1 = (char *)v116;
                swift_bridgeObjectRelease();
                *(_WORD *)(v83 + 12) = 2112;
                v131 = (uint64_t)isa;
                isa = isa;
                v12 = v125;
                sub_2384DFC04();
                v89 = v119;
                v119->isa = (Class)a1;

                v90 = v117;
                _os_log_impl(&dword_2384B0000, v117, (os_log_type_t)v127, "Stack %s could not smart rotate to %@: unexpected failure", (uint8_t *)v83, 0x16u);
                __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
                swift_arrayDestroy();
                MEMORY[0x23B836F18](v89, -1, -1);
                v91 = v120;
                swift_arrayDestroy();
                MEMORY[0x23B836F18](v91, -1, -1);
                MEMORY[0x23B836F18](v83, -1, -1);

                swift_release();
                v9 = v123;
                ((void (*)(char *, unint64_t))v121[1].isa)(v123, v118);
              }
              else
              {

                swift_release_n();
                ((void (*)(char *, unint64_t))v121[1].isa)(v9, v80);
              }
              v1 = (unint64_t)v122;
            }
          }
          ++v14;
          if (v3 == v126)
            goto LABEL_96;
        }
      }
    }
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    swift_once();
LABEL_10:
    if ((sub_2384BFF8C((uint64_t)v12, v18, (_QWORD *)qword_2569138F8) & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v9 = v123;
      v12 = v125;
    }
    else
    {
      v26 = (void *)objc_opt_self();
      v27 = (void *)sub_2384DFA18();
      swift_bridgeObjectRelease();
      v28 = (unint64_t)objc_msgSend(v26, sel_clientModelTypeFromClientModelId_, v27);

      v29 = v28 > 0x14 || ((1 << v28) & 0x1C1114) == 0;
      v9 = v123;
      v12 = v125;
      if (v29)
      {
        sub_2384BD098();
        v3 = swift_allocError();
        *(_QWORD *)v107 = v28;
        *(_BYTE *)(v107 + 8) = 0;
        swift_willThrow();
      }
    }
    v23 = v3;
    if (!v3)
      continue;
    break;
  }
}

uint64_t sub_2384BE9E8(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char *v22;
  unint64_t v23;
  __int128 v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  char *v41;
  id v42;
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  char v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  unsigned __int8 v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  unint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  id v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  uint64_t *v93;
  uint64_t v94;
  unint64_t v95;
  __int128 v96;
  uint64_t *v97;
  unint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  unint64_t *v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  unint64_t v119;
  uint64_t v120;
  char *v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  v125 = (char *)a1;
  v2 = sub_2384DF9B8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v92 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (unint64_t)&v92 - v10;
  v112 = v1;
  v127 = *v1;
  v12 = v127;
  if (v127 >> 62)
    goto LABEL_86;
  v13 = *(_QWORD *)((v127 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v13)
  {
LABEL_3:
    v15 = 0;
    v119 = v12 & 0xC000000000000001;
    v109 = v12 + 32;
    v97 = &v130;
    v93 = &v126;
    *(_QWORD *)&v14 = 136315394;
    v96 = v14;
    v94 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v14 = 136315650;
    v92 = v14;
    v108 = v2;
    v107 = v3;
    v113 = v11;
    v114 = v6;
    v111 = v9;
    v106 = v12;
    v105 = v13;
    while (1)
    {
      if (v119)
      {
        v16 = MEMORY[0x23B8366E4](v15, v12);
        v17 = __OFADD__(v15++, 1);
        if (v17)
        {
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
LABEL_86:
          swift_bridgeObjectRetain();
          v13 = sub_2384DFD3C();
          if (!v13)
            goto LABEL_87;
          goto LABEL_3;
        }
      }
      else
      {
        v16 = *(_QWORD *)(v109 + 8 * v15);
        swift_retain();
        v17 = __OFADD__(v15++, 1);
        if (v17)
          goto LABEL_84;
      }
      if (!*(_QWORD *)(v16 + 32))
        break;
      swift_release();
LABEL_5:
      if (v15 == v13)
        goto LABEL_87;
    }
    v18 = *(void **)&v125[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification];
    v124 = v15;
    if (!v18)
    {
      sub_2384BD098();
      v32 = swift_allocError();
      *(_QWORD *)v34 = 0;
      *(_BYTE *)(v34 + 8) = 1;
      swift_willThrow();
      goto LABEL_77;
    }
    v19 = objc_msgSend(v18, sel_clientModelId, (_QWORD)v92, *((_QWORD *)&v92 + 1));
    sub_2384DFA30();

    v20 = (void *)objc_opt_self();
    v21 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
    v22 = (char *)objc_msgSend(v20, sel_clientModelTypeFromClientModelId_, v21);

    *((_QWORD *)&v24 + 1) = v22;
    *(_QWORD *)&v24 = v22 - 2;
    v23 = v24 >> 1;
    v25 = v23 > 9;
    v26 = (1 << v23) & 0x32B;
    if (v25 || v26 == 0)
    {
      sub_2384BFF48();
      v32 = swift_allocError();
      *(_QWORD *)v67 = v22;
      *(_BYTE *)(v67 + 8) = 0;
      swift_willThrow();
      v11 = v113;
      goto LABEL_77;
    }
    v28 = (uint64_t)v125;
    v29 = *(void **)&v125[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification];
    if (v29)
    {
      v30 = v29;
      if ((uint64_t)objc_msgSend(v30, sel_suggestedConfidenceCategory) <= 2)
      {
        sub_2384BFF48();
        v32 = swift_allocError();
        v33 = 3;
LABEL_20:
        *(_QWORD *)v31 = v33;
        *(_BYTE *)(v31 + 8) = 1;
        swift_willThrow();

        v11 = v113;
        goto LABEL_77;
      }

    }
    v11 = *v112;
    v129 = v11;
    v102 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_2384DFD3C();
      v12 = result;
      if (result)
      {
LABEL_25:
        v36 = 0;
        v101 = (uint64_t *)(v28
                         + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
        v118 = (uint64_t *)(v28 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
        v117 = OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent;
        v37 = v11 & 0xC000000000000001;
        v95 = v11 + 32;
        v115 = v16;
        v100 = v11;
        v99 = (char *)v12;
        v98 = v11 & 0xC000000000000001;
        while (1)
        {
          if (v37)
          {
            v38 = MEMORY[0x23B8366E4](v36, v11);
            v17 = __OFADD__(v36, 1);
            v6 = v36 + 1;
            if (v17)
              goto LABEL_85;
          }
          else
          {
            if ((unint64_t)v36 >= *(_QWORD *)(v102 + 16))
            {
              __break(1u);
              return result;
            }
            v38 = swift_retain();
            v17 = __OFADD__(v36, 1);
            v6 = v36 + 1;
            if (v17)
              goto LABEL_85;
          }
          v110 = v38;
          v39 = objc_msgSend(*(id *)(v38 + 16), sel_widgets);
          v40 = sub_2384C071C();
          v2 = sub_2384DFA90();

          if (v2 >> 62)
          {
            swift_bridgeObjectRetain();
            v11 = sub_2384DFD3C();
            swift_bridgeObjectRelease();
          }
          else
          {
            v11 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          v104 = v6;
          v103 = v40;
          if (v11)
            break;
LABEL_57:
          swift_bridgeObjectRelease();
          v62 = *(void **)(v110 + 32);
          v28 = (uint64_t)v125;
          v2 = v108;
          v3 = v107;
          v16 = v115;
          v9 = v111;
          if (v62)
          {
            v63 = v62;
            v64 = objc_msgSend(v63, sel_suggestedWidgets);
            sub_2384C2DE8();
            v65 = sub_2384DFB14();

            if ((v65 & 0xC000000000000001) != 0)
              v66 = sub_2384DFC40();
            else
              v66 = *(_QWORD *)(v65 + 16);
            swift_bridgeObjectRelease();
            if (v66)
            {
              sub_2384C2E74((uint64_t)&v129);
              sub_2384BFF48();
              v32 = swift_allocError();
              *(_QWORD *)v69 = 1;
              *(_BYTE *)(v69 + 8) = 1;
              swift_willThrow();

              swift_release();
              v11 = v113;
              goto LABEL_77;
            }

            v28 = (uint64_t)v125;
          }
          result = swift_release();
          v12 = (uint64_t)v99;
          v36 = v104;
          v11 = v100;
          v37 = v98;
          if (v104 == v99)
            goto LABEL_71;
        }
        v12 = *v101;
        v122 = (_QWORD *)v101[1];
        v123 = v2 & 0xC000000000000001;
        v3 = 4;
        v120 = v12;
        v121 = (char *)v11;
        while (1)
        {
          if (v123)
            v41 = (char *)MEMORY[0x23B8366E4](v3 - 4, v2);
          else
            v41 = (char *)*(id *)(v2 + 8 * v3);
          v6 = v41;
          v9 = (char *)(v3 - 3);
          if (__OFADD__(v3 - 4, 1))
          {
            __break(1u);
            goto LABEL_84;
          }
          v11 = v2;
          v42 = objc_msgSend(v41, sel_chsWidget);
          v43 = objc_msgSend(v42, sel_extensionIdentity);

          swift_beginAccess();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
          v44 = sub_2384DF9A0();
          v46 = v45;
          swift_endAccess();

          if (v12 == v44 && v122 == v46)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v48 = sub_2384DFDD8();
            swift_bridgeObjectRelease();
            if ((v48 & 1) == 0)
              goto LABEL_36;
          }
          v50 = *v118;
          v49 = v118[1];
          v51 = objc_msgSend(v6, sel_chsWidget);
          v52 = objc_msgSend(v51, sel_kind);

          v53 = sub_2384DFA30();
          v55 = v54;

          if (v50 == v53 && v49 == v55)
          {
            swift_bridgeObjectRelease();
            v15 = v124;
          }
          else
          {
            v56 = sub_2384DFDD8();
            swift_bridgeObjectRelease();
            v15 = v124;
            if ((v56 & 1) == 0)
              goto LABEL_36;
          }
          v57 = objc_msgSend(v6, sel_chsWidget);
          v58 = objc_msgSend(v57, sel_intentReference);

          if (!v58)
            goto LABEL_68;
          v59 = objc_msgSend(v58, sel_intent);

          if (!v59)
            goto LABEL_68;
          v60 = *(_QWORD *)&v125[v117];
          if (!v60)
          {

LABEL_68:
            swift_bridgeObjectRelease();
            sub_2384C2E74((uint64_t)&v129);
            sub_2384BFF48();
            v32 = swift_allocError();
            *(_QWORD *)v68 = 0;
            *(_BYTE *)(v68 + 8) = 1;
            swift_willThrow();
            swift_release();

            v2 = v108;
            v3 = v107;
            v11 = v113;
            v16 = v115;
            goto LABEL_77;
          }
          v61 = objc_msgSend((id)objc_opt_self(), sel_intent_isEqualToIntent_, v59, v60);

          if ((v61 & 1) != 0)
            goto LABEL_68;
LABEL_36:

          ++v3;
          v12 = v120;
          v2 = v11;
          if (v9 == v121)
            goto LABEL_57;
        }
      }
    }
    else
    {
      v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v12)
        goto LABEL_25;
    }
LABEL_71:
    sub_2384C2E74((uint64_t)&v129);
    v70 = *(_QWORD *)(v28
                    + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier
                    + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v71 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
    if (v70)
    {
      v72 = (void *)sub_2384DFA18();
      swift_bridgeObjectRelease();
    }
    else
    {
      v72 = 0;
    }
    v30 = objc_msgSend(objc_allocWithZone((Class)ATXWidgetLocationAuthorizationTracker), sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_, v71, v72);

    if (objc_msgSend(v30, sel_widgetWantsLocation)
      && (objc_msgSend(v30, sel_isContainerAuthorizedForWidgetUpdates) & 1) == 0)
    {
      sub_2384BFF48();
      v32 = swift_allocError();
      v33 = 5;
      goto LABEL_20;
    }

    v11 = v113;
    v32 = v116;
LABEL_77:
    if (!v32)
    {
      v73 = v3;
      v74 = v2;
      v75 = v125;
      sub_2384B9AA0((uint64_t)v125, (void *)v112[4]);
      v116 = 0;
      v76 = sub_2384C78FC();
      (*(void (**)(unint64_t, uint64_t, unint64_t))(v73 + 16))(v11, v76, v74);
      swift_retain_n();
      v77 = v75;
      v78 = v11;
      v79 = sub_2384DF9AC();
      v80 = sub_2384DFB44();
      if (os_log_type_enabled(v79, v80))
      {
        v81 = swift_slowAlloc();
        v122 = (_QWORD *)swift_slowAlloc();
        v123 = swift_slowAlloc();
        v128 = v123;
        *(_DWORD *)v81 = v96;
        v82 = objc_msgSend(*(id *)(v16 + 16), sel_identifier);
        v115 = v16;
        v83 = v82;
        v84 = sub_2384DFA30();
        v86 = v85;

        v87 = v84;
        v15 = v124;
        v129 = sub_2384C1184(v87, v86, &v128);
        sub_2384DFC04();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v81 + 12) = 2112;
        v129 = (uint64_t)v77;
        v88 = v77;
        v12 = v106;
        v2 = v108;
        sub_2384DFC04();
        v89 = v122;
        *v122 = v125;

        _os_log_impl(&dword_2384B0000, v79, v80, "Stack <%s> successfully suggested new widget with: %@", (uint8_t *)v81, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
        swift_arrayDestroy();
        v3 = v107;
        MEMORY[0x23B836F18](v89, -1, -1);
        v90 = v123;
        swift_arrayDestroy();
        MEMORY[0x23B836F18](v90, -1, -1);
        MEMORY[0x23B836F18](v81, -1, -1);
        swift_release();

        v11 = v113;
        (*(void (**)(unint64_t, unint64_t))(v3 + 8))(v113, v2);
        v6 = v114;
        v9 = v111;
        v13 = v105;
      }
      else
      {

        swift_release_n();
        (*(void (**)(unint64_t, unint64_t))(v73 + 8))(v78, v74);
        v6 = v114;
        v9 = v111;
        v11 = v78;
        v13 = v105;
        v2 = v74;
        v3 = v73;
        v12 = v106;
      }
      goto LABEL_5;
    }
    sub_2384C2E74((uint64_t)&v127);
    return swift_release();
  }
  else
  {
LABEL_87:
    sub_2384C2E74((uint64_t)&v127);
    sub_2384BFF48();
    swift_allocError();
    *(_QWORD *)v91 = 4;
    *(_BYTE *)(v91 + 8) = 1;
    return swift_willThrow();
  }
}

unint64_t sub_2384BFD88(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A58);
  v2 = (_QWORD *)sub_2384DFD60();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2384C17C4(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void (*sub_2384BFEA0(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_2384C1828(v6, a2, a3);
  return sub_2384BFF0C;
}

void sub_2384BFF0C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

unint64_t sub_2384BFF48()
{
  unint64_t result;

  result = qword_256912A10;
  if (!qword_256912A10)
  {
    result = MEMORY[0x23B836E94](&unk_2384E13B4, &type metadata for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure);
    atomic_store(result, (unint64_t *)&qword_256912A10);
  }
  return result;
}

uint64_t sub_2384BFF8C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_2384DFDD8();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2384DFDD8() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for WidgetStackSuggestionGenerator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for WidgetStackSuggestionGenerator(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

}

uint64_t initializeWithCopy for WidgetStackSuggestionGenerator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v8 = *(void **)(a2 + 32);
  v9 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = v8;
  v11 = v9;
  return a1;
}

uint64_t assignWithCopy for WidgetStackSuggestionGenerator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v4)
  {
    sub_2384C0268(a1 + 16);
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  v5 = *(void **)(a2 + 32);
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  v7 = v5;

  v8 = *(void **)(a2 + 40);
  v9 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  v10 = v8;

  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t sub_2384C0268(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WidgetStackSuggestionGenerator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_5;
  if (!v4)
  {
    sub_2384C0268(a1 + 16);
LABEL_5:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
LABEL_6:
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator()
{
  return &type metadata for WidgetStackSuggestionGenerator;
}

uint64_t destroy for WidgetStackSuggestionGenerator.Result()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s26ContextualSuggestionClient30WidgetStackSuggestionGeneratorV6ResultVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WidgetStackSuggestionGenerator.Result(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for WidgetStackSuggestionGenerator.Result(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator.Result(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator.Result(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.Result()
{
  return &type metadata for WidgetStackSuggestionGenerator.Result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.Location()
{
  return &type metadata for WidgetStackSuggestionGenerator.Location;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.SmartRotateFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.SmartRotateFailure;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_2384C0638(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2384C0654(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.NewWidgetSuggestionFailure;
}

void type metadata accessor for ATXProactiveSuggestionClientModelType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256912A18)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256912A18);
  }
}

unint64_t sub_2384C06D8()
{
  unint64_t result;

  result = qword_256913C00;
  if (!qword_256913C00)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1620, &type metadata for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure);
    atomic_store(result, (unint64_t *)&qword_256913C00);
  }
  return result;
}

unint64_t sub_2384C071C()
{
  unint64_t result;

  result = qword_256912A30;
  if (!qword_256912A30)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256912A30);
  }
  return result;
}

id sub_2384C0758(void *a1, void *a2)
{
  uint8_t *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint8_t *);
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD *v25;
  NSObject *v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  _QWORD *v43;
  NSObject *v44;
  char *v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  _QWORD *v50;
  NSObject *v51;
  NSObject *v52;
  uint8_t *v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  void *v60;
  NSObject *v61;
  uint64_t inited;
  unint64_t v63;
  uint64_t v64;
  NSObject *v65;
  id v66;
  void *v67;
  id v68;
  NSObject *v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v77;
  uint8_t *v78;
  char *v79;
  uint8_t *v80;
  id v81;
  unint64_t v82;

  v81 = a2;
  v3 = (uint8_t *)sub_2384DF9B8();
  v4 = (char *)*((_QWORD *)v3 - 1);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v77 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v77 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A20);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
  MEMORY[0x24BDAC7A8](v16);
  if (a1)
  {
    v17 = a1;
    v18 = objc_msgSend(v17, sel_isSuggestedWidget);
    v19 = sub_2384C78FC();
    v20 = (void (*)(char *, uint64_t, uint8_t *))*((_QWORD *)v4 + 2);
    if ((v18 & 1) == 0)
    {
      v20(v7, v19, v3);
      v21 = v17;
      v47 = sub_2384DF9AC();
      v48 = sub_2384DFB44();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v50 = (_QWORD *)swift_slowAlloc();
        v80 = v3;
        v78 = v49;
        *(_DWORD *)v49 = 138412290;
        v82 = (unint64_t)v21;
        v51 = v21;
        v79 = v4;
        v52 = v51;
        v3 = v80;
        sub_2384DFC04();
        *v50 = a1;

        v53 = v78;
        v4 = v79;
        _os_log_impl(&dword_2384B0000, v47, v48, "Debug widget already in stack, rotating: %@", v78, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
        swift_arrayDestroy();
        MEMORY[0x23B836F18](v50, -1, -1);
        MEMORY[0x23B836F18](v53, -1, -1);
      }
      else
      {

        v47 = v21;
      }

      (*((void (**)(char *, uint8_t *))v4 + 1))(v7, v3);
      v66 = objc_msgSend(v81, sel_identifier);
      sub_2384DFA30();

      v67 = (void *)sub_2384DFA18();
      v61 = -[NSObject copyWithSource:](v21, sel_copyWithSource_, v67);

      if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_2384DFD3C())
        sub_2384C2A90(MEMORY[0x24BEE4AF8]);
      v68 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
      goto LABEL_24;
    }
    v20(v10, v19, v3);
    v21 = v17;
    v22 = sub_2384DF9AC();
    v23 = sub_2384DFB44();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = (_QWORD *)swift_slowAlloc();
      v79 = v4;
      v80 = v24;
      *(_DWORD *)v24 = 138412290;
      v78 = v24 + 4;
      v82 = (unint64_t)v21;
      v26 = v21;
      v4 = v79;
      sub_2384DFC04();
      *v25 = a1;

      v27 = v80;
      _os_log_impl(&dword_2384B0000, v22, v23, "Debug widget already suggested, retaining: %@", v80, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v25, -1, -1);
      MEMORY[0x23B836F18](v27, -1, -1);
    }
    else
    {

      v22 = v21;
    }

    (*((void (**)(char *, uint8_t *))v4 + 1))(v10, v3);
    v59 = objc_msgSend(v81, sel_identifier);
    sub_2384DFA30();

    v60 = (void *)sub_2384DFA18();
    v61 = -[NSObject copyWithSource:](v21, sel_copyWithSource_, v60);

    __swift_instantiateConcreteTypeFromMangledName(&qword_256912A40);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2384E1240;
    *(_QWORD *)(inited + 32) = v21;
    v82 = inited;
    sub_2384DFAA8();
    v63 = v82;
    if (v82 >> 62)
    {
      v74 = v21;
      swift_bridgeObjectRetain();
      v75 = sub_2384DFD3C();
      swift_bridgeObjectRelease();
      if (!v75)
        goto LABEL_23;
    }
    else
    {
      v64 = *(_QWORD *)((v82 & 0xFFFFFFFFFFFFF8) + 0x10);
      v65 = v21;
      if (!v64)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        v68 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
LABEL_24:
        v72 = (void *)sub_2384DFA18();
        swift_bridgeObjectRelease();
        sub_2384C071C();
        sub_2384C2DE8();
        v39 = sub_2384DFAFC();
        swift_bridgeObjectRelease();
        v73 = objc_msgSend(v68, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v72, v61, v39);
        goto LABEL_25;
      }
    }
    sub_2384C2A90(v63);
    goto LABEL_23;
  }
  sub_2384DFBA4();
  swift_bridgeObjectRetain();
  sub_2384DF994();
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A38);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v15, 1, 1, v28);
  v29 = (void *)sub_2384DFB98();
  swift_bridgeObjectRetain();
  v30 = *(_QWORD *)sub_2384D2658();
  v31 = objc_allocWithZone(MEMORY[0x24BE16A18]);
  v32 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v33 = objc_msgSend(v31, sel_initWithExtensionIdentity_kind_family_intent_activityIdentifier_, v29, v32, v30, 0, 0);

  v34 = objc_allocWithZone((Class)ATXWidget);
  v35 = (void *)sub_2384DFA18();
  v36 = (void *)sub_2384DFA18();
  v37 = objc_msgSend(v34, sel_initWithIdentifier_chsWidget_suggestedWidget_source_, v35, v33, 1, v36);

  v38 = sub_2384C78FC();
  (*((void (**)(char *, uint64_t, uint8_t *))v4 + 2))(v12, v38, v3);
  v39 = v37;
  v40 = sub_2384DF9AC();
  v41 = sub_2384DFB44();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = (_QWORD *)swift_slowAlloc();
    v80 = v3;
    *(_DWORD *)v42 = 138412290;
    v82 = (unint64_t)v39;
    v44 = v39;
    v79 = v12;
    v45 = v4;
    v46 = v44;
    v3 = v80;
    sub_2384DFC04();
    *v43 = v39;

    v4 = v45;
    v12 = v79;
    _os_log_impl(&dword_2384B0000, v40, v41, "Creating new debug suggested widget: %@", v42, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v43, -1, -1);
    MEMORY[0x23B836F18](v42, -1, -1);
  }
  else
  {

    v40 = v39;
  }

  (*((void (**)(char *, uint8_t *))v4 + 1))(v12, v3);
  v54 = objc_msgSend(v81, sel_identifier);
  sub_2384DFA30();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A40);
  v55 = swift_initStackObject();
  *(_OWORD *)(v55 + 16) = xmmword_2384E1240;
  *(_QWORD *)(v55 + 32) = v39;
  v82 = v55;
  sub_2384DFAA8();
  v56 = v82;
  if (v82 >> 62)
  {
    v69 = v39;
    swift_bridgeObjectRetain();
    v70 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (!v70)
      goto LABEL_21;
    goto LABEL_12;
  }
  v57 = *(_QWORD *)((v82 & 0xFFFFFFFFFFFFF8) + 0x10);
  v58 = v39;
  if (v57)
LABEL_12:
    sub_2384C2A90(v56);
LABEL_21:
  swift_bridgeObjectRelease();
  v71 = objc_allocWithZone((Class)ATXWidgetStackSuggestion);
  v21 = sub_2384DFA18();
  swift_bridgeObjectRelease();
  sub_2384C071C();
  sub_2384C2DE8();
  v72 = (void *)sub_2384DFAFC();
  swift_bridgeObjectRelease();
  v73 = objc_msgSend(v71, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v21, v39, v72);
  v61 = v39;
LABEL_25:

  return v73;
}

uint64_t sub_2384C1184(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2384C1254(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2384C32A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2384C32A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2384C1254(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2384DFC10();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2384C140C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2384DFCD0();
  if (!v8)
  {
    sub_2384DFD24();
    __break(1u);
LABEL_17:
    result = sub_2384DFD6C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2384C140C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2384C14A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2384C1678(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2384C1678(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2384C14A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2384C1614(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2384DFCAC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2384DFD24();
      __break(1u);
LABEL_10:
      v2 = sub_2384DFA6C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2384DFD6C();
    __break(1u);
LABEL_14:
    result = sub_2384DFD24();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2384C1614(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912B30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2384C1678(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912B30);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2384DFD6C();
  __break(1u);
  return result;
}

unint64_t sub_2384C17C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2384DFE38();
  sub_2384DFA54();
  v4 = sub_2384DFE50();
  return sub_2384C1E74(a1, a2, v4);
}

void (*sub_2384C1828(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_2384C1A70(v6);
  v6[10] = sub_2384C1908(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_2384C18B8;
}

void sub_2384C18B8(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_2384C1908(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_2384C17C4(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_2384C1A34;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_2384C1F54();
      goto LABEL_7;
    }
    sub_2384C1A9C(v16, a4 & 1);
    v20 = sub_2384C17C4(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_2384DFDF0();
  __break(1u);
  return result;
}

void sub_2384C1A34(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_2384C1DB0(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_2384C1A70(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_2384C1A90;
}

uint64_t sub_2384C1A90(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_2384C1A9C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A58);
  v36 = a2;
  v6 = sub_2384DFD54();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2384DFE38();
    sub_2384DFA54();
    result = sub_2384DFE50();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t *sub_2384C1DB0(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v8 = *result;
  if (!*result)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy();
      sub_2384C2108(a4, *a3);
    }
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  v9 = (_QWORD *)*a3;
  if ((a2 & 1) != 0)
  {
    *(_QWORD *)(v9[7] + 8 * a4) = v8;
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  v9[(a4 >> 6) + 8] |= 1 << a4;
  v10 = (_QWORD *)(v9[6] + 16 * a4);
  *v10 = a5;
  v10[1] = a6;
  *(_QWORD *)(v9[7] + 8 * a4) = v8;
  v11 = v9[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (!v12)
  {
    v9[2] = v13;
    swift_bridgeObjectRetain();
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

unint64_t sub_2384C1E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2384DFDD8() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2384DFDD8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2384C1F54()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A58);
  v2 = *v0;
  v3 = sub_2384DFD48();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_2384C2108(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2384DFC34();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2384DFE38();
        swift_bridgeObjectRetain();
        sub_2384DFA54();
        v9 = sub_2384DFE50();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_2384C22DC(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  unint64_t v40;
  uint64_t v41;

  v3 = v2;
  v4 = a1;
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    v5 = sub_2384DFD3C();
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      v34 = v3;
      v40 = v4 & 0xC000000000000001;
      v39 = (uint64_t *)(a2 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
      v35 = OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent;
      v6 = 4;
      v7 = *(_QWORD *)(a2
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
      v8 = *(_QWORD *)(a2
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier
                     + 8);
      v37 = v8;
      v38 = v7;
      do
      {
        v3 = v6 - 4;
        if (v40)
          v9 = (id)MEMORY[0x23B8366E4](v6 - 4, v4);
        else
          v9 = *(id *)(v4 + 8 * v6);
        v10 = v9;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          goto LABEL_28;
        }
        v41 = v6 - 3;
        v11 = objc_msgSend(v9, sel_chsWidget);
        v12 = objc_msgSend(v11, sel_extensionIdentity);

        swift_beginAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
        v13 = sub_2384DF9A0();
        v15 = v14;
        swift_endAccess();

        if (v7 == v13 && v8 == v15)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v17 = sub_2384DFDD8();
          swift_bridgeObjectRelease();
          if ((v17 & 1) == 0)
            goto LABEL_4;
        }
        v18 = v5;
        v19 = v4;
        v20 = *v39;
        v21 = v39[1];
        v22 = objc_msgSend(v10, sel_chsWidget, v34);
        v23 = objc_msgSend(v22, sel_kind);

        v24 = sub_2384DFA30();
        v26 = v25;

        if (v20 == v24 && v21 == v26)
        {
          swift_bridgeObjectRelease();
          v4 = v19;
          v5 = v18;
          v8 = v37;
          v7 = v38;
        }
        else
        {
          v27 = sub_2384DFDD8();
          swift_bridgeObjectRelease();
          v4 = v19;
          v5 = v18;
          v8 = v37;
          v7 = v38;
          if ((v27 & 1) == 0)
            goto LABEL_4;
        }
        v28 = objc_msgSend(v10, sel_chsWidget);
        v29 = objc_msgSend(v28, sel_intentReference);

        if (!v29 || (v30 = objc_msgSend(v29, sel_intent), v29, !v30))
        {
LABEL_24:
          swift_bridgeObjectRelease();
          return v10;
        }
        v31 = *(_QWORD *)(a2 + v35);
        if (!v31)
        {
          swift_bridgeObjectRelease();

          return v10;
        }
        v32 = objc_msgSend((id)objc_opt_self(), sel_intent_isEqualToIntent_, v30, v31);

        if ((v32 & 1) != 0)
          goto LABEL_24;
LABEL_4:

        ++v6;
      }
      while (v41 != v5);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_2384C2664(unint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v25;
  unint64_t v26;

  v3 = v2;
  v4 = a1;
  if (a1 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    v5 = sub_2384DFD3C();
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      v23 = v3;
      v26 = v4 & 0xC000000000000001;
      v6 = *a2;
      v7 = a2[1];
      v8 = 4;
      v25 = v4;
      do
      {
        if (v26)
          v9 = (id)MEMORY[0x23B8366E4](v8 - 4, v4);
        else
          v9 = *(id *)(v4 + 8 * v8);
        v10 = v9;
        v4 = v8 - 3;
        if (__OFADD__(v8 - 4, 1))
        {
          __break(1u);
          goto LABEL_23;
        }
        v11 = objc_msgSend(v9, sel_chsWidget);
        v12 = objc_msgSend(v11, sel_extensionIdentity);

        swift_beginAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
        v13 = sub_2384DF9A0();
        v15 = v14;
        swift_endAccess();

        v16 = v13 == v6 && v15 == v7;
        if (v16)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v3 = sub_2384DFDD8();
          swift_bridgeObjectRelease();
          if ((v3 & 1) == 0)
            goto LABEL_5;
        }
        v17 = objc_msgSend(v10, sel_chsWidget, v23);
        v18 = objc_msgSend(v17, sel_kind);

        v19 = sub_2384DFA30();
        v21 = v20;

        if (v19 == a2[2] && v21 == a2[3])
        {
          swift_bridgeObjectRelease();
LABEL_21:
          swift_bridgeObjectRelease();
          return v10;
        }
        v3 = sub_2384DFDD8();
        swift_bridgeObjectRelease();
        if ((v3 & 1) != 0)
          goto LABEL_21;
LABEL_5:

        ++v8;
        v16 = v4 == v5;
        v4 = v25;
      }
      while (!v16);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2384C28E4(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v3 = v2;
  v5 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v6 = sub_2384DFD3C();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v21 = v3;
      v22 = v5;
      v23 = v5 & 0xC000000000000001;
      v7 = *(_QWORD *)(a2 + 32);
      v8 = *(_QWORD *)(a2 + 40);
      v3 = 4;
      do
      {
        v9 = v3 - 4;
        if (v23)
        {
          v10 = MEMORY[0x23B8366E4](v3 - 4, v5);
          a2 = v3 - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_19;
        }
        else
        {
          v10 = swift_retain();
          a2 = v3 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v11 = v6;
        v12 = v10;
        v13 = v8;
        v14 = objc_msgSend(*(id *)(v10 + 16), sel_identifier, v21);
        v15 = sub_2384DFA30();
        v17 = v16;

        v8 = v13;
        v18 = v15 == v7 && v17 == v13;
        if (v18)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v12;
        }
        v19 = sub_2384DFDD8();
        swift_bridgeObjectRelease();
        if ((v19 & 1) != 0)
          goto LABEL_18;
        swift_release();
        ++v3;
        v6 = v11;
        v18 = a2 == v11;
        v5 = v22;
      }
      while (!v18);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_2384C2A90(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_256912A50);
      v3 = sub_2384DFC94();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_2384DFD3C();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v39 = v1;
    while (1)
    {
      v8 = MEMORY[0x23B8366E4](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_2384DFBE0();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        sub_2384C071C();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_2384DFBEC();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v39;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_2384DFBEC();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v39;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v41)
        return;
    }
  }
  v24 = 0;
  v40 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v1 + 32 + 8 * v24);
    v26 = sub_2384DFBE0();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_2384C071C();
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_2384DFBEC();

      if ((v33 & 1) != 0)
        goto LABEL_24;
      v34 = ~v27;
      v28 = (v28 + 1) & v34;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) != 0)
      {
        while (1)
        {
          v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
          v36 = sub_2384DFBEC();

          if ((v36 & 1) != 0)
            break;
          v28 = (v28 + 1) & v34;
          v29 = v28 >> 6;
          v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
          v31 = 1 << v28;
          if ((v30 & (1 << v28)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v41;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v41;
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

unint64_t sub_2384C2DE8()
{
  unint64_t result;
  unint64_t v1;

  result = qword_256912A48;
  if (!qword_256912A48)
  {
    v1 = sub_2384C071C();
    result = MEMORY[0x23B836E94](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256912A48);
  }
  return result;
}

unint64_t sub_2384C2E30()
{
  unint64_t result;

  result = qword_256913C08[0];
  if (!qword_256913C08[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E15E0, &type metadata for WidgetStackSuggestionGenerator.StackState.SmartRotateFailure);
    atomic_store(result, qword_256913C08);
  }
  return result;
}

uint64_t sub_2384C2E74(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2384C2E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B8366F0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for ContextualActionSuggestion();
  swift_arrayDestroy();
  if (!v5)
    return sub_2384DFAA8();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_2384DFAA8();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_2384DFD6C();
  __break(1u);
  return result;
}

id sub_2384C3194(id result)
{
  if ((unint64_t)result >= 6)
    return result;
  return result;
}

void sub_2384C31A4(id a1)
{
  if ((unint64_t)a1 >= 6)

}

uint64_t sub_2384C31B4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2384C31F0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2384C3238(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2384C32A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2384C32E0()
{
  unint64_t result;

  result = qword_256912A60;
  if (!qword_256912A60)
  {
    result = MEMORY[0x23B836E94](&protocol conformance descriptor for AmbientDebugRotation, &type metadata for AmbientDebugRotation);
    atomic_store(result, (unint64_t *)&qword_256912A60);
  }
  return result;
}

uint64_t sub_2384C3324(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t _s26ContextualSuggestionClient30WidgetStackSuggestionGeneratorV8LocationOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2384C33B4 + 4 * byte_2384E1275[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2384C33E8 + 4 * byte_2384E1270[v4]))();
}

uint64_t sub_2384C33E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384C33F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384C33F8);
  return result;
}

uint64_t sub_2384C3404(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384C340CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2384C3410(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384C3418(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.StackState.SmartRotateFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.StackState.SmartRotateFailure;
}

_QWORD *initializeBufferWithCopyOfBuffer for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF9 && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483642);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 5;
  if (v4 >= 7)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFA)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 5;
  }
  return result;
}

uint64_t sub_2384C3618(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2384C3630(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure()
{
  return &type metadata for WidgetStackSuggestionGenerator.StackState.NewWidgetSuggestionFailure;
}

unint64_t sub_2384C366C()
{
  unint64_t result;

  result = qword_256913D10[0];
  if (!qword_256913D10[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E15B8, &type metadata for WidgetStackSuggestionGenerator.StackState.SmartRotateFailure);
    atomic_store(result, qword_256913D10);
  }
  return result;
}

void *sub_2384C36D4()
{
  return &unk_250A2D950;
}

unint64_t contextualEngineStartupNotification.getter()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_2384C36FC()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for ContextualSuggestionService();
  v0 = swift_allocObject();
  result = sub_2384C5F5C();
  qword_256915C30 = v0;
  return result;
}

uint64_t sub_2384C3734()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_2384C5F5C();
  return v0;
}

uint64_t *sub_2384C3768()
{
  if (qword_256913F20 != -1)
    swift_once();
  return &qword_256915C30;
}

uint64_t sub_2384C37A8()
{
  if (qword_256913F20 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2384C3814(uint64_t a1)
{
  if (qword_256913F20 != -1)
    swift_once();
  swift_beginAccess();
  qword_256915C30 = a1;
  return swift_release();
}

uint64_t (*sub_2384C3888())()
{
  if (qword_256913F20 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2384C38F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _QWORD v8[2];

  v0 = sub_2384DFB5C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2384DFB50();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_2384DF9F4();
  MEMORY[0x24BDAC7A8](v6);
  sub_2384C6134();
  sub_2384DF9E8();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A78, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A80);
  sub_2384C62D0(&qword_256912A88, &qword_256912A80);
  sub_2384DFC28();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  return sub_2384DFB80();
}

void *sub_2384C3AA8()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void sub_2384C3AE8(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = a1;

}

uint64_t (*sub_2384C3B2C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2384C3B68()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2384C3B9C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2384C3BE0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_2384C3C1C()
{
  return sub_2384C3C28(MEMORY[0x24BEE4AF8]);
}

unint64_t sub_2384C3C28(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912B28);
  v2 = (_QWORD *)sub_2384DFD60();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2384C17C4(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2384C3D40()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2384C3D74(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2384C3DB8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2384C3DF4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned int *)(v0 + 48);
}

uint64_t sub_2384C3E24(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_DWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_2384C3E60())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2384C3EA0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A90);
  sub_2384DFB68();
  return v1;
}

uint64_t sub_2384C3F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = *v3;
  v9 = sub_2384DF9D0();
  v20 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2384DF9F4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = v4[2];
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v4;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a1;
  v16[6] = v8;
  aBlock[4] = sub_2384C626C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384C448C;
  aBlock[3] = &block_descriptor_0;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_2384DF9E8();
  v21 = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v15, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

uint64_t sub_2384C4114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t (*v31)(uint64_t *);
  id v32;
  void (*v33)(uint64_t *, _QWORD);
  uint64_t *v34;
  uint64_t *v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[4];

  v38 = a5;
  v9 = sub_2384DF9B8();
  v10 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  v40 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 168);
  v15 = *(_QWORD *)(v14(v11) + 16);
  swift_bridgeObjectRelease();
  v16 = swift_bridgeObjectRetain();
  v17 = v14(v16);
  if (!*(_QWORD *)(v17 + 16) || (v18 = sub_2384C17C4(a2, a3), (v19 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable, v38);
    objc_msgSend(v30, sel_addObject_, a4);
    v31 = *(uint64_t (**)(uint64_t *))(*(_QWORD *)a1 + 184);
    swift_bridgeObjectRetain();
    v32 = v30;
    v33 = (void (*)(uint64_t *, _QWORD))v31(v42);
    v35 = v34;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v41 = *v35;
    *v35 = 0x8000000000000000;
    sub_2384C6810((uint64_t)v32, a2, a3, isUniquelyReferenced_nonNull_native);
    *v35 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v33(v42, 0);

    if (!v15)
      goto LABEL_4;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 296))(a4, a2, a3);
  }
  v20 = *(id *)(*(_QWORD *)(v17 + 56) + 8 * v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_addObject_, a4, v38);

  if (v15)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 296))(a4, a2, a3);
LABEL_4:
  v21 = sub_2384D860C();
  v22 = v39;
  v23 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v13, v21, v39);
  v24 = sub_2384DF9AC();
  v25 = sub_2384DFB44();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v42[0] = v27;
    *(_DWORD *)v26 = 136315394;
    v28 = sub_2384DFEB0();
    v41 = sub_2384C1184(v28, v29, v42);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    v41 = sub_2384C1184(0xD000000000000017, 0x80000002384E3A90, v42);
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v24, v25, "%s: %s: first observer, start listening for server startup", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v27, -1, -1);
    MEMORY[0x23B836F18](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v22);
  }
  sub_2384C4F10();
  return sub_2384C4A6C();
}

uint64_t sub_2384C4490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = *v3;
  v7 = sub_2384DF9D0();
  v19 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2384DF9F4();
  v10 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v3[2];
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v3;
  v14[3] = a2;
  v14[4] = a3;
  v14[5] = v13;
  v14[6] = v6;
  aBlock[4] = sub_2384C6380;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384C448C;
  aBlock[3] = &block_descriptor_9;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2384DF9E8();
  v20 = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v18);
  swift_release();
  return swift_release();
}

uint64_t sub_2384C46CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t *, _QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[4];
  uint64_t v39;

  v8 = sub_2384DF9B8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 168);
  v13 = swift_bridgeObjectRetain();
  v14 = v12(v13);
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_2384C17C4(a2, a3), (v16 & 1) != 0))
  {
    v37 = v8;
    v17 = a4 + 16;
    v18 = *(id *)(*(_QWORD *)(v14 + 56) + 8 * v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v19 = MEMORY[0x23B836F90](v17);
    if (v19)
    {
      objc_msgSend(v18, sel_removeObject_, v19);
      swift_unknownObjectRelease();
    }
    v20 = objc_msgSend(v18, sel_allObjects);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912AB8);
    v21 = sub_2384DFA90();

    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = sub_2384DFD3C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v22)
    {
      v23 = (void (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *))(*(_QWORD *)a1 + 184))(v38);

      v23(v38, 0);
    }

    v8 = v37;
  }
  else
  {
    swift_bridgeObjectRelease();
    v24 = swift_bridgeObjectRelease();
  }
  v25 = *(_QWORD *)(v12(v24) + 16);
  result = swift_bridgeObjectRelease();
  if (!v25)
  {
    v27 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v27, v8);
    v28 = sub_2384DF9AC();
    v29 = sub_2384DFB44();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      *(_DWORD *)v30 = 136315394;
      v37 = v8;
      v38[0] = v31;
      v32 = sub_2384DFEB0();
      v39 = sub_2384C1184(v32, v33, v38);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      v39 = sub_2384C1184(0xD000000000000019, 0x80000002384E3A70, v38);
      sub_2384DFC04();
      _os_log_impl(&dword_2384B0000, v28, v29, "%s: %s: no more observers, stop listening for server startup", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v31, -1, -1);
      MEMORY[0x23B836F18](v30, -1, -1);

      v34 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v37);
    }
    else
    {

      v34 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    v35 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 192))(v34);
    return notify_cancel(v35);
  }
  return result;
}

uint64_t sub_2384C4A6C()
{
  _QWORD *v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)(_QWORD *, _QWORD);
  int *v5;
  _QWORD v7[6];

  v1 = v0[2];
  v2 = swift_allocObject();
  swift_weakInit();
  v7[4] = sub_2384C7640;
  v7[5] = v2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2384C4C80;
  v7[3] = &block_descriptor_36;
  v3 = _Block_copy(v7);
  swift_release();
  v4 = (uint64_t (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *))(*v0 + 208))(v7);
  notify_register_dispatch("com.apple.proactive.ContextualEngine.startup", v5, v1, v3);
  _Block_release(v3);
  return v4(v7, 0);
}

uint64_t sub_2384C4B44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t result;
  uint64_t v9;

  v0 = sub_2384DF9B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2384D860C();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_2384DF9AC();
  v6 = sub_2384DFB44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2384B0000, v5, v6, "ContextualSuggestionService: received server startup notification, fetching latest snapshots", v7, 2u);
    MEMORY[0x23B836F18](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2384C4F10();
    return swift_release();
  }
  return result;
}

uint64_t sub_2384C4C80(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_2384C4CBC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(id);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)();
  void *v17;
  uint64_t (*v18)();
  uint64_t v19;

  v1 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();

  if (!v1)
  {
    sub_2384DF328();
    v2 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(v2, sel_initWithMachServiceName_options_, v3, 0);

    v5 = (void *)contextualSuggestionServerInterface.getter();
    objc_msgSend(v4, sel_setRemoteObjectInterface_, v5);

    objc_msgSend(v4, sel_setExportedObject_, v0);
    v6 = (void *)contextualSuggestionServiceInterface.getter();
    objc_msgSend(v4, sel_setExportedInterface_, v6);

    v7 = swift_allocObject();
    swift_weakInit();
    v18 = sub_2384C75BC;
    v19 = v7;
    v8 = MEMORY[0x24BDAC760];
    v14 = MEMORY[0x24BDAC760];
    v15 = 1107296256;
    v16 = sub_2384C448C;
    v17 = &block_descriptor_28;
    v9 = _Block_copy(&v14);
    swift_release();
    objc_msgSend(v4, sel_setInterruptionHandler_, v9);
    _Block_release(v9);
    v10 = swift_allocObject();
    swift_weakInit();
    v18 = sub_2384C75BC;
    v19 = v10;
    v14 = v8;
    v15 = 1107296256;
    v16 = sub_2384C448C;
    v17 = &block_descriptor_32;
    v11 = _Block_copy(&v14);
    swift_release();
    objc_msgSend(v4, sel_setInvalidationHandler_, v11);
    _Block_release(v11);
    objc_msgSend(v4, sel_resume);
    v12 = *(void (**)(id))(*(_QWORD *)v0 + 128);
    v13 = v4;
    v12(v4);

  }
}

uint64_t sub_2384C4EE4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2384C4F10()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v1 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 168);
  v2 = *(_QWORD *)(v1() + 16);
  result = swift_bridgeObjectRelease();
  if (v2)
  {
    sub_2384C4CBC();
    v4 = v1();
    sub_2384C50E0(v4);
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
    if (!v5)
      return swift_bridgeObjectRelease();
    v6 = (void *)v5;
    v17 = sub_2384C5274;
    v18 = 0;
    v7 = (void *)MEMORY[0x24BDAC760];
    v13 = (void *)MEMORY[0x24BDAC760];
    v14 = 1107296256;
    v15 = sub_2384B6BD4;
    v16 = &block_descriptor_19;
    v8 = _Block_copy(&v13);
    v9 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);

    sub_2384DFC1C();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912AC8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = v13;
      v11 = (void *)sub_2384DFAFC();
      swift_bridgeObjectRelease();
      v17 = sub_2384C6430;
      v18 = v0;
      v13 = v7;
      v14 = 1107296256;
      v15 = sub_2384C559C;
      v16 = &block_descriptor_22;
      v12 = _Block_copy(&v13);
      swift_retain();
      swift_release();
      objc_msgSend(v10, sel_requestSnapshotsForEndpoints_completion_, v11, v12);
      _Block_release(v12);

      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_2384C50E0(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = sub_2384DFB2C();
  v3 = 0;
  v18 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_2384C6B1C(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2384C5274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_2384DF9B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2384D860C();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_2384DF9AC();
  v6 = sub_2384DFB38();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2384B0000, v5, v6, "ContextualSuggestionService: error grabbing remote object proxy while fetching latest snapshots from server", v7, 2u);
    MEMORY[0x23B836F18](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2384C536C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint8_t *v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_2384DF9B8();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = a2;
    v12 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
    v13 = a2;
    v14 = a2;
    v15 = sub_2384DF9AC();
    v16 = sub_2384DFB38();
    if (os_log_type_enabled(v15, v16))
    {
      v28 = a3;
      v17 = swift_slowAlloc();
      v27 = a1;
      v18 = (uint8_t *)v17;
      v26 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v18 = 138412290;
      v19 = a2;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      v29 = v20;
      a3 = v28;
      sub_2384DFC04();
      v21 = v26;
      *v26 = v20;

      _os_log_impl(&dword_2384B0000, v15, v16, "ContextualSuggestionService: error requesting snapshots: %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v21, -1, -1);
      v22 = v18;
      a1 = v27;
      MEMORY[0x23B836F18](v22, -1, -1);

    }
    else
    {

    }
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if (a1)
  {
    v23 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 152);
    v24 = swift_bridgeObjectRetain();
    v25 = v23(v24);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 288))(v25);
  }
  return result;
}

uint64_t sub_2384C559C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for ContextualSuggestionSnapshot();
    v4 = sub_2384DFA0C();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2384C5628(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[9] = a1;
  v2[10] = v1;
  v3 = sub_2384DF9D0();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v4 = sub_2384DF9F4();
  v2[14] = v4;
  v2[15] = *(_QWORD *)(v4 - 8);
  v2[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384C56B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0[16];
  v2 = v0[13];
  v10 = v0[15];
  v11 = v0[14];
  v3 = v0[11];
  v9 = v0[12];
  v5 = v0[9];
  v4 = v0[10];
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v5;
  v0[6] = sub_2384C63CC;
  v0[7] = v6;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_2384C448C;
  v0[5] = &block_descriptor_15;
  v7 = _Block_copy(v0 + 2);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2384DF9E8();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v1, v2, v7);
  _Block_release(v7);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v11);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_2384C5990(int a1, void *aBlock, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  type metadata accessor for ContextualSuggestionSnapshot();
  v4 = sub_2384DFA0C();
  v3[4] = v4;
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  v3[5] = v5;
  *v5 = v3;
  v5[1] = sub_2384C5A30;
  return sub_2384C5628(v4);
}

uint64_t sub_2384C5A30()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 + 24);
  if (v0)
  {
    v4 = (void *)sub_2384DF8EC();

    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 24), 0);
  }
  _Block_release(*(const void **)(v2 + 24));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_2384C5ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t (*v16)(void);
  id v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
  if (!v1)
    return;
  v2 = v1;
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRelease();
    return;
  }
  v3 = 0;
  v27 = v1 + 64;
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v1 + 64);
  v28 = (unint64_t)(v4 + 63) >> 6;
  while (v6)
  {
    v7 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v8 = v7 | (v3 << 6);
LABEL_24:
    v12 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v8);
    v14 = *v12;
    v13 = v12[1];
    v15 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v8);
    v16 = *(uint64_t (**)(void))(*(_QWORD *)v29 + 168);
    swift_bridgeObjectRetain();
    v17 = v15;
    v18 = v16();
    if (!*(_QWORD *)(v18 + 16) || (v19 = sub_2384C17C4(v14, v13), (v20 & 1) == 0))
    {

      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v21 = *(id *)(*(_QWORD *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v21, sel_allObjects);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912AB8);
    v23 = sub_2384DFA90();

    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_2384DFD3C();
      swift_bridgeObjectRelease();
      if (v24)
      {
LABEL_28:
        if (v24 < 1)
          goto LABEL_40;
        for (i = 0; i != v24; ++i)
        {
          if ((v23 & 0xC000000000000001) != 0)
          {
            v26 = (void *)MEMORY[0x23B8366E4](i, v23);
          }
          else
          {
            v26 = *(void **)(v23 + 8 * i + 32);
            swift_unknownObjectRetain();
          }
          objc_msgSend(v26, sel_serviceDidUpdateWithSnapshot_, v17);
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v24)
        goto LABEL_28;
    }

LABEL_7:
    swift_bridgeObjectRelease();
  }
  v9 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v9 >= v28)
    goto LABEL_36;
  v10 = *(_QWORD *)(v27 + 8 * v9);
  ++v3;
  if (v10)
    goto LABEL_23;
  v3 = v9 + 1;
  if (v9 + 1 >= v28)
    goto LABEL_36;
  v10 = *(_QWORD *)(v27 + 8 * v3);
  if (v10)
    goto LABEL_23;
  v3 = v9 + 2;
  if (v9 + 2 >= v28)
    goto LABEL_36;
  v10 = *(_QWORD *)(v27 + 8 * v3);
  if (v10)
  {
LABEL_23:
    v6 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v3 << 6);
    goto LABEL_24;
  }
  v11 = v9 + 3;
  if (v11 >= v28)
  {
LABEL_36:
    swift_release();
    return;
  }
  v10 = *(_QWORD *)(v27 + 8 * v11);
  if (v10)
  {
    v3 = v11;
    goto LABEL_23;
  }
  while (1)
  {
    v3 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v3 >= v28)
      goto LABEL_36;
    v10 = *(_QWORD *)(v27 + 8 * v3);
    ++v11;
    if (v10)
      goto LABEL_23;
  }
LABEL_41:
  __break(1u);
}

void sub_2384C5E10(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  id v11;

  v7 = (*(uint64_t (**)(void))(*(_QWORD *)v3 + 144))();
  if (v7)
  {
    v8 = v7;
    if (*(_QWORD *)(v7 + 16))
    {
      swift_bridgeObjectRetain();
      v9 = sub_2384C17C4(a2, a3);
      if ((v10 & 1) != 0)
      {
        v11 = *(id *)(*(_QWORD *)(v8 + 56) + 8 * v9);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(a1, sel_serviceDidUpdateWithSnapshot_, v11);

        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2384C5EEC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2384C5F20()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2384C5F5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v1 = sub_2384DFB5C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2384DFB50();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_2384DF9F4();
  MEMORY[0x24BDAC7A8](v7);
  v10[0] = sub_2384C6134();
  sub_2384DF9E8();
  v10[1] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A78, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A80);
  sub_2384C62D0(&qword_256912A88, &qword_256912A80);
  sub_2384DFC28();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  v8 = sub_2384DFB80();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 16) = v8;
  *(_QWORD *)(v0 + 40) = sub_2384C3C28(MEMORY[0x24BEE4AF8]);
  *(_DWORD *)(v0 + 48) = 0;
  return v0;
}

unint64_t sub_2384C6134()
{
  unint64_t result;

  result = qword_256912A70;
  if (!qword_256912A70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256912A70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B836E88](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2384C61B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  char v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  result = (*(uint64_t (**)(void))(**(_QWORD **)(v1 + 16) + 144))();
  if (result)
  {
    v6 = result;
    if (*(_QWORD *)(result + 16))
    {
      swift_bridgeObjectRetain();
      v7 = sub_2384C17C4(v3, v4);
      if ((v8 & 1) != 0)
      {
        v9 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v7);
        v10 = v9;
      }
      else
      {
        v9 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0;
    }
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  *a1 = v9;
  return result;
}

uint64_t sub_2384C6260()
{
  return objectdestroyTm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

uint64_t sub_2384C626C()
{
  return sub_2384C638C(sub_2384C4114);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2384C6290(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B836E94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2384C62D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B836E94](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2384C6310()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2384C6334()
{
  return objectdestroyTm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroyTm_0(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  swift_bridgeObjectRelease();
  a1(*(_QWORD *)(v1 + 40));
  return swift_deallocObject();
}

uint64_t sub_2384C6380()
{
  return sub_2384C638C((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2384C46CC);
}

uint64_t sub_2384C638C(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_2384C63A0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2384C63CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 152);
  v3 = swift_bridgeObjectRetain();
  v4 = v2(v3);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 288))(v4);
}

uint64_t type metadata accessor for ContextualSuggestionService()
{
  return objc_opt_self();
}

uint64_t sub_2384C6430(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_2384C536C(a1, a2, v2);
}

uint64_t sub_2384C6438(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2384C17C4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2384C696C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_2384C2108(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2384C6504(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912B28);
  v38 = a2;
  v6 = sub_2384DFD54();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_2384DFE38();
    sub_2384DFA54();
    result = sub_2384DFE50();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_2384C6810(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2384C17C4(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2384C696C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_2384C6504(v15, a4 & 1);
  v20 = sub_2384C17C4(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_2384DFDF0();
  __break(1u);
}

id sub_2384C696C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912B28);
  v2 = *v0;
  v3 = sub_2384DFD48();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2384C6B1C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_2384DFE38();
  swift_bridgeObjectRetain();
  sub_2384DFA54();
  v8 = sub_2384DFE50();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2384DFDD8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2384DFDD8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2384C6FA4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2384C6CC8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912AD8);
  v3 = sub_2384DFC88();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_2384DFE38();
      sub_2384DFA54();
      result = sub_2384DFE50();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2384C6FA4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_2384C6CC8();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2384C713C();
      goto LABEL_22;
    }
    sub_2384C72EC();
  }
  v11 = *v4;
  sub_2384DFE38();
  sub_2384DFA54();
  result = sub_2384DFE50();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2384DFDD8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2384DFDE4();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_2384DFDD8();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_2384C713C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912AD8);
  v2 = *v0;
  v3 = sub_2384DFC7C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2384C72EC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912AD8);
  v3 = sub_2384DFC88();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_2384DFE38();
    swift_bridgeObjectRetain();
    sub_2384DFA54();
    result = sub_2384DFE50();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2384C7598()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2384C75C0()
{
  uint64_t result;
  uint64_t v1;
  void *v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 120))(result);
    objc_msgSend(v2, sel_invalidate);

    (*(void (**)(_QWORD))(*(_QWORD *)v1 + 128))(0);
    return swift_release();
  }
  return result;
}

uint64_t sub_2384C7640()
{
  return sub_2384C4B44();
}

uint64_t sub_2384C7648()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384C767C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2384B8064;
  return ((uint64_t (*)(int, void *, uint64_t))((char *)&dword_256912AE8 + dword_256912AE8))(v2, v3, v4);
}

uint64_t sub_2384C76F0()
{
  swift_release();
  return swift_deallocObject();
}

id sub_2384C7790()
{
  if (qword_2542CE3A8 != -1)
    swift_once();
  return (id)qword_2542CE3A0;
}

uint64_t sub_2384C77D0()
{
  uint64_t result;

  sub_2384B97C8(0, (unint64_t *)&qword_2542CDD70);
  sub_2384D83CC();
  swift_bridgeObjectRetain();
  result = sub_2384DFBF8();
  qword_2542CE3A0 = result;
  return result;
}

uint64_t sub_2384C7890()
{
  uint64_t v0;
  id v1;

  v0 = sub_2384DF9B8();
  __swift_allocate_value_buffer(v0, qword_2542CE180);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542CE180);
  v1 = objc_msgSend((id)objc_opt_self(), "log");
  return sub_2384DF9C4();
}

uint64_t sub_2384C78FC()
{
  uint64_t v0;

  if (qword_2542CDFA0 != -1)
    swift_once();
  v0 = sub_2384DF9B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2542CE180);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.ambient.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2542CDFA0 != -1)
    swift_once();
  v2 = sub_2384DF9B8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2542CE180);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t type metadata accessor for ATXAmbientLog(uint64_t a1)
{
  return sub_2384B97C8(a1, &qword_256913F28);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

Swift::Void __swiftcall CoreAnalyticsEvent.send()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = v1;
  v3 = v0;
  CoreAnalyticsEvent.createPayload()(v0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v3, v2);
  v4 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  sub_2384C7EC4();
  v5 = (id)sub_2384DFA00();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

}

uint64_t CoreAnalyticsEvent.createPayload()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[32];
  _QWORD v46[2];
  _OWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;

  v3 = sub_2384DFE74();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2384C7F00(MEMORY[0x24BEE4AF8]);
  *((_QWORD *)&v50 + 1) = a1;
  v8 = __swift_allocate_boxed_opaque_existential_0(&v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v8, v1, a1);
  sub_2384DFE5C();
  v41 = v6;
  sub_2384DFE68();
  sub_2384DFD18();
  swift_release();
  swift_retain();
  sub_2384DFD78();
  if (!v51)
  {
LABEL_27:
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v41, v3);
    return v7;
  }
  v40 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    v9 = v7;
    while (1)
    {
      v10 = v48;
      v11 = v49;
      v46[0] = v48;
      v46[1] = v49;
      sub_2384C8054(&v50, v47);
      v43 = v10;
      v44 = v11;
      sub_2384C32A0((uint64_t)v47, (uint64_t)v45);
      if (v11)
        break;
      sub_2384C8064((uint64_t)v46);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
      sub_2384DFD78();
      if (!v51)
      {
        v7 = v9;
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRetain_n();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
    v43 = v10;
    v44 = v11;
    sub_2384C32A0((uint64_t)v47, (uint64_t)v45);
    swift_bridgeObjectRelease();
    sub_2384C7EC4();
    if (swift_dynamicCast())
      break;
    swift_bridgeObjectRetain();
    v23 = v10;
    v7 = v9;
    v24 = sub_2384C17C4(v23, v11);
    v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
      goto LABEL_26;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42 = (_QWORD *)v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2384C83B0();
      v7 = (unint64_t)v42;
    }
    swift_bridgeObjectRelease();
    v28 = *(void **)(*(_QWORD *)(v7 + 56) + 8 * v24);
    sub_2384C2108(v24, v7);

LABEL_25:
    swift_bridgeObjectRelease();
LABEL_26:
    swift_bridgeObjectRelease();
    sub_2384C8064((uint64_t)v46);
    sub_2384DFD78();
    if (!v51)
      goto LABEL_27;
  }
  v37 = v4;
  v38 = v3;
  v39 = v42;
  v12 = v9;
  v13 = swift_isUniquelyReferenced_nonNull_native();
  v42 = (_QWORD *)v9;
  v15 = sub_2384C17C4(v10, v11);
  v16 = *(_QWORD *)(v12 + 16);
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (!__OFADD__(v16, v17))
  {
    v19 = v14;
    if (*(_QWORD *)(v12 + 24) < v18)
    {
      sub_2384C80A4(v18, v13);
      v20 = sub_2384C17C4(v10, v11);
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_30;
      v15 = v20;
      v22 = v42;
      if ((v19 & 1) == 0)
        goto LABEL_22;
LABEL_20:
      v29 = v22[7];
      v30 = 8 * v15;

      *(_QWORD *)(v29 + v30) = v39;
      v3 = v38;
      v7 = (unint64_t)v22;
LABEL_24:
      v4 = v37;
      goto LABEL_25;
    }
    if ((v13 & 1) != 0)
    {
      v22 = v42;
      if ((v14 & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      sub_2384C83B0();
      v22 = v42;
      if ((v19 & 1) != 0)
        goto LABEL_20;
    }
LABEL_22:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v31 = (uint64_t *)(v22[6] + 16 * v15);
    *v31 = v10;
    v31[1] = v11;
    *(_QWORD *)(v22[7] + 8 * v15) = v39;
    v32 = v22[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
      goto LABEL_29;
    v7 = (unint64_t)v22;
    v22[2] = v34;
    swift_bridgeObjectRetain();
    v3 = v38;
    goto LABEL_24;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  result = sub_2384DFDF0();
  __break(1u);
  return result;
}

unint64_t sub_2384C7EC4()
{
  unint64_t result;

  result = qword_2542CDD68;
  if (!qword_2542CDD68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542CDD68);
  }
  return result;
}

unint64_t sub_2384C7F00(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CDD58);
  v2 = (_QWORD *)sub_2384DFD60();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2384C17C4(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_2384C8054(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2384C8064(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CDD50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2384C80A4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CDD58);
  v38 = a2;
  v6 = sub_2384DFD54();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_2384DFE38();
    sub_2384DFA54();
    result = sub_2384DFE50();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

id sub_2384C83B0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CDD58);
  v2 = *v0;
  v3 = sub_2384DFD48();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t dispatch thunk of static CoreAnalyticsEvent.eventName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CoreAnalyticsEvent.send()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_2384C8574(void *a1, void *a2)
{
  sub_2384C8C88(a1, a2);
}

void sub_2384C85D8()
{
  uint64_t v0;
  _BYTE v1[64];

  sub_2384C97F8(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

unint64_t sub_2384C861C()
{
  sub_2384DFCA0();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  return 0xD000000000000019;
}

ATXIntentComparator __swiftcall ATXIntentComparator.init()()
{
  return (ATXIntentComparator)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id ATXIntentComparator.init()()
{
  objc_super v1;

  v1.super_class = (Class)ATXIntentComparator;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t sub_2384C8B94(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2384DFC58();
  return sub_2384C8BC4(a1, v2);
}

unint64_t sub_2384C8BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_2384C9F04(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B836690](v9, a1);
      sub_2384C9808((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_2384C8C88(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  int64_t v67;
  unint64_t v68;
  int64_t v69;
  void *v70;
  unint64_t v71;
  char v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  int64_t v90;
  id v91;
  id v92;
  _BYTE v93[32];
  _OWORD v94[2];
  __int128 v95;
  __int128 v96;
  _OWORD v97[2];
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  void *v103;

  v4 = objc_msgSend(a1, sel_atx_intentType);
  v5 = sub_2384DFA30();
  v7 = v6;

  v8 = objc_msgSend(a2, sel_atx_intentType);
  v9 = sub_2384DFA30();
  v11 = v10;

  if (v5 == v9 && v7 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      sub_2384C9888();
      swift_allocError();
      v15 = v14;
      v16 = objc_msgSend(a1, sel_atx_intentType);
      v17 = sub_2384DFA30();
      v19 = v18;

      v20 = objc_msgSend(a2, sel_atx_intentType);
      v21 = sub_2384DFA30();
      v23 = v22;

      *(_QWORD *)v15 = v17;
      *(_QWORD *)(v15 + 8) = v19;
      *(_QWORD *)(v15 + 16) = v21;
      *(_QWORD *)(v15 + 24) = v23;
      *(_BYTE *)(v15 + 56) = 0;
LABEL_17:
      swift_willThrow();
      return;
    }
  }
  objc_opt_self();
  v24 = swift_dynamicCastObjCClass();
  if (!v24 || (v25 = (void *)v24, objc_opt_self(), (v26 = swift_dynamicCastObjCClass()) == 0))
  {
    v33 = objc_msgSend(a1, sel_atx_nonNilParametersByName);
    if (!v33)
      goto LABEL_85;
    v34 = v33;
    v35 = objc_msgSend(a2, sel_atx_nonNilParametersByName);
    if (v35)
    {
      v36 = v35;
      if (objc_msgSend(v34, sel_atx_isFuzzyMatch_, v35))
      {

        return;
      }
      sub_2384C9888();
      swift_allocError();
      *(_QWORD *)v37 = v34;
      *(_QWORD *)(v37 + 8) = v36;
      *(_BYTE *)(v37 + 56) = 5;
      goto LABEL_17;
    }
LABEL_86:
    __break(1u);
    return;
  }
  v27 = (void *)v26;
  v91 = a1;
  v92 = a2;
  v28 = objc_msgSend(v25, sel_launchId);
  if (v28)
  {
    v29 = v28;
    v30 = sub_2384DFA30();
    v32 = v31;

  }
  else
  {
    v30 = 0;
    v32 = 0;
  }
  v38 = objc_msgSend(v27, sel_launchId);
  if (!v38)
  {
    if (!v32)
      goto LABEL_37;
    goto LABEL_28;
  }
  v39 = v38;
  v40 = sub_2384DFA30();
  v42 = v41;

  if (!v32)
  {
    if (!v42)
      goto LABEL_37;
    goto LABEL_28;
  }
  if (!v42)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  if (v30 == v40 && v32 == v42)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  v55 = sub_2384DFDD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) == 0)
  {
LABEL_29:
    sub_2384C9888();
    swift_allocError();
    v44 = v43;
    v45 = objc_msgSend(v25, sel_launchId);
    if (v45)
    {
      v46 = v45;
      v47 = sub_2384DFA30();
      v49 = v48;

    }
    else
    {
      v47 = 0;
      v49 = 0;
    }
    v50 = objc_msgSend(v27, sel_launchId);
    if (v50)
    {
      v51 = v50;
      v52 = sub_2384DFA30();
      v54 = v53;

    }
    else
    {
      v52 = 0;
      v54 = 0;
    }
    *(_QWORD *)v44 = v47;
    *(_QWORD *)(v44 + 8) = v49;
    *(_QWORD *)(v44 + 16) = v52;
    *(_QWORD *)(v44 + 24) = v54;
    *(_BYTE *)(v44 + 56) = 1;
    swift_willThrow();

    goto LABEL_70;
  }
LABEL_37:
  v56 = objc_msgSend(v25, sel_atx_comparableParameters);
  v57 = sub_2384DFA0C();

  v58 = objc_msgSend(v27, sel_atx_comparableParameters);
  v59 = sub_2384DFA0C();

  if (*(_QWORD *)(v57 + 16) != *(_QWORD *)(v59 + 16))
  {
    sub_2384C9888();
    swift_allocError();
    v75 = v74;
    v76 = sub_2384DFA00();
    swift_bridgeObjectRelease();
    v77 = sub_2384DFA00();
    swift_bridgeObjectRelease();
    *(_QWORD *)v75 = v76;
    *(_QWORD *)(v75 + 8) = v77;
    *(_BYTE *)(v75 + 56) = 2;
    swift_willThrow();

LABEL_70:
    return;
  }
  v60 = 0;
  v61 = *(_QWORD *)(v57 + 64);
  v89 = v57 + 64;
  v62 = 1 << *(_BYTE *)(v57 + 32);
  v63 = -1;
  if (v62 < 64)
    v63 = ~(-1 << v62);
  v64 = v63 & v61;
  v90 = (unint64_t)(v62 + 63) >> 6;
  if ((v63 & v61) == 0)
    goto LABEL_43;
LABEL_41:
  v65 = __clz(__rbit64(v64));
  v64 &= v64 - 1;
  v66 = v65 | (v60 << 6);
LABEL_42:
  sub_2384C9F04(*(_QWORD *)(v57 + 48) + 40 * v66, (uint64_t)&v95);
  sub_2384C32A0(*(_QWORD *)(v57 + 56) + 32 * v66, (uint64_t)v97 + 8);
  while (1)
  {
    sub_2384C9F40((uint64_t)&v95, (uint64_t)&v99, &qword_2542CDD60);
    if (!*((_QWORD *)&v100 + 1))
    {
      swift_bridgeObjectRelease();

      goto LABEL_82;
    }
    v95 = v99;
    v96 = v100;
    *(_QWORD *)&v97[0] = v101;
    sub_2384C8054(&v102, v94);
    sub_2384C32A0((uint64_t)v94, (uint64_t)v93);
    sub_2384B97C8(0, (unint64_t *)&qword_2542CDD68);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_2384C9888();
      swift_allocError();
      v86 = v85;
      sub_2384C32A0((uint64_t)v94, v85);
      v87 = 3;
LABEL_78:
      *(_BYTE *)(v86 + 56) = v87;
      swift_willThrow();

      goto LABEL_81;
    }
    v70 = v103;
    if (!*(_QWORD *)(v59 + 16))
      break;
    v71 = sub_2384C8B94((uint64_t)&v95);
    if ((v72 & 1) == 0)
      break;
    sub_2384C32A0(*(_QWORD *)(v59 + 56) + 32 * v71, (uint64_t)v93);
    if ((swift_dynamicCast() & 1) == 0)
      break;
    v73 = v103;
    if (!objc_msgSend(v70, sel_isEqual_, v103))
    {
      swift_bridgeObjectRelease();
      sub_2384C9888();
      swift_allocError();
      v86 = v88;
      sub_2384C9F04((uint64_t)&v95, v88);
      *(_QWORD *)(v86 + 40) = v70;
      *(_QWORD *)(v86 + 48) = v73;
      v87 = 4;
      goto LABEL_78;
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v94);
    sub_2384C9808((uint64_t)&v95);
    if (v64)
      goto LABEL_41;
LABEL_43:
    v67 = v60 + 1;
    if (__OFADD__(v60, 1))
    {
      __break(1u);
      goto LABEL_84;
    }
    if (v67 < v90)
    {
      v68 = *(_QWORD *)(v89 + 8 * v67);
      if (v68)
        goto LABEL_46;
      v69 = v60 + 2;
      ++v60;
      if (v67 + 1 < v90)
      {
        v68 = *(_QWORD *)(v89 + 8 * v69);
        if (v68)
          goto LABEL_49;
        v60 = v67 + 1;
        if (v67 + 2 < v90)
        {
          v68 = *(_QWORD *)(v89 + 8 * (v67 + 2));
          if (v68)
          {
            v67 += 2;
            goto LABEL_46;
          }
          v69 = v67 + 3;
          v60 = v67 + 2;
          if (v67 + 3 < v90)
          {
            v68 = *(_QWORD *)(v89 + 8 * v69);
            if (v68)
            {
LABEL_49:
              v67 = v69;
LABEL_46:
              v64 = (v68 - 1) & v68;
              v66 = __clz(__rbit64(v68)) + (v67 << 6);
              v60 = v67;
              goto LABEL_42;
            }
            while (1)
            {
              v67 = v69 + 1;
              if (__OFADD__(v69, 1))
                break;
              if (v67 >= v90)
              {
                v60 = v90 - 1;
                goto LABEL_60;
              }
              v68 = *(_QWORD *)(v89 + 8 * v67);
              ++v69;
              if (v68)
                goto LABEL_46;
            }
LABEL_84:
            __break(1u);
LABEL_85:
            __break(1u);
            goto LABEL_86;
          }
        }
      }
    }
LABEL_60:
    v64 = 0;
    v98 = 0;
    memset(v97, 0, sizeof(v97));
    v95 = 0u;
    v96 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2384C9888();
  swift_allocError();
  v79 = v78;
  v80 = objc_msgSend(v27, sel_serializedParameters);
  v81 = sub_2384DFA0C();

  if (*(_QWORD *)(v81 + 16))
  {
    v82 = sub_2384C8B94((uint64_t)&v95);
    v83 = v92;
    if ((v84 & 1) != 0)
    {
      sub_2384C32A0(*(_QWORD *)(v81 + 56) + 32 * v82, v79);
    }
    else
    {
      *(_OWORD *)v79 = 0u;
      *(_OWORD *)(v79 + 16) = 0u;
    }
  }
  else
  {
    *(_OWORD *)v79 = 0u;
    *(_OWORD *)(v79 + 16) = 0u;
    v83 = v92;
  }
  swift_bridgeObjectRelease();
  *(_BYTE *)(v79 + 56) = 3;
  swift_willThrow();

LABEL_81:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v94);
  sub_2384C9808((uint64_t)&v95);
LABEL_82:
  swift_release();
}

uint64_t sub_2384C95DC(void *a1, void *a2)
{
  uint64_t v4;

  v4 = sub_2384DF9B8();
  MEMORY[0x24BDAC7A8](v4);
  sub_2384C8C88(a1, a2);
  return 1;
}

uint64_t sub_2384C97F8(uint64_t a1, uint64_t a2)
{
  return _s5ErrorOwcp(a2, a1);
}

uint64_t sub_2384C9808(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2384C983C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2384C9888()
{
  unint64_t result;

  result = qword_2542CD618;
  if (!qword_2542CD618)
  {
    result = MEMORY[0x23B836E94](&unk_2384E179C, &_s5ErrorON);
    atomic_store(result, (unint64_t *)&qword_2542CD618);
  }
  return result;
}

void _s5ErrorOwxx(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 56);
  while (2)
  {
    switch(v2)
    {
      case 0:
      case 1:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      case 2:
      case 5:

        v3 = *(void **)(a1 + 8);
        goto LABEL_10;
      case 3:
        if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
          __swift_destroy_boxed_opaque_existential_0(a1);
        return;
      case 4:
        __swift_destroy_boxed_opaque_existential_0(a1);

        v3 = *(void **)(a1 + 48);
LABEL_10:

        return;
      default:
        v2 = *(_DWORD *)a1 + 6;
        continue;
    }
  }
}

uint64_t _s5ErrorOwcp(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  __int128 v16;

  v4 = *(unsigned __int8 *)(a2 + 56);
  while (2)
  {
    switch(v4)
    {
      case 0:
        v5 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v5;
        v6 = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 24) = v6;
        *(_BYTE *)(a1 + 56) = 0;
        goto LABEL_8;
      case 1:
        v11 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v11;
        v12 = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 24) = v12;
        *(_BYTE *)(a1 + 56) = 1;
LABEL_8:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return a1;
      case 2:
        v7 = *(void **)a2;
        v8 = *(void **)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v8;
        v9 = 2;
        goto LABEL_12;
      case 3:
        v13 = *(_QWORD *)(a2 + 24);
        if (v13 < 0xFFFFFFFF)
        {
          v16 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v16;
        }
        else
        {
          *(_QWORD *)(a1 + 24) = v13;
          (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1, a2);
        }
        *(_BYTE *)(a1 + 56) = 3;
        return a1;
      case 4:
        v10 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v10;
        (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1, a2);
        v7 = *(void **)(a2 + 40);
        v8 = *(void **)(a2 + 48);
        *(_QWORD *)(a1 + 40) = v7;
        *(_QWORD *)(a1 + 48) = v8;
        v9 = 4;
        goto LABEL_12;
      case 5:
        v7 = *(void **)a2;
        v8 = *(void **)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v8;
        v9 = 5;
LABEL_12:
        *(_BYTE *)(a1 + 56) = v9;
        v14 = v7;
        v15 = v8;
        return a1;
      default:
        v4 = *(_DWORD *)a2 + 6;
        continue;
    }
  }
}

uint64_t _s5ErrorOwca(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  __int128 v14;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    while (2)
    {
      switch(v4)
      {
        case 0:
        case 1:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_11;
        case 2:
        case 5:

          v5 = *(void **)(a1 + 8);
          goto LABEL_10;
        case 3:
          if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
            __swift_destroy_boxed_opaque_existential_0(a1);
          goto LABEL_11;
        case 4:
          __swift_destroy_boxed_opaque_existential_0(a1);

          v5 = *(void **)(a1 + 48);
LABEL_10:

LABEL_11:
          v6 = *(unsigned __int8 *)(a2 + 56);
          while (2)
          {
            switch(v6)
            {
              case 0:
                *(_QWORD *)a1 = *(_QWORD *)a2;
                *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
                *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
                *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
                *(_BYTE *)(a1 + 56) = 0;
                goto LABEL_18;
              case 1:
                *(_QWORD *)a1 = *(_QWORD *)a2;
                *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
                *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
                *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
                *(_BYTE *)(a1 + 56) = 1;
LABEL_18:
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                return a1;
              case 2:
                v7 = *(void **)a2;
                *(_QWORD *)a1 = *(_QWORD *)a2;
                v8 = *(void **)(a2 + 8);
                *(_QWORD *)(a1 + 8) = v8;
                v9 = 2;
                goto LABEL_22;
              case 3:
                v11 = *(_QWORD *)(a2 + 24);
                if (v11 < 0xFFFFFFFF)
                {
                  v14 = *(_OWORD *)(a2 + 16);
                  *(_OWORD *)a1 = *(_OWORD *)a2;
                  *(_OWORD *)(a1 + 16) = v14;
                }
                else
                {
                  *(_QWORD *)(a1 + 24) = v11;
                  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
                }
                *(_BYTE *)(a1 + 56) = 3;
                return a1;
              case 4:
                v10 = *(_QWORD *)(a2 + 24);
                *(_QWORD *)(a1 + 24) = v10;
                *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
                (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1, a2);
                v7 = *(void **)(a2 + 40);
                *(_QWORD *)(a1 + 40) = v7;
                v8 = *(void **)(a2 + 48);
                *(_QWORD *)(a1 + 48) = v8;
                v9 = 4;
                goto LABEL_22;
              case 5:
                v7 = *(void **)a2;
                *(_QWORD *)a1 = *(_QWORD *)a2;
                v8 = *(void **)(a2 + 8);
                *(_QWORD *)(a1 + 8) = v8;
                v9 = 5;
LABEL_22:
                *(_BYTE *)(a1 + 56) = v9;
                v12 = v7;
                v13 = v8;
                break;
              default:
                v6 = *(_DWORD *)a2 + 6;
                continue;
            }
            break;
          }
          break;
        default:
          v4 = *(_DWORD *)a1 + 6;
          continue;
      }
      break;
    }
  }
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s5ErrorOwta(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  int v6;
  char v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    while (2)
    {
      switch(v4)
      {
        case 0:
        case 1:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_11;
        case 2:
        case 5:

          v5 = *(void **)(a1 + 8);
          goto LABEL_10;
        case 3:
          if (*(_QWORD *)(a1 + 24) >= 0xFFFFFFFFuLL)
            __swift_destroy_boxed_opaque_existential_0(a1);
          goto LABEL_11;
        case 4:
          __swift_destroy_boxed_opaque_existential_0(a1);

          v5 = *(void **)(a1 + 48);
LABEL_10:

LABEL_11:
          v6 = *(unsigned __int8 *)(a2 + 56);
          while (2)
          {
            switch(v6)
            {
              case 0:
                v7 = 0;
                v8 = *(_OWORD *)(a2 + 16);
                *(_OWORD *)a1 = *(_OWORD *)a2;
                *(_OWORD *)(a1 + 16) = v8;
                break;
              case 1:
                v10 = *(_OWORD *)(a2 + 16);
                *(_OWORD *)a1 = *(_OWORD *)a2;
                *(_OWORD *)(a1 + 16) = v10;
                v7 = 1;
                break;
              case 2:
                *(_OWORD *)a1 = *(_OWORD *)a2;
                v7 = 2;
                break;
              case 3:
                v11 = *(_OWORD *)(a2 + 16);
                *(_OWORD *)a1 = *(_OWORD *)a2;
                *(_OWORD *)(a1 + 16) = v11;
                v7 = 3;
                break;
              case 4:
                v9 = *(_OWORD *)(a2 + 16);
                *(_OWORD *)a1 = *(_OWORD *)a2;
                *(_OWORD *)(a1 + 16) = v9;
                *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
                *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
                v7 = 4;
                break;
              case 5:
                *(_OWORD *)a1 = *(_OWORD *)a2;
                v7 = 5;
                break;
              default:
                v6 = *(_DWORD *)a2 + 6;
                continue;
            }
            break;
          }
          *(_BYTE *)(a1 + 56) = v7;
          break;
        default:
          v4 = *(_DWORD *)a1 + 6;
          continue;
      }
      break;
    }
  }
  return a1;
}

uint64_t _s5ErrorOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 >= 6)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t _s5ErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_OWORD *)(result + 41) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = -(char)a2;
  }
  return result;
}

uint64_t sub_2384C9E98(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 56);
  if (result >= 6)
    return (*(_DWORD *)a1 + 6);
  return result;
}

uint64_t sub_2384C9EB4(uint64_t result, unsigned int a2)
{
  if (a2 > 5)
  {
    *(_QWORD *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 6;
    LOBYTE(a2) = 6;
  }
  *(_BYTE *)(result + 56) = a2;
  return result;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

uint64_t type metadata accessor for ATXIntentComparator(uint64_t a1)
{
  return sub_2384B97C8(a1, qword_256913F30);
}

uint64_t sub_2384C9F04(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2384C9F40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2384C9F84()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 112);
}

uint64_t sub_2384C9FB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 112) = a1;
  return result;
}

uint64_t (*sub_2384C9FF0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t AmbientConfigurationManager.Error.errorDescription.getter()
{
  sub_2384DFCA0();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  return 0xD000000000000010;
}

_QWORD *sub_2384CA0A8()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for AmbientConfigurationManager();
  v0 = swift_allocObject();
  result = sub_2384CA36C();
  qword_2542CE148 = v0;
  return result;
}

uint64_t *sub_2384CA0E0()
{
  if (qword_2542CE0B0 != -1)
    swift_once();
  return &qword_2542CE148;
}

uint64_t static AmbientConfigurationManager.shared.getter()
{
  if (qword_2542CE0B0 != -1)
    swift_once();
  return swift_retain();
}

id sub_2384CA160()
{
  return objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
}

id sub_2384CA18C()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_2384DFA18();
  v2 = objc_msgSend(v0, sel_appPredictionDirectoryFile_, v1);

  sub_2384DFA30();
  v3 = objc_msgSend((id)objc_opt_self(), "log");
  v4 = objc_allocWithZone(MEMORY[0x24BE04290]);
  v5 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_2384DFA18();
  v7 = objc_msgSend(v4, sel_initWithCacheFilePath_loggingHandle_debugName_, v5, v3, v6);

  return v7;
}

id sub_2384CA2B0()
{
  return objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
}

uint64_t sub_2384CA2DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_2384DF958();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2384DF94C();
  v4 = sub_2384DF940();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

_QWORD *sub_2384CA36C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = *v0;
  v3 = sub_2384DF958();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v1[14] = 0;
  v1[15] = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
  v1[16] = 0;
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_2384DFA18();
  v9 = objc_msgSend(v7, sel_appPredictionDirectoryFile_, v8);

  sub_2384DFA30();
  v10 = objc_msgSend((id)objc_opt_self(), "log");
  v11 = objc_allocWithZone(MEMORY[0x24BE04290]);
  v12 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_2384DFA18();
  v14 = objc_msgSend(v11, sel_initWithCacheFilePath_loggingHandle_debugName_, v12, v10, v13);

  v1[17] = v14;
  v1[18] = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_2384DF94C();
  v15 = sub_2384DF940();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v1[19] = v15;
  v1[20] = v17;
  v18 = (void *)v1[18];
  v19 = swift_allocObject();
  swift_weakInit();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = v2;
  aBlock[4] = sub_2384CD534;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384CB008;
  aBlock[3] = &block_descriptor_36_0;
  v21 = _Block_copy(aBlock);
  v22 = v18;
  swift_release();
  v23 = objc_msgSend(v22, sel_addObserverForName_object_queue_usingBlock_, CFSTR("com.apple.proactive.contextualengine.AmbientConfigurationManager.cacheDidUpdate"), 0, 0, v21);
  _Block_release(v21);
  swift_unknownObjectRelease();

  return v1;
}

uint64_t sub_2384CA64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t Strong;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54[3];
  uint64_t v55[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2384DF9B8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v51 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v51 - v16;
  sub_2384DF8A4();
  if (!v55[3])
  {
    sub_2384CD53C((uint64_t)v55, &qword_256912730);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v25 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v17, v25, v8);
    v26 = sub_2384DF9AC();
    v27 = sub_2384DFB38();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v55[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v30 = sub_2384DFEB0();
      v54[0] = sub_2384C1184(v30, v31, v55);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2384B0000, v26, v27, "%s: ambientConfigDidUpdateNotification had no sender identifier", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v29, -1, -1);
      MEMORY[0x23B836F18](v28, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v17, v8);
  }
  v18 = (uint8_t *)(a2 + 16);
  v20 = v54[0];
  v19 = v54[1];
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v51 = v18;
    v52 = a3;
    v22 = v8;
    v24 = *(_QWORD *)(Strong + 152);
    v23 = *(_QWORD *)(Strong + 160);
    swift_bridgeObjectRetain();
    swift_release();
    if (v20 == v24 && v19 == v23)
    {
      swift_bridgeObjectRelease_n();
      v8 = v22;
LABEL_14:
      v34 = sub_2384C78FC();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v34, v8);
      v35 = sub_2384DF9AC();
      v36 = sub_2384DFB44();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        v38 = swift_slowAlloc();
        v54[0] = v38;
        *(_DWORD *)v37 = 136315138;
        v39 = sub_2384DFEB0();
        v53 = sub_2384C1184(v39, v40, v54);
        sub_2384DFC04();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2384B0000, v35, v36, "%s: ignoring ambientConfigDidUpdateNotification from self", v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B836F18](v38, -1, -1);
        MEMORY[0x23B836F18](v37, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    v33 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = v22;
    if ((v33 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v41 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v41, v8);
  v42 = sub_2384DF9AC();
  v43 = sub_2384DFB44();
  if (os_log_type_enabled(v42, v43))
  {
    v52 = v8;
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v54[0] = v45;
    *(_DWORD *)v44 = 136315138;
    v51 = v44 + 4;
    v46 = sub_2384DFEB0();
    v53 = sub_2384C1184(v46, v47, v54);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v42, v43, "%s: received ambient config did update notification", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v45, -1, -1);
    MEMORY[0x23B836F18](v44, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v52);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  }
  v48 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v7, 1, 1, v48);
  v49 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v50 = (_QWORD *)swift_allocObject();
  v50[2] = 0;
  v50[3] = 0;
  v50[4] = v49;
  sub_2384CAD68((uint64_t)v7, (uint64_t)&unk_256912C30, (uint64_t)v50);
  return swift_release();
}

uint64_t sub_2384CAC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = a4;
  return swift_task_switch();
}

uint64_t sub_2384CAC88()
{
  uint64_t v0;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
    return swift_task_switch();
  **(_BYTE **)(v0 + 40) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384CAD08()
{
  sub_2384CB0AC();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2384CAD4C()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384CAD68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2384DFAF0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2384DFAE4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2384CD53C(a1, &qword_2542CD5A0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2384DFAD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912C48);
  return swift_task_create();
}

uint64_t sub_2384CAEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2384DFAF0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2384DFAE4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2384CD53C(a1, &qword_2542CD5A0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2384DFAD8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2384CB008(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_2384DF8B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_2384DF898();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2384CB0AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[2];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2384DF9B8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v36 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v36 - v11;
  sub_2384CBC6C();
  v14 = v13;
  v15 = *(_QWORD *)(v1 + 128);
  if (v13)
  {
    if (v15)
    {
      swift_bridgeObjectRetain();
      v16 = swift_bridgeObjectRetain();
      v17 = sub_2384CCEA0(v16, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
      {
        swift_bridgeObjectRelease();
LABEL_6:
        v18 = sub_2384C78FC();
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, v18, v5);
        v19 = sub_2384DF9AC();
        v20 = sub_2384DFB44();
        if (os_log_type_enabled(v19, v20))
        {
          v21 = swift_slowAlloc();
          v22 = swift_slowAlloc();
          v40[0] = v22;
          *(_DWORD *)v21 = 136315394;
          v23 = sub_2384DFEB0();
          v39 = sub_2384C1184(v23, v24, v40);
          sub_2384DFC04();
          swift_bridgeObjectRelease();
          *(_WORD *)(v21 + 12) = 2080;
          v39 = sub_2384C1184(0xD000000000000010, 0x80000002384E3DB0, v40);
          sub_2384DFC04();
          _os_log_impl(&dword_2384B0000, v19, v20, "%s: %s: stacks from cache unchanged, not notifying observers", (uint8_t *)v21, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x23B836F18](v22, -1, -1);
          MEMORY[0x23B836F18](v21, -1, -1);
        }

        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
      }
    }
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  *(_QWORD *)(v1 + 128) = v14;
  swift_bridgeObjectRelease();
  v26 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v26, v5);
  v27 = sub_2384DF9AC();
  v28 = sub_2384DFB44();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = swift_slowAlloc();
    v37 = swift_slowAlloc();
    v40[0] = v37;
    *(_DWORD *)v29 = 136315394;
    v38 = v5;
    v30 = sub_2384DFEB0();
    v39 = sub_2384C1184(v30, v31, v40);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    v39 = sub_2384C1184(0xD000000000000010, 0x80000002384E3DB0, v40);
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v27, v28, "%s: %s: read new stacks from cache, notifying observers", (uint8_t *)v29, 0x16u);
    v32 = v37;
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v32, -1, -1);
    MEMORY[0x23B836F18](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v38);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  }
  v33 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v4, 1, 1, v33);
  v34 = sub_2384CC4F0();
  v35 = (_QWORD *)swift_allocObject();
  v35[2] = v1;
  v35[3] = v34;
  v35[4] = v1;
  swift_retain_n();
  sub_2384CAEBC((uint64_t)v4, (uint64_t)&unk_256912BE8, (uint64_t)v35);
  return swift_release();
}

uint64_t sub_2384CB6E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = a1;
  swift_retain();
  swift_unknownObjectRetain();
  sub_2384CAEBC((uint64_t)v5, (uint64_t)&unk_256912BB0, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_2384CB7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_2384CB7C8()
{
  uint64_t v0;

  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + 120), sel_addObject_, *(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384CB804()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2384CB838()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2384B8814;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch();
}

uint64_t sub_2384CB898()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;

  v3 = *(_QWORD *)(v0 + 128);
  if (v3)
  {
    v2 = *(_QWORD *)(v0 + 128);
    if (!(v3 >> 62))
      goto LABEL_3;
  }
  else
  {
    sub_2384CBC6C();
    if (v1)
      return v2;
    v2 = v12;
    *(_QWORD *)(v0 + 128) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (!v2)
      return v2;
    swift_bridgeObjectRetain();
    if (!(v2 >> 62))
    {
LABEL_3:
      v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain_n();
      if (v4)
        goto LABEL_4;
LABEL_20:
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v4 = sub_2384DFD3C();
  result = swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_20;
LABEL_4:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x23B8366E4](i, v2);
      else
        v9 = *(id *)(v2 + 8 * i + 32);
      v8 = v9;
      v10 = objc_msgSend(v9, sel_topWidgetIdentifier);
      if (v10)
      {
        v7 = v8;
        v8 = v10;
      }
      else
      {
        sub_2384CBFF8(v8);
        if (v11)
        {
          v7 = (void *)sub_2384DFA18();
          swift_bridgeObjectRelease();
        }
        else
        {
          v7 = 0;
        }
        objc_msgSend(v8, sel_setTopWidgetIdentifier_, v7);
      }

    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

void sub_2384CBA44(unint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v1[16]
    || (swift_bridgeObjectRetain(),
        v6 = swift_bridgeObjectRetain(),
        v7 = sub_2384CCEA0(v6, a1),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v7 & 1) == 0))
  {
    v1[16] = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v8 = (void *)v1[17];
    sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
    v9 = (void *)sub_2384DFA84();
    v18[0] = 0;
    LODWORD(v8) = objc_msgSend(v8, sel_storeSecureCodedObject_error_, v9, v18);

    v10 = v18[0];
    if ((_DWORD)v8)
    {
      v11 = sub_2384DFAF0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
      v12 = sub_2384CC4F0();
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = v1;
      v13[3] = v12;
      v13[4] = v1;
      swift_retain_n();
      v14 = v10;
      sub_2384CAEBC((uint64_t)v5, (uint64_t)&unk_256912BD0, (uint64_t)v13);
      swift_release();
      v15 = (void *)v1[18];
      v16 = (void *)sub_2384DFA18();
      objc_msgSend(v15, sel_postNotificationName_object_userInfo_options_, CFSTR("com.apple.proactive.contextualengine.AmbientConfigurationManager.cacheDidUpdate"), v16, 0, 0);

    }
    else
    {
      v17 = v18[0];
      sub_2384DF8F8();

      swift_willThrow();
    }
  }
}

void sub_2384CBC6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  sub_2384B97C8(0, (unint64_t *)&unk_2542CD5E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD610);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2384E0E70;
  v1 = sub_2384B97C8(0, (unint64_t *)&qword_2542CD5F0);
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CD600);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
  *(_QWORD *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CD5A8);
  *(_QWORD *)(v0 + 64) = v2;
  MEMORY[0x23B8365DC](v0);
  v3 = 0;
  sub_2384DFB08();
  __break(1u);
}

uint64_t sub_2384CBEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

void sub_2384CBED4()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + 120), sel_allObjects);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912BF8);
  v2 = sub_2384DFA90();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_10;
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        v5 = (void *)MEMORY[0x23B8366E4](i, v2);
      }
      else
      {
        v5 = *(void **)(v2 + 8 * i + 32);
        swift_unknownObjectRetain();
      }
      objc_msgSend(v5, sel_ambientConfigurationManagerCacheDidUpdate);
      swift_unknownObjectRelease();
    }
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_2384CBFF8(void *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  char *v47;
  char *v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  void *v51;
  char *v52;
  uint64_t aBlock;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD *v58;

  v50 = *v1;
  v51 = a1;
  v2 = sub_2384DF97C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2384DF988();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912C00);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v47 = (char *)&v47 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v47 - v15;
  v17 = sub_2384DF934();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v52 = (char *)&v47 - v22;
  sub_2384DF970();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCF220], v2);
  sub_2384DF928();
  sub_2384DF964();
  v49 = *(void (**)(char *, uint64_t))(v18 + 8);
  v49(v21, v17);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_2384CD53C((uint64_t)v16, &qword_256912C00);
    return 0;
  }
  else
  {
    v24 = v52;
    v25 = v16;
    v26 = v17;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v52, v25, v17);
    v27 = swift_allocObject();
    sub_2384B97C8(0, &qword_256912C08);
    *(_QWORD *)(v27 + 24) = 0;
    *(_QWORD *)(v27 + 16) = 0;
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v29 = (uint64_t)v47;
    v28(v47, 1, 1, v26);
    v30 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    v31 = (uint64_t)v48;
    v30(v48, v24, v26);
    v28((char *)v31, 0, 1, v26);
    v32 = sub_2384CC5B8(v29, v31, 0, 0, 1);
    v33 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
    swift_unknownObjectRelease();
    v34 = objc_msgSend(v33, sel_Domino);
    swift_unknownObjectRelease();
    v35 = objc_msgSend(v34, sel_StackRotation);
    swift_unknownObjectRelease();
    v36 = objc_msgSend(v35, sel_publisherWithOptions_, v32);

    v37 = swift_allocObject();
    v38 = v50;
    *(_QWORD *)(v37 + 16) = v50;
    v57 = sub_2384CD400;
    v58 = (_QWORD *)v37;
    v39 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v54 = 1107296256;
    v55 = sub_2384B6BD4;
    v56 = &block_descriptor_1;
    v40 = _Block_copy(&aBlock);
    swift_release();
    v41 = (_QWORD *)swift_allocObject();
    v42 = v51;
    v41[2] = v51;
    v41[3] = v27;
    v41[4] = v38;
    v57 = sub_2384CD44C;
    v58 = v41;
    aBlock = v39;
    v54 = 1107296256;
    v55 = sub_2384CCD4C;
    v56 = &block_descriptor_22_0;
    v43 = _Block_copy(&aBlock);
    v44 = v42;
    swift_retain();
    swift_release();
    v45 = objc_msgSend(v36, sel_sinkWithCompletion_shouldContinue_, v40, v43);
    _Block_release(v43);
    _Block_release(v40);

    v49(v52, v26);
    swift_beginAccess();
    v23 = *(_QWORD *)(v27 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  return v23;
}

unint64_t sub_2384CC4F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256912BC8;
  if (!qword_256912BC8)
  {
    v1 = type metadata accessor for AmbientConfigurationManager();
    result = MEMORY[0x23B836E94](&protocol conformance descriptor for AmbientConfigurationManager, v1);
    atomic_store(result, (unint64_t *)&qword_256912BC8);
  }
  return result;
}

uint64_t type metadata accessor for AmbientConfigurationManager()
{
  return objc_opt_self();
}

uint64_t sub_2384CC558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2384B8814;
  v3[2] = v2;
  return swift_task_switch();
}

id sub_2384CC5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  id v15;

  v10 = sub_2384DF934();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v10) != 1)
  {
    v13 = (void *)sub_2384DF91C();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_2384DF91C();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

id sub_2384CC6C8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id result;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = sub_2384DF9B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_error);
  if (result)
  {
    v7 = result;
    v8 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = v7;
    v10 = sub_2384DF9AC();
    v11 = sub_2384DFB38();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v22 = v20;
      *(_DWORD *)v12 = 136315650;
      v13 = sub_2384DFEB0();
      v21 = sub_2384C1184(v13, v14, &v22);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      v21 = sub_2384C1184(0xD000000000000031, 0x80000002384E3E00, &v22);
      sub_2384DFC04();
      *(_WORD *)(v12 + 22) = 2112;
      v15 = v9;
      v16 = _swift_stdlib_bridgeErrorToNSError();
      v21 = v16;
      sub_2384DFC04();
      v17 = v19;
      *v19 = v16;

      _os_log_impl(&dword_2384B0000, v10, v11, "%s.%s: error reading stack rotation stream: %@", (uint8_t *)v12, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v17, -1, -1);
      v18 = v20;
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v18, -1, -1);
      MEMORY[0x23B836F18](v12, -1, -1);

    }
    else
    {

    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_2384CC970(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v8 = sub_2384DF9B8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(a1, sel_eventBody);
  if (!v12)
    return 1;
  v13 = v12;
  v14 = objc_msgSend(v12, sel_stackId);
  if (!v14)
  {
LABEL_9:

    return 1;
  }
  v15 = v14;
  v42 = a4;
  v16 = sub_2384DFA30();
  v18 = v17;

  v19 = objc_msgSend(a2, sel_identifier);
  v20 = sub_2384DFA30();
  v22 = v21;

  if (v16 == v20 && v18 == v22)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
  }
  v26 = objc_msgSend(v13, sel_widget);
  v27 = v26;
  v41 = v16;
  if (!v26)
    goto LABEL_16;
  v28 = objc_msgSend(v26, sel_uniqueId);

  if (!v28)
  {
    v27 = 0;
LABEL_16:
    v30 = 0;
    goto LABEL_17;
  }
  v27 = (void *)sub_2384DFA30();
  v30 = v29;

LABEL_17:
  swift_beginAccess();
  *(_QWORD *)(a3 + 16) = v27;
  *(_QWORD *)(a3 + 24) = v30;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(_QWORD *)(a3 + 24))
  {
    swift_bridgeObjectRelease();

  }
  else
  {
    v31 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v31, v8);
    swift_bridgeObjectRetain();
    v32 = sub_2384DF9AC();
    v33 = sub_2384DFB38();
    v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v44 = v40;
      *(_DWORD *)v35 = 136315650;
      HIDWORD(v39) = v34;
      v36 = sub_2384DFEB0();
      v43 = sub_2384C1184(v36, v37, &v44);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      v43 = sub_2384C1184(0xD000000000000031, 0x80000002384E3E00, &v44);
      sub_2384DFC04();
      *(_WORD *)(v35 + 22) = 2080;
      swift_bridgeObjectRetain();
      v43 = sub_2384C1184(v41, v18, &v44);
      sub_2384DFC04();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2384B0000, v32, BYTE4(v39), "%s.%s: no topWidgetIdentifier found in stack rotation event with id: %s", (uint8_t *)v35, 0x20u);
      v38 = v40;
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v38, -1, -1);
      MEMORY[0x23B836F18](v35, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return 0;
}

uint64_t sub_2384CCD4C(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

id *AmbientConfigurationManager.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AmbientConfigurationManager.__deallocating_deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t AmbientConfigurationManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2384CCE30()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2384CCE3C()
{
  if (qword_2542CE0B0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_2384CCE7C()
{
  type metadata accessor for AmbientConfigurationManager();
  return sub_2384DFC70();
}

id sub_2384CCEA0(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x23B8366E4](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x23B8366E4](0, v2);
LABEL_21:
    v14 = v13;
    sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
    v15 = sub_2384DFBEC();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x23B8366E4](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x23B8366E4](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_2384DFBEC();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_2384DFBEC();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

unint64_t sub_2384CD198()
{
  unint64_t result;

  result = qword_256912BD8;
  if (!qword_256912BD8)
  {
    result = MEMORY[0x23B836E94](&protocol conformance descriptor for AmbientConfigurationManager.Error, &type metadata for AmbientConfigurationManager.Error);
    atomic_store(result, (unint64_t *)&qword_256912BD8);
  }
  return result;
}

uint64_t method lookup function for AmbientConfigurationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AmbientConfigurationManager.register(observer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AmbientConfigurationManager.readStacks()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AmbientConfigurationManager.write(stacks:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

_QWORD *initializeBufferWithCopyOfBuffer for AmbientConfigurationManager.Error(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AmbientConfigurationManager.Error()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AmbientConfigurationManager.Error(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for AmbientConfigurationManager.Error(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AmbientConfigurationManager.Error(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientConfigurationManager.Error(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AmbientConfigurationManager.Error()
{
  return &type metadata for AmbientConfigurationManager.Error;
}

uint64_t sub_2384CD36C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2384B8064;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_2384CD3CC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2384CD3F0()
{
  return swift_deallocObject();
}

id sub_2384CD400(void *a1)
{
  return sub_2384CC6C8(a1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2384CD420()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384CD44C(void *a1)
{
  uint64_t v1;

  return sub_2384CC970(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2384CD458()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384CD47C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8814;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256912C10 + dword_256912C10))(a1, v4);
}

uint64_t sub_2384CD4EC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2384CD510()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384CD534(uint64_t a1)
{
  uint64_t v1;

  return sub_2384CA64C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2384CD53C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384CD5A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8814;
  v5[5] = a1;
  v5[6] = v4;
  return swift_task_switch();
}

uint64_t sub_2384CD60C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_2384CD674;
  return v5(v2 + 32);
}

uint64_t sub_2384CD674()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_2384CD6C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8064;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256912C38 + dword_256912C38))(a1, v4);
}

uint64_t sub_2384CD74C()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t ATXSpotlightSuggestions.scores.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_2384CD7A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  void *v4;

  sub_2384B97C8(0, a4);
  swift_bridgeObjectRetain();
  v4 = (void *)sub_2384DFA84();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t ATXSpotlightSuggestions.topics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATXSpotlightSuggestions.sections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATXSpotlightSuggestions.createSections(fromServerResults:)()
{
  return MEMORY[0x24BEE4AF8];
}

void __swiftcall ATXSpotlightSuggestions.init()(ATXSpotlightSuggestions *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id ATXSpotlightSuggestions.init()()
{
  uint64_t v0;
  uint64_t v1;
  objc_super v3;

  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + OBJC_IVAR___ATXSpotlightSuggestions_scores) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + OBJC_IVAR___ATXSpotlightSuggestions_topics) = v1;
  *(_QWORD *)(v0 + OBJC_IVAR___ATXSpotlightSuggestions_sections) = v1;
  v3.super_class = (Class)ATXSpotlightSuggestions;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for ATXSpotlightSuggestions(uint64_t a1)
{
  return sub_2384B97C8(a1, (unint64_t *)&unk_2569140C0);
}

void *sub_2384CD9B4()
{
  return &unk_250A2DE60;
}

unint64_t disableAmbientRotationSuppressionDefaultsKey.getter()
{
  return 0xD000000000000021;
}

void *sub_2384CD9DC()
{
  return &unk_250A2DE70;
}

unint64_t static AmbientDebugRotation.defaultsKey.getter()
{
  return 0xD000000000000014;
}

void *sub_2384CDA04()
{
  return &unk_250A2DE80;
}

unint64_t static AmbientDebugRotation.notificationName.getter()
{
  return 0xD000000000000039;
}

uint64_t AmbientDebugRotation.extensionBundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AmbientDebugRotation.kind.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AmbientDebugRotation.stackIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AmbientDebugRotation.allowsNewWidget.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

void __swiftcall AmbientDebugRotation.init(extensionBundleIdentifier:kind:stackIdentifier:allowsNewWidget:)(ContextualSuggestionClient::AmbientDebugRotation *__return_ptr retstr, Swift::String extensionBundleIdentifier, Swift::String kind, Swift::String stackIdentifier, Swift::Bool allowsNewWidget)
{
  retstr->extensionBundleIdentifier = extensionBundleIdentifier;
  retstr->kind = kind;
  retstr->stackIdentifier = stackIdentifier;
  retstr->allowsNewWidget = allowsNewWidget;
}

BOOL sub_2384CDACC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2384CDAE0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2384CDB14 + 4 * byte_2384E19B0[*v0]))(0xD000000000000019, 0x80000002384E3FC0);
}

uint64_t sub_2384CDB14()
{
  return 1684957547;
}

uint64_t sub_2384CDB24()
{
  return 0x6564496B63617473;
}

uint64_t sub_2384CDB48()
{
  return 0x654E73776F6C6C61;
}

uint64_t sub_2384CDB6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384CE518(a1, a2);
  *a3 = result;
  return result;
}

void sub_2384CDB90(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2384CDB9C()
{
  sub_2384CDDB0();
  return sub_2384DFE98();
}

uint64_t sub_2384CDBC4()
{
  sub_2384CDDB0();
  return sub_2384DFEA4();
}

uint64_t AmbientDebugRotation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];
  int v16;
  char v17;
  char v18;
  char v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912C80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  v15[2] = *(_QWORD *)(v1 + 24);
  v15[3] = v8;
  v9 = *(_QWORD *)(v1 + 32);
  v15[0] = *(_QWORD *)(v1 + 40);
  v15[1] = v9;
  v16 = *(unsigned __int8 *)(v1 + 48);
  v10 = a1[3];
  v11 = a1;
  v13 = v12;
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_2384CDDB0();
  sub_2384DFE8C();
  v20 = 0;
  sub_2384DFDB4();
  if (!v2)
  {
    v19 = 1;
    sub_2384DFDB4();
    v18 = 2;
    sub_2384DFDB4();
    v17 = 3;
    sub_2384DFDC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v13);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2384CDDB0()
{
  unint64_t result;

  result = qword_2569140D0[0];
  if (!qword_2569140D0[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E1B18, &type metadata for AmbientDebugRotation.CodingKeys);
    atomic_store(result, qword_2569140D0);
  }
  return result;
}

uint64_t AmbientDebugRotation.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912C88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2384CDDB0();
  sub_2384DFE80();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v29 = 0;
  v9 = sub_2384DFD90();
  v11 = v10;
  v24 = v9;
  v28 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_2384DFD90();
  v25 = v13;
  v23 = v12;
  v27 = 2;
  swift_bridgeObjectRetain();
  v21 = sub_2384DFD90();
  v22 = v14;
  v26 = 3;
  swift_bridgeObjectRetain();
  v16 = sub_2384DFD9C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v16 & 1;
  v18 = v25;
  *(_QWORD *)a2 = v24;
  *(_QWORD *)(a2 + 8) = v11;
  v19 = v22;
  *(_QWORD *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v18;
  *(_QWORD *)(a2 + 32) = v21;
  *(_QWORD *)(a2 + 40) = v19;
  *(_BYTE *)(a2 + 48) = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2384CE090@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AmbientDebugRotation.init(from:)(a1, a2);
}

uint64_t sub_2384CE0A4(_QWORD *a1)
{
  return AmbientDebugRotation.encode(to:)(a1);
}

uint64_t destroy for AmbientDebugRotation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AmbientDebugRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AmbientDebugRotation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for AmbientDebugRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AmbientDebugRotation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientDebugRotation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AmbientDebugRotation()
{
  return &type metadata for AmbientDebugRotation;
}

uint64_t getEnumTagSinglePayload for AmbientDebugRotation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientDebugRotation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2384CE3B8 + 4 * byte_2384E19B9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2384CE3EC + 4 * byte_2384E19B4[v4]))();
}

uint64_t sub_2384CE3EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384CE3F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384CE3FCLL);
  return result;
}

uint64_t sub_2384CE408(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384CE410);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2384CE414(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384CE41C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2384CE428(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AmbientDebugRotation.CodingKeys()
{
  return &type metadata for AmbientDebugRotation.CodingKeys;
}

unint64_t sub_2384CE444()
{
  unint64_t result;

  result = qword_2569142E0[0];
  if (!qword_2569142E0[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E1AF0, &type metadata for AmbientDebugRotation.CodingKeys);
    atomic_store(result, qword_2569142E0);
  }
  return result;
}

unint64_t sub_2384CE48C()
{
  unint64_t result;

  result = qword_2569143F0;
  if (!qword_2569143F0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1A60, &type metadata for AmbientDebugRotation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569143F0);
  }
  return result;
}

unint64_t sub_2384CE4D4()
{
  unint64_t result;

  result = qword_2569143F8[0];
  if (!qword_2569143F8[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E1A88, &type metadata for AmbientDebugRotation.CodingKeys);
    atomic_store(result, qword_2569143F8);
  }
  return result;
}

uint64_t sub_2384CE518(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000019 && a2 == 0x80000002384E3FC0 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6564496B63617473 && a2 == 0xEF7265696669746ELL || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x654E73776F6C6C61 && a2 == 0xEF74656764695777)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

void *sub_2384CE704()
{
  return &unk_250A2DF40;
}

unint64_t contextualEngineInternalMachServiceName.getter()
{
  return 0xD000000000000031;
}

uint64_t contextualEngineInternalInterface.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569173B0);
  sub_2384B97C8(0, (unint64_t *)&unk_2542CD5E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD610);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2384E1B70;
  v1 = sub_2384B97C8(0, &qword_256912C90);
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569130B0);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = sub_2384B97C8(0, (unint64_t *)&qword_256912EF0);
  *(_QWORD *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569130A0);
  *(_QWORD *)(v0 + 64) = v2;
  v3 = type metadata accessor for ContextualSuggestionSnapshot();
  *(_QWORD *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_256912C98);
  *(_QWORD *)(v0 + 96) = v3;
  MEMORY[0x23B8365DC](v0);
  result = sub_2384DFB08();
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

uint64_t sub_2384CEB08()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ATXWidgetStackSuggestion_stackIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_2384CEB50()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget);
  v2 = v1;
  return v1;
}

uint64_t sub_2384CEBF0()
{
  return swift_bridgeObjectRetain();
}

id sub_2384CEC00(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  sub_2384B97C8(0, (unint64_t *)&qword_256912A30);
  sub_2384C2DE8();
  v6 = (void *)sub_2384DFAFC();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithStackIdentifier_topWidget_suggestedWidgets_, v5, a3, v6);

  return v7;
}

id sub_2384CECCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  objc_super v7;

  v5 = (_QWORD *)(v4 + OBJC_IVAR___ATXWidgetStackSuggestion_stackIdentifier);
  *v5 = a1;
  v5[1] = a2;
  *(_QWORD *)(v4 + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget) = a3;
  *(_QWORD *)(v4 + OBJC_IVAR___ATXWidgetStackSuggestion_suggestedWidgets) = a4;
  v7.super_class = (Class)ATXWidgetStackSuggestion;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t ATXWidgetStackSuggestion.description.getter()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  v1 = v0;
  sub_2384DFCA0();
  sub_2384DFA60();
  v2 = objc_msgSend(v0, sel_stackIdentifier);
  sub_2384DFA30();

  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  objc_msgSend(v1, sel_topWidget);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912CB8);
  sub_2384DFA3C();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  v3 = objc_msgSend(v1, sel_suggestedWidgets);
  sub_2384B97C8(0, (unint64_t *)&qword_256912A30);
  sub_2384C2DE8();
  sub_2384DFB14();

  sub_2384DFB20();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  return 0;
}

void *sub_2384CF0BC()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_topWidget);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_identifier);

    v2 = (void *)sub_2384DFA30();
  }
  return v2;
}

void __swiftcall ATXWidgetStackSuggestion.init()(ATXWidgetStackSuggestion *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void ATXWidgetStackSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for ATXWidgetStackSuggestion(uint64_t a1)
{
  return sub_2384B97C8(a1, qword_256914480);
}

uint64_t sub_2384CF228()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_2384CF26C()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2384CF2B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_2384CF2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_2384CF368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  v6 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind];
  *(_QWORD *)v6 = a3;
  *((_QWORD *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for WidgetPersonality();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t type metadata accessor for WidgetPersonality()
{
  return objc_opt_self();
}

uint64_t sub_2384CF3D8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier + 8);
  v5 = objc_msgSend(a1, sel_extensionBundleIdentifier);
  v6 = sub_2384DFA30();
  v8 = v7;

  if (v4 == v6 && v3 == v8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    v11 = 0;
    if ((v10 & 1) == 0)
      return v11 & 1;
  }
  v13 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind);
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind + 8);
  v14 = objc_msgSend(a1, sel_kind);
  v15 = sub_2384DFA30();
  v17 = v16;

  if (v13 == v15 && v12 == v17)
    v11 = 1;
  else
    v11 = sub_2384DFDD8();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

id sub_2384CF558()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_2384CF578()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2384CF5D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WidgetPersonality();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2384CF644(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746E65746E69;
  else
    return 0x696669746E656469;
}

uint64_t sub_2384CF67C()
{
  char *v0;

  return sub_2384CF644(*v0);
}

uint64_t sub_2384CF684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384CFC94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2384CF6A8()
{
  sub_2384CFF54();
  return sub_2384DFE98();
}

uint64_t sub_2384CF6D0()
{
  sub_2384CFF54();
  return sub_2384DFEA4();
}

id ContextualIntentSuggestion.intent.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent);
}

id ContextualIntentSuggestion.__allocating_init(identifier:intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent] = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

id ContextualIntentSuggestion.init(identifier:intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent) = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

uint64_t sub_2384CF768()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent), sel_launchId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2384DFA30();

  return v3;
}

uint64_t ContextualIntentSuggestion.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextualIntentSuggestion.init(coder:)(a1);
}

uint64_t ContextualIntentSuggestion.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v27;

  v3 = sub_2384DF9B8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  sub_2384B97C8(0, (unint64_t *)&qword_256912EF0);
  v10 = v1;
  v11 = sub_2384DFBBC();
  if (!v11)
  {

    v20 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v20, v3);
    v21 = sub_2384DF9AC();
    v22 = sub_2384DFB38();
    if (!os_log_type_enabled(v21, v22))
    {
      v7 = v9;
      goto LABEL_10;
    }
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2384B0000, v21, v22, "coder missing identifier", v23, 2u);
    v7 = v9;
    goto LABEL_8;
  }
  v12 = (void *)v11;
  v13 = sub_2384DFA30();
  v15 = v14;

  sub_2384B97C8(0, &qword_256912D48);
  v16 = sub_2384DFBBC();
  if (!v16)
  {
    swift_bridgeObjectRelease();

    v24 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
    v21 = sub_2384DF9AC();
    v25 = sub_2384DFB38();
    if (!os_log_type_enabled(v21, v25))
    {
LABEL_10:

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return 0;
    }
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2384B0000, v21, v25, "coder missing intent", v23, 2u);
LABEL_8:
    MEMORY[0x23B836F18](v23, -1, -1);
    goto LABEL_10;
  }
  v17 = v16;
  ObjectType = swift_getObjectType();

  v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(ObjectType + 136))(v13, v15, v17);
  swift_deallocPartialClassInstance();
  return v19;
}

void sub_2384CFAF8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  sub_2384B8D0C(a1);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent);
  v4 = (id)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

}

void ContextualIntentSuggestion.__allocating_init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ContextualIntentSuggestion.init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2384CFC44()
{
  uint64_t v0;

}

id ContextualIntentSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualIntentSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2384CFC94(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65746E69 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t type metadata accessor for ContextualIntentSuggestion()
{
  return objc_opt_self();
}

unint64_t sub_2384CFDA0()
{
  unint64_t result;

  result = qword_256912D50;
  if (!qword_256912D50)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1BDC, &type metadata for ContextualIntentSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912D50);
  }
  return result;
}

unint64_t sub_2384CFDE8()
{
  unint64_t result;

  result = qword_256912D58;
  if (!qword_256912D58)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1CBC, &type metadata for ContextualIntentSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912D58);
  }
  return result;
}

unint64_t sub_2384CFE30()
{
  unint64_t result;

  result = qword_256912D60;
  if (!qword_256912D60)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1C94, &type metadata for ContextualIntentSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912D60);
  }
  return result;
}

uint64_t method lookup function for ContextualIntentSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualIntentSuggestion.__allocating_init(identifier:intent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t storeEnumTagSinglePayload for ContextualIntentSuggestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2384CFED4 + 4 * byte_2384E1BD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2384CFF08 + 4 * asc_2384E1BD0[v4]))();
}

uint64_t sub_2384CFF08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384CFF10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384CFF18);
  return result;
}

uint64_t sub_2384CFF24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384CFF2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2384CFF30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384CFF38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextualIntentSuggestion.CodingKeys()
{
  return &type metadata for ContextualIntentSuggestion.CodingKeys;
}

unint64_t sub_2384CFF54()
{
  unint64_t result;

  result = qword_256912D68;
  if (!qword_256912D68)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1C44, &type metadata for ContextualIntentSuggestion.CodingKeys);
    atomic_store(result, &qword_256912D68);
  }
  return result;
}

void *sub_2384CFF98()
{
  return &unk_250A2E018;
}

unint64_t userDidExperienceAmbientDefaultsKey.getter()
{
  return 0xD000000000000018;
}

id sub_2384CFFC0()
{
  return sub_2384CFFE4((SEL *)&selRef_ViewAppearance);
}

id sub_2384CFFCC()
{
  return sub_2384CFFE4((SEL *)&selRef_StackRotation);
}

id sub_2384CFFD8()
{
  return sub_2384CFFE4((SEL *)&selRef_WidgetTap);
}

id sub_2384CFFE4(SEL *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  v3 = objc_msgSend(v2, sel_Domino);
  swift_unknownObjectRelease();
  v4 = objc_msgSend(v3, *a1);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_2384D0080()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[2];

  v0 = sub_2384DFB50();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v0);
  v2 = sub_2384DF9F4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_2384DFB5C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2384B97C8(0, (unint64_t *)&qword_256912A70);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v3);
  sub_2384DF9E8();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A78, v1, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A80);
  sub_2384C62D0(&qword_256912A88, &qword_256912A80);
  sub_2384DFC28();
  return sub_2384DFB80();
}

id sub_2384D023C()
{
  id v0;
  void *v1;
  id v2;

  sub_2384DFA30();
  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  return v2;
}

uint64_t sub_2384D02BC()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_2384D02F0();
  return v0;
}

_QWORD *sub_2384D02F0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[2];

  v1 = v0;
  v2 = sub_2384DFB50();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_2384DF9F4();
  MEMORY[0x24BDAC7A8](v3);
  v22[0] = sub_2384DFB5C();
  v4 = *(_QWORD *)(v22[0] - 8);
  MEMORY[0x24BDAC7A8](v22[0]);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  v8 = objc_msgSend(v7, sel_Domino);
  swift_unknownObjectRelease();
  v9 = objc_msgSend(v8, sel_ViewAppearance);
  swift_unknownObjectRelease();
  v0[2] = v9;
  v10 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  v11 = objc_msgSend(v10, sel_Domino);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v11, sel_StackRotation);
  swift_unknownObjectRelease();
  v0[3] = v12;
  v13 = objc_msgSend((id)BiomeLibrary(), sel_SpringBoard);
  swift_unknownObjectRelease();
  v14 = objc_msgSend(v13, sel_Domino);
  swift_unknownObjectRelease();
  v15 = objc_msgSend(v14, sel_WidgetTap);
  swift_unknownObjectRelease();
  v0[4] = v15;
  sub_2384B97C8(0, (unint64_t *)&qword_256912A70);
  (*(void (**)(char *, _QWORD, _QWORD))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v22[0]);
  sub_2384DF9E8();
  v22[1] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A78, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A80);
  sub_2384C62D0(&qword_256912A88, &qword_256912A80);
  sub_2384DFC28();
  v0[5] = sub_2384DFB80();
  sub_2384DFA30();
  v16 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v17 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithSuiteName_, v17);

  v1[6] = v18;
  if (v18)
  {
    v19 = v18;
    v20 = (void *)sub_2384DFA18();
    objc_msgSend(v19, sel_removeObjectForKey_, v20);

  }
  return v1;
}

uint64_t sub_2384D06CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = sub_2384DF9D0();
  v13[0] = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2384DF9F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void **)(v0 + 48);
  if (v8)
  {
    v9 = (void *)sub_2384DFACC();
    v10 = (void *)sub_2384DFA18();
    objc_msgSend(v8, sel_setValue_forKey_, v9, v10);

  }
  aBlock[4] = sub_2384D08E8;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384C448C;
  aBlock[3] = &block_descriptor_2;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_2384DF9E8();
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v7, v3, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v13[0] + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return swift_release();
}

void sub_2384D08E8()
{
  sub_2384D0ADC();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_2384D0908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2384DF9D0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2384DF9F4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(_QWORD *)(v1 + 40);
  aBlock[4] = sub_2384D0AD4;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384C448C;
  aBlock[3] = &block_descriptor_3;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_2384DF9E8();
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_2384D0AD4()
{
  sub_2384D0ADC();
}

void sub_2384D0ADC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v3 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  sub_2384B97C8(0, &qword_256912C78);
  v1 = (void *)sub_2384DFBD4();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C7B8]), sel_initWithStarting_, v1);

  objc_msgSend(v3, sel_sendEvent_, v2);
}

uint64_t sub_2384D0B84(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = v1;
  v8 = a1;
  swift_retain();
  sub_2384CAEBC((uint64_t)v5, (uint64_t)&unk_256912D78, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_2384D0C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[9] = a4;
  v5[10] = a5;
  v6 = sub_2384DF9D0();
  v5[11] = v6;
  v5[12] = *(_QWORD *)(v6 - 8);
  v5[13] = swift_task_alloc();
  v7 = sub_2384DF9F4();
  v5[14] = v7;
  v5[15] = *(_QWORD *)(v7 - 8);
  v5[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384D0CD4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = sub_2384CA0E0();
  v2 = *v1;
  *(_QWORD *)(v0 + 136) = *v1;
  *(_QWORD *)(v0 + 144) = *(_QWORD *)(*(_QWORD *)v2 + 240);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2384D0D28()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 152) = (*(uint64_t (**)(void))(v0 + 144))();
  *(_QWORD *)(v0 + 160) = 0;
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2384D0D94()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 152);
  if (!v1)
  {
    v3 = 0;
    goto LABEL_5;
  }
  v2 = *(id *)(v0 + 72);
  v3 = sub_2384D1DC0(v1, v2);
  swift_bridgeObjectRelease();

  if (!v3)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v4 = objc_msgSend(v3, sel_identifier);

  v3 = (void *)sub_2384DFA30();
  v6 = v5;

LABEL_6:
  v7 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 104);
  v17 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 96);
  v10 = *(void **)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = v10;
  v12[4] = v3;
  v12[5] = v6;
  *(_QWORD *)(v0 + 48) = sub_2384D2508;
  *(_QWORD *)(v0 + 56) = v12;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_2384C448C;
  *(_QWORD *)(v0 + 40) = &block_descriptor_25;
  v13 = _Block_copy((const void *)(v0 + 16));
  v14 = v10;
  swift_retain();
  sub_2384DF9E8();
  *(_QWORD *)(v0 + 64) = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v7, v8, v13);
  _Block_release(v13);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v7, v18);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384D0FB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[16];
  v2 = v0[13];
  v11 = v0[15];
  v12 = v0[14];
  v3 = v0[11];
  v10 = v0[12];
  v5 = (void *)v0[9];
  v4 = v0[10];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;
  v6[4] = 0;
  v6[5] = 0;
  v0[6] = sub_2384D2508;
  v0[7] = v6;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_2384C448C;
  v0[5] = &block_descriptor_25;
  v7 = _Block_copy(v0 + 2);
  v8 = v5;
  swift_retain();
  sub_2384DF9E8();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v1, v2, v7);
  _Block_release(v7);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v12);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_2384D115C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384D1190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8064;
  return sub_2384D0C4C((uint64_t)v4, v5, v6, v2, v3);
}

id sub_2384D11E0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42[4];

  v42[3] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_2384DF9B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_chsWidget);
  v7 = objc_msgSend(v6, sel_intentReference);

  if (v7)
  {
    v8 = objc_msgSend(v7, sel_intent);

    if (v8)
    {
      v9 = (void *)objc_opt_self();
      v42[0] = 0;
      v10 = objc_msgSend(v9, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, 1, v42);
      v11 = v42[0];
      if (v10)
      {
        v7 = (id)sub_2384DF910();
        v13 = v12;

        goto LABEL_11;
      }
      v14 = v11;
      v15 = sub_2384DF8F8();

      swift_willThrow();
      v16 = sub_2384C78FC();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
      v17 = sub_2384DF9AC();
      v18 = sub_2384DFB38();
      if (os_log_type_enabled(v17, v18))
      {
        v40 = (void *)v15;
        v19 = (uint8_t *)swift_slowAlloc();
        v39 = (void *)swift_slowAlloc();
        v42[0] = v39;
        *(_DWORD *)v19 = 136315138;
        v38 = v19 + 4;
        v20 = sub_2384DFEB0();
        v41 = sub_2384C1184(v20, v21, (uint64_t *)v42);
        sub_2384DFC04();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2384B0000, v17, v18, "%s: error archiving widget intent", v19, 0xCu);
        v22 = v39;
        swift_arrayDestroy();
        MEMORY[0x23B836F18](v22, -1, -1);
        MEMORY[0x23B836F18](v19, -1, -1);
        v23 = v40;
      }
      else
      {
        v23 = (void *)v15;
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    v7 = 0;
  }
  v13 = 0xF000000000000000;
LABEL_11:
  v24 = objc_msgSend(a1, sel_identifier);
  if (!v24)
  {
    sub_2384DFA30();
    v24 = (id)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  v25 = objc_msgSend(a1, sel_chsWidget);
  v26 = objc_msgSend(v25, sel_extensionIdentity);

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
  sub_2384DF9A0();
  v27 = (void *)sub_2384DFA18();
  swift_endAccess();
  swift_bridgeObjectRelease();

  v28 = objc_msgSend(a1, sel_chsWidget);
  v29 = objc_msgSend(v28, sel_kind);

  if (!v29)
  {
    sub_2384DFA30();
    v29 = (id)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  v30 = objc_msgSend(a1, sel_chsWidget);
  v31 = (char *)objc_msgSend(v30, sel_extensionIdentity);

  v32 = &v31[*MEMORY[0x24BE16900]];
  swift_beginAccess();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A38);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v32, 1, v33))
  {
    swift_endAccess();

    v34 = 0;
  }
  else
  {
    sub_2384DF9A0();
    swift_endAccess();

    v34 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  if (v13 >> 60 == 15)
  {
    v35 = 0;
  }
  else
  {
    sub_2384D23FC((uint64_t)v7, v13);
    v35 = (void *)sub_2384DF904();
    sub_2384D23E8((uint64_t)v7, v13);
  }
  v36 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUniqueId_extensionBundleId_kind_containerBundleId_intent_, v24, v27, v29, v34, v35);

  sub_2384D23E8((uint64_t)v7, v13);
  return v36;
}

uint64_t sub_2384D1718(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2384DF9B8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2384B97C8(0, &qword_256912D80);
  v13 = a2;
  v14 = sub_2384D11E0(v13);
  v15 = v14;
  v16 = 0;
  v17 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_12;
    case 1:
      v17 = 0;
      v40 = 1;
      break;
    case 2:
      v17 = 0;
      v40 = 2;
      break;
    case 3:
      v17 = 0;
      v40 = 3;
      break;
    case 4:
      v17 = 0;
      v40 = 4;
      break;
    case 5:
      v17 = 0;
      v40 = 5;
      break;
    case 6:
      v17 = 0;
      v40 = 6;
      break;
    case 7:
      v17 = 0;
      v40 = 7;
      break;
    case 8:
      v17 = 0;
      v40 = 8;
      break;
    case 9:
      v17 = 0;
      v16 = 9;
LABEL_12:
      v40 = v16;
      break;
    case 10:
      v17 = 0;
      v40 = 10;
      break;
    default:
      v17 = 1;
      v40 = 0;
      v39 = v14;
      v18 = sub_2384C78FC();
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v18, v9);
      v19 = sub_2384DF9AC();
      v20 = v9;
      v21 = sub_2384DFB38();
      if (os_log_type_enabled(v19, v21))
      {
        v23 = swift_slowAlloc();
        v38 = a1;
        v24 = (uint8_t *)v23;
        v25 = swift_slowAlloc();
        v36 = v10;
        v37 = v20;
        v26 = v25;
        v42 = a3;
        v43 = v25;
        *(_DWORD *)v24 = 136315138;
        v35 = v24 + 4;
        type metadata accessor for ATXWidgetStackChangeReason(0);
        v27 = sub_2384DFA3C();
        v42 = sub_2384C1184(v27, v28, &v43);
        sub_2384DFC04();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2384B0000, v19, v21, "AmbientLogger: logging stack did change with unknown new reason: %s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B836F18](v26, -1, -1);
        v29 = v24;
        a1 = v38;
        MEMORY[0x23B836F18](v29, -1, -1);

        (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
      }
      v15 = v39;
      break;
  }
  v30 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v8, 1, 1, v30);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = 0;
  *(_QWORD *)(v31 + 32) = v41;
  *(_QWORD *)(v31 + 40) = v15;
  *(_QWORD *)(v31 + 48) = a1;
  *(_DWORD *)(v31 + 56) = v40;
  *(_BYTE *)(v31 + 60) = v17;
  *(_QWORD *)(v31 + 64) = v13;
  v32 = v13;
  swift_retain();
  v33 = a1;
  sub_2384CAEBC((uint64_t)v8, (uint64_t)&unk_256912D90, v31);
  return swift_release();
}

uint64_t sub_2384D1AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[9] = a4;
  v9 = sub_2384DF9D0();
  v8[14] = v9;
  v8[15] = *(_QWORD *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v10 = sub_2384DF9F4();
  v8[17] = v10;
  v8[18] = *(_QWORD *)(v10 - 8);
  v8[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384D1B78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = v0[19];
  v2 = v0[16];
  v16 = v0[18];
  v17 = v0[17];
  v3 = v0[14];
  v15 = v0[15];
  v5 = v0[12];
  v4 = (void *)v0[13];
  v7 = (void *)v0[10];
  v6 = (void *)v0[11];
  v8 = v0[9];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v7;
  *(_QWORD *)(v9 + 32) = v6;
  *(_DWORD *)(v9 + 40) = v5;
  *(_BYTE *)(v9 + 44) = BYTE4(v5) & 1;
  *(_QWORD *)(v9 + 48) = v4;
  v0[6] = sub_2384D2254;
  v0[7] = v9;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_2384C448C;
  v0[5] = &block_descriptor_14;
  v10 = _Block_copy(v0 + 2);
  swift_retain();
  v11 = v7;
  v12 = v6;
  v13 = v4;
  sub_2384DF9E8();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
  sub_2384C62D0(&qword_256912AA8, &qword_256912AA0);
  sub_2384DFC28();
  MEMORY[0x23B8365A0](0, v1, v2, v10);
  _Block_release(v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v1, v17);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

id *sub_2384D1D40()
{
  id *v0;

  return v0;
}

uint64_t sub_2384D1D7C()
{
  id *v0;

  return swift_deallocClassInstance();
}

void *sub_2384D1DC0(unint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  char v27;
  id v28;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;

  v2 = a1;
  if (a1 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    v3 = sub_2384DFD3C();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      v4 = 0;
      v5 = v2 & 0xC000000000000001;
      v30 = v2 + 32;
      v31 = v2 & 0xC000000000000001;
      v33 = v2;
      v32 = v3;
      do
      {
        if (v5)
        {
          v6 = (id)MEMORY[0x23B8366E4](v4, v2);
          v7 = __OFADD__(v4, 1);
          v8 = v4 + 1;
          if (v7)
          {
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
        }
        else
        {
          v6 = *(id *)(v30 + 8 * v4);
          v7 = __OFADD__(v4, 1);
          v8 = v4 + 1;
          if (v7)
            goto LABEL_32;
        }
        v35 = v6;
        v9 = objc_msgSend(v6, sel_widgets);
        sub_2384B97C8(0, (unint64_t *)&qword_256912A30);
        v2 = sub_2384DFA90();

        v34 = v8;
        if (v2 >> 62)
        {
          v28 = a2;
          swift_bridgeObjectRetain();
          v10 = sub_2384DFD3C();
          if (v10)
          {
LABEL_12:
            v36 = v2;
            v37 = v2 & 0xC000000000000001;
            v12 = 4;
            do
            {
              v13 = v12 - 4;
              if (v37)
              {
                v14 = (id)MEMORY[0x23B8366E4](v12 - 4, v2);
                v15 = v12 - 3;
                if (__OFADD__(v13, 1))
                  goto LABEL_31;
              }
              else
              {
                v14 = *(id *)(v2 + 8 * v12);
                v15 = v12 - 3;
                if (__OFADD__(v13, 1))
                {
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
              }
              v16 = v10;
              v17 = v14;
              v18 = objc_msgSend(v14, sel_identifier);
              v19 = sub_2384DFA30();
              v21 = v20;

              v22 = objc_msgSend(a2, sel_identifier);
              v23 = sub_2384DFA30();
              v25 = v24;

              v26 = v19 == v23 && v21 == v25;
              if (v26)
              {

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_30:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                return v35;
              }
              v27 = sub_2384DFDD8();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v27 & 1) != 0)
              {

                goto LABEL_30;
              }
              ++v12;
              v10 = v16;
              v26 = v15 == v16;
              v2 = v36;
            }
            while (!v26);
          }
        }
        else
        {
          v10 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
          v11 = a2;
          swift_bridgeObjectRetain();
          if (v10)
            goto LABEL_12;
        }

        swift_bridgeObjectRelease_n();
        v5 = v31;
        v2 = v33;
        v4 = v34;
      }
      while (v34 != v32);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2384D20C0()
{
  id *v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2384D2104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2384B8814;
  return sub_2384D1AE8((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

void type metadata accessor for ATXWidgetStackChangeReason(uint64_t a1)
{
  sub_2384D21D4(a1, &qword_256912D98);
}

uint64_t type metadata accessor for AmbientLogger()
{
  return objc_opt_self();
}

void type metadata accessor for BMSpringBoardDominoStackRotationReason(uint64_t a1)
{
  sub_2384D21D4(a1, (unint64_t *)&unk_256912DA0);
}

void sub_2384D21D4(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_2384D2218()
{
  id *v0;

  swift_release();

  return swift_deallocObject();
}

void sub_2384D2254()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unsigned int v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v1 = *(void **)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  v3 = *(_DWORD *)(v0 + 40);
  v4 = *(unsigned __int8 *)(v0 + 44);
  v5 = *(void **)(v0 + 48);
  v17 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + 24), sel_source);
  v6 = objc_msgSend(v2, sel_identifier);
  sub_2384DFA30();

  objc_msgSend(v5, sel_isSuggestedWidget);
  v7 = (void *)sub_2384DFACC();
  v8 = objc_msgSend(v5, sel_source);
  if (v8)
  {
    v9 = v8;
    sub_2384DFA30();
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }
  v12 = v1;
  v13 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v14 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  if (v4)
    v15 = 0;
  else
    v15 = v3;
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C7B0]), sel_initWithWidget_stackId_reason_newWidgetSuggestion_source_, v12, v13, v15, v7, v14);

  objc_msgSend(v17, sel_sendEvent_, v16);
}

uint64_t sub_2384D23E8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2384C3324(a1, a2);
  return a1;
}

uint64_t sub_2384D23FC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2384D2440()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384D2464(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2384B8064;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256912C10 + dword_256912C10))(a1, v4);
}

uint64_t sub_2384D24D4()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2384D2508()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v1 = (void *)v0[3];
  v2 = v0[5];
  v6 = objc_msgSend(*(id *)(v0[2] + 32), sel_source);
  sub_2384B97C8(0, &qword_256912D80);
  v3 = sub_2384D11E0(v1);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C7C8]), sel_initWithWidget_stackId_, v3, v4);

  objc_msgSend(v6, sel_sendEvent_, v5);
}

void *sub_2384D2608()
{
  return &unk_2384E1E28;
}

uint64_t static CHSWidgetFamilyMask.atx_systemSmall.getter()
{
  return 2;
}

void *sub_2384D261C()
{
  return &unk_2384E1E30;
}

uint64_t static CHSWidgetFamilyMask.atx_systemMedium.getter()
{
  return 4;
}

void *sub_2384D2630()
{
  return &unk_2384E1E38;
}

uint64_t static CHSWidgetFamilyMask.atx_systemLarge.getter()
{
  return 8;
}

void *sub_2384D2644()
{
  return &unk_2384E1E40;
}

uint64_t static CHSWidgetFamilyMask.atx_systemExtraLarge.getter()
{
  return 16;
}

void *sub_2384D2658()
{
  return &unk_2384E1E48;
}

void *sub_2384D2664()
{
  return &unk_2384E1E50;
}

void *sub_2384D2670()
{
  return &unk_2384E1E58;
}

uint64_t sub_2384D267C()
{
  return 3;
}

void *sub_2384D2684()
{
  return &unk_2384E1E60;
}

uint64_t sub_2384D2690()
{
  return 4;
}

void *sub_2384D2698()
{
  return &unk_2384E1E68;
}

void *sub_2384D26A4()
{
  return &unk_2384E1E70;
}

void *sub_2384D26B0()
{
  return &unk_2384E1E78;
}

BOOL sub_2384D26BC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2384D26CC()
{
  return sub_2384DFE44();
}

uint64_t sub_2384D26F0()
{
  sub_2384DFE38();
  sub_2384DFE44();
  return sub_2384DFE50();
}

uint64_t sub_2384D2734(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier];
  v3 = *(_QWORD *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_extensionBundleIdentifier + 8];
  v6 = *(_QWORD *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind];
  v5 = *(_QWORD *)&a1[OBJC_IVAR____TtC26ContextualSuggestionClient17WidgetPersonality_kind + 8];
  if (sub_2384DFA30() == v4 && v7 == v3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = sub_2384DFDD8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      goto LABEL_13;
  }
  v10 = (id)ATXSpecialWidgetKindSiriSuggestions();
  v11 = sub_2384DFA30();
  v13 = v12;

  if (v11 == v6 && v13 == v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v15 = sub_2384DFDD8();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
LABEL_15:
    v16 = (*(uint64_t (**)(_QWORD))(v1 + 80))(0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return v16;
  }
LABEL_13:
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 0;
}

void sub_2384D288C(char a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A20);
  MEMORY[0x24BDAC7A8](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
  MEMORY[0x24BDAC7A8](v4);
  v5 = objc_allocWithZone(v1);
  __asm { BR              X10 }
}

id sub_2384D294C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  sub_2384DFA30();
  v4 = (id)ATXSpecialWidgetKindSiriSuggestions();
  sub_2384DFA30();

  sub_2384DFBA4();
  sub_2384DF994();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A38);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  v6 = (void *)sub_2384DFB98();
  v7 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 - 96) = v2;
  *(_QWORD *)(v3 - 88) = v0;
  v8 = objc_msgSendSuper2((objc_super *)(v3 - 96), sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, v6, v7, 14, 0);

  return v8;
}

void sub_2384D2AE0(char a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A20);
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A28);
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

id sub_2384D2B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  sub_2384DFA30();
  v3 = (id)ATXSpecialWidgetKindSiriSuggestions();
  sub_2384DFA30();

  sub_2384DFBA4();
  sub_2384DF994();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912A38);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v1, 1, 1, v4);
  v5 = (void *)sub_2384DFB98();
  v6 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for SpecialWidgetDescriptor();
  *(_QWORD *)(v2 - 96) = v0;
  *(_QWORD *)(v2 - 88) = v7;
  v8 = objc_msgSendSuper2((objc_super *)(v2 - 96), sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, v5, v6, 14, 0);

  return v8;
}

id sub_2384D2D2C(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_2384D2D6C(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SpecialWidgetDescriptor();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_2384D2DFC(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithExtensionIdentity_, a1);

  return v3;
}

void sub_2384D2E3C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2384D2E98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v11;
  void *v12;
  id v13;

  v7 = v6;
  v11 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v12 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithExtensionIdentity_kind_supportedFamilies_intentType_, a1, v11, a4, v12);

  return v13;
}

void sub_2384D2F54()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2384D2FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  objc_class *v8;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = v7;
  v11 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (a7)
  {
    v13 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(objc_allocWithZone(v8), sel_initWithExtensionBundleIdentifier_kind_supportedFamilies_intentType_, v11, v12, a5, v13);

  return v14;
}

void sub_2384D3080()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2384D30D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  objc_class *v10;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = v9;
  v13 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v14 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (a9)
  {
    v16 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(objc_allocWithZone(v10), sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_supportedFamilies_intentType_, v13, v14, v15, a7, v16);

  return v17;
}

void sub_2384D31E4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2384D323C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  objc_class *v24;

  v15 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v16 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v18 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  if (a10)
  {
    v19 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
  }
  v20 = objc_allocWithZone(v24);
  v21 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v20, sel_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_displayName_intentType_supportedSizeClasses_widgetDescription_widgetVisibility_, v15, v16, v17, v18, v19, a11, v21, a14);

  return v22;
}

void sub_2384D33AC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2384D3404()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpecialWidgetDescriptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SpecialWidgetDescriptor()
{
  return objc_opt_self();
}

unint64_t sub_2384D3458()
{
  unint64_t result;

  result = qword_256912DB0;
  if (!qword_256912DB0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1E80, &type metadata for SpecialWidgetDescriptor.DescriptorType);
    atomic_store(result, (unint64_t *)&qword_256912DB0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SpecialWidgetDescriptor.DescriptorType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SpecialWidgetDescriptor.DescriptorType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2384D3578 + 4 * byte_2384E1E1F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2384D35AC + 4 * byte_2384E1E1A[v4]))();
}

uint64_t sub_2384D35AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D35B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D35BCLL);
  return result;
}

uint64_t sub_2384D35C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D35D0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2384D35D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D35DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SpecialWidgetDescriptor.DescriptorType()
{
  return &type metadata for SpecialWidgetDescriptor.DescriptorType;
}

const char *sub_2384D35F8()
{
  return "spotlight";
}

uint64_t static String.spotlight.getter()
{
  return 0x6867696C746F7073;
}

const char *sub_2384D3620()
{
  return "ambient";
}

uint64_t static String.ambient.getter()
{
  return 0x746E6569626D61;
}

uint64_t sub_2384D3648()
{
  return 7;
}

uint64_t sub_2384D3650(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2384D3688 + 4 * byte_2384E1F60[a1]))(0xD000000000000019, 0x80000002384E3FC0);
}

uint64_t sub_2384D3688()
{
  return 0x696669746E656469;
}

uint64_t sub_2384D36FC()
{
  unsigned __int8 *v0;

  return sub_2384D3650(*v0);
}

uint64_t sub_2384D3704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384D45FC(a1, a2);
  *a3 = result;
  return result;
}

void sub_2384D3728(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_2384D3734()
{
  sub_2384D4B08();
  return sub_2384DFE98();
}

uint64_t sub_2384D375C()
{
  sub_2384D4B08();
  return sub_2384DFEA4();
}

uint64_t ContextualWidgetSuggestion.extensionBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContextualWidgetSuggestion.kind.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
  swift_bridgeObjectRetain();
  return v1;
}

void *ContextualWidgetSuggestion.intent.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  v2 = v1;
  return v1;
}

void *ContextualWidgetSuggestion.scoreSpecification.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification);
  v2 = v1;
  return v1;
}

void *ContextualWidgetSuggestion.blendingClientModelSpecification.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0
                + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
  v2 = v1;
  return v1;
}

id ContextualWidgetSuggestion.__allocating_init(identifier:extensionBundleIdentifier:containerBundleIdentifier:kind:intent:scoreSpecification:blendingClientModelSpecification:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  objc_class *v11;
  char *v18;
  char *v19;
  char *v20;
  char *v21;

  v18 = (char *)objc_allocWithZone(v11);
  v19 = &v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier];
  *(_QWORD *)v19 = a3;
  *((_QWORD *)v19 + 1) = a4;
  v20 = &v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier];
  *(_QWORD *)v20 = a5;
  *((_QWORD *)v20 + 1) = a6;
  v21 = &v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind];
  *(_QWORD *)v21 = a7;
  *((_QWORD *)v21 + 1) = a8;
  *(_QWORD *)&v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent] = a9;
  *(_QWORD *)&v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification] = a10;
  *(_QWORD *)&v18[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification] = a11;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

id ContextualWidgetSuggestion.init(identifier:extensionBundleIdentifier:containerBundleIdentifier:kind:intent:scoreSpecification:blendingClientModelSpecification:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  v12 = (_QWORD *)(v11
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_extensionBundleIdentifier);
  *v12 = a3;
  v12[1] = a4;
  v13 = (_QWORD *)(v11
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier);
  *v13 = a5;
  v13[1] = a6;
  v14 = (_QWORD *)(v11 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_kind);
  *v14 = a7;
  v14[1] = a8;
  *(_QWORD *)(v11 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent) = a9;
  *(_QWORD *)(v11 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification) = a10;
  *(_QWORD *)(v11
            + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification) = a11;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

uint64_t _s26ContextualSuggestionClient0a6WidgetB0C25containerBundleIdentifierSSSgvg_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContextualWidgetSuggestion.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextualWidgetSuggestion.init(coder:)(a1);
}

uint64_t ContextualWidgetSuggestion.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ObjectType;
  uint64_t v38;
  uint64_t v39;
  os_log_type_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v3 = sub_2384DF9B8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v42 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v42 - v11;
  sub_2384B97C8(0, (unint64_t *)&qword_256912EF0);
  v13 = v1;
  v14 = sub_2384DFBBC();
  if (!v14)
  {

    v25 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, v25, v3);
    v26 = sub_2384DF9AC();
    v27 = sub_2384DFB38();
    if (!os_log_type_enabled(v26, v27))
    {
      v7 = v12;
      goto LABEL_19;
    }
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2384B0000, v26, v27, "coder missing identifier", v28, 2u);
    v7 = v12;
LABEL_18:
    MEMORY[0x23B836F18](v28, -1, -1);
    goto LABEL_19;
  }
  v15 = (void *)v14;
  v45 = sub_2384DFA30();
  v17 = v16;

  v18 = sub_2384DFBBC();
  if (!v18 || (v19 = (void *)v18, v46 = 0, v47 = 0, sub_2384DFA24(), v19, (v20 = v47) == 0))
  {

    swift_bridgeObjectRelease();
    v29 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v29, v3);
    v26 = sub_2384DF9AC();
    v30 = sub_2384DFB38();
    if (!os_log_type_enabled(v26, v30))
    {
      v7 = v10;
      goto LABEL_19;
    }
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2384B0000, v26, v30, "coder missing extensionBundleIdentifier", v28, 2u);
    v7 = v10;
    goto LABEL_18;
  }
  v21 = v46;
  v22 = sub_2384DFBBC();
  v44 = v21;
  if (v22)
  {
    v23 = (void *)v22;
    v46 = 0;
    v47 = 0;
    sub_2384DFA24();

    v24 = v47;
    v43 = v46;
  }
  else
  {
    v43 = 0;
    v24 = 0;
  }
  v31 = sub_2384DFBBC();
  if (!v31 || (v32 = (void *)v31, v46 = 0, v47 = 0, sub_2384DFA24(), v32, (v33 = v47) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v39 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v39, v3);
    v26 = sub_2384DF9AC();
    v40 = sub_2384DFB38();
    if (os_log_type_enabled(v26, v40))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_2384B0000, v26, v40, "coder missing kind", v28, 2u);
      goto LABEL_18;
    }
LABEL_19:

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v34 = v46;
  sub_2384B97C8(0, &qword_256912D48);
  v42 = sub_2384DFBBC();
  sub_2384B97C8(0, &qword_256912DE8);
  v35 = sub_2384DFBBC();
  sub_2384B97C8(0, &qword_256912DF0);
  v36 = sub_2384DFBBC();
  ObjectType = swift_getObjectType();

  v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(ObjectType + 176))(v45, v17, v44, v20, v43, v24, v34, v33, v42, v36, v35);
  swift_deallocPartialClassInstance();
  return v38;
}

void sub_2384D3F4C(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  sub_2384B8D0C(a1);
  v3 = (void *)sub_2384DFA18();
  v4 = (void *)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  if (*(_QWORD *)(v1
                 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_containerBundleIdentifier
                 + 8))
    v5 = sub_2384DFA18();
  else
    v5 = 0;
  v6 = (void *)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);
  swift_unknownObjectRelease();

  v7 = (void *)sub_2384DFA18();
  v8 = (void *)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  v10 = (void *)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification);
  v12 = (void *)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  v13 = *(_QWORD *)(v1
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
  v14 = (id)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);

}

uint64_t sub_2384D41F8()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;

  sub_2384DFCA0();
  sub_2384DFA60();
  swift_bridgeObjectRetain();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912DF8);
  sub_2384DFA3C();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  swift_bridgeObjectRetain();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  v1 = *(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912E00);
  sub_2384DFA3C();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  v2 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912E08);
  sub_2384DFA3C();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  v3 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912E10);
  sub_2384DFA3C();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384DFA60();
  return 0;
}

void ContextualWidgetSuggestion.__allocating_init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ContextualWidgetSuggestion.init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2384D44D0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification));
}

id ContextualWidgetSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualWidgetSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2384D45FC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000002384E3FC0 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000002384E46C0 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E65746E69 && a2 == 0xE600000000000000 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002384E46A0 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x80000002384E4670)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t type metadata accessor for ContextualWidgetSuggestion()
{
  return objc_opt_self();
}

unint64_t sub_2384D48B4()
{
  unint64_t result;

  result = qword_256912E18;
  if (!qword_256912E18)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1F74, &type metadata for ContextualWidgetSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E18);
  }
  return result;
}

unint64_t sub_2384D48FC()
{
  unint64_t result;

  result = qword_256912E20;
  if (!qword_256912E20)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2054, &type metadata for ContextualWidgetSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E20);
  }
  return result;
}

unint64_t sub_2384D4944()
{
  unint64_t result;

  result = qword_256912E28;
  if (!qword_256912E28)
  {
    result = MEMORY[0x23B836E94](&unk_2384E202C, &type metadata for ContextualWidgetSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E28);
  }
  return result;
}

uint64_t method lookup function for ContextualWidgetSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualWidgetSuggestion.__allocating_init(identifier:extensionBundleIdentifier:containerBundleIdentifier:kind:intent:scoreSpecification:blendingClientModelSpecification:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t getEnumTagSinglePayload for ContextualWidgetSuggestion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextualWidgetSuggestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_2384D4A88 + 4 * byte_2384E1F6C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2384D4ABC + 4 * byte_2384E1F67[v4]))();
}

uint64_t sub_2384D4ABC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D4AC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D4ACCLL);
  return result;
}

uint64_t sub_2384D4AD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D4AE0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2384D4AE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D4AEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextualWidgetSuggestion.CodingKeys()
{
  return &type metadata for ContextualWidgetSuggestion.CodingKeys;
}

unint64_t sub_2384D4B08()
{
  unint64_t result;

  result = qword_256912E30;
  if (!qword_256912E30)
  {
    result = MEMORY[0x23B836E94](&unk_2384E1FDC, &type metadata for ContextualWidgetSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E30);
  }
  return result;
}

uint64_t sub_2384D4B4C(uint64_t a1, uint64_t a2)
{
  return sub_2384D513C(a1, a2) & 1;
}

uint64_t sub_2384D4B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384D513C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2384D4B90()
{
  sub_2384D5388();
  return sub_2384DFE98();
}

uint64_t sub_2384D4BB8()
{
  sub_2384D5388();
  return sub_2384DFEA4();
}

uint64_t ContextualSuggestionSnapshot.contexts.getter()
{
  return swift_bridgeObjectRetain();
}

id ContextualSuggestionSnapshot.__allocating_init(contexts:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ContextualSuggestionSnapshot.init(contexts:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ContextualSuggestionSnapshot.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextualSuggestionSnapshot.init(coder:)(a1);
}

id ContextualSuggestionSnapshot.init(coder:)(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  objc_super v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_2384DF9B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256912720);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2384E0E70;
  *(_QWORD *)(v8 + 32) = sub_2384B63FC();
  *(_QWORD *)(v8 + 40) = type metadata accessor for ContextualSuggestionContext();
  v9 = v1;
  sub_2384DFBC8();
  swift_bridgeObjectRelease();
  if (v22)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912E50);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = v20;

      v11 = (char *)objc_allocWithZone(ObjectType);
      *(_QWORD *)&v11[OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts] = v10;
      v19.receiver = v11;
      v19.super_class = ObjectType;
      v12 = objc_msgSendSuper2(&v19, sel_init);

      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return v12;
    }

  }
  else
  {

    sub_2384B6438((uint64_t)v21);
  }
  v13 = sub_2384D860C();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  v14 = sub_2384DF9AC();
  v15 = sub_2384DFB38();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_2384B0000, v14, v15, "coder missing contexts", v16, 2u);
    MEMORY[0x23B836F18](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

void *sub_2384D4F34()
{
  return &unk_2384E20EA;
}

uint64_t static ContextualSuggestionSnapshot.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ContextualSuggestionSnapshot.encode(with:)(NSCoder with)
{
  void *v2;
  id v3;

  type metadata accessor for ContextualSuggestionContext();
  v2 = (void *)sub_2384DFA84();
  v3 = (id)sub_2384DFA18();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v2, v3);

}

id ContextualSuggestionSnapshot.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ContextualSuggestionSnapshot.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ContextualSuggestionSnapshot.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2384D513C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x73747865746E6F63 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2384D51C0()
{
  return 0x73747865746E6F63;
}

unint64_t sub_2384D51DC()
{
  unint64_t result;

  result = qword_256912E58;
  if (!qword_256912E58)
  {
    result = MEMORY[0x23B836E94](&unk_2384E20EC, &type metadata for ContextualSuggestionSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E58);
  }
  return result;
}

unint64_t sub_2384D5224()
{
  unint64_t result;

  result = qword_256912E60;
  if (!qword_256912E60)
  {
    result = MEMORY[0x23B836E94](&unk_2384E21CC, &type metadata for ContextualSuggestionSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E60);
  }
  return result;
}

unint64_t sub_2384D526C()
{
  unint64_t result;

  result = qword_256912E68;
  if (!qword_256912E68)
  {
    result = MEMORY[0x23B836E94](&unk_2384E21A4, &type metadata for ContextualSuggestionSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E68);
  }
  return result;
}

uint64_t type metadata accessor for ContextualSuggestionSnapshot()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContextualSuggestionSnapshot()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualSuggestionSnapshot.__allocating_init(contexts:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ContextualSuggestionSnapshot.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t storeEnumTagSinglePayload for ContextualSuggestionSnapshot.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_2384D532C + 4 * asc_2384E20E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2384D534C + 4 * byte_2384E20E5[v4]))();
}

_BYTE *sub_2384D532C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2384D534C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2384D5354(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2384D535C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2384D5364(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2384D536C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ContextualSuggestionSnapshot.CodingKeys()
{
  return &type metadata for ContextualSuggestionSnapshot.CodingKeys;
}

unint64_t sub_2384D5388()
{
  unint64_t result;

  result = qword_256912E78;
  if (!qword_256912E78)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2154, &type metadata for ContextualSuggestionSnapshot.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E78);
  }
  return result;
}

uint64_t sub_2384D53D0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F69746361;
  else
    return 0x696669746E656469;
}

uint64_t sub_2384D5408()
{
  char *v0;

  return sub_2384D53D0(*v0);
}

uint64_t sub_2384D5410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384D5A20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2384D5434()
{
  sub_2384D5CE0();
  return sub_2384DFE98();
}

uint64_t sub_2384D545C()
{
  sub_2384D5CE0();
  return sub_2384DFEA4();
}

id ContextualActionSuggestion.action.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action);
}

id ContextualActionSuggestion.__allocating_init(identifier:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action] = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

id ContextualActionSuggestion.init(identifier:action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action) = a3;
  return ContextualSuggestion.init(identifier:)(a1, a2);
}

uint64_t sub_2384D54F4()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action), sel_associatedAppBundleIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2384DFA30();

  return v3;
}

uint64_t ContextualActionSuggestion.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextualActionSuggestion.init(coder:)(a1);
}

uint64_t ContextualActionSuggestion.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v27;

  v3 = sub_2384DF9B8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  sub_2384B97C8(0, (unint64_t *)&qword_256912EF0);
  v10 = v1;
  v11 = sub_2384DFBBC();
  if (!v11)
  {

    v20 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v20, v3);
    v21 = sub_2384DF9AC();
    v22 = sub_2384DFB38();
    if (!os_log_type_enabled(v21, v22))
    {
      v7 = v9;
      goto LABEL_10;
    }
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2384B0000, v21, v22, "coder missing identifier", v23, 2u);
    v7 = v9;
    goto LABEL_8;
  }
  v12 = (void *)v11;
  v13 = sub_2384DFA30();
  v15 = v14;

  sub_2384B97C8(0, &qword_256912E88);
  v16 = sub_2384DFBBC();
  if (!v16)
  {
    swift_bridgeObjectRelease();

    v24 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
    v21 = sub_2384DF9AC();
    v25 = sub_2384DFB38();
    if (!os_log_type_enabled(v21, v25))
    {
LABEL_10:

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return 0;
    }
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_2384B0000, v21, v25, "coder missing action", v23, 2u);
LABEL_8:
    MEMORY[0x23B836F18](v23, -1, -1);
    goto LABEL_10;
  }
  v17 = v16;
  ObjectType = swift_getObjectType();

  v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(ObjectType + 136))(v13, v15, v17);
  swift_deallocPartialClassInstance();
  return v19;
}

void sub_2384D5884(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  sub_2384B8D0C(a1);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action);
  v4 = (id)sub_2384DFA18();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

}

void ContextualActionSuggestion.__allocating_init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ContextualActionSuggestion.init(identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2384D59D0()
{
  uint64_t v0;

}

id ContextualActionSuggestion.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualActionSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2384D5A20(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t type metadata accessor for ContextualActionSuggestion()
{
  return objc_opt_self();
}

unint64_t sub_2384D5B2C()
{
  unint64_t result;

  result = qword_256912E90;
  if (!qword_256912E90)
  {
    result = MEMORY[0x23B836E94](&unk_2384E226C, &type metadata for ContextualActionSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E90);
  }
  return result;
}

unint64_t sub_2384D5B74()
{
  unint64_t result;

  result = qword_256912E98;
  if (!qword_256912E98)
  {
    result = MEMORY[0x23B836E94](&unk_2384E234C, &type metadata for ContextualActionSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912E98);
  }
  return result;
}

unint64_t sub_2384D5BBC()
{
  unint64_t result;

  result = qword_256912EA0;
  if (!qword_256912EA0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2324, &type metadata for ContextualActionSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912EA0);
  }
  return result;
}

uint64_t method lookup function for ContextualActionSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualActionSuggestion.__allocating_init(identifier:action:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t storeEnumTagSinglePayload for ContextualActionSuggestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2384D5C60 + 4 * byte_2384E2265[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2384D5C94 + 4 * asc_2384E2260[v4]))();
}

uint64_t sub_2384D5C94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D5C9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D5CA4);
  return result;
}

uint64_t sub_2384D5CB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D5CB8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2384D5CBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D5CC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextualActionSuggestion.CodingKeys()
{
  return &type metadata for ContextualActionSuggestion.CodingKeys;
}

unint64_t sub_2384D5CE0()
{
  unint64_t result;

  result = qword_256912EA8;
  if (!qword_256912EA8)
  {
    result = MEMORY[0x23B836E94](&unk_2384E22D4, &type metadata for ContextualActionSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912EA8);
  }
  return result;
}

void *sub_2384D5D24()
{
  return &unk_250A2E3C8;
}

unint64_t static WidgetRotationEvent.eventName.getter()
{
  return 0xD000000000000029;
}

uint64_t sub_2384D5D4C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2384D5D78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2384D5DA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2384D5DD0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t sub_2384D5DD8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

void __swiftcall WidgetRotationEvent.init(extensionBundleId:kind:reason:rotations:widgetSuggestions:)(ContextualSuggestionClient::WidgetRotationEvent *__return_ptr retstr, Swift::String extensionBundleId, Swift::String kind, Swift::String reason, Swift::Int rotations, Swift::Int widgetSuggestions)
{
  retstr->extensionBundleId = extensionBundleId;
  retstr->kind = kind;
  retstr->reason = reason;
  retstr->rotations = rotations;
  retstr->widgetSuggestions = widgetSuggestions;
}

uint64_t sub_2384D5DF4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2384D5E2C + 4 * byte_2384E23E0[a1]))(0xD000000000000011, 0x80000002384E4950);
}

uint64_t sub_2384D5E2C()
{
  return 1684957547;
}

uint64_t sub_2384D5E3C()
{
  return 0x6E6F73616572;
}

uint64_t sub_2384D5E50()
{
  return 0x6E6F697461746F72;
}

uint64_t sub_2384D5E80()
{
  unsigned __int8 *v0;

  return sub_2384D5DF4(*v0);
}

uint64_t sub_2384D5E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384D6564(a1, a2);
  *a3 = result;
  return result;
}

void sub_2384D5EAC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2384D5EB8()
{
  sub_2384D60D4();
  return sub_2384DFE98();
}

uint64_t sub_2384D5EE0()
{
  sub_2384D60D4();
  return sub_2384DFEA4();
}

uint64_t WidgetRotationEvent.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[8];
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912EB0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v12[5] = v1[3];
  v12[6] = v7;
  v8 = v1[4];
  v12[3] = v1[5];
  v12[4] = v8;
  v9 = v1[6];
  v12[1] = v1[7];
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2384D60D4();
  sub_2384DFE8C();
  v17 = 0;
  v10 = v12[7];
  sub_2384DFDB4();
  if (!v10)
  {
    v16 = 1;
    sub_2384DFDB4();
    v15 = 2;
    sub_2384DFDB4();
    v14 = 3;
    sub_2384DFDCC();
    v13 = 4;
    sub_2384DFDCC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2384D60D4()
{
  unint64_t result;

  result = qword_256914F90[0];
  if (!qword_256914F90[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E2538, &type metadata for WidgetRotationEvent.CodingKeys);
    atomic_store(result, qword_256914F90);
  }
  return result;
}

unint64_t sub_2384D6118()
{
  return 0xD000000000000029;
}

unint64_t sub_2384D6134(uint64_t a1)
{
  unint64_t result;

  result = sub_2384D6158();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2384D6158()
{
  unint64_t result;

  result = qword_256912EB8;
  if (!qword_256912EB8)
  {
    result = MEMORY[0x23B836E94](&protocol conformance descriptor for WidgetRotationEvent, &type metadata for WidgetRotationEvent);
    atomic_store(result, (unint64_t *)&qword_256912EB8);
  }
  return result;
}

uint64_t sub_2384D619C(_QWORD *a1)
{
  return WidgetRotationEvent.encode(to:)(a1);
}

uint64_t initializeWithCopy for WidgetRotationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WidgetRotationEvent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for WidgetRotationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetRotationEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetRotationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetRotationEvent()
{
  return &type metadata for WidgetRotationEvent;
}

uint64_t storeEnumTagSinglePayload for WidgetRotationEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2384D640C + 4 * byte_2384E23EA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2384D6440 + 4 * byte_2384E23E5[v4]))();
}

uint64_t sub_2384D6440(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D6448(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D6450);
  return result;
}

uint64_t sub_2384D645C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D6464);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2384D6468(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D6470(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WidgetRotationEvent.CodingKeys()
{
  return &type metadata for WidgetRotationEvent.CodingKeys;
}

unint64_t sub_2384D6490()
{
  unint64_t result;

  result = qword_2569151A0[0];
  if (!qword_2569151A0[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E2510, &type metadata for WidgetRotationEvent.CodingKeys);
    atomic_store(result, qword_2569151A0);
  }
  return result;
}

unint64_t sub_2384D64D8()
{
  unint64_t result;

  result = qword_2569152B0;
  if (!qword_2569152B0)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2480, &type metadata for WidgetRotationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569152B0);
  }
  return result;
}

unint64_t sub_2384D6520()
{
  unint64_t result;

  result = qword_2569152B8[0];
  if (!qword_2569152B8[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E24A8, &type metadata for WidgetRotationEvent.CodingKeys);
    atomic_store(result, qword_2569152B8);
  }
  return result;
}

uint64_t sub_2384D6564(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x80000002384E4950 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461746F72 && a2 == 0xE900000000000073 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002384E4970)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

void *sub_2384D676C()
{
  return &unk_250A2E480;
}

unint64_t static WidgetConfigurationEvent.eventName.getter()
{
  return 0xD00000000000002ELL;
}

void __swiftcall WidgetConfigurationEvent.init(extensionBundleId:kind:configurationIntentType:)(ContextualSuggestionClient::WidgetConfigurationEvent *__return_ptr retstr, Swift::String extensionBundleId, Swift::String kind, Swift::String_optional configurationIntentType)
{
  retstr->extensionBundleId = extensionBundleId;
  retstr->kind = kind;
  retstr->configurationIntentType = configurationIntentType;
}

unint64_t sub_2384D67A4()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 1684957547;
  if (*v0 != 1)
    v1 = 0xD000000000000017;
  if (*v0)
    return v1;
  else
    return 0xD000000000000011;
}

uint64_t sub_2384D67FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384D6EE0(a1, a2);
  *a3 = result;
  return result;
}

void sub_2384D6820(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2384D682C()
{
  sub_2384D69E4();
  return sub_2384DFE98();
}

uint64_t sub_2384D6854()
{
  sub_2384D69E4();
  return sub_2384DFEA4();
}

uint64_t WidgetConfigurationEvent.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  char v12;
  char v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912EC0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v11[3] = v1[3];
  v11[4] = v7;
  v8 = v1[4];
  v11[1] = v1[5];
  v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2384D69E4();
  sub_2384DFE8C();
  v14 = 0;
  v9 = v11[5];
  sub_2384DFDB4();
  if (!v9)
  {
    v13 = 1;
    sub_2384DFDB4();
    v12 = 2;
    sub_2384DFDA8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2384D69E4()
{
  unint64_t result;

  result = qword_256915340[0];
  if (!qword_256915340[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E26DC, &type metadata for WidgetConfigurationEvent.CodingKeys);
    atomic_store(result, qword_256915340);
  }
  return result;
}

unint64_t sub_2384D6A28()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_2384D6A44(uint64_t a1)
{
  unint64_t result;

  result = sub_2384D6A68();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2384D6A68()
{
  unint64_t result;

  result = qword_2542CDD48;
  if (!qword_2542CDD48)
  {
    result = MEMORY[0x23B836E94](&protocol conformance descriptor for WidgetConfigurationEvent, &type metadata for WidgetConfigurationEvent);
    atomic_store(result, (unint64_t *)&qword_2542CDD48);
  }
  return result;
}

uint64_t sub_2384D6AAC(_QWORD *a1)
{
  return WidgetConfigurationEvent.encode(to:)(a1);
}

_QWORD *initializeWithCopy for WidgetConfigurationEvent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WidgetConfigurationEvent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for WidgetConfigurationEvent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetConfigurationEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetConfigurationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetConfigurationEvent()
{
  return &type metadata for WidgetConfigurationEvent;
}

uint64_t getEnumTagSinglePayload for WidgetConfigurationEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetConfigurationEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2384D6D88 + 4 * byte_2384E2595[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2384D6DBC + 4 * byte_2384E2590[v4]))();
}

uint64_t sub_2384D6DBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D6DC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D6DCCLL);
  return result;
}

uint64_t sub_2384D6DD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D6DE0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2384D6DE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D6DEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WidgetConfigurationEvent.CodingKeys()
{
  return &type metadata for WidgetConfigurationEvent.CodingKeys;
}

unint64_t sub_2384D6E0C()
{
  unint64_t result;

  result = qword_256915450[0];
  if (!qword_256915450[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E26B4, &type metadata for WidgetConfigurationEvent.CodingKeys);
    atomic_store(result, qword_256915450);
  }
  return result;
}

unint64_t sub_2384D6E54()
{
  unint64_t result;

  result = qword_256915560;
  if (!qword_256915560)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2624, &type metadata for WidgetConfigurationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256915560);
  }
  return result;
}

unint64_t sub_2384D6E9C()
{
  unint64_t result;

  result = qword_256915568[0];
  if (!qword_256915568[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E264C, &type metadata for WidgetConfigurationEvent.CodingKeys);
    atomic_store(result, qword_256915568);
  }
  return result;
}

uint64_t sub_2384D6EE0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x80000002384E4950 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000002384E49C0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

void *sub_2384D701C()
{
  return &unk_250A2E538;
}

unint64_t static SystemConfigurationEvent.eventName.getter()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_2384D7044()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_2384D704C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_2384D7054()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_2384D705C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2384D7064()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_2384D706C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_2384D7074()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

void __swiftcall SystemConfigurationEvent.init(hasExperiencedUI:leadingStackSmartRotateEnabled:leadingStackWidgetCount:leadingStackWidgetSuggestionsEnabled:trailingStackSmartRotateEnabled:trailingStackWidgetCount:trailingStackWidgetSuggestionsEnabled:)(ContextualSuggestionClient::SystemConfigurationEvent *__return_ptr retstr, Swift::Bool hasExperiencedUI, Swift::Bool leadingStackSmartRotateEnabled, Swift::Int leadingStackWidgetCount, Swift::Bool leadingStackWidgetSuggestionsEnabled, Swift::Bool trailingStackSmartRotateEnabled, Swift::Int trailingStackWidgetCount, Swift::Bool trailingStackWidgetSuggestionsEnabled)
{
  retstr->hasExperiencedUI = hasExperiencedUI;
  retstr->leadingStackSmartRotateEnabled = leadingStackSmartRotateEnabled;
  retstr->leadingStackWidgetCount = leadingStackWidgetCount;
  retstr->leadingStackWidgetSuggestionsEnabled = leadingStackWidgetSuggestionsEnabled;
  retstr->trailingStackSmartRotateEnabled = trailingStackSmartRotateEnabled;
  retstr->trailingStackWidgetCount = trailingStackWidgetCount;
  retstr->trailingStackWidgetSuggestionsEnabled = trailingStackWidgetSuggestionsEnabled;
}

uint64_t sub_2384D709C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2384D70D4 + 4 * byte_2384E2730[a1]))(0xD000000000000010, 0x80000002384E4A10);
}

uint64_t sub_2384D70D4(uint64_t a1)
{
  return a1 + 14;
}

uint64_t sub_2384D713C()
{
  unsigned __int8 *v0;

  return sub_2384D709C(*v0);
}

uint64_t sub_2384D7144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384D7714(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2384D7168()
{
  sub_2384D73D4();
  return sub_2384DFE98();
}

uint64_t sub_2384D7190()
{
  sub_2384D73D4();
  return sub_2384DFEA4();
}

uint64_t SystemConfigurationEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  _DWORD v10[4];
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912EC8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(unsigned __int8 *)(v1 + 1);
  v14 = *(_QWORD *)(v1 + 8);
  v8 = *(unsigned __int8 *)(v1 + 16);
  v12 = *(unsigned __int8 *)(v1 + 17);
  v13 = v8;
  v11 = *(_QWORD *)(v1 + 24);
  v10[3] = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2384D73D4();
  sub_2384DFE8C();
  v22 = 0;
  sub_2384DFDC0();
  if (!v2)
  {
    v21 = 1;
    sub_2384DFDC0();
    v20 = 2;
    sub_2384DFDCC();
    v19 = 3;
    sub_2384DFDC0();
    v18 = 4;
    sub_2384DFDC0();
    v17 = 5;
    sub_2384DFDCC();
    v16 = 6;
    sub_2384DFDC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2384D73D4()
{
  unint64_t result;

  result = qword_2569155F0[0];
  if (!qword_2569155F0[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E288C, &type metadata for SystemConfigurationEvent.CodingKeys);
    atomic_store(result, qword_2569155F0);
  }
  return result;
}

unint64_t sub_2384D7418()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_2384D7434(uint64_t a1)
{
  unint64_t result;

  result = sub_2384D7458();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2384D7458()
{
  unint64_t result;

  result = qword_2542CD620;
  if (!qword_2542CD620)
  {
    result = MEMORY[0x23B836E94](&protocol conformance descriptor for SystemConfigurationEvent, &type metadata for SystemConfigurationEvent);
    atomic_store(result, (unint64_t *)&qword_2542CD620);
  }
  return result;
}

uint64_t sub_2384D749C(_QWORD *a1)
{
  return SystemConfigurationEvent.encode(to:)(a1);
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SystemConfigurationEvent(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[33])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemConfigurationEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemConfigurationEvent()
{
  return &type metadata for SystemConfigurationEvent;
}

uint64_t storeEnumTagSinglePayload for SystemConfigurationEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_2384D75BC + 4 * byte_2384E273C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2384D75F0 + 4 * byte_2384E2737[v4]))();
}

uint64_t sub_2384D75F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D75F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D7600);
  return result;
}

uint64_t sub_2384D760C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D7614);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2384D7618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D7620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SystemConfigurationEvent.CodingKeys()
{
  return &type metadata for SystemConfigurationEvent.CodingKeys;
}

unint64_t sub_2384D7640()
{
  unint64_t result;

  result = qword_256915700[0];
  if (!qword_256915700[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E2864, &type metadata for SystemConfigurationEvent.CodingKeys);
    atomic_store(result, qword_256915700);
  }
  return result;
}

unint64_t sub_2384D7688()
{
  unint64_t result;

  result = qword_256915810;
  if (!qword_256915810)
  {
    result = MEMORY[0x23B836E94](&unk_2384E27D4, &type metadata for SystemConfigurationEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256915810);
  }
  return result;
}

unint64_t sub_2384D76D0()
{
  unint64_t result;

  result = qword_256915818[0];
  if (!qword_256915818[0])
  {
    result = MEMORY[0x23B836E94](&unk_2384E27FC, &type metadata for SystemConfigurationEvent.CodingKeys);
    atomic_store(result, qword_256915818);
  }
  return result;
}

uint64_t sub_2384D7714(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x80000002384E4A10 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x80000002384E4A30 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000002384E4A50 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000024 && a2 == 0x80000002384E4A70 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x80000002384E4AA0 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002384E4AC0 || (sub_2384DFDD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000025 && a2 == 0x80000002384E4AE0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v5 = sub_2384DFDD8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_2384D79B4()
{
  sub_2384C3768();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2384D79F4()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256912ED0);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_2384D7A24@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2384D7A54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 120);
  v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

uint64_t sub_2384D7A94()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x23B836F90](v0 + 48);
}

void sub_2384D7AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  os_unfair_lock_s *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t ObjectType;

  swift_beginAccess();
  *(_QWORD *)(v2 + 56) = a2;
  swift_unknownObjectWeakAssign();
  v4 = *(_QWORD *)(v2 + 40);
  v5 = (os_unfair_lock_s *)(v4 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  v6 = *(void **)(v4 + 16);
  v7 = v6;
  os_unfair_lock_unlock(v5);
  if (v6)
  {
    if (MEMORY[0x23B836F90](v2 + 48))
    {
      v8 = *(_QWORD *)(v2 + 56);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 8))(v2, v7, ObjectType, v8);
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();

    }
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

void (*sub_2384D7BC4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x23B836F90](v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v3[3] = v4;
  v3[4] = v5;
  return sub_2384D7C30;
}

void sub_2384D7C30(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;

  v3 = *(_QWORD **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 56) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    v4 = v3[5];
    swift_endAccess();
    swift_unknownObjectRelease();
    v5 = *(_QWORD *)(v4 + 40);
    v6 = (os_unfair_lock_s *)(v5 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
    v7 = *(void **)(v5 + 16);
    v8 = v7;
    os_unfair_lock_unlock(v6);
    if (v7)
    {
      if (MEMORY[0x23B836F90](v3[5] + 48))
      {
        v9 = v3[5];
        v10 = *(_QWORD *)(v9 + 56);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v10 + 8))(v9, v8, ObjectType, v10);
        swift_unknownObjectRelease();
      }

    }
  }
  free(v3);
}

uint64_t ContextualSuggestionProvider.__allocating_init(endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  ContextualSuggestionProvider.init(endpoint:)(a1, a2);
  return v4;
}

_QWORD *ContextualSuggestionProvider.init(endpoint:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD v23[2];
  uint64_t v24;

  v3 = v2;
  v6 = sub_2384DF9B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2384C3768();
  swift_beginAccess();
  v11 = *v10;
  v3[4] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912ED0);
  v12 = swift_allocObject();
  *(_DWORD *)(v12 + 24) = 0;
  *(_QWORD *)(v12 + 16) = 0;
  v3[5] = v12;
  v3[7] = 0;
  swift_unknownObjectWeakInit();
  v3[2] = a1;
  v3[3] = a2;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v11 + 224);
  swift_retain_n();
  swift_bridgeObjectRetain();
  v14 = swift_retain();
  v13(v14, a1, a2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v15 = sub_2384D860C();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  v16 = sub_2384DF9AC();
  v17 = sub_2384DFB44();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v24 = v19;
    v23[0] = v6;
    *(_DWORD *)v18 = 136315138;
    v20 = sub_2384DFEB0();
    v23[1] = sub_2384C1184(v20, v21, &v24);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v16, v17, "%s init", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v19, -1, -1);
    MEMORY[0x23B836F18](v18, -1, -1);

    (*(void (**)(char *, _QWORD))(v7 + 8))(v9, v23[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v3;
}

uint64_t ContextualSuggestionProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v14[3];
  uint64_t v15;

  v1 = v0;
  v2 = sub_2384DF9B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2384D860C();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2384DF9AC();
  v8 = sub_2384DFB44();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    v14[1] = v9 + 4;
    v11 = sub_2384DFEB0();
    v14[2] = sub_2384C1184(v11, v12, &v15);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v7, v8, "%s deinit", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v10, -1, -1);
    MEMORY[0x23B836F18](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(**(_QWORD **)(v1 + 32) + 232))(v1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_2384D82E8(v1 + 48);
  return v1;
}

uint64_t ContextualSuggestionProvider.__deallocating_deinit()
{
  ContextualSuggestionProvider.deinit();
  return swift_deallocClassInstance();
}

void *sub_2384D81D4()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = (os_unfair_lock_s *)(v1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  v3 = *(void **)(v1 + 16);
  v4 = v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_2384D8210(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;

  v3 = v1[5];
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));

  *(_QWORD *)(v3 + 16) = a1;
  v4 = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
  result = (*(uint64_t (**)(void))(*v1 + 112))();
  if (result)
  {
    v7 = v6;
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD *, id, uint64_t, uint64_t))(v7 + 8))(v1, v4, ObjectType, v7);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2384D82E8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t dispatch thunk of ContextualSuggestionProviderDelegate.provider(_:didUpdate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for ContextualSuggestionProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContextualSuggestionProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.__allocating_init(endpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ContextualSuggestionProvider.snapshot.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256912ED8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256912ED8);
  }
}

void *sub_2384D83CC()
{
  return &unk_250A2E600;
}

uint64_t sub_2384D83D8()
{
  uint64_t result;

  sub_2384D86C4();
  result = sub_2384DFBF8();
  qword_2542CE150 = result;
  return result;
}

uint64_t *sub_2384D8430()
{
  if (qword_2542CE158 != -1)
    swift_once();
  return &qword_2542CE150;
}

id static ContextualEngineLog.oslog.getter()
{
  if (qword_2542CE158 != -1)
    swift_once();
  return (id)qword_2542CE150;
}

id ContextualEngineLog.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContextualEngineLog();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContextualEngineLog()
{
  return objc_opt_self();
}

uint64_t sub_2384D858C()
{
  uint64_t v0;
  id v1;

  v0 = sub_2384DF9B8();
  __swift_allocate_value_buffer(v0, qword_2542CE160);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542CE160);
  if (qword_2542CE158 != -1)
    swift_once();
  v1 = (id)qword_2542CE150;
  return sub_2384DF9C4();
}

uint64_t sub_2384D860C()
{
  uint64_t v0;

  if (qword_2542CE178 != -1)
    swift_once();
  v0 = sub_2384DF9B8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2542CE160);
}

uint64_t static Logger.contextualEngine.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2542CE178 != -1)
    swift_once();
  v2 = sub_2384DF9B8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2542CE160);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_2384D86C4()
{
  unint64_t result;

  result = qword_2542CDD70;
  if (!qword_2542CDD70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542CDD70);
  }
  return result;
}

uint64_t sub_2384D8700()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_2384DFD84();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_2384D8750(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x696669746E656469;
}

uint64_t sub_2384D8790(char *a1, char *a2)
{
  return sub_2384D879C(*a1, *a2);
}

uint64_t sub_2384D879C(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000014;
  else
    v3 = 0x696669746E656469;
  if (v2)
    v4 = 0xEA00000000007265;
  else
    v4 = 0x80000002384E4C20;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000014;
  else
    v5 = 0x696669746E656469;
  if ((a2 & 1) != 0)
    v6 = 0x80000002384E4C20;
  else
    v6 = 0xEA00000000007265;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2384DFDD8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2384D8844()
{
  return sub_2384D884C();
}

uint64_t sub_2384D884C()
{
  sub_2384DFE38();
  sub_2384DFA54();
  swift_bridgeObjectRelease();
  return sub_2384DFE50();
}

uint64_t sub_2384D88D4()
{
  return sub_2384D88DC();
}

uint64_t sub_2384D88DC()
{
  sub_2384DFA54();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2384D893C()
{
  return sub_2384D8944();
}

uint64_t sub_2384D8944()
{
  sub_2384DFE38();
  sub_2384DFA54();
  swift_bridgeObjectRelease();
  return sub_2384DFE50();
}

uint64_t sub_2384D89C8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2384DFD84();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_2384D8A24@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2384D8750(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2384D8A4C()
{
  char *v0;

  return sub_2384D8750(*v0);
}

uint64_t sub_2384D8A54@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2384DFD84();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_2384D8AB4()
{
  sub_2384D93D8();
  return sub_2384DFE98();
}

uint64_t sub_2384D8ADC()
{
  sub_2384D93D8();
  return sub_2384DFEA4();
}

uint64_t ContextRepresentation.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContextRepresentation.localizedDisplayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName);
  swift_bridgeObjectRetain();
  return v1;
}

id ContextRepresentation.__allocating_init(identifier:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v9[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ContextRepresentation.init(identifier:localizedDisplayName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  char *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v4[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ContextRepresentation.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ContextRepresentation.init(coder:)(a1);
}

id ContextRepresentation.init(coder:)(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  char *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  os_log_type_t v30;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_2384DF9B8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v32 - v9;
  sub_2384B8CAC();
  v11 = v1;
  v12 = sub_2384DFBBC();
  if (!v12)
  {

    v25 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v25, v4);
    v26 = sub_2384DF9AC();
    v27 = sub_2384DFB38();
    if (!os_log_type_enabled(v26, v27))
    {
      v8 = v10;
      goto LABEL_12;
    }
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2384B0000, v26, v27, "coder missing identifier", v28, 2u);
    v8 = v10;
    goto LABEL_10;
  }
  v13 = (void *)v12;
  v14 = sub_2384DFA30();
  v16 = v15;

  v17 = sub_2384DFBBC();
  if (!v17)
  {

    goto LABEL_8;
  }
  v18 = (void *)v17;
  v33 = 0;
  v34 = 0;
  sub_2384DFA24();

  v20 = v33;
  v19 = v34;

  if (!v19)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v29 = sub_2384D860C();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v29, v4);
    v26 = sub_2384DF9AC();
    v30 = sub_2384DFB38();
    if (!os_log_type_enabled(v26, v30))
    {
LABEL_12:

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return 0;
    }
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2384B0000, v26, v30, "coder missing localizedDisplayName", v28, 2u);
LABEL_10:
    MEMORY[0x23B836F18](v28, -1, -1);
    goto LABEL_12;
  }
  v21 = (char *)objc_allocWithZone(ObjectType);
  v22 = (uint64_t *)&v21[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_identifier];
  *v22 = v14;
  v22[1] = v16;
  v23 = &v21[OBJC_IVAR____TtC26ContextualSuggestionClient21ContextRepresentation_localizedDisplayName];
  *(_QWORD *)v23 = v20;
  *((_QWORD *)v23 + 1) = v19;
  v32.receiver = v21;
  v32.super_class = ObjectType;
  v24 = objc_msgSendSuper2(&v32, sel_init);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v24;
}

void *sub_2384D8FBC()
{
  return &unk_2384E2A1A;
}

uint64_t static ContextRepresentation.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ContextRepresentation.encode(with:)(NSCoder with)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)sub_2384DFA18();
  v3 = (void *)sub_2384DFA18();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v2, v3);

  v4 = (void *)sub_2384DFA18();
  v5 = (id)sub_2384DFA18();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v4, v5);

}

id ContextRepresentation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ContextRepresentation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ContextRepresentation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2384D91FC()
{
  unint64_t result;

  result = qword_256912EF8;
  if (!qword_256912EF8)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2A1C, &type metadata for ContextRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912EF8);
  }
  return result;
}

unint64_t sub_2384D9244()
{
  unint64_t result;

  result = qword_256912F00;
  if (!qword_256912F00)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2B34, &type metadata for ContextRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912F00);
  }
  return result;
}

unint64_t sub_2384D928C()
{
  unint64_t result;

  result = qword_256912F08;
  if (!qword_256912F08)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2B0C, &type metadata for ContextRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912F08);
  }
  return result;
}

uint64_t type metadata accessor for ContextRepresentation()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContextRepresentation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContextRepresentation.__allocating_init(identifier:localizedDisplayName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ContextRepresentation.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t storeEnumTagSinglePayload for ContextRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2384D9358 + 4 * byte_2384E2A15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2384D938C + 4 * byte_2384E2A10[v4]))();
}

uint64_t sub_2384D938C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D9394(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384D939CLL);
  return result;
}

uint64_t sub_2384D93A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384D93B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2384D93B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384D93BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContextRepresentation.CodingKeys()
{
  return &type metadata for ContextRepresentation.CodingKeys;
}

unint64_t sub_2384D93D8()
{
  unint64_t result;

  result = qword_256912F18;
  if (!qword_256912F18)
  {
    result = MEMORY[0x23B836E94](&unk_2384E2ABC, &type metadata for ContextRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912F18);
  }
  return result;
}

void sub_2384D941C()
{
  id v0;
  void *v1;
  id v2;

  sub_2384DFA30();
  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_256915C38 = (uint64_t)v2;
}

uint64_t *sub_2384D94A0()
{
  if (qword_256915BA0 != -1)
    swift_once();
  return &qword_256915C38;
}

uint64_t sub_2384D94E0()
{
  uint64_t v0;
  id v1;

  if (qword_256915BA0 != -1)
    swift_once();
  v0 = qword_256915C38;
  v1 = (id)qword_256915C38;
  return v0;
}

uint64_t sub_2384D9530()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2384D9564(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2384D95A8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2384D95E4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2384D9618(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

id sub_2384D965C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BE0BDE8]);
  v1 = (void *)sub_2384DFA18();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

id sub_2384D96C4()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t sub_2384D96CC()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_2384D96FC(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 40) = a1;
  return result;
}

uint64_t sub_2384D9738()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 32), sel_invalidate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_2384D9774()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 32), sel_invalidate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_2384D97B8()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  v1 = objc_allocWithZone(MEMORY[0x24BE0BDE8]);
  v2 = (void *)sub_2384DFA18();
  v3 = objc_msgSend(v1, sel_initWithIdentifier_, v2);

  *(_QWORD *)(v0 + 32) = v3;
  *(_BYTE *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_2384D9848()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  v1 = objc_allocWithZone(MEMORY[0x24BE0BDE8]);
  v2 = (void *)sub_2384DFA18();
  v3 = objc_msgSend(v1, sel_initWithIdentifier_, v2);

  *(_QWORD *)(v0 + 32) = v3;
  *(_BYTE *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_2384D98C4()
{
  type metadata accessor for AmbientConfigurationManager();
  return static AmbientConfigurationManager.shared.getter();
}

uint64_t sub_2384D98EC()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for ContextualSuggestionProvider();
  v0 = static String.ambient.getter();
  return ContextualSuggestionProvider.__allocating_init(endpoint:)(v0, v1);
}

id sub_2384D9918()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE16A38]), sel_init);
}

uint64_t sub_2384D993C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger;
  if (*(_QWORD *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger);
  }
  else
  {
    type metadata accessor for AmbientLogger();
    v2 = sub_2384D02BC();
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t ATXAmbientSuggestionProvider.suggestionsWidgetSuggestions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATXAmbientSuggestionProvider.stackSuggestions.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  v2 = (os_unfair_lock_s *)(v1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  v3 = (*(uint64_t (**)(void))(**(_QWORD **)(v1 + 16) + 112))();
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_2384D9AA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t ATXAmbientSuggestionProvider.shouldDisableSuppressionTimerForTooling.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling);
  swift_beginAccess();
  return *v1;
}

uint64_t ATXAmbientSuggestionProvider.shouldDisableSuppressionTimerForTooling.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*ATXAmbientSuggestionProvider.shouldDisableSuppressionTimerForTooling.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void __swiftcall ATXAmbientSuggestionProvider.init()(ATXAmbientSuggestionProvider *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

char *ATXAmbientSuggestionProvider.init()()
{
  char *v0;
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void (*v40)(char *, _QWORD, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  void *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  int *v59;
  void (*v60)(char *, _UNKNOWN **);
  char *v61;
  void (*v62)(char *);
  char *v63;
  uint64_t v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t, uint64_t);
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t aBlock;
  unint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void *v96;
  uint64_t (*v97)();
  uint64_t v98;
  objc_super v99;
  uint64_t v100;

  ObjectType = swift_getObjectType();
  v87 = sub_2384DF9DC();
  v83 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v86 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_2384DFB50();
  MEMORY[0x24BDAC7A8](v82);
  v81 = (char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2384DF9F4();
  MEMORY[0x24BDAC7A8](v4);
  v80 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2384DFB5C();
  v78 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v79 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2384DF9B8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v88 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v73 - v12;
  v14 = OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager;
  type metadata accessor for AmbientConfigurationManager();
  v15 = v0;
  *(_QWORD *)&v0[v14] = static AmbientConfigurationManager.shared.getter();
  v16 = OBJC_IVAR___ATXAmbientSuggestionProvider_suggestionProvider;
  type metadata accessor for ContextualSuggestionProvider();
  v17 = static String.ambient.getter();
  *(_QWORD *)&v15[v16] = ContextualSuggestionProvider.__allocating_init(endpoint:)(v17, v18);
  v19 = OBJC_IVAR___ATXAmbientSuggestionProvider_descriptorProvider;
  *(_QWORD *)&v15[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE16A38]), sel_init);
  *(_QWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider____lazy_storage___logger] = 0;
  v75 = OBJC_IVAR___ATXAmbientSuggestionProvider__suggestionsWidgetSuggestions;
  *(_QWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider__suggestionsWidgetSuggestions] = 0;
  v15[OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling] = 0;
  v77 = OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer;
  *(_QWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer] = 0;
  v76 = &v15[OBJC_IVAR___ATXAmbientSuggestionProvider_delegate];
  swift_unknownObjectWeakInit();
  v20 = sub_2384C78FC();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v84 = v20;
  v85 = v21;
  ((void (*)(char *))v21)(v13);
  v22 = sub_2384DF9AC();
  v23 = sub_2384DFB44();
  v24 = os_log_type_enabled(v22, v23);
  v90 = v9;
  v91 = ObjectType;
  v89 = v8;
  if (v24)
  {
    v25 = swift_slowAlloc();
    v74 = v6;
    v26 = (uint8_t *)v25;
    v27 = swift_slowAlloc();
    aBlock = v27;
    *(_DWORD *)v26 = 136315138;
    v28 = sub_2384DFEB0();
    v100 = sub_2384C1184(v28, v29, &aBlock);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v22, v23, "%s init", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v27, -1, -1);
    v30 = v26;
    v6 = v74;
    MEMORY[0x23B836F18](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v90 + 8))(v13, v8);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  _s11GuardedDataCMa();
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = 0;
  v32 = objc_allocWithZone(MEMORY[0x24BE0BDE8]);
  v33 = (void *)sub_2384DFA18();
  v34 = objc_msgSend(v32, sel_initWithIdentifier_, v33);

  *(_QWORD *)(v31 + 32) = v34;
  *(_BYTE *)(v31 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912F68);
  v35 = swift_allocObject();
  *(_DWORD *)(v35 + 24) = 0;
  *(_QWORD *)(v35 + 16) = v31;
  *(_QWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_lock] = v35;
  aBlock = 0;
  v94 = 0xE000000000000000;
  sub_2384DFCA0();
  swift_bridgeObjectRelease();
  aBlock = 0x6C7070612E6D6F63;
  v94 = 0xEA00000000002E65;
  sub_2384DFEB0();
  sub_2384DFA60();
  swift_bridgeObjectRelease();
  sub_2384B97C8(0, (unint64_t *)&qword_256912A70);
  sub_2384DFA60();
  (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v79, *MEMORY[0x24BEE5758], v6);
  sub_2384DF9E8();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_2384C6290(&qword_256912A78, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256912A80);
  sub_2384DF228(&qword_256912A88, &qword_256912A80, MEMORY[0x24BEE12C8]);
  sub_2384DFC28();
  *(_QWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_calloutQueue] = sub_2384DFB80();
  *(_DWORD *)&v15[OBJC_IVAR___ATXAmbientSuggestionProvider_debugRotationNotificationToken] = 0;
  v36 = sub_2384BFD88(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v15[v75] = v36;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v37 = *(void **)&v15[v77];
  *(_QWORD *)&v15[v77] = 0;

  v99.receiver = v15;
  v99.super_class = (Class)ATXAmbientSuggestionProvider;
  v38 = objc_msgSendSuper2(&v99, sel_init);
  v39 = v83;
  v40 = *(void (**)(char *, _QWORD, uint64_t))(v83 + 104);
  v42 = v86;
  v41 = v87;
  v40(v86, *MEMORY[0x24BEE5490], v87);
  v43 = (char *)v38;
  v44 = (void *)sub_2384DFB8C();
  v45 = *(void (**)(char *, uint64_t))(v39 + 8);
  v45(v42, v41);
  v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v47 = swift_allocObject();
  v48 = v91;
  *(_QWORD *)(v47 + 16) = v46;
  *(_QWORD *)(v47 + 24) = v48;
  v49 = objc_allocWithZone(MEMORY[0x24BE7A638]);
  v97 = sub_2384DE528;
  v98 = v47;
  aBlock = MEMORY[0x24BDAC760];
  v94 = 1107296256;
  v95 = (uint64_t (*)(uint64_t, uint64_t))sub_2384C448C;
  v96 = &block_descriptor_3;
  v50 = _Block_copy(&aBlock);
  swift_retain();
  v51 = objc_msgSend(v49, sel_initWithQueue_operation_, v44, v50);

  _Block_release(v50);
  swift_release();
  swift_release();
  v52 = *(void **)&v43[OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer];
  *(_QWORD *)&v43[OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer] = v51;

  if (objc_msgSend((id)objc_opt_self(), sel_isInternalBuild))
  {
    sub_2384CDA04();
    v40(v42, *MEMORY[0x24BEE5480], v41);
    swift_bridgeObjectRetain();
    v53 = sub_2384DFB8C();
    v45(v42, v41);
    v54 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v55 = swift_allocObject();
    v56 = v91;
    *(_QWORD *)(v55 + 16) = v54;
    *(_QWORD *)(v55 + 24) = v56;
    v97 = sub_2384DE548;
    v98 = v55;
    aBlock = MEMORY[0x24BDAC760];
    v94 = 1107296256;
    v95 = sub_2384C4C80;
    v96 = &block_descriptor_10;
    v57 = _Block_copy(&aBlock);
    swift_release();
    v58 = sub_2384DFA48();
    swift_bridgeObjectRelease();
    v59 = (int *)&v43[OBJC_IVAR___ATXAmbientSuggestionProvider_debugRotationNotificationToken];
    swift_beginAccess();
    notify_register_dispatch((const char *)(v58 + 32), v59, v53, v57);
    swift_endAccess();
    swift_release();
    _Block_release(v57);

  }
  v60 = *(void (**)(char *, _UNKNOWN **))(**(_QWORD **)&v43[OBJC_IVAR___ATXAmbientSuggestionProvider_suggestionProvider]
                                                   + 120);
  v61 = v43;
  swift_retain();
  v60(v43, &protocol witness table for ATXAmbientSuggestionProvider);
  swift_release();
  v62 = *(void (**)(char *))(**(_QWORD **)&v61[OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager]
                                      + 232);
  v63 = v61;
  swift_retain();
  v62(v63);
  swift_release();

  v65 = v88;
  v64 = v89;
  v85(v88, v84, v89);
  v66 = sub_2384DF9AC();
  v67 = sub_2384DFB44();
  if (os_log_type_enabled(v66, v67))
  {
    v68 = swift_slowAlloc();
    v69 = swift_slowAlloc();
    aBlock = v69;
    *(_DWORD *)v68 = 136315394;
    v70 = sub_2384DFEB0();
    v92 = sub_2384C1184(v70, v71, &aBlock);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 12) = 2080;
    v92 = sub_2384C1184(0x292874696E69, 0xE600000000000000, &aBlock);
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v66, v67, "%s.%s: resetting delegate notification suspension timer", (uint8_t *)v68, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v69, -1, -1);
    MEMORY[0x23B836F18](v68, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v90 + 8))(v65, v64);
  sub_2384DB344();

  return v63;
}

uint64_t sub_2384DA6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = swift_allocObject();
  swift_beginAccess();
  v9 = (void *)MEMORY[0x23B836F90](a1 + 16);
  swift_unknownObjectWeakInit();

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  v10[5] = a2;
  sub_2384CAEBC((uint64_t)v6, (uint64_t)&unk_256913020, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2384DA7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[6] = a4;
  v5[7] = a5;
  v6 = sub_2384DF9B8();
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384DA834()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = sub_2384C78FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2384DF9AC();
  v6 = sub_2384DFB44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 72);
    v19 = *(_QWORD *)(v0 + 64);
    v20 = *(_QWORD *)(v0 + 80);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v21 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_2384DFEB0();
    *(_QWORD *)(v0 + 40) = sub_2384C1184(v10, v11, &v21);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v5, v6, "%s: running coalesced refresh", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v9, -1, -1);
    MEMORY[0x23B836F18](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v20, v19);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 72);
    v12 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  v15 = *(_QWORD *)(v0 + 48) + 16;
  swift_beginAccess();
  v16 = MEMORY[0x23B836F90](v15);
  *(_QWORD *)(v0 + 88) = v16;
  if (v16)
  {
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v17;
    *v17 = v0;
    v17[1] = sub_2384DF2F8;
    return sub_2384DAA44();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2384DAA44()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_2384DF9B8();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384DAAA4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[6] = v1;
  v0[7] = *(_QWORD *)(*(_QWORD *)v1 + 240);
  return swift_task_switch();
}

uint64_t sub_2384DAAD4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 64) = (*(uint64_t (**)(void))(v0 + 56))();
  return swift_task_switch();
}

uint64_t sub_2384DAB38()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[7];

  v1 = *(_QWORD *)(v0 + 64);
  if (!v1)
    goto LABEL_18;
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  v28 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  if (!v28)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    v30 = *(_QWORD *)(v0 + 32);
    v29 = *(_QWORD *)(v0 + 40);
    v31 = *(_QWORD *)(v0 + 24);
    v32 = sub_2384C78FC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v29, v32, v31);
    v33 = sub_2384DF9AC();
    v34 = sub_2384DFB44();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_2384B0000, v33, v34, "Not producing ambient stack suggestions, no stacks in configuration", v35, 2u);
      MEMORY[0x23B836F18](v35, -1, -1);
    }
    v37 = *(_QWORD *)(v0 + 32);
    v36 = *(_QWORD *)(v0 + 40);
    v38 = *(_QWORD *)(v0 + 24);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
    goto LABEL_21;
  }
LABEL_4:
  v2 = (*(uint64_t (**)(void))(**(_QWORD **)(*(_QWORD *)(v0 + 16)
                                          + OBJC_IVAR___ATXAmbientSuggestionProvider_suggestionProvider)
                            + 144))();
  v3 = (void *)v2;
  v4 = MEMORY[0x24BEE4AF8];
  if (!v2)
  {
LABEL_15:
    v13 = *(_QWORD *)(v0 + 16);
    sub_2384BA2D8(0, v1, v4, (uint64_t)*(id *)(v13 + OBJC_IVAR___ATXAmbientSuggestionProvider_descriptorProvider), (uint64_t)v39);
    v14 = sub_2384BA4F0();
    v16 = v15;
    v17 = *(_QWORD *)(v13 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
    v18 = swift_task_alloc();
    *(_QWORD *)(v18 + 16) = v14;
    *(_QWORD *)(v18 + 24) = v16;
    v19 = (os_unfair_lock_s *)(v17 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(v17 + 24));
    v20 = *(_QWORD *)(v17 + 16);
    v21 = *(void (**)(uint64_t))(*(_QWORD *)v20 + 120);
    v22 = swift_bridgeObjectRetain();
    v21(v22);
    v23 = *(void (**)(uint64_t))(*(_QWORD *)v20 + 144);
    v24 = swift_bridgeObjectRetain();
    v23(v24);
    os_unfair_lock_unlock(v19);
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2384DB68C();

    v25 = v39[2];
    v26 = (void *)v39[4];
    v27 = (void *)v39[5];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2384DF134(v25);

LABEL_21:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___ATXContextualSuggestionSnapshot_contexts);
  v39[0] = MEMORY[0x24BEE4AF8];
  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v6)
      goto LABEL_7;
LABEL_14:
    swift_bridgeObjectRelease_n();
    v4 = v39[0];
    goto LABEL_15;
  }
  swift_bridgeObjectRetain_n();
  result = sub_2384DFD3C();
  v6 = result;
  if (!result)
    goto LABEL_14;
LABEL_7:
  if (v6 >= 1)
  {
    if ((v5 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      do
      {
        v9 = MEMORY[0x23B8366E4](v8++, v5);
        v10 = *(_QWORD *)(v9 + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_suggestions);
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        sub_2384DE550(v10);
      }
      while (v6 != v8);
    }
    else
    {
      v11 = v5 + 32;
      do
      {
        v11 += 8;
        v12 = swift_bridgeObjectRetain();
        sub_2384DE550(v12);
        --v6;
      }
      while (v6);
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2384DAE90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = sub_2384C78FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2384DF9AC();
  v6 = sub_2384DFB44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2384B0000, v5, v6, "Not producing ambient stack suggestions, no stacks in configuration", v7, 2u);
    MEMORY[0x23B836F18](v7, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 40);
  v10 = *(_QWORD *)(v0 + 24);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384DAF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = swift_allocObject();
  swift_beginAccess();
  v9 = (void *)MEMORY[0x23B836F90](a1 + 16);
  swift_unknownObjectWeakInit();

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  v10[5] = a2;
  sub_2384CAEBC((uint64_t)v6, (uint64_t)&unk_256913000, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2384DB084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[6] = a4;
  v5[7] = a5;
  v6 = sub_2384DF9B8();
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384DB0E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = sub_2384C78FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2384DF9AC();
  v6 = sub_2384DFB44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 72);
    v19 = *(_QWORD *)(v0 + 64);
    v20 = *(_QWORD *)(v0 + 80);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v21 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_2384DFEB0();
    *(_QWORD *)(v0 + 40) = sub_2384C1184(v10, v11, &v21);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v5, v6, "%s: received ambient debug rotation notification", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v9, -1, -1);
    MEMORY[0x23B836F18](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v20, v19);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 72);
    v12 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  v15 = *(_QWORD *)(v0 + 48) + 16;
  swift_beginAccess();
  v16 = MEMORY[0x23B836F90](v15);
  *(_QWORD *)(v0 + 88) = v16;
  if (v16)
  {
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v17;
    *v17 = v0;
    v17[1] = sub_2384DB2F4;
    return sub_2384DAA44();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2384DB2F4()
{
  uint64_t *v0;
  void *v1;
  uint64_t v3;

  v1 = *(void **)(*v0 + 88);
  v3 = *v0;
  swift_task_dealloc();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void sub_2384DB344()
{
  uint64_t v0;
  uint64_t ObjectType;
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  ObjectType = swift_getObjectType();
  v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_2384DC308(v3, v0, ObjectType, 300.0);
  os_unfair_lock_unlock(v4);
}

id sub_2384DB3CC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint8_t *v14;
  int *v15;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  objc_super v20;
  uint64_t v21[3];

  v1 = v0;
  swift_getObjectType();
  v2 = sub_2384DF9B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2384DF9AC();
  v8 = sub_2384DFB44();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v18 = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    v21[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = sub_2384DFEB0();
    v19 = sub_2384C1184(v12, v13, v21);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v7, v8, "%s deinit", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v11, -1, -1);
    v14 = v10;
    v1 = v18;
    MEMORY[0x23B836F18](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15 = (int *)&v1[OBJC_IVAR___ATXAmbientSuggestionProvider_debugRotationNotificationToken];
  swift_beginAccess();
  notify_cancel(*v15);
  v20.receiver = v1;
  v20.super_class = (Class)ATXAmbientSuggestionProvider;
  return objc_msgSendSuper2(&v20, sel_dealloc);
}

void sub_2384DB68C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t *v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  char *v27;
  char *v28;
  _QWORD v29[2];
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t ObjectType;
  uint64_t v37;
  uint64_t aBlock[6];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v2 = sub_2384DF9D0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2384DF9F4();
  v33 = *(_QWORD *)(v5 - 8);
  v34 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2384DF9B8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = sub_2384DF9AC();
  v13 = sub_2384DFB44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v30 = v1;
    v16 = v15;
    aBlock[0] = v15;
    v31 = v3;
    *(_DWORD *)v14 = 136315138;
    v29[1] = v14 + 4;
    v17 = sub_2384DFEB0();
    v37 = sub_2384C1184(v17, v18, aBlock);
    v3 = v31;
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v12, v13, "%s: requesting delegate notification", v14, 0xCu);
    swift_arrayDestroy();
    v19 = v16;
    v1 = v30;
    MEMORY[0x23B836F18](v19, -1, -1);
    MEMORY[0x23B836F18](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v20 = *(os_unfair_lock_s **)&v1[OBJC_IVAR___ATXAmbientSuggestionProvider_lock];
  v21 = (uint64_t *)&v20[4];
  v22 = v20 + 6;
  os_unfair_lock_lock(v20 + 6);
  sub_2384DBBD4(v21, (uint64_t)v1, aBlock);
  os_unfair_lock_unlock(v22);
  v23 = aBlock[0];
  if (aBlock[0])
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v1;
    *(_QWORD *)(v24 + 24) = v23;
    aBlock[4] = (uint64_t)sub_2384DF18C;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2384C448C;
    aBlock[3] = (uint64_t)&block_descriptor_78_0;
    v25 = _Block_copy(aBlock);
    v26 = v1;
    v27 = v32;
    sub_2384DF9E8();
    v37 = MEMORY[0x24BEE4AF8];
    sub_2384C6290(&qword_256912A98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912AA0);
    sub_2384DF228(&qword_256912AA8, &qword_256912AA0, MEMORY[0x24BEE12C8]);
    v28 = v35;
    sub_2384DFC28();
    MEMORY[0x23B8365A0](0, v27, v28, v25);
    _Block_release(v25);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v28, v2);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v34);
    swift_release();
  }
}

uint64_t ATXAmbientSuggestionProvider.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___ATXAmbientSuggestionProvider_delegate;
  swift_beginAccess();
  return MEMORY[0x23B836F90](v1);
}

uint64_t ATXAmbientSuggestionProvider.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

id sub_2384DBB88@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_delegate);
  *a2 = result;
  return result;
}

id sub_2384DBBC0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDelegate_, *a1);
}

uint64_t sub_2384DBBD4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  _BYTE *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t result;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;

  v59 = a1;
  v5 = sub_2384DF9B8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v57 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v57 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v57 - v16;
  v18 = (_BYTE *)(a2 + OBJC_IVAR___ATXAmbientSuggestionProvider_shouldDisableSuppressionTimerForTooling);
  swift_beginAccess();
  if (*v18 == 1)
  {
    v19 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v17, v19, v5);
    v20 = sub_2384DF9AC();
    v21 = sub_2384DFB44();
    if (os_log_type_enabled(v20, v21))
    {
      v58 = (uint64_t *)v6;
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v61 = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = sub_2384DFEB0();
      v60 = sub_2384C1184(v24, v25, &v61);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2384B0000, v20, v21, "%s: rotation suppression is disabled for tooling via property, notifying immediately", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v23, -1, -1);
      MEMORY[0x23B836F18](v22, -1, -1);

      v26 = ((uint64_t (*)(char *, uint64_t))v58[1])(v17, v5);
    }
    else
    {

      v26 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v17, v5);
    }
LABEL_15:
    v48 = *v59;
LABEL_21:
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v48 + 112))(v26);
    goto LABEL_22;
  }
  if (qword_256915BA0 != -1)
    swift_once();
  v27 = (void *)qword_256915C38;
  if (qword_256915C38)
  {
    sub_2384CD9B4();
    v28 = v6;
    swift_bridgeObjectRetain();
    v29 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v27, sel_BOOLForKey_, v29);

    v6 = v28;
    if (v30)
    {
      v31 = sub_2384C78FC();
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v15, v31, v5);
      v32 = sub_2384DF9AC();
      v33 = sub_2384DFB44();
      if (os_log_type_enabled(v32, v33))
      {
        v58 = a3;
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        v61 = v35;
        *(_DWORD *)v34 = 136315138;
        v36 = sub_2384DFEB0();
        v60 = sub_2384C1184(v36, v37, &v61);
        a3 = v58;
        sub_2384DFC04();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2384B0000, v32, v33, "%s: rotation suppression is disabled via defaults override, notifying immediately", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B836F18](v35, -1, -1);
        MEMORY[0x23B836F18](v34, -1, -1);
      }

      v26 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v5);
      goto LABEL_15;
    }
  }
  v38 = *(void **)(*v59 + 32);
  if (!objc_msgSend(v38, sel_isScheduled))
  {
    v49 = sub_2384C78FC();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v49, v5);
    v50 = sub_2384DF9AC();
    v51 = sub_2384DFB44();
    if (os_log_type_enabled(v50, v51))
    {
      v58 = a3;
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = swift_slowAlloc();
      v61 = v53;
      *(_DWORD *)v52 = 136315138;
      v54 = sub_2384DFEB0();
      v60 = sub_2384C1184(v54, v55, &v61);
      a3 = v58;
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2384B0000, v50, v51, "%s: no delegate notification suspension timer scheduled, notifying immediately", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v53, -1, -1);
      MEMORY[0x23B836F18](v52, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v48 = *v59;
    v26 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v59 + 168))(0);
    goto LABEL_21;
  }
  objc_msgSend(v38, sel_timeRemaining);
  v40 = v39;
  v41 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v41, v5);
  v42 = sub_2384DF9AC();
  v43 = sub_2384DFB44();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = swift_slowAlloc();
    v45 = swift_slowAlloc();
    v61 = v45;
    *(_DWORD *)v44 = 136315394;
    v58 = (uint64_t *)v6;
    v46 = sub_2384DFEB0();
    v60 = sub_2384C1184(v46, v47, &v61);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2048;
    v60 = v40;
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v42, v43, "%s: delegate notification suspension timer already scheduled %f seconds left, setting notification to pending", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v45, -1, -1);
    MEMORY[0x23B836F18](v44, -1, -1);

    ((void (*)(char *, uint64_t))v58[1])(v12, v5);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)*v59 + 168))(1);
  result = 0;
LABEL_22:
  *a3 = result;
  return result;
}

void sub_2384DC308(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  v7 = *(void **)(*(_QWORD *)a1 + 32);
  if (objc_msgSend(v7, sel_isScheduled))
  {
    objc_msgSend(v7, sel_timeRemaining);
    if (v8 > a4)
      a4 = v8;
  }
  objc_msgSend(v7, sel_cancel);
  v9 = *(_QWORD *)(a2 + OBJC_IVAR___ATXAmbientSuggestionProvider_calloutQueue);
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = a3;
  v14[4] = sub_2384DEFC8;
  v14[5] = v11;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_2384B6BD4;
  v14[3] = &block_descriptor_61;
  v12 = _Block_copy(v14);
  v13 = v7;
  swift_release();
  objc_msgSend(v13, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v9, v12, a4, 1.0);
  _Block_release(v12);

}

uint64_t sub_2384DC45C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint8_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = sub_2384DF9B8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v32 - v10;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)*a1 + 160))(v9);
  v13 = sub_2384C78FC();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  if ((v12 & 1) != 0)
  {
    v14(v11, v13, v4);
    v15 = sub_2384DF9AC();
    v16 = sub_2384DFB44();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v33 = a2;
      v19 = v18;
      v35 = v18;
      *(_DWORD *)v17 = 136315138;
      v32 = v17 + 4;
      v20 = sub_2384DFEB0();
      v34 = sub_2384C1184(v20, v21, &v35);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2384B0000, v15, v16, "%s: notification suspension timer fired. Notification was pending, so notifying delegate", v17, 0xCu);
      swift_arrayDestroy();
      v22 = v19;
      a2 = v33;
      MEMORY[0x23B836F18](v22, -1, -1);
      MEMORY[0x23B836F18](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    v23 = *a1;
    v24 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 168))(0);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v23 + 112))(v24);
  }
  else
  {
    v14(v8, v13, v4);
    v26 = sub_2384DF9AC();
    v27 = sub_2384DFB44();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v35 = v29;
      v33 = a2;
      *(_DWORD *)v28 = 136315138;
      v30 = sub_2384DFEB0();
      v34 = sub_2384C1184(v30, v31, &v35);
      a2 = v33;
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2384B0000, v26, v27, "%s: notification suspension timer fired. No notification pending, not notifying delegate", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v29, -1, -1);
      MEMORY[0x23B836F18](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    result = 0;
  }
  *a2 = result;
  return result;
}

id ATXAmbientSuggestionProvider.provider(_:didUpdate:)()
{
  return sub_2384DEA08("%s: suggestion provider updated snapshot, requesting coalesced refresh");
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.ambientConfigurationManagerCacheDidUpdate()()
{
  sub_2384DEA08("%s: configuration manager cache did update, requesting coalesced refresh");
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.logViewDidAppear()()
{
  uint64_t v0;

  v0 = sub_2384D993C();
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 128))(v0);
  swift_release();
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.logViewDidDisappear()()
{
  uint64_t v0;

  v0 = sub_2384D993C();
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 136))(v0);
  swift_release();
}

Swift::Void __swiftcall ATXAmbientSuggestionProvider.logUserDidTap(_:)(ATXWidget *a1)
{
  uint64_t v2;

  v2 = sub_2384D993C();
  (*(void (**)(ATXWidget *))(*(_QWORD *)v2 + 144))(a1);
  swift_release();
}

uint64_t ATXAmbientSuggestionProvider.logStackDidChange(to:reason:)(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v14;

  ObjectType = swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD5A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2384DFAF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a1;
  v10[6] = a2;
  v10[7] = ObjectType;
  v11 = v2;
  v12 = a1;
  sub_2384CAEBC((uint64_t)v8, (uint64_t)&unk_256912F88, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2384DCA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  v8 = sub_2384DF9B8();
  v7[14] = v8;
  v7[15] = *(_QWORD *)(v8 - 8);
  v7[16] = swift_task_alloc();
  v7[17] = swift_task_alloc();
  v7[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2384DCADC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[10] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[19] = v1;
  v0[20] = *(_QWORD *)(*(_QWORD *)v1 + 240);
  return swift_task_switch();
}

uint64_t sub_2384DCB0C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 168) = (*(uint64_t (**)(void))(v0 + 160))();
  *(_QWORD *)(v0 + 176) = 0;
  return swift_task_switch();
}

uint64_t sub_2384DCB70()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74[2];

  v1 = *(_QWORD *)(v0 + 168);
  if (!v1)
    goto LABEL_17;
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v50 = sub_2384DFD3C();
  swift_bridgeObjectRelease();
  if (!v50)
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    v52 = *(_QWORD *)(v0 + 120);
    v51 = *(_QWORD *)(v0 + 128);
    v53 = *(_QWORD *)(v0 + 112);
    v54 = sub_2384C78FC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v51, v54, v53);
    v55 = sub_2384DF9AC();
    v56 = sub_2384DFB44();
    v57 = os_log_type_enabled(v55, v56);
    v59 = *(_QWORD *)(v0 + 120);
    v58 = *(_QWORD *)(v0 + 128);
    v18 = *(_QWORD *)(v0 + 112);
    if (v57)
    {
      v73 = *(_QWORD *)(v0 + 112);
      v60 = swift_slowAlloc();
      v61 = swift_slowAlloc();
      v74[0] = v61;
      *(_DWORD *)v60 = 136315394;
      v62 = sub_2384DFEB0();
      *(_QWORD *)(v0 + 16) = sub_2384C1184(v62, v63, v74);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v60 + 12) = 2080;
      *(_QWORD *)(v0 + 24) = sub_2384C1184(0xD00000000000001DLL, 0x80000002384E5070, v74);
      sub_2384DFC04();
      _os_log_impl(&dword_2384B0000, v55, v56, "%s.%s: not logging, no stacks in configuration", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v61, -1, -1);
      MEMORY[0x23B836F18](v60, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v73);
      goto LABEL_21;
    }

    v48 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v49 = v58;
    goto LABEL_20;
  }
LABEL_4:
  v2 = *(id *)(v0 + 88);
  v3 = sub_2384D1DC0(v1, v2);

  if (!v3)
  {
    v7 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 112);
    v9 = *(_QWORD *)(v0 + 120);
    v10 = *(void **)(v0 + 88);
    v11 = sub_2384C78FC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v11, v8);
    v12 = v10;
    swift_bridgeObjectRetain();
    v13 = v12;
    v14 = sub_2384DF9AC();
    v15 = sub_2384DFB44();
    v16 = os_log_type_enabled(v14, v15);
    v17 = *(_QWORD *)(v0 + 144);
    v18 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 120);
    if (v16)
    {
      v71 = *(_QWORD *)(v0 + 112);
      v20 = *(void **)(v0 + 88);
      v70 = *(_QWORD *)(v0 + 120);
      v21 = swift_slowAlloc();
      v65 = (_QWORD *)swift_slowAlloc();
      v66 = swift_slowAlloc();
      v74[0] = v66;
      *(_DWORD *)v21 = 136315906;
      v68 = v17;
      v22 = sub_2384DFEB0();
      *(_QWORD *)(v0 + 32) = sub_2384C1184(v22, v23, v74);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      *(_QWORD *)(v0 + 40) = sub_2384C1184(0xD00000000000001DLL, 0x80000002384E5070, v74);
      sub_2384DFC04();
      *(_WORD *)(v21 + 22) = 2112;
      *(_QWORD *)(v0 + 48) = v20;
      v24 = v20;
      sub_2384DFC04();
      *v65 = v20;

      *(_WORD *)(v21 + 32) = 2080;
      v25 = sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
      v26 = swift_bridgeObjectRetain();
      v27 = MEMORY[0x23B8364C8](v26, v25);
      v29 = v28;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 56) = sub_2384C1184(v27, v29, v74);
      sub_2384DFC04();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2384B0000, v14, v15, "%s.%s: not logging, could not find stack that contains %@ in configuration: %s", (uint8_t *)v21, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v65, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B836F18](v66, -1, -1);
      MEMORY[0x23B836F18](v21, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v68, v71);
      goto LABEL_21;
    }
    v47 = *(void **)(v0 + 88);

    swift_bridgeObjectRelease_n();
    v48 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v49 = v17;
LABEL_20:
    v48(v49, v18);
    goto LABEL_21;
  }
  v4 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRelease();
  v5 = *(void **)(v0 + 88);
  if (v4 == 2)
    v6 = sub_2384DD4CC(v5);
  else
    v6 = v5;
  v30 = v6;
  v31 = *(_QWORD *)(v0 + 136);
  v33 = *(_QWORD *)(v0 + 112);
  v32 = *(_QWORD *)(v0 + 120);
  v34 = *(_QWORD *)(v0 + 96);
  v35 = sub_2384D993C();
  v72 = v30;
  (*(void (**)(void *, id, uint64_t))(*(_QWORD *)v35 + 152))(v3, v30, v34);
  swift_release();
  v36 = sub_2384C78FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v36, v33);
  v37 = sub_2384DF9AC();
  v38 = sub_2384DFB44();
  v39 = os_log_type_enabled(v37, v38);
  v40 = *(_QWORD *)(v0 + 136);
  v41 = *(_QWORD *)(v0 + 112);
  v42 = *(_QWORD *)(v0 + 120);
  if (v39)
  {
    v69 = *(_QWORD *)(v0 + 120);
    v43 = swift_slowAlloc();
    v67 = v40;
    v44 = swift_slowAlloc();
    v74[0] = v44;
    *(_DWORD *)v43 = 136315394;
    v45 = sub_2384DFEB0();
    *(_QWORD *)(v0 + 64) = sub_2384C1184(v45, v46, v74);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    *(_QWORD *)(v0 + 72) = sub_2384C1184(0xD00000000000001DLL, 0x80000002384E5070, v74);
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v37, v38, "%s.%s: resetting delegate notification suspension timer", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v44, -1, -1);
    MEMORY[0x23B836F18](v43, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v67, v41);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
  }
  sub_2384DB344();

LABEL_21:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384DD2E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = sub_2384C78FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2384DF9AC();
  v6 = sub_2384DFB44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 120);
    v17 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 112);
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v18 = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = sub_2384DFEB0();
    *(_QWORD *)(v0 + 16) = sub_2384C1184(v11, v12, &v18);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    *(_QWORD *)(v0 + 24) = sub_2384C1184(0xD00000000000001DLL, 0x80000002384E5070, &v18);
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v5, v6, "%s.%s: not logging, no stacks in configuration", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v10, -1, -1);
    MEMORY[0x23B836F18](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v17, v8);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 120);
    v13 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 112);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_2384DD4CC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id result;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36[2];

  v31[1] = swift_getObjectType();
  v3 = sub_2384DF9B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  v8 = (*(uint64_t (**)(void))(**(_QWORD **)(v7 + 16) + 112))();
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  if (v8)
  {
    v36[0] = MEMORY[0x24BEE4AF8];
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      result = (id)sub_2384DFD3C();
      v9 = (uint64_t)result;
      if (result)
        goto LABEL_4;
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      result = (id)swift_bridgeObjectRetain();
      if (v9)
      {
LABEL_4:
        if (v9 < 1)
        {
          __break(1u);
          return result;
        }
        v32 = v4;
        v33 = v3;
        for (i = 0; i != v9; ++i)
        {
          if ((v8 & 0xC000000000000001) != 0)
            v12 = (id)MEMORY[0x23B8366E4](i, v8);
          else
            v12 = *(id *)(v8 + 8 * i + 32);
          v13 = v12;
          v14 = objc_msgSend(v12, sel_topWidget);

          if (v14)
          {
            MEMORY[0x23B8364A4]();
            if (*(_QWORD *)((v36[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v36[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_2384DFAB4();
            sub_2384DFAC0();
            sub_2384DFAA8();
          }
        }
        swift_bridgeObjectRelease();
        v15 = v36[0];
        v4 = v32;
        v3 = v33;
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease();
    v16 = a1;
    v17 = (void *)sub_2384DEE08(v15, v16);
    swift_bridgeObjectRelease();

    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend(v18, sel_source);
      v20 = objc_msgSend(v16, sel_copyWithSource_, v19);

      return v20;
    }
  }
  v21 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v3);
  v34 = a1;
  v22 = sub_2384DF9AC();
  v23 = sub_2384DFB38();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v32 = v4;
    v26 = (_QWORD *)v25;
    v27 = swift_slowAlloc();
    v36[0] = v27;
    *(_DWORD *)v24 = 136315650;
    v28 = sub_2384DFEB0();
    v33 = v3;
    v35 = sub_2384C1184(v28, v29, v36);
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    v35 = sub_2384C1184(0xD00000000000002CLL, 0x80000002384E5020, v36);
    sub_2384DFC04();
    *(_WORD *)(v24 + 22) = 2112;
    v35 = (uint64_t)v34;
    v30 = v34;
    sub_2384DFC04();
    *v26 = v34;

    _os_log_impl(&dword_2384B0000, v22, v23, "%s.%s: could not find widget suggestion for systemSuggest rotation to %@", (uint8_t *)v24, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256912AD0);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v26, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v27, -1, -1);
    MEMORY[0x23B836F18](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v33);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v34;
}

void ATXAmbientSuggestionProvider.logWidgetStack(_:didChangeTo:reason:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = v3;
  ObjectType = swift_getObjectType();
  v9 = sub_2384DF9B8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 == 2)
    v13 = sub_2384DD4CC(a2);
  else
    v13 = a2;
  v14 = v13;
  v15 = sub_2384D993C();
  (*(void (**)(uint64_t, void *, uint64_t))(*(_QWORD *)v15 + 152))(a1, v14, a3);
  swift_release();
  v16 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v16, v9);
  v17 = sub_2384DF9AC();
  v18 = sub_2384DFB44();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v33 = v14;
    v21 = v20;
    v35 = v20;
    *(_DWORD *)v19 = 136315394;
    v22 = sub_2384DFEB0();
    v32 = ObjectType;
    v34 = sub_2384C1184(v22, v23, &v35);
    v31 = v9;
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v34 = sub_2384C1184(0xD000000000000025, 0x80000002384E4D10, &v35);
    sub_2384DFC04();
    _os_log_impl(&dword_2384B0000, v17, v18, "%s.%s: resetting delegate notification suspension timer", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    v24 = v21;
    v14 = v33;
    MEMORY[0x23B836F18](v24, -1, -1);
    MEMORY[0x23B836F18](v19, -1, -1);

    v25 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26 = v32;
    v25(v12, v31);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v26 = ObjectType;
  }
  v27 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  v28 = (uint64_t)&v27[4];
  v29 = v27 + 6;
  os_unfair_lock_lock(v27 + 6);
  sub_2384DC308(v28, v4, v26, 300.0);
  os_unfair_lock_unlock(v29);

}

id sub_2384DDDA0()
{
  return sub_2384DEA08("%s: suggestion provider updated snapshot, requesting coalesced refresh");
}

uint64_t ATXAmbientSuggestionProvider.readStacks()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_2384DDDD4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[3] = v1;
  v0[4] = *(_QWORD *)(*(_QWORD *)v1 + 240);
  return swift_task_switch();
}

uint64_t sub_2384DDE04()
{
  uint64_t v0;
  uint64_t v1;

  v1 = (*(uint64_t (**)(void))(v0 + 32))();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2384DDF6C(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_2384DDFB4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[4] = v1;
  v0[5] = *(_QWORD *)(*(_QWORD *)v1 + 240);
  return swift_task_switch();
}

uint64_t sub_2384DDFE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);

  v1 = (*(uint64_t (**)(void))(v0 + 40))();
  *(_QWORD *)(v0 + 48) = 0;
  v2 = v1;

  if (v2)
  {
    sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
    v3 = (void *)sub_2384DFA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  ((void (**)(_QWORD, void *, _QWORD))v4)[2](v4, v3, 0);

  _Block_release(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384DE0B8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  v1 = *(void **)(v0 + 48);

  v2 = (void *)sub_2384DF8EC();
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v2);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ATXAmbientSuggestionProvider.write(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2384DE13C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[3] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[4] = v1;
  v0[5] = *(_QWORD *)(*(_QWORD *)v1 + 248);
  return swift_task_switch();
}

uint64_t sub_2384DE16C()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 40))(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384DE2EC(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v5;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_2384B97C8(0, (unint64_t *)&unk_2542CD5C0);
  v3[4] = sub_2384DFA90();
  v5 = a3;
  return swift_task_switch();
}

uint64_t sub_2384DE364()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + OBJC_IVAR___ATXAmbientSuggestionProvider_configurationManager);
  v0[5] = v1;
  v0[6] = *(_QWORD *)(*(_QWORD *)v1 + 248);
  return swift_task_switch();
}

uint64_t sub_2384DE394()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(_QWORD))(v0 + 48))(*(_QWORD *)(v0 + 32));
  *(_QWORD *)(v0 + 56) = 0;
  v1 = *(_QWORD *)(v0 + 24);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2384DE42C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 24);

  swift_bridgeObjectRelease();
  v3 = (void *)sub_2384DF8EC();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_2384DE4A4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2384DE4B4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t _s11GuardedDataCMa()
{
  return objc_opt_self();
}

uint64_t sub_2384DE4E0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2384DE504()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384DE528()
{
  uint64_t v0;

  return sub_2384DA6BC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_2384DE548()
{
  uint64_t v0;

  return sub_2384DAF6C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2384DE550(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B8366F0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2384DE708(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_2384DFAA8();
  }
  __break(1u);
  return result;
}

uint64_t sub_2384DE708(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2384DFD3C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2384DF228(&qword_256913010, &qword_256912738, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256912738);
          v12 = sub_2384DE914(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for ContextualSuggestion();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_2384DFD6C();
  __break(1u);
  return result;
}

void (*sub_2384DE914(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2384DE994(v6, a2, a3);
  return sub_2384DE968;
}

void sub_2384DE968(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2384DE994(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B8366E4](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_2384DEA00;
  }
  __break(1u);
  return result;
}

void sub_2384DEA00(id *a1)
{

}

id sub_2384DEA08(const char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id result;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v1;
  swift_getObjectType();
  v4 = sub_2384DF9B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2384C78FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_2384DF9AC();
  v10 = sub_2384DFB44();
  if (os_log_type_enabled(v9, v10))
  {
    v18 = v3;
    v11 = swift_slowAlloc();
    v17 = a1;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v20 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_2384DFEB0();
    v19 = sub_2384C1184(v14, v15, &v20);
    v3 = v18;
    sub_2384DFC04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2384B0000, v9, v10, v17, v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B836F18](v13, -1, -1);
    MEMORY[0x23B836F18](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = *(id *)(v3 + OBJC_IVAR___ATXAmbientSuggestionProvider_refreshTimer);
  if (result)
    return objc_msgSend(result, sel_runAfterDelaySeconds_coalescingBehavior_, 0, 1.0);
  __break(1u);
  return result;
}

uint64_t sub_2384DEBE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2384B8814;
  return sub_2384DCA5C((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

char *keypath_get_selector_delegate()
{
  return sel_delegate;
}

uint64_t type metadata accessor for ATXAmbientSuggestionProvider(uint64_t a1)
{
  return sub_2384B97C8(a1, qword_256915BA8);
}

uint64_t sub_2384DEC6C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2384DECA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2384B8814;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_256912FA0 + dword_256912FA0))(v2, v3, v4);
}

uint64_t sub_2384DED14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384DED38()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_2384DED64()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8814;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256912FC8 + dword_256912FC8))(v2, v3);
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2384DEE08(unint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  void *v20;

  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    v3 = sub_2384DFD3C();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = (id)MEMORY[0x23B8366E4](i - 4, a1);
          v7 = i - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_18;
        }
        else
        {
          v6 = *(id *)(a1 + 8 * i);
          v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        v20 = v6;
        v8 = objc_msgSend(v6, sel_identifier);
        v9 = sub_2384DFA30();
        v11 = v10;

        v12 = objc_msgSend(a2, sel_identifier);
        v13 = sub_2384DFA30();
        v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          v3 = (uint64_t)v20;
          swift_bridgeObjectRelease();
          return v3;
        }
        v17 = sub_2384DFDD8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) != 0)
          goto LABEL_17;

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

void sub_2384DEFC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_unfair_lock_s *v4;
  uint64_t *v5;
  os_unfair_lock_s *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B836F90](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
    v5 = (uint64_t *)&v4[4];
    v6 = v4 + 6;
    os_unfair_lock_lock(v4 + 6);
    sub_2384DC45C(v5, &v10);
    os_unfair_lock_unlock(v6);
    if (v10)
    {
      v7 = objc_msgSend(v3, sel_delegate);
      if (v7)
      {
        v8 = v7;
        type metadata accessor for ATXWidgetStackSuggestion(0);
        v9 = sub_2384DFA84();
        swift_bridgeObjectRelease();
        objc_msgSend(v8, sel_suggestionProvider_didUpdateStackSuggestions_, v3, v9);
        swift_unknownObjectRelease();

        v3 = (void *)v9;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }

  }
}

uint64_t sub_2384DF0E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8814;
  return sub_2384DB084((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_2384DF134(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2384DF160()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2384DF18C()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, sel_delegate);
  if (v2)
  {
    v3 = v2;
    type metadata accessor for ATXWidgetStackSuggestion(0);
    v4 = (id)sub_2384DFA84();
    objc_msgSend(v3, sel_suggestionProvider_didUpdateStackSuggestions_, v1, v4);
    swift_unknownObjectRelease();

  }
}

uint64_t sub_2384DF228(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B836E94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroy_69Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384DF298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2384B8814;
  return sub_2384DA7D4((uint64_t)v4, v5, v6, v2, v3);
}

void *sub_2384DF328()
{
  return &unk_250A2EA10;
}

unint64_t contextualSuggestionServiceMachServiceName.getter()
{
  return 0xD000000000000034;
}

uint64_t contextualSuggestionServerInterface.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_25691CF38);
  v0 = sub_2384B97C8(0, (unint64_t *)&unk_2542CD5E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD610);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2384E0E70;
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256913090);
  *(_QWORD *)(v1 + 32) = v0;
  v2 = sub_2384B97C8(0, (unint64_t *)&qword_256912EF0);
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569130A0);
  *(_QWORD *)(v1 + 64) = v2;
  MEMORY[0x23B8365DC](v1);
  result = sub_2384DFB08();
  __break(1u);
  __break(1u);
  return result;
}

uint64_t contextualSuggestionServiceInterface.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256918048);
  sub_2384B97C8(0, (unint64_t *)&unk_2542CD5E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CD610);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2384E1B70;
  v1 = sub_2384B97C8(0, &qword_256912C90);
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569130B0);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = sub_2384B97C8(0, (unint64_t *)&qword_256912EF0);
  *(_QWORD *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569130A0);
  *(_QWORD *)(v0 + 64) = v2;
  v3 = type metadata accessor for ContextualSuggestionSnapshot();
  *(_QWORD *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_256912C98);
  *(_QWORD *)(v0 + 96) = v3;
  MEMORY[0x23B8365DC](v0);
  result = sub_2384DFB08();
  __break(1u);
  return result;
}

uint64_t sub_2384DF874()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2384DF880()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2384DF88C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2384DF898()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_2384DF8A4()
{
  return MEMORY[0x24BDCB910]();
}

uint64_t sub_2384DF8B0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2384DF8BC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2384DF8C8()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2384DF8D4()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_2384DF8E0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2384DF8EC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2384DF8F8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2384DF904()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2384DF910()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2384DF91C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2384DF928()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2384DF934()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2384DF940()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2384DF94C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2384DF958()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2384DF964()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2384DF970()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2384DF97C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2384DF988()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2384DF994()
{
  return MEMORY[0x24BE16898]();
}

uint64_t sub_2384DF9A0()
{
  return MEMORY[0x24BE168A0]();
}

uint64_t sub_2384DF9AC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2384DF9B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2384DF9C4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2384DF9D0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2384DF9DC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2384DF9E8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2384DF9F4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2384DFA00()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2384DFA0C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2384DFA18()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2384DFA24()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2384DFA30()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2384DFA3C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2384DFA48()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2384DFA54()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2384DFA60()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2384DFA6C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2384DFA78()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2384DFA84()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2384DFA90()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2384DFA9C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2384DFAA8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2384DFAB4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2384DFAC0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2384DFACC()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2384DFAD8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2384DFAE4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2384DFAF0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2384DFAFC()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2384DFB08()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_2384DFB14()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2384DFB20()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2384DFB2C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2384DFB38()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2384DFB44()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2384DFB50()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2384DFB5C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2384DFB68()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_2384DFB74()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2384DFB80()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2384DFB8C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2384DFB98()
{
  return MEMORY[0x24BE16908]();
}

uint64_t sub_2384DFBA4()
{
  return MEMORY[0x24BE16918]();
}

uint64_t sub_2384DFBB0()
{
  return MEMORY[0x24BDD00F8]();
}

uint64_t sub_2384DFBBC()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2384DFBC8()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_2384DFBD4()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2384DFBE0()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2384DFBEC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2384DFBF8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2384DFC04()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2384DFC10()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2384DFC1C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2384DFC28()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2384DFC34()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2384DFC40()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2384DFC4C()
{
  return MEMORY[0x24BEE2398]();
}

uint64_t sub_2384DFC58()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2384DFC64()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2384DFC70()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_2384DFC7C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2384DFC88()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2384DFC94()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2384DFCA0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2384DFCAC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2384DFCB8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2384DFCC4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2384DFCD0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2384DFCDC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2384DFCE8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2384DFCF4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2384DFD00()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2384DFD0C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2384DFD18()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_2384DFD24()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2384DFD30()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2384DFD3C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2384DFD48()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2384DFD54()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2384DFD60()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2384DFD6C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2384DFD78()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_2384DFD84()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2384DFD90()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2384DFD9C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2384DFDA8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2384DFDB4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2384DFDC0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2384DFDCC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2384DFDD8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2384DFDE4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2384DFDF0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2384DFDFC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2384DFE08()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2384DFE14()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2384DFE20()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2384DFE2C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2384DFE38()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2384DFE44()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2384DFE50()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2384DFE5C()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_2384DFE68()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_2384DFE74()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_2384DFE80()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2384DFE8C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2384DFE98()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2384DFEA4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2384DFEB0()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t ATXBundleIdIsSpecialWidgetExtensionBundleId()
{
  return MEMORY[0x24BE04250]();
}

uint64_t ATXSpecialWidgetKindAppPredictions()
{
  return MEMORY[0x24BE04268]();
}

uint64_t ATXSpecialWidgetKindFiles()
{
  return MEMORY[0x24BE04270]();
}

uint64_t ATXSpecialWidgetKindShortcutsSingle()
{
  return MEMORY[0x24BE04278]();
}

uint64_t ATXSpecialWidgetKindSiriSuggestions()
{
  return MEMORY[0x24BE04280]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x24BE16960]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x24BE16980]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

