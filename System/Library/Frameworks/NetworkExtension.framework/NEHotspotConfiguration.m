@implementation NEHotspotConfiguration

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEHotspotConfiguration SSID](self, "SSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[NEHotspotConfiguration SSID](self, "SSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v6, CFSTR("SSID"), 0, 0);

  }
  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("SSID Prefix"), 0, 0);

  }
  -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tLife Time : %@ Days\n"), v10);

  switch(-[NEHotspotConfiguration securityType](self, "securityType"))
  {
    case 1:
      objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", CFSTR("WEP"), CFSTR("Security Type"), 0, 0);
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("WEP Passphrase");
      goto LABEL_9;
    case 2:
      objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", CFSTR("WPA/WPA2 Personal"), CFSTR("Security Type"), 0, 0);
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("WPA/WPA2 Personal Passphrase");
LABEL_9:
      v13 = v3;
      v14 = v11;
      v15 = 3;
      goto LABEL_13;
    case 3:
      objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", CFSTR("WPA/WPA2 Enterprise"), CFSTR("Security Type"), 0, 0);
      -[NEHotspotConfiguration eapSettings](self, "eapSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("EAP Configuration");
      goto LABEL_12;
    case 4:
      objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", CFSTR("Hotspot 2.0"), CFSTR("Security Type"), 0, 0);
      -[NEHotspotConfiguration eapSettings](self, "eapSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("EAP Configuration"), 0, 0);

      -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("Hotspot 2.0 Configuration");
LABEL_12:
      v13 = v3;
      v14 = v11;
      v15 = 0;
LABEL_13:
      objc_msgSend(v13, "appendPrettyObject:withName:andIndent:options:", v14, v12, 0, v15);

      break;
    default:
      objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", CFSTR("Open"), CFSTR("Security Type"), 0, 0);
      break;
  }
  return v3;
}

- (NEHotspotConfiguration)init
{
  NEHotspotConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEHotspotConfiguration;
  result = -[NEHotspotConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_securityType = 0;
    *(_WORD *)&result->_joinOnce = 0;
    result->_useSSIDPrefix = 0;
  }
  return result;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID
{
  NSString *v4;
  NEHotspotConfiguration *v5;
  uint64_t v6;
  NSString *v7;
  NSString *SSIDPrefix;
  objc_super v10;

  v4 = SSID;
  v10.receiver = self;
  v10.super_class = (Class)NEHotspotConfiguration;
  v5 = -[NEHotspotConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_SSID;
    v5->_SSID = (NSString *)v6;

    SSIDPrefix = v5->_SSIDPrefix;
    v5->_SSIDPrefix = (NSString *)&stru_1E3CC53C8;

    v5->_securityType = 0;
    v5->_useSSIDPrefix = 0;
  }

  return v5;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP
{
  _BOOL4 v5;
  NSString *v8;
  NSString *v9;
  NEHotspotConfiguration *v10;
  uint64_t v11;
  NSString *v12;
  NSString *SSIDPrefix;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  objc_super v18;

  v5 = isWEP;
  v8 = SSID;
  v9 = passphrase;
  v18.receiver = self;
  v18.super_class = (Class)NEHotspotConfiguration;
  v10 = -[NEHotspotConfiguration init](&v18, sel_init);
  if (v10)
  {
    v11 = -[NSString copy](v8, "copy");
    v12 = v10->_SSID;
    v10->_SSID = (NSString *)v11;

    SSIDPrefix = v10->_SSIDPrefix;
    v10->_SSIDPrefix = (NSString *)&stru_1E3CC53C8;

    v14 = 1;
    if (!v5)
      v14 = 2;
    v10->_securityType = v14;
    v15 = -[NSString copy](v9, "copy");
    v16 = v10->_passphrase;
    v10->_passphrase = (NSString *)v15;

    v10->_useSSIDPrefix = 0;
  }

  return v10;
}

- (NEHotspotConfiguration)initWithSSID:(NSString *)SSID eapSettings:(NEHotspotEAPSettings *)eapSettings
{
  NSString *v6;
  NEHotspotEAPSettings *v7;
  NEHotspotConfiguration *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NEHotspotEAPSettings *v12;
  NEHotspotEAPSettings *v13;
  objc_super v15;

  v6 = SSID;
  v7 = eapSettings;
  v15.receiver = self;
  v15.super_class = (Class)NEHotspotConfiguration;
  v8 = -[NEHotspotConfiguration init](&v15, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_SSID;
    v8->_SSID = (NSString *)v9;

    v8->_securityType = 3;
    v11 = -[NEHotspotEAPSettings copy](v7, "copy");
    v12 = v8->_eapSettings;
    v8->_eapSettings = (NEHotspotEAPSettings *)v11;

    v13 = v8->_eapSettings;
    if (v13)
    {
      -[NEHotspotEAPSettings setPreferredTLSVersion:](v13, "setPreferredTLSVersion:", 2);
      -[NEHotspotEAPSettings setTlsClientCertificateRequired:](v8->_eapSettings, "setTlsClientCertificateRequired:", 0);
    }
  }

  return v8;
}

- (NEHotspotConfiguration)initWithHS20Settings:(NEHotspotHS20Settings *)hs20Settings eapSettings:(NEHotspotEAPSettings *)eapSettings
{
  NEHotspotHS20Settings *v6;
  NEHotspotEAPSettings *v7;
  NEHotspotConfiguration *v8;
  NEHotspotConfiguration *v9;
  NSString *SSID;
  uint64_t v11;
  NEHotspotEAPSettings *v12;
  NEHotspotEAPSettings *v13;
  uint64_t v14;
  NEHotspotHS20Settings *v15;
  objc_super v17;

  v6 = hs20Settings;
  v7 = eapSettings;
  v17.receiver = self;
  v17.super_class = (Class)NEHotspotConfiguration;
  v8 = -[NEHotspotConfiguration init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    SSID = v8->_SSID;
    v8->_SSID = (NSString *)&stru_1E3CC53C8;

    v9->_securityType = 4;
    v11 = -[NEHotspotEAPSettings copy](v7, "copy");
    v12 = v9->_eapSettings;
    v9->_eapSettings = (NEHotspotEAPSettings *)v11;

    v13 = v9->_eapSettings;
    if (v13)
    {
      -[NEHotspotEAPSettings setPreferredTLSVersion:](v13, "setPreferredTLSVersion:", 2);
      -[NEHotspotEAPSettings setTlsClientCertificateRequired:](v9->_eapSettings, "setTlsClientCertificateRequired:", 0);
    }
    v14 = -[NEHotspotHS20Settings copy](v6, "copy");
    v15 = v9->_hs20Settings;
    v9->_hs20Settings = (NEHotspotHS20Settings *)v14;

  }
  return v9;
}

- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix
{
  NSString *v4;
  NEHotspotConfiguration *v5;
  NEHotspotConfiguration *v6;
  NSString *SSID;
  uint64_t v8;
  NSString *v9;
  objc_super v11;

  v4 = SSIDPrefix;
  v11.receiver = self;
  v11.super_class = (Class)NEHotspotConfiguration;
  v5 = -[NEHotspotConfiguration init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)&stru_1E3CC53C8;

    v8 = -[NSString copy](v4, "copy");
    v9 = v6->_SSIDPrefix;
    v6->_SSIDPrefix = (NSString *)v8;

    v6->_securityType = 0;
    v6->_useSSIDPrefix = 1;
  }

  return v6;
}

- (NEHotspotConfiguration)initWithSSIDPrefix:(NSString *)SSIDPrefix passphrase:(NSString *)passphrase isWEP:(BOOL)isWEP
{
  _BOOL4 v5;
  NSString *v8;
  NSString *v9;
  NEHotspotConfiguration *v10;
  NEHotspotConfiguration *v11;
  NSString *SSID;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v5 = isWEP;
  v8 = SSIDPrefix;
  v9 = passphrase;
  v19.receiver = self;
  v19.super_class = (Class)NEHotspotConfiguration;
  v10 = -[NEHotspotConfiguration init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    SSID = v10->_SSID;
    v10->_SSID = (NSString *)&stru_1E3CC53C8;

    v13 = -[NSString copy](v8, "copy");
    v14 = v11->_SSIDPrefix;
    v11->_SSIDPrefix = (NSString *)v13;

    if (v5)
      v15 = 1;
    else
      v15 = 2;
    v11->_securityType = v15;
    v16 = -[NSString copy](v9, "copy");
    v17 = v11->_passphrase;
    v11->_passphrase = (NSString *)v16;

    v11->_useSSIDPrefix = 1;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;

  if (!-[NEHotspotConfiguration securityType](self, "securityType"))
  {
    v13 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
    v14 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    if (v13)
    {
      -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "initWithSSIDPrefix:", v7);
    }
    else
    {
      -[NEHotspotConfiguration SSID](self, "SSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "initWithSSID:", v7);
    }
    v19 = (void *)v15;
    goto LABEL_20;
  }
  if (-[NEHotspotConfiguration securityType](self, "securityType") == 1)
  {
    v5 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
    v6 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    if (v5)
    {
      -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)v6;
      v10 = v7;
      v11 = v8;
      v12 = 1;
LABEL_10:
      v18 = objc_msgSend(v9, "initWithSSIDPrefix:passphrase:isWEP:", v10, v11, v12);
LABEL_19:
      v19 = (void *)v18;

LABEL_20:
      goto LABEL_21;
    }
    -[NEHotspotConfiguration SSID](self, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEHotspotConfiguration passphrase](self, "passphrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v6;
    v21 = v7;
    v22 = v8;
    v23 = 1;
    goto LABEL_18;
  }
  if (-[NEHotspotConfiguration securityType](self, "securityType") == 2)
  {
    v16 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
    v17 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    if (v16)
    {
      -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)v17;
      v10 = v7;
      v11 = v8;
      v12 = 0;
      goto LABEL_10;
    }
    -[NEHotspotConfiguration SSID](self, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEHotspotConfiguration passphrase](self, "passphrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v17;
    v21 = v7;
    v22 = v8;
    v23 = 0;
LABEL_18:
    v18 = objc_msgSend(v20, "initWithSSID:passphrase:isWEP:", v21, v22, v23);
    goto LABEL_19;
  }
  if (-[NEHotspotConfiguration securityType](self, "securityType") != 3)
  {
    if (-[NEHotspotConfiguration securityType](self, "securityType") != 4)
    {
      v19 = 0;
      goto LABEL_21;
    }
    v27 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEHotspotConfiguration eapSettings](self, "eapSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v27, "initWithHS20Settings:eapSettings:", v7, v8);
    goto LABEL_19;
  }
  -[NEHotspotConfiguration eapSettings](self, "eapSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v24 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[NEHotspotConfiguration SSID](self, "SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEHotspotConfiguration eapSettings](self, "eapSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v24, "initWithSSID:eapSettings:", v7, v8);
    goto LABEL_19;
  }
LABEL_21:
  objc_msgSend(v19, "setUseSSIDPrefix:", -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"));
  objc_msgSend(v19, "setSecurityType:", -[NEHotspotConfiguration securityType](self, "securityType"));
  -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLifeTimeInDays:", v25);

  objc_msgSend(v19, "setJoinOnce:", -[NEHotspotConfiguration joinOnce](self, "joinOnce"));
  objc_msgSend(v19, "setHidden:", -[NEHotspotConfiguration hidden](self, "hidden"));
  return v19;
}

- (NEHotspotConfiguration)initWithCoder:(id)a3
{
  id v4;
  NEHotspotConfiguration *v5;
  uint64_t v6;
  NSString *SSID;
  uint64_t v8;
  NSString *SSIDPrefix;
  uint64_t v10;
  NSNumber *lifeTimeInDays;
  uint64_t v12;
  NSString *passphrase;
  uint64_t v14;
  NEHotspotEAPSettings *eapSettings;
  uint64_t v16;
  NEHotspotHS20Settings *hs20Settings;

  v4 = a3;
  v5 = -[NEHotspotConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    SSID = v5->_SSID;
    v5->_SSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSIDPrefix"));
    v8 = objc_claimAutoreleasedReturnValue();
    SSIDPrefix = v5->_SSIDPrefix;
    v5->_SSIDPrefix = (NSString *)v8;

    v5->_useSSIDPrefix = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UseSSIDPrefix"));
    v5->_securityType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SecurityType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LifeTimeInDays"));
    v10 = objc_claimAutoreleasedReturnValue();
    lifeTimeInDays = v5->_lifeTimeInDays;
    v5->_lifeTimeInDays = (NSNumber *)v10;

    v5->_joinOnce = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("JoinOnce"));
    v5->_isAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsAccessory"));
    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passphrase"));
    v12 = objc_claimAutoreleasedReturnValue();
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EAPSettings"));
    v14 = objc_claimAutoreleasedReturnValue();
    eapSettings = v5->_eapSettings;
    v5->_eapSettings = (NEHotspotEAPSettings *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HSSettings"));
    v16 = objc_claimAutoreleasedReturnValue();
    hs20Settings = v5->_hs20Settings;
    v5->_hs20Settings = (NEHotspotHS20Settings *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[NEHotspotConfiguration SSID](self, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSID"));

  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SSIDPrefix"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"), CFSTR("UseSSIDPrefix"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEHotspotConfiguration securityType](self, "securityType"), CFSTR("SecurityType"));
  -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LifeTimeInDays"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration joinOnce](self, "joinOnce"), CFSTR("JoinOnce"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration isAccessory](self, "isAccessory"), CFSTR("IsAccessory"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEHotspotConfiguration hidden](self, "hidden"), CFSTR("hidden"));
  -[NEHotspotConfiguration passphrase](self, "passphrase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("passphrase"));

  -[NEHotspotConfiguration eapSettings](self, "eapSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("EAPSettings"));

  -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HSSettings"));

}

- (int64_t)validate
{
  void *v2;
  void *v3;
  BOOL v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  NSNumber *lifeTimeInDays;
  id v57;
  NSObject *v58;
  id v59;
  const char *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  unint64_t v79;
  void *v80;
  uint64_t i;
  uint64_t v82;
  char v83;
  char v84;
  NSObject *v85;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t v100[128];
  uint8_t buf[4];
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = -[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix");
  if (v5
    || (-[NEHotspotConfiguration SSID](self, "SSID"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v2, "length")))
  {
    v6 = 0;
    v7 = 0;
    if (!-[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"))
      goto LABEL_12;
  }
  else
  {
    -[NEHotspotConfiguration SSID](self, "SSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "length") <= 0x20)
    {

      goto LABEL_16;
    }
    if (!-[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"))
    {

      goto LABEL_37;
    }
    v6 = 1;
  }
  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

    v7 = 0;
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") >= 3)
  {
    -[NEHotspotConfiguration SSIDPrefix](self, "SSIDPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v10, "length") < 0x21;

    if ((v6 & 1) == 0)
      goto LABEL_12;
LABEL_11:

    goto LABEL_12;
  }

  v7 = 0;
  if ((v6 & 1) != 0)
    goto LABEL_11;
LABEL_12:
  if (v5)
  {
    if (!v7)
    {
LABEL_37:
      if (-[NEHotspotConfiguration securityType](self, "securityType") != 4)
      {
        v25 = -[NEHotspotConfiguration securityType](self, "securityType");
        if (v25 != 4)
        {
          if (v25 == 3)
            return 101;
          if (-[NEHotspotConfiguration useSSIDPrefix](self, "useSSIDPrefix"))
            return 110;
          return 101;
        }
        return 106;
      }
      if (-[NEHotspotConfiguration joinOnce](self, "joinOnce"))
      {
        ne_log_obj();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v102 = (id)objc_opt_class();
          v22 = v102;
          v23 = "%@ JoinOnce is not supported for Hotspot 2.0 Wi-Fi networks.";
          goto LABEL_85;
        }
LABEL_40:

        return 109;
      }
      -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "domainName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "length"))
          {
            -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "domainName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "length");

            if (v33 <= 0x80)
            {
              -[NEHotspotConfiguration eapSettings](self, "eapSettings");
              v34 = objc_claimAutoreleasedReturnValue();
              if (v34)
              {
                v35 = (void *)v34;
                -[NEHotspotConfiguration eapSettings](self, "eapSettings");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v37 = -[NEHotspotConfiguration validateEAPSettings]((uint64_t)self);

                  if ((v37 & 1) != 0)
                  {
                    -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = objc_msgSend(v38, "isRoamingEnabled");

                    if (v39)
                    {
                      -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "roamingConsortiumOIs");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v41, "count"))
                      {

                      }
                      else
                      {
                        -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v63, "naiRealmNames");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        v65 = objc_msgSend(v64, "count");

                        if (!v65)
                        {
                          ne_log_obj();
                          v87 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v102 = (id)objc_opt_class();
                            v91 = v102;
                            _os_log_error_impl(&dword_19BD16000, v87, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 configuration(roaming consortium OIs/NAI realms not provided).", buf, 0xCu);

                          }
                          return 105;
                        }
                      }
                    }
                    -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "MCCAndMNCs");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(v67, "count");

                    if (!v68)
                      goto LABEL_78;
                    v98 = 0u;
                    v99 = 0u;
                    v96 = 0u;
                    v97 = 0u;
                    -[NEHotspotConfiguration hs20Settings](self, "hs20Settings");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "MCCAndMNCs");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();

                    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
                    if (!v71)
                    {
LABEL_114:

                      goto LABEL_78;
                    }
                    v72 = v71;
                    v73 = *(_QWORD *)v97;
                    v74 = 0x1E0CB3000uLL;
                    v75 = 0x1E0CB3000uLL;
                    v94 = *(_QWORD *)v97;
                    v95 = v70;
                    while (1)
                    {
                      v76 = 0;
LABEL_99:
                      if (*(_QWORD *)v97 != v73)
                        objc_enumerationMutation(v70);
                      v77 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v76);
                      v78 = v74;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v77, "length") != 6)
                        break;
                      v79 = v75;
                      objc_msgSend(*(id *)(v75 + 1280), "characterSetWithCharactersInString:", CFSTR("0123456789"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      for (i = 0; i != 6; ++i)
                      {
                        v82 = objc_msgSend(v77, "characterAtIndex:", i, v94);
                        v83 = objc_msgSend(v80, "characterIsMember:", v82);
                        if (i == 3)
                        {
                          if ((_DWORD)v82 == 70)
                            v84 = 1;
                          else
                            v84 = v83;
                          if ((v84 & 1) == 0)
                          {
                            ne_log_obj();
                            v85 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                            {
LABEL_126:
                              v89 = (void *)objc_opt_class();
                              *(_DWORD *)buf = 138412290;
                              v102 = v89;
                              v90 = v89;
                              _os_log_error_impl(&dword_19BD16000, v85, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 configuration.", buf, 0xCu);

                            }
LABEL_118:

                            return 105;
                          }
                        }
                        else if ((v83 & 1) == 0)
                        {
                          ne_log_obj();
                          v85 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                            goto LABEL_126;
                          goto LABEL_118;
                        }
                      }

                      ++v76;
                      v74 = v78;
                      v73 = v94;
                      v70 = v95;
                      v75 = v79;
                      if (v76 != v72)
                        goto LABEL_99;
                      v72 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
                      if (!v72)
                        goto LABEL_114;
                    }
                    ne_log_obj();
                    v88 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                    {
                      v92 = (void *)objc_opt_class();
                      *(_DWORD *)buf = 138412290;
                      v102 = v92;
                      v93 = v92;
                      _os_log_error_impl(&dword_19BD16000, v88, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 configuration.", buf, 0xCu);

                    }
                    return 105;
                  }
                }
                else
                {

                }
              }
              ne_log_obj();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v102 = (id)objc_opt_class();
                v59 = v102;
                v60 = "%@ invalid HS2.0 EAP settings.";
                goto LABEL_93;
              }
LABEL_91:

              return 104;
            }
            goto LABEL_73;
          }

        }
      }
LABEL_73:
      ne_log_obj();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v102 = (id)objc_opt_class();
        v61 = v102;
        _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "%@ invalid HS2.0 domain name.", buf, 0xCu);

      }
      return 106;
    }
  }
  else
  {

    if (!v7)
      goto LABEL_37;
  }
LABEL_16:
  if (!-[NEHotspotConfiguration securityType](self, "securityType"))
    goto LABEL_78;
  if (-[NEHotspotConfiguration securityType](self, "securityType") == 2)
  {
    -[NEHotspotConfiguration passphrase](self, "passphrase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "length") > 7)
      {
        -[NEHotspotConfiguration passphrase](self, "passphrase");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14 < 0x40)
          goto LABEL_78;
        goto LABEL_59;
      }

    }
LABEL_59:
    ne_log_obj();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v102 = (id)objc_opt_class();
      v57 = v102;
      _os_log_error_impl(&dword_19BD16000, v42, OS_LOG_TYPE_ERROR, "%@ invalid WPA/WPA2 passphrase length.", buf, 0xCu);

    }
    return 102;
  }
  if (-[NEHotspotConfiguration securityType](self, "securityType") != 1)
  {
    if (-[NEHotspotConfiguration securityType](self, "securityType") != 3)
      goto LABEL_78;
    if (-[NEHotspotConfiguration joinOnce](self, "joinOnce"))
    {
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v102 = (id)objc_opt_class();
        v22 = v102;
        v23 = "%@ JoinOnce is not supported for Enterprise Wi-Fi networks.";
LABEL_85:
        _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

        goto LABEL_40;
      }
      goto LABEL_40;
    }
    -[NEHotspotConfiguration eapSettings](self, "eapSettings");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)v43;
      -[NEHotspotConfiguration eapSettings](self, "eapSettings");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = -[NEHotspotConfiguration validateEAPSettings]((uint64_t)self);

        if ((v46 & 1) != 0)
          goto LABEL_78;
      }
      else
      {

      }
    }
    ne_log_obj();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v102 = (id)objc_opt_class();
      v59 = v102;
      v60 = "%@ invalid EAP settings.";
