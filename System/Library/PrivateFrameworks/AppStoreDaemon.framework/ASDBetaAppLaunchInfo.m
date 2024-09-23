@implementation ASDBetaAppLaunchInfo

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ by %@ (%@):\nFeedback Enabled: %d\nLaunch Screen Enabled: %d\nWhat to Test: %@"), self->_displayNames, self->_artistName, self->_version, self->_feedbackEnabled, self->_launchScreenEnabled, self->_localizedTestNotes);
}

- (BOOL)isEqual:(id)a3
{
  ASDBetaAppLaunchInfo *v4;
  uint64_t v5;
  NSString *artistName;
  void *v7;
  ASDBetaAppDisplayNames *displayNames;
  void *v9;
  NSDate *expirationDate;
  void *v11;
  _BOOL4 feedbackEnabled;
  NSString *iconURLTemplate;
  void *v14;
  uint64_t v15;
  void *v16;
  NSDate *lastWelcomeScreenViewDate;
  void *v18;
  NSDictionary *localizedTestNotes;
  void *v20;
  _BOOL4 sharedFeedback;
  NSString *testerEmail;
  void *v23;
  ASDBetaAppVersion *version;
  void *v25;
  char v26;

  v4 = (ASDBetaAppLaunchInfo *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
      goto LABEL_15;
    artistName = self->_artistName;
    -[ASDBetaAppLaunchInfo artistName](v4, "artistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(artistName) = -[NSString isEqualToString:](artistName, "isEqualToString:", v7);

    if (!(_DWORD)artistName)
      goto LABEL_15;
    displayNames = self->_displayNames;
    -[ASDBetaAppLaunchInfo displayNames](v4, "displayNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(displayNames) = -[ASDBetaAppDisplayNames isEqual:](displayNames, "isEqual:", v9);

    if (!(_DWORD)displayNames)
      goto LABEL_15;
    expirationDate = self->_expirationDate;
    -[ASDBetaAppLaunchInfo expirationDate](v4, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(expirationDate) = -[NSDate isEqual:](expirationDate, "isEqual:", v11);

    if (!(_DWORD)expirationDate)
      goto LABEL_15;
    feedbackEnabled = self->_feedbackEnabled;
    if (feedbackEnabled != -[ASDBetaAppLaunchInfo isFeedbackEnabled](v4, "isFeedbackEnabled"))
      goto LABEL_15;
    iconURLTemplate = self->_iconURLTemplate;
    -[ASDBetaAppLaunchInfo iconURLTemplate](v4, "iconURLTemplate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(iconURLTemplate) = -[NSString isEqualToString:](iconURLTemplate, "isEqualToString:", v14);

    if (!(_DWORD)iconURLTemplate)
      goto LABEL_15;
    if (self->_lastWelcomeScreenViewDate)
    {
      -[ASDBetaAppLaunchInfo lastWelcomeScreenViewDate](v4, "lastWelcomeScreenViewDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        lastWelcomeScreenViewDate = self->_lastWelcomeScreenViewDate;
        -[ASDBetaAppLaunchInfo lastWelcomeScreenViewDate](v4, "lastWelcomeScreenViewDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(lastWelcomeScreenViewDate) = -[NSDate isEqualToDate:](lastWelcomeScreenViewDate, "isEqualToDate:", v18);

        if (!(_DWORD)lastWelcomeScreenViewDate)
          goto LABEL_15;
      }
    }
    localizedTestNotes = self->_localizedTestNotes;
    -[ASDBetaAppLaunchInfo localizedTestNotes](v4, "localizedTestNotes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(localizedTestNotes) = -[NSDictionary isEqual:](localizedTestNotes, "isEqual:", v20);

    if (!(_DWORD)localizedTestNotes)
      goto LABEL_15;
    sharedFeedback = self->_sharedFeedback;
    if (sharedFeedback == -[ASDBetaAppLaunchInfo hasSharedFeedback](v4, "hasSharedFeedback")
      && (testerEmail = self->_testerEmail,
          -[ASDBetaAppLaunchInfo testerEmail](v4, "testerEmail"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(testerEmail) = -[NSString isEqualToString:](testerEmail, "isEqualToString:", v23),
          v23,
          (_DWORD)testerEmail))
    {
      version = self->_version;
      -[ASDBetaAppLaunchInfo version](v4, "version");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[ASDBetaAppVersion isEqual:](version, "isEqual:", v25);

    }
    else
    {
LABEL_15:
      v26 = 0;
    }
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *artistName;
  id v5;

  artistName = self->_artistName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", artistName, CFSTR("A"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayNames, CFSTR("B"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("C"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_feedbackEnabled, CFSTR("D"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURLTemplate, CFSTR("E"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastWelcomeScreenViewDate, CFSTR("K"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_launchScreenEnabled, CFSTR("F"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTestNotes, CFSTR("I"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sharedFeedback, CFSTR("G"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testerEmail, CFSTR("H"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("J"));

}

- (ASDBetaAppLaunchInfo)initWithCoder:(id)a3
{
  id v4;
  ASDBetaAppLaunchInfo *v5;
  uint64_t v6;
  NSString *artistName;
  uint64_t v8;
  ASDBetaAppDisplayNames *displayNames;
  uint64_t v10;
  NSDate *expirationDate;
  uint64_t v12;
  NSString *iconURLTemplate;
  uint64_t v14;
  NSDate *lastWelcomeScreenViewDate;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *localizedTestNotes;
  uint64_t v21;
  NSString *testerEmail;
  uint64_t v23;
  ASDBetaAppVersion *version;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ASDBetaAppLaunchInfo;
  v5 = -[ASDBetaAppLaunchInfo init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v6 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayNames = v5->_displayNames;
    v5->_displayNames = (ASDBetaAppDisplayNames *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("C"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v5->_feedbackEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("D"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("E"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconURLTemplate = v5->_iconURLTemplate;
    v5->_iconURLTemplate = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("K"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastWelcomeScreenViewDate = v5->_lastWelcomeScreenViewDate;
    v5->_lastWelcomeScreenViewDate = (NSDate *)v14;

    v5->_launchScreenEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("F"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("I"));
    v19 = objc_claimAutoreleasedReturnValue();
    localizedTestNotes = v5->_localizedTestNotes;
    v5->_localizedTestNotes = (NSDictionary *)v19;

    v5->_sharedFeedback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("G"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("H"));
    v21 = objc_claimAutoreleasedReturnValue();
    testerEmail = v5->_testerEmail;
    v5->_testerEmail = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("J"));
    v23 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (ASDBetaAppVersion *)v23;

  }
  return v5;
}

- (NSString)artistName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (ASDBetaAppDisplayNames)displayNames
{
  return (ASDBetaAppDisplayNames *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)isFeedbackEnabled
{
  return self->_feedbackEnabled;
}

- (void)setFeedbackEnabled:(BOOL)a3
{
  self->_feedbackEnabled = a3;
}

- (NSString)iconURLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIconURLTemplate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDate)lastWelcomeScreenViewDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastWelcomeScreenViewDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (BOOL)isLaunchScreenEnabled
{
  return self->_launchScreenEnabled;
}

- (void)setLaunchScreenEnabled:(BOOL)a3
{
  self->_launchScreenEnabled = a3;
}

- (NSDictionary)localizedTestNotes
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedTestNotes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)hasSharedFeedback
{
  return self->_sharedFeedback;
}

- (void)setSharedFeedback:(BOOL)a3
{
  self->_sharedFeedback = a3;
}

- (NSString)testerEmail
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTesterEmail:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (ASDBetaAppVersion)version
{
  return (ASDBetaAppVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_testerEmail, 0);
  objc_storeStrong((id *)&self->_localizedTestNotes, 0);
  objc_storeStrong((id *)&self->_lastWelcomeScreenViewDate, 0);
  objc_storeStrong((id *)&self->_iconURLTemplate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end
