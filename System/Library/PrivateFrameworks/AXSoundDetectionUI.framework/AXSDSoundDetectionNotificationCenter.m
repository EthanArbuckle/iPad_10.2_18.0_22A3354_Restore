@implementation AXSDSoundDetectionNotificationCenter

void __AXSDSoundDetectionNotificationCenter_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.SoundDetectionNotifications"));
  v1 = (void *)AXSDSoundDetectionNotificationCenter_NotificationCenter;
  AXSDSoundDetectionNotificationCenter_NotificationCenter = v0;

  AXSDSoundDetectionBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SnoozeActionShort"), CFSTR("SnoozeActionShort"), CFSTR("SoundDetectionSupport"));
  v3 = objc_claimAutoreleasedReturnValue();

  AXSDSoundDetectionBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SnoozeActionMedium"), CFSTR("SnoozeActionMedium"), CFSTR("SoundDetectionSupport"));
  v5 = objc_claimAutoreleasedReturnValue();

  AXSDSoundDetectionBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SnoozeActionLong"), CFSTR("SnoozeActionLong"), CFSTR("SoundDetectionSupport"));
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8828], "iconWithSystemImageName:", CFSTR("clock"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:options:icon:", CFSTR("com.apple.SoundDetectionNotification.action.snooze.short"), v3, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:options:icon:", CFSTR("com.apple.SoundDetectionNotification.action.snooze.medium"), v5, 0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:options:icon:", CFSTR("com.apple.SoundDetectionNotification.action.snooze.long"), v7, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = v11;
  v25[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v13);

  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall")
    && +[AXSDUltronInternalRecordingManager isEnrolled](AXSDUltronInternalRecordingManager, "isEnrolled"))
  {
    objc_msgSend(MEMORY[0x24BDF8828], "iconWithSystemImageName:", CFSTR("ant.circle.fill"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8820], "actionWithIdentifier:title:options:icon:", CFSTR("com.apple.SoundDetectionNotification.action.radar"), CFSTR("False Positive: File a Radar"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v15);

  }
  v16 = MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.SoundDetectionCarPlayNotifications.message"), MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.SoundDetectionNotifications.message"), v8, v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v18, v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.SoundDetectionNotifications.modelReady"), v16, v16, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObject:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)AXSDSoundDetectionNotificationCenter_NotificationCenter, "setNotificationCategories:", v21);
}

@end