LABEL_93:
      _os_log_error_impl(&dword_19BD16000, v58, OS_LOG_TYPE_ERROR, v60, buf, 0xCu);

      goto LABEL_91;
    }
    goto LABEL_91;
  }
  -[NEHotspotConfiguration passphrase](self, "passphrase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length") && self)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invertedSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEHotspotConfiguration passphrase](self, "passphrase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rangeOfCharacterFromSet:", v17);

    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length") == 10)
      {

        goto LABEL_78;
      }
      -[NEHotspotConfiguration passphrase](self, "passphrase");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "length");

      if (v50 == 26)
      {
LABEL_78:
        -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
        v51 = objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v52 = (void *)v51;
          -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)objc_msgSend(v53, "intValue") >= 366)
          {

LABEL_82:
            lifeTimeInDays = self->_lifeTimeInDays;
            self->_lifeTimeInDays = 0;

            return 100;
          }
          -[NEHotspotConfiguration lifeTimeInDays](self, "lifeTimeInDays");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "intValue");

          if (v55 <= 0)
            goto LABEL_82;
        }
        return 100;
      }
      goto LABEL_68;
    }

  }
LABEL_68:
  ne_log_obj();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v102 = (id)objc_opt_class();
    v62 = v102;
    _os_log_error_impl(&dword_19BD16000, v47, OS_LOG_TYPE_ERROR, "%@ invalid WEP passphrase length.", buf, 0xCu);

  }
  return 103;
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)SSIDPrefix
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)joinOnce
{
  return self->_joinOnce;
}

