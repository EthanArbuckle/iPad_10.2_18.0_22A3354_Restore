@implementation CSLockScreenTestPluginSettings

- (void)setDefaultValues
{
  -[CSLockScreenTestPluginSettings setPresentationStyle:](self, "setPresentationStyle:", 2);
  -[CSLockScreenTestPluginSettings setBackgroundStyle:](self, "setBackgroundStyle:", 1);
  -[CSLockScreenTestPluginSettings setNotificationBehavior:](self, "setNotificationBehavior:", 0);
  -[CSLockScreenTestPluginSettings setEnablePlugin:](self, "setEnablePlugin:", 0);
  -[CSLockScreenTestPluginSettings setEnableLostModePlugin:](self, "setEnableLostModePlugin:", 0);
  -[CSLockScreenTestPluginSettings setRestrictSiri:](self, "setRestrictSiri:", 0);
  -[CSLockScreenTestPluginSettings setRestrictCamera:](self, "setRestrictCamera:", 0);
  -[CSLockScreenTestPluginSettings setRestrictUnlock:](self, "setRestrictUnlock:", 0);
  -[CSLockScreenTestPluginSettings setRestrictLogout:](self, "setRestrictLogout:", 0);
  -[CSLockScreenTestPluginSettings setRestrictTouchID:](self, "setRestrictTouchID:", 0);
  -[CSLockScreenTestPluginSettings setRestrictMediaControls:](self, "setRestrictMediaControls:", 0);
  -[CSLockScreenTestPluginSettings setRestrictTodayCenter:](self, "setRestrictTodayCenter:", 0);
  -[CSLockScreenTestPluginSettings setRestrictControlCenter:](self, "setRestrictControlCenter:", 0);
  -[CSLockScreenTestPluginSettings setHideStatusBar:](self, "setHideStatusBar:", 0);
  -[CSLockScreenTestPluginSettings setHideTimeAndDate:](self, "setHideTimeAndDate:", 0);
  -[CSLockScreenTestPluginSettings setHideSubtitle:](self, "setHideSubtitle:", 0);
  -[CSLockScreenTestPluginSettings setSubtitleValue:](self, "setSubtitleValue:", 0);
  -[CSLockScreenTestPluginSettings setDisableOnUnlock:](self, "setDisableOnUnlock:", 1);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[8];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Test Plugin"), CFSTR("enablePlugin"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Lost Mode Plugin"), CFSTR("enableLostModePlugin"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v37;
  v43[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Background Style"), CFSTR("backgroundStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "possibleValues:titles:", &unk_1E8E8A108, &unk_1E8E8A0F0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Notification Behavior"), CFSTR("notificationBehavior"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleValues:titles:", &unk_1E8E8A138, &unk_1E8E8A120);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Presentation Style"), CFSTR("presentationStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleValues:titles:", &unk_1E8E8A168, &unk_1E8E8A150);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Siri"), CFSTR("restrictSiri"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v7;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Camera"), CFSTR("restrictCamera"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Unlock"), CFSTR("restrictUnlock"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Logout"), CFSTR("restrictLogout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict TouchID"), CFSTR("restrictTouchID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v11;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Media Controls"), CFSTR("restrictMediaControls"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v12;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Today Center"), CFSTR("restrictTodayCenter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Restrict Control Center"), CFSTR("restrictControlCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sectionWithRows:", v15);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Status Bar"), CFSTR("hideStatusBar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Time & Date"), CFSTR("hideTimeAndDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hide Subtitle"), CFSTR("hideSubtitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v19;
  objc_msgSend(MEMORY[0x1E0D83068], "rowWithTitle:valueKeyPath:", CFSTR("Subtitle Value"), CFSTR("subtitleValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable on Unlock"), CFSTR("disableOnUnlock"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D83078];
  v40[0] = v33;
  v40[1] = v38;
  v40[2] = v34;
  v40[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v39[0] = v35;
  v39[1] = v25;
  v39[2] = v32;
  v39[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moduleWithTitle:contents:", CFSTR("Lock Screen Test Plugin"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)enablePlugin
{
  return self->_enablePlugin;
}

- (void)setEnablePlugin:(BOOL)a3
{
  self->_enablePlugin = a3;
}

- (BOOL)enableLostModePlugin
{
  return self->_enableLostModePlugin;
}

- (void)setEnableLostModePlugin:(BOOL)a3
{
  self->_enableLostModePlugin = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (int64_t)notificationBehavior
{
  return self->_notificationBehavior;
}

- (void)setNotificationBehavior:(int64_t)a3
{
  self->_notificationBehavior = a3;
}

- (BOOL)restrictSiri
{
  return self->_restrictSiri;
}

- (void)setRestrictSiri:(BOOL)a3
{
  self->_restrictSiri = a3;
}

- (BOOL)restrictCamera
{
  return self->_restrictCamera;
}

- (void)setRestrictCamera:(BOOL)a3
{
  self->_restrictCamera = a3;
}

- (BOOL)restrictUnlock
{
  return self->_restrictUnlock;
}

- (void)setRestrictUnlock:(BOOL)a3
{
  self->_restrictUnlock = a3;
}

- (BOOL)restrictLogout
{
  return self->_restrictLogout;
}

- (void)setRestrictLogout:(BOOL)a3
{
  self->_restrictLogout = a3;
}

- (BOOL)restrictTouchID
{
  return self->_restrictTouchID;
}

- (void)setRestrictTouchID:(BOOL)a3
{
  self->_restrictTouchID = a3;
}

- (BOOL)restrictMediaControls
{
  return self->_restrictMediaControls;
}

- (void)setRestrictMediaControls:(BOOL)a3
{
  self->_restrictMediaControls = a3;
}

- (BOOL)restrictTodayCenter
{
  return self->_restrictTodayCenter;
}

- (void)setRestrictTodayCenter:(BOOL)a3
{
  self->_restrictTodayCenter = a3;
}

- (BOOL)restrictControlCenter
{
  return self->_restrictControlCenter;
}

- (void)setRestrictControlCenter:(BOOL)a3
{
  self->_restrictControlCenter = a3;
}

- (BOOL)hideStatusBar
{
  return self->_hideStatusBar;
}

- (void)setHideStatusBar:(BOOL)a3
{
  self->_hideStatusBar = a3;
}

- (BOOL)hideTimeAndDate
{
  return self->_hideTimeAndDate;
}

- (void)setHideTimeAndDate:(BOOL)a3
{
  self->_hideTimeAndDate = a3;
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (NSString)subtitleValue
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSubtitleValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)disableOnUnlock
{
  return self->_disableOnUnlock;
}

- (void)setDisableOnUnlock:(BOOL)a3
{
  self->_disableOnUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleValue, 0);
}

@end
