@implementation CPSSessionConfiguration

+ (CPSSessionConfiguration)standardConfiguration
{
  return (CPSSessionConfiguration *)objc_msgSend(a1, "standardConfigurationWithFallbackClipBundleID:", 0);
}

+ (id)standardConfigurationWithFallbackClipBundleID:(id)a3
{
  return (id)objc_msgSend(a1, "standardConfigurationWithURL:fallbackBundleID:", 0, a3);
}

+ (id)standardConfigurationWithURL:(id)a3 fallbackBundleID:(id)a4
{
  id v5;
  id v6;
  CPSSessionConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(CPSSessionConfiguration);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSSessionConfiguration setSessionID:](v7, "setSessionID:", v8);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSSessionConfiguration setSourceBundleID:](v7, "setSourceBundleID:", v10);

  -[CPSSessionConfiguration sourceBundleID](v7, "sourceBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPSSessionConfiguration reasonForSourceBundleID:](CPSSessionConfiguration, "reasonForSourceBundleID:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("Other");
  -[CPSSessionConfiguration setLaunchReason:](v7, "setLaunchReason:", v14);

  if (!v6)
  {
    objc_msgSend(v5, "cps_fallbackBundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CPSSessionConfiguration setFallbackClipBundleID:](v7, "setFallbackClipBundleID:", v6);

  return v7;
}

+ (CPSSessionConfiguration)localConfiguration
{
  void *v2;

  +[CPSSessionConfiguration standardConfiguration](CPSSessionConfiguration, "standardConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUseLocalContent:", 1);
  return (CPSSessionConfiguration *)v2;
}

+ (CPSSessionConfiguration)pptConfiguration
{
  void *v2;

  +[CPSSessionConfiguration standardConfiguration](CPSSessionConfiguration, "standardConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsedByPPT:", 1);
  return (CPSSessionConfiguration *)v2;
}

+ (CPSSessionConfiguration)pptLocalConfiguration
{
  void *v2;

  +[CPSSessionConfiguration standardConfiguration](CPSSessionConfiguration, "standardConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsedByPPT:", 1);
  objc_msgSend(v2, "setUseLocalContent:", 1);
  return (CPSSessionConfiguration *)v2;
}

+ (id)_defaultSourceBundleIDToReasonMap
{
  _QWORD v3[14];
  _QWORD v4[15];

  v4[14] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.mobilesafari");
  v3[1] = CFSTR("com.apple.SafariViewService");
  v4[0] = CFSTR("Safari");
  v4[1] = CFSTR("Safari");
  v3[2] = CFSTR("com.apple.Maps");
  v3[3] = CFSTR("com.apple.MobileSMS");
  v4[2] = CFSTR("Maps");
  v4[3] = CFSTR("Messages");
  v3[4] = CFSTR("com.apple.BarcodeSupport.BarcodeNotificationService");
  v3[5] = CFSTR("com.apple.duetexpertd");
  v4[4] = CFSTR("NFC");
  v4[5] = CFSTR("LocationBased");
  v3[6] = CFSTR("com.apple.Spotlight");
  v3[7] = CFSTR("com.apple.springboard");
  v4[6] = CFSTR("SpotlightSearch");
  v4[7] = CFSTR("SpringBoard");
  v3[8] = CFSTR("com.apple.SpringBoard");
  v3[9] = CFSTR("com.apple.BarcodeScanner");
  v4[8] = CFSTR("SpringBoard");
  v4[9] = CFSTR("QR");
  v3[10] = CFSTR("com.apple.DTServiceHub");
  v3[11] = CFSTR("com.apple.siri");
  v4[10] = CFSTR("DeveloperTools");
  v4[11] = CFSTR("Siri");
  v3[12] = CFSTR("com.apple.ClipTester");
  v3[13] = CFSTR("com.apple.camera");
  v4[12] = CFSTR("ClipTester");
  v4[13] = CFSTR("QR");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)reasonForSourceBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CPSSessionConfiguration _defaultSourceBundleIDToReasonMap](CPSSessionConfiguration, "_defaultSourceBundleIDToReasonMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)analyticsReferrerBundleID
{
  NSString *referrerBundleID;

  referrerBundleID = self->_referrerBundleID;
  if (!referrerBundleID)
    referrerBundleID = self->_sourceBundleID;
  return referrerBundleID;
}

- (NSString)analyticsLaunchReason
{
  NSString *v3;
  NSString *launchReason;
  NSString *p_isa;
  __CFString *v6;
  __CFString *v7;

  +[CPSSessionConfiguration reasonForSourceBundleID:](CPSSessionConfiguration, "reasonForSourceBundleID:", self->_referrerBundleID);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  launchReason = v3;
  if (!v3)
    launchReason = self->_launchReason;
  p_isa = launchReason;

  if (-[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("Safari"))
    || -[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("InApp")))
  {
    if (self->_referrerBundleID)
      v6 = CFSTR("App Referral");
    else
      v6 = CFSTR("Web Referral");
    v7 = v6;

    p_isa = &v7->isa;
  }
  return p_isa;
}

- (BOOL)analyticsShouldIncludeReferrerURL
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Web Referral");
  v6[1] = CFSTR("App Referral");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSSessionConfiguration analyticsLaunchReason](self, "analyticsLaunchReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "containsObject:", v4);

  return (char)self;
}

- (BOOL)canPrefetchEncryptionKey
{
  if (-[NSString isEqualToString:](self->_launchReason, "isEqualToString:", CFSTR("NFC"))
    || -[NSString isEqualToString:](self->_sourceBundleID, "isEqualToString:", CFSTR("com.apple.BarcodeScanner")))
  {
    return 0;
  }
  else
  {
    return !-[NSString isEqualToString:](self->_launchReason, "isEqualToString:", CFSTR("Other"));
  }
}

- (BOOL)mayLaunchWithoutInvocationUI
{
  void *v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("Maps");
  v5[1] = CFSTR("Safari");
  v5[2] = CFSTR("Messages");
  v5[3] = CFSTR("Mail");
  v5[4] = CFSTR("SpotlightSearch");
  v5[5] = CFSTR("LocationBased");
  v5[6] = CFSTR("Shazam");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "containsObject:", self->_launchReason);

  return (char)self;
}