- (void)setJoinOnce:(BOOL)joinOnce
{
  self->_joinOnce = joinOnce;
}

- (NSNumber)lifeTimeInDays
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLifeTimeInDays:(NSNumber *)lifeTimeInDays
{
  objc_setProperty_atomic_copy(self, a2, lifeTimeInDays, 32);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (int64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(int64_t)a3
{
  self->_securityType = a3;
}

- (NSString)passphrase
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPassphrase:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NEHotspotEAPSettings)eapSettings
{
  return (NEHotspotEAPSettings *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEapSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NEHotspotHS20Settings)hs20Settings
{
  return (NEHotspotHS20Settings *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHs20Settings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)useSSIDPrefix
{
  return self->_useSSIDPrefix;
}

- (void)setUseSSIDPrefix:(BOOL)a3
{
  self->_useSSIDPrefix = a3;
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hs20Settings, 0);
  objc_storeStrong((id *)&self->_eapSettings, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_lifeTimeInDays, 0);
  objc_storeStrong((id *)&self->_SSIDPrefix, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

- (uint64_t)validateEAPSettings
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CFTypeID v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  CFTypeID v45;
  CFTypeID TypeID;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  id v56;
  const char *v57;
  void *v58;
  NSObject *v59;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  CFTypeID v75;
  CFTypeID v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  id v86;
  const char *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unint64_t v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  __SecIdentity *v110;
  SecPolicyRef BasicX509;
  SecPolicyRef v112;
  CFArrayRef v113;
  OSStatus v114;
  NSObject *v115;
  void *v116;
  id v117;
  const char *v118;
  void *v119;
  id v120;
  NSObject *v121;
  void *v122;
  id v123;
  const char *v124;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  uint64_t v134;
  void *v135;
  NSObject *v136;
  void *v137;
  id v138;
  const char *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  CFIndex v146;
  NSObject *v147;
  void *v148;
  void *v149;
  id v150;
  uint64_t v151;
  CFIndex CertificateCount;
  id v153;
  uint64_t v154;
  id obj;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  CFTypeRef result;
  int v161;
  CFTypeRef cf;
  SecCertificateRef certificateRef[2];
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[128];
  _BYTE trust[12];
  uint8_t buf[4];
  void *v170;
  __int16 v171;
  uint64_t v172;
  uint64_t v173;

  v1 = a1;
  v173 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v1;
  v2 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3D035C8, &unk_1E3D035E0, &unk_1E3D035F8, &unk_1E3D03610, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  objc_msgSend((id)v1, "eapSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedEAPTypes");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v156, v167, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v157;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v157 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
        {
          ne_log_obj();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v64 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v170 = v64;
            v171 = 2112;
            v172 = v10;
            v65 = v64;
            _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%@ invalid EAP type %@", buf, 0x16u);

          }
          goto LABEL_14;
        }
      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v156, v167, 16);
    }
    while (v7);
  }

  objc_msgSend((id)v1, "eapSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "supportedEAPTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "containsObject:", &unk_1E3D035C8))
  {

  }
  else
  {
    objc_msgSend((id)v1, "eapSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isTLSClientCertificateRequired");

    if (!v15)
      goto LABEL_42;
  }
  objc_msgSend((id)v1, "eapSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identityReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    v58 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v58;
    v56 = v58;
    v57 = "%@ identity not provided";
    goto LABEL_89;
  }
  objc_msgSend((id)v1, "eapSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientTrustChainReference");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0;
  objc_msgSend((id)v1, "eapSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identityReference");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_49;
  }
  objc_msgSend((id)v1, "eapSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identityReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (!v24)
  {
LABEL_49:
    ne_log_obj();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v107 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v107;
      v108 = v107;
      _os_log_error_impl(&dword_19BD16000, v59, OS_LOG_TYPE_ERROR, "%@ configuration with EAP-TLS type must have identity reference.", buf, 0xCu);

    }
    v30 = 0;
    goto LABEL_52;
  }
  v25 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend((id)v1, "eapSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identityReference");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0C9AE50];
  v29 = *MEMORY[0x1E0CD6C98];
  v154 = *MEMORY[0x1E0CD7028];
  obj = (id)*MEMORY[0x1E0CD70E0];
  objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x1E0CD70E0], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7028], *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98], 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (SecItemCopyMatching((CFDictionaryRef)v30, &result) || !result)
  {
    ne_log_obj();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v85 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v85;
      v86 = v85;
      v87 = "%@ failed to find the identity item in the keychain.";
LABEL_87:
      _os_log_error_impl(&dword_19BD16000, v59, OS_LOG_TYPE_ERROR, v87, buf, 0xCu);

    }
