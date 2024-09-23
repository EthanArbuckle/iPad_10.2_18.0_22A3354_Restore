@implementation MTSound

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundVolume, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaItemIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTSound toneIdentifier](self, "toneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSound soundVolume](self, "soundVolume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p toneID: %@, mediaItemID: %@, vibeID: %@, volume: %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[MTSound soundType](self, "soundType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("MTSoundType"));

  -[MTSound toneIdentifier](self, "toneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("MTSoundToneID"));

  -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("MTSoundMediaItemID"));

  -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("MTSoundVibrationID"));

  -[MTSound soundVolume](self, "soundVolume");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("MTSoundVolume"));

}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSNumber)soundVolume
{
  return self->_soundVolume;
}

- (NSNumber)mediaItemIdentifier
{
  return self->_mediaItemIdentifier;
}

- (unint64_t)soundType
{
  return self->_soundType;
}

- (MTSound)initWithCoder:(id)a3
{
  id v4;
  MTSound *v5;
  void *v6;
  uint64_t v7;
  NSString *toneIdentifier;
  uint64_t v9;
  NSNumber *mediaItemIdentifier;
  uint64_t v11;
  NSString *vibrationIdentifier;
  uint64_t v13;
  NSNumber *soundVolume;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTSound;
  v5 = -[MTSound init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSoundType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_soundType = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSoundToneID"));
    v7 = objc_claimAutoreleasedReturnValue();
    toneIdentifier = v5->_toneIdentifier;
    v5->_toneIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSoundMediaItemID"));
    v9 = objc_claimAutoreleasedReturnValue();
    mediaItemIdentifier = v5->_mediaItemIdentifier;
    v5->_mediaItemIdentifier = (NSNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSoundVibrationID"));
    v11 = objc_claimAutoreleasedReturnValue();
    vibrationIdentifier = v5->_vibrationIdentifier;
    v5->_vibrationIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSoundVolume"));
    v13 = objc_claimAutoreleasedReturnValue();
    soundVolume = v5->_soundVolume;
    v5->_soundVolume = (NSNumber *)v13;

  }
  return v5;
}

+ (id)defaultSoundForCategory:(unint64_t)a3
{
  void *v3;
  id result;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      +[MTSound _loadDefaultAlarmSound](MTSound, "_loadDefaultAlarmSound");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      +[MTSound _loadDefaultTimerSound](MTSound, "_loadDefaultTimerSound");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
    case 4uLL:
      v3 = 0;
      goto LABEL_7;
    case 3uLL:
      v3 = &unk_1E3A05E78;
LABEL_7:
      +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", 0, 0, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      result = v5;
      break;
    default:
      NSLog(CFSTR("Unexpected MTSoundCategory: %lu"), a2, a3);
      result = 0;
      break;
  }
  return result;
}

+ (id)_loadDefaultTimerSound
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MTDefaultTimerToneID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = v4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultToneIdentifierForAlertType:", 14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "[Sound] Default timer sound is %@", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

+ (id)toneSoundWithIdentifier:(id)a3 vibrationIdentifer:(id)a4 volume:(id)a5
{
  id v7;
  id v8;
  id v9;
  MTSound *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MTSound initWithToneIdentifier:vibrationIdentifer:volume:]([MTSound alloc], "initWithToneIdentifier:vibrationIdentifer:volume:", v9, v8, v7);

  return v10;
}

- (MTSound)initWithToneIdentifier:(id)a3 vibrationIdentifer:(id)a4 volume:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTSound *v11;
  MTSound *v12;
  uint64_t v13;
  NSString *toneIdentifier;
  uint64_t v15;
  NSString *vibrationIdentifier;
  uint64_t v17;
  NSNumber *soundVolume;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MTSound;
  v11 = -[MTSound init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_soundType = 2;
    v13 = objc_msgSend(v8, "copy");
    toneIdentifier = v12->_toneIdentifier;
    v12->_toneIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    vibrationIdentifier = v12->_vibrationIdentifier;
    v12->_vibrationIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    soundVolume = v12->_soundVolume;
    v12->_soundVolume = (NSNumber *)v17;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)unSound
{
  return -[MTSound unSoundForCategory:](self, "unSoundForCategory:", 0);
}

