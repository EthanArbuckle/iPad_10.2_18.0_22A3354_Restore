id AXSDSoundDetectionBundle()
{
  if (AXSDSoundDetectionBundle_onceToken != -1)
    dispatch_once(&AXSDSoundDetectionBundle_onceToken, &__block_literal_global);
  return (id)AXSDSoundDetectionBundle_AXBundle;
}

void _AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v3);

  v8 = v3;
  v9 = v4;
  v6 = v4;
  v7 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

}

void AXSDSoundDetectionHandleNotificationsForResponse(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  double v11;
  uint64_t v12;

  v1 = a1;
  objc_msgSend(v1, "actionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("SDNotificationDetectorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.SoundDetectionNotification.action.radar")))
  {
    objc_msgSend(v1, "notification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt(v9, v7);
LABEL_13:

    goto LABEL_14;
  }
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    AXSDSoundDetectionHandleNotificationsForResponse_cold_1((uint64_t)v7, (uint64_t)v2, v10);

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.SoundDetectionNotification.action.snooze.short")) & 1) != 0)
  {
    v11 = 300.0;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.SoundDetectionNotification.action.snooze.medium")) & 1) != 0)
  {
    v11 = 1800.0;
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.SoundDetectionNotification.action.snooze.long")))goto LABEL_14;
    v11 = 7200.0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v8 = (void *)v12;
    +[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSnoozeDateToSnoozeDictionary:forKey:", v8, v7);
    goto LABEL_13;
  }
LABEL_14:

}

__CFString *AXSDSoundDetectionTypeForIdentifier(void *a1)
{
  id v1;
  __CFString *v2;
  __CFString **v3;
  __CFString *v4;
  NSObject *v5;

  v1 = a1;
  v2 = AXSDSoundDetectionTypeNone;
  v3 = &AXSDSoundDetectionTypeDistressedBaby;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDistressedBaby) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("baby_distressed")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("baby")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeApplianceBeeps;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBeeps) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("beep")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeApplianceBuzzes;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBuzzes) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("buzzer")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("buzz")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeCarHorns;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeCarHorns) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("car_horn")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("horn")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeCatMeows;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeCatMeows) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("cat_meow")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("cat")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeApplianceBellDings;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBellDings) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ding_bell")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("bell")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeDogBarks;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDogBarks) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("dog_bark")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("dog")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeDoorbells;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDoorbells) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("door_bell")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("doorbell")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeDoorKnocks;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDoorKnocks) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("door_knock")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeFireAlarms;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeFireAlarms) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("fire_alarm")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("fire-alarm")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypePersonShouting;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypePersonShouting) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("shout")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeSirenAlarms;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeSirenAlarms) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("siren_alarm")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("siren")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeSmokeAlarms;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeSmokeAlarms) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("smoke_alarm")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("smoke-alarm")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeWaterRunning;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeWaterRunning) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("water_running")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("water")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeCough;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeCough) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("cough")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeGlassBreaking;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeGlassBreaking) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("glass_breaking")) & 1) != 0)
    goto LABEL_50;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("glass")) & 1) != 0)
    goto LABEL_50;
  v3 = &AXSDSoundDetectionTypeKettle;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeKettle) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("kettle")) & 1) != 0)
  {
    goto LABEL_50;
  }
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionKShotTypeHallucinator) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionKShotTypeModelWeights) & 1) != 0)
  {
    v3 = &AXSDSoundDetectionTypeKShot;
LABEL_50:
    v4 = *v3;

    v2 = v4;
    goto LABEL_51;
  }
  v3 = &AXSDSoundDetectionTypeKShot;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionKShotTypeGeneralAppliance) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeKShot))
  {
    goto LABEL_50;
  }
LABEL_51:
  if (v2 == AXSDSoundDetectionTypeNone)
  {
    AXLogUltron();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      AXSDSoundDetectionTypeForIdentifier_cold_1();

  }
  return v2;
}