LABEL_52:

    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    v106 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v106;
    v56 = v106;
    v57 = "%@ invalid identity reference";
    goto LABEL_89;
  }
  v31 = CFGetTypeID(result);
  if (v31 != SecIdentityGetTypeID())
  {
    ne_log_obj();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v105 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v105;
      v86 = v105;
      v87 = "%@ failed to find valid identity item in the keychain.";
      goto LABEL_87;
    }
    goto LABEL_52;
  }
  if (v19)
    goto LABEL_23;
  v110 = (__SecIdentity *)result;
  certificateRef[0] = 0;
  *(_QWORD *)trust = 0;
  v161 = 0;
  BasicX509 = SecPolicyCreateBasicX509();
  if (BasicX509)
  {
    v112 = BasicX509;
    if (SecIdentityCopyCertificate(v110, certificateRef) || !certificateRef[0])
    {
      ne_log_obj();
      v115 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        goto LABEL_149;
      v129 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v129;
      v117 = v129;
      v118 = "%@ SecIdentityCopyCertificate() failed";
    }
    else
    {
      v113 = CFArrayCreate(0, (const void **)certificateRef, 1, MEMORY[0x1E0C9B378]);
      CFRelease(certificateRef[0]);
      if (v113)
      {
        v114 = SecTrustCreateWithCertificates(v113, v112, (SecTrustRef *)trust);
        CFRelease(v113);
        if (v114)
        {
          ne_log_obj();
          v115 = objc_claimAutoreleasedReturnValue();
          v2 = 0x1E0C99000;
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            goto LABEL_149;
          v116 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v170 = v116;
          v117 = v116;
          v118 = "%@ SecTrustCreateWithCertificates() failed";
        }
        else if (MEMORY[0x1A1ACE3D0](*(_QWORD *)trust, &v161))
        {
          ne_log_obj();
          v115 = objc_claimAutoreleasedReturnValue();
          v2 = 0x1E0C99000;
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            goto LABEL_149;
          v135 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v170 = v135;
          v117 = v135;
          v118 = "%@ SecTrustEvaluate() failed";
        }
        else
        {
          CertificateCount = SecTrustGetCertificateCount(*(SecTrustRef *)trust);
          if (CertificateCount > 1)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v28, *MEMORY[0x1E0CD7020], *MEMORY[0x1E0CD6CA0], v29, 0);
            v115 = objc_claimAutoreleasedReturnValue();
            v153 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v151 = *MEMORY[0x1E0CD70E8];
            v146 = 1;
            while (1)
            {
              cf = 0;
              -[NSObject setObject:forKeyedSubscript:](v115, "setObject:forKeyedSubscript:", SecTrustGetCertificateAtIndex(*(SecTrustRef *)trust, v146), v151);
              if (SecItemCopyMatching((CFDictionaryRef)v115, &cf))
                break;
              objc_msgSend(v153, "addObject:", cf);
              CFRelease(cf);
              if (CertificateCount == ++v146)
              {
                objc_msgSend((id)v1, "eapSettings");
                v147 = objc_claimAutoreleasedReturnValue();
                -[NSObject setClientTrustChainReference:](v147, "setClientTrustChainReference:", v153);
                goto LABEL_147;
              }
            }
            ne_log_obj();
            v147 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              v149 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v170 = v149;
              v150 = v149;
              _os_log_error_impl(&dword_19BD16000, v147, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching() failed", buf, 0xCu);

            }
LABEL_147:

            goto LABEL_148;
          }
          ne_log_obj();
          v115 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          {
LABEL_148:
            v2 = 0x1E0C99000;
LABEL_149:

            CFRelease(v112);
            if (*(_QWORD *)trust)
              CFRelease(*(CFTypeRef *)trust);
            goto LABEL_23;
          }
          v143 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v170 = v143;
          v117 = v143;
          v118 = "%@ failed to find the trust chain for the client certificate";
        }
      }
      else
      {
        ne_log_obj();
        v115 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          goto LABEL_149;
        v130 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v170 = v130;
        v117 = v130;
        v118 = "%@ failed to allocate certificate array";
      }
    }
    _os_log_error_impl(&dword_19BD16000, v115, OS_LOG_TYPE_ERROR, v118, buf, 0xCu);

    goto LABEL_148;
  }
  ne_log_obj();
  v128 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
  {
    v144 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v144;
    v145 = v144;
    _os_log_error_impl(&dword_19BD16000, v128, OS_LOG_TYPE_ERROR, "%@ SecPolicyCreateBasicX509 failed", buf, 0xCu);

  }
