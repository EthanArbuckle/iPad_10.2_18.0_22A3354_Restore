@implementation BBSound

- (BBSound)initWithToneAlert:(int64_t)a3
{
  void *v4;
  BBSound *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8CA8]), "initWithType:", a3);
  v5 = -[BBSound initWithToneAlertConfiguration:](self, "initWithToneAlertConfiguration:", v4);

  return v5;
}

- (BBSound)initWithToneAlert:(int64_t)a3 ignoreRingerSwitch:(BOOL)a4
{
  return -[BBSound initWithToneAlert:accountIdentifier:ignoreRingerSwitch:](self, "initWithToneAlert:accountIdentifier:ignoreRingerSwitch:", a3, 0, a4);
}

- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4
{
  return -[BBSound initWithToneAlert:accountIdentifier:ignoreRingerSwitch:](self, "initWithToneAlert:accountIdentifier:ignoreRingerSwitch:", a3, a4, 0);
}

- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 ignoreRingerSwitch:(BOOL)a5
{
  return -[BBSound initWithToneAlert:accountIdentifier:toneIdentifier:vibrationIdentifier:ignoreRingerSwitch:](self, "initWithToneAlert:accountIdentifier:toneIdentifier:vibrationIdentifier:ignoreRingerSwitch:", a3, a4, 0, 0, a5);
}

- (BBSound)initWithToneAlert:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5
{
  return -[BBSound initWithToneAlert:toneIdentifier:vibrationIdentifier:ignoreRingerSwitch:](self, "initWithToneAlert:toneIdentifier:vibrationIdentifier:ignoreRingerSwitch:", a3, a4, a5, 0);
}

- (BBSound)initWithToneAlert:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5 ignoreRingerSwitch:(BOOL)a6
{
  return -[BBSound initWithToneAlert:accountIdentifier:toneIdentifier:vibrationIdentifier:ignoreRingerSwitch:](self, "initWithToneAlert:accountIdentifier:toneIdentifier:vibrationIdentifier:ignoreRingerSwitch:", a3, 0, a4, a5, a6);
}

- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6 ignoreRingerSwitch:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BBSound *v17;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8CA8]), "initWithType:", a3);
  v16 = v15;
  if (v12)
    objc_msgSend(v15, "setTopic:", v12);
  if (v13)
    objc_msgSend(v16, "setToneIdentifier:", v13);
  if (v14)
    objc_msgSend(v16, "setVibrationIdentifier:", v14);
  objc_msgSend(v16, "setShouldIgnoreRingerSwitch:", v7);
  v17 = -[BBSound initWithToneAlertConfiguration:](self, "initWithToneAlertConfiguration:", v16);

  return v17;
}

