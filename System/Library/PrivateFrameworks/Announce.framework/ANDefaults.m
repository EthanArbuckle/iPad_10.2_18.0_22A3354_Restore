@implementation ANDefaults

- (ANDefaults)init
{
  ANDefaults *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *defaultsItems;
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
  void *v31;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_super v63;
  _QWORD v64[55];
  _QWORD v65[57];

  v65[55] = *MEMORY[0x24BDAC8D0];
  v63.receiver = self;
  v63.super_class = (Class)ANDefaults;
  v2 = -[ANDefaults init](&v63, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.announce"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v64[0] = CFSTR("announce_enabled");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Announce Enabled for the Local Device (Only valid when HPSFeatureStatus.isLocalSettingsEnabled == true)"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v62;
    v64[1] = CFSTR("announcement_receipt_expiration");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379808, CFSTR("[Int] Announcement Receipt Expiration in Seconds"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v61;
    v64[2] = CFSTR("ids_server_message_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379748, CFSTR("[Int] IDS Server Message Timeout in Seconds"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v60;
    v64[3] = CFSTR("announcement_user_notification_expiration");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379818, CFSTR("[Int] Announcement User Notification Expiration in Seconds"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v59;
    v64[4] = CFSTR("allow_announcement_to_accessory_physically_in_target_home");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Allow Announcements to Accessory if the Accessory is physically located in the target home"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v65[4] = v58;
    v64[5] = CFSTR("relay_announcements_through_resident");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Relay Announcements through a Resident HomePod"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v65[5] = v57;
    v64[6] = CFSTR("send_transaction_active_memory_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379828, CFSTR("[Double] How long (in seconds) to stay in active memory when sending an announcement"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v65[6] = v56;
    v64[7] = CFSTR("use_rapport");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Use Rapport (when available) in addition to IDS"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v65[7] = v55;
    v64[8] = CFSTR("rapport_scan_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379838, CFSTR("[Double] How long to wait after starting a scan before checking active devices"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v65[8] = v54;
    v64[9] = CFSTR("rapport_scan_duration");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379848, CFSTR("[Double] How long to continue scanning before deactivating the link client"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v65[9] = v53;
    v64[10] = CFSTR("rapport_scan_interval");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379828, CFSTR("[Double] How often to scan for devices"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v65[10] = v52;
    v64[11] = CFSTR("rapport_send_message_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379858, CFSTR("[Double] Send Message Timeout"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v65[11] = v51;
    v64[12] = CFSTR("rapport_send_home_location_status_request_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379868, CFSTR("[Double] Send Home Location Status Request Timeout in seconds"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65[12] = v50;
    v64[13] = CFSTR("announcement_deadline");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379878, CFSTR("[Double] Announcement deadline"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v65[13] = v49;
    v64[14] = CFSTR("announcement_playback_minimum_delay");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379868, CFSTR("[Double] Minimum Delay Before Playing an Announcement in seconds"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v65[14] = v48;
    v64[15] = CFSTR("silence_between_tracks_ms");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379778, CFSTR("[Int] Silence to insert between each track in milliseconds"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v65[15] = v47;
    v64[16] = CFSTR("previous_goes_to_previous_ms");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379790, CFSTR("[Int] Amount of time into a track where previous goes back to beginning in milliseconds"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v65[16] = v46;
    v64[17] = CFSTR("start_tone_trim");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379888, CFSTR("[Double] Amount to trim off the start tone tail in seconds"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65[17] = v45;
    v64[18] = CFSTR("transition_tone_trim");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379898, CFSTR("[Double] Amount to trim off the transition tone tail in seconds"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v65[18] = v44;
    v64[19] = CFSTR("force_allow_announce_for_all_users");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Forces Announce Access Allowed to be true for any HMUser"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65[19] = v43;
    v64[20] = CFSTR("force_allow_announce_for_all_accessories");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Forces Announce Access Allowed to be true for all Accessories"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v65[20] = v42;
    v64[21] = CFSTR("force_supports_announce_for_all_accessories");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Forces Announce Supported to be true for all Accessories"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v65[21] = v41;
    v64[22] = CFSTR("force_allow_announce_notifications_for_all_users");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Forces Announce Notifications for any HMUser"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v65[22] = v40;
    v64[23] = CFSTR("force_send_failures");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Force Announcement Send Failures"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v65[23] = v39;
    v64[24] = CFSTR("force_delivery_failures");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Force Announcement Delivery Failures"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v65[24] = v38;
    v64[25] = CFSTR("audio_session_wait_for_call_end_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798A8, CFSTR("[Double] Audio Session Wait For Call End Timeout in Seconds"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v65[25] = v37;
    v64[26] = CFSTR("audio_session_activation_retry_delay");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798A8, CFSTR("[Double] Audio Session Activation Retry Delay in Seconds"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v65[26] = v36;
    v64[27] = CFSTR("audio_session_deactivation_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3797A8, CFSTR("[Int] Audio Session Deactivation Timeout in Seconds"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65[27] = v35;
    v64[28] = CFSTR("audio_session_resume_after_interruption_delay");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798B8, CFSTR("[Double] Audio Session Resume after Interruption Delay in Seconds"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v65[28] = v34;
    v64[29] = CFSTR("resume_playback_after_interruption_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379828, CFSTR("[Double] Playback Audio Session Interruption Resume Timeout in Seconds"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v65[29] = v33;
    v64[30] = CFSTR("normalize_audio");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Normalize Audio in Announcement before sending"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v65[30] = v32;
    v64[31] = CFSTR("send_analytics");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Fire events to CoreAnalytics"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v65[31] = v31;
    v64[32] = CFSTR("use_coordinated_alerts");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Scan devices to find the best one to prominently alert an Announcement Notification"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65[32] = v30;
    v64[33] = CFSTR("announcement_entry_age_limit");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3797C0, CFSTR("[Int] An announcement's age in seconds that is considered too old for it to be accepted"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[33] = v29;
    v64[34] = CFSTR("announcement_storage_age_limit");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3797D8, CFSTR("[Int] An announcement's age in seconds that is considered too old for it to be kept around"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v65[34] = v28;
    v64[35] = CFSTR("siri_interruption_stops_playback");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Siri should explicitly stop playback. When false, playback will be stopped by audio session interruption."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65[35] = v27;
    v64[36] = CFSTR("playback_status_returns_immediately");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Return playback status immediately after starting playback"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65[36] = v26;
    v64[37] = CFSTR("analytics_daily_background_activity");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Start a 24 hour interval to run a background task for collecting daily metrics"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v65[37] = v25;
    v64[38] = CFSTR("analytics_daily_background_activity_ts");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798C8, CFSTR("[Double] A timestamp of when the activity was last triggered"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65[38] = v24;
    v64[39] = CFSTR("daily_home_announcements_count");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", MEMORY[0x24BDBD1B8], CFSTR("[NSDictionary] A dictionary of the number of announcements sent/received per home per location group"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v65[39] = v23;
    v64[40] = CFSTR("use_original_audio_file_on_process_failure");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Use Original Audio Files if Audio Processing Fails or produces a bad output"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v65[40] = v22;
    v64[41] = CFSTR("keep_sent_audio_files");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Keep Sent Audio Files"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v65[41] = v21;
    v64[42] = CFSTR("keep_received_audio_files");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Keep Received Audio Files"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v65[42] = v20;
    v64[43] = CFSTR("play_sound_on_critical_failure");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Play a Sound when a critical failure occurs. Useful on HomePod, which does not contain a display"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65[43] = v19;
    v64[44] = CFSTR("audio_accessory_db_boost");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798D8, CFSTR("[Float] Playback dB Boost for Audio Accessories"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v65[44] = v18;
    v64[45] = CFSTR("transcription_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798E8, CFSTR("[Double] On-device transcription wait timeout in seconds"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v65[45] = v17;
    v64[46] = CFSTR("user_notification_include_transcription");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Include transcription in User Notification Body"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v65[46] = v5;
    v64[47] = CFSTR("user_notification_unified_banner");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Post a single user notification for all announcements for each Home"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v65[47] = v6;
    v64[48] = CFSTR("user_notification_include_recipients");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379760, CFSTR("[BOOL] Include recipients in communication user notificaitons"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v65[48] = v7;
    v64[49] = CFSTR("enable_save_announcement_meta_data");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Enable Save Announcement Meta Data in User Defaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v65[49] = v8;
    v64[50] = CFSTR("check_residents_for_ids");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379730, CFSTR("[BOOL] Perform Resident-level checks when sending over IDS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v65[50] = v9;
    v64[51] = CFSTR("track_player_playback_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798F8, CFSTR("[Double] Track Player Playback Timeout Value in seconds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v65[51] = v10;
    v64[52] = CFSTR("accessory_settings_refresh_interval");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D379908, CFSTR("[Double] Accessory settings refresh interval in seconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v65[52] = v11;
    v64[53] = CFSTR("disable_homekit_caching");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", MEMORY[0x24BDBD1C0], CFSTR("[BOOL] Disable HomeKit Caching"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[53] = v12;
    v64[54] = CFSTR("homekit_refresh_timeout");
    +[ANDefaultsItem itemWithValue:userInfo:](ANDefaultsItem, "itemWithValue:userInfo:", &unk_24D3798A8, CFSTR("[Double] Duration to wait for HomeKit refresh in seconds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65[54] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 55);
    v14 = objc_claimAutoreleasedReturnValue();
    defaultsItems = v2->_defaultsItems;
    v2->_defaultsItems = (NSDictionary *)v14;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ANDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedDefaults;
}

void __28__ANDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedDefaults;
  sharedInstance_sharedDefaults = (uint64_t)v1;

}

- (id)objectForDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_defaultsItems, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)numberForDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_defaultsItems, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)BOOLForDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_defaultsItems, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v5, "BOOLValue");

  return v7;
}

- (void)setObject:(id)a3 forDefault:(id)a4
{
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", a3, a4);
}

- (void)setNumber:(id)a3 forDefault:(id)a4
{
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", a3, a4);
}

- (void)setBool:(BOOL)a3 forDefault:(id)a4
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, a4);
}

- (NSDictionary)defaultsItems
{
  return self->_defaultsItems;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_defaultsItems, 0);
}

@end