LABEL_23:
  if (result)
    CFRelease(result);

  if (!v19)
    goto LABEL_41;
  objc_msgSend((id)v1, "eapSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "clientTrustChainReference");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_101;
  }
  objc_msgSend((id)v1, "eapSettings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "clientTrustChainReference");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (!v36)
  {
LABEL_101:
    ne_log_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v119 = (void *)objc_opt_class();
      *(_DWORD *)trust = 138412290;
      *(_QWORD *)&trust[4] = v119;
      v120 = v119;
      _os_log_error_impl(&dword_19BD16000, v37, OS_LOG_TYPE_ERROR, "%@ invalid client trust chain", trust, 0xCu);

    }
LABEL_133:

    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    v141 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v141;
    v56 = v141;
    v57 = "%@ invalid client trust chain";
    goto LABEL_89;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v28, v154, *MEMORY[0x1E0CD6CA0], v29, 0);
  v37 = objc_claimAutoreleasedReturnValue();
  *(_OWORD *)certificateRef = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  objc_msgSend((id)v1, "eapSettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "clientTrustChainReference");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", certificateRef, buf, 16);
  if (!v40)
    goto LABEL_40;
  v41 = v40;
  v42 = *(_QWORD *)v164;
  while (2)
  {
    for (j = 0; j != v41; ++j)
    {
      if (*(_QWORD *)v164 != v42)
        objc_enumerationMutation(v39);
      v44 = (void *)*((_QWORD *)certificateRef[1] + j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v44, "length"))
        goto LABEL_132;
      cf = 0;
      -[NSObject setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v44, obj);
      if (SecItemCopyMatching((CFDictionaryRef)v37, &cf))
      {
        ne_log_obj();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        {
          v137 = (void *)objc_opt_class();
          *(_DWORD *)trust = 138412290;
          *(_QWORD *)&trust[4] = v137;
          v138 = v137;
          v139 = "%@ failed to find the certificate item in the keychain.";
          goto LABEL_152;
        }
LABEL_131:

LABEL_132:
        goto LABEL_133;
      }
      if (!cf)
      {
        ne_log_obj();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        {
          v140 = (void *)objc_opt_class();
          *(_DWORD *)trust = 138412290;
          *(_QWORD *)&trust[4] = v140;
          v138 = v140;
          v139 = "%@ found nil certificate item in the keychain.";
          goto LABEL_152;
        }
        goto LABEL_131;
      }
      v45 = CFGetTypeID(cf);
      TypeID = SecCertificateGetTypeID();
      CFRelease(cf);
      if (v45 != TypeID)
      {
        ne_log_obj();
        v136 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          goto LABEL_131;
        v148 = (void *)objc_opt_class();
        *(_DWORD *)trust = 138412290;
        *(_QWORD *)&trust[4] = v148;
        v138 = v148;
        v139 = "%@ failed to find valid certificate item in the keychain.";
LABEL_152:
        _os_log_error_impl(&dword_19BD16000, v136, OS_LOG_TYPE_ERROR, v139, trust, 0xCu);

        goto LABEL_131;
      }
    }
    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", certificateRef, buf, 16);
    if (v41)
      continue;
    break;
  }
