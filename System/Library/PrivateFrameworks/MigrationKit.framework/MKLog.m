@implementation MKLog

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_4);
  return (id)log_log;
}

void __12__MKLog_log__block_invoke()
{
  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_1);
}

void __12__MKLog_log__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "network");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

+ (id)logForNetwork
{
  if (logForNetwork_onceToken != -1)
    dispatch_once(&logForNetwork_onceToken, &__block_literal_global_3);
  return (id)logForNetwork_log;
}

void __22__MKLog_logForNetwork__block_invoke()
{
  if (_block_invoke_2_onceToken != -1)
    dispatch_once(&_block_invoke_2_onceToken, &__block_literal_global_4);
}

void __22__MKLog_logForNetwork__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "network");
  v1 = (void *)logForNetwork_log;
  logForNetwork_log = (uint64_t)v0;

}

+ (id)logForMessages
{
  if (logForMessages_onceToken != -1)
    dispatch_once(&logForMessages_onceToken, &__block_literal_global_5);
  return (id)logForMessages_log;
}

void __23__MKLog_logForMessages__block_invoke()
{
  if (_block_invoke_3_onceToken != -1)
    dispatch_once(&_block_invoke_3_onceToken, &__block_literal_global_6);
}

void __23__MKLog_logForMessages__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "messages");
  v1 = (void *)logForMessages_log;
  logForMessages_log = (uint64_t)v0;

}

+ (id)logForContacts
{
  if (logForContacts_onceToken != -1)
    dispatch_once(&logForContacts_onceToken, &__block_literal_global_8);
  return (id)logForContacts_log;
}

void __23__MKLog_logForContacts__block_invoke()
{
  if (_block_invoke_4_onceToken != -1)
    dispatch_once(&_block_invoke_4_onceToken, &__block_literal_global_9);
}

void __23__MKLog_logForContacts__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "contacts");
  v1 = (void *)logForContacts_log;
  logForContacts_log = (uint64_t)v0;

}

+ (id)logForCallHistory
{
  if (logForCallHistory_onceToken != -1)
    dispatch_once(&logForCallHistory_onceToken, &__block_literal_global_11);
  return (id)logForCallHistory_log;
}

void __26__MKLog_logForCallHistory__block_invoke()
{
  if (_block_invoke_5_onceToken != -1)
    dispatch_once(&_block_invoke_5_onceToken, &__block_literal_global_12);
}

void __26__MKLog_logForCallHistory__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "call_history");
  v1 = (void *)logForCallHistory_log;
  logForCallHistory_log = (uint64_t)v0;

}

+ (id)logForCalendar
{
  if (logForCalendar_onceToken != -1)
    dispatch_once(&logForCalendar_onceToken, &__block_literal_global_14);
  return (id)logForCalendar_log;
}

void __23__MKLog_logForCalendar__block_invoke()
{
  if (_block_invoke_6_onceToken != -1)
    dispatch_once(&_block_invoke_6_onceToken, &__block_literal_global_15);
}

void __23__MKLog_logForCalendar__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "calendar");
  v1 = (void *)logForCalendar_log;
  logForCalendar_log = (uint64_t)v0;

}

+ (id)logForBookmarks
{
  if (logForBookmarks_onceToken != -1)
    dispatch_once(&logForBookmarks_onceToken, &__block_literal_global_17);
  return (id)logForBookmarks_log;
}

void __24__MKLog_logForBookmarks__block_invoke()
{
  if (_block_invoke_7_onceToken != -1)
    dispatch_once(&_block_invoke_7_onceToken, &__block_literal_global_18);
}

void __24__MKLog_logForBookmarks__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "bookmarks");
  v1 = (void *)logForBookmarks_log;
  logForBookmarks_log = (uint64_t)v0;

}

+ (id)logForPhotoLibrary
{
  if (logForPhotoLibrary_onceToken != -1)
    dispatch_once(&logForPhotoLibrary_onceToken, &__block_literal_global_20);
  return (id)logForPhotoLibrary_log;
}

