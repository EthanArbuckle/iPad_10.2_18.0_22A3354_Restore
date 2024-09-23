@implementation UNNotificationSound

+ (UNNotificationSound)defaultSound
{
  return (UNNotificationSound *)objc_msgSend(a1, "soundWithAlertType:", 17);
}

+ (UNNotificationSound)defaultSystemSound
{
  return (UNNotificationSound *)objc_msgSend(a1, "soundWithAlertType:", 16);
}

+ (UNNotificationSound)defaultRingtoneSound
{
  return (UNNotificationSound *)objc_msgSend(a1, "soundWithAlertType:", 1);
}

+ (UNNotificationSound)defaultCriticalSound
{
  return (UNNotificationSound *)objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", 17, 0, 1, 0);
}

+ (UNNotificationSound)defaultCriticalSoundWithAudioVolume:(float)volume
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", 17, v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNNotificationSound *)v5;
}

+ (UNNotificationSound)criticalSoundNamed:(UNNotificationSoundName)name
{
  return (UNNotificationSound *)objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", 17, 0, 1, name);
}

+ (UNNotificationSound)criticalSoundNamed:(UNNotificationSoundName)name withAudioVolume:(float)volume
{
  void *v6;
  NSString *v7;
  double v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = name;
  *(float *)&v8 = volume;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", 17, v9, 1, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNNotificationSound *)v10;
}

+ (UNNotificationSound)soundNamed:(UNNotificationSoundName)name
{
  return (UNNotificationSound *)objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", 17, 0, 0, name);
}

+ (UNNotificationSound)ringtoneSoundNamed:(UNNotificationSoundName)name
{
  return (UNNotificationSound *)objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", 1, 0, 0, name);
}

+ (UNNotificationSound)soundWithAlertType:(int64_t)a3
{
  return (UNNotificationSound *)objc_msgSend(a1, "_soundWithAlertType:audioVolume:critical:toneFileName:", a3, 0, 0, 0);
}

+ (id)_soundWithAlertType:(int64_t)a3 audioVolume:(id)a4 critical:(BOOL)a5 toneFileName:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  LOWORD(v14) = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", a3, 0, 0, v11, v6, 0, 0.0, v14, v10, 0, 0, 0, 0, 0);

  return v12;
}

- (id)_initWithAlertType:(int64_t)a3 alertTopic:(id)a4 audioCategory:(id)a5 audioVolume:(id)a6 critical:(BOOL)a7 maximumDuration:(double)a8 shouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a9 shouldIgnoreRingerSwitch:(BOOL)a10 shouldRepeat:(BOOL)a11 toneFileName:(id)a12 toneFileURL:(id)a13 toneIdentifier:(id)a14 toneMediaLibraryItemIdentifier:(unint64_t)a15 vibrationIdentifier:(id)a16 vibrationPatternFileURL:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  UNNotificationSound *v28;
  UNNotificationSound *v29;
  uint64_t v30;
  NSString *alertTopic;
  uint64_t v32;
  NSString *audioCategory;
  uint64_t v34;
  NSNumber *audioVolume;
  uint64_t v36;
  NSString *toneFileName;
  uint64_t v38;
  NSURL *toneFileURL;
  uint64_t v40;
  NSString *toneIdentifier;
  uint64_t v42;
  NSURL *vibrationPatternFileURL;
  uint64_t v44;
  NSString *vibrationIdentifier;
  id v49;
  id v50;
  objc_super v51;

  v50 = a4;
  v49 = a5;
  v22 = a6;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v26 = a16;
  v27 = a17;
  v51.receiver = self;
  v51.super_class = (Class)UNNotificationSound;
  v28 = -[UNNotificationSound init](&v51, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_alertType = a3;
    v30 = objc_msgSend(v50, "copy");
    alertTopic = v29->_alertTopic;
    v29->_alertTopic = (NSString *)v30;

    v32 = objc_msgSend(v49, "copy");
    audioCategory = v29->_audioCategory;
    v29->_audioCategory = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    audioVolume = v29->_audioVolume;
    v29->_audioVolume = (NSNumber *)v34;

    v36 = objc_msgSend(v23, "copy");
    toneFileName = v29->_toneFileName;
    v29->_toneFileName = (NSString *)v36;

    v38 = objc_msgSend(v24, "copy");
    toneFileURL = v29->_toneFileURL;
    v29->_toneFileURL = (NSURL *)v38;

    v29->_critical = a7;
    v29->_maximumDuration = a8;
    v29->_shouldIgnoreAccessibilityDisabledVibrationSetting = a9;
    v29->_shouldIgnoreRingerSwitch = a10;
    v29->_shouldRepeat = a11;
    v40 = objc_msgSend(v25, "copy");
    toneIdentifier = v29->_toneIdentifier;
    v29->_toneIdentifier = (NSString *)v40;

    v29->_toneMediaLibraryItemIdentifier = a15;
    v42 = objc_msgSend(v27, "copy");
    vibrationPatternFileURL = v29->_vibrationPatternFileURL;
    v29->_vibrationPatternFileURL = (NSURL *)v42;

    v44 = objc_msgSend(v26, "copy");
    vibrationIdentifier = v29->_vibrationIdentifier;
    v29->_vibrationIdentifier = (NSString *)v44;

  }
  return v29;
}