+ (int64_t)_alertTypeForCategory:(unint64_t)a3
{
  int64_t v3;

  v3 = 13;
  if (a3 == 1)
    v3 = 14;
  if (a3 == 4)
    return 17;
  else
    return v3;
}

- (id)unSoundForCategory:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  MTSound *v18;
  int v20;
  MTSound *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForCategory:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "[Sound] Converting %{public}@ to UNNotificationSound for category %{public}@", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CEC6E8], "soundWithAlertType:", objc_msgSend((id)objc_opt_class(), "_alertTypeForCategory:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 4)
  {
    objc_msgSend(v7, "setShouldRepeat:", 0);
  }
  else if (a3 == 2)
  {
    objc_msgSend(v7, "setShouldRepeat:", 0);
    objc_msgSend(v8, "setAlertTopic:", *MEMORY[0x1E0DBF758]);
  }
  else
  {
    objc_msgSend(v7, "setShouldRepeat:", 1);
    objc_msgSend(v8, "setShouldIgnoreRingerSwitch:", 1);
    +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerForKey:defaultValue:", CFSTR("MTAlertSoundDuration"), 15);

    objc_msgSend(v8, "setMaximumDuration:", (double)(60 * v10));
    -[MTSound soundVolume](self, "soundVolume");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAudioVolume:", v11);

    if (a3 == 3)
      objc_msgSend(v8, "setAlertTopic:", *MEMORY[0x1E0DBF760]);
    -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVibrationIdentifier:", v12);

    v13 = -[MTSound soundType](self, "soundType");
    if (v13 == 3)
    {
      -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      objc_msgSend(v8, "setToneMediaLibraryItemIdentifier:", v16);
    }
    else if (v13 == 2)
    {
      -[MTSound toneIdentifier](self, "toneIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToneIdentifier:", v14);

    }
  }
  MTLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "mt_Description");
    v18 = (MTSound *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "[Sound] Made %@", (uint8_t *)&v20, 0xCu);

  }
  return v8;
}

+ (void)setDefaultSound:(id)a3 forCategory:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
    NSLog(CFSTR("Sound must be nonnull!"), 0);
LABEL_9:
    v6 = v7;
    goto LABEL_10;
  }
  if (a4 - 2 >= 3)
  {
    v7 = v5;
    if (a4 == 1)
    {
      +[MTSound _saveDefaultTimerSound:](MTSound, "_saveDefaultTimerSound:", v5);
    }
    else if (a4)
    {
      NSLog(CFSTR("Unexpected MTSoundCategory: %lu"), v5, a4);
    }
    else
    {
      +[MTSound _saveDefaultAlarmSound:](MTSound, "_saveDefaultAlarmSound:", v5);
    }
    goto LABEL_9;
  }
LABEL_10:

}

+ (id)descriptionForCategory:(unint64_t)a3
{
  if (a3 < 5)
    return off_1E39CD230[a3];
  NSLog(CFSTR("Unexpected MTSoundCategory: %lu"), a2, a3);
  return 0;
}

+ (id)songSoundWithIdentifier:(id)a3 vibrationIdentifier:(id)a4 volume:(id)a5
{
  id v7;
  id v8;
  id v9;
  MTSound *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MTSound initWithMediaItemIdentifier:vibrationIdentifier:volume:]([MTSound alloc], "initWithMediaItemIdentifier:vibrationIdentifier:volume:", v9, v8, v7);

  return v10;
}

- (MTSound)initWithMediaItemIdentifier:(id)a3 vibrationIdentifier:(id)a4 volume:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTSound *v11;
  MTSound *v12;
  uint64_t v13;
  NSNumber *mediaItemIdentifier;
  uint64_t v15;
  NSString *vibrationIdentifier;
  uint64_t v17;
  NSNumber *soundVolume;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MTSound;
  v11 = -[MTSound init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_soundType = 3;
    v13 = objc_msgSend(v8, "copy");
    mediaItemIdentifier = v12->_mediaItemIdentifier;
    v12->_mediaItemIdentifier = (NSNumber *)v13;

    v15 = objc_msgSend(v9, "copy");
    vibrationIdentifier = v12->_vibrationIdentifier;
    v12->_vibrationIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    soundVolume = v12->_soundVolume;
    v12->_soundVolume = (NSNumber *)v17;

  }
  return v12;
}