- (BBSound)initWithToneAlertConfiguration:(id)a3
{
  id v4;
  BBSound *v5;
  BBSound *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BBSound;
  v5 = -[BBSound init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[BBSound setSoundType:](v5, "setSoundType:", 2);
    objc_msgSend(v4, "setPrefersToDisallowExternalPlayback:", 1);
    -[BBSound setAlertConfiguration:](v6, "setAlertConfiguration:", v4);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BBSound *v4;
  BBSound *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  char v11;
  void *v13;
  void *v14;
  unint64_t v15;
  int64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;

  v4 = (BBSound *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBSound alertConfiguration](self, "alertConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSound alertConfiguration](v5, "alertConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[BBSound audioCategory](self, "audioCategory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBSound audioCategory](v5, "audioCategory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects()
          && (-[BBSound maxDuration](self, "maxDuration"),
              -[BBSound maxDuration](v5, "maxDuration"),
              BSFloatEqualToFloat())
          && (v10 = -[BBSound isRepeating](self, "isRepeating"), v10 == -[BBSound isRepeating](v5, "isRepeating")))
        {
          -[BBSound ringtoneName](self, "ringtoneName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBSound ringtoneName](v5, "ringtoneName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects()
            && (v15 = -[BBSound soundBehavior](self, "soundBehavior"),
                v15 == -[BBSound soundBehavior](v5, "soundBehavior"))
            && (v16 = -[BBSound soundType](self, "soundType"), v16 == -[BBSound soundType](v5, "soundType"))
            && (v17 = -[BBSound systemSoundID](self, "systemSoundID"),
                v17 == -[BBSound systemSoundID](v5, "systemSoundID")))
          {
            -[BBSound vibrationPattern](self, "vibrationPattern");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[BBSound vibrationPattern](v5, "vibrationPattern");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = BSEqualObjects();

          }
          else
          {
            v11 = 0;
          }

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;

  v3 = 1 << (-[BBSound soundType](self, "soundType") + 8);
  -[BBSound alertConfiguration](self, "alertConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  -[BBSound audioCategory](self, "audioCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + objc_msgSend(v6, "hash");

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[BBSound maxDuration](self, "maxDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 + objc_msgSend(v9, "hash");

  v11 = v10 + -[BBSound isRepeating](self, "isRepeating");
  -[BBSound ringtoneName](self, "ringtoneName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  v14 = v11 + v13 + -[BBSound soundBehavior](self, "soundBehavior");
  v15 = v14 + -[BBSound systemSoundID](self, "systemSoundID");
  -[BBSound vibrationPattern](self, "vibrationPattern");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 + objc_msgSend(v16, "hash");

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBSound)initWithCoder:(id)a3
{
  id v4;
  BBSound *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BBSound;
  v5 = -[BBSound init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSound setAlertConfiguration:](v5, "setAlertConfiguration:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioCategory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSound setAudioCategory:](v5, "setAudioCategory:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxDuration"));
    -[BBSound setMaxDuration:](v5, "setMaxDuration:");
    -[BBSound setRepeats:](v5, "setRepeats:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("repeats")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ringtoneName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSound setRingtoneName:](v5, "setRingtoneName:", v8);

    -[BBSound setSoundBehavior:](v5, "setSoundBehavior:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("soundBehavior")));
    -[BBSound setSoundType:](v5, "setSoundType:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("soundType")));
    -[BBSound setSystemSoundID:](v5, "setSystemSoundID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("systemSoundID")));
    BBAllowedClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("vibrationPattern"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSound setVibrationPattern:](v5, "setVibrationPattern:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BBSound alertConfiguration](self, "alertConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("alertConfiguration"));

  -[BBSound audioCategory](self, "audioCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("audioCategory"));

  -[BBSound maxDuration](self, "maxDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxDuration"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSound isRepeating](self, "isRepeating"), CFSTR("repeats"));
  -[BBSound ringtoneName](self, "ringtoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ringtoneName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSound soundBehavior](self, "soundBehavior"), CFSTR("soundBehavior"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSound soundType](self, "soundType"), CFSTR("soundType"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[BBSound systemSoundID](self, "systemSoundID"), CFSTR("systemSoundID"));
  -[BBSound vibrationPattern](self, "vibrationPattern");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("vibrationPattern"));

}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)alertType
{
  void *v2;
  int64_t v3;

  -[BBSound alertConfiguration](self, "alertConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (NSString)accountIdentifier
{
  void *v2;
  void *v3;

  -[BBSound alertConfiguration](self, "alertConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)toneIdentifier
{
  void *v2;
  void *v3;

  -[BBSound alertConfiguration](self, "alertConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)vibrationIdentifier
{
  void *v2;
  void *v3;

  -[BBSound alertConfiguration](self, "alertConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vibrationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)ignoreRingerSwitch
{
  void *v2;
  char v3;

  -[BBSound alertConfiguration](self, "alertConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldIgnoreRingerSwitch");

  return v3;
}

- (id)description
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v3 = -[BBSound soundType](self, "soundType");
  if (v3 == 2)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[BBSound alertConfiguration](self, "alertConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("alertConfiguration: %@; "), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("ToneAlert");
  }
  else if (v3 == 1)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[BBSound ringtoneName](self, "ringtoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BBSound isRepeating](self, "isRepeating"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    -[BBSound maxDuration](self, "maxDuration");
    v14 = v13;
    -[BBSound vibrationPattern](self, "vibrationPattern");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSound audioCategory](self, "audioCategory");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("Default");
    if (v16)
      v18 = (const __CFString *)v16;
    objc_msgSend(v11, "stringWithFormat:", CFSTR("name: %@; repeats: %@; maxDuration: %lf; vibPattern: %@; audioCategory: %@"),
      v7,
      v12,
      v14,
      v15,
      v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = CFSTR("Ringtone");
  }
  else
  {
    if (v3)
    {
      v9 = 0;
      v8 = 0;
      goto LABEL_14;
    }
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = -[BBSound systemSoundID](self, "systemSoundID");
    v6 = -[BBSound soundBehavior](self, "soundBehavior");
    -[BBSound vibrationPattern](self, "vibrationPattern");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("soundID: %u; behavior: %lu; vibPattern: %@"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("SystemSound");
  }

LABEL_14:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; [%@] %@>"), objc_opt_class(), self, v9, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void)setAlertConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (void)setAudioCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(double)a3
{
  self->_maxDuration = a3;
}

- (BOOL)isRepeating
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (NSString)ringtoneName
{
  return self->_ringtoneName;
}

- (void)setRingtoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->_soundBehavior = a3;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(int64_t)a3
{
  self->_soundType = a3;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(unsigned int)a3
{
  self->_systemSoundID = a3;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (void)setVibrationPattern:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)songPath
{
  return self->_songPath;
}

- (void)setSongPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songPath, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
  objc_storeStrong((id *)&self->_ringtoneName, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
}

@end