LABEL_40:

  v2 = 0x1E0C99000;
LABEL_41:
  objc_msgSend((id)v1, "eapSettings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTlsClientCertificateRequired:", 1);

LABEL_42:
  objc_msgSend((id)v1, "eapSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trustedServerCertificateReferences");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "count");

  objc_msgSend((id)v1, "eapSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (!v50)
  {
    objc_msgSend(v51, "trustedServerNames");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");

    if (!v62)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      v63 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v63;
      v56 = v63;
      v57 = "%@ EAP settings must have either trusted server certificates or trusted server names configured.";
      goto LABEL_89;
    }
    goto LABEL_72;
  }
  objc_msgSend(v51, "trustedServerCertificateReferences");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");

  if (v54 < 0xB)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7028], *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98], 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)certificateRef = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    objc_msgSend((id)v1, "eapSettings");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "trustedServerCertificateReferences");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", certificateRef, buf, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v164;
      v72 = *MEMORY[0x1E0CD70E0];
LABEL_61:
      v73 = 0;
      while (1)
      {
        if (*(_QWORD *)v164 != v71)
          objc_enumerationMutation(v68);
        v74 = (void *)*((_QWORD *)certificateRef[1] + v73);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v74, "length"))
          break;
        cf = 0;
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v74, v72);
        if (SecItemCopyMatching((CFDictionaryRef)v66, &cf))
        {
          ne_log_obj();
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            v122 = (void *)objc_opt_class();
            *(_DWORD *)trust = 138412290;
            *(_QWORD *)&trust[4] = v122;
            v123 = v122;
            v124 = "%@ failed to find the certificate item in the keychain.";
            goto LABEL_136;
          }
