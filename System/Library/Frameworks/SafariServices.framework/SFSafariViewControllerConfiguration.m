@implementation SFSafariViewControllerConfiguration

- (SFSafariViewControllerConfiguration)init
{
  SFSafariViewControllerConfiguration *v2;
  SFSafariViewControllerConfiguration *v3;
  SFSafariViewControllerConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSafariViewControllerConfiguration;
  v2 = -[SFSafariViewControllerConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_barCollapsingEnabled = 1;
    v2->_jitEnabled = 1;
    v2->_redirectNotificationBehavior = dyld_program_sdk_at_least();
    v4 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 40), self->_activityButton);
  *(_BYTE *)(v5 + 13) = self->_barCollapsingEnabled;
  *(_BYTE *)(v5 + 12) = self->_entersReaderIfAvailable;
  *(_BYTE *)(v5 + 8) = self->_ephemeral;
  *(_BYTE *)(v5 + 10) = self->_jitEnabled;
  *(_BYTE *)(v5 + 9) = self->_performingAccountSecurityUpgrade;
  objc_storeStrong((id *)(v5 + 24), self->_personaUniqueIdentifier);
  *(_QWORD *)(v5 + 16) = self->_redirectNotificationBehavior;
  *(_BYTE *)(v5 + 11) = self->_isBeingUsedForCellularServiceBootstrap;
  v6 = -[UIEventAttribution copyWithZone:](self->_eventAttribution, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  *(_QWORD *)(v5 + 32) = self->_storageModeForAuthenticationSession;
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4;
  SFSafariViewControllerConfiguration *v5;
  uint64_t v6;
  SFSafariViewControllerActivityButton *activityButton;
  uint64_t v8;
  NSString *personaUniqueIdentifier;
  id v10;
  void *v11;
  uint64_t v12;
  UIEventAttribution *eventAttribution;
  SFSafariViewControllerConfiguration *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFSafariViewControllerConfiguration;
  v5 = -[SFSafariViewControllerConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customActivityButton"));
    v6 = objc_claimAutoreleasedReturnValue();
    activityButton = v5->_activityButton;
    v5->_activityButton = (SFSafariViewControllerActivityButton *)v6;

    v5->_barCollapsingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("barCollapsingEnabled"));
    v5->_entersReaderIfAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("entersReaderIfAvailable"));
    v5->_ephemeral = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEphemeral"));
    v5->_jitEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("jitEnabled"));
    v5->_performingAccountSecurityUpgrade = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performingAccountSecurityUpgrade"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    personaUniqueIdentifier = v5->_personaUniqueIdentifier;
    v5->_personaUniqueIdentifier = (NSString *)v8;

    v5->_redirectNotificationBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("redirectNotificationBehavior"));
    v5->_isBeingUsedForCellularServiceBootstrap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBeingUsedForCellularServiceBootstrap"));
    v10 = objc_alloc(MEMORY[0x1E0DC37A8]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventAttribution"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithUISClickAttribution:", v11);
    eventAttribution = v5->_eventAttribution;
    v5->_eventAttribution = (UIEventAttribution *)v12;

    v5->_storageModeForAuthenticationSession = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("storageModeForAuthenticationSession"));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SFSafariViewControllerActivityButton *activityButton;
  void *v5;
  id v6;

  activityButton = self->_activityButton;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", activityButton, CFSTR("customActivityButton"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_barCollapsingEnabled, CFSTR("barCollapsingEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_entersReaderIfAvailable, CFSTR("entersReaderIfAvailable"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_ephemeral, CFSTR("isEphemeral"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_jitEnabled, CFSTR("jitEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_performingAccountSecurityUpgrade, CFSTR("performingAccountSecurityUpgrade"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_personaUniqueIdentifier, CFSTR("personaUniqueIdentifier"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_redirectNotificationBehavior, CFSTR("redirectNotificationBehavior"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isBeingUsedForCellularServiceBootstrap, CFSTR("isBeingUsedForCellularServiceBootstrap"));
  -[UIEventAttribution toUISClickAttribution](self->_eventAttribution, "toUISClickAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("eventAttribution"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_storageModeForAuthenticationSession, CFSTR("storageModeForAuthenticationSession"));
}

- (int64_t)_redirectNotificationBehavior
{
  return self->_redirectNotificationBehavior;
}

- (void)set_redirectNotificationBehavior:(int64_t)a3
{
  self->_redirectNotificationBehavior = a3;
}

- (BOOL)_isEphemeral
{
  return self->_ephemeral;
}

- (void)_setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (BOOL)_isPerformingAccountSecurityUpgrade
{
  return self->_performingAccountSecurityUpgrade;
}

- (void)_setPerformingAccountSecurityUpgrade:(BOOL)a3
{
  self->_performingAccountSecurityUpgrade = a3;
}

- (NSString)_personaUniqueIdentifier
{
  return self->_personaUniqueIdentifier;
}

- (void)_setPersonaUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)_isJITEnabled
{
  return self->_jitEnabled;
}

- (void)_setJITEnabled:(BOOL)a3
{
  self->_jitEnabled = a3;
}

- (BOOL)_isBeingUsedForCellularServiceBootstrap
{
  return self->_isBeingUsedForCellularServiceBootstrap;
}

- (void)set_isBeingUsedForCellularServiceBootstrap:(BOOL)a3
{
  self->_isBeingUsedForCellularServiceBootstrap = a3;
}

- (unint64_t)_storageModeForAuthenticationSession
{
  return self->_storageModeForAuthenticationSession;
}

- (void)set_storageModeForAuthenticationSession:(unint64_t)a3
{
  self->_storageModeForAuthenticationSession = a3;
}

- (BOOL)entersReaderIfAvailable
{
  return self->_entersReaderIfAvailable;
}

- (void)setEntersReaderIfAvailable:(BOOL)entersReaderIfAvailable
{
  self->_entersReaderIfAvailable = entersReaderIfAvailable;
}

- (BOOL)barCollapsingEnabled
{
  return self->_barCollapsingEnabled;
}

- (void)setBarCollapsingEnabled:(BOOL)barCollapsingEnabled
{
  self->_barCollapsingEnabled = barCollapsingEnabled;
}

- (SFSafariViewControllerActivityButton)activityButton
{
  return self->_activityButton;
}

- (void)setActivityButton:(SFSafariViewControllerActivityButton *)activityButton
{
  objc_setProperty_nonatomic_copy(self, a2, activityButton, 40);
}

- (UIEventAttribution)eventAttribution
{
  return self->_eventAttribution;
}

- (void)setEventAttribution:(UIEventAttribution *)eventAttribution
{
  objc_setProperty_nonatomic_copy(self, a2, eventAttribution, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAttribution, 0);
  objc_storeStrong((id *)&self->_activityButton, 0);
  objc_storeStrong((id *)&self->_personaUniqueIdentifier, 0);
}

@end
