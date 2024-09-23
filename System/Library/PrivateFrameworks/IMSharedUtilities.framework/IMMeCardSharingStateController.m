@implementation IMMeCardSharingStateController

+ (id)sharedInstance
{
  if (qword_1ECFC7618 != -1)
    dispatch_once(&qword_1ECFC7618, &unk_1E3FB3448);
  return (id)qword_1ECFC7570;
}

- (IMMeCardSharingStateController)init
{
  IMMeCardSharingStateController *v2;
  IMMeCardSharingStateController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMMeCardSharingStateController;
  v2 = -[IMMeCardSharingStateController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMMeCardSharingStateController _migrateMeCardDomains](v2, "_migrateMeCardDomains");
  return v3;
}

- (void)_migrateMeCardDomains
{
  char v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (IMIsRunningInMobileSMS())
  {
    v2 = IMGetDomainBoolForKey();
    v3 = IMGetCachedDomainValueForKey();
    v4 = (void *)IMGetCachedDomainValueForKey();
    v5 = IMGetCachedDomainValueForKey();
    if ((v2 & 1) == 0)
    {
      v6 = v5;
      if (v3 || v4 || v5)
      {
        if (v3)
          IMSetDomainValueForKey();
        if (v4)
        {
          objc_msgSend(v4, "unsignedIntegerValue");
          IMSetDomainIntForKey();
        }
        if (v6)
          IMSetDomainValueForKey();
        IMSetDomainBoolForKey();
        IMSetDomainValueForKey();
        IMSetDomainValueForKey();
        IMSetDomainValueForKey();
      }
    }
  }
}

- (BOOL)sharingEnabled
{
  return IMGetDomainBoolForKey();
}

- (void)setSharingEnabled:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  IMSetDomainValueForKey();
  MEMORY[0x1E0DE7D20](self, sel__syncPreferenceDidChange);
}

- (unint64_t)sharingAudience
{
  unint64_t v3;

  v3 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if (!v3)
  {
    v3 = 1;
    -[IMMeCardSharingStateController setSharingAudience:](self, "setSharingAudience:", 1);
  }
  return v3;
}

- (void)setSharingAudience:(unint64_t)a3
{
  if (a3 <= 1)
    a3 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  IMSetDomainValueForKey();
  MEMORY[0x1E0DE7D20](self, sel__syncPreferenceDidChange);
}

- (unint64_t)nameFormat
{
  return IMGetDomainIntForKey();
}

- (void)setNameFormat:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  IMSetDomainValueForKey();
}

- (void)postNameFormatChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MeCardSharingNameFormat.changed"), 0, 0, 1u);
}

- (BOOL)nameForkedFromMeCard
{
  return IMGetDomainIntForKey() != 0;
}

- (void)setNameForkedFromMeCard:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  IMSetDomainValueForKey();
  MEMORY[0x1E0DE7D20](self, sel__syncPreferenceDidChange);
}

- (BOOL)imageForkedFromMeCard
{
  return IMGetDomainIntForKey() != 0;
}

- (void)setImageForkedFromMeCard:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  IMSetDomainValueForKey();
  MEMORY[0x1E0DE7D20](self, sel__syncPreferenceDidChange);
}

- (void)_incrementSharingVersion
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = IMGetDomainIntForKey();
  v3 = v2 + 1;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412546;
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
      v7 = 2112;
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Incrementing our MeCard Sharing pref version number from %@ to %@", (uint8_t *)&v5, 0x16u);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  IMSetDomainValueForKey();
}

- (void)_syncPreferenceDidChange
{
  -[IMMeCardSharingStateController _incrementSharingVersion](self, "_incrementSharingVersion");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("__kIMNicknamePreferencesDidChangeNotification"), 0);
}

- (BOOL)wasSharingEverEnabled
{
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("MeCardSharingEnabled"), CFSTR("com.apple.messages.nicknames"), &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat != 0;
}

@end
