@implementation UNNotificationSound(MTSound_Notifications)

- (id)mtSound
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "mt_Description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "[Sound] Converting %@ to MTSound", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(a1, "toneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "toneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vibrationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "audioVolume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(a1, "toneMediaLibraryItemIdentifier"))
    {
      objc_msgSend(a1, "alertTopic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0DBF758]);

      if ((v13 & 1) != 0)
      {
        v14 = 2;
      }
      else
      {
        objc_msgSend(a1, "alertTopic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0DBF760]);

        if ((v16 & 1) != 0)
          v14 = 3;
        else
          v14 = 4 * (objc_msgSend(a1, "alertType") == 17);
      }
      +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "toneMediaLibraryItemIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "vibrationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "audioVolume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTSound songSoundWithIdentifier:vibrationIdentifier:volume:](MTSound, "songSoundWithIdentifier:vibrationIdentifier:volume:", v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_8:
  MTLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "[Sound] Made %@", (uint8_t *)&v17, 0xCu);
  }

  return v9;
}

- (id)mt_Description
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "alertTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "toneMediaLibraryItemIdentifier");
  objc_msgSend(a1, "vibrationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "audioVolume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p alertTopic: %@, toneID: %@, mediaItemID: %llu, vibeID: %@, volume: %@"), v3, a1, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