- (BOOL)isInvokedByPhysicalCode
{
  void *v2;
  char v3;

  -[CPSSessionConfiguration launchReason](self, "launchReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("QR")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("AppclipCode")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("NFC"));
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  CPSSessionConfiguration *v5;
  uint64_t v6;
  NSUUID *sessionID;
  uint64_t v8;
  NSString *sourceBundleID;
  uint64_t v10;
  NSString *referrerBundleID;
  uint64_t v12;
  NSString *launchReason;
  uint64_t v14;
  NSString *fallbackClipBundleID;
  CPSSessionConfiguration *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPSSessionConfiguration;
  v5 = -[CPSSessionConfiguration init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceBundleID = v5->_sourceBundleID;
    v5->_sourceBundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    referrerBundleID = v5->_referrerBundleID;
    v5->_referrerBundleID = (NSString *)v10;

    v5->_usedByPPT = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useByTest"));
    v5->_useLocalContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLocalContent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceReason"));
    v12 = objc_claimAutoreleasedReturnValue();
    launchReason = v5->_launchReason;
    v5->_launchReason = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackClipBundleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    fallbackClipBundleID = v5->_fallbackClipBundleID;
    v5->_fallbackClipBundleID = (NSString *)v14;

    v5->_originIsControlCenter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("originIsControlCenter"));
    v5->_isForSwitcherOverlay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isForSwitcherOverlay"));
    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionID;
  id v5;

  sessionID = self->_sessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceBundleID, CFSTR("sourceBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerBundleID, CFSTR("referrerBundleID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usedByPPT, CFSTR("useByTest"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useLocalContent, CFSTR("useLocalContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchReason, CFSTR("sourceReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackClipBundleID, CFSTR("fallbackClipBundleID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_originIsControlCenter, CFSTR("originIsControlCenter"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForSwitcherOverlay, CFSTR("isForSwitcherOverlay"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sessionID: %@, sourceBundleID: %@, referrerBundleID: %@, usedByPPT: %d, useLocalContent: %d, launchReason: %@, fallbackClipBundleID: %@, originIsControlCenter: %d, isForSwitcherOverlay = %d"), self->_sessionID, self->_sourceBundleID, self->_referrerBundleID, self->_usedByPPT, self->_useLocalContent, self->_launchReason, self->_fallbackClipBundleID, self->_originIsControlCenter, self->_isForSwitcherOverlay);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (void)setSourceBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleID, a3);
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void)setReferrerBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)usedByPPT
{
  return self->_usedByPPT;
}

- (void)setUsedByPPT:(BOOL)a3
{
  self->_usedByPPT = a3;
}

- (BOOL)useLocalContent
{
  return self->_useLocalContent;
}

- (void)setUseLocalContent:(BOOL)a3
{
  self->_useLocalContent = a3;
}

- (NSString)fallbackClipBundleID
{
  return self->_fallbackClipBundleID;
}

- (void)setFallbackClipBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)originIsControlCenter
{
  return self->_originIsControlCenter;
}

- (void)setOriginIsControlCenter:(BOOL)a3
{
  self->_originIsControlCenter = a3;
}

- (BOOL)isForSwitcherOverlay
{
  return self->_isForSwitcherOverlay;
}

- (void)setIsForSwitcherOverlay:(BOOL)a3
{
  self->_isForSwitcherOverlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_fallbackClipBundleID, 0);
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