- (UNNotificationSound)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationSound.m"), 122, CFSTR("use +soundWithIdentifier:"));

  return 0;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;

  v3 = -[UNNotificationSound alertType](self, "alertType");
  -[UNNotificationSound alertTopic](self, "alertTopic");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v29, "hash") ^ v3;
  -[UNNotificationSound audioCategory](self, "audioCategory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v28, "hash");
  -[UNNotificationSound audioVolume](self, "audioVolume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[UNNotificationSound maximumDuration](self, "maximumDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = v7 ^ -[UNNotificationSound isCritical](self, "isCritical");
  v12 = v11 ^ -[UNNotificationSound shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting");
  v13 = v12 ^ -[UNNotificationSound shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch") ^ v10;
  v14 = -[UNNotificationSound shouldRepeat](self, "shouldRepeat");
  -[UNNotificationSound toneFileName](self, "toneFileName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[UNNotificationSound toneFileURL](self, "toneFileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[UNNotificationSound toneIdentifier](self, "toneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13 ^ v18 ^ objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)-[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash");
  -[UNNotificationSound vibrationIdentifier](self, "vibrationIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v20 ^ objc_msgSend(v23, "hash");
  -[UNNotificationSound vibrationPatternFileURL](self, "vibrationPatternFileURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash") ^ v22;

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = UNEqualIntegers(-[UNNotificationSound alertType](self, "alertType"), objc_msgSend(v4, "alertType"));
    -[UNNotificationSound alertTopic](self, "alertTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertTopic");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5 & UNEqualStrings(v6, (void *)v7);

    -[UNNotificationSound audioCategory](self, "audioCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = UNEqualStrings(v9, v10);

    -[UNNotificationSound audioVolume](self, "audioVolume");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioVolume");
    v12 = objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = v8 & v7 & UNEqualObjects((void *)v11, (void *)v12);

    -[UNNotificationSound maximumDuration](self, "maximumDuration");
    v14 = v13;
    objc_msgSend(v4, "maximumDuration");
    LODWORD(v11) = UNEqualDoubles(v14, v15);
    LODWORD(v12) = v11 & UNEqualBools(-[UNNotificationSound isCritical](self, "isCritical"), objc_msgSend(v4, "isCritical"));
    LODWORD(v7) = v7 & v12 & UNEqualBools(-[UNNotificationSound shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"), objc_msgSend(v4, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
    LODWORD(v11) = UNEqualBools(-[UNNotificationSound shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"), objc_msgSend(v4, "shouldIgnoreRingerSwitch"));
    v16 = v11 & UNEqualBools(-[UNNotificationSound shouldRepeat](self, "shouldRepeat"), objc_msgSend(v4, "shouldRepeat"));
    -[UNNotificationSound toneFileName](self, "toneFileName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toneFileName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16 & UNEqualStrings(v17, v18);

    -[UNNotificationSound toneFileURL](self, "toneFileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toneFileURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = v7 & v19 & UNEqualObjects(v20, v21);

    -[UNNotificationSound toneIdentifier](self, "toneIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toneIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7 & UNEqualStrings((void *)v22, v23);

    LODWORD(v22) = UNEqualDoubles((double)-[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"), (double)(unint64_t)objc_msgSend(v4, "toneMediaLibraryItemIdentifier"));
    -[UNNotificationSound vibrationIdentifier](self, "vibrationIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vibrationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v24 & UNEqualStrings(v25, v26);

    -[UNNotificationSound vibrationPatternFileURL](self, "vibrationPatternFileURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vibrationPatternFileURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27 & UNEqualObjects(v28, v29) & v22;

  }
  else
  {
    LOBYTE(v30) = 1;
  }

  return v30;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  _BOOL8 v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  int64_t v22;
  UNMutableNotificationSound *v23;

  v23 = +[UNMutableNotificationSound allocWithZone:](UNMutableNotificationSound, "allocWithZone:", a3);
  v22 = -[UNNotificationSound alertType](self, "alertType");
  -[UNNotificationSound alertTopic](self, "alertTopic");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSound audioCategory](self, "audioCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSound audioVolume](self, "audioVolume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[UNNotificationSound isCritical](self, "isCritical");
  -[UNNotificationSound maximumDuration](self, "maximumDuration");
  v6 = v5;
  v7 = -[UNNotificationSound shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting");
  v8 = -[UNNotificationSound shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch");
  v9 = -[UNNotificationSound shouldRepeat](self, "shouldRepeat");
  -[UNNotificationSound toneFileName](self, "toneFileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSound toneFileURL](self, "toneFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSound toneIdentifier](self, "toneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier");
  -[UNNotificationSound vibrationIdentifier](self, "vibrationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSound vibrationPatternFileURL](self, "vibrationPatternFileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v18) = v9;
  LOBYTE(v18) = v8;
  v16 = -[UNNotificationSound _initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:](v23, "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", v22, v21, v20, v4, v19, v7, v6, v18, v10, v11, v12, v13, v14, v15);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[UNNotificationSound alertTopic](self, "alertTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("alertTopic"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSound alertType](self, "alertType"), CFSTR("alertType"));
  -[UNNotificationSound audioCategory](self, "audioCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("audioCategory"));

  -[UNNotificationSound audioVolume](self, "audioVolume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("audioVolume"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound isCritical](self, "isCritical"), CFSTR("critical"));
  -[UNNotificationSound maximumDuration](self, "maximumDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maximumDuration"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"), CFSTR("shouldIgnoreAccessibilityDisabledVibrationSetting"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"), CFSTR("shouldIgnoreRingerSwitch"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound shouldRepeat](self, "shouldRepeat"), CFSTR("shouldRepeat"));
  -[UNNotificationSound toneFileName](self, "toneFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("toneFileName"));

  -[UNNotificationSound toneFileURL](self, "toneFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("toneFileURL"));

  -[UNNotificationSound toneIdentifier](self, "toneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("toneIdentifier"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"), CFSTR("toneMediaLibraryItemIdentifier"));
  -[UNNotificationSound vibrationIdentifier](self, "vibrationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("vibrationIdentifier"));

  -[UNNotificationSound vibrationPatternFileURL](self, "vibrationPatternFileURL");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("vibrationPatternFileURL"));

}

- (UNNotificationSound)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UNNotificationSound *v15;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertTopic"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("alertType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioCategory"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioVolume"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toneFileName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toneFileURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("maximumDuration"));
  v7 = v6;
  v18 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("critical"));
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldIgnoreAccessibilityDisabledVibrationSetting"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldIgnoreRingerSwitch"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldRepeat"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toneIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("toneMediaLibraryItemIdentifier"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vibrationIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vibrationPatternFileURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v17) = v10;
  LOBYTE(v17) = v9;
  v15 = -[UNNotificationSound _initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:](self, "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", v21, v22, v20, v19, v18, v8, v7, v17, v4, v5, v11, v12, v13, v14);

  return v15;
}

- (NSString)alertTopic
{
  return self->_alertTopic;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (NSNumber)audioVolume
{
  return self->_audioVolume;
}

- (unint64_t)toneMediaLibraryItemIdentifier
{
  return self->_toneMediaLibraryItemIdentifier;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting
{
  return self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
}

- (BOOL)shouldIgnoreRingerSwitch
{
  return self->_shouldIgnoreRingerSwitch;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (NSString)toneFileName
{
  return self->_toneFileName;
}

- (NSURL)toneFileURL
{
  return self->_toneFileURL;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSURL)vibrationPatternFileURL
{
  return self->_vibrationPatternFileURL;
}

- (BOOL)isCritical
{
  return self->_critical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationPatternFileURL, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_toneFileURL, 0);
  objc_storeStrong((id *)&self->_toneFileName, 0);
  objc_storeStrong((id *)&self->_audioVolume, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_alertTopic, 0);
}

@end