LABEL_108:

          break;
        }
        if (!cf)
        {
          ne_log_obj();
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            v125 = (void *)objc_opt_class();
            *(_DWORD *)trust = 138412290;
            *(_QWORD *)&trust[4] = v125;
            v123 = v125;
            v124 = "%@ found nil certificate item in the keychain.";
            goto LABEL_136;
          }
          goto LABEL_108;
        }
        v75 = CFGetTypeID(cf);
        v76 = SecCertificateGetTypeID();
        CFRelease(cf);
        if (v75 != v76)
        {
          ne_log_obj();
          v121 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            goto LABEL_108;
          v142 = (void *)objc_opt_class();
          *(_DWORD *)trust = 138412290;
          *(_QWORD *)&trust[4] = v142;
          v123 = v142;
          v124 = "%@ failed to find valid certificate item in the keychain.";
LABEL_136:
          _os_log_error_impl(&dword_19BD16000, v121, OS_LOG_TYPE_ERROR, v124, trust, 0xCu);

          goto LABEL_108;
        }
        if (v70 == ++v73)
        {
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", certificateRef, buf, 16);
          if (v70)
            goto LABEL_61;
          goto LABEL_71;
        }
      }

      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      v126 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v170 = v126;
      v56 = v126;
      v57 = "%@ invalid trusted server certificate references";
      goto LABEL_89;
    }