void __27__MKLog_logForPhotoLibrary__block_invoke()
{
  if (_block_invoke_8_onceToken != -1)
    dispatch_once(&_block_invoke_8_onceToken, &__block_literal_global_21);
}

void __27__MKLog_logForPhotoLibrary__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "photo_library");
  v1 = (void *)logForPhotoLibrary_log;
  logForPhotoLibrary_log = (uint64_t)v0;

}

+ (id)logForVoiceMemos
{
  if (logForVoiceMemos_onceToken != -1)
    dispatch_once(&logForVoiceMemos_onceToken, &__block_literal_global_23);
  return (id)logForVoiceMemos_log;
}

void __25__MKLog_logForVoiceMemos__block_invoke()
{
  if (_block_invoke_9_onceToken != -1)
    dispatch_once(&_block_invoke_9_onceToken, &__block_literal_global_24);
}

void __25__MKLog_logForVoiceMemos__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "voice_memo");
  v1 = (void *)logForVoiceMemos_log;
  logForVoiceMemos_log = (uint64_t)v0;

}

+ (id)logForAccounts
{
  if (logForAccounts_onceToken != -1)
    dispatch_once(&logForAccounts_onceToken, &__block_literal_global_26);
  return (id)logForAccounts_log;
}

void __23__MKLog_logForAccounts__block_invoke()
{
  if (_block_invoke_10_onceToken != -1)
    dispatch_once(&_block_invoke_10_onceToken, &__block_literal_global_27);
}

void __23__MKLog_logForAccounts__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "accounts");
  v1 = (void *)logForAccounts_log;
  logForAccounts_log = (uint64_t)v0;

}

+ (id)logForFiles
{
  if (logForFiles_onceToken != -1)
    dispatch_once(&logForFiles_onceToken, &__block_literal_global_29);
  return (id)logForFiles_log;
}

void __20__MKLog_logForFiles__block_invoke()
{
  if (_block_invoke_11_onceToken != -1)
    dispatch_once(&_block_invoke_11_onceToken, &__block_literal_global_30);
}

void __20__MKLog_logForFiles__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "files");
  v1 = (void *)logForFiles_log;
  logForFiles_log = (uint64_t)v0;

}

+ (id)logForSettings
{
  if (logForSettings_onceToken != -1)
    dispatch_once(&logForSettings_onceToken, &__block_literal_global_32);
  return (id)logForSettings_log;
}

void __23__MKLog_logForSettings__block_invoke()
{
  if (_block_invoke_12_onceToken != -1)
    dispatch_once(&_block_invoke_12_onceToken, &__block_literal_global_33);
}

void __23__MKLog_logForSettings__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "settings");
  v1 = (void *)logForSettings_log;
  logForSettings_log = (uint64_t)v0;

}

+ (id)logForApps
{
  if (logForApps_onceToken != -1)
    dispatch_once(&logForApps_onceToken, &__block_literal_global_35);
  return (id)logForApps_log;
}

void __19__MKLog_logForApps__block_invoke()
{
  if (_block_invoke_13_onceToken != -1)
    dispatch_once(&_block_invoke_13_onceToken, &__block_literal_global_36);
}

void __19__MKLog_logForApps__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "apps");
  v1 = (void *)logForApps_log;
  logForApps_log = (uint64_t)v0;

}

+ (id)logForUI
{
  if (logForUI_onceToken != -1)
    dispatch_once(&logForUI_onceToken, &__block_literal_global_38);
  return (id)logForUI_log;
}

void __17__MKLog_logForUI__block_invoke()
{
  if (_block_invoke_14_onceToken != -1)
    dispatch_once(&_block_invoke_14_onceToken, &__block_literal_global_39);
}

void __17__MKLog_logForUI__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MigrationKit"), "UTF8String"), "ui");
  v1 = (void *)logForUI_log;
  logForUI_log = (uint64_t)v0;

}

@end
