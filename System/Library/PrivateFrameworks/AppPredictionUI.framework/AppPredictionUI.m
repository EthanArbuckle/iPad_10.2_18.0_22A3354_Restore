void APUIRegisterCardServicesIfNeeded()
{
  if (APUIRegisterCardServicesIfNeeded_onceToken != -1)
    dispatch_once(&APUIRegisterCardServicesIfNeeded_onceToken, &__block_literal_global_0);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global);
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
  if (__atxlog_handle_settings_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82);
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

uint64_t APUIIsIntentFromSystemApp(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "launchId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "launchId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    INExtractAppInfoFromSiriLaunchId();
    v4 = 0;
    v5 = 0;

    v6 = 0;
    if (v4 && v5)
    {
      v7 = (void *)MEMORY[0x24BE04100];
      ATXBundleIdReplacementForBundleId();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isSystemAppForBundleId:", v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_22633C894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void APUIRegisterCardKitProvidersIfNeeded()
{
  if (APUIRegisterCardKitProvidersIfNeeded_onceToken != -1)
    dispatch_once(&APUIRegisterCardKitProvidersIfNeeded_onceToken, &__block_literal_global_10);
}

void sub_22633C9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id APUIPointImageOfColor(void *a1)
{
  id v1;
  void *v2;
  CGSize v4;
  CGRect v5;

  v1 = a1;
  v4.width = 1.0;
  v4.height = 1.0;
  UIGraphicsBeginImageContext(v4);
  objc_msgSend(v1, "set");

  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 1.0;
  UIRectFill(v5);
  UIGraphicsGetImageFromCurrentImageContext();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v2;
}

Class __getACSCardServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AssistantCardServiceSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24EDBF650;
    v5 = 0;
    AssistantCardServiceSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AssistantCardServiceSupportLibraryCore_frameworkLibrary)
    __getACSCardServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("ACSCardService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getACSCardServiceClass_block_invoke_cold_2();
  getACSCardServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVSUICKPEntryPointClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24EDBF668;
    v5 = 0;
    VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceShortcutsUICardKitProviderSupportLibraryCore_frameworkLibrary)
    __getVSUICKPEntryPointClass_block_invoke_cold_1(&v3);
  result = objc_getClass("VSUICKPEntryPoint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVSUICKPEntryPointClass_block_invoke_cold_2();
  getVSUICKPEntryPointClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void __getACSCardServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AssistantCardServiceSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("APUIUtilities.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getACSCardServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getACSCardServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("APUIUtilities.m"), 36, CFSTR("Unable to find class %s"), "ACSCardService");

  __break(1u);
}

void __getVSUICKPEntryPointClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VoiceShortcutsUICardKitProviderSupportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("APUIUtilities.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVSUICKPEntryPointClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVSUICKPEntryPointClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("APUIUtilities.m"), 40, CFSTR("Unable to find class %s"), "VSUICKPEntryPoint");

  __break(1u);
}

uint64_t ATXBundleIdReplacementForBundleId()
{
  return MEMORY[0x24BE04258]();
}

uint64_t ATXBundleIdReplacementForBundleIdWithWebpageURLHint()
{
  return MEMORY[0x24BE04260]();
}

uint64_t INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity()
{
  return MEMORY[0x24BDD98B8]();
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x24BDD98D8]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