LABEL_71:

    v2 = 0x1E0C99000uLL;
LABEL_72:
    objc_msgSend((id)v1, "eapSettings");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "supportedEAPTypes");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "containsObject:", &unk_1E3D035C8);

    if ((v79 & 1) != 0)
      goto LABEL_73;
    objc_msgSend((id)v1, "eapSettings");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "username");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "length"))
    {
      objc_msgSend((id)v1, "eapSettings");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "username");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "length");

      if (v92 < 0xFE)
      {
        objc_msgSend((id)v1, "eapSettings");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "password");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v94, "length"))
        {
          objc_msgSend((id)v1, "eapSettings");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "password");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "length");

          if (v97 < 0x41)
          {
            objc_msgSend((id)v1, "eapSettings");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "supportedEAPTypes");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "containsObject:", &unk_1E3D035E0);

            if (v100)
            {
              objc_msgSend(*(id *)(v2 + 3680), "setWithObjects:", &unk_1E3D03628, &unk_1E3D03640, &unk_1E3D03658, &unk_1E3D03670, &unk_1E3D03688, 0);
              v5 = objc_claimAutoreleasedReturnValue();
              v101 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend((id)v1, "eapSettings");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "numberWithInteger:", objc_msgSend(v102, "ttlsInnerAuthenticationType"));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = -[NSObject containsObject:](v5, "containsObject:", v103);

              if (!v104)
              {
                ne_log_obj();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  v131 = (void *)objc_opt_class();
                  v132 = v131;
                  objc_msgSend((id)v1, "eapSettings");
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  v134 = objc_msgSend(v133, "ttlsInnerAuthenticationType");
                  *(_DWORD *)buf = 138412546;
                  v170 = v131;
                  v171 = 2048;
                  v172 = v134;
                  _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%@ invalid EAP type %ld", buf, 0x16u);

                }
LABEL_14:

                goto LABEL_53;
              }

            }
LABEL_73:
            objc_msgSend(*(id *)(v2 + 3680), "setWithObjects:", &unk_1E3D03628, &unk_1E3D03640, &unk_1E3D03658, 0);
            v5 = objc_claimAutoreleasedReturnValue();
            v80 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)v1, "eapSettings");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "numberWithInteger:", objc_msgSend(v81, "preferredTLSVersion"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = -[NSObject containsObject:](v5, "containsObject:", v82);

            if ((v83 & 1) == 0)
            {
              objc_msgSend((id)v1, "eapSettings");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "setPreferredTLSVersion:", 2);

            }
            v1 = 1;
            goto LABEL_54;
          }
        }
        else
        {

        }
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_53;
        v127 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v170 = v127;
        v56 = v127;
        v57 = "%@ invalid password in EAP settings";
LABEL_89:
        _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, v57, buf, 0xCu);

        goto LABEL_53;
      }
    }
    else
    {

    }
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    v109 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v109;
    v56 = v109;
    v57 = "%@ invalid username in EAP settings";
    goto LABEL_89;
  }
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v55 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v170 = v55;
    v56 = v55;
    v57 = "%@ too many trusted server certificates";
    goto LABEL_89;
  }
LABEL_53:
  v1 = 0;
LABEL_54:

  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
