@implementation UNMutableNotificationSound

- (void)setAlertTopic:(id)a3
{
  NSString *v4;
  NSString *alertTopic;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  alertTopic = self->super._alertTopic;
  self->super._alertTopic = v4;

}

- (void)setAudioCategory:(id)a3
{
  NSString *v4;
  NSString *audioCategory;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  audioCategory = self->super._audioCategory;
  self->super._audioCategory = v4;

}

- (void)setAudioVolume:(id)a3
{
  objc_storeStrong((id *)&self->super._audioVolume, a3);
}

- (void)setCritical:(BOOL)a3
{
  self->super._critical = a3;
}

- (void)setMaximumDuration:(double)a3
{
  self->super._maximumDuration = a3;
}

- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3
{
  self->super._shouldIgnoreAccessibilityDisabledVibrationSetting = a3;
}

- (void)setShouldIgnoreRingerSwitch:(BOOL)a3
{
  self->super._shouldIgnoreRingerSwitch = a3;
}

- (void)setShouldRepeat:(BOOL)a3
{
  self->super._shouldRepeat = a3;
}

- (void)setToneFileName:(id)a3
{
  NSString *v4;
  NSString *toneFileName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  toneFileName = self->super._toneFileName;
  self->super._toneFileName = v4;

}

- (void)setToneFileURL:(id)a3
{
  NSURL *v4;
  NSURL *toneFileURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  toneFileURL = self->super._toneFileURL;
  self->super._toneFileURL = v4;

}

- (void)setToneIdentifier:(id)a3
{
  NSString *v4;
  NSString *toneIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  toneIdentifier = self->super._toneIdentifier;
  self->super._toneIdentifier = v4;

}

- (void)setToneMediaLibraryItemIdentifier:(unint64_t)a3
{
  self->super._toneMediaLibraryItemIdentifier = a3;
}

- (void)setVibrationIdentifier:(id)a3
{
  NSString *v4;
  NSString *vibrationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  vibrationIdentifier = self->super._vibrationIdentifier;
  self->super._vibrationIdentifier = v4;

}

- (void)setVibrationPatternFileURL:(id)a3
{
  NSURL *v4;
  NSURL *vibrationPatternFileURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  vibrationPatternFileURL = self->super._vibrationPatternFileURL;
  self->super._vibrationPatternFileURL = v4;

}

- (id)copyWithZone:(_NSZone *)a3
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
  UNNotificationSound *v23;

  v23 = +[UNNotificationSound allocWithZone:](UNNotificationSound, "allocWithZone:", a3);
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

@end