- (MTSound)initWithSound:(id)a3 usingVolume:(id)a4
{
  id v6;
  id v7;
  MTSound *v8;
  void *v9;
  uint64_t v10;
  NSNumber *mediaItemIdentifier;
  void *v12;
  uint64_t v13;
  NSString *vibrationIdentifier;
  void *v15;
  uint64_t v16;
  NSString *toneIdentifier;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MTSound;
  v8 = -[MTSound init](&v19, sel_init);
  if (v8)
  {
    v8->_soundType = objc_msgSend(v6, "soundType");
    objc_msgSend(v6, "mediaItemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    mediaItemIdentifier = v8->_mediaItemIdentifier;
    v8->_mediaItemIdentifier = (NSNumber *)v10;

    objc_msgSend(v6, "vibrationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    vibrationIdentifier = v8->_vibrationIdentifier;
    v8->_vibrationIdentifier = (NSString *)v13;

    objc_msgSend(v6, "toneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    toneIdentifier = v8->_toneIdentifier;
    v8->_toneIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v8->_soundVolume, a4);
  }

  return v8;
}

- (id)soundByUpdatingVibrationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[MTSound soundType](self, "soundType") == 3)
  {
    -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSound soundVolume](self, "soundVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTSound songSoundWithIdentifier:vibrationIdentifier:volume:](MTSound, "songSoundWithIdentifier:vibrationIdentifier:volume:", v5, v4, v6);
  }
  else
  {
    -[MTSound toneIdentifier](self, "toneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSound soundVolume](self, "soundVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v5, v4, v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)soundByUpdatingVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[MTSound soundType](self, "soundType") == 3)
  {
    -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTSound songSoundWithIdentifier:vibrationIdentifier:volume:](MTSound, "songSoundWithIdentifier:vibrationIdentifier:volume:", v5, v6, v4);
  }
  else
  {
    -[MTSound toneIdentifier](self, "toneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v5, v6, v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_loadDefaultAlarmSound
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MTDefaultAlarmSoundType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v7 >= 4)
  {
    NSLog(CFSTR("Sound type integer value out of bounds: %lu"), v7);
    v8 = 2;
  }
  else
  {
    if (v7 <= 2)
      v8 = 2;
    else
      v8 = v7;
    if (v7 == 3)
    {
      +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("MTDefaultAlarmMediaItemID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v11 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      v14 = 0;
LABEL_19:
      MTLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v8 == 3 && v13 == 0)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "[Sound] No media item ID is specified in defaults. Switch to the tone type and use the ToneLibrary default", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject defaultToneIdentifierForAlertType:](v19, "defaultToneIdentifierForAlertType:", 13);
        v22 = objc_claimAutoreleasedReturnValue();

        v13 = 0;
        v8 = 2;
        v14 = (id)v22;
      }
      else if (v20)
      {
        *(_DWORD *)buf = 138412546;
        v36 = v14;
        v37 = 2112;
        v38 = v13;
        _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "[Sound] Alarm sound from stored defaults (toneID: %@, mediaItemID: %@)", buf, 0x16u);
      }
      goto LABEL_31;
    }
  }
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("MTDefaultAlarmToneID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v17 = v16;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v14 = v18;

  if (v14)
  {
    v13 = 0;
    goto LABEL_19;
  }
  MTLogForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v23, OS_LOG_TYPE_DEFAULT, "[Sound] No tone ID is specified in defaults. Fall back to the ToneLibrary default", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSObject defaultToneIdentifierForAlertType:](v19, "defaultToneIdentifierForAlertType:", 13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = 2;
LABEL_31:

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKey:", CFSTR("MTDefaultAlarmVibrationID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v26 = v25;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  MTLogForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v28)
  {
    if (v30)
    {
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "[Sound] Alarm vibration from stored defaults (vibrationID: %@)", buf, 0xCu);
    }
    v31 = v26;
  }
  else
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "[Sound] No vibration ID is specified in defaults. Use the ToneLibrary default", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DBF748], "sharedVibrationManager");
    v29 = objc_claimAutoreleasedReturnValue();
    -[NSObject defaultVibrationIdentifierForAlertType:](v29, "defaultVibrationIdentifierForAlertType:", 13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8 == 3)
    +[MTSound songSoundWithIdentifier:vibrationIdentifier:volume:](MTSound, "songSoundWithIdentifier:vibrationIdentifier:volume:", v13, v31, 0);
  else
    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v14, v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v32;
    _os_log_impl(&dword_19AC4E000, v33, OS_LOG_TYPE_DEFAULT, "[Sound] Default alarm sound is %@", buf, 0xCu);
  }

  return v32;
}

