@implementation BMPublicStreamUtilities

+ (id)streamIdentifierForStream:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  +[BMPublicStreamUtilities streamIdentifierForPreMigrationStream:](BMPublicStreamUtilities, "streamIdentifierForPreMigrationStream:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths](BMPublicStreamUtilities, "libraryPublicStreamMigrationPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

+ (id)libraryPublicStreamMigrationPaths
{
  return &unk_1E5E4A4A0;
}

+ (id)streamIdentifierForPreMigrationStream:(int64_t)a3
{
  if ((unint64_t)a3 > 0x28 || (unint64_t)(a3 - 1) > 0x26)
    return 0;
  else
    return off_1E5E3C828[a3 - 1];
}

+ (unint64_t)domainForStream:(int64_t)a3
{
  return a3 == 31 || a3 == 22;
}

+ (id)streamIdentifiers
{
  void *v3;
  uint64_t i;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 40);
  for (i = 0; i != 40; ++i)
  {
    if ((_DWORD)i && (_DWORD)i != 3)
    {
      objc_msgSend(a1, "streamIdentifierForStream:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
  }
  return v3;
}

+ (int64_t)streamForStreamIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;

  v3 = a3;
  +[BMPublicStreamUtilities libraryPublicStreamReverseMigrationPaths](BMPublicStreamUtilities, "libraryPublicStreamReverseMigrationPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = +[BMPublicStreamUtilities streamForPreMigrationStreamIdentifier:](BMPublicStreamUtilities, "streamForPreMigrationStreamIdentifier:", v6);

  return v7;
}

+ (int64_t)streamForPreMigrationStreamIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(CFSTR("AppLaunch"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(CFSTR("AppIntent"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(CFSTR("TestStream"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(CFSTR("POICategory"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(CFSTR("ContextualActions"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(CFSTR("SleepMode"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(CFSTR("UserFocusComputedMode"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(CFSTR("UserFocusActivity"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(CFSTR("CarPlay"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(CFSTR("DoNotDisturbWhileDriving"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(CFSTR("HomeKitClientAccessoryControl"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(CFSTR("HomeKitClientMediaAccessoryControl"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(CFSTR("HomeKitClientActionSet"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(CFSTR("Alarm"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(CFSTR("ScreenRecording"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(CFSTR("ScreenSharing"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(CFSTR("NowPlaying"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(CFSTR("Notification"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(CFSTR("Workout"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(CFSTR("GroupActivitySession"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(CFSTR("SemanticLocation"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(CFSTR("Backlight"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(CFSTR("HealthKitWorkout"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(CFSTR("AppClipLaunch"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(CFSTR("AskToBuy"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(CFSTR("FindMyLocationChange"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(CFSTR("SoundDetection"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(CFSTR("UserStatusChange"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(CFSTR("TextInputSession"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(CFSTR("DeviceMetadata"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(CFSTR("SchoolTime"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(CFSTR("Mindfulness"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(CFSTR("ReadMessage"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(CFSTR("ScreenTimeRequest"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(CFSTR("SiriIntentEvents"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(CFSTR("GameController"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(CFSTR("SiriUI"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(CFSTR("SiriExecution"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 38;
  }
  else if (objc_msgSend(CFSTR("PostSiriEngagement"), "isEqualToString:", v3))
  {
    v4 = 39;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)libraryPublicStreamReverseMigrationPaths
{
  return &unk_1E5E4A4C8;
}

+ (BOOL)writeAllowedForStream:(int64_t)a3 processIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "allowedStreamWriteIdentifiersForStream:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "containsObject:", v6);

  return (char)a1;
}

+ (id)allowedStreamWriteIdentifiersForStream:(int64_t)a3
{
  if ((unint64_t)(a3 - 40) < 0xFFFFFFFFFFFFFFD9 || (unint64_t)(a3 - 1) > 0x26)
    return 0;
  else
    return (id)qword_1E5E3C960[a3 - 1];
}

@end