id AXSDSoundDetectionCategories()
{
  _QWORD v1[5];

  v1[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = AXSDDetectorCategoryAlarm;
  v1[1] = AXSDDetectorCategoryAnimal;
  v1[2] = AXSDDetectorCategoryHousehold;
  v1[3] = AXSDDetectorCategoryPeople;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXSDSoundDetectionTypesForCategory(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  __CFString **v6;
  uint64_t v7;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (AXSDDetectorCategoryAlarm == v1)
  {
    v23 = AXSDSoundDetectionTypeFireAlarms;
    v24 = AXSDSoundDetectionTypeSirenAlarms;
    v25 = AXSDSoundDetectionTypeSmokeAlarms;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v23;
LABEL_9:
    v7 = 3;
LABEL_12:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
      v24,
      v25,
      v26);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (AXSDDetectorCategoryAnimal == v1)
  {
    v21 = AXSDSoundDetectionTypeCatMeows;
    v22 = AXSDSoundDetectionTypeDogBarks;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v21;
    v7 = 2;
    goto LABEL_12;
  }
  if (AXSDDetectorCategoryHousehold == v1)
  {
    v12 = AXSDSoundDetectionTypeApplianceBeeps;
    v13 = AXSDSoundDetectionTypeApplianceBuzzes;
    v14 = AXSDSoundDetectionTypeApplianceBellDings;
    v15 = AXSDSoundDetectionTypeCarHorns;
    v16 = AXSDSoundDetectionTypeDoorbells;
    v17 = AXSDSoundDetectionTypeDoorKnocks;
    v18 = AXSDSoundDetectionTypeWaterRunning;
    v19 = AXSDSoundDetectionTypeGlassBreaking;
    v20 = AXSDSoundDetectionTypeKettle;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v12;
    v7 = 9;
    goto LABEL_12;
  }
  if (AXSDDetectorCategoryPeople == v1)
  {
    v9 = AXSDSoundDetectionTypeDistressedBaby;
    v10 = AXSDSoundDetectionTypePersonShouting;
    v11 = AXSDSoundDetectionTypeCough;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v9;
    goto LABEL_9;
  }
  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    AXSDSoundDetectionTypesForCategory_cold_1((uint64_t)v2, v3);

  v4 = (void *)MEMORY[0x24BDBD1A8];
LABEL_13:

  return v4;
}

uint64_t AXSDSoundDetectionTypeIsAppliance(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBeeps) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBuzzes) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBellDings);
  }

  return v2;
}

uint64_t AXSDIsConnectedToCarPlay()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributeForKey:", *MEMORY[0x24BE64808]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

id AXSDSoundDetectionLocalizedTitleForType(void *a1)
{
  return AXSDSoundDetectionLocalizedStringForType(a1, 0);
}

id AXSDSoundDetectionLocalizedStringForType(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;

  v3 = a1;
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeKShot) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionKShotTypeHallucinator) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionKShotTypeModelWeights) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionKShotTypeGeneralAppliance))
  {
    if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDistressedBaby))
    {
      v6 = CFSTR("BodyBaby");
      v7 = CFSTR("TitleBaby");
    }
    else
    {
      if (AXSDSoundDetectionTypeIsAppliance(v3))
      {
        if (a2)
        {
          if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeApplianceBeeps) & 1) != 0)
          {
            v8 = CFSTR("BodyApplianceBeep");
          }
          else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeApplianceBellDings))
          {
            v8 = CFSTR("BodyApplianceBell");
          }
          else
          {
            v8 = CFSTR("BodyApplianceBuzz");
          }
        }
        else
        {
          v8 = CFSTR("TitleAppliance");
        }
        goto LABEL_46;
      }
      if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeCarHorns))
      {
        v6 = CFSTR("BodyCarHorn");
        v7 = CFSTR("TitleCarHorn");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeCatMeows))
      {
        v6 = CFSTR("BodyCat");
        v7 = CFSTR("TitleCat");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDogBarks))
      {
        v6 = CFSTR("BodyDog");
        v7 = CFSTR("TitleDog");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDoorbells))
      {
        v6 = CFSTR("BodyDoorbell");
        v7 = CFSTR("TitleDoorbell");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDoorKnocks))
      {
        v6 = CFSTR("BodyDoorKnock");
        v7 = CFSTR("TitleDoorKnock");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeFireAlarms))
      {
        v6 = CFSTR("BodyFireAlarm");
        v7 = CFSTR("TitleFireAlarm");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeSirenAlarms))
      {
        v6 = CFSTR("BodySiren");
        v7 = CFSTR("TitleSiren");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeSmokeAlarms))
      {
        v6 = CFSTR("BodySmokeAlarm");
        v7 = CFSTR("TitleSmokeAlarm");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypePersonShouting))
      {
        v6 = CFSTR("BodyShout");
        v7 = CFSTR("TitleShout");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeWaterRunning))
      {
        v6 = CFSTR("BodyWaterRunning");
        v7 = CFSTR("TitleWaterRunning");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeCough))
      {
        v6 = CFSTR("BodyCough");
        v7 = CFSTR("TitleCough");
      }
      else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeGlassBreaking))
      {
        v6 = CFSTR("BodyGlassBreaking");
        v7 = CFSTR("TitleGlassBreaking");
      }
      else
      {
        if (!objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeKettle))
        {
          AXLogUltron();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            AXSDSoundDetectionLocalizedStringForType_cold_1();

          v8 = 0;
LABEL_46:
          AXSDSoundDetectionBundle();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localizedStringForKey:value:table:", v8, v8, CFSTR("SoundDetectionSupport"));
          v4 = (id)objc_claimAutoreleasedReturnValue();

          if (a2)
          {
            AXSDSoundDetectionBundle();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            v12 = CFSTR("DetectionBody");
          }
          else
          {
            if (!AXSDIsConnectedToCarPlay())
            {
LABEL_51:

              goto LABEL_6;
            }
            AXSDSoundDetectionBundle();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            v12 = CFSTR("DetectionMaybe");
          }
          objc_msgSend(v10, "localizedStringForKey:value:table:", v12, v12, CFSTR("SoundDetectionSupport"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v13, v4);
          v14 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v14;
          goto LABEL_51;
        }
        v6 = CFSTR("BodyKettle");
        v7 = CFSTR("TitleKettle");
      }
    }
    if (!a2)
      v6 = (__CFString *)v7;
    v8 = v6;
    goto LABEL_46;
  }
  v4 = v3;