+ (void)_saveDefaultAlarmSound:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "toneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "soundType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MTDefaultAlarmSoundType"));

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("MTDefaultAlarmToneID"));

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v5, CFSTR("MTDefaultAlarmMediaItemID"));

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vibrationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("MTDefaultAlarmVibrationID"));

  MTLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "soundType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vibrationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v13;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "[Sound] Storing Alarm Defaults (soundTypeKey: %@, toneIDKey: %@, mediaItemIDKey: %@, vibrationIDKey: %@)", (uint8_t *)&v15, 0x2Au);

  }
}

+ (void)_saveDefaultTimerSound:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "toneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "soundType");

  if (v5 != 2)
  {
    NSLog(CFSTR("Timers only support tones"));

    v4 = 0;
  }
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("MTDefaultTimerToneID"));

  MTLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "[Sound] Storing Timer Defaults (toneIDKey: %@)", (uint8_t *)&v8, 0xCu);
  }

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MTSound toneIdentifier](self, "toneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[MTSound isEqualToSound:](self, "isEqualToSound:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)isEqualToSound:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = -[MTSound soundType](self, "soundType");
  if (v7 == objc_msgSend(v6, "soundType"))
  {
    -[MTSound toneIdentifier](self, "toneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[MTSound toneIdentifier](self, "toneIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toneIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v10;
      if (!objc_msgSend(v10, "isEqual:", v3))
      {
        v11 = 0;
        goto LABEL_23;
      }
    }
    -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      -[MTSound mediaItemIdentifier](self, "mediaItemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaItemIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqual:", v4))
      {
        v11 = 0;
LABEL_21:

LABEL_22:
        if (v8 == v9)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        goto LABEL_24;
      }
      v33 = v14;
    }
    -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vibrationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v15;
    if ((void *)v15 == v16)
    {
      v29 = v4;
      v30 = v13;
    }
    else
    {
      -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vibrationIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      if (!objc_msgSend(v17, "isEqual:"))
      {
        v11 = 0;
        v26 = v34;
        goto LABEL_19;
      }
      v29 = v4;
      v30 = v13;
    }
    -[MTSound soundVolume](self, "soundVolume");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "soundVolume");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v18 == (void *)v19)
    {

      v11 = 1;
    }
    else
    {
      v20 = (void *)v19;
      -[MTSound soundVolume](self, "soundVolume");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "soundVolume");
      v28 = v9;
      v22 = v8;
      v23 = v12;
      v24 = v3;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v21, "isEqual:", v25);

      v3 = v24;
      v12 = v23;
      v8 = v22;
      v9 = v28;

    }
    v26 = v34;
    v4 = v29;
    v13 = v30;
    if (v34 == v16)
    {
LABEL_20:

      v14 = v33;
      if (v12 == v13)
        goto LABEL_22;
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (BOOL)isSilent
{
  void *v3;
  char v4;

  if (-[MTSound soundType](self, "soundType") != 2)
    return 0;
  -[MTSound toneIdentifier](self, "toneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBF788]);

  return v4;
}

- (id)previewWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF738]), "initWithType:", 13);
  objc_msgSend(v5, "setTopic:", *MEMORY[0x1E0DBF760]);
  -[MTSound toneIdentifier](self, "toneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToneIdentifier:", v6);

  -[MTSound vibrationIdentifier](self, "vibrationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVibrationIdentifier:", v7);

  -[MTSound soundVolume](self, "soundVolume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v5, "setAudioVolume:");

  objc_msgSend(v5, "setShouldRepeat:", 0);
  objc_msgSend(v5, "setForPreview:", 1);
  objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__MTSound_previewWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E39CD210;
  v13 = v4;
  v10 = v4;
  objc_msgSend(v9, "playWithCompletionHandler:", v12);

  return v9;
}

void __40__MTSound_previewWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__MTSound_previewWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E39CD1E8;
  v10 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

uint64_t __40__MTSound_previewWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[4]);
  return result;
}

- (void)updatePreview:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[MTSound soundVolume](self, "soundVolume");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    objc_msgSend(v4, "_updateAudioVolumeDynamicallyToValue:");

  }
}

@end