LABEL_6:

  return v4;
}

id AXSDSoundDetectionLocalizedStringForCategory(void *a1)
{
  id v1;
  const __CFString *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDDetectorCategoryAlarm) & 1) != 0)
  {
    v2 = CFSTR("CATEGORY_ALARM");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDDetectorCategoryAnimal) & 1) != 0)
  {
    v2 = CFSTR("CATEGORY_ANIMAL");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDDetectorCategoryHousehold) & 1) != 0)
  {
    v2 = CFSTR("CATEGORY_HOUSEHOLD");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDDetectorCategoryPeople) & 1) != 0)
  {
    v2 = CFSTR("CATEGORY_PEOPLE");
  }
  else if (objc_msgSend(v1, "isEqualToString:", AXSDDetectorCategoryNone))
  {
    v2 = &stru_24D0E4408;
  }
  else
  {
    v2 = 0;
  }
  AXSDSoundDetectionBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, CFSTR("SoundDetectionSupport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id bmTypeForSoundDetectionType(void *a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDistressedBaby) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAD0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBeeps) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAA0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBuzzes) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAB0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeApplianceBellDings) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAA8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeCarHorns) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAB8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeCatMeows) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAC0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDogBarks) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAD8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDoorbells) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAE8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDoorKnocks) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAE0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeFireAlarms) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAF0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeSirenAlarms) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CB10];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypePersonShouting) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CB18];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeDistressedBaby) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CB08];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeWaterRunning) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CB20];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeCough) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAC8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeGlassBreaking) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x24BE0CAF8];
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", AXSDSoundDetectionTypeKettle))
    {
      v3 = 0;
      goto LABEL_36;
    }
    v2 = (id *)MEMORY[0x24BE0CB00];
  }
  v3 = *v2;
LABEL_36:

  return v3;
}

uint64_t AXIsSoundDetectionMedinaSupportEnabled()
{
  void *v0;
  char v1;

  +[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "forceMedinaSupport");

  if ((v1 & 1) != 0)
    return 1;
  else
    return AXRuntimeCheck_SoundRecognitionMedinaSupportEnabled();
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void AXSDSoundDetectionHandleNotificationsForResponse_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_213CB2000, log, OS_LOG_TYPE_DEBUG, "Snoozing %@ for duration: %@", (uint8_t *)&v3, 0x16u);
}

void AXSDSoundDetectionTypeForIdentifier_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_213CB2000, v1, v2, "Attempted to get AXSDSoundDetectionType for invalid identifier: %@. Stacktrace: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void AXSDSoundDetectionTypesForCategory_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_213CB2000, a2, OS_LOG_TYPE_DEBUG, "No AXSDSoundDetectionTypes found for detector category: %@", (uint8_t *)&v2, 0xCu);
}

void AXSDSoundDetectionLocalizedStringForType_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_213CB2000, v1, v2, "Notification requested for invalid detection type: %@. Stacktrace: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BDFE1F8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXRuntimeCheck_SoundRecognitionMedinaSupportEnabled()
{
  return MEMORY[0x24BDFE318]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

